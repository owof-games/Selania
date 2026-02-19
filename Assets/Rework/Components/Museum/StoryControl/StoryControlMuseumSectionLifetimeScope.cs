using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;

namespace Selania.Rework.Components.Museum.StoryControl
{
    public class StoryControlMuseumSectionLifetimeScope : ScopeWithAutoInjectSupport
    {
        [SerializeField] [Tooltip("Settings of the game.")]
        private SelaniaSettings settings = null!;

        [SerializeField] [Tooltip("The ink bridge used for this section.")]
        private InkBridge inkBridge = null!;

        protected override void Configure(IContainerBuilder builder)
        {
            builder.RegisterLogger(settings);
            builder.RegisterInkBridgeInstance(inkBridge);
            builder.RegisterInstance(settings).As<ISettingsDialogueBox>();
        }
    }
}