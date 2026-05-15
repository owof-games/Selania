using System.Collections.Generic;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     An object used to remember the contents of a room and determine if an object was inside it or not the last time
    ///     it was entered.
    /// </summary>
    public interface IRoomContentMemory
    {
        /// <summary>
        ///     Get the previous state of an object in the room.
        /// </summary>
        /// <param name="roomName">Name of the room (any kind of unique identifier).</param>
        /// <param name="objectName">Name of the object to check the state of.</param>
        /// <returns>The previous state of the object in the room, or <c>null</c> if it was not present.</returns>
        int? GetPreviousState(string roomName, string objectName);

        /// <summary>
        ///     Get the previous state of all objects in this room.
        /// </summary>
        /// <param name="roomName">Name of the room (any kind of unique identifier).</param>
        /// <returns>
        ///     A map between object names and he previous state of the object in the room, or <c>null</c> if it was not
        ///     present.
        /// </returns>
        IDictionary<string, int?> GetPreviousStates(string roomName);

        /// <summary>
        ///     Set the object as currently present in the room.
        /// </summary>
        /// <param name="roomName">Name of the room (any kind of unique identifier).</param>
        /// <param name="objectName">Name of the object to set.</param>
        /// <param name="state">The state of the object in this moment, or <c>null</c> if the object is not present.</param>
        void SetState(string roomName, string objectName, int? state);
    }
}