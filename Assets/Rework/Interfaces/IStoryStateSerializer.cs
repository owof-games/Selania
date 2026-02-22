using System.Collections.Generic;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     Interface for objects that support serialization and deserialization of the Ink story. A serialized version of
    ///     the story, or save, is uniquely identified by a string. A story state serializer performs automatic saves in
    ///     the background, following its own logic regarding when to do it and how many to keep.
    /// </summary>
    public interface IStoryStateSerializer
    {
        /// <summary>
        ///     Start a story using the given serialization descriptor. If none is given, a new story is started.
        /// </summary>
        /// <param name="descriptor">Descriptor for the story serialization to load, or <c>null</c> to start a new story.</param>
        public void StartStory(string? descriptor);

        /// <summary>
        ///     Get the list of automatic save descriptors.
        /// </summary>
        /// <returns>A list of story descriptors.</returns>
        public IList<string> GetAutomaticSaveDescriptors();

        /// <summary>
        ///     Explicitly perform a save in the given slot.
        /// </summary>
        /// <param name="slot">The slot number to save to.</param>
        public void Save(int slot);

        /// <summary>
        ///     Get an explicit save.
        /// </summary>
        /// <param name="slot">The slot of the save to retrieve.</param>
        /// <returns>The descriptor at given slot, or <c>null</c> if the slot is empty.</returns>
        public string? GetExplicitSaveDescriptor(int slot);

        /// <summary>
        ///     Delete the save at the given slot.
        /// </summary>
        /// <param name="slot">Slot number to free.</param>
        public void DeleteSave(int slot);

        /// <summary>
        ///     Get the descriptor for the reader mode, if there's a reader mode save.
        /// </summary>
        public string? GetReaderModeDescriptor();

        /// <summary>
        ///     Delete the special slot for the reader mode (if there's any).
        /// </summary>
        public void DeleteReaderModeSlot();
    }
}