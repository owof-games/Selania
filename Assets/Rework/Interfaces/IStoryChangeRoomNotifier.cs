using System;
using System.Collections.Generic;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     An object that can notify when the main character has changed the room they're in.
    /// </summary>
    public interface IStoryChangeRoomNotifier
    {
        /// <summary>
        ///     Type of function that gets called when the main character changes the room they're in.
        /// </summary>
        /// <param name="newRoomName">Name of the new room the character is moving to.</param>
        delegate void ChangeRoomListener(string newRoomName);

        /// <summary>
        ///     Function that gets called with the list of the room names.
        /// </summary>
        delegate void RoomNamesListener(IEnumerable<string> roomNames);

        /// <summary>
        ///     Add a listener notified when the room the main character is in changes. The listener gets immediately called
        ///     with the current room the main character is in upon subscription, if any.
        /// </summary>
        /// <param name="changeRoomListener">The listener.</param>
        /// <returns>A disposable that unsubscribes the listener when disposed.</returns>
        IDisposable AddChangeRoomListener(ChangeRoomListener changeRoomListener);

        /// <summary>
        ///     Add a listener to the list of room names. the listener gets immediately called with the list of rooms if
        ///     present, or as soon as the list of rooms gets computed.
        /// </summary>
        /// <param name="roomNamesListener">The listener to add.</param>
        /// <returns>A disposable that unsubscribed the listener when disposed.</returns>
        IDisposable AddRoomNamesListener(RoomNamesListener roomNamesListener);
    }
}