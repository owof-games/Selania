using Selania.Rework.Interfaces;
using UnityEngine;
using UnityEngine.UI;
using VContainer;

namespace Selania.Rework.Components.Grimoire
{
    /// <summary>
    ///     Handler for setting up the third level sigils buttons.
    /// </summary>
    public class ThirdLevelSigilsButton : MonoBehaviour, IAutomaticEditorInject
    {
        [SerializeField] private Image firstLevelImage = null!;
        [SerializeField] private Image secondLevelImage = null!;
        [SerializeField] private Image thirdLevelImage = null!;
        [Inject] internal ISettingsSigils SettingsSigils = null!;

        /// <summary>
        ///     Set up the currently showed sigil in the button.
        /// </summary>
        /// <param name="glyph1">First-level glyph.</param>
        /// <param name="glyph2">Second-level glyph</param>
        /// <param name="glyph3">Third-level glyph</param>
        public void SetUp(ISettingsSigils.GlyphType glyph1, ISettingsSigils.GlyphType glyph2,
            ISettingsSigils.GlyphType glyph3)
        {
            firstLevelImage.sprite = SettingsSigils.GetGlyphSprite(glyph1, 0);
            secondLevelImage.sprite = SettingsSigils.GetGlyphSprite(glyph2, 1);
            thirdLevelImage.sprite = SettingsSigils.GetGlyphSprite(glyph3, 2);
            firstLevelImage.color = SettingsSigils.GetGlyphColor(glyph1);
            secondLevelImage.color = SettingsSigils.GetGlyphColor(glyph2);
            thirdLevelImage.color = SettingsSigils.GetGlyphColor(glyph3);
        }
    }
}