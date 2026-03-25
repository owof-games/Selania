using System;
using System.Linq;
using Microsoft.Extensions.Logging;
using R3;
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
        /// <summary>
        ///     Possible status of a greenhouse button.
        /// </summary>
        public enum GreenhouseButtonStatus
        {
            /// <summary>
            ///     Shown and available.
            /// </summary>
            Shown,

            /// <summary>
            ///     Locked.
            /// </summary>
            Locked,

            /// <summary>
            ///     Shown, but exhausted.
            /// </summary>
            Exhausted
        }

        /// <summary>
        ///     The page types available in the grimoire.
        /// </summary>
        public enum PageType
        {
            /// <summary>
            ///     First level page.
            /// </summary>
            FirstLevel,

            /// <summary>
            ///     Second level page (greenhouse).
            /// </summary>
            SecondLevelGreenhouse,

            /// <summary>
            ///     Second level page (sigils).
            /// </summary>
            SecondLevelSigils,

            /// <summary>
            ///     Third level page (sigils).
            /// </summary>
            ThirdLevelSigils
        }

        /// <summary>
        ///     Possible status of a second level sigil button.
        /// </summary>
        public enum SecondLevelSigilButtonStatus
        {
            /// <summary>
            ///     Shown.
            /// </summary>
            Shown,

            /// <summary>
            ///     Locked.
            /// </summary>
            Locked,

            /// <summary>
            ///     Enabled.
            /// </summary>
            Enabled
        }

        private static readonly int Opened = Animator.StringToHash("Opened");
        private static readonly int HideAnimatorProperty = Animator.StringToHash("Hide");
        private static readonly int ShowAnimatorProperty = Animator.StringToHash("Show");

        private static readonly int AnimationSpeedMultiplierAnimatorProperty =
            Animator.StringToHash("AnimationSpeedMultiplier");

        [Tooltip("The animator controlling the first level page")] [SerializeField]
        private Animator firstLevelAnimator = null!;

        [Tooltip("The animator controlling the second level page for the greenhouse")] [SerializeField]
        private Animator secondLevelAnimatorGreenhouse = null!;

        [Tooltip("The animator controlling the second level page for the sigils")] [SerializeField]
        private Animator secondLevelAnimatorSigils = null!;

        [Tooltip("The animator controlling the third level page for the sigils")] [SerializeField]
        private Animator thirdLevelAnimatorSigils = null!;

        [Tooltip("List of top level buttons")] [SerializeField]
        private TopLevelButton[] topLevelButtons = null!;

        [Tooltip("Invoked when the grimoire is asked to close.")] [SerializeField]
        private UnityEvent close = new();

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

        [SerializeField] [Tooltip("Plant buttons of the greenhouse section")]
        private SecondLevelGreenhouseButton[] secondLevelGreenhouseButtons = null!;

        [Tooltip("All the second level sigil buttons")] [SerializeField]
        private SecondLevelSigilsButton[] secondLevelSigilsButtons = null!;

        [SerializeField] private ThirdLevelSigilsHeader thirdLevelSigilsHeaderLeft = null!;
        [SerializeField] private ThirdLevelSigilsHeader thirdLevelSigilsHeaderRight = null!;
        [SerializeField] private ThirdLevelSigilsRow[] thirdLevelSigilsRows = null!;

        private Animator _animator = null!;

        private TextMeshProUGUI _backToLevelTwoTextMeshPro = null!;

        /// <summary>
        /// Subject that produces the index choice text every time it's chosen.
        /// </summary>
        private Subject<string>? _indexChoiceSubject;

        private string? _indexText;
        private TextMeshProUGUI _nextPageTextMeshPro = null!;

        /// <summary>
        ///     All the animators for pages, or <c>null</c> if it hasn't been initialized yet.
        /// </summary>
        private Animator[]? _pageAnimators;

        private TextMeshProUGUI _previousPageTextMeshPro = null!;

        [Inject] internal ILogger<GrimoireBackground> Logger = null!;

        [Inject] internal ISettingsBook SettingsBook = null!;

        [Inject] internal ISettingsSigils SettingsSigils = null!;

        /// <summary>
        /// Observable that produces the index choice text every time it's chosen.
        /// </summary>
        public Observable<string> IndexChoiceObservable =>
            _indexChoiceSubject?.AsObservable() ??
            throw new InvalidOperationException("Cannot access the IndexChoiceObservable before component setup");

        /// <summary>
        ///     An observable that exposes clicks on top level buttons.
        /// </summary>
        public Observable<string> firstLevelButtonClick =>
            topLevelButtons.Select(topLevelButton => topLevelButton.click).Merge();

        /// <summary>
        ///     An observable that exposes clicks on second level greenhouse buttons.
        /// </summary>
        public Observable<string> secondLevelGreenhouseButtonClick =>
            secondLevelGreenhouseButtons.Select(secondLevelButton => secondLevelButton.click).Merge();

        /// <summary>
        ///     An observable that exposes clicks on second level sigils buttons.
        /// </summary>
        public Observable<(ISettingsSigils.GlyphType, ISettingsSigils.GlyphType)> secondLevelSigilsButtonClick =>
            secondLevelSigilsButtons.Select(secondLevelButton => secondLevelButton.click).Merge();

        private void Awake()
        {
            // get components
            _animator = GetComponent<Animator>();
            // set up observables
            _indexChoiceSubject = new Subject<string>().AddTo(this);
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
            ShowBookmarks(null, null, null, null);
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
            // foreach (var descriptor in leftButtonDescriptors) descriptor.target.interactable = false;
            foreach (var topLevelButton in topLevelButtons) topLevelButton.interactable = false;
        }

        /// <summary>
        ///     Enable (or disable) a button on the left.
        /// </summary>
        /// <param name="buttonName">Name of the button, according to <see cref="topLevelButtons" />.</param>
        /// <param name="isButtonEnabled">Whether the button must be enabled or disabled.</param>
        public void EnableLeftButton(string buttonName, bool isButtonEnabled)
        {
            // var descriptor = leftButtonDescriptors.FirstOrDefault(descriptor => descriptor.name == buttonName);
            var topLevelButton =
                topLevelButtons.FirstOrDefault(topLevelButton => topLevelButton.buttonName == buttonName);
            if (topLevelButton == null)
            {
                Logger.ZLogWarning(
                    $"Trying to set button {buttonName} to enabled state {isButtonEnabled}, but cannot find a button with this name");
                return;
            }

            topLevelButton.interactable = isButtonEnabled;
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
        /// <param name="indexText">The 'index' bookmark text (it's <c>null</c> during rewriting).</param>
        /// <param name="backToLevelTwoText">
        ///     Text for the 'back to level two' button, if not <c>null</c>, otherwise the bookmark is
        ///     hidden.
        /// </param>
        /// <param name="previousPageText">
        ///     Text for the 'previous page' button, if not <c>null</c>, otherwise the bookmark is
        ///     hidden.
        /// </param>
        /// <param name="nextPageText">Text for the 'next page' button, if not <c>null</c>, otherwise the bookmark is hidden.</param>
        public void ShowBookmarks(string? indexText, string? backToLevelTwoText, string? previousPageText,
            string? nextPageText)
        {
            _indexText = indexText;
            indexBookmarkButton.SetActive(indexText != null);

            _backToLevelTwoTextMeshPro.text = backToLevelTwoText ?? "";
            backToLevelTwoBookmarkButton.SetActive(backToLevelTwoText != null);

            _previousPageTextMeshPro.text = previousPageText ?? "";
            previousPageBookmarkButton.SetActive(previousPageText != null);

            _nextPageTextMeshPro.text = nextPageText ?? "";
            nextPageBookmarkButton.SetActive(nextPageText != null);
        }

        public void OnIndexBookmarkButtonClick()
        {
            if (_indexText == null)
            {
                Logger.ZLogError($"Index bookmark clicked, but no index text was set.");
                return;
            }

            _indexChoiceSubject!.OnNext(_indexText);
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

        /// <summary>
        ///     Switch to the given page.
        /// </summary>
        /// <param name="pageType">Page type to switch to.</param>
        /// <exception cref="ArgumentOutOfRangeException">If the <paramref name="pageType" /> is unknown.</exception>
        public void SwitchToPage(PageType pageType)
        {
            switch (pageType)
            {
                case PageType.FirstLevel:
                    ShowPage(firstLevelAnimator);
                    break;
                case PageType.SecondLevelGreenhouse:
                    ShowPage(secondLevelAnimatorGreenhouse);
                    break;
                case PageType.SecondLevelSigils:
                    ShowPage(secondLevelAnimatorSigils);
                    break;
                case PageType.ThirdLevelSigils:
                    ShowPage(thirdLevelAnimatorSigils);
                    break;
                default:
                    throw new ArgumentOutOfRangeException(nameof(pageType), pageType, null);
            }
        }

        /// <summary>
        ///     Show a specific page.
        /// </summary>
        /// <param name="animatorToShow">The animator of the page to show.</param>
        private void ShowPage(Animator animatorToShow)
        {
            // fill the page animators if necessary.
            _pageAnimators ??= new[]
            {
                firstLevelAnimator, secondLevelAnimatorGreenhouse, secondLevelAnimatorSigils, thirdLevelAnimatorSigils
            };

            foreach (var animator in _pageAnimators)
            {
                animator.SetFloat(AnimationSpeedMultiplierAnimatorProperty,
                    SettingsBook.switchPageAnimationSpeedMultiplier);
                animator.SetTrigger(animator == animatorToShow ? ShowAnimatorProperty : HideAnimatorProperty);
            }
        }

        /// <summary>
        /// Disable all buttons of the greenhouse. Used to reset everything to default state.
        /// </summary>
        public void DisableAllGreenhouseButtons()
        {
            foreach (var secondLevelButton in secondLevelGreenhouseButtons)
            {
                SetGreenhouseButtonStatus(secondLevelButton.plantName, GreenhouseButtonStatus.Locked);
            }
        }

        /// <summary>
        ///     Set the greenhouse button status.
        /// </summary>
        /// <param name="plantName">Name of the plant to set.</param>
        /// <param name="status">Status of the button.</param>
        public void SetGreenhouseButtonStatus(string plantName, GreenhouseButtonStatus status)
        {
            var button = secondLevelGreenhouseButtons.FirstOrDefault(button => button.plantName == plantName);
            if (button == null)
            {
                Logger.ZLogError($"Cannot find plant with name {plantName}");
                return;
            }

            switch (status)
            {
                case GreenhouseButtonStatus.Shown:
                    button.interactable = true;
                    button.SetSaturation(1f);
                    break;
                case GreenhouseButtonStatus.Exhausted:
                    button.interactable = true;
                    button.SetSaturation(SettingsBook.exhaustedGreenhouseButtonSaturationLevel);
                    break;
                case GreenhouseButtonStatus.Locked:
                    button.interactable = false;
                    button.SetSaturation(1f);
                    break;
                default:
                    throw new ArgumentOutOfRangeException(nameof(status), status, null);
            }
        }

        public void DisableAllSigilsButtons()
        {
            foreach (var secondLevelButton in secondLevelSigilsButtons)
                SetSecondLevelSigilButtonStatus(secondLevelButton.firstLevelGlyph, secondLevelButton.secondLevelGlyph,
                    SecondLevelSigilButtonStatus.Locked);
        }

        public void SetSecondLevelSigilButtonStatus(ISettingsSigils.GlyphType firstLevelGlyph,
            ISettingsSigils.GlyphType secondLevelGlyph,
            SecondLevelSigilButtonStatus status)
        {
            var button = secondLevelSigilsButtons.FirstOrDefault(b =>
                b.firstLevelGlyph == firstLevelGlyph && b.secondLevelGlyph == secondLevelGlyph);
            if (button == null)
            {
                Logger.ZLogError(
                    $"Cannot find  second level sigil button with glyphs {firstLevelGlyph} {secondLevelGlyph}");
                return;
            }

            // TODO: should cache the selectable corresponding to each second level sigils button, maybe with a weak dict
            button.GetComponent<Selectable>().interactable = status != SecondLevelSigilButtonStatus.Locked;
            button.EnableAnimation(status == SecondLevelSigilButtonStatus.Enabled);
        }

        /// <summary>
        ///     Set up the header of the third level sigils page.
        /// </summary>
        /// <param name="leftTitle">Left title of the page.</param>
        /// <param name="leftSubtitle">Left subtitle of the page.</param>
        /// <param name="leftSigil">Left sigil of the page.</param>
        /// <param name="rightTitle">right title of the page.</param>
        /// <param name="rightSubtitle">right subtitle of the page.</param>
        /// <param name="rightSigil">right sigil of the page.</param>
        public void SetUpThirdLevelSigilsHeader(string leftTitle, string leftSubtitle,
            (ISettingsSigils.GlyphType, ISettingsSigils.GlyphType)? leftSigil, string rightTitle, string rightSubtitle,
            (ISettingsSigils.GlyphType, ISettingsSigils.GlyphType)? rightSigil)
        {
            thirdLevelSigilsHeaderLeft.SetUp(leftTitle, leftSubtitle, leftSigil);
            thirdLevelSigilsHeaderRight.SetUp(rightTitle, rightSubtitle, rightSigil);
        }

        /// <summary>
        ///     Set up a single sigil for the third level sigils page.
        /// </summary>
        /// <param name="index">Index of the sigil (0,1,2 are the left ones, 3,4,5 the right ones)</param>
        /// <param name="title">Title of the sigil.</param>
        /// <param name="firstDescriptionLine">First line of description for the sigil.</param>
        /// <param name="secondDescriptionLine">Second line of description for the sigil.</param>
        /// <param name="thirdDescriptionLine">Third line of description for the sigil.</param>
        /// <param name="glyphs">The three glyphs describing the sigil.</param>
        /// <param name="status">Status of the button.</param>
        public void SetUpThirdLevelSigilRow(int index, string title, string firstDescriptionLine,
            string secondDescriptionLine,
            string thirdDescriptionLine,
            (ISettingsSigils.GlyphType, ISettingsSigils.GlyphType, ISettingsSigils.GlyphType) glyphs,
            IStoryGrimoire.ThirdLevelSigilStatus status)
        {
            thirdLevelSigilsRows[index].SetUp(title, firstDescriptionLine, secondDescriptionLine, thirdDescriptionLine,
                glyphs);
            thirdLevelSigilsRows[index].SetStatus(status);
        }

        /// <summary>
        ///     Disable all the third-level sigil buttons and rows.
        /// </summary>
        public void DisableAllThirdLevelSigilsRows()
        {
            foreach (var thirdLevelSigilsRow in thirdLevelSigilsRows)
            {
                thirdLevelSigilsRow.SetUp("", "", "", "", null);
            }
        }
    }
}