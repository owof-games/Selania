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

        private ILayoutElement? _childComponentCache;

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
        [Inject] internal ISettingsDialogueBox SettingsDialogueBox = null!;

        /// <summary>
        ///     Whether size animation should immediately complete. This is useful when the element is not visible, in order
        ///     not to introduce unexplainable resizing animation for the user.
        /// </summary>
        public bool ImmediatelyCompleteSizeAnimation { get; set; }

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
            if (!GetChildLayoutElementComponent(out var layoutElement)) return;
            layoutElement.CalculateLayoutInputVertical();
            SetLayoutInputForAxis(layoutElement.minHeight, layoutElement.preferredHeight, layoutElement.flexibleHeight,
                1);
        }

        /// <inheritdoc />
        public override void CalculateLayoutInputHorizontal()
        {
            // layout is demanded to the child's component and copied from there
            if (!GetChildLayoutElementComponent(out var layoutElement)) return;
            layoutElement.CalculateLayoutInputHorizontal();
            SetLayoutInputForAxis(layoutElement.minWidth, layoutElement.preferredWidth, layoutElement.flexibleWidth, 0);
        }

        /// <summary>
        ///     Get a component in the child we point to.
        /// </summary>
        /// <param name="childComponent">The child component to extract.</param>
        /// <returns><c>true</c> if the child contained a component of this type, <c>false</c> otherwise.</returns>
        private bool GetChildLayoutElementComponent([NotNullWhen(true)] out ILayoutElement? childComponent)
        {
            // get the child ILayoutElement from the cached value, if possible
            if (_childComponentCache != null)
            {
                childComponent = _childComponentCache;
                return true;
            }

            // if not (first time this method has been called), extract it and cache it
            if (child.TryGetComponent<ILayoutElement>(out var component))
            {
                _childComponentCache = component;
                childComponent = component;
                return true;
            }

            // if this doesn't work either, the method failed
            Logger?.ZLogError($"Child component does not have an ILayoutElement component");
            childComponent = null;
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

            if (GetChildLayoutElementComponent(out var layoutElement))
                targetHeight = layoutElement.preferredHeight;

            // extract info about the current state
            var myRectTransform = GetMyRectTransform();
            var myHeight = myRectTransform.sizeDelta.y;

            // if the target height is about the same as the current one, there's nothing to do
            if (Mathf.Approximately(targetHeight, myHeight) || _currentMotion.IsActive()) return;

            // otherwise, update the height
            var speed = Application.isPlaying ? SettingsDialogueBox.textLineSlideSpeed : 800;
            var duration = Mathf.Abs(targetHeight - myHeight) / speed;
            Logger?.ZLogTrace($"Starting movement {myHeight} => {targetHeight} for {duration}");

            if (ImmediatelyCompleteSizeAnimation)
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
                LogAndMarkLayoutForRebuildAsync(_currentMotion).Forget();
            }
        }

        /// <summary>
        ///     Log the completion of the animation, and mark our layout for a rebuilt operation.
        /// </summary>
        /// <param name="currentMotion">The animation to track.</param>
        private async UniTaskVoid LogAndMarkLayoutForRebuildAsync(MotionHandle currentMotion)
        {
            await currentMotion.ToUniTask();
            Logger?.ZLogTrace($"Movement completed");
            LayoutRebuilder.MarkLayoutForRebuild(rectTransform);
        }
    }
}