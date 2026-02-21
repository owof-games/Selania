using System;
using System.Collections.Generic;
using Alchemy.Inspector;
using UnityEngine;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     Settings related to the rooms.
    /// </summary>
    public interface ISettingsRooms
    {
        /// <summary>
        ///     A map between room names and the prefabs to instantiate with their content.
        /// </summary>
        public ICollection<RoomMap> rooms { get; }

        /// <summary>
        ///     A map between a room name and its prefab.
        /// </summary>
        [Serializable]
        public class RoomMap
        {
            /// <summary>
            ///     Name of the room.
            /// </summary>
            public string name = null!;

            /// <summary>
            ///     Prefab to instantiate for the room.
            /// </summary>
            [AssetsOnly] public GameObject prefab = null!;
        }
    }
}