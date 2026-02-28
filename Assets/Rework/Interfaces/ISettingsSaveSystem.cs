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
        public string saveDirPrefix { get; }

        /// <summary>
        ///     Minimum time between automatic saves.
        /// </summary>
        public TimeSpan minimumTimeBetweenAutomaticSaves { get; }
    }
}