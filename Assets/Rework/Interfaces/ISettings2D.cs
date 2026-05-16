namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     Settings related to the 2D world.
    /// </summary>
    public interface ISettings2D
    {
        /// <summary>
        ///     The duration (in seconds) of the cross-fade for when an evolving object cross-fades between two different
        ///     states.
        /// </summary>
        float CrossFadeAnimationDurationForEvolvingObjects { get; }
    }
}