using LitMotion;
using LitMotion.Extensions;
using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using UnityEngine;
using UnityEngine.UI;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.DialogueBox
{
    public class RelationshipStatus : MonoBehaviour, IAutomaticEditorInject
    {
        /// <summary>
        ///     Cached id for the "Joined" animator property.
        /// </summary>
        private static readonly int JoinedAnimatorProperty = Animator.StringToHash("Joined");

        /// <summary>
        ///     Cached id for the "Glowing" animator property.
        /// </summary>
        private static readonly int GlowingAnimatorProperty = Animator.StringToHash("Glowing");

        [SerializeField] [Tooltip("The transform common to both heart pieces")]
        private RectTransform baseHeartTransform = null!;

        [SerializeField] [Tooltip("The image for the background bar")]
        private Image barImage = null!;

        [SerializeField] [Tooltip("The animator for the heart")]
        private Animator heartAnimator = null!;

        /// <summary>
        ///     The logger for this component.
        /// </summary>
        [Inject] internal ILogger<RelationshipStatus> Logger = null!;

        /// <summary>
        ///     Dialogue box settings.
        /// </summary>
        [Inject] internal ISettingsDialogueBox SettingsDialogueBox = null!;

        private void Awake()
        {
            // by default, relationship status is disabled
            gameObject.SetActive(false);
        }

        /// <summary>
        ///     Relationship status is invisible at first; by calling this method, it becomes visible.
        /// </summary>
        public void Enable()
        {
            gameObject.SetActive(true);
        }

        /// <summary>
        ///     Set the current heart level.
        /// </summary>
        /// <param name="level">The level, between 0 (worst) and 1 (best).</param>
        public void SetLevel(float level)
        {
            level = Mathf.Clamp(level, 0, 1);
            Logger.ZLogTrace($"Setting log level to {level}");

            // set the bar color
            Color targetColor;
            if (level < SettingsDialogueBox.percentageBetweenBadAndNormalRelationshipStatusBar)
            {
                targetColor = SettingsDialogueBox.badRelationshipStatusBarColor;
                Logger.ZLogTrace($"Setting color {barImage.color} for bad relationship status");
            }
            else if (level < SettingsDialogueBox.percentageBetweenNormalAndGoodRelationshipStatusBar)
            {
                targetColor = SettingsDialogueBox.normalRelationshipStatusBarColor;
                Logger.ZLogTrace($"Setting color {barImage.color} for normal relationship status");
            }
            else
            {
                targetColor = SettingsDialogueBox.goodRelationshipStatusBarColor;
                Logger.ZLogTrace($"Setting color {barImage.color} for good relationship status");
            }

            LMotion.Create(barImage.color, targetColor, SettingsDialogueBox.statusChangeDuration)
                .BindToColor(barImage);


            // set the heart status
            var heartJoined = level > SettingsDialogueBox.percentageBetweenBrokenAndNormalHeart;
            heartAnimator.SetBool(JoinedAnimatorProperty, heartJoined);
            Logger.ZLogTrace($"Setting heart status as joined? {heartJoined}");
            var heartGlowing = level > SettingsDialogueBox.percentageBetweenNormalAndGreatHeart;
            heartAnimator.SetBool(GlowingAnimatorProperty, heartGlowing);
            Logger.ZLogTrace($"Setting heart status as glowing? {heartGlowing}");

            // set the heart position
            LMotion.Create(baseHeartTransform.anchorMin.x, level, SettingsDialogueBox.statusChangeDuration)
                .Bind(x =>
                {
                    baseHeartTransform.anchorMin = new Vector2(x, baseHeartTransform.anchorMin.y);
                    baseHeartTransform.anchorMax = new Vector2(x, baseHeartTransform.anchorMax.y);
                });
            Logger.ZLogTrace($"Heart position: {level}");
        }
    }
}