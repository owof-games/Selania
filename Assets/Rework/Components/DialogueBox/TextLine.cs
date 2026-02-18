using Cysharp.Threading.Tasks;
using Febucci.TextAnimatorForUnity;
using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using TMPro;
using UnityEngine;
using VContainer;
using ZLogger;

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
        /// Whether the text has been already completely shown.
        /// </summary>
        public bool textCompletelyShown => !typewriterComponent.IsShowingText;

        /// <summary>
        /// Immediately show all the text. If it's still appearing, it will completely show it.
        /// </summary>
        public void ShowAllText()
        {
            typewriterComponent.SkipTypewriter();
        }

        /// <summary>
        ///     Set the text of this line.
        /// </summary>
        /// <param name="speaker">The character speaking; if null, the character name is not shown.</param>
        /// <param name="text">The text of this line.</param>
        public void SetText(string? speaker, string? text)
        {
            if (speaker != null)
            {
                speakerTextMeshPro.text = speaker;
                speakerTextMeshPro.color = SettingsDialogueBox.GetCharacterTagColorByName(speaker);
            }
            else
            {
                DestroyImmediate(speakerTextMeshPro.gameObject);
            }

            typewriterComponent.ShowText(text);
        }

        /// <summary>
        ///     Get a task that is resolved when the text is completely shown.
        /// </summary>
        /// <returns>The task that gets resolved when the text is completely shown.</returns>
        public UniTask GetCompletelyShownTextTask()
        {
            if (textCompletelyShown) return UniTask.CompletedTask;
            var completionSource = new UniTaskCompletionSource();
            typewriterComponent.onTextShowed.AddListener(() =>
            {
                var result = completionSource.TrySetResult();
                if (!result) Logger.ZLogError($"Cannot complete the task for line completion");
            });
            return completionSource.Task;
        }
    }
}