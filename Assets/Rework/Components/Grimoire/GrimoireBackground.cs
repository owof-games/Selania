using System;
using System.Linq;
using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using TMPro;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.Grimoire
{
    public class GrimoireBackground : MonoBehaviour, IAutomaticEditorInject
    {
        private static readonly int Opened = Animator.StringToHash("Opened");

        [Tooltip("List of buttons controlled by Ink")] [SerializeField]
        private LeftButtonDescriptor[] leftButtonDescriptors = null!;

        [Tooltip("Invoked when the grimoire is asked to close.")] [SerializeField]
        private UnityEvent close = new();

        [Tooltip("Invoked when the index button has been clicked")] [SerializeField]
        private UnityEvent goToIndex = new();

        [Tooltip("Invoked when the button to go back to level two has been clicked")] [SerializeField]
        private UnityEvent goBackToLevelTwo = new();

        [Tooltip("Invoked when the 'previous' button has been clicked")] [SerializeField]
        private UnityEvent goPrevious = new();

        [Tooltip("Invoked when the 'next' button has been clicked")] [SerializeField]
        private UnityEvent goNext = new();

        [SerializeField] private GameObject loadButtonContainer = null!;

        [SerializeField] private GameObject gamerModeAchievementsContainer = null!;

        [SerializeField] private AchievementAmount[] gamerModeAchievements = null!;

        [SerializeField] private GameObject readerModeAchievementsContainer = null!;

        [SerializeField] private AchievementAmount[] readerModeAchievements = null!;

        [SerializeField] private Image francoImage = null!;

        [SerializeField] private TextMeshProUGUI francoText = null!;

        [Tooltip("game object that contains the whole sigil structure and text.")] [SerializeField]
        private GameObject sigilRoot = null!;

        [Tooltip("image representing the sigil in first position.")] [SerializeField]
        private Image sigilFirstPosition = null!;

        [Tooltip("image representing the sigil in second position.")] [SerializeField]
        private Image sigilSecondPosition = null!;

        [Tooltip("image representing the sigil in third position.")] [SerializeField]
        private Image sigilThirdPosition = null!;

        [Tooltip("Text explaining how many usages are remaining of the sigil.")] [SerializeField]
        private TextMeshProUGUI sigilUsagesTextMeshPro = null!;

        [SerializeField] [Tooltip("Game object containing the button for the index bookmark.")]
        private GameObject indexBookmarkButton = null!;

        [SerializeField] [Tooltip("Game object containing the button for the 'back to level two' bookmark.")]
        private GameObject backToLevelTwoBookmarkButton = null!;

        [SerializeField] [Tooltip("Game object containing the button for the 'previous page' bookmark.")]
        private GameObject previousPageBookmarkButton = null!;

        [SerializeField] [Tooltip("Game object containing the button for the 'next page' bookmark.")]
        private GameObject nextPageBookmarkButton = null!;

        private Animator _animator = null!;

        private TextMeshProUGUI _backToLevelTwoTextMeshPro = null!;
        private TextMeshProUGUI _nextPageTextMeshPro = null!;
        private TextMeshProUGUI _previousPageTextMeshPro = null!;

        [Inject] internal ILogger<GrimoireBackground> Logger = null!;

        [Inject] internal ISettingsSigils SettingsSigils = null!;

        private void Awake()
        {
            _animator = GetComponent<Animator>();
        }

        private void Start()
        {
            // turn off all left buttons at startup
            DisableAllLeftButtons();
            // activate both achievement contains at the beginning to trigger all components' "Start"
            readerModeAchievementsContainer.SetActive(true);
            gamerModeAchievementsContainer.SetActive(true);
            // turn off all bookmarks at startup
            SetUpBookmarks();
            ShowBookmarks(false, null, null, null);
        }

        /// <summary>
        ///     Show the grimoire. Usually called from outside.
        /// </summary>
        public void ShowGrimoire()
        {
            _animator.SetBool(Opened, true);
        }

        /// <summary>
        ///     Hide the grimoire. Usually handled by the "close" bookmark itself.
        /// </summary>
        public void HideGrimoire()
        {
            _animator.SetBool(Opened, false);
        }

        /// <summary>
        ///     Callback for the close button.
        /// </summary>
        public void OnCloseButtonClicked()
        {
            close.Invoke();
        }

        /// <summary>
        ///     Disable all left buttons.
        /// </summary>
        public void DisableAllLeftButtons()
        {
            foreach (var descriptor in leftButtonDescriptors) descriptor.target.interactable = false;
        }

        /// <summary>
        ///     Enable (or disable) a button on the left.
        /// </summary>
        /// <param name="buttonName">Name of the button, according to <see cref="leftButtonDescriptors" />.</param>
        /// <param name="isButtonEnabled">Whether the button must be enabled or disabled.</param>
        public void EnableLeftButton(string buttonName, bool isButtonEnabled)
        {
            var descriptor = leftButtonDescriptors.FirstOrDefault(descriptor => descriptor.name == buttonName);
            if (descriptor == null)
            {
                Logger.ZLogWarning(
                    $"Trying to set button {buttonName} to enabled state {isButtonEnabled}, but cannot find a button with this name");
                return;
            }

            descriptor.target.interactable = isButtonEnabled;
        }

        /// <summary>
        ///     Set (or unset) the gamer mode.
        /// </summary>
        /// <param name="gamerMode">Whether we're in gamer mode.</param>
        public void SetGamerMode(bool gamerMode)
        {
            loadButtonContainer.SetActive(gamerMode);
            gamerModeAchievementsContainer.SetActive(gamerMode);
            readerModeAchievementsContainer.SetActive(!gamerMode);
        }

        public void SetAchievementStatus(string achievementName, int current, int max)
        {
            var achievement = gamerModeAchievements
                .Concat(readerModeAchievements)
                .FirstOrDefault(achievement => achievement.achievementName == achievementName);
            if (achievement == null)
            {
                Logger.ZLogWarning($"Could not find achievement with name {achievementName}");
                return;
            }

            achievement.SetAchievementStatus(current, max);
        }

        /// <summary>
        ///     Set the current mission for Franco.
        /// </summary>
        /// <param name="francoMissionText">Text of the mission. If null / empty / whitespace, franco is not visibile.</param>
        public void SetFrancoMission(string francoMissionText)
        {
            if (string.IsNullOrWhiteSpace(francoMissionText))
            {
                francoImage.enabled = false;
                francoText.text = string.Empty;
            }
            else
            {
                francoImage.enabled = true;
                francoText.text = $"<font-weight=\"500\">{francoMissionText}</font-weight>";
            }
        }

        /// <summary>
        ///     Hide the sigil part of the book.
        /// </summary>
        public void HideSigil()
        {
            sigilRoot.SetActive(false);
        }

        /// <summary>
        ///     Show the sigil part of the book with given settings.
        /// </summary>
        /// <param name="firstPositionGlyph">Glyph in first position.</param>
        /// <param name="secondPositionGlyph">Glyph in second position.</param>
        /// <param name="thirdPositionGlyph">Glyph in third position.</param>
        /// <param name="text">Text explaining how many uses are remaining.</param>
        public void ShowSigil(ISettingsSigils.GlyphType firstPositionGlyph,
            ISettingsSigils.GlyphType secondPositionGlyph, ISettingsSigils.GlyphType thirdPositionGlyph, string text)
        {
            // set the glyphs
            var glyphTypes = new[] { firstPositionGlyph, secondPositionGlyph, thirdPositionGlyph };
            var glyphImages = new[] { sigilFirstPosition, sigilSecondPosition, sigilThirdPosition };
            for (var i = 0; i < 3; i++)
            {
                var glyphType = glyphTypes[i];
                var glyphImage = glyphImages[i];
                var sprite = SettingsSigils.GetGlyphSprite(glyphType, i);
                var color = SettingsSigils.GetGlyphColor(glyphType);
                glyphImage.sprite = sprite;
                glyphImage.color = color;
            }

            // set the text
            sigilUsagesTextMeshPro.text = $"<font-weight=\"500\">{text}</font-weight>";
            // be sure that this part of the interface is active
            sigilRoot.SetActive(true);
        }

        private void SetUpBookmarks()
        {
            _backToLevelTwoTextMeshPro = backToLevelTwoBookmarkButton.GetComponentInChildren<TextMeshProUGUI>();
            _previousPageTextMeshPro = previousPageBookmarkButton.GetComponentInChildren<TextMeshProUGUI>();
            _nextPageTextMeshPro = nextPageBookmarkButton.GetComponentInChildren<TextMeshProUGUI>();
        }

        /// <summary>
        ///     Set up the bookmarks in the grimoire. The 'close' bookmark is always active.
        /// </summary>
        /// <param name="hasIndex">Whether the 'index' bookmark is active (it's <c>false</c> during rewriting).</param>
        /// <param name="backToLevelTwoText">
        ///     Text for the 'back to level two' button, if not <c>null</c>, otherwise the bookmark is
        ///     hidden.
        /// </param>
        /// <param name="previousPageText">
        ///     Text for the 'previous page' button, if not <c>null</c>, otherwise the bookmark is
        ///     hidden.
        /// </param>
        /// <param name="nextPageText">Text for the 'next page' button, if not <c>null</c>, otherwise the bookmark is hidden.</param>
        public void ShowBookmarks(bool hasIndex, string? backToLevelTwoText, string? previousPageText,
            string? nextPageText)
        {
            indexBookmarkButton.SetActive(hasIndex);

            _backToLevelTwoTextMeshPro.text = backToLevelTwoText ?? "";
            backToLevelTwoBookmarkButton.SetActive(backToLevelTwoText != null);

            _previousPageTextMeshPro.text = previousPageText ?? "";
            previousPageBookmarkButton.SetActive(previousPageText != null);

            _nextPageTextMeshPro.text = nextPageText ?? "";
            nextPageBookmarkButton.SetActive(nextPageText != null);
        }

        public void OnIndexBookmarkButtonClick()
        {
            goToIndex.Invoke();
        }

        public void OnBackToLevelTwoButtonClick()
        {
            goBackToLevelTwo.Invoke();
        }

        public void OnPreviousPageButtonClick()
        {
            goPrevious.Invoke();
        }

        public void OnNextPageButtonClick()
        {
            goNext.Invoke();
        }

        [Serializable]
        public class LeftButtonDescriptor
        {
            [Tooltip("The name of the button.")] public required string name;

            [Tooltip("The button to enable or disable")]
            public required Selectable target;
        }
    }
}