using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using VContainer;

namespace Selania.Rework.Components
{
    public static class ContainerBuilderExtensions
    {
        public static void RegisterInkBridgeInstance(this IContainerBuilder containerBuilder, InkBridge inkBridge)
        {
            var loggerResolved = false;
            containerBuilder.Register<InkBridge>(resolver =>
                {
                    if (loggerResolved) return inkBridge;

                    var logger = resolver.Resolve<ILogger<InkBridge>>();
                    inkBridge.StartStory(logger);
                    loggerResolved = true;
                    return inkBridge;
                }, Lifetime.Singleton)
                .As<IStoryChangeRoomNotifier>()
                .As<IStoryChoicesSelector>()
                .As<IStoryLinear>()
                .As<IStoryChangeRoomContentsNotifier>();
        }
    }
}