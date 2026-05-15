using System.Collections.Generic;
using R3;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     An object that can notify when the contents of a room the player is in has changed.
    /// </summary>
    public interface IStoryChangeRoomContentsNotifier
    {
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
        ///     An observable providing the contents of the room the PG is in. If the PG is already in a room when the
        ///     observer subscribes, the room contents are immediately sent (with the latest
        ///     <see cref="ChangeRoomContentsInfo.Reason"/> emitted).
        /// </summary>
        Observable<ChangeRoomContentsInfo> RoomContentsObservable { get; }

        /// <summary>
        ///     Information about changes to the contents of the room the main character is in.
        /// </summary>
        /// <param name="Reason">The reason why the contents of the room have changed.</param>
        /// <param name="RoomContents">The current contents of the room.</param>
        /// <param name="CurrentRoomName">The name of the current room.</param>
        record struct ChangeRoomContentsInfo(
            RoomContentsChangeReason Reason,
            IReadOnlyCollection<string> RoomContents,
            string CurrentRoomName);
    }
}