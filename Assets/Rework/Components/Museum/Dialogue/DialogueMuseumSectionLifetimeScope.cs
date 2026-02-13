using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;
using VContainer.Unity;

namespace Selania.Rework.Components.Museum.Dialogue
{
    public class DialogueMuseumSectionLifetimeScope : LifetimeScope
    {
        [SerializeField] [Tooltip("Settings of the game.")]
        private Settings settings = null!;

        protected override void Configure(IContainerBuilder builder)
        {
            builder.RegisterLogger(settings);
            builder.RegisterInstance(settings).As<ISettingsDialogueBox>();
        }
    }
}