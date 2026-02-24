using R3;
using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;

namespace Selania.Rework.Components.AudioSystem
{
    /// <summary>
    ///     Bindings between the ink messages and the actual audio system.
    /// </summary>
    public class AudioSystemInkBindings : MonoBehaviour, IAutomaticEditorInject
    {
        /// <summary>
        ///     The audio system that will play sounds.
        /// </summary>
        [Inject] internal IAudioSystem AudioSystem = null!;

        /// <summary>
        ///     The story support for the audio.
        /// </summary>
        [Inject] internal IStoryAudioSupport StoryAudioSupport = null!;

        private void Start()
        {
            StoryAudioSupport
                .ambientSoundsObservable
                .Subscribe(ambientSounds => AudioSystem.CrossFadeToAmbientSounds(ambientSounds))
                .AddTo(this);

            StoryAudioSupport
                .soundtrackObservable
                .Subscribe(soundtrack => AudioSystem.CrossFadeToSoundtrack(soundtrack))
                .AddTo(this);
        }
    }
}