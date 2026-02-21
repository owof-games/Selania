using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
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
        IStoryLinear, IStoryChangeRoomContentsNotifier, IStoryStateSerializer
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
        /// <seealso cref="SetUp"/>
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
        public void SetUp(ILogger<InkBridge> newLogger)
        {
            _logger = newLogger;

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

            logger.ZLogInformation($"Story text: {story.currentText.Trim()}");
            foreach (var choice in story.currentChoices) logger.ZLogInformation($"Story choice: {choice.text.Trim()}");

            // allow the various subsystems to update their observables
            UpdateRoom();
            UpdateCurrentText();
            UpdateCurrentChoices();
        }

        /// <summary>
        ///     Get the current story (if any).
        /// </summary>
        /// <returns>The current story.</returns>
        /// <exception cref="InvalidOperationException">If the story hasn't been started.</exception>
        private Story GetStory()
        {
            return _story == null
                ? throw new InvalidOperationException("Trying to obtain the story before Start() has been called")
                : _story;
        }

        /// <inheritdoc />
        protected override void GlobalSetup()
        {
            SetupRoomContents();
            SetupLinearProgression();
            SetupChoices();
        }

        /// <inheritdoc />
        protected override void GlobalCleanup()
        {
            CleanupRoomContents();
            CleanupLinearProgression();
            CleanupChoices();
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

        /// <summary>
        ///     Update the listeners with the current text.
        /// </summary>
        private void UpdateCurrentText()
        {
            var story = GetStory();
            var currentText = story.currentText.Trim();
            if (!currentText.StartsWith('@'))
            {
                _conversationInProgressSubject!.OnNext(true);
                _currentTextObservable!.OnNext(
                    new IStoryLinear.CurrentTextInfo(currentText, MakeTags(story.currentTags)));
            }
            else
            {
                // e.g.: @interact
                _conversationInProgressSubject!.OnNext(false);
            }
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
        private const string JsonFileName = "savefile.json";

        /// <summary>
        ///     The class that gets serialized in the save file.
        /// </summary>
        [Serializable]
        private class SaveData
        {
            /// <summary>
            ///     The JSON serialized by Ink for its story state
            /// </summary>
            public required string inkStoryState;
        }

        private static string GetSlotDescriptor(int slot)
        {
            return $"save_dir_slot_{slot}";
        }

        private static string GetPathFromDescriptor(string descriptor)
        {
            return Path.Join(Application.persistentDataPath, descriptor);
        }

        private static string GetJsonFilePathFromDescriptor(string descriptor)
        {
            return Path.Join(Application.persistentDataPath, descriptor, JsonFileName);
        }

        /// <inheritdoc />
        public void StartStory(string? descriptor)
        {
            var story = GetStory();
            // load the save file only if one is provided
            if (descriptor != null)
            {
                logger.ZLogInformation($"Loading save file {descriptor}.");
                var jsonPath = GetJsonFilePathFromDescriptor(descriptor);
                var json = File.ReadAllText(jsonPath);
                var saveData = JsonUtility.FromJson<SaveData>(json);
                story.state.LoadJson(saveData.inkStoryState);
                logger.ZLogInformation($"Save file {descriptor} loaded!");
            }
            else
            {
                // otherwise, just reset and continue to trigger a new story
                story.ResetState();
                Continue();
            }
        }

        /// <inheritdoc />
        public IList<string> GetAutomaticSaves()
        {
            return Directory.GetDirectories(Application.persistentDataPath, "save_dir_auto_*",
                SearchOption.TopDirectoryOnly);
        }

        /// <summary>
        ///     Create or overwrite a save in the given directory inside the application persistent path.
        /// </summary>
        /// <param name="dirName">The name of the directory where to put the save.</param>
        private void Save(string dirName)
        {
            logger.ZLogInformation($"Saving save file in directory {dirName}.");
            var story = GetStory();
            var inkStoryState = story.state.ToJson();
            var saveData = new SaveData
            {
                inkStoryState = inkStoryState
            };
            var json = JsonUtility.ToJson(saveData);
            Directory.CreateDirectory(GetPathFromDescriptor(dirName));
            var path = GetJsonFilePathFromDescriptor(dirName);
            File.WriteAllText(path, json);
            logger.ZLogInformation($"Save completed.");
        }

        /// <inheritdoc />
        public void Save(int slot)
        {
            Save(GetSlotDescriptor(slot));
        }

        /// <inheritdoc />
        public string? GetExplicitSave(int slot)
        {
            var descriptor = GetSlotDescriptor(slot);
            return Directory.Exists(GetPathFromDescriptor(descriptor)) ? descriptor : null;
        }

        /// <inheritdoc />
        public void DeleteSave(int slot)
        {
            var path = GetPathFromDescriptor(GetSlotDescriptor(slot));
            if (Directory.Exists(path)) Directory.Delete(path, true);
        }

        #endregion
    }
}