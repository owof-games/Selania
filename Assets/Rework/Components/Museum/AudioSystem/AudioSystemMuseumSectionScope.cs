using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;

namespace Selania.Rework.Components.Museum.AudioSystem
{
    public class AudioSystemMuseumSectionScope : ScopeWithAutoInjectSupport
    {
        [SerializeField] [Tooltip("Settings of the game.")]
        private SelaniaSettings settings = null!;

        [SerializeField] [Tooltip("Audio system of the game")]
        private Components.AudioSystem.AudioSystem audioSystem = null!;

        protected override void Configure(IContainerBuilder builder)
        {
            builder.RegisterLogger(settings);
            builder.RegisterSettings(settings);
            builder.RegisterInstance(audioSystem).As<IAudioSystem>();
        }
    }
}