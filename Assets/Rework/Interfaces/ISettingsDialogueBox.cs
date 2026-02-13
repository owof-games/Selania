using UnityEngine;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     The settings relative to the dialogue box.
    /// </summary>
    public interface ISettingsDialogueBox
    {
        /// <summary>
        ///     Duration (in seconds) to make the text line slide in.
        /// </summary>
        float textLineSlideDuration { get; }

        /// <summary>
        ///     Percentage of indentation (relative to the total horizontal text space) for the text of the choices.
        ///     Used to keep the text of choices aligned, at the right of their number.
        /// </summary>
        int choiceIndentationPercentage { get; }

        /// <summary>
        ///     Default color for choices, where it's not selected or hovered.
        /// </summary>
        Color defaultChoiceColor { get; }

        /// <summary>
        ///     Color for when a choice is selected.
        /// </summary>
        Color selectedChoiceColor { get; }

        /// <summary>
        ///     Color for when a choice has the cursor hovering on it.
        /// </summary>
        Color hoveredChoiceColor { get; }

        /// <summary>
        ///     Get the color to use to write the character tag on the dialogue.
        /// </summary>
        /// <param name="characterName">Name of the character.</param>
        /// <returns>Color to use.</returns>
        Color GetCharacterTagColorByName(string characterName);
    }
}