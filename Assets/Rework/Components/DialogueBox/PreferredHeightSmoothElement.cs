using LitMotion;
using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using UnityEngine;
using UnityEngine.UI;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.DialogueBox
{
    public class PreferredHeightSmoothElement : MonoBehaviour, ILayoutElement, IAutomaticEditorInject
    {
        [Tooltip("The target element whose preferred height we should track. Must implement ILayoutElement.")]
        [SerializeField]
        private MonoBehaviour targetElement = null!;

        /// <summary>
        ///     The actual target element, as an ILayoutElement.
        /// </summary>
        private ILayoutElement? _actualTargetElement;

        /// <summary>
        ///     Whether the <see cref="CalculateLayoutInputHorizontal" /> method has been called. Used to decide whether
        ///     to call it on the target element once it's obtained.
        /// </summary>
        private bool _calculateLayoutInputHorizontalCalled;

        /// <summary>
        ///     Whether the <see cref="CalculateLayoutInputVertical" /> method has been called. Used to decide whether
        ///     to call it on the target element once it's obtained.
        /// </summary>
        private bool _calculateLayoutInputVerticalCalled;

        /// <summary>
        ///     The last preferred height we received, and towards which the animation is moving (if any).
        /// </summary>
        private float _destinationPreferredHeight;

        /// <summary>
        ///     The motion handle of the animation (if any).
        /// </summary>
        private MotionHandle? _motionHandle;

        /// <summary>
        ///     The logger element for this component.
        /// </summary>
        [Inject] internal ILogger<PreferredHeightSmoothElement> Logger = null!;

        /// <summary>
        ///     The dialogue box settings to read the text line speed from.
        /// </summary>
        [Inject] internal ISettingsDialogueBox SettingsDialogueBox = null!;

        private void Start()
        {
            if (targetElement is ILayoutElement layoutElement)
            {
                _actualTargetElement = layoutElement;
                if (_calculateLayoutInputHorizontalCalled) CalculateLayoutInputHorizontal();

                if (_calculateLayoutInputVerticalCalled) CalculateLayoutInputVertical();
            }
            else
            {
                Logger.ZLogError($"The target element {targetElement.name} is not an ILayoutElement");
            }
        }

        public void CalculateLayoutInputHorizontal()
        {
            _calculateLayoutInputHorizontalCalled = true;
            _actualTargetElement?.CalculateLayoutInputHorizontal();
        }

        public void CalculateLayoutInputVertical()
        {
            _calculateLayoutInputVerticalCalled = true;
            if (_actualTargetElement == null) return;

            _actualTargetElement.CalculateLayoutInputVertical();

            if (Mathf.Approximately(_destinationPreferredHeight, _actualTargetElement.preferredHeight)) return;
            _destinationPreferredHeight = _actualTargetElement.preferredHeight;
            if (_motionHandle != null && _motionHandle.Value.IsPlaying()) _motionHandle?.Cancel();

            _motionHandle = LMotion
                .Create(preferredHeight, _actualTargetElement.preferredHeight,
                    SettingsDialogueBox.textLineSlideDuration)
                .WithEase(Ease.OutQuad)
                .Bind(this, (newPreferredHeight, element) =>
                {
                    if (!element!.isActiveAndEnabled)
                        return;
                    element.preferredHeight = newPreferredHeight;
                    LayoutRebuilder.MarkLayoutForRebuild(transform as RectTransform);
                })
                .AddTo(this);
        }

        public float minWidth => _actualTargetElement?.minWidth ?? 0;
        public float preferredWidth => _actualTargetElement?.preferredWidth ?? 0;
        public float flexibleWidth => _actualTargetElement?.flexibleWidth ?? 0;
        public float minHeight => _actualTargetElement?.minHeight ?? 0;
        public float preferredHeight { get; private set; }
        public float flexibleHeight => _actualTargetElement?.flexibleHeight ?? 0;
        public int layoutPriority => _actualTargetElement?.layoutPriority ?? 0;
    }
}