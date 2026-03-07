using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Selania.Rework.Components.Grimoire
{
    public class AchievementAmount : MonoBehaviour
    {
        [field: SerializeField]
        [field: Tooltip("Name of this achievement")]
        public string achievementName { get; private set; } = null!;

        [SerializeField] private Color disabledTint;

        private Image _achievementImage = null!;

        private AchievementLock _achievementLock = null!;

        private TextMeshProUGUI _textMeshPro = null!;

        private void Start()
        {
            _achievementLock = GetComponent<AchievementLock>();
            _achievementImage = GetComponentInChildren<Image>();
            _textMeshPro = GetComponentInChildren<TextMeshProUGUI>();
        }

        /// <summary>
        ///     Set the status of this achievement.
        /// </summary>
        /// <param name="current">Current amount of this achievement.</param>
        /// <param name="max">Maximum amount of this achievement.</param>
        public void SetAchievementStatus(int current, int max)
        {
            _achievementLock.useAlternativeSprite = current == 0;
            _achievementImage.color = current > 0 && current < max ? disabledTint : Color.white;
            _textMeshPro.text = $"{current} / {max}";
        }
    }
}