using System.Collections.Generic;
using R3;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     An object that can notify when the main character has changed the room they're in.
    /// </summary>
    public interface IStoryChangeRoomNotifier
    {
        /// <summary>
        ///     An observable that provides the current room. If there's already a room the PG is in, it gets immediately
        ///     sent to the observers.
        /// </summary>
        Observable<string> currentRoomObservable { get; }

        /// <summary>
        ///     An observable producing the list of all room names. The room names are immediately sent to an observer,
        ///     or as soon as they are computed.
        /// </summary>
        Observable<RoomNamesInfo> roomNamesObservable { get; }

        /// <summary>
        ///     Info about the room names.
        /// </summary>
        /// <param name="roomNames">The names of all the available rooms.</param>
        record struct RoomNamesInfo(ICollection<string> roomNames);
    }
}