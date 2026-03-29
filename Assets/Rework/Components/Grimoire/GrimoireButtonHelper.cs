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

        /// <summary>
        ///     An observable that says if this button should logically disabled (it doesn't produce click animations but
        ///     click events are sent anyway)
        /// </summary>
        private Subject<bool> _logicallyDisabled = null!;

        /// <summary>
        ///     An observable that produces <c>null</c> if the default sprite must be used, or an alternative sprite.
        /// </summary>
        private Subject<Sprite?>? _overrideOriginalSpriteSubject;

        /// <summary>
        ///     An observable that emits <c>true</c> when this button is pressed, <c>false</c> otherwise.
        /// </summary>
        private Subject<bool>? _pressedSubject;

        public Observable<bool> LogicallyDisabled => _logicallyDisabled?.DistinctUntilChanged() ??
                                                     throw new InvalidOperationException(
                                                         "Cannot request LogicallyDisabled until started");

        private void Awake()
        {
            _pressedSubject = new Subject<bool>().AddTo(this);
            _logicallyDisabled = new Subject<bool>().AddTo(this);
            _overrideOriginalSpriteSubject = new Subject<Sprite?>().AddTo(this);
        }

        private void Start()
        {
            var selectable = GetComponent<Selectable>();
            var originalSprite = targetGraphic.sprite;

            _overrideOriginalSpriteSubject = new Subject<Sprite?>().AddTo(this);

            var interactableObservable = Observable.EveryUpdate()
                .Select(_ => selectable.interactable);
            interactableObservable
                .DistinctUntilChanged()
                .CombineLatest(_overrideOriginalSpriteSubject.Prepend((Sprite?)null).DistinctUntilChanged(),
                    (interactable, overriddenOriginalSprite) => interactable
                        ? overriddenOriginalSprite == null ? originalSprite : overriddenOriginalSprite
                        : disabledSprite)
                .Subscribe(sprite => targetGraphic.sprite = sprite)
                .AddTo(this);

            _pressedSubject!
                .Prepend(false)
                .CombineLatest(interactableObservable, _logicallyDisabled,
                    (pressed, interactable, logicallyDisabled) => pressed && interactable && !logicallyDisabled)
                .DistinctUntilChanged()
                .Subscribe(pressed => targetGraphic.color = pressed ? pressedColor : Color.white)
                .AddTo(this);
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
        /// <param name="logicallyDisabled">Whether this button is logically disabled.</param>
        public void SetLogicallyDisabledStatus(bool logicallyDisabled)
        {
            _logicallyDisabled.OnNext(logicallyDisabled);
        }
    }
}