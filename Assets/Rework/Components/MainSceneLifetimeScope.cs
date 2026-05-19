using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;

namespace Selania.Rework.Components
{
    /// <summary>
    ///     The root VContainer scope for the main scene, providing base services used by all the game.
    /// </summary>
    public class MainSceneLifetimeScope : ScopeWithAutoInjectSupport
    {
        [SerializeField] [Tooltip("The ink bridge used for the game.")]
        private InkBridge inkBridge = null!;

        [SerializeField] [Tooltip("Settings of the game.")]
        private SelaniaSettings settings = null!;

        [SerializeField] [Tooltip("The audio system.")]
        private AudioSystem.AudioSystem audioSystem = null!;

        /// <inheritdoc />
        protected override void Configure(IContainerBuilder builder)
        {
            builder.RegisterInkBridgeInstance(inkBridge);
            builder.RegisterSettings(settings);
            builder.RegisterLogger();
            builder.RegisterInstance(audioSystem).As<IAudioSystem>();
            builder.RegisterRoomContentMemory();
        }
    }
}