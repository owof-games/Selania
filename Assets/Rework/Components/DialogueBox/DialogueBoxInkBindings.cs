using System.Collections.Generic;
using System.Linq;
using Microsoft.Extensions.Logging;
using R3;
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
            StoryLinear.currentTextObservable.Subscribe(CurrentTextChanged).AddTo(this);

            StoryLinear.conversationInProgressObservable.Subscribe(ConversationInProgress).AddTo(this);

            StoryChoicesSelector.ChoicesObservable.Subscribe(ChoicesChanged).AddTo(this);

            dialogueBox.OnContinueRequested += ContinueActionOnPerformed;
            Disposable.Create(() => dialogueBox.OnContinueRequested -= ContinueActionOnPerformed).AddTo(this);
        }

        private void ConversationInProgress(bool isInProgress)
        {
            if (!isInProgress)
            {
                dialogueBox.Hide();
            }
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

        private void CurrentTextChanged(IStoryLinear.CurrentTextInfo currentTextInfo)
        {
            var currentText = currentTextInfo.currentText;
            var tags = currentTextInfo.tags;

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

        private void ChoicesChanged(IStoryChoicesSelector.ChoicesInfo choicesInfo)
        {
            // create the choices
            var dialogueBoxChoices = choicesInfo.choices
                .Map(choice => new DialogueChoices.Choice(choice.index, choice.text));
            if (dialogueBoxChoices.Length == 0) return;
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