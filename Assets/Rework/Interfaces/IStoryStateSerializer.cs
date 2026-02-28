using System;
using System.Collections.Generic;
using Cysharp.Threading.Tasks;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     Interface for objects that support serialization and deserialization of the Ink story. A save state is a serialized
    ///     version of the story together with some extra information, like the room where the story was saved in or a
    ///     screenshot of the moment the story was saved. It is uniquely identified by a string (the descriptor). A story
    ///     state serializer produces automatic saves in the background, following its own logic regarding when to do it
    ///     and how many to keep.
    /// </summary>
    public interface IStoryStateSerializer
    {
        /// <summary>
        ///     Get the full list of save states, starting from the most recent one to the oldest one.
        /// </summary>
        /// <returns>A list of save states.</returns>
        public IAsyncEnumerable<SaveState> GetSaveStates();

        /// <summary>
        ///     Start a story using the given serialization descriptor. If none is given, a new story is started.
        /// </summary>
        /// <param name="descriptor">Descriptor for the story serialization to load, or <c>null</c> to start a new story.</param>
        /// <returns>A task that is completed as soon as the story is loaded.</returns>
        public UniTask StartStory(string? descriptor);

        /// <summary>
        /// A save state.
        /// </summary>
        /// <param name="Descriptor">Descriptor for this save state (unique identifier).</param>
        /// <param name="RoomInkName">Unique identifier of the room name, as known by Ink (currently, name of the Ink variable used to represent the room contents).</param>
        /// <param name="Timestamp">The time when this save state was created, as expressed in number of ticks.</param>
        public record struct SaveState(string Descriptor, string RoomInkName, DateTime Timestamp);
    }
}