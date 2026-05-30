using System;
using R3;

namespace Selania.Rework.Components.ObservableExtensions
{
    /// <summary>
    ///     The class that implements a combined (when first changed) observable.
    /// </summary>
    /// <typeparam name="TDriver">Type of the "driver" observable.</typeparam>
    /// <typeparam name="T1">Type of the first source observable.</typeparam>
    /// <typeparam name="T2">Type of the second source observable.</typeparam>
    /// <typeparam name="TResult">Type of the result.</typeparam>
    public sealed class CombineLatestWhenFirstChangedImpl2<TDriver, T1, T2, TResult> : Observable<TResult>
    {
        /// <summary>
        ///     The driver observable.
        /// </summary>
        private readonly Observable<TDriver> _driver;

        /// <summary>
        ///     The function that maps the combined values to a result value.
        /// </summary>
        private readonly Func<TDriver, T1, T2, TResult> _resultSelector;

        /// <summary>
        ///     The first source observable.
        /// </summary>
        private readonly Observable<T1> _source1;

        /// <summary>
        ///     The first source observable.
        /// </summary>
        private readonly Observable<T2> _source2;

        public CombineLatestWhenFirstChangedImpl2(
            Observable<TDriver> driver,
            Observable<T1> source1,
            Observable<T2> source2,
            Func<TDriver, T1, T2, TResult> resultSelector)
        {
            _source1 = source1;
            _source2 = source2;
            _driver = driver;
            _resultSelector = resultSelector;
        }

        protected override IDisposable SubscribeCore(Observer<TResult> observer)
        {
            return new CombineLatestWhenFirstChangedSubscription(observer, _driver, _source1, _source2, _resultSelector)
                .Run();
        }

        /// <summary>
        ///     The class that is produced to handle a subscription to this observable.
        /// </summary>
        private sealed class CombineLatestWhenFirstChangedSubscription : IDisposable
        {
            /// <summary>
            ///     The driver observable (see <see cref="CombineLatestWhenFirstChangedImpl2{TDriver,T1,T2,TResult}._driver" />).
            /// </summary>
            private readonly Observable<TDriver> _driver;

            /// <summary>
            ///     Synchronization gate to avoid multithreading problems.
            /// </summary>
            private readonly object _gate = new();

            /// <summary>
            ///     The observer that has been subscribed to the main observable.
            /// </summary>
            private readonly Observer<TResult> _observer;

            /// <summary>
            ///     The observer used to receive values from the first source observable.
            /// </summary>
            private readonly InnerObserver<T1> _observer1;

            /// <summary>
            ///     The observer used to receive values from the first source observable.
            /// </summary>
            private readonly InnerObserver<T2> _observer2;

            /// <summary>
            ///     The observer used to receive values from the driver observable.
            /// </summary>
            private readonly InnerObserver<TDriver> _observerDriver;

            /// <summary>
            ///     The function that maps the combined values to a result value (see
            ///     <see cref="CombineLatestWhenFirstChangedImpl2{TDriver,T1,T2,TResult}._resultSelector" />).
            /// </summary>
            private readonly Func<TDriver, T1, T2, TResult> _resultSelector;

            /// <summary>
            ///     The first source observable (see <see cref="CombineLatestWhenFirstChangedImpl2{TDriver,T1,T2,TResult}._source1" />
            ///     ).
            /// </summary>
            private readonly Observable<T1> _source1;

            /// <summary>
            ///     The first source observable (see <see cref="CombineLatestWhenFirstChangedImpl2{TDriver,T1,T2,TResult}._source2" />
            ///     ).
            /// </summary>
            private readonly Observable<T2> _source2;

            /// <summary>
            ///     The number of observables that have produced a value.
            /// </summary>
            private int _completedCount;

            /// <summary>
            ///     Cached value that becomes true the first time an observable publishes a value, and the other has already done so.
            /// </summary>
            private bool _hasValueAll;

            public CombineLatestWhenFirstChangedSubscription(Observer<TResult> observer, Observable<TDriver> driver,
                Observable<T1> source1, Observable<T2> source2, Func<TDriver, T1, T2, TResult> resultSelector)
            {
                _observer = observer;
                _driver = driver;
                _source1 = source1;
                _source2 = source2;
                _resultSelector = resultSelector;
                _observerDriver = new InnerObserver<TDriver>(this, true);
                _observer1 = new InnerObserver<T1>(this, false);
                _observer2 = new InnerObserver<T2>(this, false);
            }

            public void Dispose()
            {
                // by disposing the observers, the subscriptions are disposed too
                _observerDriver.Dispose();
                _observer1.Dispose();
                _observer2.Dispose();
            }

            public IDisposable Run()
            {
                try
                {
                    // subscribe to both observables with our special observers
                    _driver.Subscribe(_observerDriver);
                    _source1.Subscribe(_observer1);
                    _source2.Subscribe(_observer2);
                }
                catch
                {
                    // if there's been an error, dispose everything and re-throw
                    Dispose();
                    throw;
                }

                return this;
            }

            private void TryPublishOnNext()
            {
                // check if all the observers have received a value
                if (!_hasValueAll)
                {
                    if (!_observerDriver.HasValue || !_observer1.HasValue || !_observer2.HasValue)
                        return;
                    _hasValueAll = true;
                }

                // they did: invoke OnNext
                _observer.OnNext(_resultSelector(_observerDriver.Value!, _observer1.Value!, _observer2.Value!));
            }

            private void TryPublishOnCompleted(Result result, bool empty)
            {
                if (result.IsFailure)
                {
                    // immediately send a completion error to the main observer, which stops further messages 
                    _observer.OnCompleted(result);
                }
                else
                {
                    // send the completion message only if both observables are complete, or if one completed when empty
                    // (in this case we will never be able to emit a value ever anyway!)
                    ++_completedCount;
                    if (!empty && _completedCount != 3)
                        return;
                    _observer.OnCompleted();
                }

                Dispose();
            }

            private sealed class InnerObserver<T> : Observer<T>
            {
                private readonly bool _isDriver;
                private readonly CombineLatestWhenFirstChangedSubscription _parent;
                public bool HasValue;

                public T? Value;

                public InnerObserver(CombineLatestWhenFirstChangedSubscription parent, bool isDriver)
                {
                    _isDriver = isDriver;
                    _parent = parent;
                }

                protected override void OnNextCore(T value)
                {
                    lock (_parent._gate)
                    {
                        // save the received value, but ask for OnNext to the parent only if this is connected to the driver
                        Value = value;
                        HasValue = true;
                        if (_isDriver) _parent.TryPublishOnNext();
                    }
                }

                protected override void OnErrorResumeCore(Exception error)
                {
                    lock (_parent._gate)
                        // in case of error, skip the parent and immediately send the error to the main observer
                    {
                        _parent._observer.OnErrorResume(error);
                    }
                }

                protected override void OnCompletedCore(Result result)
                {
                    lock (_parent._gate)
                        // send the completion event
                    {
                        _parent.TryPublishOnCompleted(result, !HasValue);
                    }
                }
            }
        }
    }
}