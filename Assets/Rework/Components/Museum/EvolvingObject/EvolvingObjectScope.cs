using R3;
using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;

namespace Selania.Rework.Components.Museum.EvolvingObject
{
    public class EvolvingObjectScope : ScopeWithAutoInjectSupport
    {
        [SerializeField] private SelaniaSettings selaniaSettings = null!;

        public EvolvingObjectStoryVariableValues EvolvingObjectStoryVariableValuesInstance { get; } = new();

        protected override void Configure(IContainerBuilder builder)
        {
            // IStoryChangeRoomContentsNotifier
            // ILogger
            // IStoryVariableValues
            base.Configure(builder);
            builder.RegisterSettings(selaniaSettings);
            builder.RegisterLogger();
            builder.RegisterInstance<IStoryVariableValues>(EvolvingObjectStoryVariableValuesInstance);
            builder.RegisterInstance<IStoryChangeRoomContentsNotifier>(
                new EvolvingObjectStoryChangeRoomContentsNotifier());
        }

        public class EvolvingObjectStoryVariableValues : IStoryVariableValues
        {
            private readonly Subject<int> _values = new();

            public Observable<T> GetVariableObservable<T>(string variableName)
            {
                return _values.OfType<int, T>();
            }

            public void EmitValue(int value)
            {
                _values.OnNext(value);
            }
        }

        private class EvolvingObjectStoryChangeRoomContentsNotifier : IStoryChangeRoomContentsNotifier
        {
            public Observable<IStoryChangeRoomContentsNotifier.ChangeRoomContentsInfo> roomContentsObservable { get; } =
                Observable.Return(new IStoryChangeRoomContentsNotifier.ChangeRoomContentsInfo(
                    IStoryChangeRoomContentsNotifier.RoomContentsChangeReason.ContentsChanged,
                    new[] { "object" }));
        }
    }
}