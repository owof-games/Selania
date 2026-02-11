using System;
using System.Collections.Generic;
using System.Linq;
using Ink.Runtime;
using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using UnityEngine;
using ZLogger;

namespace Selania.Rework.Components
{
    /// <summary>
    ///     The object that wraps the Ink story and interprets its contents for the rest of the application.
    /// </summary>
    [CreateAssetMenu(fileName = "InkBridge", menuName = "Selania/Create Ink Bridge", order = 0)]
    public class InkBridge : ScriptableObject, IStoryChangeRoomNotifier, IStoryChoiceSelector,
        IStoryChangeRoomContentsNotifier
    {
        [Header("Ink Settings")] [SerializeField] [Tooltip("The JSON asset containing the story.")]
        private TextAsset? inkAssetJson;

        [Header("Variables Settings")] [SerializeField] [Tooltip("Debug variables to disable when the story starts.")]
        private string[]? debugWordsToDisable;

        [SerializeField] [Tooltip("Name of the list that defined the character.")]
        private string pgListName = "listCharacters";

        [SerializeField] [Tooltip("Name of the list item that represents the character.")]
        private string pgListItemName = "PG";

        [SerializeField] [Tooltip("Prefix of the list variables that contain the objects in the rooms")]
        private string roomListPrefix = "contents";

        private ILogger<InkBridge>? _logger;

        /// <summary>
        ///     The story object, if <see cref="StartStory" /> has been called, or <c>null</c> otherwise.
        /// </summary>
        private Story? _story;

        private ILogger<InkBridge> logger => _logger ?? throw new InvalidOperationException("Logger is not set");

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

        public void StartStory(ILogger<InkBridge> newLogger)
        {
            _logger = newLogger;

            OnStartRoomLocation();

            if (inkAssetJson == null) throw new InvalidOperationException("inkAssetJson has not been set");
            _story = new Story(inkAssetJson.text);

            DisableDebugVariables();

            Continue();
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
        ///     Continue the Ink story, possibly sending notifications to the listeners of the various events.
        /// </summary>
        private void Continue()
        {
            logger.ZLogTrace($"Continuing the story.");
            GetStory().Continue();
            UpdateRoom();
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

        #region room location / contents

        /// <summary>
        ///     The name of the room where the PG is, if <see cref="StartStory" /> and <see cref="Continue" /> have been called at
        ///     least once, or <c>null</c> otherwise.
        /// </summary>
        private string? _currentRoomName;

        /// <summary>
        ///     The list item that represents the PG, if <see cref="StartStory" /> and <see cref="Continue" /> have been called at
        ///     least once, or <c>null</c> otherwise.
        /// </summary>
        private InkListItem? _pgListItem;

        /// <summary>
        ///     Name of all the list variables that hold the contents of a room, if <see cref="StartStory" /> and
        ///     <see cref="Continue" /> have been called at least once, or <c>null</c> otherwise.
        /// </summary>
        private List<string>? _roomVariableNames;

        /// <summary>
        ///     Name of all the current room content items, if <see cref="StartStory" /> and <see cref="Continue" /> have been
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
                NotifyRoomNamesListener();
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
            _changeRoomListeners.Invoke(_currentRoomName);

            // update the room contents
            var currentRoomVariableName = $"{roomListPrefix}{_currentRoomName}";
            _roomContents = GetRoomContents(story.variablesState[currentRoomVariableName]);

            // notify the interested listeners that the current room contents have changed
            NotifyRoomContentsListener(IStoryChangeRoomContentsNotifier.RoomContentsChangeReason.CharacterMoved);

            // hook to the variable in order to be notified when it changes
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

        /// <summary>
        ///     The container for all the listeners to the room change.
        /// </summary>
        private readonly ListenersContainer<string> _changeRoomListeners = new();

        /// <inheritdoc />
        public IDisposable AddChangeRoomListener(IStoryChangeRoomNotifier.ChangeRoomListener changeRoomListener)
        {
            var disposable = _changeRoomListeners.AddListener(x => changeRoomListener(x));
            if (_currentRoomName != null) changeRoomListener(_currentRoomName);
            return disposable;
        }

        /// <summary>
        ///     The container for all the listeners to the list of room names.
        /// </summary>
        private readonly ListenersContainer<IEnumerable<string>> _roomNamesListeners = new();

        /// <inheritdoc />
        public IDisposable AddRoomNamesListener(IStoryChangeRoomNotifier.RoomNamesListener roomNamesListener)
        {
            var disposable = _roomNamesListeners.AddListener(x => roomNamesListener(x));
            if (_roomVariableNames != null) NotifyRoomNamesListener(roomNamesListener);
            return disposable;
        }

        /// <summary>
        ///     Notify the listeners of room names of the room names.
        /// </summary>
        /// <param name="listener">
        ///     If <c>null</c>, all registered listeners are notified, otherwise only the passed
        ///     listener is notified.
        /// </param>
        private void NotifyRoomNamesListener(IStoryChangeRoomNotifier.RoomNamesListener? listener = null)
        {
            System.Diagnostics.Debug.Assert(_roomVariableNames != null, nameof(_roomVariableNames) + " != null");
            var roomNames = _roomVariableNames.Select(GetRoomNameFromRoomVariableName);
            if (listener != null)
                listener(roomNames);
            else
                _roomNamesListeners.Invoke(roomNames);
        }

        /// <summary>
        ///     The container for all the listeners to the room contents.
        /// </summary>
        private readonly
            ListenersContainer<IStoryChangeRoomContentsNotifier.RoomContentsChangeReason, IReadOnlyCollection<string>>
            _roomContentsListeners = new();

        /// <inheritdoc />
        public IDisposable AddChangeRoomContentsListener(
            IStoryChangeRoomContentsNotifier.ChangeRoomContentsListener roomContentsListener)
        {
            var disposable = _roomContentsListeners.AddListener((x, y) => roomContentsListener(x, y));
            if (_roomContents != null)
                NotifyRoomContentsListener(IStoryChangeRoomContentsNotifier.RoomContentsChangeReason.CharacterMoved,
                    roomContentsListener);

            return disposable;
        }

        /// <summary>
        ///     Notify the listeners of a change in the room contents.
        /// </summary>
        /// <param name="reason">The reason why this notification is sent.</param>
        /// <param name="listener">
        ///     If <c>null</c>, all registered listeners are notified, otherwise only the passed
        ///     listener is notified.
        /// </param>
        private void NotifyRoomContentsListener(
            IStoryChangeRoomContentsNotifier.RoomContentsChangeReason reason,
            IStoryChangeRoomContentsNotifier.ChangeRoomContentsListener? listener = null)
        {
            if (listener != null && _roomContents != null)
            {
                listener(reason, _roomContents);
            }
            else
            {
                System.Diagnostics.Debug.Assert(_roomContents != null, nameof(_roomContents) + " != null");
                _roomContentsListeners.Invoke(reason, _roomContents.AsReadOnly());
            }
        }

        #endregion
    }
}