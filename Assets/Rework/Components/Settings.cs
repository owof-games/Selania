using Selania.Rework.Interfaces;
using UnityEngine;

namespace Selania.Rework.Components
{
    [CreateAssetMenu(fileName = "Settings", menuName = "Selania/Settings")]
    public class Settings : ScriptableObject, ISettingsDialogueBox
    {
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
    }
}