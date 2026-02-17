using System;
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
            public IDisposable AddChoicesChangedListener(IStoryChoicesSelector.ChoiceChanged listener)
            {
                return new EmptyDisposable();
            }

            public void PickChoiceWithText(string text)
            {
            }

            public void PickChoiceWithIndex(int index)
            {
            }

            public IDisposable AddCurrentTextChangedListener(IStoryLinear.CurrentTextChanged listener)
            {
                return new EmptyDisposable();
            }

            public bool canContinue => false;

            public void Continue()
            {
            }
        }
    }
}