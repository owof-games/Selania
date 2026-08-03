using System;
using System.Collections.Generic;
using Microsoft.Extensions.Logging;
using R3;
using Selania.Rework.Interfaces;
using TMPro;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UI;
using VContainer;
using VContainer.Unity;
using ZLogger;

namespace Selania.Rework.Components.DialogueBox
{
    /// <summary>
    ///     The view manager for the dialogue box. This script controls the "view" part of the component, handling input
    ///     and output, but no connection to the model (see <see cref="DialogueBoxInkBindings" />).
    /// </summary>
    public class DialogueBox : MonoBehaviour, IAutomaticEditorInject, InputActionsDialogueBox.IContinueMapActions
    {
        [SerializeField] [Tooltip("The prefab that creates a text line once instantiated.")]
        private GameObject textLinePrefab = null!;

        [SerializeField] [Tooltip("The prefab that creates a set of choices once instantiated.")]
        private GameObject dialogueChoicesPrefab = null!;

        [SerializeField] [Tooltip("The prefab that creates an image in the dialogue.")]
        private GameObject dialogueImagePrefab = null!;

        [SerializeField] [Tooltip("The container where all the text lines are added to.")]
        private RectTransform textLinesContainer = null!;

        [SerializeField] [Tooltip("The first portrait container.")]
        private PortraitContainer portraitContainer = null!;

        [SerializeField] [Tooltip("The ink container.")]
        private InkContainer inkContainer = null!;

        [SerializeField] [Tooltip("The relationship status component.")]
        private RelationshipStatus relationshipStatus = null!;

        [SerializeField] [Tooltip("The scroll view displaying the dialogue")]
        private ScrollRect scrollView = null!;

        [SerializeField] [Tooltip("the container where the text appears and that receives click events to progress")]
        private DialogueClickCapture dialogueClickCapture = null!;

        [SerializeField] [Tooltip("The viewport of the scroll rect.")]
        private RectTransform scrollRectViewport = null!;

        [SerializeField] [Tooltip("The animator that controls general dialogue box behaviors")]
        private Animator animator = null!;

        [SerializeField] [Tooltip("The resizable container of the text parts")]
        private GrowingContainer growingContainer = null!;

        [SerializeField] private Image glyph1Image = null!;
        [SerializeField] private Image glyph2Image = null!;
        [SerializeField] private Image glyph3Image = null!;
        [SerializeField] private Image threeUsagesImage = null!;
        [SerializeField] private Image twoUsagesImage = null!;
        [SerializeField] private Image oneUsageImage = null!;
        [SerializeField] private TMP_Text sigilTitle = null!;

        /// <summary>
        ///     The audio system used to play sound effects.
        /// </summary>
        [Inject] internal IAudioSystem AudioSystem = null!;

        /// <summary>
        ///     The logger used by this component.
        /// </summary>
        [Inject] internal ILogger<DialogueBox> Logger = null!;

        /// <summary>
        ///     The scope in which this object is created.
        /// </summary>
        [Inject] internal LifetimeScope Scope = null!;

        /// <summary>
        ///     Settings for the dialogue box.
        /// </summary>
        [Inject] internal ISettingsDialogueBox Settings = null!;

        [Inject] internal ISettingsSigils SettingsSigils = null!;

        /// <summary>
        ///     An action that has a value if we're waiting to add choices to the box. Calling the action will actually
        ///     add the choices.
        /// </summary>
        private Action? _actualAddChoices;

        /// <summary>
        ///     The subject backing <see cref="continueRequestsObservable" />.
        /// </summary>
        private Subject<Unit>? _continueRequestsSubject;

        /// <summary>
        ///     The input actions with specific handling for the dialogue box.
        /// </summary>
        private InputActionsDialogueBox? _inputActionsDialogueBox;

        /// <summary>
        ///     The latest text line created, if any. If a choice is created, the previous text line is forgotten about.
        /// </summary>
        private TextLine? _latestTextLine;

        /// <summary>
        ///     Whether the next portrait change will use portrait 1.
        /// </summary>
        private bool _willUsePortrait1 = true;

        /// <summary>
        ///     Invoked whenever an actual continue operation in the ink story must be performed.
        /// </summary>
        public Observable<Unit> continueRequestsObservable => _continueRequestsSubject!;

        private void Awake()
        {
            // set up the events we're interested in
            _inputActionsDialogueBox = new InputActionsDialogueBox();
            _inputActionsDialogueBox.ContinueMap.AddCallbacks(this);
            // set up objects
            _continueRequestsSubject = new Subject<Unit>().AddTo(this);
        }

        private void Start()
        {
            // workaround for a bug (?) that resets the viewport at the lower left angle if the scrollbar is set as
            // persistent (which is our case)
            scrollRectViewport.anchorMin = new Vector2(0, 0);
            scrollRectViewport.anchorMax = new Vector2(1, 1);
        }

