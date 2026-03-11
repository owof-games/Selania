using R3;
using UnityEngine;
using UnityEngine.UI;
using Image = UnityEngine.UI.Image;

namespace Selania.Rework.Components.Grimoire
{
    /// <summary>
    ///     A component that implements a logic similar to that of a Sprite Swap button transition, but only considers
    ///     the interactable flag of the component itself, ignoring canvas groups or the like.
    /// </summary>
    [RequireComponent(typeof(Selectable))]
    public class TopLevelButtonSpriteSwap : MonoBehaviour
    {
        [SerializeField] private Image targetGraphic = null!;
        [SerializeField] private Sprite disabledSprite = null!;

        private void Start()
        {
            var selectable = GetComponent<Selectable>();
            var originalSprite = targetGraphic.sprite;
            Observable.EveryUpdate()
                .Select(_ => selectable.interactable)
                .DistinctUntilChanged()
                .Subscribe(interactable => targetGraphic.sprite = interactable ? originalSprite : disabledSprite)
                .AddTo(this);
        }
    }
}