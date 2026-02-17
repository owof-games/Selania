using System;

namespace Selania.Rework.Components
{
    public class Disposable
    {
        public static IDisposable Create(Action action)
        {
            return new CreatedDisposable(action);
        }

        private class CreatedDisposable : IDisposable
        {
            private readonly Action _action;

            public CreatedDisposable(Action action)
            {
                _action = action;
            }

            public void Dispose()
            {
                _action();
            }
        }
    }
}