using Selania.Rework.Interfaces;
using TMPro;
using UnityEngine;

namespace Selania.Rework.Components.Grimoire
{
    public class ThirdLevelSigilsRow : MonoBehaviour
    {
        [Tooltip("Button showing the current sigil.")] [SerializeField]
        private ThirdLevelSigilsButton button = null!;

        [Tooltip("Text element for the title")] [SerializeField]
        private TextMeshProUGUI titleTextMeshProUGUI = null!;

        [Tooltip("Text element for the first description line")] [SerializeField]
        private TextMeshProUGUI firstDescriptionLineTextMeshProUGUI = null!;

        [Tooltip("Text element for the second description line")] [SerializeField]
        private TextMeshProUGUI secondDescriptionLineTextMeshProUGUI = null!;

        [Tooltip("Text element for the third description line")] [SerializeField]
        private TextMeshProUGUI thirdDescriptionLineTextMeshProUGUI = null!;

        /// <summary>
        ///     Set up the row.
        /// </summary>
        /// <param name="title">Title of the row.</param>
        /// <param name="firstDescriptionLine">First description line for the row.</param>
        /// <param name="secondDescriptionLine">Second description line for the row.</param>
        /// <param name="thirdDescriptionLine">Third description line for the row.</param>
        /// <param name="glyph1">First-level glyph of the sigil.</param>
        /// <param name="glyph2">Second-level glyph of the sigil.</param>
        /// <param name="glyph3">Third-level glyph of the sigil.</param>
        public void SetUp(string title, string firstDescriptionLine, string secondDescriptionLine,
            string thirdDescriptionLine, ISettingsSigils.GlyphType glyph1, ISettingsSigils.GlyphType glyph2,
            ISettingsSigils.GlyphType glyph3)
        {
            titleTextMeshProUGUI.text = title;
            firstDescriptionLineTextMeshProUGUI.text = firstDescriptionLine;
            secondDescriptionLineTextMeshProUGUI.text = secondDescriptionLine;
            thirdDescriptionLineTextMeshProUGUI.text = thirdDescriptionLine;
            button.SetUp(glyph1, glyph2, glyph3);
        }
    }
}