        private void OnEnable()
        {
            _inputActionsDialogueBox?.Enable();
            _inputActionsDialogueBox?.ContinueMap.Disable();
            _inputActionsDialogueBox?.ChoicesSelectionMap.Disable();
            dialogueClickCapture.OnClick += DialogueClickCaptureOnOnClick;
        }

        private void OnDisable()
        {
            dialogueClickCapture.OnClick -= DialogueClickCaptureOnOnClick;
            _inputActionsDialogueBox?.Disable();
        }

        private void OnDestroy()
        {
            _inputActionsDialogueBox?.ContinueMap.RemoveCallbacks(this);
            _inputActionsDialogueBox?.Dispose();
        }

        public void OnContinue(InputAction.CallbackContext context)
        {
            if (!context.performed) return;
            ContinueRequested();
        }

        private void DialogueClickCaptureOnOnClick()
        {
            // input map is used to check if we're actually accepting continue messages
            if (_inputActionsDialogueBox?.ContinueMap.enabled != true) return;
            ContinueRequested();
        }

        /// <summary>
        ///     Method called when it's been requested to continue.
        /// </summary>
        private void ContinueRequested()
        {
            if (_latestTextLine != null && !_latestTextLine.textCompletelyShown)
            {
                Logger.ZLogTrace($"Requested to continue, but the text was still appearing: show it all.");
                AudioSystem.PlaySoundEffect("advanceDialogue");
                _latestTextLine.ShowAllText();
            }
            else if (_actualAddChoices != null)
            {
                Logger.ZLogTrace($"Requested to continue, but was waiting to show choices: show the choices.");
                _actualAddChoices();
                _actualAddChoices = null;
            }
            else
            {
                AudioSystem.PlaySoundEffect("advanceDialogue");
                Logger.ZLogTrace(
                    $"Requested to continue, and there was no text still appearing neither choices waiting: actually continue.");
                _continueRequestsSubject!.OnNext(Unit.Default);
            }
        }

        /// <summary>
        ///     Add a new text line to the dialogue box.
        /// </summary>
        /// <param name="speaker">Info about the speaker (character like FirstCharacter and display name like Chitarra).</param>
        /// <param name="text">The text to add.</param>
        public void AddTextLine((string Character, string DisplayName)? speaker, string? text)
        {
            SlideInIfNecessary();

            using (LifetimeScope.EnqueueParent(Scope))
            {
                _inputActionsDialogueBox?.ContinueMap.Enable();
                var textLineGameObject = Instantiate(textLinePrefab, textLinesContainer);
                var textLine = textLineGameObject.GetComponent<TextLine>();
                textLine.SetText(speaker, text);
                _latestTextLine = textLine;
            }

            ScrollToBottom();
        }

        /// <summary>
        ///     Add an image to the dialogue box.
        /// </summary>
        /// <param name="spriteName">
        ///     Name of the sprite to show. See <see cref="ISettingsDialogueBox.GetDialogueSprite" /> and
        ///     <see cref="SelaniaSettings.dialogueSpriteInfo" />.
        /// </param>
        public void AddImage(string spriteName)
        {
            SlideInIfNecessary();

            using (LifetimeScope.EnqueueParent(Scope))
            {
                _inputActionsDialogueBox?.ContinueMap.Enable();
                var dialogueImageGameObject = Instantiate(dialogueImagePrefab, textLinesContainer);
                var dialogueImage = dialogueImageGameObject.GetComponent<DialogueImage>();
                dialogueImage.SetImage(spriteName);
            }

            ScrollToBottom();
        }

        /// <summary>
        ///     Usually, when it's requested to add choices and some text is shown, the UI waits for an "advance" command before
        ///     displaying the choices. In some corner cases for Ink, it's necessary to immediately show them (see
        ///     DialogueBoxInkBindings).
        /// </summary>
        public void ImmediatelyAddNextChoices()
        {
            // just forget about the latest text line: this will allow choices to be immediately added.
            Logger.ZLogTrace($"Asked to immediately add the next block of choices.");
            _latestTextLine = null;

            if (_actualAddChoices == null) return;
            Logger.ZLogTrace($"And we already has some enqueued: showing them.");
            _actualAddChoices();
            _actualAddChoices = null;
        }

        public void AddChoices(IList<DialogueChoices.Choice> choices, Action<int> onChoiceSelected)
        {
            // either immediately show the choices, or enqueue them, to be display at the next continue operation
            if (_latestTextLine == null)
            {
                Logger.ZLogTrace($"Immediately adding a choice.");
                ActualAddChoices(choices, onChoiceSelected);
            }
            else
            {
                Logger.ZLogTrace($"Enqueuing addition of choices.");
                _actualAddChoices = () => ActualAddChoices(choices, onChoiceSelected);
            }
        }

