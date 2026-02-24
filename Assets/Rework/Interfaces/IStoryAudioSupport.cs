using R3;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     The part of the Ink bindings that send information about the audio aspects.
    /// </summary>
    public interface IStoryAudioSupport
    {
        /// <summary>
        ///     An observable that emits the soundtrack requested. The latest soundtrack requested is emitted upon
        ///     subscription.
        /// </summary>
        public Observable<string> soundtrackObservable { get; }

        /// <summary>
        ///     An observable that emits the ambient sounds requested. The latest ambient sounds requested is emitted upon
        ///     subscription.
        /// </summary>
        public Observable<string> ambientSoundsObservable { get; }
    }
}