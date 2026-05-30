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
            builder.RegisterSettings(settings);
            builder.RegisterLogger();
            builder.Register<EmptyStory>(Lifetime.Singleton).As<IStoryLinear>().As<IStoryChoicesSelector>()
                .As<IStoryInkInfo>().As<IStoryGamerMode>().As<IStoryRelationshipInfo>().As<IStorySigilSupport>();
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

        private class EmptyStory : IStoryLinear, IStoryChoicesSelector, IStoryInkInfo, IStoryGamerMode,
            IStoryRelationshipInfo, IStorySigilSupport
        {
            public Observable<IStoryChoicesSelector.ChoicesInfo> choicesObservable =>
                Observable.Empty<IStoryChoicesSelector.ChoicesInfo>();

            public void PickChoiceWithText(string text)
            {
            }

            public void PickChoiceWithIndex(int index)
            {
            }

            public Observable<bool> gamerMode => Observable.Return<bool>(false);

            public Observable<int> GetInkLevelObservable(string inkVariableName)
            {
                return Observable.Never<int>();
            }

            public Observable<IStoryLinear.CurrentTextInfo> currentTextObservable =>
                Observable.Empty<IStoryLinear.CurrentTextInfo>();

            public Observable<string> imageObservable => Observable.Empty<string>();

            public Observable<bool> conversationInProgressObservable =>
                Observable.Return(true);

            public bool canContinue => false;

            public void Continue()
            {
            }

            public Observable<int?> GetRelationshipLevelObservableFor(ISettingsDialogueBox settingsDialogueBox,
                string characterName)
            {
                return Observable.Return((int?)0).Concat(Observable.Never<int?>());
            }

            public Observable<IStorySigilSupport.SigilDescriptor?> ActiveSigilInfo { get; } =
                Observable.Never<IStorySigilSupport.SigilDescriptor?>();

            public Observable<Unit> SigilInfluence { get; } = Observable.Never<Unit>();

            public int GetRelationshipWith(ISettingsDialogueBox settingsDialogueBox, string characterName)
            {
                return 0;
            }
        }
    }
}