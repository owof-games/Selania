using System.Diagnostics.CodeAnalysis;
using Cysharp.Threading.Tasks;
using LitMotion;
using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using UnityEngine;
using UnityEngine.UI;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.DialogueBox
{
    /// <summary>
    ///     A container for a single child that animates its height as the height of its content changes.
    /// </summary>
    public class GrowingContainer : LayoutGroup, IAutomaticEditorInject
    {
        /// <summary>
        ///     The child object to read the height from.
        /// </summary>
        [SerializeField] private GameObject child = null!;

        /// <summary>
        ///     The current height animation.
        /// </summary>
        private MotionHandle _currentMotion;

        /// <summary>
        ///     This object's rect transform.
        /// </summary>
        private RectTransform? _myRectTransform;

        /// <summary>
        ///     The logger used by this object.
        /// </summary>
        [Inject] internal ILogger<GrowingContainer>? Logger;

        /// <summary>
        ///     The settings used to read about the kind of animation to adopt.
        /// </summary>
        [Inject] internal ISettingsDialogueBox? Settings;

        /// <summary>
        ///     Whether size animation should immediately complete. This is useful when the element is not visible, in order
        ///     not to introduce unexplainable resizing animation for the user.
        /// </summary>
        public bool immediatelyCompleteSizeAnimation { get; set; }

        /// <summary>
        ///     Cache and return this object's transform.
        /// </summary>
        /// <returns>This object's rect transform.</returns>
        private RectTransform GetMyRectTransform()
        {
            _myRectTransform ??= (RectTransform)transform;
            return _myRectTransform;
        }

        /// <inheritdoc />
        public override void CalculateLayoutInputVertical()
        {
            // layout is demanded to the child's component and copied from there
            if (!GetChildComponent<ILayoutElement>(out var layoutElement)) return;
            layoutElement.CalculateLayoutInputVertical();
            SetLayoutInputForAxis(layoutElement.minHeight, layoutElement.preferredHeight, layoutElement.flexibleHeight,
                1);
        }

        /// <inheritdoc />
        public override void CalculateLayoutInputHorizontal()
        {
            // layout is demanded to the child's component and copied from there
            if (!GetChildComponent<ILayoutElement>(out var layoutElement)) return;
            layoutElement.CalculateLayoutInputHorizontal();
            SetLayoutInputForAxis(layoutElement.minWidth, layoutElement.preferredWidth, layoutElement.flexibleWidth, 0);
        }

        /// <summary>
        ///     Get a component in the child we point to.
        /// </summary>
        /// <param name="childComponent">The child component to extract.</param>
        /// <typeparam name="T">Type of the child component to extract.</typeparam>
        /// <returns><c>true</c> if the child contained a component of this type, <c>false</c> otherwise.</returns>
        private bool GetChildComponent<T>([NotNullWhen(true)] out T? childComponent)
        {
            if (child.TryGetComponent<T>(out var component))
            {
                childComponent = component!;
                return true;
            }

            Logger?.ZLogError($"Child component does not have a rect transform");
            childComponent = default;
            return false;
        }

        /// <inheritdoc />
        public override void SetLayoutHorizontal()
        {
        }

        /// <inheritdoc />
        public override void SetLayoutVertical()
        {
            // compute the height to reach
            float targetHeight = 0;

            if (GetChildComponent<ILayoutElement>(out var layoutElement))
                targetHeight = layoutElement.preferredHeight;

            // extract info about the current state
            var myRectTransform = GetMyRectTransform();
            var myHeight = myRectTransform.sizeDelta.y;

            // if the target height is about the same as the current one, there's nothing to do
            if (Mathf.Approximately(targetHeight, myHeight) || _currentMotion.IsActive()) return;

            // otherwise, update the height
            var speed = Settings?.textLineSlideSpeed ?? 1;
            var duration = Mathf.Abs(targetHeight - myHeight) / speed;
            Logger?.ZLogTrace($"Starting movement {myHeight} => {targetHeight} for {duration}");

            if (immediatelyCompleteSizeAnimation)
            {
                // it's been requested to immediately update the height, without animations
                myRectTransform.sizeDelta = new Vector2(myRectTransform.sizeDelta.x, targetHeight);
                Logger?.ZLogTrace($"Movement immediately completed.");
            }
            else
            {
                // otherwise, apply an animation to the current height
                _currentMotion = LMotion.Create(myHeight, targetHeight, duration)
                    .Bind(myRectTransform, (newHeight, r) => { r.sizeDelta = new Vector2(r.sizeDelta.x, newHeight); })
                    .AddTo(this);
                LogAndMarkLayoutForRebuild(_currentMotion).Forget();
            }
        }

        /// <summary>
        ///     Log the completion of the animation, and mark our layout for a rebuilt operation.
        /// </summary>
        /// <param name="currentMotion">The animation to track.</param>
        private async UniTaskVoid LogAndMarkLayoutForRebuild(MotionHandle currentMotion)
        {
            await currentMotion.ToUniTask();
            Logger?.ZLogTrace($"Movement completed");
            LayoutRebuilder.MarkLayoutForRebuild(rectTransform);
        }
    }
}