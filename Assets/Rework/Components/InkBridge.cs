using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Enumeration;
using System.Linq;
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
    public class InkBridge : ScriptableObjectSetupSupport, IStoryChangeRoomNotifier, IStoryChoicesSelector,
        IStoryLinear, IStoryChangeRoomContentsNotifier, IStoryStateSerializer, IStoryAudioSupport, IStoryGrimoire
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
        private ILogger<InkBridge> logger =>
            _logger ?? throw new InvalidOperationException(
                "Logger is not set, call SetUp before accessing the logger");

        /// <summary>
        ///     Start the story. This sets up the internal state and runs the first <see cref="Continue" />.
        /// </summary>
        /// <param name="newLogger">The logger to use to log information about the story.</param>
        /// <param name="saveDirPrefix">Prefix used for the save directories.</param>
        /// <param name="minimumTimeBetweenAutomaticSaves">The minimum time between automatic saves.</param>
        public void SetUp(ILogger<InkBridge> newLogger, string saveDirPrefix, TimeSpan minimumTimeBetweenAutomaticSaves)
        {
            _logger = newLogger;
            _saveDirPrefix = saveDirPrefix;
            _minimumTimeBetweenAutomaticSaves = minimumTimeBetweenAutomaticSaves;

            OnStartRoomLocation();

            if (inkAssetJson == null) throw new InvalidOperationException("inkAssetJson has not been set");
            _story = new Story(inkAssetJson.text);

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
                    logger.ZLogTrace($"Disabled log variables {disabledDebugVariables}");
            }
            else
            {
                logger.ZLogWarning($"No debug words set.");
            }
        }

        /// <summary>
        ///     Continue the Ink story.
        /// </summary>
        private void Continue()
        {
            logger.ZLogTrace($"Continuing the story.");
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
            logger.ZLogInformation($"Story text: {story.currentText.Trim()}");
            foreach (var choice in story.currentChoices) logger.ZLogInformation($"Story choice: {choice.text.Trim()}");

            // extract the tags
            var tags = MakeTags(story.currentTags);

            // allow the various subsystems to update their observables
            var actionsAfterUpdate = UpdateCurrentText(tags);
            UpdateRoom();
            UpdateCurrentChoices();
            UpdateAudio(tags);

            // in some cases, we must immediately process the next line (typically with @command lines)
            if (actionsAfterUpdate.saveIfNeeded) SaveIfNeeded().Forget();
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
        }

        /// <inheritdoc />
        protected override void GlobalCleanup()
        {
            CleanupRoomContents();
            CleanupLinearProgression();
            CleanupChoices();
            CleanupAudio();
            CleanupGrimoire();
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
            logger.ZLogTrace($"Player moving from {_currentRoomName} to {roomName}");

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
            logger.ZLogTrace($"Room contents changed (from variable {variableName})");

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
        ///     The backing subject for <see cref="roomContentsObservable" />.
        /// </summary>
        private ReplaySubject<IStoryChangeRoomContentsNotifier.ChangeRoomContentsInfo>? _roomContentsSubject;

        /// <inheritdoc />
        public Observable<IStoryChangeRoomContentsNotifier.ChangeRoomContentsInfo> roomContentsObservable =>
            _roomContentsSubject!.AsObservable();

        /// <summary>
        ///     Notify the listeners of a change in the room contents.
        /// </summary>
        /// <param name="reason">The reason why this notification is sent.</param>
        private void NotifyRoomContentsListener(
            IStoryChangeRoomContentsNotifier.RoomContentsChangeReason reason)
        {
            System.Diagnostics.Debug.Assert(_roomContents != null, nameof(_roomContents) + " != null");
            _roomContentsSubject!.OnNext(
                new IStoryChangeRoomContentsNotifier.ChangeRoomContentsInfo(reason, _roomContents.AsReadOnly()));
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

        private record struct ActionsAfterUpdate(bool @continue, bool saveIfNeeded);

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
            if (!currentText.StartsWith('@'))
            {
                _conversationInProgressSubject!.OnNext(true);
                _currentTextObservable!.OnNext(
                    new IStoryLinear.CurrentTextInfo(currentText, tags));
            }
            else if (currentText.StartsWith("@animation"))
            {
                // special handling: @animation are no longer used, skip them
                actionsAfterUpdate.@continue = true;
            }
            else if (currentText.StartsWith("@grimoire"))
            {
                UpdateCurrentTextGrimoire(currentText, tags);
            }
            else
            {
                // Lines starting with "@" have a special handling, and are never about dialogue
                _conversationInProgressSubject!.OnNext(false);

                // @interact is the moment we enter a room, and we try to save
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
        private static ICollection<Tag> MakeTags(List<string> currentTags)
        {
            return currentTags.Select(tag => new Tag(tag)).ToList();
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
                logger.ZLogError($"Could not find a choice with text {text}");
            }
            else
            {
                // found it: pick it!
                logger.ZLogTrace($"Picking choice with text {text}");
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
                logger.ZLogInformation($"Loading save file {descriptor}.");
                var jsonPath = GetInkStoryStateFileAbsolutePath(descriptor);
                _minimumNextSaveTime = DateTime.UtcNow + _minimumTimeBetweenAutomaticSaves;
                var json = await File.ReadAllTextAsync(jsonPath);
                story.state.LoadJson(json);
                logger.ZLogInformation($"Save file {descriptor} loaded.");
                LogAndNotifyCurrentState();
            }
            else
            {
                // otherwise, just reset and continue to trigger a new story
                story.ResetState();
                _minimumNextSaveTime = DateTime.UtcNow; // will immediately produce a save file at the story start
                logger.ZLogInformation($"New story started.");
                Continue();
            }

            logger.ZLogTrace($"next automatic after {_minimumNextSaveTime}");
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
                    logger.ZLogError($"Error while parsing save data from file {jsonPath}");
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
        /// <returns>The file system enumerable.</returns>
        private FileSystemEnumerable<T> GetSaveFileSystemEnumerable<T>(FileSystemEnumerable<T>.FindTransform transform)
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

            // get only the directories matching _saveDirPrefix
            bool ShouldIncludePredicate(ref FileSystemEntry entry)
            {
                return entry.FileName.StartsWith(_saveDirPrefix, StringComparison.InvariantCultureIgnoreCase);
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

            logger.ZLogInformation(
                $"Currently {now:G}, should not save before {_minimumNextSaveTime:G}, so we're saving.");

            // sanity checks and state updates
            if (_currentRoomName == null)
                throw new InvalidOperationException("Trying to save, but _currentRoomName hasn't a value yet");

            _minimumNextSaveTime = now + _minimumTimeBetweenAutomaticSaves;

            var mySaveNumber = GetSaveFileSystemEnumerable(GetFileSystemEntryNumber)
                .DefaultIfEmpty(0)
                .Max() + 1;
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
                logger.ZLogInformation($"Save performed in {directoryName}.");
            }
            catch (Exception)
            {
                logger.ZLogError($"Save failed, trying to roll-back partial data if necessary.");
                try
                {
                    // if something goes wrong, try to remove potential partial save data
                    if (Directory.Exists(directoryName)) Directory.Delete(directoryName, true);
                    logger.ZLogInformation($"Partial data rollback succeeded.");
                }
                catch (Exception e)
                {
                    logger.ZLogError(e, $"Error while trying to recover from a failed save");
                }

                throw;
            }

            return;

            // find my save name
            int GetFileSystemEntryNumber(ref FileSystemEntry entry)
            {
                return int.Parse(entry.FileName[_saveDirPrefix.Length..]);
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

        [Tooltip("Name of the tag used to mark one of the left buttons as available.")] [SerializeField]
        private string leftButtonTagName = "leftButton";

        [Tooltip("Name of the tag used to mark an achievement.")] [SerializeField]
        private string achievementTagName = "achievement";

        [Tooltip("Name of the tag used for Franco's mission.")] [SerializeField]
        private string francoTagName = "franco";

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

        [SerializeField] [Tooltip("Value for the index bookmark tag")]
        private string indexBookmarkTagValue = "index";

        [SerializeField] [Tooltip("Value for the 'back to second level' bookmark tag")]
        private string secondLevelBookmarkTagValue = "secondLevel";

        [SerializeField] [Tooltip("Value for the 'go back' bookmark tag")]
        private string backBookmarkTagValue = "back";

        [SerializeField] [Tooltip("Value for the 'go forward' bookmark tag")]
        private string forwardBookmarkTagValue = "forward";

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

        private void SetupGrimoire()
        {
            _firstLevelGrimoirePageDescriptorsSubject = new Subject<IStoryGrimoire.FirstLevelGrimoirePageDescriptor>();
        }

        private void CleanupGrimoire()
        {
            _firstLevelGrimoirePageDescriptorsSubject?.Dispose();
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
        /// <exception cref="NotImplementedException"></exception>
        private void UpdateCurrentTextGrimoire(string currentText, ICollection<Tag> tags)
        {
            switch (currentText)
            {
                case "@grimoire1":
                    UpdateCurrentTextGrimoireFirstLevel(tags);
                    break;
                default:
                    logger.ZLogWarning($"Unknown grimoire tag {currentText}");
                    break;
            }
        }

        private void UpdateCurrentTextGrimoireFirstLevel(ICollection<Tag> tags)
        {
            // extract enabled left buttons from tags
            var enabledLeftButtonNames = from tag in tags where tag.category == leftButtonTagName select tag.value;

            // extract achievements from tags
            var achievements = new List<IStoryGrimoire.AchievementDescriptor>();
            foreach (var tag in tags.Where(tag => tag.category == achievementTagName))
            {
                if (tag.value == null)
                {
                    logger.ZLogWarning($"Found an achievement tag without arguments");
                    continue;
                }

                var parts = tag.value.Split(':');
                if (parts.Length != 3)
                    logger.ZLogWarning(
                        $"Achievement tags should have three parts (achievementName:currentValue:maxValue), but this one did not: '{tag.value}'");

                if (!int.TryParse(parts[1], out var amount))
                    logger.ZLogWarning(
                        $"Achievement value's second part should be the current value, an integer, but '{parts[1]}' was not.");

                if (!int.TryParse(parts[2], out var max))
                    logger.ZLogWarning(
                        $"Achievement value's third part should be the max value, an integer, but '{parts[2]}' was not.");

                achievements.Add(new IStoryGrimoire.AchievementDescriptor(parts[0], amount, max));
            }

            // extract Franco's mission from tags
            var francoMission = tags.FirstOrDefault(tag => tag.category == francoTagName)?.value ?? "";

            // extract current sigil from variables
            IStoryGrimoire.SigilDescriptor? sigilDescriptor = null;
            var story = GetStory();
            var currentSigil = (InkList)story.variablesState[currentSigilVariableName];
            if (currentSigil.Count > 1)
                logger.ZLogWarning(
                    $"Ink variable {currentSigilVariableName} should have at most one value, but it has {currentSigil.Count}: {currentSigil}");

            if (currentSigil.Count >= 1)
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

                    logger.ZLogError(
                        $"Could not find glyph {sigilName} in any of the sigils list, defaulting to 'fire'.");
                    glyphs[i] = ISettingsSigils.GlyphType.Fire;

                    continue;

                    bool HasValueInCurrentPosition(string[] variableNames)
                    {
                        return ((InkList)story.variablesState[variableNames[i]]).ContainsItemNamed(sigilName);
                    }
                }

                var numUsages = (int)story.variablesState[numSigilUsagesVariableName];
                if (numUsages is < 0 or > 2)
                    logger.ZLogError(
                        $"Number of usages found in variable {numSigilUsagesVariableName} is {numUsages}, whereas it should be 0, 1 or 2.");

                sigilDescriptor = new IStoryGrimoire.SigilDescriptor(glyphs[0], glyphs[1], glyphs[2],
                    numUsages == 0 ? threeUsagesText :
                    numUsages == 1 ? twoUsagesText :
                    oneUsageText
                );
            }

            // check choice nodes for first level navigation
            var choicesWithTags = story.currentChoices.Map(choice => (Choice: choice,
                Tags: MakeTags(choice.tags).Where(t => t.category == bookmarkTagCategory).ToList()));
            var indexChoice = choicesWithTags.FirstOrDefault(c => c.Tags.Any(t => t.value == indexBookmarkTagValue))
                .Choice;
            var secondLevelChoice = choicesWithTags
                .FirstOrDefault(c => c.Tags.Any(t => t.value == secondLevelBookmarkTagValue)).Choice;
            var backChoice = choicesWithTags.FirstOrDefault(c => c.Tags.Any(t => t.value == backBookmarkTagValue))
                .Choice;
            var forwardChoice = choicesWithTags.FirstOrDefault(c => c.Tags.Any(t => t.value == forwardBookmarkTagValue))
                .Choice;

            // emit the signal
            _firstLevelGrimoirePageDescriptorsSubject!.OnNext(new IStoryGrimoire.FirstLevelGrimoirePageDescriptor(
                false, enabledLeftButtonNames, achievements, francoMission, sigilDescriptor, indexChoice != null,
                secondLevelChoice?.text?.Trim(), backChoice?.text?.Trim(), forwardChoice?.text?.Trim()));
        }

        #endregion
    }
}