using R3;
using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;

namespace Selania.Rework.Components.Museum.GrimoireDisplay
{
    public class GrimoireDisplayMuseumSectionScope : ScopeWithAutoInjectSupport
    {
        [SerializeField] [Tooltip("Settings of the game.")]
        private SelaniaSettings settings = null!;

        public Subject<bool> gamerModeSubject { get; } = new();

        protected override void Configure(IContainerBuilder builder)
        {
            builder.RegisterSettings(settings);
            builder.RegisterLogger();
            builder.RegisterInstance<IStoryGamerMode>(new GamerModeFake(gamerModeSubject));
            builder.RegisterInstance<IStoryCharacterRelationshipStatus>(new StoryCharacterRelationshipStatusFake());
        }

        private class GamerModeFake : IStoryGamerMode
        {
            public GamerModeFake(Observable<bool> gamerModeObservable)
            {
                GamerMode = gamerModeObservable;
            }

            public Observable<bool> GamerMode { get; }
        }

        private class StoryCharacterRelationshipStatusFake : IStoryCharacterRelationshipStatus
        {
            public int minRelationshipValue => -9;
            public int maxRelationshipValue => 9;

            public Observable<float> GetCharacterObservable(string characterName)
            {
                return Observable.Return(characterName == "FirstCharacter" ? -3f : 3f);
            }
        }
    }
}