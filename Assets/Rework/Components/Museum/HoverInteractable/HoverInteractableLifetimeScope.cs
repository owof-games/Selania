using R3;
using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;

namespace Selania.Rework.Components.Museum.HoverInteractable
{
    public class HoverInteractableLifetimeScope : ScopeWithAutoInjectSupport
    {
        [SerializeField] [Tooltip("Settings of the game.")]
        private SelaniaSettings settings = null!;

        protected override void Configure(IContainerBuilder builder)
        {
            base.Configure(builder);
            builder.RegisterInstance(new StoryChangeRoomContentsNotifier()).AsImplementedInterfaces();
            builder.RegisterInstance(new StoryChoicesSelector()).AsImplementedInterfaces();
            builder.RegisterLogger(settings);
        }

        private class StoryChangeRoomContentsNotifier : IStoryChangeRoomContentsNotifier
        {
            public Observable<IStoryChangeRoomContentsNotifier.ChangeRoomContentsInfo> roomContentsObservable =>
                Observable.Empty<IStoryChangeRoomContentsNotifier.ChangeRoomContentsInfo>();
        }

        private class StoryChoicesSelector : IStoryChoicesSelector
        {
            public Observable<IStoryChoicesSelector.ChoicesInfo> ChoicesObservable =>
                Observable.Empty<IStoryChoicesSelector.ChoicesInfo>();

            public void PickChoiceWithText(string text)
            {
            }

            public void PickChoiceWithIndex(int index)
            {
            }
        }
    }
}