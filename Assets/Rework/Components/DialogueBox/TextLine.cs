using Febucci.TextAnimatorForUnity;
using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using TMPro;
using UnityEngine;
using VContainer;

namespace Selania.Rework.Components.DialogueBox
{
    /// <summary>
    ///     A single text line (or multiline) of the dialogue box.
    /// </summary>
    public class TextLine : MonoBehaviour
    {
        [SerializeField] [Tooltip("The typewriter component")]
        private TypewriterComponent typewriterComponent = null!;

        [SerializeField] [Tooltip("The speaker component")]
        private TextMeshProUGUI speakerTextMeshPro = null!;

        /// <summary>
        ///     The logger used by this component.
        /// </summary>
        [Inject] internal ILogger<TextLine> Logger = null!;

        /// <summary>
        ///     Settings for the dialogue box.
        /// </summary>
        [Inject] internal ISettingsDialogueBox SettingsDialogueBox = null!;

        /// <summary>
        ///     Whether the text has been already completely shown.
        /// </summary>
        public bool textCompletelyShown => !typewriterComponent.IsShowingText;

        /// <summary>
        ///     Immediately show all the text. If it's still appearing, it will completely show it.
        /// </summary>
        public void ShowAllText()
        {
            typewriterComponent.SkipTypewriter();
        }

        /// <summary>
        ///     Set the text of this line.
        /// </summary>
        /// <param name="speaker">Info about the speaker (character like FirstCharacter and display name like Chitarra).</param>
        /// <param name="text">The text for this line.</param>
        public void SetText((string Character, string DisplayName)? speaker, string? text)
        {
            if (speaker != null)
            {
                speakerTextMeshPro.text = speaker.Value.DisplayName;
                speakerTextMeshPro.color = SettingsDialogueBox.GetCharacterTagColor(speaker.Value.Character);
            }
            else
            {
                DestroyImmediate(speakerTextMeshPro.gameObject);
            }

            typewriterComponent.ShowText(text);
        }
    }
}