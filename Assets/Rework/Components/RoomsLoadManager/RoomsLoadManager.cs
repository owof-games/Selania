using System.Collections.Generic;
using Microsoft.Extensions.Logging;
using R3;
using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;
using VContainer.Unity;
using ZLogger;

namespace Selania.Rework.Components.RoomsLoadManager
{
    /// <summary>
    ///     A component that takes care of loading and unloading the rooms from prefabs according to the state of the ink
    ///     story.
    /// </summary>
    public class RoomsLoadManager : MonoBehaviour, IAutomaticEditorInject
    {
        /// <summary>
        ///     The currently instantiated room, or <c>null</c> if no room has been instantiated yet.
        /// </summary>
        private GameObject? _currentRoom;

        /// <summary>
        ///     A map between room names and the prefabs to instantiate for these rooms.
        /// </summary>
        private Dictionary<string, GameObject>? _roomNamesToRoomPrefabs;

        /// <summary>
        ///     The logger used by this component.
        /// </summary>
        [Inject] internal ILogger<RoomsLoadManager> Logger = null!;

        /// <summary>
        ///     The scope in which this object is created.
        /// </summary>
        [Inject] internal LifetimeScope Scope = null!;

        /// <summary>
        ///     Settings regarding the rooms.
        /// </summary>
        [Inject] internal ISettingsRooms SettingsRoom = null!;

        /// <summary>
        ///     The object used to know when the room changes.
        /// </summary>
        [Inject] internal IStoryChangeRoomNotifier StoryChangeRoomNotifier = null!;

        private void Start()
        {
            // create the _roomNamesToRoomPrefabs from the list rooms 
            _roomNamesToRoomPrefabs = new Dictionary<string, GameObject>();
            foreach (var roomMap in SettingsRoom.rooms)
            {
                if (_roomNamesToRoomPrefabs.ContainsKey(roomMap.name))
                {
                    Debug.LogWarning("Duplicate room name: " + roomMap.name);
                    continue;
                }

                _roomNamesToRoomPrefabs.Add(roomMap.name, roomMap.prefab);
            }

            // hook to events
            StoryChangeRoomNotifier.currentRoomObservable.Subscribe(OnChangeRoom).AddTo(gameObject);
            StoryChangeRoomNotifier.roomNamesObservable.Subscribe(OnRoomNames).AddTo(gameObject);
        }

        /// <summary>
        ///     Method invoked with the current list of room names.
        /// </summary>
        /// <param name="roomNamesInfo">Information about the room names.</param>
        private void OnRoomNames(IStoryChangeRoomNotifier.RoomNamesInfo roomNamesInfo)
        {
            // check that we have a prefab for each existing room
            System.Diagnostics.Debug.Assert(_roomNamesToRoomPrefabs != null,
                nameof(_roomNamesToRoomPrefabs) + " != null");
            List<string>? missingRooms = null;
            foreach (var roomName in roomNamesInfo.roomNames)
            {
                if (_roomNamesToRoomPrefabs.ContainsKey(roomName)) continue;
                missingRooms ??= new List<string>();
                missingRooms.Add(roomName);
            }

            if (missingRooms != null) Logger.ZLogWarning($"Missing rooms: {missingRooms}");
        }

        /// <summary>
        ///     Method invoked when the PG changes room.
        /// </summary>
        /// <param name="newRoomName">Name of the new room.</param>
        private void OnChangeRoom(string newRoomName)
        {
            Logger.ZLogTrace($"Moving to {newRoomName}.");

            // remove the current room if necessary
            if (_currentRoom != null) Destroy(_currentRoom);

            // find the new room to instantiate
            System.Diagnostics.Debug.Assert(_roomNamesToRoomPrefabs != null,
                nameof(_roomNamesToRoomPrefabs) + " != null");
            if (!_roomNamesToRoomPrefabs.TryGetValue(newRoomName, out var newRoomPrefab))
            {
                Logger.ZLogError($"Cannot find room with name {newRoomName}");
                return;
            }

            // instantiate it as a child of this object, with this object's scope as the parent of its scope
            using (LifetimeScope.EnqueueParent(Scope))
            {
                _currentRoom = Instantiate(newRoomPrefab, transform);
            }

            Logger.ZLogInformation($"Moved to {newRoomName}.");
        }
    }
}