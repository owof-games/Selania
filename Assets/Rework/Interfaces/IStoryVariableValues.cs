using R3;

namespace Selania.Rework.Interfaces
{
    public interface IStoryVariableValues
    {
        /// <summary>
        ///     Create an observable that tracks the value of the given variable. This observable always produces the first
        ///     value of the variable when subscribed to.
        /// </summary>
        /// <param name="variableName">The name of the variable to track.</param>
        /// <typeparam name="T">The type of the C# type corresponding to the Ink variable.</typeparam>
        /// <returns>An observable tracking the variable value.</returns>
        Observable<T> GetVariableObservable<T>(string variableName);
    }
}