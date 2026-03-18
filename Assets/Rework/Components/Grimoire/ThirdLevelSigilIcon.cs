using Selania.Rework.Interfaces;
using UnityEngine;
using UnityEngine.UI;
using VContainer;

namespace Selania.Rework.Components.Grimoire
{
    /// <summary>
    ///     The icon on top of the third level page for sigils.
    /// </summary>
    public class ThirdLevelSigilIcon : MonoBehaviour, IAutomaticEditorInject
    {
        [SerializeField] private Image firstLevelGlyphImage = null!;
        [SerializeField] private Image secondLevelGlyphImage = null!;
        [Inject] internal ISettingsSigils SettingsSigils = null!;

        /// <summary>
        ///     Set the correct image for this sigil.
        /// </summary>
        /// <param name="glyph1">First-level glyph for the sigil.</param>
        /// <param name="glyph2">Second-level glyph for the sigil.</param>
        public void SetGlyphs(ISettingsSigils.GlyphType glyph1, ISettingsSigils.GlyphType glyph2)
        {
            firstLevelGlyphImage.sprite = SettingsSigils.GetGlyphSprite(glyph1, 0);
            firstLevelGlyphImage.color = SettingsSigils.GetGlyphColor(glyph1);
            secondLevelGlyphImage.sprite = SettingsSigils.GetGlyphSprite(glyph2, 1);
            secondLevelGlyphImage.color = SettingsSigils.GetGlyphColor(glyph2);
        }
    }
}