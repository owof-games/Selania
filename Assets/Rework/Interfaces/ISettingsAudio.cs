using UnityEngine;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     Settings interface that pertains audio.
    /// </summary>
    public interface ISettingsAudio
    {
        /// <summary>
        ///     Cross-fade duration for ambient sounds and soundtracks in seconds.
        /// </summary>
        public float crossFadeDuration { get; }

        /// <summary>
        ///     Get the audio clip for ambient sounds with a certain name.
        /// </summary>
        /// <param name="name">Name of the ambient sounds.</param>
        /// <returns>Audio clip of the requested ambient sounds.</returns>
        AudioClip GetAmbientSoundClip(string name);

        /// <summary>
        ///     Get the audio clip for soundtracks with a certain name.
        /// </summary>
        /// <param name="name">Name of the soundtracks.</param>
        /// <returns>Audio clip of the requested soundtracks.</returns>
        AudioClip GetSoundtrackClip(string name);

        /// <summary>
        ///     Get the audio clip for sound effects with a certain name.
        /// </summary>
        /// <param name="name">Name of the sound effects.</param>
        /// <returns>Audio clip of the requested sound effects.</returns>
        AudioClip GetSoundEffectClip(string name);
    }
}