        private void ActualAddChoices(IList<DialogueChoices.Choice> choices,
            Action<int> onChoiceSelected)
        {
            Logger.ZLogTrace($"Actually adding choices");
            try
            {
                SlideInIfNecessary();

                // show the choices
                using (LifetimeScope.EnqueueParent(Scope))
                {
                    // create the dialogue choices and hook to input action events
                    var dialogueChoicesGameObject = Instantiate(dialogueChoicesPrefab, textLinesContainer);
                    var dialogueChoices = dialogueChoicesGameObject.GetComponent<DialogueChoices>();
                    _inputActionsDialogueBox?.ChoicesSelectionMap.AddCallbacks(dialogueChoices);
                    _inputActionsDialogueBox?.ChoicesSelectionMap.Enable();
                    _inputActionsDialogueBox?.ContinueMap.Disable();
                    dialogueChoices.ChoiceSelectingEvent += SelectingChoice;
                    dialogueChoices.ChoiceSelectedEvent += SelectChoice;
                    dialogueChoices.SetChoices(choices);
                    _latestTextLine = null;

                    void SelectingChoice(DialogueChoices.ChoiceSelectingEventArgs args)
                    {
                        args.Valid = args.ChoiceNum < choices.Count;
                    }

                    void SelectChoice(int index)
                    {
                        // de-register everything and destroy the choices
                        _inputActionsDialogueBox?.ChoicesSelectionMap.Disable();
                        _inputActionsDialogueBox?.ContinueMap.Enable();
                        _inputActionsDialogueBox?.ChoicesSelectionMap.RemoveCallbacks(dialogueChoices);
                        dialogueChoices.ChoiceSelectedEvent -= SelectChoice;
                        Destroy(dialogueChoicesGameObject);
                        onChoiceSelected.Invoke(index);
                    }
                }

                ScrollToBottom();
            }
            catch (Exception e)
            {
                Logger.ZLogError(e, $"Something went wrong while instantiating the choices");
            }
        }

        /// <summary>
        ///     Scroll to bottom.
        /// </summary>
        private void ScrollToBottom()
        {
            scrollView.CalculateLayoutInputVertical();
            scrollView.verticalNormalizedPosition = 0;
        }

        /// <summary>
        ///     Slide in the contents if they were not visible yet.
        /// </summary>
        private void SlideInIfNecessary()
        {
            animator.SetFloat(VisibleSpeedAnimatorHash, 1 / Settings.slideInDuration);
            animator.SetBool(VisibleAnimatorHash, true);
            growingContainer.ImmediatelyCompleteSizeAnimation = false;
        }

        /// <summary>
        ///     Set the image of the portrait according to the tag.
        /// </summary>
        /// <param name="mood">The mood (e.g.: neutral, bored, ...)</param>
        /// <param name="character">The character (e.g.: FirstCharacter, SecondCharacter, ...).</param>
        public void SetPortraitImage(string character, string mood)
        {
            animator.SetFloat(PortraitVisibleSpeedAnimatorHash, 1 / Settings.slideInDuration);
            animator.SetFloat(ShowPortraitSpeedAnimatorHash, 1 / Settings.slideInDuration);
            animator.SetBool(PortraitVisibleAnimatorHash, true);
            animator.SetBool(ShowPortrait1AnimatorHash, _willUsePortrait1);
            portraitContainer.SetImage(character, mood, _willUsePortrait1);
            _willUsePortrait1 = !_willUsePortrait1;
        }

        public void SetSigil(ISettingsSigils.GlyphType glyph1, ISettingsSigils.GlyphType glyph2,
            ISettingsSigils.GlyphType glyph3, int numUsages, bool isGamerMode)
        {
            animator.SetFloat(WordVisibleSpeedAnimatorHash, 1 / Settings.slideInDuration);
            animator.SetBool(WordVisibleAnimatorHash, true);
            sigilTitle.text = "";
            glyph1Image.sprite = SettingsSigils.GetGlyphSprite(glyph1, 0);
            glyph1Image.color = !isGamerMode ? Color.black : SettingsSigils.GetGlyphColor(glyph1);
            glyph2Image.sprite = SettingsSigils.GetGlyphSprite(glyph2, 1);
            glyph2Image.color = !isGamerMode ? Color.black : SettingsSigils.GetGlyphColor(glyph2);
            glyph3Image.sprite = SettingsSigils.GetGlyphSprite(glyph3, 2);
            glyph3Image.color = !isGamerMode ? Color.black : SettingsSigils.GetGlyphColor(glyph3);
            threeUsagesImage.enabled = numUsages >= 3;
            twoUsagesImage.enabled = numUsages >= 2;
            oneUsageImage.enabled = numUsages >= 1;
        }

