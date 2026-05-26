using R3;
using Selania.Rework.Interfaces;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

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

        private string? _title;

        /// <summary>
        ///     An observable that produces the title of this row whenever the button is clicked (or empty string if
        ///     the title is not set, see <see cref="SetUp"/>).
        /// </summary>
        public Observable<string> Click
        {
            get
            {
                var grimoireButtonHelper = button.GetComponent<GrimoireButtonHelper>();
                return button.GetComponent<Button>()
                    .OnClickAsObservable()
                    .Where(_ => grimoireButtonHelper.Interactable && !grimoireButtonHelper.LogicallyDisabled)
                    .Select(_ => _title ?? "");
            }
        }

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
            _title = title;
            titleTextMeshProUGUI.text = _title;
            firstDescriptionLineTextMeshProUGUI.text = firstDescriptionLine;
            secondDescriptionLineTextMeshProUGUI.text = secondDescriptionLine;
            thirdDescriptionLineTextMeshProUGUI.text = thirdDescriptionLine;
            if (glyphs.HasValue)
                button.SetUp(glyphs.Value.Item1, glyphs.Value.Item2, glyphs.Value.Item3);
            else
                button.Disable();
        }

        /// <summary>
        /// Set the status of the button.
        /// </summary>
        /// <param name="status">The status of the button.</param>
        public void SetStatus(IStoryGrimoire.ThirdLevelSigilStatus status)
        {
            button.SetStatus(status);
        }
    }
}