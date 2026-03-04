using Microsoft.Extensions.Logging;
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

        private void Start()
        {
            _animator = GetComponent<Animator>();
            _button = GetComponent<Button>();

            _button.onClick.AddListener(OnClick);
        }

        private void OnDestroy()
        {
            _button?.onClick.RemoveListener(OnClick);
        }

        public void OnPointerEnter(PointerEventData eventData)
        {
            Logger.ZLogTrace($"Pointer entering grimoire button.");
            _animator?.SetBool(Hovered, _button?.interactable ?? false);
        }

        public void OnPointerExit(PointerEventData eventData)
        {
            Logger.ZLogTrace($"Pointer exiting grimoire button.");
            _animator?.SetBool(Hovered, false);
        }

        private void OnClick()
        {
            Logger.ZLogInformation($"Open grimoire button clicked.");
            if (_button != null) _button.interactable = false;
            _animator?.SetBool(Disabled, true);
        }

        public void OnGrimoireCloseButtonClick()
        {
            Logger.ZLogInformation($"Re-enable grimoire button.");
            if (_button != null) _button.interactable = true;
            _animator?.SetBool(Disabled, false);
        }
    }
}