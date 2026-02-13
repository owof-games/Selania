using System.Collections.Generic;
using Microsoft.Extensions.Logging;

namespace Selania.Rework.Interfaces
{
    public interface ISettingsLogger
    {
        /// <summary>
        ///     The minimum log level to use. Every message emitted under this log level won't ever be processed,
        ///     independently of more specific filters.
        /// </summary>
        LogLevel minimumLogLevel { get; }

        /// <summary>
        ///     The settings specific for the file provider.
        /// </summary>
        IProviderSettings fileProviderSettings { get; }

        /// <summary>
        ///     The settings specific for the console.
        /// </summary>
        IProviderSettings consoleProviderSettings { get; }

        /// <summary>
        ///     The settings for a specific provider.
        /// </summary>
        public interface IProviderSettings
        {
            /// <summary>
            ///     The minimum log level to use specifically for this provider. Every message emitted under this log level
            ///     won't ever be processed, independently of more specific filters.
            /// </summary>
            LogLevel minimumLogLevel { get; }

            /// <summary>
            ///     Specific settings for categories.
            /// </summary>
            IEnumerable<ICategorySettings> categorySettings { get; }
        }

        /// <summary>
        ///     The settings for a specific category.
        /// </summary>
        public interface ICategorySettings
        {
            /// <summary>
            ///     The prefix for the name of the categories affected by this setting.
            /// </summary>
            string categoryPrefix { get; }

            /// <summary>
            ///     The minimum log level to use specifically for these categories.
            /// </summary>
            LogLevel minimumLogLevel { get; }
        }
    }
}