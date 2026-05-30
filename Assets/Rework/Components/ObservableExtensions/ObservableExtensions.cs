using System;
using R3;

namespace Selania.Rework.Components.ObservableExtensions
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

        /// <summary>
        ///     Just like <see cref="Observable.CombineLatest{T1,T2,TResult}(Observable{T1},Observable{T2},Func{T1,T2,TResult})" />     ,
        ///     but emits a value only when the first observable emits a value.
        /// </summary>
        /// <param name="source">The source ("driver") observable.</param>
        /// <param name="o1">The other observable.</param>
        /// <param name="resultSelector">A function that combines the two results from the two observables in one value.</param>
        /// <typeparam name="TDriver">Type of the values produced by the source ("driver") observable.</typeparam>
        /// <typeparam name="T1">Type of the values produced by the second observable.</typeparam>
        /// <typeparam name="TResult">Type of the observable results.</typeparam>
        /// <returns>
        ///     An observable that emits a (combined) value whenever the source emits a value together with the value of the
        ///     secondary observable.
        /// </returns>
        public static Observable<TResult> CombineLatestWhenFirstChanged<TDriver, T1, TResult>(
            this Observable<TDriver> source,
            Observable<T1> o1, Func<TDriver, T1, TResult> resultSelector)
        {
            return new CombineLatestWhenFirstChangedImpl1<TDriver, T1, TResult>(source, o1, resultSelector);
        }

        /// <summary>
        ///     Just like
        ///     <see
        ///         cref="Observable.CombineLatest{T1,T2,T3,TResult}(Observable{T1},Observable{T2},Observable{T3},Func{T1,T2,T3,TResult})" />
        ///     ,
        ///     but emits a value only when the first observable emits a value.
        /// </summary>
        /// <param name="source">The source ("driver") observable.</param>
        /// <param name="o1">The first other observable.</param>
        /// <param name="o2">The second other observable.</param>
        /// <param name="resultSelector">A function that combines the two results from the two observables in one value.</param>
        /// <typeparam name="TDriver">Type of the values produced by the source ("driver") observable.</typeparam>
        /// <typeparam name="T1">Type of the values produced by the first other observable.</typeparam>
        /// <typeparam name="T2">Type of the values produced by the second other observable.</typeparam>
        /// <typeparam name="TResult">Type of the observable results.</typeparam>
        /// <returns>
        ///     An observable that emits a (combined) value whenever the source emits a value together with the value of the
        ///     secondary observable.
        /// </returns>
        public static Observable<TResult> CombineLatestWhenFirstChanged<TDriver, T1, T2, TResult>(
            this Observable<TDriver> source,
            Observable<T1> o1, Observable<T2> o2, Func<TDriver, T1, T2, TResult> resultSelector)
        {
            return new CombineLatestWhenFirstChangedImpl2<TDriver, T1, T2, TResult>(source, o1, o2, resultSelector);
        }
    }
}