using UnityEngine;
using VContainer;

namespace Selania.Rework.Components.Museum.MoveObjectsFromRoom
{
    public class MoveObjectsFromRoomScope : ScopeWithAutoInjectSupport
    {
        [SerializeField] [Tooltip("The ink bridge used for this section.")]
        private InkBridge inkBridge = null!;

        [SerializeField] [Tooltip("Settings of the game.")]
        private SelaniaSettings settings = null!;

        protected override void Configure(IContainerBuilder builder)
        {
            builder.RegisterInkBridgeInstance(inkBridge);
            builder.RegisterLogger(settings);
        }
    }
}