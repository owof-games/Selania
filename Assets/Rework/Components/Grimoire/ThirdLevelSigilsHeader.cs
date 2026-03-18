using Selania.Rework.Interfaces;
using TMPro;
using UnityEngine;

namespace Selania.Rework.Components.Grimoire
{
    /// <summary>
    ///     The component that handles the header of the third level sigils page.
    /// </summary>
    public class ThirdLevelSigilsHeader : MonoBehaviour
    {
        [Tooltip("The title of this header")] [SerializeField]
        private TextMeshProUGUI titleTextMeshProUGUI = null!;

        [Tooltip("The subtitle of this header")] [SerializeField]
        private TextMeshProUGUI subtitleTextMeshProUGUI = null!;

        [Tooltip("The icon inside this header.")] [SerializeField]
        private ThirdLevelSigilIcon thirdLevelSigilIcon = null!;

        /// <summary>
        ///     Set up the header.
        /// </summary>
        /// <param name="title">Title of this page.</param>
        /// <param name="subtitle">Subtitle of this page.</param>
        /// <param name="glyph1">First-level glyph for this page.</param>
        /// <param name="glyph2">Second-level glyph for this page.</param>
        public void SetUp(string title, string subtitle, ISettingsSigils.GlyphType glyph1,
            ISettingsSigils.GlyphType glyph2)
        {
            titleTextMeshProUGUI.text = title;
            subtitleTextMeshProUGUI.text = subtitle;
            thirdLevelSigilIcon.SetGlyphs(glyph1, glyph2);
        }
    }
}