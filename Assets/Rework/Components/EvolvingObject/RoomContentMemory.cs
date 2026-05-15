using System.Collections.Generic;
using Selania.Rework.Interfaces;

namespace Selania.Rework.Components
{
    public class RoomContentMemory : IRoomContentMemory
    {
        private readonly Dictionary<string, Dictionary<string, int?>> _roomContents = new();

        /// <inheritdoc />
        public int? GetPreviousState(string roomName, string objectName)
        {
            if (_roomContents.TryGetValue(roomName, out var roomContents) &&
                roomContents.TryGetValue(objectName, out var previousState))
                return previousState;

            return null;
        }

        /// <inheritdoc />
        public IDictionary<string, int?> GetPreviousStates(string roomName)
        {
            return _roomContents.TryGetValue(roomName, out var roomContents)
                ? roomContents
                : new Dictionary<string, int?>();
        }

        /// <inheritdoc />
        public void SetState(string roomName, string objectName, int? state)
        {
            // create the room contents if the room wasn't known before
            if (!_roomContents.TryGetValue(roomName, out var roomContents))
            {
                roomContents = new Dictionary<string, int?>();
                _roomContents[roomName] = roomContents;
            }

            // set the state
            roomContents[objectName] = state;
        }
    }
}