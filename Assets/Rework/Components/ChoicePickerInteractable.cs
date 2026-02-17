using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components
{
    /// <summary>
    ///     A component that picks a choice when the associated interactable is interacted with.
    /// </summary>
    [RequireComponent(typeof(IInteractable))]
    public class ChoicePickerInteractable : MonoBehaviour, IAutomaticEditorInject
    {
        [SerializeField] [Tooltip("Text of the choice that this interactable will pick")]
        private string? choiceText;

        /// <summary>
        ///     The logger used for this component.
        /// </summary>
        [Inject] internal ILogger<ChoicePickerInteractable> Logger = null!;

        /// <summary>
        ///     The object that allows this choice picker to pick a choice.
        /// </summary>
        [Inject] internal IStoryChoicesSelector StoryChoicesSelector = null!;

        private void Start()
        {
            if (string.IsNullOrWhiteSpace(choiceText)) Debug.LogError("choice text cannot be null or empty");

            // hook to the interactable's event
            var interactable = GetComponent<IInteractable>();
            interactable.AddInteractionListener(OnInteraction).DisposeWith(gameObject);

            Logger.ZLogTrace($"Created choice picker for choice '{choiceText}'.");
        }

        private void OnInteraction(IInteractable interactable)
        {
            // the interactable has been interacted with: pick the choice!
            Logger.ZLogTrace($"Asking to pick choice '{choiceText}'.");
            StoryChoicesSelector.PickChoiceWithText(choiceText!);
        }
    }
}