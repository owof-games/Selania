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
        [SerializeField] [Tooltip("The prefab that creates a text line once instantiated.")]
        private GameObject textLinePrefab = null!;

        [SerializeField] [Tooltip("The prefab that creates a set of choices once instantiated.")]
        private GameObject dialogueChoicesPrefab = null!;

        [SerializeField] [Tooltip("The container where all the text lines are added to.")]
        private RectTransform textLinesContainer = null!;

        [SerializeField] [Tooltip("The portrait container.")]
        private PortraitContainer portraitContainer = null!;

        [SerializeField] [Tooltip("The ink container.")]
        private InkContainer inkContainer = null!;

        [SerializeField] [Tooltip("The relationship status component.")]
        private RelationshipStatus relationshipStatus = null!;

        [SerializeField] [Tooltip("The scroll view displaying the dialogue")]
        private ScrollRect scrollView = null!;

        /// <summary>
        ///     The input actions with specific handling for the dialogue box.
        /// </summary>
        private InputActionsDialogueBox? _inputActionsDialogueBox;

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

        private void OnEnable()
        {
            _inputActionsDialogueBox?.Enable();
            _inputActionsDialogueBox?.ContinueMap.Disable();
            _inputActionsDialogueBox?.ChoicesSelectionMap.Disable();
        }

        private void OnDisable()
        {
            _inputActionsDialogueBox?.Disable();
        }

        private void OnDestroy()
        {
            _inputActionsDialogueBox?.ContinueMap.RemoveCallbacks(this);
            _inputActionsDialogueBox?.Dispose();
        }

#if UNITY_EDITOR
        private void OnValidate()
        {
            // automatically fill portraitContainer
            portraitContainer = GetComponentInChildren<PortraitContainer>();
            inkContainer = GetComponentInChildren<InkContainer>();
        }
#endif

        public void OnContinue(InputAction.CallbackContext context)
        {
            if (!context.performed) return;
            Logger.ZLogTrace($"Requested to continue.");
            OnContinueRequested?.Invoke();
        }

        /// <summary>
        ///     Add a new text line to the dialogue box.
        /// </summary>
        /// <param name="speaker">The character speaking; if null, the character name is not shown.</param>
        /// <param name="text">The text to add.</param>
        public void AddTextLine(string? speaker, string? text)
        {
            using (LifetimeScope.EnqueueParent(Scope))
            {
                _inputActionsDialogueBox?.ContinueMap.Enable();
                var textLineGameObject = Instantiate(textLinePrefab, textLinesContainer);
                var textLine = textLineGameObject.GetComponent<TextLine>();
                textLine.SetText(speaker, text);
            }

            ScrollToBottom();
        }

        public void AddChoices(IEnumerable<DialogueChoices.Choice> choices, Action<int> onChoiceSelected)
        {
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

        /// <summary>
        /// Scroll to bottom.
        /// </summary>
        private void ScrollToBottom()
        {
            scrollView.CalculateLayoutInputVertical();
            scrollView.verticalNormalizedPosition = 0;
        }

        /// <summary>
        ///     Set the image of the portrait according to the tag.
        /// </summary>
        /// <param name="tagName">The tag (e.g.: mentore_bored).</param>
        public void SetPortraitImage(string tagName)
        {
            portraitContainer.SetImage(tagName);
        }

        /// <summary>
        ///     Set the ink status.
        /// </summary>
        /// <param name="numFull">Number of full ink bottles.</param>
        /// <param name="numEmpty">Number of empty bottles.</param>
        public void SetInkStatus(int numFull, int numEmpty)
        {
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
    }
}