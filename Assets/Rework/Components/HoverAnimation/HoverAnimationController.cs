using Microsoft.Extensions.Logging;
using UnityEngine;
using UnityEngine.EventSystems;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.HoverAnimation
{
    /// <summary>
    ///     A component that starts an animation only when the cursor is hovering the object and/or the object is
    ///     selected (or the contrary). It takes into consideration that animations could move the object's collider,
    ///     and so the pointer may enter and exit the object involuntarily.
    /// </summary>
    public class HoverAnimationController : MonoBehaviour, IAutomaticEditorInject, IPointerEnterHandler,
        IPointerExitHandler, IPointerMoveHandler
    {
        private static readonly int AnimationEnabledAnimatorProperty = Animator.StringToHash("AnimationEnabled");

        [SerializeField]
        [Tooltip("Whether to animate on hover. If false, the animation is active only when NOT hovered.")]
        private bool animateWhenHovered = true;

        /// <summary>
        ///     The animator to control.
        /// </summary>
        [SerializeField] private Animator? animator;

        /// <summary>
        ///     Whether the mouse is currently out of this object's collider.
        /// </summary>
        private bool _mouseIsOut = true;

        /// <summary>
        ///     Whether the mouse moved since the last time it entered the collider.
        /// </summary>
        private bool _movedSinceEntered;

        /// <summary>
        ///     The logger for this component.
        /// </summary>
        [Inject] internal ILogger<HoverAnimationController> Logger = null!;

        private void Start()
        {
            if (animator == null)
            {
                Logger.ZLogWarning($"No animator associated to {gameObject.name} in its HoverAnimationController");
                return;
            }

            // start the animation at startup if requested
            if (!animateWhenHovered) animator.SetBool(AnimationEnabledAnimatorProperty, true);
        }

        /// <inheritdoc />
        public void OnPointerEnter(PointerEventData eventData)
        {
            if (animator == null) return;
            // set up the variables
            _movedSinceEntered = false;
            _mouseIsOut = false;
            animator.SetBool(AnimationEnabledAnimatorProperty, animateWhenHovered);
        }

        /// <inheritdoc />
        public void OnPointerExit(PointerEventData eventData)
        {
            if (animator == null) return;
            _mouseIsOut = true;
            // it could be that the mouse exits the collider just because of the animation: in that case, don't stop it
            if (_movedSinceEntered) animator.SetBool(AnimationEnabledAnimatorProperty, !animateWhenHovered);
        }

        /// <inheritdoc />
        public void OnPointerMove(PointerEventData eventData)
        {
            _movedSinceEntered = true;
            // it could be that the mouse already exited the collider because of the animation: the moment we move the
            // mouse, actually stop the animation
            if (_mouseIsOut && animator != null)
                animator.SetBool(AnimationEnabledAnimatorProperty, !animateWhenHovered);
        }
    }
}