using Microsoft.Extensions.Logging;
using R3;
using Selania.Rework.Interfaces;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.Grimoire
{
    public class OpenGrimoireButton : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler, IAutomaticEditorInject
    {
        private static readonly int Hovered = Animator.StringToHash("Hovered");
        private static readonly int Disabled = Animator.StringToHash("Disabled");

        private Animator? _animator;
        private Button? _button;
        private bool _isGrimoireEnabled;

        private bool _isGrimoireOpened;

        [Inject] internal ILogger<OpenGrimoireButton> Logger = null!;

        [Inject] internal IStoryGrimoire StoryGrimoire = null!;

        private void Start()
        {
            _animator = GetComponent<Animator>();
            _button = GetComponent<Button>();

            // when the button is clicked, disable it and ask Ink to switch to the grimoire
            _button.OnClickAsObservable().Subscribe(OnGrimoireOpenButtonClick).AddTo(this);

            // whenever any grimoire page is displayed, set the grimoire as visible
            StoryGrimoire.firstLevelGrimoirePageDescriptors.Select(ToUnit)
                .Merge(StoryGrimoire.secondLevelAppendixPageDescriptors.Select(ToUnit))
                .Merge(StoryGrimoire.secondLevelCharacterPageDescriptors.Select(ToUnit))
                .Merge(StoryGrimoire.secondLevelFrancoPageDescriptors.Select(ToUnit))
                .Merge(StoryGrimoire.secondLevelGreenhouseGrimoirePageDescriptors.Select(ToUnit))
                .Merge(StoryGrimoire.secondLevelRulesPageDescriptors.Select(ToUnit))
                .Merge(StoryGrimoire.secondLevelSigilsGrimoirePageDescriptors.Select(ToUnit))
                .Merge(StoryGrimoire.thirdLevelGreenhouseGrimoirePageDescriptors.Select(ToUnit))
                .Merge(StoryGrimoire.thirdLevelSigilsGrimoirePageDescriptors.Select(ToUnit))
                .Merge(StoryGrimoire.thirdLevelTextGrimoirePageDescriptors.Select(ToUnit))
                .Subscribe(OnGrimoireDisplayed)
                .AddTo(this);

            // whenever the enable status of the grimoire changes, update it
            StoryGrimoire.IsGrimoireEnabled.Subscribe(OnGrimoireEnabled).AddTo(this);
        }

        public void OnPointerEnter(PointerEventData eventData)
        {
            // start animation when the pointer enters 
            Logger.ZLogTrace($"Pointer entering grimoire button.");
            _animator?.SetBool(Hovered, _button?.interactable ?? false);
        }

        public void OnPointerExit(PointerEventData eventData)
        {
            // stop animation when the pointer exits
            Logger.ZLogTrace($"Pointer exiting grimoire button.");
            _animator?.SetBool(Hovered, false);
        }

        private static Unit ToUnit<T>(T _)
        {
            return Unit.Default;
        }

        private void OnGrimoireDisplayed(Unit _)
        {
            _isGrimoireOpened = true;
            Logger.ZLogTrace($"Setting grimoire opened status to true: updating animation and status");
            UpdateAnimationAndStatus();
        }

        private void OnGrimoireEnabled(bool isEnabled)
        {
            _isGrimoireEnabled = isEnabled;
            Logger.ZLogTrace($"Setting grimoire enabled status to {isEnabled}: updating animation and status");
            UpdateAnimationAndStatus();
        }

        private void UpdateAnimationAndStatus()
        {
            // the grimoire button is disabled if Ink says the grimoire is still disabled, or if the grimoire is opened
            var isDisabled = !_isGrimoireEnabled || _isGrimoireOpened;
            Logger.ZLogTrace(
                $"Since _isGrimoireEnabled = {_isGrimoireEnabled} and _isGrimoireOpened = {_isGrimoireOpened}, then isDisabled = {isDisabled}");
            _animator?.SetBool(Disabled, isDisabled);
            if (_button != null) _button.interactable = !isDisabled;
        }

        /// <summary>
        ///     Callback method invoked when the grimoire button is clicked to request the grimoire to open.
        /// </summary>
        private void OnGrimoireOpenButtonClick(Unit _)
        {
            Logger.ZLogInformation($"Open grimoire button clicked.");
            StoryGrimoire.SwitchToGrimoire();
        }

        /// <summary>
        ///     Callback method invoked when the grimoire closes.
        /// </summary>
        /// <seealso cref="Grimoire.OnGrimoireCloseButtonClick" />
        public void OnGrimoireCloseButtonClick()
        {
            Logger.ZLogInformation($"Close grimoire request.");
            _isGrimoireOpened = false;
            Logger.ZLogTrace($"Setting grimoire opened status to false: updating animation and status");
            UpdateAnimationAndStatus();
        }
    }
}