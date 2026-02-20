using System;
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
    public class RoomsLoadManager : MonoBehaviour
    {
        [SerializeField] [Tooltip("A map between room names and the prefabs to instantiate with their content")]
        private RoomMap[] rooms = null!;

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
        ///     The object used to know when the room changes.
        /// </summary>
        [Inject] internal IStoryChangeRoomNotifier StoryChangeRoomNotifier = null!;

        private void Start()
        {
            // create the _roomNamesToRoomPrefabs from the list rooms 
            _roomNamesToRoomPrefabs = new Dictionary<string, GameObject>();
            foreach (var roomMap in rooms)
            {
                if (_roomNamesToRoomPrefabs.ContainsKey(roomMap.roomName))
                {
                    Debug.LogWarning("Duplicate room name: " + roomMap.roomName);
                    continue;
                }

                _roomNamesToRoomPrefabs.Add(roomMap.roomName, roomMap.roomPrefab);
            }

            // hook to events
            StoryChangeRoomNotifier.currentRoomObservable.Subscribe(OnChangeRoom).AddTo(gameObject);
            StoryChangeRoomNotifier.roomNamesObservable.Subscribe(OnRoomNames).AddTo(gameObject);
        }

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

            // instantiate it as a child of this object, which this object's scope as it's scope parent
            using (LifetimeScope.EnqueueParent(Scope))
            {
                _currentRoom = Instantiate(newRoomPrefab, transform);
            }

            Logger.ZLogInformation($"Moved to {newRoomName}.");
        }

        /// <summary>
        ///     A map between a room name and its prefab.
        /// </summary>
        [Serializable]
        public class RoomMap
        {
            /// <summary>
            ///     Name of the room.
            /// </summary>
            public string roomName = null!;

            /// <summary>
            ///     Prefab to instantiate for the room.
            /// </summary>
            public GameObject roomPrefab = null!;
        }
    }
}