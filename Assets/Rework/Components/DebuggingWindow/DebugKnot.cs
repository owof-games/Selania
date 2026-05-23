using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using TMPro;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.DebuggingWindow
{
    public class DebugKnot : MonoBehaviour, IAutomaticEditorInject
    {
        [SerializeField] private TMP_InputField inputField = null!;
        [SerializeField] private GameObject debugKnotButtonPrefab = null!;
        [SerializeField] private RectTransform buttonsRoot = null!;
        [SerializeField] private TMP_Text outputComponent = null!;
        [Inject] internal ILogger<DebugKnot> Logger = null!;

        [Inject] internal IStoryDebugSupport StoryDebugSupport = null!;

        private void Start()
        {
            inputField.onValueChanged.AddListener(OnInputFieldValueChanged);
            UpdateStoryDebugSupport(inputField.text);
        }

        private void OnDestroy()
        {
            inputField.onValueChanged.RemoveAllListeners();
        }

        private void OnInputFieldValueChanged(string text)
        {
            UpdateStoryDebugSupport(text);
        }

        private void UpdateStoryDebugSupport(string text)
        {
            // clear current choices (from the third child on)
            for (var i = 2; i < buttonsRoot.childCount; i++) Destroy(buttonsRoot.GetChild(i));

            // create the new choices
            var choices = StoryDebugSupport.GetDebugKnotChoices(text);
            if (choices == null)
                Logger.ZLogTrace($"Invalid debug knot");
            else
                foreach (var choice in choices)
                {
                    Logger.ZLogTrace($"Debug knot choice: {choice}");
                    var buttonGameObject = Instantiate(debugKnotButtonPrefab, buttonsRoot);
                    var buttonComponent = buttonGameObject.GetComponent<Button>();
                    buttonComponent.onClick.AddListener(CreateOnDebugKnotChoiceListener(choice));
                    var textComponent = buttonGameObject.GetComponentInChildren<TMP_Text>();
                    textComponent.text = choice.Text;
                }
        }

        private UnityAction CreateOnDebugKnotChoiceListener(IStoryDebugSupport.DebugKnotChoice choice)
        {
            return () =>
            {
                var text = StoryDebugSupport.PickDebugKnotChoice(choice);
                outputComponent.text = (outputComponent.text + "\n" + text).Trim();
                Logger.ZLogTrace($"Text of the debug choice: {text}");
            };
        }
    }
}