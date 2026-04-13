using R3;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Selania.Rework.Components.Grimoire
{
    public class ThirdLevelGreenhouseHeader : MonoBehaviour
    {
        [SerializeField] private ThirdLevelGreenhouseButton button = null!;
        [SerializeField] private TextMeshProUGUI titleTextMeshProUGUI = null!;
        [SerializeField] private TextMeshProUGUI subtitledConsumedTextMeshProUGUI = null!;
        [SerializeField] private TextMeshProUGUI subtitledOwnedTextMeshProUGUI = null!;
        [SerializeField] private Image box = null!;

        private Button? _actualButton;

        public Observable<Unit> click => button.click;

        private Button GetButton()
        {
            _actualButton ??= button.GetComponent<Button>();
            return _actualButton;
        }

        /// <summary>
        ///     Disable the header (show the lock).
        /// </summary>
        public void DisableHeader()
        {
            box.gameObject.SetActive(true);
            button.gameObject.SetActive(true);
            GetButton().interactable = false;
            titleTextMeshProUGUI.gameObject.SetActive(false);
            subtitledConsumedTextMeshProUGUI.gameObject.SetActive(false);
            subtitledOwnedTextMeshProUGUI.gameObject.SetActive(false);
        }

        /// <summary>
        ///     Completely hide the header.
        /// </summary>
        public void HideHeader()
        {
            box.gameObject.SetActive(false);
            button.gameObject.SetActive(false);
            titleTextMeshProUGUI.gameObject.SetActive(false);
            subtitledConsumedTextMeshProUGUI.gameObject.SetActive(false);
            subtitledOwnedTextMeshProUGUI.gameObject.SetActive(false);
        }

        /// <summary>
        ///     Fill the header with given information.
        /// </summary>
        /// <param name="title">Text for the title.</param>
        /// <param name="isOwned">Whether the plant is owned.</param>
        /// <param name="buttonStatus">Button status.</param>
        /// <param name="plantName">Name of the plant.</param>
        public void FillHeader(string title, bool isOwned, ThirdLevelGreenhouseButton.Status buttonStatus,
            string plantName)
        {
            box.gameObject.SetActive(true);
            button.gameObject.SetActive(true);
            GetButton().interactable = true;
            titleTextMeshProUGUI.gameObject.SetActive(true);
            subtitledConsumedTextMeshProUGUI.gameObject.SetActive(!isOwned);
            subtitledOwnedTextMeshProUGUI.gameObject.SetActive(isOwned);

            titleTextMeshProUGUI.text = title;
            button.SetStatus(buttonStatus);
            button.SetImage(plantName);
        }
    }
}