using R3;

namespace Selania.Rework.Components
{
    public static class ObservableExtensions
    {
        /// <summary>
        /// Filter all null values from an observable with nullable values.
        /// </summary>
        /// <param name="source">The source observable, containing nullable values.</param>
        /// <typeparam name="TResult">The type of values which can be null.</typeparam>
        /// <returns>An observable where the <c>null</c> values have been filtered out.</returns>
        public static Observable<TResult> WhereNotNull<TResult>(this Observable<TResult?> source) where TResult : struct
        {
            return source.Where(x => x.HasValue).Select(x => x!.Value);
        }
    }
}