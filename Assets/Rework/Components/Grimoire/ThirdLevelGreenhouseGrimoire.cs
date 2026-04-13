using R3;
using TMPro;
using UnityEngine;

namespace Selania.Rework.Components.Grimoire
{
    public class ThirdLevelGreenhouseGrimoire : MonoBehaviour
    {
        [SerializeField] [Tooltip("Header for the left page.")]
        private ThirdLevelGreenhouseHeader leftHeader = null!;

        [SerializeField] [Tooltip("Text for the left page.")]
        private TextMeshProUGUI leftText = null!;

        [SerializeField] [Tooltip("Header for the right page.")]
        private ThirdLevelGreenhouseHeader rightHeader = null!;

        [SerializeField] [Tooltip("Text for the right page.")]
        private TextMeshProUGUI rightText = null!;

        /// <summary>
        /// An observable producing "true" when the left button is clicked, "false" when the right button is clicked.
        /// </summary>
        public Observable<bool> clickedOnLeft =>
            leftHeader.click.Select(_ => true).Merge(rightHeader.click.Select(_ => false));

        /// <summary>
        ///     Disable a page.
        /// </summary>
        /// <param name="isLeft">Whether the page to disable is the left one.</param>
        public void DisablePage(bool isLeft)
        {
            (isLeft ? leftHeader : rightHeader).DisableHeader();
            (isLeft ? leftText : rightText).text = "";
        }

        /// <summary>
        ///     Hide a page.
        /// </summary>
        /// <param name="isLeft">Whether the page to hide is the left one.</param>
        public void HidePage(bool isLeft)
        {
            (isLeft ? leftHeader : rightHeader).HideHeader();
            (isLeft ? leftText : rightText).text = "";
        }

        /// <summary>
        ///     Fill one of the two pages with given information.
        /// </summary>
        /// <param name="isLeft">Whether this is the left or right page.</param>
        /// <param name="title">Text for the title.</param>
        /// <param name="isOwned">Whether the plant is owned.</param>
        /// <param name="buttonStatus">Button status.</param>
        /// <param name="plantName">Name of the plant.</param>
        /// <param name="text">Text of the page.</param>
        public void FillPage(bool isLeft, string title, bool isOwned, ThirdLevelGreenhouseButton.Status buttonStatus,
            string plantName, string text)
        {
            var header = isLeft ? leftHeader : rightHeader;
            var textMeshPro = isLeft ? leftText : rightText;

            header.FillHeader(title, isOwned, buttonStatus, plantName);
            textMeshPro.text = text;
        }
    }
}