using UnityEngine;
using VContainer;
using VContainer.Unity;

namespace Selania.Rework.Components
{
    /// <summary>
    ///     The root VContainer scope for the main scene, providing base services used by all the game.
    /// </summary>
    public class MainSceneLifetimeScope : LifetimeScope
    {
        [SerializeField] [Tooltip("The ink bridge used for the game.")]
        private InkBridge inkBridge = null!;

        [SerializeField] [Tooltip("Settings of the game.")]
        private SelaniaSettings settings = null!;

        /// <inheritdoc />
        protected override void Configure(IContainerBuilder builder)
        {
            builder.RegisterInkBridgeInstance(inkBridge);
            builder.RegisterSettings(settings);
            builder.RegisterLogger(settings);
        }
    }
}