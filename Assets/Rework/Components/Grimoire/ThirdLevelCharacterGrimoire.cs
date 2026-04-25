using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using VContainer;

namespace Selania.Rework.Components.Grimoire
{
    public class ThirdLevelCharacterGrimoire : MonoBehaviour, IAutomaticEditorInject
    {
        [SerializeField] private TMP_Text leftPageText = null!;
        [SerializeField] private TMP_Text rightPageText = null!;

        [SerializeField] private Image iconImage = null!;
        [SerializeField] private Image leftBackground = null!;
        [SerializeField] private Image rightBackground = null!;
        [SerializeField] private TMP_Text titleTMPro = null!;
        [SerializeField] private TMP_Text descriptionTMPro = null!;

        [Inject] internal ILogger<ThirdLevelCharacterGrimoire> Logger = null!;
        [Inject] internal ISettingsBook SettingsBook = null!;

        /// <summary>
        /// Whether there's a next page to turn to.
        /// </summary>
        public bool canTurnToNextPage => rightPageText.pageToDisplay < leftPageText.textInfo.pageCount; // 1-based!

        /// <summary>
        /// Whether there's a previous page to turn to.
        /// </summary>
        public bool canTurnToPreviousPage => leftPageText.pageToDisplay > 1; // 1-based!

        /// <summary>
        /// Sets the current text of the pages, resetting to the first page.
        /// </summary>
        /// <param name="text">The full text to display</param>
        public void SetText(string text)
        {
            if (leftPageText.text == text) return; // do not update nor reset if the text didn't change
            leftPageText.text = text;
            rightPageText.text = text;
            leftPageText.pageToDisplay = 1; // 1-based!
            rightPageText.pageToDisplay = 2;
        }

        /// <summary>
        /// Move to the next page, if there's one.
        /// </summary>
        public void NextPage()
        {
            if (!canTurnToNextPage) return;
            leftPageText.pageToDisplay += 2;
            rightPageText.pageToDisplay += 2;
        }

        /// <summary>
        /// Move to the previous page, if there's one.
        /// </summary>
        public void PreviousPage()
        {
            if (!canTurnToPreviousPage) return;
            leftPageText.pageToDisplay -= 2;
            rightPageText.pageToDisplay -= 2;
        }

        /// <summary>
        ///     Set the contents of the header.
        /// </summary>
        /// <param name="iconName">Name of the icon (see <see cref="ISettingsBook.GetThirdLevelTextIcon" />).</param>
        /// <param name="styleName">
        ///     Name of the style (see <see cref="ISettingsBook.GetThirdLevelTextLeftRightBackgroundByStyle" />
        ///     ).
        /// </param>
        /// <param name="title">Title of the page.</param>
        /// <param name="description">Description of the page.</param>
        public void SetHeader(string iconName, string styleName, string title, string description)
        {
            titleTMPro.text = title;
            descriptionTMPro.text = description;
            iconImage.sprite = SettingsBook.GetThirdLevelTextIcon(iconName);
            var leftAndRight = SettingsBook.GetThirdLevelTextLeftRightBackgroundByStyle(styleName);
            if (leftAndRight == null)
            {
                leftBackground.sprite = null;
                rightBackground.sprite = null;
            }
            else
            {
                var (left, right) = leftAndRight.Value;
                leftBackground.sprite = left;
                rightBackground.sprite = right;
            }
        }
    }
}