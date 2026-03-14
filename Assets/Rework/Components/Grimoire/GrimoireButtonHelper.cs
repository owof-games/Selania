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

        private readonly Subject<bool> _pressedSubject = new();

        private void Start()
        {
            var selectable = GetComponent<Selectable>();
            var originalSprite = targetGraphic.sprite;

            var interactableObservable = Observable.EveryUpdate()
                .Select(_ => selectable.interactable);
            interactableObservable
                .DistinctUntilChanged()
                .Subscribe(interactable => targetGraphic.sprite = interactable ? originalSprite : disabledSprite)
                .AddTo(this);

            _pressedSubject
                .Prepend(false)
                .CombineLatest(interactableObservable, (pressed, interactable) => pressed && interactable)
                .DistinctUntilChanged()
                .Subscribe(pressed => targetGraphic.color = pressed ? pressedColor : Color.white)
                .AddTo(this);
        }

        public void OnPointerDown(PointerEventData eventData)
        {
            _pressedSubject.OnNext(true);
        }

        public void OnPointerUp(PointerEventData eventData)
        {
            _pressedSubject.OnNext(false);
        }
    }
}