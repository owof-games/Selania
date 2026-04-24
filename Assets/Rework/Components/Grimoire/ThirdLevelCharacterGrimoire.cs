using Microsoft.Extensions.Logging;
using TMPro;
using UnityEngine;
using VContainer;

namespace Selania.Rework.Components.Grimoire
{
    public class ThirdLevelCharacterGrimoire : MonoBehaviour, IAutomaticEditorInject
    {
        [SerializeField] private TMP_Text leftPageText = null!;
        [SerializeField] private TMP_Text rightPageText = null!;

        [Inject] internal ILogger<ThirdLevelCharacterGrimoire> Logger = null!;

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
            if (leftPageText.text == text) return; // do not update neither reset if the text didn't change
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
    }
}