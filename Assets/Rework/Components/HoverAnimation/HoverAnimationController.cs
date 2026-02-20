using Microsoft.Extensions.Logging;
using UnityEngine;
using UnityEngine.EventSystems;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.HoverAnimation
{
    /// <summary>
    ///     A component that starts an animation only when the cursor is hovering the object and/or the object is
    ///     selected (or the contrary).
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

        private bool _mouseIsOut = true;

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

            if (!animateWhenHovered) animator.SetBool(AnimationEnabledAnimatorProperty, true);
        }

        public void OnPointerEnter(PointerEventData eventData)
        {
            if (animator == null) return;
            _movedSinceEntered = false;
            _mouseIsOut = false;
            animator.SetBool(AnimationEnabledAnimatorProperty, animateWhenHovered);
        }

        public void OnPointerExit(PointerEventData eventData)
        {
            if (animator == null) return;
            _mouseIsOut = true;
            // it could be that the mouse exits the collider just because of the animation: in that case, don't stop it
            if (_movedSinceEntered) animator.SetBool(AnimationEnabledAnimatorProperty, !animateWhenHovered);
        }

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