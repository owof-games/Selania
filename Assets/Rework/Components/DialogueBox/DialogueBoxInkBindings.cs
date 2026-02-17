using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.DialogueBox
{
    public class DialogueBoxInkBindings : MonoBehaviour, IAutomaticEditorInject
    {
        [SerializeField] [Tooltip("The dialogue box that gets controlled by these bindings.")]
        private DialogueBox dialogueBox = null!;

        /// <summary>
        ///     The list of all the disposables objects to free when this object gets removed.
        /// </summary>
        private readonly List<IDisposable> _disposables = new();

        /// <summary>
        ///     Who was the speaker of the last line (or <c>null</c> if there has been no line yet).
        /// </summary>
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
            // register to events and save disposables to unregister
            _disposables.Add(StoryLinear.AddCurrentTextChangedListener(CurrentTextChanged));

            _disposables.Add(StoryChoicesSelector.AddChoicesChangedListener(ChoicesChanged));

            dialogueBox.OnContinueRequested += ContinueActionOnPerformed;
            _disposables.Add(Disposable.Create(() => dialogueBox.OnContinueRequested -= ContinueActionOnPerformed));
        }

        private void OnDestroy()
        {
            // free all disposables
            foreach (var disposable in _disposables) disposable.Dispose();
        }

        private void ContinueActionOnPerformed()
        {
            Logger.ZLogTrace($"Continue");
            if (StoryLinear.canContinue) StoryLinear.Continue();
        }

        private static string? GetValue(ICollection<Tag> tags, string category)
        {
            return tags.FirstOrDefault(t => t.category == category)?.value;
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
        }

        private void ChoicesChanged(IEnumerable<IStoryChoicesSelector.Choice> choices)
        {
            // create the choices
            var dialogueBoxChoices = choices.Select(choice => new DialogueChoices.Choice(choice.index, choice.text))
                .ToList();
            if (dialogueBoxChoices.Count == 0) return;
            // show the choices
            dialogueBox.AddChoices(dialogueBoxChoices,
                index =>
                {
                    Logger.ZLogTrace($"Choice index {index}");
                    StoryChoicesSelector.PickChoiceWithIndex(index);
                });
        }
    }
}