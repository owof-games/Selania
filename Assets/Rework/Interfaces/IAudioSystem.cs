namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     Interface for objects capable of playing audio.
    /// </summary>
    public interface IAudioSystem
    {
        /// <summary>
        ///     Cross-fade the current soundtrack to the given one. If there's no currently playing soundtrack, a simple
        ///     fade-in will be performed.
        /// </summary>
        /// <param name="soundtrackName">The name of the soundtrack.</param>
        void CrossFadeToSoundtrack(string soundtrackName);

        /// <summary>
        ///     Cross-fade the current ambient sounds to the given one. If there are no currently playing ambient sounds, a
        ///     simple fade-in will be performed.
        /// </summary>
        /// <param name="ambientSoundsName">The name of the ambient sounds.</param>
        void CrossFadeToAmbientSounds(string ambientSoundsName);

        /// <summary>
        ///     Play the given sound effect. If the maximum parallelism for sound effects is surpassed, the sound effect
        ///     nearest to its completion will be stopped.
        /// </summary>
        /// <param name="soundEffectName">Name of the sound effect to play.</param>
        void PlaySoundEffect(string soundEffectName);
    }
}