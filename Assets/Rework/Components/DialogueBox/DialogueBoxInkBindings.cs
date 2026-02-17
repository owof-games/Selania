using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using UnityEngine;
using UnityEngine.InputSystem;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.DialogueBox
{
    public class DialogueBoxInkBindings : MonoBehaviour, IAutomaticEditorInject
    {
        [SerializeField] [Tooltip("Name of the continue action map in the default input system")]
        private string continueActionMapName = "ContinueMap";

        [SerializeField] [Tooltip("Name of the continue action in the default input system")]
        private string continueActionName = "Continue";

        [SerializeField] [Tooltip("The dialogue box that gets controlled by these bindings.")]
        private DialogueBox dialogueBox = null!;

        /// <summary>
        ///     The list of all the disposables objects to free when this object gets removed.
        /// </summary>
        private readonly List<IDisposable> _disposables = new();

        private string? _lastSpeaker;

        /// <summary>
        ///     Logger used by this component.
        /// </summary>
        [Inject] internal ILogger<DialogueBoxInkBindings> Logger = null!;

        /// <summary>
        ///     The object that can control the choices of the story.
        /// </summary>
        [Inject] internal IStoryChoicesSelector StoryChoicesSelector = null!;

        /// <summary>
        ///     The object that can control the linear progression of the story.
        /// </summary>
        [Inject] internal IStoryLinear StoryLinear = null!;

        private void Start()
        {
            _disposables.Add(StoryLinear.AddCurrentTextChangedListener(CurrentTextChanged));
            _disposables.Add(StoryChoicesSelector.AddChoicesChangedListener(ChoicesChanged));

            var continueAction = GetContinueActionMap().actions.First(action => action.name == continueActionName);
            continueAction.performed += ContinueActionOnPerformed;
            _disposables.Add(Disposable.Create(() => continueAction.performed -= ContinueActionOnPerformed));
        }

        private void OnDestroy()
        {
            // free all disposables
            foreach (var disposable in _disposables) disposable.Dispose();
        }

        private void ContinueActionOnPerformed(InputAction.CallbackContext _)
        {
            Logger.ZLogTrace($"Continue");
            if (StoryLinear.canContinue) StoryLinear.Continue();
        }

        private static string? GetValue(ICollection<Tag> tags, string category)
        {
            return tags.FirstOrDefault(t => t.category == category)?.value;
        }

        /// <summary>
        ///     Get the action map used for the continue action.
        /// </summary>
        /// <returns>The action map used for the continue action.</returns>
        private InputActionMap GetContinueActionMap()
        {
            return InputSystem.actions.actionMaps.Single(actionMap => actionMap.name == continueActionMapName);
        }

        private void CurrentTextChanged(string currentText, ICollection<Tag> tags)
        {
            // add the current line with an optional speaker, if it changed
            var speaker = GetValue(tags, "speaker");
            if (speaker != _lastSpeaker && speaker != null)
            {
                Logger.ZLogTrace($"Previous speaker was {_lastSpeaker}, new one is {speaker}.");
                dialogueBox.AddTextLine(speaker, currentText);
                _lastSpeaker = speaker;
            }
            else
            {
                Logger.ZLogTrace($"Got a new speaker: {speaker}.");
                dialogueBox.AddTextLine(null, currentText);
            }

            // set the portrait
            var portrait = GetValue(tags, "portrait");
            if (portrait != null)
            {
                Logger.ZLogTrace($"Setting portrait image {portrait}.");
                dialogueBox.SetPortraitImage(portrait);
            }
            else
            {
                Logger.ZLogTrace($"No portrait to set");
            }

            // set up the continue input
            var continueActionMap = GetContinueActionMap();
            continueActionMap.Enable();
        }

        private void ChoicesChanged(IEnumerable<IStoryChoicesSelector.Choice> choices)
        {
            // disable the continue input
            var continueActionMap = GetContinueActionMap();
            continueActionMap.Enable();

            // create the choice
            dialogueBox.AddChoices(choices.Select(choice => new DialogueChoices.Choice(choice.index, choice.text)),
                index =>
                {
                    Logger.ZLogTrace($"Choice index {index}");
                    StoryChoicesSelector.PickChoiceWithIndex(index);
                });
        }
    }
}