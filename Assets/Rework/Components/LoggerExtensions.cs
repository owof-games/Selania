using Microsoft.Extensions.Logging;
using UnityEngine;
using Utf8StringInterpolation;
using VContainer;
using ZLogger;
using ZLogger.Unity;

namespace Selania.Rework.Components
{
    public static class LoggerExtensions
    {
        public static void RegisterLogger(this IContainerBuilder builder)
        {
            var logFile = Application.persistentDataPath + "/log.txt";
            Debug.Log("Logging to file: " + logFile);

            var loggerFactory = LoggerFactory.Create(logging => logging
                // minimum log level to trace, which will be used by default by log to file
                .SetMinimumLevel(LogLevel.Trace)
                .AddZLoggerFile(logFile, options => options.UsePlainTextFormatter(formatter =>
                {
                    formatter.SetPrefixFormatter($"{0} - {1} - {2} - ",
                        (in MessageTemplate template, in LogInfo info) =>
                            template.Format(info.Timestamp, info.Category, info.LogLevel));
                    formatter.SetExceptionFormatter((writer, ex) =>
                        Utf8String.Format(writer, $"{ex.Message}"));
                }))
                // also enable unity debug, but limit it to information 
                .AddZLoggerUnityDebug()
                .AddFilter<ZLoggerUnityDebugLoggerProvider>(null, LogLevel.Information)
            );
            builder.RegisterInstance(loggerFactory).As<ILoggerFactory>();
            builder.Register(typeof(Logger<>), Lifetime.Singleton).As(typeof(ILogger<>));
        }
    }
}