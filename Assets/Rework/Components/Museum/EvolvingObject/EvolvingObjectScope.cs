using System;
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

        public EvolvingObjectStoryChangeRoomContentsNotifier EvolvingObjectStoryChangeRoomContentsNotifierInstance
        {
            get;
        } = new();

        protected override void Configure(IContainerBuilder builder)
        {
            // IStoryChangeRoomContentsNotifier
            // ILogger
            // IStoryVariableValues
            base.Configure(builder);
            builder.RegisterSettings(selaniaSettings);
            builder.RegisterLogger();
            builder.RegisterRoomContentMemory();
            builder.RegisterInstance<IStoryVariableValues>(EvolvingObjectStoryVariableValuesInstance);
            builder.RegisterInstance<IStoryChangeRoomContentsNotifier>(
                EvolvingObjectStoryChangeRoomContentsNotifierInstance);
        }

        public class EvolvingObjectStoryVariableValues : IStoryVariableValues
        {
            private readonly ReplaySubject<int> _values = new(1);

            public EvolvingObjectStoryVariableValues()
            {
                SetState(0);
            }

            public Observable<T> GetVariableObservable<T>(string variableName)
            {
                return _values.OfType<int, T>();
            }

            public void SetState(int value)
            {
                _values.OnNext(value);
            }
        }

        public class EvolvingObjectStoryChangeRoomContentsNotifier : IStoryChangeRoomContentsNotifier
        {
            private readonly ReplaySubject<IStoryChangeRoomContentsNotifier.ChangeRoomContentsInfo>
                _roomContentsSubject =
                    new(1);

            public EvolvingObjectStoryChangeRoomContentsNotifier()
            {
                EnterRoomB();
            }

            public Observable<IStoryChangeRoomContentsNotifier.ChangeRoomContentsInfo> RoomContentsObservable =>
                _roomContentsSubject.AsObservable();

            public void EnterRoomA()
            {
                _roomContentsSubject.OnNext(new IStoryChangeRoomContentsNotifier.ChangeRoomContentsInfo(
                    IStoryChangeRoomContentsNotifier.RoomContentsChangeReason.CharacterMoved, new[] { "object" },
                    "RoomA"));
            }

            public void EnterRoomB()
            {
                _roomContentsSubject.OnNext(new IStoryChangeRoomContentsNotifier.ChangeRoomContentsInfo(
                    IStoryChangeRoomContentsNotifier.RoomContentsChangeReason.CharacterMoved, Array.Empty<string>(),
                    "RoomB"));
            }
        }
    }
}