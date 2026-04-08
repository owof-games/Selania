using R3;

namespace Selania.Rework.Interfaces
{
    public interface IStoryGamerMode
    {
        /// <summary>
        ///     An observable that informs whether we're in gamer mode or not.
        /// </summary>
        Observable<bool> gamerMode { get; }
    }
}