using System;
using UnityEngine;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     Info about the necessary information for a single character.
    /// </summary>
    [Serializable]
    public class CharacterDialogueInfo
    {
        [field: SerializeField]
        [field: Tooltip("The name of the character.")]
        public string name { get; private set; } = null!;

        [field: SerializeField]
        [field: Tooltip("The color which is used to write the character's name.")]
        public Color color { get; private set; } = Color.black;
    }
}