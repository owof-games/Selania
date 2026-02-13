using UnityEngine;
using VContainer;
using VContainer.Unity;

namespace Selania.Rework.Components
{
    public class MainSceneLifetimeScope : LifetimeScope
    {
        [SerializeField] [Tooltip("The ink bridge used for the game.")]
        private InkBridge inkBridge = null!;

        [SerializeField] [Tooltip("Settings of the game.")]
        private SelaniaSettings settings = null!;

        protected override void Configure(IContainerBuilder builder)
        {
            builder.RegisterInkBridgeInstance(inkBridge);
            builder.RegisterLogger(settings);
        }
    }
}