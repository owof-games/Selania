using Febucci.TextAnimatorForUnity;
using Microsoft.Extensions.Logging;
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

        /// <summary>
        ///     The logger used by this component.
        /// </summary>
        [Inject] internal ILogger<TextLine> Logger = null!;

#if UNITY_EDITOR
        private void OnValidate()
        {
            typewriterComponent = GetComponentInChildren<TypewriterComponent>();
        }
#endif

        /// <summary>
        ///     Set the text of this line.
        /// </summary>
        /// <param name="text">The text of this line.</param>
        public void SetText(string text)
        {
            typewriterComponent.ShowText(text);
        }
    }
}