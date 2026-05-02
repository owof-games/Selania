using System;
using System.Collections.Generic;
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
            ///     Second level page (characters).
            /// </summary>
            SecondLevelCharacters,

            /// <summary>
            ///     Second level page (franco).
            /// </summary>
            SecondLevelFranco,

            /// <summary>
            ///     Second level page (rules).
            /// </summary>
            SecondLevelRules,

            /// <summary>
            ///     Third level page (sigils).
            /// </summary>
            ThirdLevelSigils,

            /// <summary>
            ///     Third level page (greenhouse).
            /// </summary>
            ThirdLevelGreenhouse,

            /// <summary>
            ///     Third level page (character).
            /// </summary>
            ThirdLevelCharacter
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

        [Tooltip("The animator controlling the second level page for the characters")] [SerializeField]
        private Animator secondLevelAnimatorCharacters = null!;

        [Tooltip("The animator controlling the second level page for Franco")] [SerializeField]
        private Animator secondLevelAnimatorFranco = null!;

        [Tooltip("The animator controlling the second level page for rules")] [SerializeField]
        private Animator secondLevelAnimatorRules = null!;

        [Tooltip("The animator controlling the third level page for the sigils")] [SerializeField]
        private Animator thirdLevelAnimatorSigils = null!;

        [Tooltip("The animator controlling the third level page for the greenhouse")] [SerializeField]
        private Animator thirdLevelAnimatorGreenhouse = null!;

        [Tooltip("The animator controlling the third level page for the character")] [SerializeField]
        private Animator thirdLevelAnimatorCharacter = null!;

        [Tooltip("List of top level buttons")] [SerializeField]
        private TopLevelButton[] topLevelButtons = null!;

        [Tooltip("Invoked when the grimoire is asked to close.")] [SerializeField]
        private UnityEvent close = new();

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

        [SerializeField] [Tooltip("The third level greenhouse controller")]
        private ThirdLevelGreenhouseGrimoire thirdLevelGreenhouseGrimoire = null!;

        [SerializeField] [Tooltip("The second level characters controller")]
        private SecondLevelCharactersGrimoire secondLevelCharactersGrimoire = null!;

        [SerializeField] private ThirdLevelCharacterGrimoire thirdLevelCharacterGrimoire = null!;

        [SerializeField] private SecondLevelFrancoGrimoire secondLevelFrancoGrimoire = null!;

        [SerializeField] private SecondLevelRulesGrimoire secondLevelRulesGrimoire = null!;

        private Animator _animator = null!;

        private string? _backToLevelTwoChoice;
        private Subject<string>? _backToLevelTwoSubject;

        private TextMeshProUGUI _backToLevelTwoTextMeshPro = null!;

        /// <summary>
        /// Text of the Ink choice to take when the "close" button is clicked; if not present, the "close" button simply
        /// closes the grimoire.
        /// </summary>
        private string? _closeChoice;

        private Subject<string>? _closeSubject;

        /// <summary>
        /// Text of the Ink choice to take when the "index" button is clicked.
        /// </summary>
        private string? _indexChoice;

        /// <summary>
        /// Subject that produces the index choice text every time it's chosen.
        /// </summary>
        private Subject<string>? _indexChoiceSubject;

        private string? _nextPageChoice;
        private Subject<string>? _nextPageSubject;
        private TextMeshProUGUI _nextPageTextMeshPro = null!;

        /// <summary>
        ///     All the animators for pages, or <c>null</c> if it hasn't been initialized yet.
        /// </summary>
        private Animator[]? _pageAnimators;

        private string? _previousPageChoice;
        private Subject<string>? _previousPageSubject;

        private TextMeshProUGUI _previousPageTextMeshPro = null!;

        [Inject] internal ILogger<GrimoireBackground> Logger = null!;

        [Inject] internal ISettingsBook SettingsBook = null!;

        [Inject] internal ISettingsSigils SettingsSigils = null!;

        /// <summary>
        /// Observable that produces the index choice text every time it's chosen.
        /// </summary>
        public Observable<string> indexChoiceObservable =>
            _indexChoiceSubject?.AsObservable() ??
            throw new InvalidOperationException("Cannot access the indexChoiceObservable before component setup");

        public Observable<string> backToLevelTwoObservable =>
            _backToLevelTwoSubject?.AsObservable() ??
            throw new InvalidOperationException("Cannot access the backToLevelTwoObservable before component setup");

        public Observable<string> previousPageObservable =>
            _previousPageSubject?.AsObservable() ??
            throw new InvalidOperationException("Cannot access the previousPageObservable before component setup");

        public Observable<string> nextPageObservable =>
            _nextPageSubject?.AsObservable() ??
            throw new InvalidOperationException("Cannot access the nextPageObservable before component setup");

        /// <summary>
        /// An observable that produces the text of the ink choice when the close button is invoked. If no choice has
        /// been set, it means that clicking the "close" button simply closes the grimoire, and no event is raised.
        /// </summary>
        public Observable<string> closeObservable =>
            _closeSubject?.AsObservable() ??
            throw new InvalidOperationException("Cannot access the closeObservable before component setup");

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

        /// <summary>
        ///     An observable that produces the name of a third level sigil whenever it's clicked.
        /// </summary>
        public Observable<string> thirdLevelSigilsButtonClick =>
            thirdLevelSigilsRows.Select(row => row.click).Merge();

        /// <summary>
        /// An observable producing "true" when the left button on third level greenhouse is clicked, "false" when the right button is clicked.
        /// </summary>
        public Observable<bool> thirdLevelGreenhouseButtonClickOnLeft =>
            thirdLevelGreenhouseGrimoire.clickedOnLeft;

        /// <summary>
        ///     An observable that produces a string with the name of the button each time a button is clicked.
        /// </summary>
        public Observable<string> secondLevelCharactersButtonClick => secondLevelCharactersGrimoire.clickObservable;

        public bool thirdLevelCharacterCanTurnToNextPage => thirdLevelCharacterGrimoire.canTurnToNextPage;

        public bool thirdLevelCharacterCanTurnToPreviousPage => thirdLevelCharacterGrimoire.canTurnToPreviousPage;

        private void Awake()
        {
            // get components
            _animator = GetComponent<Animator>();
            // set up observables
            _indexChoiceSubject = new Subject<string>().AddTo(this);
            _backToLevelTwoSubject = new Subject<string>().AddTo(this);
            _previousPageSubject = new Subject<string>().AddTo(this);
            _nextPageSubject = new Subject<string>().AddTo(this);
            _closeSubject = new Subject<string>().AddTo(this);
        }

        private void Start()
        {
            // set up page animators
            SetUpPageAnimators();
            // turn off all left buttons at startup
            DisableAllLeftButtons();
            // activate both achievement contains at the beginning to trigger all components' "Start"
            readerModeAchievementsContainer.SetActive(true);
            gamerModeAchievementsContainer.SetActive(true);
            // turn off all bookmarks at startup and set the default behavior for 'close'
            SetUpBookmarks();
            ShowBookmarks(null, null, null, null, null);
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
        /// <param name="closeText">Choice text for the 'close' button, if not <c>null</c>, otherwise the close button simply closes the grimoire.</param>
        public void ShowBookmarks(string? indexText, string? backToLevelTwoText, string? previousPageText,
            string? nextPageText, string? closeText)
        {
            _indexChoice = indexText;
            indexBookmarkButton.SetActive(indexText != null);

            _backToLevelTwoTextMeshPro.text = backToLevelTwoText ?? "";
            _backToLevelTwoChoice = backToLevelTwoText;
            backToLevelTwoBookmarkButton.SetActive(backToLevelTwoText != null);

            _previousPageTextMeshPro.text = previousPageText ?? "";
            _previousPageChoice = previousPageText;
            previousPageBookmarkButton.SetActive(previousPageText != null);

            _nextPageTextMeshPro.text = nextPageText ?? "";
            _nextPageChoice = nextPageText;
            nextPageBookmarkButton.SetActive(nextPageText != null);

            _closeChoice = closeText;
        }

        public void OnIndexBookmarkButtonClick()
        {
            if (_indexChoice == null)
            {
                Logger.ZLogError($"Index bookmark clicked, but no index text was set.");
                return;
            }

            _indexChoiceSubject!.OnNext(_indexChoice);
        }

        public void OnBackToLevelTwoButtonClick()
        {
            if (_backToLevelTwoChoice == null)
            {
                Logger.ZLogError($"Back to level two bookmark clicked, but no text was set.");
                return;
            }

            _backToLevelTwoSubject!.OnNext(_backToLevelTwoChoice);
        }

        public void OnPreviousPageButtonClick()
        {
            if (_previousPageChoice == null)
            {
                Logger.ZLogError($"Back to level two bookmark clicked, but no text was set.");
                return;
            }

            _previousPageSubject!.OnNext(_previousPageChoice);
        }

        public void OnNextPageButtonClick()
        {
            if (_nextPageChoice == null)
            {
                Logger.ZLogError($"Back to level two bookmark clicked, but no text was set.");
                return;
            }

            _nextPageSubject!.OnNext(_nextPageChoice);
        }

        /// <summary>
        ///     Callback for the close button.
        /// </summary>
        public void OnCloseButtonClicked()
        {
            if (_closeChoice == null)
            {
                close.Invoke();
            }
            else
            {
                _closeSubject!.OnNext(_closeChoice);
            }
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
                case PageType.SecondLevelCharacters:
                    ShowPage(secondLevelAnimatorCharacters);
                    break;
                case PageType.SecondLevelFranco:
                    ShowPage(secondLevelAnimatorFranco);
                    break;
                case PageType.SecondLevelRules:
                    ShowPage(secondLevelAnimatorRules);
                    break;
                case PageType.ThirdLevelSigils:
                    ShowPage(thirdLevelAnimatorSigils);
                    break;
                case PageType.ThirdLevelGreenhouse:
                    ShowPage(thirdLevelAnimatorGreenhouse);
                    break;
                case PageType.ThirdLevelCharacter:
                    ShowPage(thirdLevelAnimatorCharacter);
                    break;
                default:
                    throw new ArgumentOutOfRangeException(nameof(pageType), pageType, null);
            }
        }

        private void SetUpPageAnimators()
        {
            _pageAnimators = null;
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
                firstLevelAnimator, secondLevelAnimatorGreenhouse, secondLevelAnimatorSigils,
                secondLevelAnimatorCharacters, secondLevelAnimatorFranco, secondLevelAnimatorRules,
                thirdLevelAnimatorSigils, thirdLevelAnimatorGreenhouse, thirdLevelAnimatorCharacter
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

        /// <summary>
        ///     Disable a page of the third level greenhouse.
        /// </summary>
        /// <param name="isLeft">Whether the page to disable is the left one.</param>
        public void ThirdLevelGreenhouseDisablePage(bool isLeft)
        {
            thirdLevelGreenhouseGrimoire.DisablePage(isLeft);
        }

        /// <summary>
        ///     Hide a page of the third level greenhouse.
        /// </summary>
        /// <param name="isLeft">Whether the page to hide is the left one.</param>
        public void ThirdLevelGreenhouseHidePage(bool isLeft)
        {
            thirdLevelGreenhouseGrimoire.HidePage(isLeft);
        }

        /// <summary>
        ///     Fill one of the two pages of the third level greenhouse with given information.
        /// </summary>
        /// <param name="isLeft">Whether this is the left or right page.</param>
        /// <param name="title">Text for the title.</param>
        /// <param name="isOwned">Whether the plant is owned.</param>
        /// <param name="buttonStatus">Button status.</param>
        /// <param name="plantName">Name of the plant.</param>
        /// <param name="text">Text of the page.</param>
        public void ThirdLevelGreenhouseFillPage(bool isLeft, string title, bool isOwned,
            ThirdLevelGreenhouseButton.Status buttonStatus,
            string plantName, string text)
        {
            thirdLevelGreenhouseGrimoire.FillPage(isLeft, title, isOwned, buttonStatus, plantName, text);
        }

        /// <summary>
        ///     Set up the page contents.
        /// </summary>
        /// <param name="characterName">Name of the character.</param>
        /// <param name="characterDescription">Description of the character.</param>
        /// <param name="characterTasks">Tasks of the character.</param>
        /// <param name="portraitName">
        ///     Name of the portrait (see <see cref="ISettingsBook.GetCharacterPortrait" />,
        ///     <see cref="SelaniaSettings.CharacterInfo.grimoirePortrait" />).
        /// </param>
        /// <param name="enabledButtonNames">The list of buttons enabled, identified by their name.</param>
        public void SetUpSecondLevelCharacterPage(string characterName, string characterDescription,
            string characterTasks, string portraitName, ICollection<string> enabledButtonNames)
        {
            secondLevelCharactersGrimoire.SetUpPage(characterName, characterDescription, characterTasks, portraitName,
                enabledButtonNames);
        }

        /// <summary>
        /// Set up the values for the various elements in the pentacle, showing an animation if the starting and
        /// ending values are different.
        /// </summary>
        /// <param name="aetherValue1"></param>
        /// <param name="aetherValue2"></param>
        /// <param name="airValue1"></param>
        /// <param name="airValue2"></param>
        /// <param name="fireValue1"></param>
        /// <param name="fireValue2"></param>
        /// <param name="earthValue1"></param>
        /// <param name="earthValue2"></param>
        /// <param name="waterValue1"></param>
        /// <param name="waterValue2"></param>
        public void SetUpPentacleValues(float aetherValue1, float aetherValue2,
            float airValue1, float airValue2,
            float fireValue1, float fireValue2,
            float earthValue1, float earthValue2,
            float waterValue1, float waterValue2)
        {
            secondLevelCharactersGrimoire.SetUpPentacleValues(aetherValue1, aetherValue2,
                airValue1, airValue2,
                fireValue1, fireValue2,
                earthValue1, earthValue2,
                waterValue1, waterValue2);
        }

        public void SetThirdLevelTextGrimoireText(string text)
        {
            thirdLevelCharacterGrimoire.SetText(text);
        }

        public void ThirdLevelTextGrimoireNextPage()
        {
            thirdLevelCharacterGrimoire.NextPage();
        }

        public void ThirdLevelTextGrimoirePreviousPage()
        {
            thirdLevelCharacterGrimoire.PreviousPage();
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
        public void SetThirdLevelCharacterGrimoireHeader(string iconName, string styleName, string title,
            string description)
        {
            thirdLevelCharacterGrimoire.SetHeader(iconName, styleName, title, description);
        }

        /// <summary>
        ///     Hide the recipe of second level Franco page and show the lock.
        /// </summary>
        public void SecondLevelFrancoGrimoireLockRecipe()
        {
            secondLevelFrancoGrimoire.LockRecipe();
        }

        /// <summary>
        ///     Hide the lock of second level Franco page and show the recipe.
        /// </summary>
        /// <param name="recipeTitle">The recipe title.</param>
        /// <param name="recipeDescription">The recipe description / subtitle.</param>
        /// <param name="recipeContents">The contents of the recipe.</param>
        public void SecondLevelFrancoGrimoireShowRecipe(string recipeTitle, string recipeDescription,
            string recipeContents)
        {
            secondLevelFrancoGrimoire.ShowRecipe(recipeTitle, recipeDescription, recipeContents);
        }

        /// <summary>
        ///     Set the favor currently asked by Franco.
        /// </summary>
        /// <param name="favor">The favor asked.</param>
        public void SecondLevelFrancoGrimoireSetFavourDemanded(string favor)
        {
            secondLevelFrancoGrimoire.SetFavourDemanded(favor);
        }

        public void SecondLevelRulesGrimoireSetText(string text)
        {
            secondLevelRulesGrimoire.SetRulesText(text);
        }
    }
}