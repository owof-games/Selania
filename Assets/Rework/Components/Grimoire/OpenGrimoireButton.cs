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

        [Inject] internal ILogger<OpenGrimoireButton> Logger = null!;

        [Inject] internal IStoryGrimoire StoryGrimoire = null!;

        private void Start()
        {
            _animator = GetComponent<Animator>();
            _button = GetComponent<Button>();

            // when the button is clicked, disable it and ask to switch to the grimoire
            _button.OnClickAsObservable().Subscribe(_ =>
            {
                Logger.ZLogInformation($"Open grimoire button clicked.");
                if (_button != null) _button.interactable = false;
                StoryGrimoire.SwitchToGrimoire();
            }).AddTo(this);

            StoryGrimoire.firstLevelGrimoirePageDescriptors.Subscribe(OnFirstLevelGrimoirePageDescriptors).AddTo(this);
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

        /// <summary>
        ///     Method invoked when the first level page of the grimoire is displayed.
        /// </summary>
        /// <param name="descriptor">Descriptor of the page.</param>
        private void OnFirstLevelGrimoirePageDescriptors(IStoryGrimoire.FirstLevelGrimoirePageDescriptor descriptor)
        {
            _animator?.SetBool(Disabled, true);
        }

        /// <summary>
        ///     Callback method invoked when the grimoire closes.
        /// </summary>
        /// <seealso cref="Grimoire.OnGrimoireCloseButtonClick" />
        public void OnGrimoireCloseButtonClick()
        {
            Logger.ZLogInformation($"Re-enable grimoire button.");
            if (_button != null) _button.interactable = true;
            _animator?.SetBool(Disabled, false);
        }
    }
}