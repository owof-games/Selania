using System.Collections.Generic;
using UnityEngine;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     The settings relative to the dialogue box.
    /// </summary>
    public interface ISettingsDialogueBox
    {
        /// <summary>
        ///     Speed (in pixels / seconds) to make the text line slide in.
        /// </summary>
        float textLineSlideSpeed { get; }

        /// <summary>
        ///     Time to make the dialogue window slide in (in seconds).
        /// </summary>
        float slideInDuration { get; }

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
        ///     Color of the background bar when the relationship is considered bad.
        /// </summary>
        /// <seealso cref="percentageBetweenBadAndNormalRelationshipStatusBar" />
        Color badRelationshipStatusBarColor { get; }

        /// <summary>
        ///     Color of the background bar when the relationship is considered normal.
        /// </summary>
        /// <seealso cref="percentageBetweenBadAndNormalRelationshipStatusBar" />
        /// <seealso cref="percentageBetweenNormalAndGoodRelationshipStatusBar" />
        Color normalRelationshipStatusBarColor { get; }

        /// <summary>
        ///     Color of the background bar when the relationship is considered good.
        /// </summary>
        /// <seealso cref="percentageBetweenNormalAndGoodRelationshipStatusBar" />
        Color goodRelationshipStatusBarColor { get; }

        /// <summary>
        ///     How long it takes for the status bar to change color and the heart to more, in seconds.
        /// </summary>
        float statusChangeDuration { get; }

        /// <summary>
        ///     Percentage at which the relationship turns from bad to normal or viceversa.
        /// </summary>
        float percentageBetweenBadAndNormalRelationshipStatusBar { get; }

        /// <summary>
        ///     Percentage at which the relationship turns from norma to good or viceversa.
        /// </summary>
        float percentageBetweenNormalAndGoodRelationshipStatusBar { get; }

        /// <summary>
        ///     Percentage at which the heart turns from broken to normal or viceversa.
        /// </summary>
        float percentageBetweenBrokenAndNormalHeart { get; }

        /// <summary>
        ///     Percentage at which the heart turns from normal to great or viceversa.
        /// </summary>
        float percentageBetweenNormalAndGreatHeart { get; }

        /// <summary>
        ///     A mapping between character names (FirstCharacter, SecondCharacter, ...) and the relative ink variable.
        /// </summary>
        IEnumerable<(string Character, string InkVariable)> characterInkVariables { get; }

        /// <summary>
        ///     Get the color of the character by mood.
        /// </summary>
        /// <param name="character">The character (FirstCharacter, SecondCharacter, ...)</param>
        /// <returns>The color for this character.</returns>
        Color GetCharacterTagColor(string character);

        /// <summary>
        ///     Get the character sprite.
        /// </summary>
        /// <param name="character">The character (FirstCharacter, SecondCharacter, ...)</param>
        /// <param name="mood">The mood tag (neutral, bored, ...)</param>
        /// <returns>The sprite for this tag.</returns>
        Sprite GetMoodSprite(string character, string mood);

        /// <summary>
        ///     Check whether the given character data is known.
        /// </summary>
        /// <param name="character">Character name.</param>
        /// <param name="moodTag">The mood tag (neutral, bored, ...)</param>
        /// <returns><c>true</c> if the couple character + mood is known, <c>false</c> otherwise.</returns>
        bool VerifyCharacterData(string character, string moodTag);

        /// <summary>
        ///     Get the sprite that corresponds to the given name. This is used for images inserted in the dialogue.
        /// </summary>
        /// <param name="spriteName">Name of the sprite.</param>
        /// <returns>Sprite to use, or <c>null</c> if no sprite with the given name was found.</returns>
        Sprite? GetDialogueSprite(string spriteName);
    }
}