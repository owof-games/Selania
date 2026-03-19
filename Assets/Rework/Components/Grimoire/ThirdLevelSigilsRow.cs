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
        /// <param name="glyphs">The glyphs of this sigil.</param>
        public void SetUp(string title, string firstDescriptionLine, string secondDescriptionLine,
            string thirdDescriptionLine, (ISettingsSigils.GlyphType, ISettingsSigils.GlyphType,
                ISettingsSigils.GlyphType)? glyphs)
        {
            titleTextMeshProUGUI.text = title;
            firstDescriptionLineTextMeshProUGUI.text = firstDescriptionLine;
            secondDescriptionLineTextMeshProUGUI.text = secondDescriptionLine;
            thirdDescriptionLineTextMeshProUGUI.text = thirdDescriptionLine;
            if (glyphs.HasValue)
                button.SetUp(glyphs.Value.Item1, glyphs.Value.Item2, glyphs.Value.Item3);
            else
                button.Disable();
        }

        /// <summary>
        ///     Set whether this button is activated or not.
        /// </summary>
        /// <param name="isActivated">Whether the button is activated or not.</param>
        public void SetActivated(bool isActivated)
        {
            button.SetActivated(isActivated);
        }
    }
}