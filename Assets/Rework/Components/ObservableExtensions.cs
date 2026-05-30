using System;
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

        /// <summary>
        ///     Just like <see cref="Observable.CombineLatest{T1,T2,TResult}(Observable{T1},Observable{T2},Func{T1,T2,TResult})" />
        ///     ,
        ///     but emits a value only when the first observable emits a value.
        /// </summary>
        /// <param name="source">The source ("driver") observable.</param>
        /// <param name="o1">The other observable.</param>
        /// <param name="resultSelector">A function that combines the two results from the two observables in one value.</param>
        /// <typeparam name="T1">Type of the values produced by the source ("driver") observable.</typeparam>
        /// <typeparam name="T2">Type of the values produced by the second observable.</typeparam>
        /// <typeparam name="TResult">Type of the observable results.</typeparam>
        /// <returns>
        ///     An observable that emits a (combined) value whenever the source emits a value together with the value of the
        ///     secondary observable.
        /// </returns>
        public static Observable<TResult> CombineLatestWhenFirstChanged<T1, T2, TResult>(this Observable<T1> source,
            Observable<T2> o1, Func<T1, T2, TResult> resultSelector)
        {
            // TODO: NON THREAD-SAFE!
            return Observable.Create<TResult>(observer =>
            {
                // save the latest values produced by source and o1
                var sourceProducedValue = false;
                var latestSourceValue = default(T1);

                var o1ProducedValue = false;
                var latestO1Value = default(T2);

                // remember if we emitted the first value (which means both sources emitted at least one value)
                var firstEmissionCompleted = false;

                var o1Subscription = o1.Subscribe(o1Value =>
                {
                    // save the value emitted by o1
                    o1ProducedValue = true;
                    latestO1Value = o1Value;

                    // emit only if the first emission is yet to happen, and source has already emitted a value
                    if (!sourceProducedValue || firstEmissionCompleted) return;
                    firstEmissionCompleted = true;
                    observer.OnNext(resultSelector(latestSourceValue!, o1Value));
                });

                var sourceSubscription = source.Subscribe(sourceValue =>
                {
                    // save the value emitted by source
                    sourceProducedValue = true;
                    latestSourceValue = sourceValue;

                    // emit only if o1 has already emitted a value (symmetry break when compared with the condition for o1)
                    if (!o1ProducedValue) return;
                    firstEmissionCompleted = true;
                    observer.OnNext(resultSelector(sourceValue, latestO1Value!));
                });

                return Disposable.Combine(o1Subscription, sourceSubscription);
            });
        }
    }
}