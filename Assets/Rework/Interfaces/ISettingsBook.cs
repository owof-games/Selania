using UnityEngine;

namespace Selania.Rework.Interfaces
{
    public interface ISettingsBook
    {
        /// <summary>
        ///     The multiplier to apply to the page-switch animation.
        /// </summary>
        public float switchPageAnimationSpeedMultiplier { get; }

        /// <summary>
        ///     The saturation level (0..1) for the exhausted version of the greenhouse buttons.
        /// </summary>
        public float exhaustedGreenhouseButtonSaturationLevel { get; }

        /// <summary>
        ///     Saturation level for disabled sigils.
        /// </summary>
        public float disabledSigilsSaturationLevel { get; }

        /// <summary>
        /// Maximum value for the Ink variables containing choice counters.
        /// </summary>
        public float maxChoiceVariableValue { get; }

        /// <summary>
        /// Minimum value for the Ink variables containing choice counters.
        /// </summary>
        public float minChoiceVariableValue { get; }

        /// <summary>
        /// Duration of a single cycle for the pentacle animation.
        /// </summary>
        public float choiceVariablePentacleAnimationDuration { get; }

        /// <summary>
        ///     Get the sprite corresponding to the given name.
        /// </summary>
        /// <param name="plantName">Name of the plant, as present in the ink list.</param>
        /// <returns>The sprite.</returns>
        public Sprite? GetGreenhouseSprite(string plantName);

        /// <summary>
        ///     Get the sprite corresponding to given portrait, or <c>null</c> if the portrait is not found.
        /// </summary>
        /// <param name="characterName">Name of the character.</param>
        /// <returns>The sprite.</returns>
        public Sprite? GetCharacterPortrait(string characterName);

        /// <summary>
        ///     Get the left and right background sprites for the third level text.
        /// </summary>
        /// <param name="styleName">Style name.</param>
        /// <returns>A couple (left sprite, right sprite) for the backgrounds, or <c>null</c> if the style was not found.</returns>
        public (Sprite, Sprite)? GetThirdLevelTextLeftRightBackgroundByStyle(string styleName);

        /// <summary>
        ///     Get the sprite for the icon in the third level text.
        /// </summary>
        /// <param name="iconName">The icon name.</param>
        /// <returns>The corresponding sprite, or <c>null</c> if the sprite was not found.</returns>
        public Sprite? GetThirdLevelTextIcon(string iconName);
    }
}