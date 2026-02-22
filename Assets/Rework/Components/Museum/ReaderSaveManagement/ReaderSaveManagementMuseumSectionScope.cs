using UnityEngine;
using VContainer;

namespace Selania.Rework.Components.Museum.ReaderSaveManagement
{
    public class ReaderSaveManagementMuseumSectionScope : ScopeWithAutoInjectSupport
    {
        [SerializeField] [Tooltip("Settings of the game.")]
        private SelaniaSettings settings = null!;

        [SerializeField] [Tooltip("The ink bridge used for this section.")]
        private InkBridge inkBridge = null!;

        protected override void Configure(IContainerBuilder builder)
        {
            builder.RegisterSettings(settings);
            builder.RegisterLogger(settings);
            builder.RegisterInkBridgeInstance(inkBridge, "museum_reader_mode_save_dir_");
        }
    }
}