        public void HideSigil()
        {
            animator.SetFloat(WordVisibleSpeedAnimatorHash, 1 / Settings.slideInDuration);
            animator.SetBool(WordVisibleAnimatorHash, false);
        }

        /// <summary>
        ///     Set the ink status.
        /// </summary>
        /// <param name="numFull">Number of full ink bottles.</param>
        /// <param name="numEmpty">Number of empty bottles.</param>
        public void SetInkStatus(int numFull, int numEmpty)
        {
            animator.SetFloat(InkVisibleSpeedAnimatorHash, 1 / Settings.slideInDuration);
            animator.SetBool(InkVisibleAnimatorHash, numFull > 0 || numEmpty > 0);
            inkContainer.SetInkStatus(numFull, numEmpty);
        }

        /// <summary>
        ///     Relationship status is invisible at first; by calling this method, it becomes visible.
        /// </summary>
        public void EnableRelationshipStatus()
        {
            relationshipStatus.Enable();
        }

        /// <summary>
        ///     Make relationship status invisible (for characters with no relationship status).
        /// </summary>
        public void DisableRelationshipStatus()
        {
            relationshipStatus.Disable();
        }

        /// <summary>
        ///     Set the current heart level.
        /// </summary>
        /// <param name="level">The level, between 0 (worst) and 1 (best).</param>
        public void SetRelationshipStatusLevel(float level)
        {
            relationshipStatus.SetLevel(level);
        }

        /// <summary>
        ///     Invoked when the show animation starts.
        /// </summary>
        public void ShowAnimationStarted()
        {
            AudioSystem.PlaySoundEffect("openDialogue");
        }

        /// <summary>
        ///     Invoked when the show animation completes.
        /// </summary>
        public void ShowAnimationCompleted()
        {
            animator.SetBool(ShowAnimationCompletedAnimatorHash, true);
        }

        /// <summary>
        ///     Hide the dialogue box by sliding out the panel.
        /// </summary>
        public void Hide()
        {
            animator.SetBool(VisibleAnimatorHash, false);
            animator.SetBool(InkVisibleAnimatorHash, false);
            animator.SetBool(PortraitVisibleAnimatorHash, false);
            animator.SetBool(WordVisibleAnimatorHash, false);
            animator.SetBool(ShowAnimationCompletedAnimatorHash, false);
        }

        /// <summary>
        ///     Invoked when the hide animation starts.
        /// </summary>
        public void HideAnimationStarted()
        {
            AudioSystem.PlaySoundEffect("closeDialogue");
        }

        /// <summary>
        ///     Invoked when the hide operation is completed, and we clear the actual contents.
        /// </summary>
        public void HideAnimationCompleted()
        {
            // clear all the contents: portrait, ink and text
            growingContainer.ImmediatelyCompleteSizeAnimation = true;
            portraitContainer.ClearImages();
            SetInkStatus(0, 0);
            foreach (Transform content in textLinesContainer.transform) Destroy(content.gameObject);
        }

        /// <summary>
        ///     Show the animation of the sigil influence.
        /// </summary>
        public void ApplySigilInfluence()
        {
            animator.SetTrigger(ApplySigilInfluenceAnimatorHash);
        }

        #region animator variable name hashes

        private static readonly int ShowAnimationCompletedAnimatorHash =
            Animator.StringToHash("ShowAnimationCompleted");

        private static readonly int VisibleAnimatorHash = Animator.StringToHash("Visible");
        private static readonly int VisibleSpeedAnimatorHash = Animator.StringToHash("VisibleSpeed");
        private static readonly int InkVisibleAnimatorHash = Animator.StringToHash("InkVisible");
        private static readonly int InkVisibleSpeedAnimatorHash = Animator.StringToHash("InkVisibleSpeed");
        private static readonly int PortraitVisibleAnimatorHash = Animator.StringToHash("PortraitVisible");
        private static readonly int PortraitVisibleSpeedAnimatorHash = Animator.StringToHash("PortraitVisibleSpeed");
        private static readonly int WordVisibleAnimatorHash = Animator.StringToHash("WordVisible");
        private static readonly int WordVisibleSpeedAnimatorHash = Animator.StringToHash("WordVisibleSpeed");

        // private static readonly int WordVisibleSpeedAnimatorHash = Animator.StringToHash("WordVisibleSpeed");
        private static readonly int ShowPortrait1AnimatorHash = Animator.StringToHash("ShowPortrait1");
        private static readonly int ShowPortraitSpeedAnimatorHash = Animator.StringToHash("ShowPortraitSpeed");
        private static readonly int ApplySigilInfluenceAnimatorHash = Animator.StringToHash("ApplySigilInfluence");

        #endregion
    }
}