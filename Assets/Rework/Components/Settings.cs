using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Selania.Rework.Interfaces;
using UnityEngine;

namespace Selania.Rework.Components
{
    [CreateAssetMenu(fileName = "Settings", menuName = "Selania/Settings")]
    public class Settings : ScriptableObject, ISettingsDialogueBox
    {
        [field: SerializeField]
        [field: Tooltip("Default color for character tags in dialogue.")]
        public Color defaultCharacterColor { get; private set; } = Color.black;

        [field: SerializeField] [field: Tooltip("Info about every character who can have dialogue lines.")]
        private CharacterDialogueInfo[] characterDialogueInfo = Array.Empty<CharacterDialogueInfo>();

        /// <summary>
        ///     The backing property for <see cref="characterDialogueLabelColors" />.
        /// </summary>
        private IDictionary<string, Color>? _characterDialogueLabelColors;

        /// <summary>
        ///     Hash of <see cref="characterDialogueInfo" /> from the last time we've transformed it into
        ///     <see cref="characterDialogueLabelColors" />.
        /// </summary>
        private int _lastCharacterDialogueInfoHash;

        /// <summary>
        ///     A map between character names and their tag colors.
        /// </summary>
        private IDictionary<string, Color> characterDialogueLabelColors
        {
            get
            {
                // TODO: in play mode, it's not necessary to keep updating the dictionary

                // check if we can re-use the dictionary.
                var hash = ((IStructuralEquatable)characterDialogueInfo).GetHashCode(
                    EqualityComparer<CharacterDialogueInfo>.Default);
                if (_characterDialogueLabelColors != null && _lastCharacterDialogueInfoHash == hash)
                    return _characterDialogueLabelColors;

                // we need to re-build the dictionary
                _characterDialogueLabelColors = characterDialogueInfo.ToDictionary(
                    info => info.name,
                    info => info.color);
                _lastCharacterDialogueInfoHash = hash;

                return _characterDialogueLabelColors;
            }
        }

        /// <inheritdoc />
        [Header("Dialogue Box")]
        [field: SerializeField]
        [field: Tooltip("Duration (in seconds) to make the text line slide in.")]
        public float textLineSlideDuration { get; private set; } = 0.3f;

        /// <inheritdoc />
        [field: SerializeField]
        [field:
            Tooltip(
                "Percentage of indentation (relative to the total horizontal text space) for the text of the choices. Used to keep the text of choices aligned, at the right of their number.")]
        public int choiceIndentationPercentage { get; private set; } = 10;

        /// <inheritdoc />
        [field: SerializeField]
        [field: Tooltip("Default color for choices, where it's not selected / hovered.")]
        public Color defaultChoiceColor { get; private set; } = Color.blue;

        /// <inheritdoc />
        [field: SerializeField]
        [field: Tooltip("Color for when a choice is selected / hovered.")]
        public Color selectedChoiceColor { get; private set; } = Color.lightBlue;

        /// <inheritdoc />
        public Color GetCharacterTagColorByName(string characterName)
        {
            return characterDialogueLabelColors.TryGetValue(characterName, out var color)
                ? color
                : defaultCharacterColor;
        }
    }
}