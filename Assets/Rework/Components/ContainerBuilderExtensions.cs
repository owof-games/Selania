using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using UnityEngine;
using Utf8StringInterpolation;
using VContainer;
using ZLogger;
using ZLogger.Providers;
using ZLogger.Unity;

namespace Selania.Rework.Components
{
    public static class ContainerBuilderExtensions
    {
        /// <summary>
        ///     Register an ink bridge instance with all the interfaces it provides and starting the story (also providing
        ///     it a logger).
        /// </summary>
        /// <param name="containerBuilder">The container builder used to register this instance.</param>
        /// <param name="inkBridge">The ink bridge to register.</param>
        public static void RegisterInkBridgeInstance(this IContainerBuilder containerBuilder, InkBridge inkBridge)
        {
            // flag used to set up the ink bridge only once per registration.
            var loggerResolved = false;
            containerBuilder.Register<InkBridge>(resolver =>
                {
                    // if the registration has already been resolved once, just return the ink bridge
                    if (loggerResolved) return inkBridge;

                    // otherwise, set up the ink bridge and return it afterward
                    var logger = resolver.Resolve<ILogger<InkBridge>>();
                    var saveSystemSettings = resolver.Resolve<ISettingsSaveSystem>();
                    inkBridge.SetUp(logger, saveSystemSettings.saveDirPrefix,
                        saveSystemSettings.minimumTimeBetweenAutomaticSaves);
                    loggerResolved = true;
                    return inkBridge;
                }, Lifetime.Singleton)
                // explicitly register all the public interfaces
                .As<IStoryChangeRoomNotifier>()
                .As<IStoryChoicesSelector>()
                .As<IStoryLinear>()
                .As<IStoryChangeRoomContentsNotifier>()
                .As<IStoryStateSerializer>()
                .As<IStoryAudioSupport>()
                .As<IStoryGrimoire>()
                .As<IStoryInkInfo>();
        }

        /// <summary>
        ///     Register a logger in the given builder, provided settings about the log levels.
        /// </summary>
        /// <param name="builder">The builder to register the logger into.</param>
        public static void RegisterLogger(this IContainerBuilder builder)
        {
            // compute the log file location
            var logFile = Application.persistentDataPath + "/log.txt";
            Debug.Log("Logging to file: " + logFile);

            builder.Register(resolver =>
            {
                var settingsLogger = resolver.Resolve<ISettingsLogger>();

                var loggerFactory = LoggerFactory.Create(logging =>
                {
                    logging
                        // set minimum level (from configuration)
                        .SetMinimumLevel(settingsLogger.minimumLogLevel)
                        // setup both file and console logger
                        .AddZLoggerFile(logFile, options => options.UsePlainTextFormatter(formatter =>
                        {
                            formatter.SetPrefixFormatter($"{0} - {1} - {2} - ",
                                (in MessageTemplate template, in LogInfo info) =>
                                    template.Format(info.Timestamp, info.Category, info.LogLevel));
                            formatter.SetExceptionFormatter((writer, ex) =>
                                Utf8String.Format(writer, $"{ex.Message}"));
                        }))
                        .AddZLoggerUnityDebug()
                        // set minimum levels for the two providers
                        .AddFilter<ZLoggerUnityDebugLoggerProvider>(null,
                            settingsLogger.consoleProviderSettings.minimumLogLevel)
                        .AddFilter<ZLoggerFileLoggerProvider>(null,
                            settingsLogger.fileProviderSettings.minimumLogLevel);

                    // set category-specific filters for both providers
                    foreach (var categorySettings in settingsLogger.consoleProviderSettings.categorySettings)
                        logging.AddFilter<ZLoggerUnityDebugLoggerProvider>(categorySettings.categoryPrefix,
                            categorySettings.minimumLogLevel);

                    foreach (var categorySettings in settingsLogger.fileProviderSettings.categorySettings)
                        logging.AddFilter<ZLoggerFileLoggerProvider>(categorySettings.categoryPrefix,
                            categorySettings.minimumLogLevel);
                });

                return loggerFactory;
            }, Lifetime.Singleton);

            // set up the registrations to allow ILogger<T> to be automatically instantiated
            // see: https://github.com/hadashiA/VContainer/issues/715#issuecomment-2443123941
            // builder.RegisterInstance(loggerFactory).As<ILoggerFactory>();
            builder.Register(typeof(Logger<>), Lifetime.Singleton).As(typeof(ILogger<>));
        }

        /// <summary>
        ///     Register the settings object.
        /// </summary>
        /// <param name="containerBuilder">The container builder where to register the settings.</param>
        /// <param name="settings">The settings object to register.</param>
        /// <param name="settingsDialogueBox">An optional replacement object to register for the <see cref="ISettingsDialogueBox"/> interface.</param>
        /// <param name="settingsLogger">An optional replacement object to register for the <see cref="ISettingsLogger"/> interface.</param>
        /// <param name="settingsRooms">An optional replacement object to register for the <see cref="ISettingsRooms"/> interface.</param>
        /// <param name="settingsAudio">An optional replacement object to register for the <see cref="ISettingsAudio"/> interface.</param>
        /// <param name="settingsSaveSystem">An optional replacement object to register for the <see cref="ISettingsSaveSystem"/> interface.</param>
        /// <param name="settingsSigils">An optional replacement object to register for the <see cref="ISettingsSigils"/> interface.</param>
        /// <param name="settingsBook">An optional replacement object to register for the <see cref="ISettingsBook"/> interface.</param>
        public static void RegisterSettings(this IContainerBuilder containerBuilder, SelaniaSettings settings,
            ISettingsDialogueBox? settingsDialogueBox = null,
            ISettingsLogger? settingsLogger = null,
            ISettingsRooms? settingsRooms = null,
            ISettingsAudio? settingsAudio = null,
            ISettingsSaveSystem? settingsSaveSystem = null,
            ISettingsSigils? settingsSigils = null,
            ISettingsBook? settingsBook = null
        )
        {
            var registrationBuilder = containerBuilder
                .RegisterInstance(settings);

            if (settingsDialogueBox != null)
                containerBuilder.RegisterInstance(settingsDialogueBox).As<ISettingsDialogueBox>();
            else
                registrationBuilder.As<ISettingsDialogueBox>();

            if (settingsLogger != null)
                containerBuilder.RegisterInstance(settingsLogger).As<ISettingsLogger>();
            else
                registrationBuilder.As<ISettingsLogger>();

            if (settingsRooms != null)
                containerBuilder.RegisterInstance(settingsRooms).As<ISettingsRooms>();
            else
                registrationBuilder.As<ISettingsRooms>();

            if (settingsAudio != null)
                containerBuilder.RegisterInstance(settingsAudio).As<ISettingsAudio>();
            else
                registrationBuilder.As<ISettingsAudio>();

            if (settingsSaveSystem != null)
                containerBuilder.RegisterInstance(settingsSaveSystem).As<ISettingsSaveSystem>();
            else
                registrationBuilder.As<ISettingsSaveSystem>();

            if (settingsSigils != null)
                containerBuilder.RegisterInstance(settingsSigils).As<ISettingsSigils>();
            else
                registrationBuilder.As<ISettingsSigils>();

            if (settingsBook != null)
                containerBuilder.RegisterInstance(settingsBook).As<ISettingsBook>();
            else
                registrationBuilder.As<ISettingsBook>();
        }
    }
}