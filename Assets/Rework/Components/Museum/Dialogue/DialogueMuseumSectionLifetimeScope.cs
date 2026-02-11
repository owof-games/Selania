using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;
using VContainer.Unity;

namespace Selania.Rework.Components.Museum.Dialogue
{
    public class DialogueMuseumSectionLifetimeScope : LifetimeScope
    {
        [SerializeField] private Settings settings = null!;

        protected override void Configure(IContainerBuilder builder)
        {
            builder.RegisterLogger();
            builder.RegisterInstance(settings).As<ISettingsDialogueBox>();
        }
    }
}