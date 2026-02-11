using System;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using Debug = System.Diagnostics.Debug;

namespace Selania.Rework.Components.Museum
{
    public class Museum : MonoBehaviour
    {
        [Header("General Setup")]
        [SerializeField]
        [Tooltip("The game object containing the buttons to load a museum section.")]
        private GameObject buttonsGrid = null!;

        [SerializeField] [Tooltip("The prefab to create museum buttons")]
        private GameObject museumButtonPrefab = null!;

        [SerializeField] [Tooltip("Container for the elements that must be visible only inside a section.")]
        private GameObject sectionButtonsContainer = null!;

        [SerializeField] [Tooltip("The button used to get back from a museum section.")]
        private Button backButton = null!;

        [SerializeField] [Tooltip("The button used to open up the description text.")]
        private Button infoButton = null!;

        [SerializeField] [Tooltip("The section description panel.")]
        private GameObject sectionDescriptionPanel = null!;

        [Header("Museum Sections")] [SerializeField] [Tooltip("The various museum sections.")]
        private SectionInfo[] sectionInfo = { };

        /// <summary>
        ///     The currently loaded section, if any. Otherwise, if on the main room of the museum, <c>null</c>.
        /// </summary>
        private GameObject? _currentSection;

        /// <summary>
        ///     The description of the section we're currently in.
        /// </summary>
        private string? _currentSectionDescription;

        /// <summary>
        ///     The text mesh pro object that is used to display the section description text.
        /// </summary>
        private TextMeshProUGUI? _sectionDescriptionText;

        private void Start()
        {
            // fill the buttons grid
            foreach (var info in sectionInfo)
            {
                var museumButtonGameObject = Instantiate(museumButtonPrefab, buttonsGrid.transform);
                var museumButton = museumButtonGameObject.GetComponent<MuseumButton>();
                museumButton.SetText(info.title);
                museumButton.OnClick(MoveToSection, info);
            }

            // extract sub-objects and components
            _sectionDescriptionText = sectionDescriptionPanel.GetComponentInChildren<TextMeshProUGUI>();

            // register to all button clicks - no need to unregister, since it will happen when this scene is un-loaded
            backButton.onClick.AddListener(BackToMainRoom);
            infoButton.onClick.AddListener(ToggleSectionInfo);
        }

        private void ToggleSectionInfo()
        {
            if (sectionDescriptionPanel.activeSelf)
            {
                sectionDescriptionPanel.SetActive(false);
            }
            else
            {
                sectionDescriptionPanel.SetActive(true);
                Debug.Assert(_sectionDescriptionText != null, nameof(_sectionDescriptionText) + " != null");
                Debug.Assert(_currentSectionDescription != null, nameof(_currentSectionDescription) + " != null");
                _sectionDescriptionText.text = _currentSectionDescription;
            }
        }

        /// <summary>
        ///     Move from the main hall to a museum section.
        /// </summary>
        /// <param name="info">Info about the section to go to.</param>
        private void MoveToSection(SectionInfo info)
        {
            // switch visibility of GUI elements
            buttonsGrid.SetActive(false);
            sectionButtonsContainer.SetActive(true);
            // set up the section
            _currentSection = Instantiate(info.prefab, transform);
            _currentSectionDescription = info.description;
        }

        /// <summary>
        ///     Move from a museum section back to the main hall.
        /// </summary>
        private void BackToMainRoom()
        {
            // clean up the current section
            Destroy(_currentSection);
            sectionDescriptionPanel.SetActive(false);
            _currentSectionDescription = null;
            // revert GUI to the one of the main hall
            buttonsGrid.SetActive(true);
            sectionButtonsContainer.SetActive(false);
        }

        [Serializable]
        private class SectionInfo
        {
            [Tooltip("The prefab that contains the museum section")]
            public GameObject prefab = null!;

            [Tooltip("The name of the museum section that will appear on the button.")]
            public string title = null!;

            [Tooltip("The description of the museum section that will appear when asking for info inside the section.")]
            [TextArea(3, 10)]
            public string description = null!;
        }
    }
}