using System;
using System.Linq;
using Microsoft.Extensions.Logging;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.Grimoire
{
    public class GrimoireBackground : MonoBehaviour, IAutomaticEditorInject
    {
        private static readonly int Opened = Animator.StringToHash("Opened");

        [Tooltip("List of buttons controlled by Ink")] [SerializeField]
        private LeftButtonDescriptor[] leftButtonDescriptors = null!;

        [Tooltip("Invoked when the grimoire is asked to close.")] [SerializeField]
        private UnityEvent close = new();

        [SerializeField] private GameObject loadButtonContainer = null!;

        [SerializeField] private AchievementAmount[] achievements = null!;

        private Animator _animator = null!;

        [Inject] internal ILogger<GrimoireBackground> Logger = null!;

        private void Awake()
        {
            _animator = GetComponent<Animator>();
        }

        private void Start()
        {
            DisableAllLeftButtons();
        }

        /// <summary>
        ///     Show the grimoire. Usually called from outside.
        /// </summary>
        public void ShowGrimoire()
        {
            _animator.SetBool(Opened, true);
        }

        /// <summary>
        ///     Hide the grimoire. Usually handled by the "close" bookmark itself.
        /// </summary>
        public void HideGrimoire()
        {
            _animator.SetBool(Opened, false);
        }

        /// <summary>
        ///     Callback for the close button.
        /// </summary>
        public void OnCloseButtonClicked()
        {
            close.Invoke();
        }

        /// <summary>
        ///     Disable all left buttons.
        /// </summary>
        public void DisableAllLeftButtons()
        {
            foreach (var descriptor in leftButtonDescriptors) descriptor.target.interactable = false;
        }

        /// <summary>
        ///     Enable (or disable) a button on the left.
        /// </summary>
        /// <param name="buttonName">Name of the button, according to <see cref="leftButtonDescriptors" />.</param>
        /// <param name="isButtonEnabled">Whether the button must be enabled or disabled.</param>
        public void EnableLeftButton(string buttonName, bool isButtonEnabled)
        {
            var descriptor = leftButtonDescriptors.FirstOrDefault(descriptor => descriptor.name == buttonName);
            if (descriptor == null)
            {
                Logger.ZLogWarning(
                    $"Trying to set button {buttonName} to enabled state {isButtonEnabled}, but cannot find a button with this name");
                return;
            }

            descriptor.target.interactable = isButtonEnabled;
        }

        /// <summary>
        ///     Set (or unset) the gamer mode.
        /// </summary>
        /// <param name="gamerMode">Whether we're in gamer mode.</param>
        public void SetGamerMode(bool gamerMode)
        {
            loadButtonContainer.SetActive(gamerMode);
        }

        public void SetAchievementStatus(string achievementName, int current, int max)
        {
            var achievement =
                achievements.FirstOrDefault(achievement => achievement.achievementName == achievementName);
            if (achievement == null)
            {
                Logger.ZLogWarning($"Could not find achievement with name {achievementName}");
                return;
            }

            achievement.SetAchievementStatus(current, max);
        }

        [Serializable]
        public class LeftButtonDescriptor
        {
            [Tooltip("The name of the button.")] public required string name;

            [Tooltip("The button to enable or disable")]
            public required Selectable target;
        }
    }
}