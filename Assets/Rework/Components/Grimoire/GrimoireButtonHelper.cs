using System;
using R3;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using Image = UnityEngine.UI.Image;

namespace Selania.Rework.Components.Grimoire
{
    /// <summary>
    ///     A component that implements a logic similar to that of a Sprite Swap button transition, but only considers
    ///     the interactable flag of the component itself, ignoring canvas groups or the like.
    /// </summary>
    [RequireComponent(typeof(Selectable))]
    public class GrimoireButtonHelper : MonoBehaviour, IPointerDownHandler, IPointerUpHandler
    {
        [SerializeField] private Image targetGraphic = null!;
        [SerializeField] private Sprite disabledSprite = null!;
        [SerializeField] private Color pressedColor = new(0xc8 / 256.0f, 0xc8 / 256.0f, 0xc8 / 256.0f);
        [SerializeField] private RectTransform variableAnchoredPositionObject = null!;
        [SerializeField] private Vector2 alternativePosition = Vector2.zero;

        private ReplaySubject<Vector2>? _anchoredPositionObjectSubject;

        /// <summary>
        ///     The default position of the <see cref="variableAnchoredPositionObject" />.
        /// </summary>
        private Vector2 _defaultAnchoredPosition = Vector2.zero;

        /// <summary>
        ///     An observable that says if this button should be logically disabled (it doesn't produce click animations but
        ///     click events are sent anyway)
        /// </summary>
        private ReplaySubject<bool>? _logicallyDisabledSubject;

        /// <summary>
        ///     An observable that produces <c>null</c> if the default sprite must be used, or an alternative sprite.
        /// </summary>
        private ReplaySubject<Sprite?>? _overrideOriginalSpriteSubject;

        /// <summary>
        ///     An observable that emits <c>true</c> when this button is pressed, <c>false</c> otherwise.
        /// </summary>
        private ReplaySubject<bool>? _pressedSubject;

        /// <summary>
        ///     Whether this button is logically disabled or not.
        /// </summary>
        /// <exception cref="InvalidOperationException">If this observable is accessed before Awake.</exception>
        public Observable<bool> logicallyDisabled =>
            _logicallyDisabledSubject?.DistinctUntilChanged() ??
            throw new InvalidOperationException("Cannot request LogicallyDisabled until started");

        private void Awake()
        {
            _pressedSubject = new ReplaySubject<bool>(1).AddTo(this);
            _logicallyDisabledSubject = new ReplaySubject<bool>(1).AddTo(this);
            _overrideOriginalSpriteSubject = new ReplaySubject<Sprite?>(1).AddTo(this);
            _anchoredPositionObjectSubject = new ReplaySubject<Vector2>(1).AddTo(this);
        }

        private void Start()
        {
            var selectable = GetComponent<Selectable>();
            var originalSprite = targetGraphic.sprite;
            _defaultAnchoredPosition = variableAnchoredPositionObject.anchoredPosition;

            // update the target graphic sprite
            var interactableObservable = Observable.EveryUpdate()
                .Select(_ => selectable.interactable);
            interactableObservable
                .DistinctUntilChanged()
                .CombineLatest(_overrideOriginalSpriteSubject!.Prepend((Sprite?)null).DistinctUntilChanged(),
                    (interactable, overriddenOriginalSprite) => interactable
                        ? overriddenOriginalSprite == null ? originalSprite : overriddenOriginalSprite
                        : disabledSprite)
                .Subscribe(sprite => targetGraphic.sprite = sprite)
                .AddTo(this);

            // update the pressed state
            _pressedSubject!
                .Prepend(false)
                .CombineLatest(interactableObservable, _logicallyDisabledSubject!,
                    (pressed, interactable, isLogicallyDisabled) => pressed && interactable && !isLogicallyDisabled)
                .DistinctUntilChanged()
                .Subscribe(pressed => targetGraphic.color = pressed ? pressedColor : Color.white)
                .AddTo(this);

            // update the alternative position
        }

        public void OnPointerDown(PointerEventData eventData)
        {
            _pressedSubject!.OnNext(true);
        }

        public void OnPointerUp(PointerEventData eventData)
        {
            _pressedSubject!.OnNext(false);
        }

        /// <summary>
        ///     Set an override for the non-disabled sprite of this object.
        /// </summary>
        /// <param name="sprite">The new sprite to use, or <c>null</c> if no override should happen.</param>
        public void OverrideOriginalSprite(Sprite? sprite)
        {
            if (_overrideOriginalSpriteSubject == null)
                throw new InvalidOperationException("Cannot call OverrideOriginalSprite before Awake");
            _overrideOriginalSpriteSubject.OnNext(sprite);
        }

        /// <summary>
        ///     Set whether this button is logically disabled (no animation, but click events are emitted anyway).
        /// </summary>
        /// <param name="isLogicallyDisabled">Whether this button is logically disabled.</param>
        public void SetLogicallyDisabledStatus(bool isLogicallyDisabled)
        {
            if (_logicallyDisabledSubject == null)
                throw new InvalidOperationException("Cannot set the logical disabled status before Awake");

            _logicallyDisabledSubject.OnNext(isLogicallyDisabled);
        }

        /// <summary>
        ///     Set whether to use the alternative position or not.
        /// </summary>
        /// <param name="useAlternativePosition">Whether to use the alternative position.</param>
        /// <exception cref="InvalidOperationException">If this method is called before Awake.</exception>
        public void SetAlternativePosition(bool useAlternativePosition)
        {
            if (_anchoredPositionObjectSubject == null)
                throw new InvalidOperationException("Cannot set the alternative position before Awake");

            _anchoredPositionObjectSubject.OnNext(useAlternativePosition
                ? alternativePosition
                : _defaultAnchoredPosition);
        }
    }
}