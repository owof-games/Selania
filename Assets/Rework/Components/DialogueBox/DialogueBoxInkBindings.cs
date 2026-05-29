using System.Diagnostics.CodeAnalysis;
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

        [SerializeField] private int minRelationshipLevel = -9;
        [SerializeField] private int maxRelationshipLevel = 9;

        /// <summary>
        ///     Who was the speaker of the last line (or <c>null</c> if there has been no line yet).
        /// </summary>
        private readonly ReactiveProperty<string?> _lastSpeakingCharacter = new(null);

        /// <summary>
        ///     The display name last used for the speaking character.
        /// </summary>
        private string? _lastSpeakingDisplayName;

        /// <summary>
        ///     Logger used by this component.
        /// </summary>
        [Inject] internal ILogger<DialogueBoxInkBindings> Logger = null!;

        [Inject] internal ISettingsDialogueBox SettingsDialogueBox = null!;

        /// <summary>
        ///     The object that can control the choices of the story.
        /// </summary>
        [Inject] internal IStoryChoicesSelector StoryChoicesSelector = null!;

        [Inject] internal IStoryGamerMode StoryGamerMode = null!;

        [Inject] internal IStoryInkInfo StoryInkInfo = null!;

        /// <summary>
        ///     The object that can control the linear progression of the story.
        /// </summary>
        [Inject] internal IStoryLinear StoryLinear = null!;

        [Inject] internal IStoryRelationshipInfo StoryRelationshipInfo = null!;

        [Inject] internal IStorySigilSupport StorySigilSupport = null!;

        private void Start()
        {
            var parsedTextInfoObservable = StoryLinear.currentTextObservable.Select(ParseCurrentTextInfo);

            parsedTextInfoObservable.Subscribe(CurrentTextChanged).AddTo(this);

            HandleRelationshipLevel(parsedTextInfoObservable);

            StoryLinear.conversationInProgressObservable.Subscribe(ConversationInProgress).AddTo(this);

            StoryLinear.imageObservable.Subscribe(OnImage).AddTo(this);

            StoryChoicesSelector.choicesObservable.Subscribe(ChoicesChanged).AddTo(this);

            dialogueBox.continueRequestsObservable.Subscribe(ContinueActionOnPerformed).AddTo(this);

            // hook to all ink variables, and update the ink only when it's the current speaker
            foreach (var c in SettingsDialogueBox.characterInkVariables)
            {
                SubscribeToCharacterInk(c.Character, c.InkVariable);
            }

            StorySigilSupport.ActiveSigilInfo
                .Subscribe(descriptor =>
                {
                    if (descriptor == null)
                        dialogueBox.HideSigil();
                    else
                        dialogueBox.SetSigil(descriptor.Glyph1, descriptor.Glyph2, descriptor.Glyph3,
                            descriptor.numUsages);
                })
                .AddTo(this);
        }

        private void HandleRelationshipLevel(Observable<ParsedText> parsedTextInfoObservable)
        {
            // extract the relationship level with the latest character we're speaking with (or null if there's no relationship level tracked with that character)
            var relationshipLevelObservable = parsedTextInfoObservable
                .Select(data => data.Character)
                .WhereNotNull()
                .Select(character =>
                    StoryRelationshipInfo.GetRelationshipLevelObservableFor(SettingsDialogueBox, character))
                .Switch();

            // update the relationship status to the correct level when there's a valid level
            relationshipLevelObservable
                .WhereNotNull()
                .Subscribe(level =>
                    dialogueBox.SetRelationshipStatusLevel(
                        Mathf.InverseLerp(minRelationshipLevel, maxRelationshipLevel, level)))
                .AddTo(this);

            // show the relationship status when in gamer mode and there's a valid level
            relationshipLevelObservable.Select(x => x.HasValue)
                .CombineLatest(StoryGamerMode.gamerMode, (hasValidLevel, isGamerMode) => (hasValidLevel, isGamerMode))
                .Subscribe(data =>
                {
                    var (hasValidLevel, isGamerMode) = data;
                    if (hasValidLevel && isGamerMode)
                    {
                        dialogueBox.EnableRelationshipStatus();
                    }
                    else
                    {
                        dialogueBox.DisableRelationshipStatus();
                    }
                })
                .AddTo(this);
        }

        private void SubscribeToCharacterInk(string character, string inkVariable)
        {
            if (string.IsNullOrWhiteSpace(inkVariable)) return;
            StoryInkInfo
                .GetInkLevelObservable(inkVariable)
                .CombineLatest(_lastSpeakingCharacter.WhereNotNull(),
                    (inkLevel, lastSpeakingCharacter) => (inkLevel, lastSpeakingCharacter))
                .Subscribe(value =>
                {
                    if (value.lastSpeakingCharacter != character) return;
                    if (value.inkLevel == 0)
                        dialogueBox.SetInkStatus(0, 0);
                    else
                        dialogueBox.SetInkStatus(value.inkLevel, 4 - value.inkLevel);
                })
                .AddTo(this);
        }

        /// <summary>
        ///     Invoked to inform whether there's a conversation going on or not.
        /// </summary>
        /// <param name="isInProgress"><c>true</c> if a conversation is in progress, <c>false</c> otherwise.</param>
        private void ConversationInProgress(bool isInProgress)
        {
            if (isInProgress) return;
            dialogueBox.Hide();
            _lastSpeakingCharacter.Value = null;
            // no need to explicitly handle the show part: adding a line of text or a choice automatically shows the
            // dialogue panel
        }

        /// <summary>
        ///     Invoked whenever there's an image to display.
        /// </summary>
        /// <param name="spriteName">Name of the sprite to add.</param>
        private void OnImage(string spriteName)
        {
            dialogueBox.AddImage(spriteName);
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

        private ParsedText ParseCurrentTextInfo(
            IStoryLinear.CurrentTextInfo currentTextInfo)
        {
            currentTextInfo.Deconstruct(out var currentText);

            TryGetSpeakerAndPortraitWithNewSystem(currentText, out var character, out var displayName, out var mood,
                out var actualText);

            return new ParsedText(character, displayName, mood, actualText);
        }

        /// <summary>
        ///     Invoked whenever the current text changes.
        /// </summary>
        /// <param name="parsedText">The data about the current text line.</param>
        private void CurrentTextChanged(ParsedText parsedText)
        {
            var (character, displayName, mood, actualText) = parsedText;

            _lastSpeakingCharacter.Value = character;

            if (displayName != _lastSpeakingDisplayName && character != null && displayName != null)
            {
                Logger.ZLogTrace($"Previous speaker was {_lastSpeakingCharacter}, new one is {character}.");
                dialogueBox.AddTextLine((character, displayName), actualText);
                _lastSpeakingDisplayName = displayName;
            }
            else
            {
                // either the speaker was the same (do not print it), or no speaker was given (AKA it's implied it's
                // the same as the previous line)
                dialogueBox.AddTextLine(null, actualText);
            }

            if (character != null && mood != null)
            {
                Logger.ZLogTrace($"Setting portrait image {character} + {mood}.");
                dialogueBox.SetPortraitImage(character, mood);
            }
            else
            {
                Logger.ZLogTrace($"No portrait to set");
            }
        }

        /// <summary>
        ///     Try to parse the line and its header.
        /// </summary>
        /// <param name="currentText">
        ///     The text to parse, in the form "character, displayName, mood: text", or just "text" if
        ///     nothing changed from the previous line.
        /// </param>
        /// <param name="character">The character extracted from the header.</param>
        /// <param name="displayName">The display name extracted from the header.</param>
        /// <param name="mood">The mood extracted from the header.</param>
        /// <param name="actualText">The actual text contained in the line.</param>
        /// <returns>
        ///     <c>true</c> if the <paramref name="character" />, <paramref name="displayName" /> and <paramref name="mood" />
        ///     were present in the header and filled, <c>false</c> otherwise.
        /// </returns>
        private void TryGetSpeakerAndPortraitWithNewSystem(string currentText,
            [NotNullWhen(true)] out string? character, [NotNullWhen(true)] out string? displayName,
            [NotNullWhen(true)] out string? mood, out string actualText)
        {
            // initial set up, to use when we can't parse the header.
            character = null;
            displayName = null;
            mood = null;
            actualText = currentText;

            // try to split the speaker + mood part from the actual text
            var parts = currentText.Split(':', 2);
            if (parts.Length != 2)
            {
                Logger.ZLogTrace($"No header found in the line.");
                return;
            }

            // try to split the header parts
            var headerParts = parts[0].Trim().Split(',', 3);
            if (headerParts.Length != 3)
            {
                Logger.ZLogWarning($"Cannot parse the header '{parts[0]}'");
                return;
            }

            // confirm that the parsing succeeded only if the character mood exists
            character = headerParts[0].Trim();
            mood = headerParts[2].Trim();

            // if the parsing failed, don't update and immediately return
            if (!SettingsDialogueBox.VerifyCharacterData(character, mood)) return;

            // there was a valid header, so set the actual text and the display name
            displayName = headerParts[1].Trim();
            actualText = parts[1].Trim();
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
                .Map(choice =>
                {
                    TryGetSpeakerAndPortraitWithNewSystem(choice.text, out _, out _, out _, out var actualText);
                    return new DialogueChoices.Choice(choice.index, actualText);
                });

            // show the choices
            dialogueBox.AddChoices(dialogueBoxChoices,
                index =>
                {
                    Logger.ZLogTrace($"Choice index {index}");
                    StoryChoicesSelector.PickChoiceWithIndex(index);
                });
        }

        private record ParsedText(string? Character, string? DisplayName, string? Mood, string ActualText);
    }
}