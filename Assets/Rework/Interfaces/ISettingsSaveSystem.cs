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
    }
}