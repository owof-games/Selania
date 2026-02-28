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
            builder.RegisterInstance(settings).As<ISettingsDialogueBox>().As<ISettingsLogger>();
            builder.RegisterLogger();
            builder.Register<EmptyStory>(Lifetime.Singleton).As<IStoryLinear>().As<IStoryChoicesSelector>();
            builder.Register<EmptyAudioSystem>(Lifetime.Singleton).As<IAudioSystem>();
        }

        // ReSharper disable once ClassNeverInstantiated.Local - used by DI
        private class EmptyAudioSystem : IAudioSystem
        {
            public void CrossFadeToSoundtrack(string soundtrackName)
            {
            }

            public void CrossFadeToAmbientSounds(string ambientSoundsName)
            {
            }

            public void PlaySoundEffect(string soundEffectName)
            {
            }
        }

        private class EmptyStory : IStoryLinear, IStoryChoicesSelector
        {
            public Observable<IStoryChoicesSelector.ChoicesInfo> choicesObservable =>
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