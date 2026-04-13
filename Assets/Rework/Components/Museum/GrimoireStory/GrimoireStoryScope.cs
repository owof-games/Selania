using Selania.Rework.Interfaces;
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
            builder.RegisterInstance<IAudioSystem>(new EmptyAudioSystem());
        }

        private class EmptyAudioSystem : IAudioSystem
        {
            public void CrossFadeToSoundtrack(string soundtrackName)
            {
            }

            public void CrossFadeToAmbientSounds(string ambientSoundsName)
            {
            }

            public void PlaySoundEffect(string soundEffectName)
            {
            }
        }
    }
}