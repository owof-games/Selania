using R3;

namespace Selania.Rework.Interfaces
{
    public interface IStoryInkInfo
    {
        /// <summary>
        ///     Get an observable tracking the current ink level produced by the given variable.
        /// </summary>
        /// <param name="inkVariableName">The variable to follow.</param>
        /// <returns>An observable with the level of ink present in the variable.</returns>
        Observable<int> GetInkLevelObservable(string inkVariableName);
    }
}