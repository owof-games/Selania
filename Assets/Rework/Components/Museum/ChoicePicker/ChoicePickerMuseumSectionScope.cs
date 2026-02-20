using System;
using R3;
using Selania.Rework.Interfaces;
using UnityEngine;
using UnityEngine.Events;
using VContainer;

namespace Selania.Rework.Components.Museum.ChoicePicker
{
    public class ChoicePickerMuseumSectionScope : ScopeWithAutoInjectSupport
    {
        [SerializeField] private UnityEvent<string> picked = new();

        [SerializeField] [Tooltip("Settings of the game.")]
        private SelaniaSettings settings = null!;

        protected override void Configure(IContainerBuilder builder)
        {
            base.Configure(builder);
            builder.RegisterLogger(settings);
            builder.Register<StoryChoicesSelector>(Lifetime.Scoped).As<IStoryChoicesSelector>();
            builder.Register<StoryChangeRoomContentsNotifier>(Lifetime.Scoped).As<IStoryChangeRoomContentsNotifier>();
        }

        // ReSharper disable once ClassNeverInstantiated.Local - instantiated via DI
        private class StoryChoicesSelector : IStoryChoicesSelector
        {
            private readonly ChoicePickerMuseumSectionScope _museumSectionScope;

            public StoryChoicesSelector(ChoicePickerMuseumSectionScope museumSectionScope)
            {
                _museumSectionScope = museumSectionScope;
            }

            public Observable<IStoryChoicesSelector.ChoicesInfo> ChoicesObservable =>
                Observable.Empty<IStoryChoicesSelector.ChoicesInfo>();

            public void PickChoiceWithText(string text)
            {
                _museumSectionScope.picked.Invoke(text);
            }

            public void PickChoiceWithIndex(int index)
            {
                throw new NotImplementedException();
            }
        }

        private class StoryChangeRoomContentsNotifier : IStoryChangeRoomContentsNotifier
        {
            public Observable<IStoryChangeRoomContentsNotifier.ChangeRoomContentsInfo> roomContentsObservable =>
                Observable.Empty<IStoryChangeRoomContentsNotifier.ChangeRoomContentsInfo>();
        }

        private class EmptyDisposable : IDisposable
        {
            public void Dispose()
            {
            }
        }
    }
}