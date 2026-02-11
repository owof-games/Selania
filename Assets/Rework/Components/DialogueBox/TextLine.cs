using Febucci.TextAnimatorForUnity;
using LitMotion;
using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.DialogueBox
{
    /// <summary>
    ///     A single text line (or multiline) of the dialogue box.
    /// </summary>
    public class TextLine : MonoBehaviour, ILayoutElement
    {
        [SerializeField] [Tooltip("The text mesh pro object that contains the text")]
        private TextMeshProUGUI textMeshProUGUI = null!;

        [SerializeField] [Tooltip("The typewriter component")]
        private TypewriterComponent typewriterComponent = null!;

        private float _destinationPreferredHeight;

        private MotionHandle? _motionHandle;

        /// <summary>
        ///     The logger used by this component.
        /// </summary>
        [Inject] internal ILogger<TextLine> Logger = null!;

        /// <summary>
        ///     The dialogue box settings to read the text line speed from.
        /// </summary>
        [Inject] internal ISettingsDialogueBox SettingsDialogueBox = null!;

#if UNITY_EDITOR
        private void OnValidate()
        {
            textMeshProUGUI = GetComponentInChildren<TextMeshProUGUI>();
            typewriterComponent = GetComponentInChildren<TypewriterComponent>();
        }
#endif

        public void CalculateLayoutInputHorizontal()
        {
            textMeshProUGUI.CalculateLayoutInputHorizontal();
        }

        public void CalculateLayoutInputVertical()
        {
            textMeshProUGUI.CalculateLayoutInputVertical();
            if (Mathf.Approximately(_destinationPreferredHeight, textMeshProUGUI.preferredHeight)) return;
            Logger.ZLogTrace(
                $"Animating height from {_destinationPreferredHeight} to {textMeshProUGUI.preferredHeight}");
            _destinationPreferredHeight = textMeshProUGUI.preferredHeight;
            if (_motionHandle != null && _motionHandle.Value.IsPlaying()) _motionHandle?.Cancel();

            _motionHandle = LMotion
                .Create(preferredHeight, textMeshProUGUI.preferredHeight, SettingsDialogueBox.textLineSlideDuration)
                .WithEase(Ease.OutQuad)
                .Bind(newPreferredHeight =>
                {
                    preferredHeight = newPreferredHeight;
                    if (!isActiveAndEnabled)
                        return;
                    LayoutRebuilder.MarkLayoutForRebuild(transform as RectTransform);
                });
        }

        public float minWidth => textMeshProUGUI.minWidth;
        public float preferredWidth => textMeshProUGUI.preferredWidth;
        public float flexibleWidth => textMeshProUGUI.flexibleWidth;
        public float minHeight => textMeshProUGUI.minHeight;
        public float preferredHeight { get; private set; }
        public float flexibleHeight => textMeshProUGUI.flexibleHeight;
        public int layoutPriority => textMeshProUGUI.layoutPriority;

        /// <summary>
        ///     Set the text of this line.
        /// </summary>
        /// <param name="text">The text of this line.</param>
        public void SetText(string text)
        {
            // textMeshProUGUI.SetText(text);
            typewriterComponent.ShowText(text);
        }
    }
}