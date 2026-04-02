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
        ///     Get the sprite corresponding to the given name.
        /// </summary>
        /// <param name="plantName">Name of the plant, as present in the ink list.</param>
        /// <returns>The sprite name.</returns>
        public Sprite? GetGreenhouseSprite(string plantName);
    }
}