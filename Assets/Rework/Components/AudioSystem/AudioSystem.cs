using System;
using System.Linq;
using System.Threading;
using Cysharp.Threading.Tasks;
using LitMotion;
using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.AudioSystem
{
    [DisallowMultipleComponent]
    public class AudioSystem : MonoBehaviour, IAudioSystem, IAutomaticEditorInject
    {
        [SerializeField] [Tooltip("The audio sources used to play and dross-fade ambient sounds.")]
        private AudioSource[] ambientSoundAudioSources = null!;

        [SerializeField] [Tooltip("The audio sources used to play and dross-fade soundtracks.")]
        private AudioSource[] soundtrackAudioSources = null!;

        [SerializeField] [Tooltip("The audio sources used to play sound effects.")]
        private AudioSource[] soundEffectAudioSources = null!;

        /// <summary>
        ///     Cross-fade data for the ambient sounds.
        /// </summary>
        private CrossFadeData _currentAmbientSoundsCrossFadeData = new();

        /// <summary>
        ///     Cross-fade data for the soundtrack.
        /// </summary>
        private CrossFadeData _currentSoundtrackCrossFadeData = new();

        /// <summary>
        ///     The logger for this component.
        /// </summary>
        [Inject] internal ILogger<AudioSystem> Logger = null!;

        /// <summary>
        ///     Audio-related settings.
        /// </summary>
        [Inject] internal ISettingsAudio SettingsAudio = null!;

        private void Start()
        {
            // ensure that the objects are re-initialized on start
            _currentSoundtrackCrossFadeData = new CrossFadeData();
            _currentAmbientSoundsCrossFadeData = new CrossFadeData();
        }

        /// <inheritdoc />
        public void CrossFadeToSoundtrack(string soundtrackName)
        {
            var newAudioClip = SettingsAudio.GetSoundtrackClip(soundtrackName);
            _currentSoundtrackCrossFadeData.Task =
                CrossFadeBetween(soundtrackAudioSources, newAudioClip, _currentSoundtrackCrossFadeData);
        }

        /// <inheritdoc />
        public void CrossFadeToAmbientSounds(string ambientSoundsName)
        {
            var newAudioClip = SettingsAudio.GetAmbientSoundClip(ambientSoundsName);
            _currentAmbientSoundsCrossFadeData.Task =
                CrossFadeBetween(ambientSoundAudioSources, newAudioClip, _currentAmbientSoundsCrossFadeData);
        }

        /// <inheritdoc />
        public void PlaySoundEffect(string soundEffectName)
        {
            // check we have at least one audio source for sound effects
            if (soundEffectAudioSources.Length == 0)
            {
                Logger.ZLogError($"Need at least one audio source for sound effects to play {soundEffectName}.");
                return;
            }

            // get the audio clip
            var audioClip = SettingsAudio.GetSoundEffectClip(soundEffectName);

            // try to play it with the first free audio source found
            var firstFreeAudioSource =
                soundEffectAudioSources.FirstOrDefault(soundEffectAudioSource => !soundEffectAudioSource.isPlaying);
            if (firstFreeAudioSource != null)
            {
                firstFreeAudioSource.clip = audioClip;
                firstFreeAudioSource.Play();
                return;
            }

            // otherwise, stop the one which is nearest to complete and use it
            var nearestToCompletionAudioSource =
                soundEffectAudioSources.OrderBy(source => source.clip.length - source.time).First();
            nearestToCompletionAudioSource.Stop();
            nearestToCompletionAudioSource.clip = audioClip;
            nearestToCompletionAudioSource.Play();
        }

        /// <summary>
        ///     Perform a cross-fade between two clips.
        /// </summary>
        /// <param name="audioSources">The set of available audio sources.</param>
        /// <param name="newAudioClip">The new audio clip to play.</param>
        /// <param name="crossFadeData">Data about cross-fades for this audio source (index, cancellation token source and task).</param>
        private async UniTask CrossFadeBetween(AudioSource[] audioSources, AudioClip newAudioClip,
            CrossFadeData crossFadeData)
        {
            switch (audioSources.Length)
            {
                case < 2:
                    Logger.ZLogError($"Need at least two audio sources to perform a cross-fade");
                    return;
                case > 2:
                    Logger.ZLogWarning($"Don't need more than two sources to perform a cross-fade.");
                    break;
            }

            // cancel the previous crossfade, and (re)create the cancellation token source
            Logger.ZLogTrace($"Cancel previous cross-fade if needed");
            crossFadeData.CancellationTokenSource?.Cancel();
            crossFadeData.CancellationTokenSource?.Dispose();
            crossFadeData.CancellationTokenSource = new CancellationTokenSource();
            if (crossFadeData.Task.HasValue)
                try
                {
                    await crossFadeData.Task.Value;
                }
                catch (Exception e)
                {
                    Logger.ZLogError(e, $"Error while waiting for previous crossfade to complete");
                }

            // create a sequence of fade-in + fade-out playing together
            var sequence = LSequence.Create();

            // add fade-out to the sequence (if necessary)
            var fadeOutAudioSource = audioSources[crossFadeData.AudioSourceIndex];
            if (fadeOutAudioSource.isPlaying)
            {
                Logger.ZLogTrace($"Fading out old soundtrack in slot {crossFadeData.AudioSourceIndex}");
                var fadeOutMotion = LMotion
                    .Create(1f, 0f, SettingsAudio.crossFadeDuration)
                    .Bind(fadeOutAudioSource, (volume, audioSource) => audioSource.volume = volume)
                    .AddTo(this);
                sequence.Insert(0, fadeOutMotion);
            }

            // add fade-in to the sequence
            crossFadeData.AudioSourceIndex = 1 - crossFadeData.AudioSourceIndex;
            Logger.ZLogTrace($"Fading in new soundtrack in slot {crossFadeData.AudioSourceIndex}");
            var fadeInAudioSource = audioSources[crossFadeData.AudioSourceIndex];
            fadeInAudioSource.volume = 0;
            fadeInAudioSource.clip = newAudioClip;
            fadeInAudioSource.Play();
            var fadeInMotion = LMotion
                .Create(0f, 1f, SettingsAudio.crossFadeDuration)
                .Bind(fadeInAudioSource, (volume, audioSource) => audioSource.volume = volume)
                .AddTo(this);
            sequence.Insert(0, fadeInMotion);

            var motionHandle = MotionHandle.None;
            try
            {
                Logger.ZLogTrace($"Running cross-fade");
                // run both motions
                motionHandle = sequence.Run();
                await motionHandle.ToUniTask(crossFadeData.CancellationTokenSource.Token);
                Logger.ZLogTrace($"Cross-fade completed");
            }
            catch (Exception e)
            {
                Logger.ZLogError(e, $"Error while running cross-fade");
            }
            finally
            {
                Logger.ZLogTrace($"Clear up cross-fade data");
                // stop the fade-out sequence and clean up data structures
                motionHandle.TryCancel();
                fadeOutAudioSource.Stop();
                crossFadeData.Task = null;
            }
        }

        /// <summary>
        ///     Information about cross-fade data for soundtrack or ambient sounds.
        /// </summary>
        private class CrossFadeData
        {
            /// <summary>
            ///     The index of the audio source in <see cref="soundtrackAudioSources" />.
            /// </summary>
            public int AudioSourceIndex;

            /// <summary>
            ///     The cancellation token source used to cancel the currently running soundtrack cross-fade.
            /// </summary>
            public CancellationTokenSource? CancellationTokenSource;

            /// <summary>
            ///     The currently running cross-fade task for the soundtrack.
            /// </summary>
            public UniTask? Task;
        }
    }
}