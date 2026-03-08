using UnityEngine;
using VContainer;

namespace Selania.Rework.Components.Museum.GrimoireStory
{
    public class GrimoireStoryScope : ScopeWithAutoInjectSupport
    {
        [SerializeField] private InkBridge inkBridge = null!;
        [SerializeField] private SelaniaSettings selaniaSettings = null!;

        protected override void Configure(IContainerBuilder builder)
        {
            builder.RegisterInkBridgeInstance(inkBridge);
            builder.RegisterSettings(selaniaSettings);
            builder.RegisterLogger();
        }
    }
}