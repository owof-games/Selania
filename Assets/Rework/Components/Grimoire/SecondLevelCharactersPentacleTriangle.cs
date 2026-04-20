using Alchemy.Inspector;
using LitMotion;
using LitMotion.Extensions;
using Selania.Rework.Interfaces;
using UnityEngine;
using UnityEngine.UI;
using VContainer;
using Debug = System.Diagnostics.Debug;

namespace Selania.Rework.Components.Grimoire
{
    [RequireComponent(typeof(Image))]
    [RequireComponent(typeof(RectTransform))]
    public class SecondLevelCharactersPentacleTriangle : MonoBehaviour, IAutomaticEditorInject
    {
        [SerializeField] [Tooltip("The maximum scale for the Y coordinate.")]
        private float maxYScale = 1f;

        [SerializeField] [Tooltip("The minimum scale for the Y coordinate.")]
        private float minYScale = 1f;

        [SerializeField] [Tooltip("Anchored position when the value is negative.")]
        private Vector2 negativeAnchoredPosition;

        [SerializeField] [Tooltip("Rotation when the value is negative.")]
        private Quaternion negativeRotation;

        [SerializeField] [Tooltip("Color used when in the negatives.")]
        private Color negativeColor;

        [SerializeField] [Tooltip("Type of ease used to animate.")]
        private Ease animationEase = Ease.Linear;

        [SerializeField] [Tooltip("Type of loop used to animate.")]
        private LoopType animationLoopType = LoopType.Restart;

        private Image? _image;

        private Vector2 _initialAnchoredPosition;
        private Color _initialColor;
        private Quaternion _initialLocalRotation;

        private MotionHandle _previousMotionHandle;
        private RectTransform? _rectTransform;

        [Inject] internal ISettingsBook SettingsBook = null!;

        private void Awake()
        {
            _rectTransform = (RectTransform)transform;
            _initialAnchoredPosition = _rectTransform.anchoredPosition;
            _initialLocalRotation = _rectTransform.localRotation;
            _image = GetComponent<Image>();
            _initialColor = _image.color;
        }

        /// <summary>
        /// Set the current value for this triangle.
        /// </summary>
        /// <param name="value">The value for this triangle.</param>
        private void SetValue(float value)
        {
            Debug.Assert(_rectTransform != null, nameof(_rectTransform) + " != null");
            Debug.Assert(_image != null, nameof(_image) + " != null");

            var (position, localRotation, yScale, color) = GetValueGeometry(value);

            _rectTransform.anchoredPosition = position;
            _rectTransform.localScale = _rectTransform.localScale with { y = yScale };
            _rectTransform.localRotation = localRotation;
            _image.color = color;
        }

        /// <summary>
        /// Show an animation between two values for this triangle, or just show the value if both are the same.
        /// </summary>
        /// <param name="value1">The starting value.</param>
        /// <param name="value2">The ending value.</param>
        public void SetValue(float value1, float value2)
        {
            if (_previousMotionHandle.IsValid()) _previousMotionHandle.Cancel();

            if (Mathf.Approximately(value1, value2))
            {
                SetValue(value1);
                return;
            }

            Debug.Assert(_rectTransform != null, nameof(_rectTransform) + " != null");
            Debug.Assert(_image != null, nameof(_image) + " != null");

            // can't animate between positive and negative values (which should never happen anyway): in that case,
            // the base value is 0.
            if (value1 < 0 && value2 > 0 || value1 > 0 && value2 < 0)
            {
                value1 = 0;
            }

            // get the geometry data
            var (_, _, scale1, _) = GetValueGeometry(value1);
            var (position, localRotation, scale2, color) = GetValueGeometry(value2);

            // position and color are fixed, scale is animated
            _rectTransform.anchoredPosition = position;
            _rectTransform.localRotation = localRotation;
            _image.color = color;
            _previousMotionHandle = LMotion.Create(scale1, scale2, SettingsBook.choiceVariablePentacleAnimationDuration)
                .WithEase(animationEase)
                .WithLoops(-1, animationLoopType)
                .BindToLocalScaleY(_rectTransform);
        }

        /// <summary>
        /// Get the data about the triangle geometry from the value.
        /// </summary>
        /// <param name="value">The value to use.</param>
        /// <returns>The triple anchored position, local Y scale and color corresponding to the given value.</returns>
        private (Vector2, Quaternion, float, Color) GetValueGeometry(float value)
        {
            Vector2 position;
            Quaternion localRotation;
            float yScale;
            Color color;
            if (value < 0)
            {
                position = negativeAnchoredPosition;
                localRotation = negativeRotation;
                var t = Mathf.InverseLerp(0, SettingsBook.minChoiceVariableValue, value);
                yScale = Mathf.Lerp(0, minYScale, t);
                color = negativeColor;
            }
            else
            {
                position = _initialAnchoredPosition;
                localRotation = _initialLocalRotation;
                var t = Mathf.InverseLerp(0, SettingsBook.maxChoiceVariableValue, value);
                yScale = Mathf.Lerp(0, maxYScale, t);
                color = _initialColor;
            }

            return (position, localRotation, yScale, color);
        }

        /// <summary>
        /// Used by the interface to quickly set the negative anchored position.
        /// </summary>
        [Button]
        public void SetAsNegativeSettings()
        {
            var rectTransform = ((RectTransform)transform);
            negativeAnchoredPosition = rectTransform.anchoredPosition;
            negativeRotation = rectTransform.localRotation;
        }
    }
}