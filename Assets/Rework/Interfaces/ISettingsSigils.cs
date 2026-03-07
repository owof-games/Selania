using UnityEngine;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     The part of the settings pertaining to the sigils.
    /// </summary>
    public interface ISettingsSigils
    {
        /// <summary>
        ///     Types of glyph.
        /// </summary>
        enum GlyphType
        {
            Air,
            Water,
            Earth,
            Fire,
            Aether
        }

        /// <summary>
        ///     Get the sprite corresponding to the given glyph.
        /// </summary>
        /// <param name="glyphType">The glyph.</param>
        /// <param name="position">The position (0, 1 or 2).</param>
        /// <returns>The sprite containing that glyph image.</returns>
        Sprite GetGlyphSprite(GlyphType glyphType, int position);

        /// <summary>
        ///     Get the color of the glyph.
        /// </summary>
        /// <param name="glyphType">The type of the glyph.</param>
        /// <returns>The color of the glyph.</returns>
        Color GetGlyphColor(GlyphType glyphType);
    }
}