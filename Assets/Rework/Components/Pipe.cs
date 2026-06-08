using System;
using R3;

namespace Selania.Rework.Components
{
    public class Pipe<T> : IDisposable
    {
        private readonly ReplaySubject<Observable<T>> _subject = new(1);

        public Pipe()
        {
            Observable = _subject.Switch();
        }

        public Observable<T> Observable { get; }

        public void Dispose()
        {
            _subject.Dispose();
        }

        public void PipeIn(Observable<T> observable)
        {
            _subject.OnNext(observable);
        }
    }
}