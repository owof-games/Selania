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
                .As<IStoryInkInfo>()
                .As<IStoryGamerMode>()
                .As<IStoryCharacterRelationshipStatus>()
                .As<IStoryVariableValues>()
                .As<IStoryDebugSupport>()
                .As<IStoryRelationshipInfo>()
                .As<IStorySigilSupport>();
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
        /// <param name="settings2D">An optional replacement object to register for the <see cref="ISettings2D"/> interface.</param>
        public static void RegisterSettings(this IContainerBuilder containerBuilder, SelaniaSettings settings,
            ISettingsDialogueBox? settingsDialogueBox = null,
            ISettingsLogger? settingsLogger = null,
            ISettingsRooms? settingsRooms = null,
            ISettingsAudio? settingsAudio = null,
            ISettingsSaveSystem? settingsSaveSystem = null,
            ISettingsSigils? settingsSigils = null,
            ISettingsBook? settingsBook = null,
            ISettings2D? settings2D = null
        )
        {
            var registrationBuilder = containerBuilder
                .RegisterInstance(settings);

            Register(settingsDialogueBox);
            Register(settingsLogger);
            Register(settingsRooms);
            Register(settingsAudio);
            Register(settingsSaveSystem);
            Register(settingsSigils);
            Register(settingsBook);
            Register(settings2D);

            return;

            void Register<T>(T? t)
            {
                if (t != null)
                    containerBuilder.RegisterInstance(t).As<T>();
                else
                    registrationBuilder.As<T>();
            }
        }

        /// <summary>
        ///     Add a singleton room content memory to the builder.
        /// </summary>
        /// <param name="builder">The builder.</param>
        public static void RegisterRoomContentMemory(this IContainerBuilder builder)
        {
            builder.RegisterInstance<IRoomContentMemory>(new RoomContentMemory());
        }
    }
}