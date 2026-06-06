using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.IO.Enumeration;
using System.Linq;
using System.Text;
using Alchemy.Inspector;
using Cysharp.Threading.Tasks;
using Ink.Runtime;
using Microsoft.Extensions.Logging;
using R3;
using Selania.Rework.Interfaces;
using UnityEngine;
using ZLogger;
using Path = System.IO.Path;
using Tag = Selania.Rework.Interfaces.Tag;

namespace Selania.Rework.Components
{
    /// <summary>
    ///     The object that wraps the Ink story and interprets its contents for the rest of the application.
    /// </summary>
    [CreateAssetMenu(fileName = "InkBridge", menuName = "Selania/Create Ink Bridge", order = 0)]
    public class InkBridge : ScriptableObjectSetupSupport,
        IStoryChangeRoomNotifier,
        IStoryChoicesSelector,
        IStoryLinear,
        IStoryChangeRoomContentsNotifier,
        IStoryStateSerializer,
        IStoryAudioSupport,
        IStoryGrimoire,
        IStoryInkInfo,
        IStoryGamerMode,
        IStoryCharacterRelationshipStatus,
        IStoryVariableValues,
        IStoryDebugSupport,
        IStoryRelationshipInfo,
        IStorySigilSupport
    {
        [Header("Ink Settings")] [SerializeField] [Tooltip("The JSON asset containing the story.")]
        private TextAsset? inkAssetJson;

        [Header("Variables Settings")] [SerializeField] [Tooltip("Debug variables to disable when the story starts.")]
        private string[]? debugWordsToDisable;

        [SerializeField] [Tooltip("Name of the list that defines the character.")]
        private string pgListName = "listCharacters";

        [SerializeField] [Tooltip("Name of the list item that represents the character.")]
        private string pgListItemName = "PG";

        [SerializeField] [Tooltip("Prefix of the list variables that contain the objects in the rooms")]
        private string roomListPrefix = "contents";

        /// <summary>
        ///     This object's logger, if <see cref="SetUp" /> has been called, or <c>null</c> otherwise.
        /// </summary>
        /// <seealso cref="SetUp" />
        private ILogger<InkBridge>? _logger;

        /// <summary>
        ///     The story object, if <see cref="SetUp" /> has been called, or <c>null</c> otherwise.
        /// </summary>
        /// <seealso cref="SetUp" />
        private Story? _story;

        /// <summary>
        ///     Property used to access <see cref="_logger" />, checking that the story has been correctly set up.
        /// </summary>
        /// <exception cref="InvalidOperationException"></exception>
        private ILogger<InkBridge> Logger =>
            _logger ?? throw new InvalidOperationException(
                "Logger is not set, call SetUp before accessing the logger");

        #region gamer mode

        /// <inheritdoc />
        public Observable<bool> GamerMode => GetVariableObservable<bool>(gamerModeVariableName);

        #endregion

        #region

        public Observable<int?> GetRelationshipLevelObservableFor(ISettingsDialogueBox settingsDialogueBox,
            string characterName)
        {
            // find the relationship variable for this character 
            var variable = settingsDialogueBox.characterRelationshipVariables
                .FirstOrDefault(data => data.Character == characterName).RelationshipVariable;

            // if no variable was found, or the variable is not set, return null, otherwise return the value from the ink story
            return string.IsNullOrEmpty(variable)
                ? Observable.Return((int?)null)
                : GetVariableObservable<int>(variable).Select(x => (int?)x);
        }

        #endregion

        #region common

        public Observable<T> GetVariableObservable<T>(string variableName)
        {
            return Observable.Create<T>(observer =>
            {
                var story = GetStory();

                if (!story.variablesState.Contains(variableName))
                {
                    Logger.ZLogError(
                        $"Tried to observable variable {variableName}, but it's not defined in the story.");
                    var error = new InvalidOperationException(
                        $"Tried to observable variable {variableName}, but it's not defined in the story.");
                    observer.OnCompleted(error);
                    return Disposable.Empty;
                }

                story.ObserveVariable(variableName, EmitValue);

                EmitValue(variableName, story.variablesState[variableName]);

                return Disposable.Create(() => story.RemoveVariableObserver(EmitValue));

                void EmitValue(string vName, object value)
                {
                    T result = default!;

                    switch (value)
                    {
                        case T tResult:
                            result = tResult;
                            break;
                        case int intValue when typeof(T) == typeof(float):
                            // there should be a better way, like in https://stackoverflow.com/a/7691918, but to avoid
                            // runtime reflection and the associated risks in compiled versions:
                            // (float) => convert int to float, this changes the internal representation
                            // (object) => box the float, otherwise we can't cast to a generic type
                            // (T) => finally cast to the desired type (which we _know_ it's float, so the boxing-unboxing
                            // dance is useless, but necessary for typing reasons)
                            result = (T)(object)(float)intValue;
                            break;
                        default:
                            Logger.ZLogError(
                                $"Expected values of {vName} to be of type {typeof(T).Name}, and instead is of type {value.GetType().Name}");
                            break;
                    }

                    observer.OnNext(result);
                }
            });
        }

        #endregion

        /// <summary>
        ///     Start the story. This sets up the internal state and runs the first <see cref="Continue" />.
        /// </summary>
        /// <param name="newLogger">The logger to use to log information about the story.</param>
        /// <param name="disableSaves">Whether to disable the save system.</param>
        /// <param name="saveDirPrefix">Prefix used for the save directories.</param>
        /// <param name="minimumTimeBetweenAutomaticSaves">The minimum time between automatic saves.</param>
        /// <param name="minimumNumberOfRetainedSaves">When automatic saves start to get deleted, this is the minimum amount of save files that are always kept.</param>
        /// <param name="minimumTimeSpanOfSavesRetained">When automatic saves start to get deleted, this is the minimum time span between now and the oldest save file.</param>
        public void SetUp(ILogger<InkBridge> newLogger, bool disableSaves, string saveDirPrefix,
            TimeSpan minimumTimeBetweenAutomaticSaves, int minimumNumberOfRetainedSaves,
            TimeSpan minimumTimeSpanOfSavesRetained)
        {
            _logger = newLogger;
            _disableSaves = disableSaves;
            _saveDirPrefix = saveDirPrefix;
            _minimumTimeBetweenAutomaticSaves = minimumTimeBetweenAutomaticSaves;
            _minimumNumberOfRetainedSaves = minimumNumberOfRetainedSaves;
            _minimumTimeSpanOfSavesRetained = minimumTimeSpanOfSavesRetained;

            Logger.ZLogInformation(
                $"Initializing ink bridge: _disableSaves = {_disableSaves}, save dir prefix = {_saveDirPrefix}, minimum time between automatic saves = {_minimumTimeBetweenAutomaticSaves}, _minimumNumberOfRetainedSaves={_minimumNumberOfRetainedSaves}, _minimumTimeSpanOfSavesRetained={_minimumTimeSpanOfSavesRetained}");

            OnStartRoomLocation();

            if (inkAssetJson == null) throw new InvalidOperationException("inkAssetJson has not been set");
            _story = new Story(inkAssetJson.text);

            OnStartDebugging();
            OnStartSigilSupport();

            DisableDebugVariables();
        }

        /// <summary>
        ///     Disable all debug variables in the ink script.
        /// </summary>
        private void DisableDebugVariables()
        {
            var story = GetStory();
            if (debugWordsToDisable != null)
            {
                List<string>? disabledDebugVariables = null;
                foreach (var debugVariableName in debugWordsToDisable)
                {
                    if (!(bool)story.variablesState[debugVariableName]) continue;
                    disabledDebugVariables ??= new List<string>();
                    disabledDebugVariables.Add(debugVariableName);
                    story.variablesState[debugVariableName] = false;
                }

                if (disabledDebugVariables != null)
                    Logger.ZLogTrace($"Disabled log variables {disabledDebugVariables}");
            }
            else
            {
                Logger.ZLogWarning($"No debug words set.");
            }
        }

        /// <summary>
        ///     Continue the Ink story.
        /// </summary>
        private void Continue()
        {
            Logger.ZLogTrace($"Continuing the story.");
            var story = GetStory();
            do
            {
                story.Continue();
            } while (string.IsNullOrWhiteSpace(story.currentText));

            LogAndNotifyCurrentState();
        }

        /// <summary>
        ///     Log the current state of the story and notifies listeners of it.
        /// </summary>
        private void LogAndNotifyCurrentState()
        {
            var story = GetStory();

            // log the current story step
            Logger.ZLogInformation($"Story text: {story.currentText}");
            foreach (var choice in story.currentChoices)
            {
                Logger.ZLogInformation($"  Story choice: {choice.text}");
                foreach (var tag in choice.tags ?? new List<string>())
                {
                    Logger.ZLogDebug($"    Tag: {tag}");
                }
            }

            // extract the tags
            var tags = MakeTags(story.currentTags);

            // allow the various subsystems to update their observables
            var actionsAfterUpdate = UpdateCurrentText(tags);
            UpdateRoom();
            if (!actionsAfterUpdate.skipChoices) UpdateCurrentChoices();

            UpdateAudio(tags);

            // in some cases, we must immediately process the next line (typically with @command lines)
            if (actionsAfterUpdate.saveIfNeeded && !_disableSaves) SaveIfNeeded().Forget();
            if (actionsAfterUpdate.@continue) Continue();
        }

        /// <summary>
        ///     Get the current story (if any).
        /// </summary>
        /// <returns>The current story.</returns>
        /// <exception cref="InvalidOperationException">If the story hasn't been started.</exception>
        private Story GetStory()
        {
            return _story == null
                ? throw new InvalidOperationException("Trying to obtain the story before SetUp() has been called")
                : _story;
        }

        /// <inheritdoc />
        protected override void GlobalSetup()
        {
            SetupRoomContents();
            SetupLinearProgression();
            SetupChoices();
            SetupAudio();
            SetupGrimoire();
            SetupSigilSupport();
        }

        /// <inheritdoc />
        protected override void GlobalCleanup()
        {
            CleanupSigilSupport();
            CleanupRoomContents();
            CleanupLinearProgression();
            CleanupChoices();
            CleanupAudio();
            CleanupGrimoire();
        }

        private static void DisposeAndSetToNull<T>(ref T? t) where T : class, IDisposable
        {
            t?.Dispose();
            t = null;
        }

        #region room location / contents

        /// <summary>
        ///     The name of the room where the PG is, if <see cref="SetUp" /> and <see cref="Continue" /> have been called at
        ///     least once, or <c>null</c> otherwise.
        /// </summary>
        private string? _currentRoomName;

        /// <summary>
        ///     The list item that represents the PG, if <see cref="SetUp" /> and <see cref="Continue" /> have been called at
        ///     least once, or <c>null</c> otherwise.
        /// </summary>
        private InkListItem? _pgListItem;

        /// <summary>
        ///     Name of all the list variables that hold the contents of a room, if <see cref="SetUp" /> and
        ///     <see cref="Continue" /> have been called at least once, or <c>null</c> otherwise.
        /// </summary>
        private List<string>? _roomVariableNames;

        /// <summary>
        ///     Name of all the current room content items, if <see cref="SetUp" /> and <see cref="Continue" /> have been
        ///     called at least once, or <c>null</c> otherwise.
        /// </summary>
        private List<string>? _roomContents;

        /// <summary>
        ///     Set up the ink bridge object
        /// </summary>
        private void OnStartRoomLocation()
        {
            // reset all state variables, so that they get initialized when started
            _currentRoomName = null;
            _roomContents = null;
            _pgListItem = null;
            _roomVariableNames = null;
        }

        /// <summary>
        ///     Update the room where the player is, if necessary, and notify the listeners.
        /// </summary>
        private void UpdateRoom()
        {
            var story = GetStory();

            // get the PG list item if we don't have it yet
            _pgListItem ??= GetPgListItem();

            // get the room variable names if we don't have them yet, and notify the listeners
            if (_roomVariableNames == null)
            {
                _roomVariableNames = GetRoomVariableNames();
                var roomNames = _roomVariableNames.Map(GetRoomNameFromRoomVariableName);
                _roomNamesSubject!.OnNext(new IStoryChangeRoomNotifier.RoomNamesInfo(roomNames));
            }

            // check if the PG didn't move at all
            if (_currentRoomName != null &&
                ((InkList)story.variablesState[roomListPrefix + _currentRoomName]).ContainsKey(_pgListItem.Value))
                // it's still in the current room: don't notify anyone
                return;

            // the player moved: look where it is
            var roomName = (
                from roomVariableName in _roomVariableNames
                let roomVariable = (InkList)story.variablesState[roomVariableName]
                where roomVariable.ContainsKey(_pgListItem.Value)
                select GetRoomNameFromRoomVariableName(roomVariableName)
            ).SingleOrDefault();
            Logger.ZLogTrace($"Player moving from {_currentRoomName} to {roomName}");

            // save the room
            _currentRoomName =
                roomName ?? throw new InvalidOperationException("Could not find the PG in any of the rooms");

            // notify the interested listeners that the current room has changed
            _currentRoomSubject!.OnNext(_currentRoomName);

            // update the room contents
            var currentRoomVariableName = $"{roomListPrefix}{_currentRoomName}";
            _roomContents = GetRoomContents(story.variablesState[currentRoomVariableName]);

            // notify the interested listeners that the current room contents have changed
            NotifyRoomContentsListener(IStoryChangeRoomContentsNotifier.RoomContentsChangeReason.CharacterMoved);

            // hook to the variable in order to be notified when the room contents change
            story.RemoveVariableObserver(RoomContentsVariableObserver);
            story.ObserveVariable(currentRoomVariableName, RoomContentsVariableObserver);
        }

        private void RoomContentsVariableObserver(string variableName, object newValue)
        {
            Logger.ZLogTrace($"Room contents changed (from variable {variableName})");

            // update the room contents
            _roomContents = GetRoomContents(newValue);

            // notify the interested listeners that the current room contents have changed
            NotifyRoomContentsListener(IStoryChangeRoomContentsNotifier.RoomContentsChangeReason.ContentsChanged);
        }

        /// <summary>
        ///     Extract the room contents from the corresponding ink variable.
        /// </summary>
        /// <param name="roomObject">The room object, which must be an <see cref="InkList" />.</param>
        /// <returns>The contents, as the list of the item names.</returns>
        private static List<string> GetRoomContents(object roomObject)
        {
            return ((InkList)roomObject)
                .Keys
                .Select(inkListItem => inkListItem.itemName)
                .ToList();
        }

        private InkListItem GetPgListItem()
        {
            var story = GetStory();

            if (!story.listDefinitions.TryListGetDefinition(pgListName, out var characterList))
                throw new InvalidOperationException($"Cannot find the list with name '{pgListName}'.");

            if (!characterList.ContainsItemWithName(pgListItemName))
                throw new InvalidOperationException(
                    $"Cannot find the list with name '{pgListItemName}' in list '{pgListName}'.");

            return characterList.items.Keys.Single(item => item.itemName == pgListItemName);
        }

        private List<string> GetRoomVariableNames()
        {
            var story = GetStory();
            var variablesState = story.variablesState;
            var roomVariableNames = variablesState
                .Where(variableName => variableName.StartsWith(roomListPrefix))
                .ToList();
            foreach (var roomVariableName in roomVariableNames)
                Debug.Assert(story.variablesState[roomVariableName] is InkList);
            return roomVariableNames;
        }

        /// <summary>
        ///     Get the name of the room from the name of the variable that holds its contents.
        /// </summary>
        /// <param name="roomVariableName">The name of the variable that holds the room's contents.</param>
        /// <returns>The name of the room.</returns>
        private string GetRoomNameFromRoomVariableName(string roomVariableName)
        {
            return roomVariableName[roomListPrefix.Length..];
        }

        private void CleanupRoomContents()
        {
            _currentRoomSubject?.Dispose();
            _currentRoomSubject = null;
            _roomNamesSubject?.Dispose();
            _roomNamesSubject = null;
            _roomContentsSubject?.Dispose();
            _roomContentsSubject = null;
        }

        private void SetupRoomContents()
        {
            _currentRoomSubject = new ReplaySubject<string>(1);
            _roomNamesSubject = new ReplaySubject<IStoryChangeRoomNotifier.RoomNamesInfo>(1);
            _roomContentsSubject = new ReplaySubject<IStoryChangeRoomContentsNotifier.ChangeRoomContentsInfo>(1);
        }

        /// <summary>
        ///     The subject behind <see cref="currentRoomObservable" />.
        /// </summary>
        private ReplaySubject<string>? _currentRoomSubject;

        /// <inheritdoc />
        public Observable<string> currentRoomObservable => _currentRoomSubject!.AsObservable();

        /// <summary>
        ///     The subject behind <see cref="roomNamesObservable" />.
        /// </summary>
        private ReplaySubject<IStoryChangeRoomNotifier.RoomNamesInfo>? _roomNamesSubject;

        /// <inheritdoc />
        public Observable<IStoryChangeRoomNotifier.RoomNamesInfo> roomNamesObservable =>
            _roomNamesSubject!.AsObservable();

        /// <summary>
        ///     The backing subject for <see cref="RoomContentsObservable" />.
        /// </summary>
        private ReplaySubject<IStoryChangeRoomContentsNotifier.ChangeRoomContentsInfo>? _roomContentsSubject;

        /// <inheritdoc />
        public Observable<IStoryChangeRoomContentsNotifier.ChangeRoomContentsInfo> RoomContentsObservable =>
            _roomContentsSubject!.AsObservable();

        /// <summary>
        ///     Notify the listeners of a change in the room contents.
        /// </summary>
        /// <param name="reason">The reason why this notification is sent.</param>
        private void NotifyRoomContentsListener(
            IStoryChangeRoomContentsNotifier.RoomContentsChangeReason reason)
        {
            System.Diagnostics.Debug.Assert(_roomContents != null, nameof(_roomContents) + " != null");
            System.Diagnostics.Debug.Assert(_currentRoomName != null, nameof(_currentRoomName) + " != null");
            _roomContentsSubject!.OnNext(
                new IStoryChangeRoomContentsNotifier.ChangeRoomContentsInfo(reason, _roomContents.AsReadOnly(),
                    _currentRoomName));
        }

        #endregion

        #region linear progression

        /// <summary>
        ///     The subject used to produce text.
        /// </summary>
        /// <seealso cref="currentTextObservable" />
        private ReplaySubject<IStoryLinear.CurrentTextInfo>? _currentTextObservable;

        /// <inheritdoc />
        public Observable<IStoryLinear.CurrentTextInfo> currentTextObservable => _currentTextObservable!.AsObservable();

        private void CleanupLinearProgression()
        {
            _currentTextObservable?.Dispose();
            _currentTextObservable = null;
            _conversationInProgressSubject?.Dispose();
            _conversationInProgressSubject = null;
        }

        private void SetupLinearProgression()
        {
            _currentTextObservable = new ReplaySubject<IStoryLinear.CurrentTextInfo>(1);
            _conversationInProgressSubject = new ReplaySubject<bool>(1);
        }

        private ReplaySubject<bool>? _conversationInProgressSubject;

        public Observable<bool> conversationInProgressObservable =>
            _conversationInProgressSubject!.DistinctUntilChanged();

        private record struct ActionsAfterUpdate(bool @continue, bool saveIfNeeded, bool skipChoices);

        /// <summary>
        ///     Update the listeners with the current text.
        /// </summary>
        /// <param name="tags">The list of tags computed.</param>
        /// <returns>Whether a Continue() should be automatically triggered after this line has been fully processed.</returns>
        private ActionsAfterUpdate UpdateCurrentText(ICollection<Tag> tags)
        {
            var actionsAfterUpdate = new ActionsAfterUpdate();
            var story = GetStory();
            var currentText = story.currentText.Trim();
            if (currentText == "")
            {
                actionsAfterUpdate.@continue = true;
            }
            else if (!currentText.StartsWith('@'))
            {
                _conversationInProgressSubject!.OnNext(true);
                _currentTextObservable!.OnNext(
                    new IStoryLinear.CurrentTextInfo(currentText));
            }
            else if (currentText.StartsWith("@animation"))
            {
                // special handling: @animation are no longer used, skip them
                actionsAfterUpdate.@continue = true;
            }
            else if (currentText.StartsWith("@grimoire"))
            {
                UpdateCurrentTextGrimoire(currentText, tags, ref actionsAfterUpdate);
                actionsAfterUpdate.skipChoices = true;
            }
            else if (currentText.StartsWith("@sprite"))
            {
                UpdateSprite(currentText);
                actionsAfterUpdate.@continue = true;
            }
            else if (currentText.StartsWith("@sigilInfluence"))
            {
                EmitSigilInfluence();
                actionsAfterUpdate.@continue = true;
            }
            else
            {
                // Lines starting with "@" have a special handling, and are never about dialogue
                _conversationInProgressSubject!.OnNext(false);

                // @interact is the moment we enter a room or finish a dialogue, and we try to save
                if (currentText == "@interact") actionsAfterUpdate.saveIfNeeded = true;
            }

            return actionsAfterUpdate;
        }

        /// <inheritdoc />
        public bool canContinue => GetStory().canContinue;

        /// <summary>
        ///     Create a collection of tags starting from the ink tags.
        /// </summary>
        /// <param name="currentTags">The ink tags.</param>
        /// <returns>A collection of tags.</returns>
        private static ICollection<Tag> MakeTags(IList<string>? currentTags)
        {
            return (currentTags ?? Array.Empty<string>()).Select(tag => new Tag(tag)).ToList();
        }

        /// <inheritdoc />
        void IStoryLinear.Continue()
        {
            Continue();
        }

        #endregion

        #region choices

        /// <summary>
        ///     This subject gets fed choices info when there are choices, and <c>null</c> when the line contains no
        ///     choices. Since it always remembers the last value (see <see cref="SetupChoices" /> for the construction
        ///     of this observable), it will emit choices info to the observers if the last line has choices, and
        ///     <c>null</c> otherwise. By filtering only the non-<c>null</c> values (see <see cref="choicesObservable" />)
        ///     we make sure that upon subscription choices info are immediately sent, but only if the last line has
        ///     choices.
        /// </summary>
        private ReplaySubject<IStoryChoicesSelector.ChoicesInfo?>? _choicesSubject;

        /// <inheritdoc />
        public Observable<IStoryChoicesSelector.ChoicesInfo> choicesObservable => _choicesSubject!
            .Where(choicesInfo => choicesInfo.HasValue)
            .Select(choicesInfo => choicesInfo!.Value);

        private void CleanupChoices()
        {
            _choicesSubject?.Dispose();
            _choicesSubject = null;
        }

        private void SetupChoices()
        {
            _choicesSubject = new ReplaySubject<IStoryChoicesSelector.ChoicesInfo?>(1);
        }

        /// <summary>
        ///     Update the listeners with the current list of choices.
        /// </summary>
        private void UpdateCurrentChoices()
        {
            var story = GetStory();

            // send "no choices" upon special instructions and when, well, there are no choices
            if (story.currentChoices.Count == 0 || story.currentText.Trim().StartsWith('@'))
            {
                _choicesSubject!.OnNext(null);
                return;
            }

            // there are choices! send them
            var choices = (
                from choice in story.currentChoices
                select new IStoryChoicesSelector.Choice(choice.text.Trim(), choice.index)
            ).ToList();
            _choicesSubject!.OnNext(new IStoryChoicesSelector.ChoicesInfo(choices));
        }

        /// <inheritdoc />
        public void PickChoiceWithText(string text)
        {
            // find the wanted choice
            var story = GetStory();
            var trimmedText = text.Trim();
            var choice = story.currentChoices.SingleOrDefault(choice => choice.text.Trim() == trimmedText);
            if (choice == null)
            {
                // could not find it
                Logger.ZLogError($"Could not find a choice with text {text}");
            }
            else
            {
                // found it: pick it!
                Logger.ZLogTrace($"Picking choice with text {text}");
                story.ChooseChoiceIndex(choice.index);
                Continue();
            }
        }

        /// <inheritdoc />
        public void PickChoiceWithIndex(int index)
        {
            var story = GetStory();
            story.ChooseChoiceIndex(index);
            Continue();
        }

        #endregion

        #region saves

        /// <summary>
        ///     Name of the JSON file inside the save directory.
        /// </summary>
        private const string SaveFileJsonFileName = "savefile.json";

        /// <summary>
        ///     Name of the Ink story state, serialized as JSON, inside the save directory.
        /// </summary>
        private const string InkStoryStateJsonFileName = "ink.json";

        /// <summary>
        ///     The prefix of the directories containing save data.
        /// </summary>
        private string _saveDirPrefix = "save_dir_";

        /// <summary>
        ///     The minimum time between automatic saves.
        /// </summary>
        private TimeSpan _minimumTimeBetweenAutomaticSaves = TimeSpan.FromMinutes(5);

        /// <summary>
        ///     Timestamp after which it's required to serialize the save state again, as soon as a new room is entered.
        /// </summary>
        private DateTime _minimumNextSaveTime;

        /// <summary>
        ///     The class that gets serialized in the save file.
        /// </summary>
        [Serializable]
        private class SaveData
        {
            /// <summary>
            ///     See <see cref="IStoryStateSerializer.SaveState.Timestamp" />.
            /// </summary>
            public required long timestamp;

            /// <summary>
            ///     See <see cref="IStoryStateSerializer.SaveState.RoomInkName" />.
            /// </summary>
            public required string roomInkName;
        }

        /// <inheritdoc />
        public async UniTask StartStory(string? descriptor)
        {
            var story = GetStory();
            // load the save file only if one is provided
            if (descriptor != null)
            {
                Logger.ZLogInformation($"Loading save file {descriptor}.");
                var jsonPath = GetInkStoryStateFileAbsolutePath(descriptor);
                _minimumNextSaveTime = DateTime.UtcNow + _minimumTimeBetweenAutomaticSaves;
                var json = await File.ReadAllTextAsync(jsonPath);
                story.state.LoadJson(json);
                Logger.ZLogInformation($"Save file {descriptor} loaded.");
                LogAndNotifyCurrentState();
            }
            else
            {
                // otherwise, just reset and continue to trigger a new story
                story.ResetState();
                _minimumNextSaveTime = DateTime.UtcNow; // will immediately produce a save file at the story start
                Logger.ZLogInformation($"New story started.");
                Continue();
            }

            Logger.ZLogTrace($"next automatic after {_minimumNextSaveTime}");
        }

        /// <inheritdoc />
        public async IAsyncEnumerable<IStoryStateSerializer.SaveState> GetSaveStates()
        {
            // loop over all the directories matching the pattern for save directories, starting from the newest one
            var directories = GetSaveFileSystemEnumerable(GetFileSystemEntryFileName)
                .OrderByDescending(directoryName => directoryName);

            foreach (var descriptor in directories)
            {
                // read the data describing the save
                var jsonPath = GetSaveFileAbsolutePath(descriptor);
                var json = await File.ReadAllTextAsync(jsonPath);
                var saveData = JsonUtility.FromJson<SaveData>(json);
                if (saveData == null)
                {
                    Logger.ZLogError($"Error while parsing save data from file {jsonPath}");
                    continue;
                }

                // map it to save states
                yield return new IStoryStateSerializer.SaveState(descriptor, saveData.roomInkName,
                    new DateTime(saveData.timestamp, DateTimeKind.Utc));
            }

            yield break;

            static string GetFileSystemEntryFileName(ref FileSystemEntry entry)
            {
                return entry.FileName.ToString();
            }
        }

        /// <summary>
        ///     Get the absolute path of the save directory.
        /// </summary>
        /// <param name="descriptor">Descriptor of the save.</param>
        /// <returns>The absolute path of the save directory.</returns>
        private static string GetSaveDirectoryAbsolutePath(string descriptor)
        {
            return Path.Join(Application.persistentDataPath, descriptor);
        }

        /// <summary>
        ///     Get the absolute path of the save file.
        /// </summary>
        /// <param name="descriptor">Descriptor of the save.</param>
        /// <returns>The absolute path of the save file.</returns>
        private static string GetSaveFileAbsolutePath(string descriptor)
        {
            return Path.Join(Application.persistentDataPath, descriptor, SaveFileJsonFileName);
        }

        /// <summary>
        ///     Get the absolute path of the ink story state JSON file.
        /// </summary>
        /// <param name="descriptor">Descriptor of the save.</param>
        /// <returns>The absolute path of the ink story state JSON file.</returns>
        private static string GetInkStoryStateFileAbsolutePath(string descriptor)
        {
            return Path.Join(Application.persistentDataPath, descriptor, InkStoryStateJsonFileName);
        }

        /// <summary>
        ///     Get a file system enumerable which filters only directories containing save date.
        /// </summary>
        /// <param name="transform">The transform to apply to the file system entries.</param>
        /// <param name="extraShouldIncludePredicate">An optional, extra predicate to filter out savefile system entries.</param>
        /// <returns>The file system enumerable.</returns>
        private FileSystemEnumerable<T> GetSaveFileSystemEnumerable<T>(FileSystemEnumerable<T>.FindTransform transform,
            FileSystemEnumerable<T>.FindPredicate? extraShouldIncludePredicate = null)
        {
            return new FileSystemEnumerable<T>(
                Application.persistentDataPath,
                transform,
                new EnumerationOptions
                {
                    MatchCasing = MatchCasing.CaseInsensitive
                }
            )
            {
                ShouldIncludePredicate = ShouldIncludePredicate
            };

            // get only the directories matching _saveDirPrefix (and the optional extraShouldIncludePredicate)
            bool ShouldIncludePredicate(ref FileSystemEntry entry)
            {
                var shouldInclude =
                    entry.FileName.StartsWith(_saveDirPrefix, StringComparison.InvariantCultureIgnoreCase);
                if (!shouldInclude) return false;
                return extraShouldIncludePredicate?.Invoke(ref entry) ?? shouldInclude;
            }
        }

        /// <summary>
        ///     Serialize the current save state if we surpassed the minimum time required between saves.
        /// </summary>
        private async UniTaskVoid SaveIfNeeded()
        {
            // check if a save should be performed
            var now = DateTime.UtcNow;
            if (now < _minimumNextSaveTime) return;

            Logger.ZLogInformation(
                $"Should wait until {_minimumNextSaveTime:G} to save, and it's currently {now:G}, so we're saving.");

            // sanity checks and state updates
            if (_currentRoomName == null)
                throw new InvalidOperationException("Trying to save, but _currentRoomName hasn't a value yet");

            // update the time for the next save time
            _minimumNextSaveTime = now + _minimumTimeBetweenAutomaticSaves;

            var (numSaveFiles, maxSaveNumber) = GetSaveFileSystemEnumerable(GetFileSystemEntryNumber)
                .Aggregate((0, 0), (accumulate, index) => (accumulate.Item1 + 1, Math.Max(accumulate.Item2, index)));
            var mySaveNumber = maxSaveNumber + 1;
            var descriptor = $"{_saveDirPrefix}{mySaveNumber:0000000}";

            // produce the serialized data
            var saveData = new SaveData
            {
                timestamp = now.Ticks,
                roomInkName = _currentRoomName
            };
            var jsonSaveData = JsonUtility.ToJson(saveData);
            var jsonInkStoryState = GetStory().state.ToJson();

            // save to filesystem
            var directoryName = GetSaveDirectoryAbsolutePath(descriptor);
            try
            {
                Directory.CreateDirectory(directoryName);
                await File.WriteAllTextAsync(GetSaveFileAbsolutePath(descriptor), jsonSaveData);
                await File.WriteAllTextAsync(GetInkStoryStateFileAbsolutePath(descriptor), jsonInkStoryState);
                numSaveFiles++;
                Logger.ZLogInformation($"Save performed in {directoryName}.");
            }
            catch (Exception)
            {
                Logger.ZLogError($"Save failed, trying to roll-back partial data if necessary.");
                try
                {
                    // if something goes wrong, try to remove potential partial save data
                    if (Directory.Exists(directoryName)) Directory.Delete(directoryName, true);
                    Logger.ZLogInformation($"Partial data rollback succeeded.");
                }
                catch (Exception e)
                {
                    Logger.ZLogError(e, $"Error while trying to recover from a failed save");
                }

                throw;
            }

            // check old save files to potentially remove them if possible
            if (numSaveFiles <= _minimumNumberOfRetainedSaves)
            {
                Logger.ZLogTrace(
                    $"Not removing any save directory because there are {numSaveFiles} save files, which is less or equal than the minimum number of save files {_minimumNumberOfRetainedSaves}");
                return;
            }

            foreach (var saveDirectoryPathToRemove in GetSaveFileSystemEnumerable(GetFileSystemEntryPath, CanBeRemoved))
                try
                {
                    Logger.ZLogInformation(
                        $"Removing {saveDirectoryPathToRemove} because we have more than {_minimumNumberOfRetainedSaves} and the directory was older than {_minimumTimeSpanOfSavesRetained}.");
                    Directory.Delete(saveDirectoryPathToRemove, true);
                    Logger.ZLogTrace(
                        $"Directory {saveDirectoryPathToRemove} removed.");
                    numSaveFiles--;
                    if (numSaveFiles > _minimumNumberOfRetainedSaves) continue;
                    Logger.ZLogInformation(
                        $"Reached {_minimumNumberOfRetainedSaves} saves, stop removing older saves.");
                    return;
                }
                catch (Exception e)
                {
                    Logger.ZLogError(e, $"Error while trying to remove save directory {saveDirectoryPathToRemove}");
                }

            return;

            // extract the save number
            int GetFileSystemEntryNumber(ref FileSystemEntry entry)
            {
                return int.Parse(entry.FileName[_saveDirPrefix.Length..]);
            }

            // extract the save directory path
            string GetFileSystemEntryPath(ref FileSystemEntry entry)
            {
                return entry.ToFullPath();
            }

            // check whether the directory path can be removed
            bool CanBeRemoved(ref FileSystemEntry entry)
            {
                // the "minimum number of saves" criteria is already checked in advance
                // we use the creation time as an acceptable value for the actual time of save. A user could technically
                // move the directory back and forth, thus changing its creation time, but then again this is savefile
                // tampering, not much we can do.
                return DateTimeOffset.UtcNow - entry.CreationTimeUtc > _minimumTimeSpanOfSavesRetained;
            }
        }

        #endregion

        #region audio

        private ReplaySubject<string> _soundtrackSubject = null!;

        public Observable<string> soundtrackObservable => _soundtrackSubject.DistinctUntilChanged();

        private ReplaySubject<string> _ambientSoundsSubject = null!;

        public Observable<string> ambientSoundsObservable => _ambientSoundsSubject.DistinctUntilChanged();

        private void SetupAudio()
        {
            _soundtrackSubject = new ReplaySubject<string>(1);
            _ambientSoundsSubject = new ReplaySubject<string>(1);
            _soundtrackSubject.OnNext("normal");
        }

        private void CleanupAudio()
        {
            _soundtrackSubject.Dispose();
            _ambientSoundsSubject.Dispose();
        }

        private void UpdateAudio(ICollection<Tag> tags)
        {
            EmitAudioSignal(tags, "ambientSounds", _ambientSoundsSubject);
            EmitAudioSignal(tags, "soundtrack", _soundtrackSubject);
        }

        private static void EmitAudioSignal(ICollection<Tag> tags, string category, ReplaySubject<string> subject)
        {
            var tag = tags.FirstOrDefault(tag => tag.category == category);
            if (tag is { value: not null }) subject.OnNext(tag.value);
        }

        #endregion

        #region grimoire

        [Title("Grimoire")]
        [Tooltip("Name of the Ink node to jump to when getting in the grimoire flow.")]
        [SerializeField]
        private string grimoireInkNodeName = "grimoire";

        // [Tooltip("Name of the tag used to mark one of the left buttons as available.")] [SerializeField]
        // private string leftButtonTagName = "leftButton";

        [Tooltip("Name of the tag used to mark an achievement.")] [SerializeField]
        private string achievementTagName = "achievement";

        [Tooltip("Name of the tag used for Franco's mission.")] [SerializeField]
        private string francoTagName = "franco";

        [Tooltip("Name of the variable containing whether we're in gamer or reader mode.")] [SerializeField]
        private string gamerModeVariableName = "settings_gamerMode";

        [Tooltip("Name of the variable containing the current sigil.")] [SerializeField]
        private string currentSigilVariableName = "glyph_actualActiveSigil";

        [Tooltip("Name of the variable containing the number of usages.")] [SerializeField]
        private string numSigilUsagesVariableName = "glyph_actualSigilUses";

        [Tooltip(
            "Name of the variables containing the sigils that have fire in, respectively, first, second, and third position.")]
        [SerializeField]
        private string[] fireSigilListsByPosition =
        {
            "glyph_firstFire", "glyph_secondFire", "glyph_thirdFire"
        };

        [Tooltip(
            "Name of the variables containing the sigils that have water in, respectively, first, second, and third position.")]
        [SerializeField]
        private string[] waterSigilListsByPosition =
        {
            "glyph_firstWater", "glyph_secondWater", "glyph_thirdWater"
        };

        [Tooltip(
            "Name of the variables containing the sigils that have earth in, respectively, first, second, and third position.")]
        [SerializeField]
        private string[] earthSigilListsByPosition =
        {
            "glyph_firstEarth", "glyph_secondEarth", "glyph_thirdEarth"
        };

        [Tooltip(
            "Name of the variables containing the sigils that have air in, respectively, first, second, and third position.")]
        [SerializeField]
        private string[] airSigilListsByPosition =
        {
            "glyph_firstAir", "glyph_secondAir", "glyph_thirdAir"
        };

        [Tooltip(
            "Name of the variables containing the sigils that have aether in, respectively, first, second, and third position.")]
        [SerializeField]
        private string[] aetherSigilListsByPosition =
        {
            "glyph_firstAether", "glyph_secondAether", "glyph_thirdAether"
        };

        [SerializeField] [Tooltip("Category for the bookmark tags")]
        private string bookmarkTagCategory = "bookmark";

        [SerializeField] [Tooltip("Category for the status tags (greenhouse)")]
        private string statusTagCategory = "status";

        [SerializeField] [Tooltip("Category for the enable tag (sigils)")]
        private string enabledTagCategory = "enabled";

        [SerializeField] [Tooltip("Category for the left page title (sigils, third level)")]
        private string leftPageTitleCategory = "leftPageTitle";

        [SerializeField] [Tooltip("Category for the left page description (sigils, third level)")]
        private string leftPageDescriptionCategory = "leftPageDescription";

        [SerializeField] [Tooltip("Category for the left page the first glyph (sigils, third level)")]
        private string leftPageGlyph1Category = "leftPageGlyph1";

        [SerializeField] [Tooltip("Category for the left page the second glyph (sigils, third level)")]
        private string leftPageGlyph2Category = "leftPageGlyph2";

        [SerializeField] [Tooltip("Category for the right page title (sigils, third level)")]
        private string rightPageTitleCategory = "rightPageTitle";

        [SerializeField] [Tooltip("Category for the right page description (sigils, third level)")]
        private string rightPageDescriptionCategory = "rightPageDescription";

        [SerializeField] [Tooltip("Category for the right page the first glyph (sigils, third level)")]
        private string rightPageGlyph1Category = "rightPageGlyph1";

        [SerializeField] [Tooltip("Category for the right page the second glyph (sigils, third level)")]
        private string rightPageGlyph2Category = "rightPageGlyph2";

        [SerializeField] [Tooltip("Category for the position (sigils, third level)")]
        private string positionCategory = "position";

        [SerializeField] [Tooltip("Value for the first left position (sigils, third level)")]
        private string left1PositionValue = "left1";

        [SerializeField] [Tooltip("Value for the second left position (sigils, third level)")]
        private string left2PositionValue = "left2";

        [SerializeField] [Tooltip("Value for the third left position (sigils, third level)")]
        private string left3PositionValue = "left3";

        [SerializeField] [Tooltip("Value for the first right position (sigils, third level)")]
        private string right1PositionValue = "right1";

        [SerializeField] [Tooltip("Value for the second right position (sigils, third level)")]
        private string right2PositionValue = "right2";

        [SerializeField] [Tooltip("Value for the third right position (sigils, third level)")]
        private string right3PositionValue = "right3";

        [SerializeField] [Tooltip("Category for the third level glyph (sigils, third level")]
        private string glyph3Category = "glyph3";

        [SerializeField] [Tooltip("Category for the first line of sigil text (sigils, third level)")]
        private string firstLineCategory = "firstLine";

        [SerializeField] [Tooltip("Category for the second line of sigil text (sigils, third level)")]
        private string secondLineCategory = "secondLine";

        [SerializeField] [Tooltip("Category for the third line of sigil text (sigils, third level)")]
        private string thirdLineCategory = "thirdLine";

        [SerializeField] [Tooltip("Value for the status of third level sigils when in default state")]
        private string thirdLevelStatusDefault = "default";

        [SerializeField] [Tooltip("Value for the status of third level sigils when selected")]
        private string thirdLevelStatusSelected = "selected";

        [SerializeField] [Tooltip("Value for the status of third level sigils when consumed")]
        private string thirdLevelStatusConsumed = "consumed";

        [SerializeField] [Tooltip("Value for the status of third level sigils when consumed")]
        private string thirdLevelStatusUnclickable = "unclickable";

        [SerializeField] [Tooltip("Value for the index bookmark tag")]
        private string indexBookmarkTagValue = "index";

        [SerializeField] [Tooltip("Value for the 'back to second level' bookmark tag")]
        private string secondLevelBookmarkTagValue = "secondLevel";

        [SerializeField] [Tooltip("Value for the 'previous' bookmark tag")]
        private string backBookmarkTagValue = "previous";

        [SerializeField] [Tooltip("Value for the 'next' bookmark tag")]
        private string forwardBookmarkTagValue = "next";

        [SerializeField] [Tooltip("Value for the 'close' bookmark tag")]
        private string closeBookmarkTagValue = "close";

        // will be localized
        [SerializeField] private string oneUsageText = "Un uso rimanente.";
        [SerializeField] private string twoUsagesText = "Due usi rimanenti.";
        [SerializeField] private string threeUsagesText = "Tre usi rimanenti.";

        /// <summary>
        ///     The subject used to produce info about the first level navigation.
        /// </summary>
        private Subject<IStoryGrimoire.FirstLevelGrimoirePageDescriptor>? _firstLevelGrimoirePageDescriptorsSubject;

        /// <inheritdoc />
        public Observable<IStoryGrimoire.FirstLevelGrimoirePageDescriptor> firstLevelGrimoirePageDescriptors =>
            _firstLevelGrimoirePageDescriptorsSubject?.AsObservable() ??
            throw new InvalidOperationException(
                "Cannot get the first level grimoire page descriptors before initialization");

        /// <summary>
        ///     The subject used to produce info about the first level navigation.
        /// </summary>
        private Subject<IStoryGrimoire.SecondLevelGreenhouseGrimoirePageDescriptor>?
            _secondLevelGrimoirePageDescriptorsSubject;

        /// <inheritdoc />
        public Observable<IStoryGrimoire.SecondLevelGreenhouseGrimoirePageDescriptor>
            secondLevelGreenhouseGrimoirePageDescriptors =>
            _secondLevelGrimoirePageDescriptorsSubject?.AsObservable() ??
            throw new InvalidOperationException(
                "Cannot get the second level greenhouse grimoire page descriptors before initialization");

        private Subject<IStoryGrimoire.SecondLevelSigilsGrimoirePageDescriptor>?
            _secondLevelSigilsGrimoirePageDescriptorsSubject;

        /// <inheritdoc />
        public Observable<IStoryGrimoire.SecondLevelSigilsGrimoirePageDescriptor>
            secondLevelSigilsGrimoirePageDescriptors =>
            _secondLevelSigilsGrimoirePageDescriptorsSubject?.AsObservable() ??
            throw new InvalidOperationException(
                "Cannot get the second level sigils grimoire page descriptors before initialization");

        private Subject<IStoryGrimoire.SecondLevelCharacterPageDescriptor>? _secondLevelCharacterPageDescriptorsSubject;

        public Observable<IStoryGrimoire.SecondLevelCharacterPageDescriptor> secondLevelCharacterPageDescriptors =>
            _secondLevelCharacterPageDescriptorsSubject?.AsObservable() ??
            throw new InvalidOperationException(
                "Cannot get the second level characters grimoire page descriptors before initialization");

        private Subject<IStoryGrimoire.SecondLevelFrancoPageDescriptor>? _secondLevelFrancoPageDescriptorsSubject;

        public Observable<IStoryGrimoire.SecondLevelFrancoPageDescriptor> secondLevelFrancoPageDescriptors =>
            _secondLevelFrancoPageDescriptorsSubject?.AsObservable() ??
            throw new InvalidOperationException(
                "Cannot get the second level Franco grimoire page descriptors before initialization");

        private Subject<IStoryGrimoire.SecondLevelRulesPageDescriptor>? _secondLevelRulesPageDescriptorsSubject;

        public Observable<IStoryGrimoire.SecondLevelRulesPageDescriptor> secondLevelRulesPageDescriptors =>
            _secondLevelRulesPageDescriptorsSubject?.AsObservable() ??
            throw new InvalidOperationException(
                "Cannot get the second level rules grimoire page descriptors before initialization");

        private Subject<IStoryGrimoire.SecondLevelAppendixPageDescriptor>? _secondLevelAppendixPageDescriptorsSubject;

        public Observable<IStoryGrimoire.SecondLevelAppendixPageDescriptor> secondLevelAppendixPageDescriptors =>
            _secondLevelAppendixPageDescriptorsSubject?.AsObservable() ??
            throw new InvalidOperationException(
                "Cannot get the second level appendix grimoire page descriptors before initialization");

        private Subject<IStoryGrimoire.ThirdLevelSigilsGrimoirePageDescriptor>?
            _thirdLevelSigilsGrimoirePageDescriptorsSubject;

        /// <inheritdoc />
        public Observable<IStoryGrimoire.ThirdLevelSigilsGrimoirePageDescriptor>
            thirdLevelSigilsGrimoirePageDescriptors =>
            _thirdLevelSigilsGrimoirePageDescriptorsSubject?.AsObservable() ?? throw new InvalidOperationException(
                "Cannot get the third level sigils grimoire page descriptors before initialization");

        private Subject<IStoryGrimoire.ThirdLevelGreenhouseGrimoirePageDescriptor>?
            _thirdLevelGreenhouseGrimoirePageDescriptorsSubject;

        /// <inheritdoc />
        public Observable<IStoryGrimoire.ThirdLevelGreenhouseGrimoirePageDescriptor>
            thirdLevelGreenhouseGrimoirePageDescriptors =>
            _thirdLevelGreenhouseGrimoirePageDescriptorsSubject?.AsObservable() ?? throw new InvalidOperationException(
                "Cannot get the third level greenhouse grimoire page descriptors before initialization");

        private Subject<IStoryGrimoire.ThirdLevelTextGrimoirePageDescriptor>?
            _thirdLevelTextGrimoirePageDescriptorSubject;

        public Observable<IStoryGrimoire.ThirdLevelTextGrimoirePageDescriptor> thirdLevelTextGrimoirePageDescriptor =>
            _thirdLevelTextGrimoirePageDescriptorSubject?.AsObservable() ?? throw new InvalidOperationException(
                "Cannot get the third level text grimoire page descriptors before initialization");

        private Subject<Unit>?
            _thirdLevelTextPreviousPageSubject;

        public Observable<Unit> thirdLevelTextPreviousPage =>
            _thirdLevelTextPreviousPageSubject?.AsObservable() ?? throw new InvalidOperationException(
                "Cannot get the third level text grimoire previous page before initialization");

        private Subject<Unit>?
            _thirdLevelTextNextPageSubject;

        public Observable<Unit> thirdLevelTextNextPage =>
            _thirdLevelTextNextPageSubject?.AsObservable() ?? throw new InvalidOperationException(
                "Cannot get the third level text grimoire next page before initialization");


        private void SetupGrimoire()
        {
            _closeSubject = new Subject<Unit>();
            _firstLevelGrimoirePageDescriptorsSubject = new Subject<IStoryGrimoire.FirstLevelGrimoirePageDescriptor>();
            _secondLevelGrimoirePageDescriptorsSubject =
                new Subject<IStoryGrimoire.SecondLevelGreenhouseGrimoirePageDescriptor>();
            _secondLevelSigilsGrimoirePageDescriptorsSubject =
                new Subject<IStoryGrimoire.SecondLevelSigilsGrimoirePageDescriptor>();
            _secondLevelCharacterPageDescriptorsSubject =
                new Subject<IStoryGrimoire.SecondLevelCharacterPageDescriptor>();
            _secondLevelFrancoPageDescriptorsSubject =
                new Subject<IStoryGrimoire.SecondLevelFrancoPageDescriptor>();
            _secondLevelRulesPageDescriptorsSubject = new Subject<IStoryGrimoire.SecondLevelRulesPageDescriptor>();
            _secondLevelAppendixPageDescriptorsSubject =
                new Subject<IStoryGrimoire.SecondLevelAppendixPageDescriptor>();
            _thirdLevelSigilsGrimoirePageDescriptorsSubject =
                new Subject<IStoryGrimoire.ThirdLevelSigilsGrimoirePageDescriptor>();
            _thirdLevelGreenhouseGrimoirePageDescriptorsSubject =
                new Subject<IStoryGrimoire.ThirdLevelGreenhouseGrimoirePageDescriptor>();
            _thirdLevelTextGrimoirePageDescriptorSubject =
                new Subject<IStoryGrimoire.ThirdLevelTextGrimoirePageDescriptor>();
            _thirdLevelTextPreviousPageSubject = new Subject<Unit>();
            _thirdLevelTextNextPageSubject = new Subject<Unit>();
        }

        private void CleanupGrimoire()
        {
            _thirdLevelTextNextPageSubject?.Dispose();
            _thirdLevelTextPreviousPageSubject?.Dispose();
            _thirdLevelTextGrimoirePageDescriptorSubject?.Dispose();
            _thirdLevelGreenhouseGrimoirePageDescriptorsSubject?.Dispose();
            _thirdLevelSigilsGrimoirePageDescriptorsSubject?.Dispose();
            _secondLevelAppendixPageDescriptorsSubject?.Dispose();
            _secondLevelRulesPageDescriptorsSubject?.Dispose();
            _secondLevelFrancoPageDescriptorsSubject?.Dispose();
            _secondLevelCharacterPageDescriptorsSubject?.Dispose();
            _secondLevelSigilsGrimoirePageDescriptorsSubject?.Dispose();
            _secondLevelGrimoirePageDescriptorsSubject?.Dispose();
            _firstLevelGrimoirePageDescriptorsSubject?.Dispose();
            _closeSubject?.Dispose();
        }

        public void SwitchToGrimoire()
        {
            var story = GetStory();
            story.SwitchFlow("Grimoire");
            story.ChoosePathString(grimoireInkNodeName);
            Continue();
        }

        public void SwitchFromGrimoire()
        {
            var story = GetStory();
            story.SwitchToDefaultFlow();
        }

        /// <summary>
        ///     Method called by all the "@grimoire..." tags
        /// </summary>
        /// <param name="currentText"></param>
        /// <param name="tags"></param>
        /// <param name="actionsAfterUpdate"></param>
        private void UpdateCurrentTextGrimoire(string currentText, ICollection<Tag> tags,
            ref ActionsAfterUpdate actionsAfterUpdate)
        {
            switch (currentText)
            {
                case "@grimoireClose":
                    EmitGrimoireClose();
                    break;
                case "@grimoire1":
                    EmitFirstLevelGrimoirePage(tags);
                    break;
                case "@grimoireGreenhouse":
                    EmitSecondLevelGreenhouseGrimoirePage();
                    break;
                case "@grimoireSigils":
                    EmitSecondLevelSigilsGrimoirePage();
                    break;
                case "@grimoireCharacter":
                    EmitSecondLevelCharacterGrimoirePage();
                    break;
                case "@grimoireFranco":
                    EmitSecondLevelFrancoGrimoirePage();
                    break;
                case "@grimoireRules":
                    EmitSecondLevelRulesGrimoirePage();
                    break;
                case "@grimoireAppendix":
                    EmitSecondLevelAppendixGrimoirePage();
                    break;
                case "@grimoireSigilPages":
                    EmitThirdLevelSigilsGrimoirePage();
                    break;
                case "@grimoireGreenhousePages":
                    EmitThirdLevelGreenhouseGrimoirePage();
                    break;
                case "@grimoireText":
                    EmitThirdLevelTextPage();
                    break;
                case "@grimoireTextPrevious":
                    EmitThirdLevelTextPreviousPage(ref actionsAfterUpdate);
                    break;
                case "@grimoireTextNext":
                    EmitThirdLevelTextNextPage(ref actionsAfterUpdate);
                    break;
                default:
                    Logger.ZLogWarning($"Unknown grimoire tag {currentText}");
                    break;
            }
        }

        private Subject<Unit>? _closeSubject;

        /// <inheritdoc/>
        public Observable<Unit> close => _closeSubject?.AsObservable() ?? throw new InvalidOperationException(
            "Cannot get the close observable before initialization");

        private void EmitGrimoireClose()
        {
            _closeSubject!.OnNext(Unit.Default);
        }

        private void EmitFirstLevelGrimoirePage(ICollection<Tag> tags)
        {
            // get gamer or reader mode mode
            var story = GetStory();
            var gamerModeVariable = story.variablesState[gamerModeVariableName];
            var isGamerMode = (bool)gamerModeVariable;

            // extract enabled left buttons from tags

            var enabledLeftButtonNames = story.currentChoices.Select(choice => choice.text);

            // extract achievements from tags
            var achievements = new List<IStoryGrimoire.AchievementDescriptor>();
            foreach (var tag in tags.Where(tag => tag.category == achievementTagName))
            {
                if (tag.value == null)
                {
                    Logger.ZLogWarning($"Found an achievement tag without arguments");
                    continue;
                }

                var parts = tag.value.Split(':');
                if (parts.Length != 3)
                    Logger.ZLogWarning(
                        $"Achievement tags should have three parts (achievementName:currentValue:maxValue), but this one did not: '{tag.value}'");

                if (!int.TryParse(parts[1], out var amount))
                    Logger.ZLogWarning(
                        $"Achievement value's second part should be the current value, an integer, but '{parts[1]}' was not.");

                if (!int.TryParse(parts[2], out var max))
                    Logger.ZLogWarning(
                        $"Achievement value's third part should be the max value, an integer, but '{parts[2]}' was not.");

                achievements.Add(new IStoryGrimoire.AchievementDescriptor(parts[0], amount, max));
            }

            // extract Franco's mission from tags
            var francoMission = tags.FirstOrDefault(tag => tag.category == francoTagName)?.value ?? "";

            // extract current sigil from variables
            IStoryGrimoire.SigilDescriptor? sigilDescriptor = null;
            var currentSigil = (InkList)story.variablesState[currentSigilVariableName];
            if (currentSigil.Count > 1)
                Logger.ZLogWarning(
                    $"Ink variable {currentSigilVariableName} should have at most one value, but it has {currentSigil.Count}: {currentSigil}");

            if (currentSigil.Count >= 1)
            {
                var glyphs = GetGlyphsFromSigilInkVariableValue(currentSigil, story);

                var numUsages = (int)story.variablesState[numSigilUsagesVariableName];
                if (numUsages is < 1 or > 3)
                    Logger.ZLogError(
                        $"Number of usages found in variable {numSigilUsagesVariableName} is {numUsages}, whereas it should be 0, 1 or 2.");

                sigilDescriptor = new IStoryGrimoire.SigilDescriptor(glyphs[0], glyphs[1], glyphs[2],
                    numUsages switch
                    {
                        3 => threeUsagesText,
                        2 => twoUsagesText,
                        _ => oneUsageText
                    }
                );
            }

            // analyze navigation
            GetNavigationChoices(story, out var indexChoice, out var secondLevelChoice, out var previousChoice,
                out var nextChoice, out var closeChoice);
            if (indexChoice != null)
            {
                Logger.ZLogWarning(
                    $"First level has a choice to get back to the first level ({indexChoice} #{bookmarkTagCategory}:{indexBookmarkTagValue}) that should not be present");
            }

            if (secondLevelChoice != null)
            {
                Logger.ZLogWarning(
                    $"First level has a choice to get back to the second level ({secondLevelChoice} #{bookmarkTagCategory}:{secondLevelBookmarkTagValue}) that should not be present");
            }

            if (previousChoice != null)
            {
                Logger.ZLogWarning(
                    $"First level has a choice to go to the previous page ({previousChoice} #{bookmarkTagCategory}:{backBookmarkTagValue}) that should not be present");
            }

            if (nextChoice != null)
            {
                Logger.ZLogWarning(
                    $"First level has a choice to go to the next page ({nextChoice} #{bookmarkTagCategory}:{forwardBookmarkTagValue}) that should not be present");
            }

            if (closeChoice != null)
            {
                Logger.ZLogWarning(
                    $"First level has a choice to close the grimoire ({closeChoice} #{bookmarkTagCategory}:{closeBookmarkTagValue}) that should not be present");
            }

            // emit the signal
            _firstLevelGrimoirePageDescriptorsSubject!.OnNext(new IStoryGrimoire.FirstLevelGrimoirePageDescriptor(
                isGamerMode, enabledLeftButtonNames, achievements, francoMission, sigilDescriptor));
        }

        private ISettingsSigils.GlyphType[] GetGlyphsFromSigilInkVariableValue(InkList currentSigil, Story story)
        {
            var sigilName = currentSigil.Keys.First().itemName;
            var glyphs = new ISettingsSigils.GlyphType[3];
            for (var i = 0; i < 3; i++)
            {
                if (HasValueInCurrentPosition(fireSigilListsByPosition))
                {
                    glyphs[i] = ISettingsSigils.GlyphType.Fire;
                    continue;
                }

                if (HasValueInCurrentPosition(airSigilListsByPosition))
                {
                    glyphs[i] = ISettingsSigils.GlyphType.Air;
                    continue;
                }

                if (HasValueInCurrentPosition(waterSigilListsByPosition))
                {
                    glyphs[i] = ISettingsSigils.GlyphType.Water;
                    continue;
                }

                if (HasValueInCurrentPosition(earthSigilListsByPosition))
                {
                    glyphs[i] = ISettingsSigils.GlyphType.Earth;
                    continue;
                }

                if (HasValueInCurrentPosition(aetherSigilListsByPosition))
                {
                    glyphs[i] = ISettingsSigils.GlyphType.Aether;
                    continue;
                }

                Logger.ZLogError(
                    $"Could not find glyph {sigilName} in any of the sigils list, defaulting to 'fire'.");
                glyphs[i] = ISettingsSigils.GlyphType.Fire;

                continue;

                bool HasValueInCurrentPosition(string[] variableNames)
                {
                    return ((InkList)story.variablesState[variableNames[i]]).ContainsItemNamed(sigilName);
                }
            }

            return glyphs;
        }

        /// <summary>
        /// Get the navigation choices of this node.
        /// </summary>
        /// <param name="story">The story to extract navigation choices from.</param>
        /// <param name="indexChoice">The choice to take to get back to the index, if any.</param>
        /// <param name="secondLevelChoice">The choice to take to get back to the second level, if any.</param>
        /// <param name="previousChoice">The choice to take to get to the previous page, if any.</param>
        /// <param name="nextChoice">The choice to take to get to the next page, if any.</param>
        /// <param name="closeChoice">The choice to take to exit the grimoire, if any.</param>
        private void GetNavigationChoices(Story story, out string? indexChoice, out string? secondLevelChoice,
            out string? previousChoice, out string? nextChoice, out string? closeChoice)
        {
            // check choice nodes for first level navigation
            var choicesWithTags = story.currentChoices.Map(choice => (Choice: choice,
                Tags: MakeTags(choice.tags).Where(t => t.category == bookmarkTagCategory).ToList()));
            indexChoice = choicesWithTags.FirstOrDefault(c => c.Tags.Any(t => t.value == indexBookmarkTagValue))
                .Choice?.text?.Trim();
            secondLevelChoice = choicesWithTags
                .FirstOrDefault(c => c.Tags.Any(t => t.value == secondLevelBookmarkTagValue)).Choice?.text?.Trim();
            previousChoice = choicesWithTags.FirstOrDefault(c => c.Tags.Any(t => t.value == backBookmarkTagValue))
                .Choice?.text?.Trim();
            nextChoice = choicesWithTags.FirstOrDefault(c => c.Tags.Any(t => t.value == forwardBookmarkTagValue))
                .Choice?.text?.Trim();
            closeChoice = choicesWithTags.FirstOrDefault(c => c.Tags.Any(t => t.value == closeBookmarkTagValue))
                .Choice?.text?.Trim();
        }

        private void EmitSecondLevelGreenhouseGrimoirePage()
        {
            // get the button descriptors
            var story = GetStory();
            var greenhouseButtonPlantDescriptors = story
                .currentChoices
                .Select(choice => (Choice: choice,
                    Tags: MakeTags(choice.tags).Where(t => t.category == statusTagCategory).ToList()))
                .Where(e => e.Tags.Any())
                .Select(e => new IStoryGrimoire.GreenhouseButtonPlantDescriptor(
                    e.Tags.Any(t => t.value == "owned"),
                    e.Choice.text.Trim()
                ));

            // navigation
            GetNavigationChoices(story, out var indexChoice, out var secondLevelChoice, out var previousChoice,
                out var nextChoice, out var closeChoice);
            if (indexChoice == null)
            {
                Logger.ZLogInformation($"Second level greenhouse has not a choice to get back to the first level.");
            }

            if (secondLevelChoice != null)
            {
                Logger.ZLogWarning(
                    $"Second level greenhouse has a choice to get back to the second level ({secondLevelChoice} #{bookmarkTagCategory}:{secondLevelBookmarkTagValue}) that should not be present");
            }

            if (previousChoice != null)
            {
                Logger.ZLogWarning(
                    $"Second level greenhouse has a choice to go to the previous page ({previousChoice} #{bookmarkTagCategory}:{backBookmarkTagValue}) that should not be present");
            }

            if (nextChoice != null)
            {
                Logger.ZLogWarning(
                    $"Second level greenhouse has a choice to go to the next page ({nextChoice} #{bookmarkTagCategory}:{forwardBookmarkTagValue}) that should not be present");
            }

            if (closeChoice != null)
            {
                Logger.ZLogInformation(
                    $"Second level greenhouse has a choice to close the grimoire ({closeChoice} #{bookmarkTagCategory}:{closeBookmarkTagValue}).");
            }

            // emit the signal
            _secondLevelGrimoirePageDescriptorsSubject!.OnNext(
                new IStoryGrimoire.SecondLevelGreenhouseGrimoirePageDescriptor(
                    indexChoice, closeChoice, greenhouseButtonPlantDescriptors));
        }

        private readonly (string, ISettingsSigils.GlyphType)[] _glyphsByName =
        {
            ("Air", ISettingsSigils.GlyphType.Air),
            ("Water", ISettingsSigils.GlyphType.Water),
            ("Earth", ISettingsSigils.GlyphType.Earth),
            ("Fire", ISettingsSigils.GlyphType.Fire),
            ("Aether", ISettingsSigils.GlyphType.Aether)
        };

        private void EmitSecondLevelSigilsGrimoirePage()
        {
            // parse the sigils choices
            var story = GetStory();
            var sigilsGroupDescriptors = story
                .currentChoices
                .Select(ParseChoice)
                .WhereNotNull();

            // navigation
            GetNavigationChoices(story, out var indexChoice, out var secondLevelChoice, out var previousChoice,
                out var nextChoice, out var closeChoice);
            if (indexChoice == null)
            {
                Logger.ZLogError($"Second level sigils has not a choice to get back to the first level!");
                return;
            }

            if (secondLevelChoice != null)
                Logger.ZLogWarning(
                    $"Second level sigils has a choice to get back to the second level ({secondLevelChoice} #{bookmarkTagCategory}:{secondLevelBookmarkTagValue}) that should not be present");

            if (previousChoice != null)
                Logger.ZLogWarning(
                    $"Second level sigils has a choice to go to the previous page ({previousChoice} #{bookmarkTagCategory}:{backBookmarkTagValue}) that should not be present");

            if (nextChoice != null)
                Logger.ZLogWarning(
                    $"Second level sigils has a choice to go to the next page ({nextChoice} #{bookmarkTagCategory}:{forwardBookmarkTagValue}) that should not be present");

            if (closeChoice != null)
                Logger.ZLogWarning(
                    $"Second level sigils has a choice to close the grimoire ({closeChoice} #{bookmarkTagCategory}:{closeBookmarkTagValue}) that should not be present");

            // emit the signal
            _secondLevelSigilsGrimoirePageDescriptorsSubject!.OnNext(
                new IStoryGrimoire.SecondLevelSigilsGrimoirePageDescriptor(
                    indexChoice, sigilsGroupDescriptors));

            return;

            IStoryGrimoire.SigilsGroupDescriptor? ParseChoice(Choice choice)
            {
                // try to find the first glyph at the beginning of the choice text
                var text = choice.text.Trim();
                foreach (var (name1, glyph1) in _glyphsByName)
                {
                    if (!text.StartsWith(name1)) continue;
                    // try to find the second glyph as the rest of the choice text
                    text = text[name1.Length..];
                    foreach (var (name2, glyph2) in _glyphsByName)
                    {
                        if (text != name2) continue;
                        // found! it's enabled iff there's an #enabled:true; if it's false or missing, it's not enabled
                        var enabled =
                            MakeTags(choice.tags).FirstOrDefault(t => t.category == enabledTagCategory)?.value ==
                            "true";
                        // return the result
                        return new IStoryGrimoire.SigilsGroupDescriptor(glyph1, glyph2, enabled);
                    }
                }

                // the search brought nothing
                return null;
            }
        }

        private void EmitSecondLevelCharacterGrimoirePage()
        {
            var story = GetStory();

            // parse the tags
            var tags = MakeTags(story.currentTags);
            var inkName = tags.FirstOrDefault(tag => tag.category == "character")?.value;
            if (inkName == null)
            {
                Logger.ZLogError($"No tag #character: found for @grimoireCharacter");
                inkName = "";
            }

            var characterName = tags.FirstOrDefault(tag => tag.category == "characterName")?.value;
            if (characterName == null)
            {
                Logger.ZLogError($"No tag #characterName: found for @grimoireCharacter");
                characterName = "";
            }

            var description = tags.FirstOrDefault(tag => tag.category == "characterDescription")?.value;
            if (description == null)
            {
                Logger.ZLogError($"No tag #characterDescription: found for @grimoireCharacter");
                description = "";
            }

            // parse the tasks
            var tasks = new List<string>();
            while (story.currentChoices.Count == 0) tasks.Add(story.Continue().Trim());

            // parse choices
            var choices = story.currentChoices.Where(choice => choice.tags == null || choice.tags.Count == 0)
                .Select(choice => choice.text)
                .ToList();

            // navigation
            GetNavigationChoices(story, out var indexChoice, out var secondLevelChoice, out var previousChoice,
                out var nextChoice, out var closeChoice);
            if (indexChoice == null)
            {
                Logger.ZLogError($"Second level character has not a choice to get back to the first level!");
                return;
            }

            if (secondLevelChoice != null)
                Logger.ZLogWarning(
                    $"Second level character has a choice to get back to the second level ({secondLevelChoice} #{bookmarkTagCategory}:{secondLevelBookmarkTagValue}) that should not be present");

            if (previousChoice != null)
                Logger.ZLogWarning(
                    $"Second level character has a choice to go to the previous page ({previousChoice} #{bookmarkTagCategory}:{backBookmarkTagValue}) that should not be present");

            if (nextChoice != null)
                Logger.ZLogWarning(
                    $"Second level character has a choice to go to the next page ({nextChoice} #{bookmarkTagCategory}:{forwardBookmarkTagValue}) that should not be present");

            if (closeChoice != null)
                Logger.ZLogWarning(
                    $"Second level character has a choice to close the grimoire ({closeChoice} #{bookmarkTagCategory}:{closeBookmarkTagValue}) that should not be present");

            // create the pentacle descriptor
            var myCharacterInfo = characterInfo.FirstOrDefault(info => info.listName == inkName);
            IStoryGrimoire.PentacleDescriptor pentacleDescriptor;
            if (myCharacterInfo == null)
            {
                Logger.ZLogError($"Cannot find a character info in the ink bridge with list name '{inkName}'.");
                pentacleDescriptor = new IStoryGrimoire.PentacleDescriptor(0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
            }
            else
            {
                // get the value of the various variables
                var prefix = myCharacterInfo.choicesValuesVariablePrefix;
                var values = new float[10];
                var i = 0;
                foreach (var suffix2 in new[] { "_aether", "_air", "_fire", "_earth", "_water" })
                {
                    foreach (var suffix1 in new[] { "_last", "" })
                    {
                        var variableName = prefix + suffix1 + suffix2;
                        var variableValue = story.variablesState[variableName];
                        float value;
                        switch (variableValue)
                        {
                            case int intValue:
                                value = intValue;
                                break;
                            case float floatValue:
                                value = floatValue;
                                break;
                            default:
                                Logger.ZLogError(
                                    $"choices value variable '{variableName}' should be of type int or float, and instead is of type {GetVariableType(variableValue)}");
                                value = 0;
                                break;
                        }

                        values[i++] = value;
                    }
                }

                // produce the pentacle descriptor
                pentacleDescriptor = new IStoryGrimoire.PentacleDescriptor(
                    values[0],
                    values[1],
                    values[2],
                    values[3],
                    values[4],
                    values[5],
                    values[6],
                    values[7],
                    values[8],
                    values[9]
                );
            }

            // create descriptor
            var descriptor = new IStoryGrimoire.SecondLevelCharacterPageDescriptor(
                inkName,
                characterName,
                description,
                string.Join('\n', tasks),
                choices,
                pentacleDescriptor,
                indexChoice);

            // emit
            _secondLevelCharacterPageDescriptorsSubject!.OnNext(descriptor);
            return;

            string GetVariableType(object? variableValue) =>
                variableValue == null ? "null" : variableValue.GetType().Name;
        }

        private void EmitSecondLevelFrancoGrimoirePage()
        {
            // get the current story
            var story = GetStory();

            // extract info from tags
            var tags = MakeTags(story.currentTags);
            var favour = tags.FirstOrDefault(tag => tag.category == "favour")?.value ?? "";
            var recipeTitle = tags.FirstOrDefault(tag => tag.category == "recipeTitle")?.value;
            if (string.IsNullOrWhiteSpace(recipeTitle)) recipeTitle = null;
            var recipeDescription = tags.FirstOrDefault(tag => tag.category == "recipeDescription")?.value ?? "";

            // extract info from following text
            var contentsList = new List<string>();
            while (story.canContinue) contentsList.Add(story.Continue().Trim());
            var contents = string.Join('\n', contentsList);

            // navigation
            GetNavigationChoices(story, out var indexChoice, out var secondLevelChoice, out var previousChoice,
                out var nextChoice, out var closeChoice);
            if (indexChoice == null)
            {
                Logger.ZLogError($"Second level Franco page has not a choice to get back to the first level!");
                return;
            }

            if (secondLevelChoice != null)
                Logger.ZLogWarning(
                    $"Second level Franco page has a choice to get back to the second level ({secondLevelChoice} #{bookmarkTagCategory}:{secondLevelBookmarkTagValue}) that should not be present");

            if (previousChoice != null)
                Logger.ZLogWarning(
                    $"Second level Franco page has a choice to go to the previous page ({previousChoice} #{bookmarkTagCategory}:{backBookmarkTagValue}) that should not be present");

            if (nextChoice != null)
                Logger.ZLogWarning(
                    $"Second level Franco page has a choice to go to the next page ({nextChoice} #{bookmarkTagCategory}:{forwardBookmarkTagValue}) that should not be present");

            if (closeChoice != null)
                Logger.ZLogWarning(
                    $"Second level Franco page has a choice to close the grimoire ({closeChoice} #{bookmarkTagCategory}:{closeBookmarkTagValue}) that should not be present");

            // create the descriptor
            var descriptor =
                new IStoryGrimoire.SecondLevelFrancoPageDescriptor(favour, recipeTitle, recipeDescription, contents,
                    indexChoice);

            // emit
            _secondLevelFrancoPageDescriptorsSubject!.OnNext(descriptor);
        }

        private void EmitSecondLevelRulesGrimoirePage()
        {
            var story = GetStory();

            // extract info from following text
            var contents = GetContentsUntilChoices(story);

            // navigation
            GetNavigationChoices(story, out var indexChoice, out var secondLevelChoice, out var previousChoice,
                out var nextChoice, out var closeChoice);
            if (indexChoice == null)
            {
                Logger.ZLogError($"Second level rules page has not a choice to get back to the first level!");
                return;
            }

            if (secondLevelChoice != null)
                Logger.ZLogWarning(
                    $"Second level rules page has a choice to get back to the second level ({secondLevelChoice} #{bookmarkTagCategory}:{secondLevelBookmarkTagValue}) that should not be present");

            if (previousChoice != null)
                Logger.ZLogWarning(
                    $"Second level rules page has a choice to go to the previous page ({previousChoice} #{bookmarkTagCategory}:{backBookmarkTagValue}) that should not be present");

            if (nextChoice != null)
                Logger.ZLogWarning(
                    $"Second level rules page has a choice to go to the next page ({nextChoice} #{bookmarkTagCategory}:{forwardBookmarkTagValue}) that should not be present");

            if (closeChoice != null)
                Logger.ZLogWarning(
                    $"Second level rules page has a choice to close the grimoire ({closeChoice} #{bookmarkTagCategory}:{closeBookmarkTagValue}) that should not be present");

            // create descriptor
            var descriptor = new IStoryGrimoire.SecondLevelRulesPageDescriptor(contents, indexChoice);

            // emit event
            _secondLevelRulesPageDescriptorsSubject?.OnNext(descriptor);
        }

        private void EmitSecondLevelAppendixGrimoirePage()
        {
            var story = GetStory();

            // parse choices
            var choices = story.currentChoices.Where(choice => choice.tags == null || choice.tags.Count == 0)
                .Select(choice => choice.text)
                .ToList();

            // navigation
            GetNavigationChoices(story, out var indexChoice, out var secondLevelChoice, out var previousChoice,
                out var nextChoice, out var closeChoice);
            if (indexChoice == null)
            {
                Logger.ZLogError($"Second level appendix has not a choice to get back to the first level!");
                return;
            }

            if (secondLevelChoice != null)
                Logger.ZLogWarning(
                    $"Second level appendix has a choice to get back to the second level ({secondLevelChoice} #{bookmarkTagCategory}:{secondLevelBookmarkTagValue}) that should not be present");

            if (previousChoice != null)
                Logger.ZLogWarning(
                    $"Second level appendix has a choice to go to the previous page ({previousChoice} #{bookmarkTagCategory}:{backBookmarkTagValue}) that should not be present");

            if (nextChoice != null)
                Logger.ZLogWarning(
                    $"Second level appendix has a choice to go to the next page ({nextChoice} #{bookmarkTagCategory}:{forwardBookmarkTagValue}) that should not be present");

            if (closeChoice != null)
                Logger.ZLogWarning(
                    $"Second level appendix has a choice to close the grimoire ({closeChoice} #{bookmarkTagCategory}:{closeBookmarkTagValue}) that should not be present");

            // produce descriptor
            var descriptor = new IStoryGrimoire.SecondLevelAppendixPageDescriptor(choices, indexChoice);

            // emit the signal
            _secondLevelAppendixPageDescriptorsSubject!.OnNext(descriptor);
        }

        private static string GetContentsUntilChoices(Story story)
        {
            var contentsList = new List<string>();
            while (story.canContinue)
            {
                var trimmedText = story.Continue().Trim();
                contentsList.Add(trimmedText == "_" ? "" : trimmedText);
            }

            var contents = string.Join('\n', contentsList);
            return contents;
        }

        private void EmitThirdLevelSigilsGrimoirePage()
        {
            var story = GetStory();

            // parse the headers
            var mainTags = MakeTags(story.currentTags);

            var leftPageTitle = mainTags.FirstOrDefault(t => t.category == leftPageTitleCategory)?.value ?? "";
            var leftPageDescription =
                mainTags.FirstOrDefault(t => t.category == leftPageDescriptionCategory)?.value ?? "";
            var leftGlyph1Name = mainTags.FirstOrDefault(t => t.category == leftPageGlyph1Category)?.value;
            if (leftGlyph1Name == null) Logger.ZLogError($"Missing {leftPageGlyph1Category} tag.");
            var leftGlyph1 =
                GetGlyphFromName(leftGlyph1Name ?? "air");
            var leftGlyph2Name = mainTags.FirstOrDefault(t => t.category == leftPageGlyph2Category)?.value;
            if (leftGlyph2Name == null) Logger.ZLogError($"Missing {leftPageGlyph2Category} tag.");
            var leftGlyph2 =
                GetGlyphFromName(leftGlyph2Name ?? "water");
            var leftHeader = new IStoryGrimoire.ThirdLevelSigilsGrimoirePageSideDescriptor(leftPageTitle == "",
                leftPageTitle, leftPageDescription, leftGlyph1, leftGlyph2);

            var rightPageTitle = mainTags.FirstOrDefault(t => t.category == rightPageTitleCategory)?.value ?? "";
            var rightPageDescription =
                mainTags.FirstOrDefault(t => t.category == rightPageDescriptionCategory)?.value ?? "";
            var rightGlyph1Name = mainTags.FirstOrDefault(t => t.category == rightPageGlyph1Category)?.value;
            if (rightGlyph1Name == null) Logger.ZLogError($"Missing {rightPageGlyph1Category} tag.");
            var rightGlyph1 =
                GetGlyphFromName(rightGlyph1Name ?? "air");
            var rightGlyph2Name = mainTags.FirstOrDefault(t => t.category == rightPageGlyph2Category)?.value;
            if (rightGlyph2Name == null) Logger.ZLogError($"Missing {rightPageGlyph2Category} tag.");
            var rightGlyph2 =
                GetGlyphFromName(rightGlyph2Name ?? "water");
            var rightHeader = new IStoryGrimoire.ThirdLevelSigilsGrimoirePageSideDescriptor(rightPageTitle == "",
                rightPageTitle, rightPageDescription, rightGlyph1, rightGlyph2);

            // parse the choices
            var positionsAndSigils = story.currentChoices.Map(choice =>
            {
                var tags = MakeTags(choice.tags);
                var text = choice.text.Trim();
                var position = tags.FirstOrDefault(tag => tag.category == positionCategory)?.value;
                var glyph3 =
                    GetGlyphFromName(tags.FirstOrDefault(tag => tag.category == glyph3Category)?.value ?? "fire");
                var firstLine = tags.FirstOrDefault(tag => tag.category == firstLineCategory)?.value ?? "";
                var secondLine = tags.FirstOrDefault(tag => tag.category == secondLineCategory)?.value ?? "";
                var thirdLine = tags.FirstOrDefault(tag => tag.category == thirdLineCategory)?.value ?? "";
                var status = tags.FirstOrDefault(tag => tag.category == statusTagCategory)?.value ??
                             thirdLevelStatusDefault;
                return (Position: position,
                    Sigil: new IStoryGrimoire.ThirdLevelSigil(false, text, glyph3, firstLine, secondLine, thirdLine,
                        status == thirdLevelStatusDefault ? IStoryGrimoire.ThirdLevelSigilStatus.Default :
                        status == thirdLevelStatusSelected ? IStoryGrimoire.ThirdLevelSigilStatus.Selected :
                        status == thirdLevelStatusConsumed ? IStoryGrimoire.ThirdLevelSigilStatus.Consumed :
                        status == thirdLevelStatusUnclickable ? IStoryGrimoire.ThirdLevelSigilStatus.Unclickable :
                        throw new InvalidOperationException(
                            $"Found a third-level sigil with invalid status '{status}', but should be either '{thirdLevelStatusDefault}' (default), '{thirdLevelStatusSelected}' or '{thirdLevelStatusConsumed}'.")
                    ));
            });
            var sigils = new[]
                {
                    left1PositionValue, left2PositionValue, left3PositionValue, right1PositionValue,
                    right2PositionValue, right3PositionValue
                }
                .Map(position =>
                {
                    var sigils = (from entry in positionsAndSigils
                            where entry.Position == position
                            select entry.Sigil)
                        .ToList();
                    switch (sigils.Count)
                    {
                        case > 1:
                            Logger.ZLogError($"Found more than one sigil at position {position}");
                            return sigils[0];
                        case 1:
                            return sigils[0];
                        default:
                            return new IStoryGrimoire.ThirdLevelSigil(true, "", ISettingsSigils.GlyphType.Aether,
                                "",
                                "",
                                "", IStoryGrimoire.ThirdLevelSigilStatus.Default);
                    }
                });

            // navigation
            GetNavigationChoices(story, out var indexChoice, out var secondLevelChoice, out var previousChoice,
                out var nextChoice, out var closeChoice);
            if (indexChoice == null)
            {
                Logger.ZLogError($"Third level sigils has not a choice to get back to the first level!");
                return;
            }

            if (secondLevelChoice == null)
            {
                Logger.ZLogWarning(
                    $"Third level sigils has not a choice to get back to the second level!");
                return;
            }

            if (closeChoice != null)
            {
                Logger.ZLogWarning(
                    $"Third level sigils has a close choice!");
                return;
            }

            // emit the message
            _thirdLevelSigilsGrimoirePageDescriptorsSubject!.OnNext(
                new IStoryGrimoire.ThirdLevelSigilsGrimoirePageDescriptor(
                    indexChoice, secondLevelChoice, previousChoice, nextChoice,
                    leftHeader, rightHeader, sigils[0], sigils[1], sigils[2], sigils[3], sigils[4], sigils[5]));

            return;

            ISettingsSigils.GlyphType GetGlyphFromName(string glyphName)
            {
                return glyphName.ToLower() switch
                {
                    "air" => ISettingsSigils.GlyphType.Air,
                    "aether" => ISettingsSigils.GlyphType.Aether,
                    "earth" => ISettingsSigils.GlyphType.Earth,
                    "fire" => ISettingsSigils.GlyphType.Fire,
                    "water" => ISettingsSigils.GlyphType.Water,
                    _ => throw new InvalidOperationException($"Unknown glyph name '{glyphName}'")
                };
            }
        }

        private void EmitThirdLevelGreenhouseGrimoirePage()
        {
            var story = GetStory();

            // extract left and right data from tags
            var mainTags = MakeTags(story.currentTags);
            var (leftTitle, leftPlant, leftStatus) = GetFromMainTags(true);
            var (rightTitle, rightPlant, rightStatus) = GetFromMainTags(false);

            // collect content lines
            var leftPageContents = new List<(bool IsSubtitle, string Text)>();
            var rightPageContents = new List<(bool IsSubtitle, string Text)>();

            while (story.canContinue)
            {
                var line = story.Continue();
                if (string.IsNullOrWhiteSpace(line)) continue;
                var subTags = MakeTags(story.currentTags);
                foreach (var subTag in subTags)
                    switch (subTag.category)
                    {
                        case "leftPageDescription":
                            leftPageContents.Add((false, line));
                            break;
                        case "leftPageSubtitle":
                            leftPageContents.Add((true, line));
                            break;
                        case "rightPageDescription":
                            rightPageContents.Add((false, line));
                            break;
                        case "rightPageSubtitle":
                            rightPageContents.Add((true, line));
                            break;
                        default:
                            Logger.ZLogWarning(
                                $"Unknown tag {subTag.category} associated to a third level greenhouse content");
                            break;
                    }
            }

            // find left and right choices, if any
            var leftInkChoice = GetFromChoicesTag("left", ref leftStatus);
            var rightInkChoice = GetFromChoicesTag("right", ref rightStatus);

            // navigation
            GetNavigationChoices(story, out var indexChoice, out var secondLevelChoice, out var previousChoice,
                out var nextChoice, out var closeChoice);
            if (indexChoice == null)
            {
                Logger.ZLogInformation($"Third level greenhouse has not a choice to get back to the first level.");
            }

            if (secondLevelChoice == null)
            {
                Logger.ZLogWarning(
                    $"Third level greenhouse has not a choice to get back to the second level!");
                return;
            }

            // emit the message
            _thirdLevelGreenhouseGrimoirePageDescriptorsSubject!.OnNext(
                new IStoryGrimoire.ThirdLevelGreenhouseGrimoirePageDescriptor(
                    indexChoice, secondLevelChoice, previousChoice, nextChoice, closeChoice,
                    new IStoryGrimoire.ThirdLevelGreenhousePageDescriptor(leftTitle, leftStatus, leftPlant,
                        leftInkChoice, leftPageContents),
                    new IStoryGrimoire.ThirdLevelGreenhousePageDescriptor(rightTitle, rightStatus, rightPlant,
                        rightInkChoice, rightPageContents)));

            return;

            // helper function to extract title, status and plant from tags
            (string, string, IStoryGrimoire.ThirdLevelGreenhouseStatus) GetFromMainTags(bool isLeft)
            {
                var prefix = isLeft ? "left" : "right";

                var titleTag = $"{prefix}PageTitle";
                var title = mainTags.FirstOrDefault(t => t.category == titleTag)?.value;
                string actualTitle;
                if (title == null)
                {
                    Logger.ZLogWarning($"Could not find tag {titleTag} for third level greenhouse page");
                    actualTitle = "";
                }
                else
                {
                    actualTitle = title;
                }

                var plantTag = $"{prefix}PagePlant";
                var plant = mainTags.FirstOrDefault(t => t.category == plantTag)?.value;
                string actualPlant;
                if (plant == null)
                {
                    Logger.ZLogWarning($"Could not find tag {plantTag} for third level greenhouse page");
                    actualPlant = "";
                }
                else
                {
                    actualPlant = plant;
                }

                var statusTag = $"{prefix}PageStatus";
                var status = mainTags.FirstOrDefault(t => t.category == statusTag)?.value;
                IStoryGrimoire.ThirdLevelGreenhouseStatus actualStatus;
                switch (status)
                {
                    case null:
                        Logger.ZLogWarning($"Could not find tag {statusTag} for third level greenhouse page");
                        actualStatus = IStoryGrimoire.ThirdLevelGreenhouseStatus.Hidden;
                        break;
                    case "hidden":
                        actualStatus = IStoryGrimoire.ThirdLevelGreenhouseStatus.Hidden;
                        break;
                    case "locked":
                        actualStatus = IStoryGrimoire.ThirdLevelGreenhouseStatus.Locked;
                        break;
                    case "consumed":
                        actualStatus = IStoryGrimoire.ThirdLevelGreenhouseStatus.Consumed;
                        break;
                    case "owned":
                        actualStatus = IStoryGrimoire.ThirdLevelGreenhouseStatus.Owned;
                        break;
                    case "active":
                        actualStatus = IStoryGrimoire.ThirdLevelGreenhouseStatus.Active;
                        break;
                    default:
                        Logger.ZLogWarning($"Could not recognize {statusTag} value {status}: forcing to 'hidden'");
                        actualStatus = IStoryGrimoire.ThirdLevelGreenhouseStatus.Hidden;
                        break;
                }

                return (actualTitle, actualPlant, actualStatus);
            }

            string? GetFromChoicesTag(string direction, ref IStoryGrimoire.ThirdLevelGreenhouseStatus status)
            {
                var choice = story.currentChoices.FirstOrDefault(choice =>
                    MakeTags(choice.tags).Any(t => t.category == "page" && t.value == direction));
                if (choice != null && status == IStoryGrimoire.ThirdLevelGreenhouseStatus.Owned)
                {
                    // since we have a choice, upgrade the status to "active"
                    status = IStoryGrimoire.ThirdLevelGreenhouseStatus.Active;
                }

                return choice?.text;
            }
        }

        private void EmitThirdLevelTextPage()
        {
            var story = GetStory();

            // extract info from tags
            var tags = MakeTags(story.currentTags);
            var style = tags.FirstOrDefault(t => t.category == "style")?.value ?? "character";
            var icon = tags.FirstOrDefault(t => t.category == "icon")?.value ?? "Chitarra";
            var title = tags.FirstOrDefault(t => t.category == "title")?.value ?? "Chitarra";
            var description = tags.FirstOrDefault(t => t.category == "description")?.value ??
                              "Una ragazza in cerca della sua melodia";

            // collect all textual content
            var contentsList = new List<string>();
            do
            {
                contentsList.Add(story.Continue().Trim());
            } while (story.canContinue);

            var contents = string.Join('\n', contentsList);

            // parse navigation choices
            GetNavigationChoices(story, out var indexChoice, out var secondLevelChoice, out var previousChoice,
                out var nextChoice, out var closeChoice);

            if (indexChoice == null)
            {
                Logger.ZLogError($"Third level text has not a choice to get back to the first level!");
                return;
            }

            if (previousChoice == null)
            {
                Logger.ZLogWarning(
                    $"Third level text has not a choice to get to the previous page!");
                return;
            }

            if (nextChoice == null)
            {
                Logger.ZLogWarning(
                    $"Third level text has not a choice to get to the next page!");
                return;
            }

            if (closeChoice != null)
            {
                Logger.ZLogWarning(
                    $"Third level text has a close choice!");
                return;
            }

            // emit the descriptor
            var descriptor = new IStoryGrimoire.ThirdLevelTextGrimoirePageDescriptor(
                style, icon, title, description, contents, indexChoice, secondLevelChoice, previousChoice, nextChoice);
            _thirdLevelTextGrimoirePageDescriptorSubject!.OnNext(descriptor);
        }

        private void EmitThirdLevelTextPreviousPage(ref ActionsAfterUpdate actionsAfterUpdate)
        {
            _thirdLevelTextPreviousPageSubject!.OnNext(Unit.Default);
            actionsAfterUpdate.@continue = true;
        }

        private void EmitThirdLevelTextNextPage(ref ActionsAfterUpdate actionsAfterUpdate)
        {
            _thirdLevelTextNextPageSubject!.OnNext(Unit.Default);
            actionsAfterUpdate.@continue = true;
        }

        #endregion

        #region ink

        [Header("ink variable levels")] [SerializeField]
        private string[] inkVariableLevels = null!;

        /// <inheritdoc />
        public Observable<int> GetInkLevelObservable(string inkVariableName)
        {
            return GetVariableObservable<InkList>(inkVariableName).Select(inkList =>
            {
                var currentItem = inkList.Keys.First().itemName;
                var index = inkVariableLevels.IndexOf(level => level == currentItem);
                if (index >= 0) return index;
                Logger.ZLogWarning($"Unknown ink level ${currentItem} from variable ${inkVariableName}");
                return (int?)null;
            }).Where(i => i.HasValue).Select(i => i!.Value);
        }

        #endregion

        #region relationship

        public int minRelationshipValue => -9;
        public int maxRelationshipValue => 9;

        /// <inheritdoc />
        public Observable<float> GetCharacterObservable(string characterName)
        {
            var info = characterInfo.FirstOrDefault(info => info.listName == characterName);
            return info == null
                ? throw new InvalidOperationException($"Cannot find a character in InkBridge with name {characterName}")
                : GetVariableObservable<float>(info.relationshipInkVariableName);
        }

        #endregion

        #region character info

        /*
         * NOTE WELL:
         * there is a huge overlap in functionality and data between InkBridge and SelaniaSettings. All the data should
         * be in just one place (settings, presumably). There should also be a way for the ink bridge to get injection:
         * probably by making it possible to use it as a builder of stories, and the build method is registered as
         * a factory method.
         */

        [Serializable]
        public class CharacterInfo
        {
            public string listName = null!;

            public string relationshipInkVariableName = null!;

            [Tooltip(
                "Prefix for the Ink variable containing the value (with suffix _aether, _earth, etc...) or the previous value (with suffix _last_aether, _last_earth, etc...).")]
            public string choicesValuesVariablePrefix = null!;
        }

        [Tooltip("Information about the characters")] [SerializeField]
        private CharacterInfo[] characterInfo = null!;

        #endregion

        #region grimoire enabled

        [SerializeField] [Tooltip("Name of the boolean Ink variable that is true if the grimoire is open.")]
        private string grimoireIsOpenVariableName = "grimoire_isEnabled";

        /// <inheritdoc />
        public Observable<bool> IsGrimoireEnabled => GetVariableObservable<bool>(grimoireIsOpenVariableName);

        #endregion

        #region dialogue sprites

        /// <summary>
        ///     The backing subject behind <see cref="imageObservable" />.
        /// </summary>
        private readonly Subject<string> _imageSubject = new();

        /// <inheritdoc />
        public Observable<string> imageObservable => _imageSubject.AsObservable();

        /// <summary>
        ///     Update <see cref="imageObservable" /> by sending the sprite name found in the given command text (if any).
        /// </summary>
        /// <param name="currentText">The current text.</param>
        private void UpdateSprite(string currentText)
        {
            // try to split the command in "@sprite" and the sprite name
            var parts = currentText.Split(':');
            if (parts is not { Length: 2 })
            {
                Logger.ZLogError(
                    $"Tag @sprite expected to be in the form '@sprite:spriteName', but instead was {currentText}");
                return;
            }

            // if successful, send the sprite name
            var spriteName = parts[1];
            _imageSubject.OnNext(spriteName);
        }

        #endregion

        #region debug

        private const string DebugFlowName = "DEBUG";

        private void OnStartDebugging()
        {
            // create the VariablesChanged observable
            var story = GetStory();
            VariablesChanged = Observable.FromEvent<VariablesState.VariableChanged>(
                action => (_, _) => action(),
                handler => story.variablesState.variableChangedEvent += handler,
                handler => story.variablesState.variableChangedEvent -= handler);
        }

        public IStoryDebugSupport.DebugKnotChoice[]? GetDebugKnotChoices(string debugKnot)
        {
            using var debugFlow = new DebugFlow(this);
            var story = debugFlow.Story;

            if (!CheckDebugKnot(debugKnot, story)) return null;

            GetToDebugKnotChoices(debugKnot, story);

            return story
                .currentChoices
                .Select(choice => new IStoryDebugSupport.DebugKnotChoice(debugKnot, choice.index, choice.text.Trim()))
                .ToArray();
        }

        public string PickDebugKnotChoice(IStoryDebugSupport.DebugKnotChoice debugKnotChoice)
        {
            var sb = new StringBuilder();

            using var debugFlow = new DebugFlow(this);
            var story = debugFlow.Story;

            GetToDebugKnotChoices(debugKnotChoice.DebugKnot, story);

            story.ChooseChoiceIndex(debugKnotChoice.ChoiceIndex);
            while (story.canContinue)
            {
                story.Continue();
                var line = story.currentText.Trim();
                if (line == "@") continue;
                sb.AppendLine(line);
            }

            return sb.ToString().Trim();
        }

        /// <inheritdoc />
        public Observable<Unit> VariablesChanged { get; private set; } = null!;

        public IEnumerable<(string, string)> GetVariableValues()
        {
            var story = GetStory();
            return story.variablesState.Select(variableName =>
            {
                var variable = story.variablesState[variableName];
                var result = variable switch
                {
                    bool boolValue => boolValue ? "true" : "false",
                    int intValue => intValue.ToString(),
                    float floatValue => floatValue.ToString(CultureInfo.InvariantCulture),
                    string stringValue => "\"" + stringValue + "\"",
                    Ink.Runtime.Path divertTargetValue => "-> " + divertTargetValue,
                    // VariablePointerValue variablePointerValue => "ref " + variablePointerValue.variableName,
                    InkList listValue => GetListValueRepresentation(listValue),
                    _ => "<unknown>"
                };

                return (variableName, result);
            });
        }

        private static string GetListValueRepresentation(InkList listValue)
        {
            var commonSource = listValue.Keys.Select(inkListItem => inkListItem.originName).Distinct().Count() == 1;
            return "(" + string.Join(", ",
                listValue.Keys.Select(inkListItem => commonSource ? inkListItem.itemName : inkListItem.fullName)) + ")";
        }

        private class DebugFlow : IDisposable
        {
            private readonly string _initialFlowName;

            public DebugFlow(InkBridge inkBridge)
            {
                Story = inkBridge.GetStory();

                _initialFlowName = Story.currentFlowName;
                Story.SwitchFlow(DebugFlowName);
            }

            public Story Story { get; }

            public void Dispose()
            {
                Story.SwitchFlow(_initialFlowName);
            }
        }

        private static void GetToDebugKnotChoices(string debugKnot, Story story)
        {
            story.ChoosePathString(debugKnot);
            while (story.canContinue) story.Continue();
        }

        private static bool CheckDebugKnot(string debugKnot, Story story)
        {
            return story.KnotContainerWithName(debugKnot) != null;
        }

        #endregion

        #region IStorySigilSupport

        /// <inheritdoc />
        public Observable<IStorySigilSupport.SigilDescriptor?> ActiveSigilInfo =>
            _publishedActiveSigilInfo ?? throw new InvalidOperationException("InkBridge isn't set up");

        /// <summary>
        ///     The subject behind <see cref="SigilInfluence" />.
        /// </summary>
        private Subject<Unit>? _activeSigilUsedSubject;

        /// <inheritdoc />
        public Observable<Unit> SigilInfluence =>
            _activeSigilUsedSubject?.AsObservable() ?? throw new InvalidOperationException("InkBridge isn't set up");

        /// <summary>
        ///     Emits a signal on the <see cref="_activeSigilUsedSubject" /> / <see cref="SigilInfluence" /> observables.
        /// </summary>
        /// <exception cref="InvalidOperationException">If the ink bridge hasn't been set-up.</exception>
        private void EmitSigilInfluence()
        {
            (_activeSigilUsedSubject ?? throw new InvalidOperationException("InkBridge isn't set up"))
                .OnNext(Unit.Default);
        }

        /// <summary>
        ///     A stream of sigil descriptors; each time a new story is started, this subject receives a new stream.
        /// </summary>
        private Subject<Observable<IStorySigilSupport.SigilDescriptor?>>? _sigilInfoStreamsSubject;

        /// <summary>
        ///     A disposable to invoke for disconnecting the replay publishing on the sigil descriptors.
        /// </summary>
        private IDisposable? _publishedActiveSigilInfoConnection;

        /// <summary>
        ///     The actual observable that produces the current sigil info, and replays the last one on connection.
        /// </summary>
        private ConnectableObservable<IStorySigilSupport.SigilDescriptor?>? _publishedActiveSigilInfo;

        private int _minimumNumberOfRetainedSaves;
        private TimeSpan _minimumTimeSpanOfSavesRetained;
        private bool _disableSaves;

        private void SetupSigilSupport()
        {
            // set up the currently used sigil and its usages
            _sigilInfoStreamsSubject = new Subject<Observable<IStorySigilSupport.SigilDescriptor?>>();
            _publishedActiveSigilInfo = _sigilInfoStreamsSubject
                .Switch()
                .Replay(1);
            _publishedActiveSigilInfoConnection = _publishedActiveSigilInfo.Connect();

            // set up the application of the active sigil
            _activeSigilUsedSubject = new Subject<Unit>();
        }

        private void OnStartSigilSupport()
        {
            var sigilDescriptorObservable = GetVariableObservable<InkList>(currentSigilVariableName)
                .Do(_ => Logger.ZLogTrace($"Received {currentSigilVariableName}"))
                .CombineLatest(
                    GetVariableObservable<int>(numSigilUsagesVariableName)
                        .Do(_ => Logger.ZLogTrace($"Received {numSigilUsagesVariableName}")), (i, j) => (i, j))
                .Select(data =>
                {
                    var (inkList, numUsages) = data;
                    if (inkList.Count == 0 || numUsages == 0)
                        return null;
                    var story = GetStory();
                    var glyphs = GetGlyphsFromSigilInkVariableValue(inkList, story);
                    return new IStorySigilSupport.SigilDescriptor(glyphs[0], glyphs[1], glyphs[2], numUsages);
                });
            _sigilInfoStreamsSubject!.OnNext(sigilDescriptorObservable);
        }

        private void CleanupSigilSupport()
        {
            // cleanup all subjects and subscriptions
            DisposeAndSetToNull(ref _activeSigilUsedSubject);
            DisposeAndSetToNull(ref _publishedActiveSigilInfoConnection);
            DisposeAndSetToNull(ref _sigilInfoStreamsSubject);
        }

        #endregion
    }
}