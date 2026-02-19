using System;
using System.Collections.Generic;
using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UI;
using VContainer;
using VContainer.Unity;
using ZLogger;

namespace Selania.Rework.Components.DialogueBox
{
    /// <summary>
    ///     The view manager for the dialogue box. This script controls the behavior of the component, without handling any
    ///     model connection.
    /// </summary>
    public class DialogueBox : MonoBehaviour, InputActionsDialogueBox.IContinueMapActions
    {
        private static readonly int ShowAnimationCompletedAnimatorHash =
            Animator.StringToHash("ShowAnimationCompleted");

        private static readonly int VisibleAnimatorHash = Animator.StringToHash("Visible");
        private static readonly int VisibleSpeedAnimatorHash = Animator.StringToHash("VisibleSpeed");
        private static readonly int InkVisibleAnimatorHash = Animator.StringToHash("InkVisible");
        private static readonly int InkVisibleSpeedAnimatorHash = Animator.StringToHash("InkVisibleSpeed");
        private static readonly int PortraitVisibleAnimatorHash = Animator.StringToHash("PortraitVisible");
        private static readonly int PortraitVisibleSpeedAnimatorHash = Animator.StringToHash("PortraitVisibleSpeed");
        private static readonly int ShowPortrait1AnimatorHash = Animator.StringToHash("ShowPortrait1");
        private static readonly int ShowPortraitSpeedAnimatorHash = Animator.StringToHash("ShowPortraitSpeed");

        [SerializeField] [Tooltip("The prefab that creates a text line once instantiated.")]
        private GameObject textLinePrefab = null!;

        [SerializeField] [Tooltip("The prefab that creates a set of choices once instantiated.")]
        private GameObject dialogueChoicesPrefab = null!;

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

        /// <summary>
        ///     An action that has a value if we're waiting to add choices to the box. Calling the action will actually
        ///     add the choices.
        /// </summary>
        private Action? _actualAddChoices;

        /// <summary>
        ///     The input actions with specific handling for the dialogue box.
        /// </summary>
        private InputActionsDialogueBox? _inputActionsDialogueBox;

        /// <summary>
        /// The latest text line created, if any. If a choice is created, the previous text line is forgotten about.
        /// </summary>
        private TextLine? _latestTextLine;

        /// <summary>
        ///     Whether the next portrait change will use portrait 1.
        /// </summary>
        private bool _willUsePortrait1 = true;

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

        private void Awake()
        {
            _inputActionsDialogueBox = new InputActionsDialogueBox();
            _inputActionsDialogueBox.ContinueMap.AddCallbacks(this);
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

        private void ContinueRequested()
        {
            if (_latestTextLine != null && !_latestTextLine.textCompletelyShown)
            {
                Logger.ZLogTrace($"Requested to continue, but the text was still appearing: show it all.");
                _latestTextLine.ShowAllText();
            }
            else if (_actualAddChoices != null)
            {
                Logger.ZLogTrace($"Requested to continue, but was waiting to show choices.");
                _actualAddChoices();
                _actualAddChoices = null;
            }
            else
            {
                Logger.ZLogTrace($"Requested to continue, and there was no text still appearing: continue.");
                OnContinueRequested?.Invoke();
            }
        }

        /// <summary>
        ///     Add a new text line to the dialogue box.
        /// </summary>
        /// <param name="speaker">The character speaking; if null, the character name is not shown.</param>
        /// <param name="text">The text to add.</param>
        public void AddTextLine(string? speaker, string? text)
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

        public void AddChoices(IEnumerable<DialogueChoices.Choice> choices, Action<int> onChoiceSelected)
        {
            if (_latestTextLine == null)
                ActualAddChoices(choices, onChoiceSelected);
            else
                _actualAddChoices = () => ActualAddChoices(choices, onChoiceSelected);
        }

        private void ActualAddChoices(IEnumerable<DialogueChoices.Choice> choices,
            Action<int> onChoiceSelected)
        {
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
                    dialogueChoices.ChoiceSelectedEvent += SelectChoice;
                    dialogueChoices.SetChoices(choices);
                    _latestTextLine = null;

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
        /// Scroll to bottom.
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
        }

        /// <summary>
        ///     Set the image of the portrait according to the tag.
        /// </summary>
        /// <param name="tagName">The tag (e.g.: mentore_bored).</param>
        public void SetPortraitImage(string tagName)
        {
            animator.SetFloat(PortraitVisibleSpeedAnimatorHash, 1 / Settings.slideInDuration);
            animator.SetFloat(ShowPortraitSpeedAnimatorHash, 1 / Settings.slideInDuration);
            animator.SetBool(PortraitVisibleAnimatorHash, true);
            animator.SetBool(ShowPortrait1AnimatorHash, _willUsePortrait1);
            portraitContainer.SetImage(tagName, _willUsePortrait1);
            _willUsePortrait1 = !_willUsePortrait1;
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
        ///     Invoked whenever the continue button is pressed.
        /// </summary>
        public event Action? OnContinueRequested;


        public void ShowAnimationCompleted()
        {
            animator.SetBool(ShowAnimationCompletedAnimatorHash, true);
        }
    }
}