using R3;
using UnityEngine;
using UnityEngine.UI;

namespace Selania.Rework.Components.Museum.GrimoireDisplay
{
    /// <summary>
    ///     A component that locks an achievement if needed.
    /// </summary>
    public class AchievementLock : MonoBehaviour
    {
        [SerializeField] private Image image = null!;

        [SerializeField] private Sprite alternativeSprite = null!;

        [SerializeField] private GameObject textObject = null!;

        public bool useAlternativeSprite;

        private void Start()
        {
            var originalSprite = image.sprite;
            Observable.EveryUpdate()
                .Subscribe(_ =>
                {
                    textObject.SetActive(!useAlternativeSprite);
                    image.sprite = useAlternativeSprite ? alternativeSprite : originalSprite;
                })
                .AddTo(this);
        }
    }
}