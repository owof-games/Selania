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
        /// <param name="glyphs">The two glyphs for this page, or <c>null</c> if it's locked.</param>
        public void SetUp(string title, string subtitle, (ISettingsSigils.GlyphType, ISettingsSigils.GlyphType)? glyphs)
        {
            titleTextMeshProUGUI.text = title;
            subtitleTextMeshProUGUI.text = subtitle;
            if (glyphs.HasValue)
                thirdLevelSigilIcon.SetGlyphs(glyphs.Value.Item1, glyphs.Value.Item2);
            else
                thirdLevelSigilIcon.Locked();
        }
    }
}