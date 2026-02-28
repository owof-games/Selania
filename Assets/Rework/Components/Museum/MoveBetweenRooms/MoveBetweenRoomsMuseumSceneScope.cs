using System.Collections.Generic;
using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;

namespace Selania.Rework.Components.Museum.MoveBetweenRooms
{
    public class MoveBetweenRoomsMuseumSceneScope : ScopeWithAutoInjectSupport
    {
        [SerializeField] [Tooltip("The ink bridge used for this section.")]
        private InkBridge inkBridge = null!;

        [SerializeField] [Tooltip("Settings of the game.")]
        private SelaniaSettings settings = null!;

        [SerializeField] private ISettingsRooms.RoomMap[] rooms = null!;

        protected override void Configure(IContainerBuilder builder)
        {
            builder.RegisterSettings(settings, settingsRooms: new SettingsRoom(rooms));
            builder.RegisterLogger();
            builder.RegisterInkBridgeInstance(inkBridge);
        }

        private class SettingsRoom : ISettingsRooms
        {
            private readonly ISettingsRooms.RoomMap[] _rooms;

            public SettingsRoom(ISettingsRooms.RoomMap[] allRooms)
            {
                _rooms = allRooms;
            }

            public ICollection<ISettingsRooms.RoomMap> rooms => _rooms;
        }
    }
}