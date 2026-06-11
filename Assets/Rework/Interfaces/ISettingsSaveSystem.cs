using System;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     Settings related to the save system.
    /// </summary>
    public interface ISettingsSaveSystem
    {
        /// <summary>
        ///     Prefix of the directory names where saves are stored.
        /// </summary>
        public string SaveDirPrefix { get; }

        /// <summary>
        ///     Minimum time between automatic saves.
        /// </summary>
        public TimeSpan MinimumTimeBetweenAutomaticSaves { get; }

        /// <summary>
        ///     When automatic saves start to get deleted, this is the minimum amount of save files that are always kept.
        /// </summary>
        public int MinimumNumberOfRetainedSaves { get; }

        /// <summary>
        ///     When automatic saves start to get deleted, this is the minimum time span between now and the oldest save file.
        /// </summary>
        public TimeSpan MinimumTimeSpanOfSavesRetained { get; }

        /// <summary>
        ///     The name of the variable that contains the list of completed stories.
        /// </summary>
        public string InkListVariableNameWithCompletedStories { get; }

        /// <summary>
        ///     Translate the name of an ink list item representing a room into the name of the room to display to the
        ///     player.
        /// </summary>
        /// <param name="inkValue">The name of the ink list item.</param>
        /// <returns>The name to present to the player.</returns>
        public string GetRoomNameFromInkValue(string inkValue);
    }
}