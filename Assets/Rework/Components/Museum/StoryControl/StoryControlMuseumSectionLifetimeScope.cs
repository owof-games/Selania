using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;
using VContainer.Unity;

namespace Selania.Rework.Components.Museum.StoryControl
{
    public class StoryControlMuseumSectionLifetimeScope : LifetimeScope
    {
        [SerializeField] [Tooltip("Settings of the game.")]
        private SelaniaSettings settings = null!;

        [SerializeField] [Tooltip("The ink bridge used for this section.")]
        private InkBridge inkBridge = null!;

        protected override void Configure(IContainerBuilder builder)
        {
            Debug.Log("ma seri?");
            builder.RegisterLogger(settings);
            builder.RegisterInkBridgeInstance(inkBridge);
            builder.RegisterInstance(settings).As<ISettingsDialogueBox>();
        }
    }
}