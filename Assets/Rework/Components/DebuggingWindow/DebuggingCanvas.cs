using System;
using LitMotion;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.InputSystem;
using UnityEngine.UI;

namespace Selania.Rework.Components.DebuggingWindow
{
    public class DebuggingCanvas : MonoBehaviour, InputActionsDebuggingWindow.IDebuggingMapActions
    {
        [SerializeField] private DebuggingSection[] debuggingSections = Array.Empty<DebuggingSection>();

        [SerializeField] private RectTransform rootTransform = null!;

        private DebuggingSection _activeSection = null!;

        private InputActionsDebuggingWindow? _inputActionsDebuggingWindow;

        private void Awake()
        {
            _inputActionsDebuggingWindow = new InputActionsDebuggingWindow();
            _inputActionsDebuggingWindow.DebuggingMap.AddCallbacks(this);
        }

        private void Start()
        {
            var first = true;
            foreach (var debuggingSection in debuggingSections)
            {
                debuggingSection.container.SetActive(first);
                debuggingSection.button.onClick.AddListener(CreateClickListener(debuggingSection));
                first = false;
            }

            _activeSection = debuggingSections[0];
        }

        private void OnEnable()
        {
            _inputActionsDebuggingWindow?.Enable();
            _inputActionsDebuggingWindow?.DebuggingMap.Enable();
        }

        private void OnDisable()
        {
            _inputActionsDebuggingWindow?.DebuggingMap.Disable();
            _inputActionsDebuggingWindow?.Disable();
        }

        private void OnDestroy()
        {
            foreach (var debuggingSection in debuggingSections) debuggingSection.button.onClick.RemoveAllListeners();
        }

        public void OnToggleDebugPanel(InputAction.CallbackContext context)
        {
            if (!context.performed) return;
            float newY = Mathf.Approximately(rootTransform.pivot.y, 0) ? 1 : 0;
            LMotion
                .Create(rootTransform.pivot.y, newY, 0.3f)
                .WithEase(newY > 0 ? Ease.OutBounce : Ease.Linear)
                .Bind(y => rootTransform.pivot = rootTransform.pivot with { y = y })
                .AddTo(rootTransform);
        }

        private UnityAction CreateClickListener(DebuggingSection debuggingSection)
        {
            return () =>
            {
                _activeSection.container.SetActive(false);
                debuggingSection.container.SetActive(true);
                _activeSection = debuggingSection;
            };
        }

        [Serializable]
        public class DebuggingSection
        {
            public Button button = null!;
            public GameObject container = null!;
        }
    }
}