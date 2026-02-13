using System;
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
            builder.Register<StoryChoiceSelector>(Lifetime.Scoped).As<IStoryChoiceSelector>();
            builder.Register<StoryChangeRoomContentsNotifier>(Lifetime.Scoped).As<IStoryChangeRoomContentsNotifier>();
        }

        // ReSharper disable once ClassNeverInstantiated.Local - instantiated via DI
        private class StoryChoiceSelector : IStoryChoiceSelector
        {
            private readonly ChoicePickerMuseumSectionScope _museumSectionScope;

            public StoryChoiceSelector(ChoicePickerMuseumSectionScope museumSectionScope)
            {
                _museumSectionScope = museumSectionScope;
            }

            public void PickChoiceWithText(string text)
            {
                _museumSectionScope.picked.Invoke(text);
            }
        }

        private class StoryChangeRoomContentsNotifier : IStoryChangeRoomContentsNotifier
        {
            public IDisposable AddChangeRoomContentsListener(
                IStoryChangeRoomContentsNotifier.ChangeRoomContentsListener roomContentsListener)
            {
                return new EmptyDisposable();
            }
        }

        private class EmptyDisposable : IDisposable
        {
            public void Dispose()
            {
            }
        }
    }
}