using System;
using System.Collections.Generic;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     An object that can notify when the contents of a room the player is in has changed.
    /// </summary>
    public interface IStoryChangeRoomContentsNotifier
    {
        /// <summary>
        ///     The type of function that is called to notify that the contents of the room the main character is in have
        ///     changed.
        /// </summary>
        /// <param name="reason">The reason why the contents of the room have changed.</param>
        /// <param name="roomContents">The current contents of the room.</param>
        delegate void ChangeRoomContentsListener(RoomContentsChangeReason reason,
            IReadOnlyCollection<string> roomContents);

        /// <summary>
        ///     Reasons why the contents of the current room could change.
        /// </summary>
        enum RoomContentsChangeReason
        {
            /// <summary>
            ///     The contents have changed because the current character moved.
            /// </summary>
            CharacterMoved,

            /// <summary>
            ///     The contents have changed because one or more objects have been added or removed from the room.
            /// </summary>
            ContentsChanged
        }

        /// <summary>
        ///     Add a listener to the contents of the current room. the listener gets immediately called with the
        ///     contents of the current room if present, or as soon as the current room gets computed.
        /// </summary>
        /// <param name="roomContentsListener">The listener to add.</param>
        /// <returns>A disposable that unsubscribed the listener when disposed.</returns>
        IDisposable AddChangeRoomContentsListener(ChangeRoomContentsListener roomContentsListener);
    }
}