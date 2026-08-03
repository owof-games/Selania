using System;
using Selania.Rework.Interfaces;

namespace Selania.Rework.Components
{
    /// <summary>
    /// Class which is a mirror of <see cref="InkBridge.GrimoirePageIdentifier"/> for serialization, otherwise we get errors like:
    /// Type '[Selania]Selania.Rework.Components.InkBridge+SaveData' has an extra field 'changedGrimoirePageIdentifiers' of type 'Selania.Rework.Components.InkBridge+GrimoirePageIdentifier[]' in the player and thus can't be serialized 
    /// </summary>
    [Serializable]
    internal class GrimoirePageIdentifierForSave
    {
        public required string name;
        public required string[] tags;
    }

    /// <summary>
    ///     The class that gets serialized in the save file.
    /// </summary>
    [Serializable]
    internal class SaveData
    {
        /// <summary>
        ///     See <see cref="IStoryStateSerializer.SaveState.Timestamp" />.
        /// </summary>
        public required long timestamp;

        /// <summary>
        ///     See <see cref="IStoryStateSerializer.SaveState.RoomInkName" />.
        /// </summary>
        public required string roomInkName;

        /// <summary>
        ///     See <see cref="IStoryStateSerializer.SaveState.NumRewritings" />.
        /// </summary>
        public required int numRewritings;

        /// <summary>
        ///     See <see cref="IStoryStateSerializer.SaveState.NumPlayedSeconds" />.
        /// </summary>
        public required int numPlayedSeconds;

        /// <summary>
        /// The list of changed pages still to be seen.
        /// </summary>
        public required GrimoirePageIdentifierForSave[]? changedGrimoirePageIdentifiers;
    }
}