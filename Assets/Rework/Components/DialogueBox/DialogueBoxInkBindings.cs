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

            StoryChoicesSelector.choicesObservable.Subscribe(ChoicesChanged).AddTo(this);

            dialogueBox.continueRequestsObservable.Subscribe(ContinueActionOnPerformed).AddTo(this);
        }

        /// <summary>
        ///     Invoked to inform whether there's a conversation going on or not.
        /// </summary>
        /// <param name="isInProgress"><c>true</c> if a conversation is in progress, <c>false</c> otherwise.</param>
        private void ConversationInProgress(bool isInProgress)
        {
            if (!isInProgress) dialogueBox.Hide();
            // no need to explicitly handle the show part: adding a line of text or a choice automatically shows the
            // dialogue panel
        }

        /// <summary>
        ///     Invoked whenever the dialogue box requests a new line to show.
        /// </summary>
        /// <param name="_">(unused)</param>
        private void ContinueActionOnPerformed(Unit _)
        {
            Logger.ZLogTrace($"Continue");
            if (StoryLinear.canContinue) StoryLinear.Continue();
        }

        /// <summary>
        ///     Given a set of tags in the form &lt;category&gt;:&lt;value&gt;, this method returns the value of the first tag
        ///     found with the given category.
        /// </summary>
        /// <param name="tags">Set of tags to look in.</param>
        /// <param name="category">Category to look for.</param>
        /// <returns>The value of the first tag with the given category, or <c>null</c> if none has been found.</returns>
        private static string? GetValue(ICollection<Tag> tags, string category)
        {
            return tags.FirstOrDefault(t => t.category == category)?.value;
        }

        /// <summary>
        ///     Invoked whenever the current text changes.
        /// </summary>
        /// <param name="currentTextInfo">Info about the current text.</param>
        private void CurrentTextChanged(IStoryLinear.CurrentTextInfo currentTextInfo)
        {
            // extract fields
            var (currentText, tags) = currentTextInfo;

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

        /// <summary>
        ///     Invoked whenever there are new choices to display.
        /// </summary>
        /// <param name="choicesInfo">Info about the choices to display.</param>
        private void ChoicesChanged(IStoryChoicesSelector.ChoicesInfo choicesInfo)
        {
            // create the choice objects
            if (choicesInfo.choices.Count == 0) return;
            var dialogueBoxChoices = choicesInfo.choices
                .Map(choice => new DialogueChoices.Choice(choice.index, choice.text));

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