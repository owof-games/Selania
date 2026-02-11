using UnityEngine;
using VContainer;
using VContainer.Unity;

namespace Selania.Rework.Components.Museum.MoveObjectsFromRoom
{
    public class MoveObjectsFromRoomScope : LifetimeScope
    {
        [SerializeField] [Tooltip("The ink bridge used for this section.")]
        private InkBridge inkBridge = null!;

        protected override void Configure(IContainerBuilder builder)
        {
            builder.RegisterInkBridgeInstance(inkBridge);
            builder.RegisterLogger();
        }
    }
}