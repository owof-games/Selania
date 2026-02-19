using System;
using System.Collections.Generic;
using System.Runtime.ExceptionServices;

namespace Selania.Rework.Components
{
    /// <summary>
    ///     Base class for containers of listeners.
    /// </summary>
    /// <typeparam name="T">Type of the listeners.</typeparam>
    public class ListenersContainerBase<T>
    {
        /// <summary>
        ///     The listeners (or null if there are no listeners yet).
        /// </summary>
        private List<T>? _listeners;

        /// <summary>
        ///     Add a new listener to the container.
        /// </summary>
        /// <param name="listener">The listener to add.</param>
        /// <returns>A disposable that will remove the listener when disposed.</returns>
        public virtual IDisposable AddListener(T listener)
        {
            _listeners ??= new List<T>();
            _listeners.Add(listener);
            return new RemoveDisposable(this, listener);
        }

        /// <summary>
        ///     Execute the given action on every listener. The action is invoked on every listener even if it throws an
        ///     exception. Once all listeners have been called, if a single exception has been raised it is re-thrown,
        ///     and if more than one was raised then an <see cref="AggregateException" /> is thrown with all the exceptions
        ///     encountered inside it.
        /// </summary>
        /// <param name="onListener">The action to execute on every listener.</param>
        protected void ExecuteOnListeners(Action<T> onListener)
        {
            if (_listeners == null) return;
            List<Exception>? exceptions = null;
            foreach (var listener in _listeners)
                try
                {
                    onListener(listener);
                }
                catch (Exception e)
                {
                    exceptions ??= new List<Exception>();
                    exceptions.Add(e);
                }

            if (exceptions == null) return;
            if (exceptions.Count == 1) ExceptionDispatchInfo.Capture(exceptions[0]).Throw();
            throw new AggregateException(exceptions);
        }

        /// <summary>
        ///     A disposable that removes the listener from its container.
        /// </summary>
        private sealed class RemoveDisposable : IDisposable
        {
            // use weak references so that the container can be disposed even if its listeners do not.
            private readonly WeakReference<ListenersContainerBase<T>> _container;
            private readonly T _listener;

            public RemoveDisposable(ListenersContainerBase<T> container, T listener)
            {
                _listener = listener;
                _container = new WeakReference<ListenersContainerBase<T>>(container);
            }

            public void Dispose()
            {
                if (!_container.TryGetTarget(out var container)) return;
                container._listeners?.Remove(_listener);
            }
        }
    }

    /// <summary>
    ///     A container of listeners that take no argument.
    /// </summary>
    public class ListenersContainer : ListenersContainerBase<Action>
    {
        /// <summary>
        ///     Invoke all the listeners with the given argument. See <see cref="ListenersContainerBase{T}.ExecuteOnListeners" />
        ///     for the exception semantic.
        /// </summary>
        public void Invoke()
        {
            ExecuteOnListeners(listener => listener());
        }
    }

    /// <summary>
    ///     A container of listeners that take a single argument.
    /// </summary>
    /// <typeparam name="TArg1">The type of the argument taken by the listeners.</typeparam>
    public class ListenersContainer<TArg1> : ListenersContainerBase<Action<TArg1>>
    {
        /// <summary>
        ///     Invoke all the listeners with the given argument. See <see cref="ListenersContainerBase{T}.ExecuteOnListeners" />
        ///     for the exception semantic.
        /// </summary>
        /// <param name="arg1">The argument passed to the listeners.</param>
        public virtual void Invoke(TArg1 arg1)
        {
            ExecuteOnListeners(listener => listener(arg1));
        }
    }

    public class AutoNotifierListenersContainer<TArg> : ListenersContainer<TArg>
    {
        private TArg _arg = default!;
        private bool _hasValue;

        public override IDisposable AddListener(Action<TArg> listener)
        {
            var disposable = base.AddListener(listener);
            if (_hasValue) listener(_arg);

            return disposable;
        }

        public override void Invoke(TArg arg)
        {
            _arg = arg;
            _hasValue = true;
            base.Invoke(arg);
        }
    }

    /// <summary>
    ///     A container of listeners that take two arguments.
    /// </summary>
    /// <typeparam name="TArg1">The type of the first argument taken by the listeners.</typeparam>
    /// <typeparam name="TArg2">The type of the second argument taken by the listeners.</typeparam>
    public class ListenersContainer<TArg1, TArg2> : ListenersContainerBase<Action<TArg1, TArg2>>
    {
        /// <summary>
        ///     Invoke all the listeners with the given argument. See <see cref="ListenersContainerBase{T}.ExecuteOnListeners" />
        ///     for the exception semantic.
        /// </summary>
        /// <param name="arg1">The first argument passed to the listeners.</param>
        /// <param name="arg2">The second argument passed to the listeners.</param>
        public virtual void Invoke(TArg1 arg1, TArg2 arg2)
        {
            ExecuteOnListeners(listener => listener(arg1, arg2));
        }
    }

    public sealed class AutoNotifierListenersContainer<TArg1, TArg2> : ListenersContainer<TArg1, TArg2>
    {
        private (TArg1, TArg2)? _args;

        public override IDisposable AddListener(Action<TArg1, TArg2> listener)
        {
            if (_args.HasValue) listener(_args.Value.Item1, _args.Value.Item2);
            var disposable = base.AddListener(listener);

            return disposable;
        }

        public override void Invoke(TArg1 arg1, TArg2 arg2)
        {
            _args = (arg1, arg2);
            base.Invoke(arg1, arg2);
        }
    }
}