using System;
using R3;
using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;
using VContainer.Unity;

namespace Selania.Rework.Components.Museum.Dialogue
{
    public class DialogueMuseumSectionLifetimeScope : LifetimeScope
    {
        [SerializeField] [Tooltip("Settings of the game.")]
        private SelaniaSettings settings = null!;

        protected override void Configure(IContainerBuilder builder)
        {
            builder.RegisterLogger(settings);
            builder.RegisterInstance(new EmptyStory()).As<IStoryLinear>().As<IStoryChoicesSelector>();
            builder.RegisterInstance(settings).As<ISettingsDialogueBox>();
        }

        private class EmptyDisposable : IDisposable
        {
            public void Dispose()
            {
            }
        }

        private class EmptyStory : IStoryLinear, IStoryChoicesSelector
        {
            public Observable<IStoryChoicesSelector.ChoicesInfo> ChoicesObservable =>
                Observable.Empty<IStoryChoicesSelector.ChoicesInfo>();

            public void PickChoiceWithText(string text)
            {
            }

            public void PickChoiceWithIndex(int index)
            {
            }

            public Observable<IStoryLinear.CurrentTextInfo> currentTextObservable =>
                Observable.Empty<IStoryLinear.CurrentTextInfo>();

            public Observable<bool> conversationInProgressObservable =>
                Observable.Return(true);

            public bool canContinue => false;

            public void Continue()
            {
            }
        }
    }
}