using System;
using R3;
using R3.Triggers;
using Selania.Rework.Interfaces;
using TMPro;
using UnityEngine;
using VContainer;

namespace Selania.Rework.Components.DebuggingWindow
{
    public class InkStatus : MonoBehaviour, IAutomaticEditorInject
    {
        [SerializeField] private GameObject variableTextPrefab = null!;
        [SerializeField] private RectTransform variablesRoot = null!;
        [SerializeField] private TMP_InputField filterInputField = null!;

        [Inject] internal IStoryDebugSupport StoryDebugSupport = null!;

        private void Start()
        {
            var filterObservable = filterInputField.onValueChanged.AsObservable().DistinctUntilChanged()
                .Debounce(TimeSpan.FromMilliseconds(500)).Prepend("");
            var interfaceNeedsUpdateObservable = StoryDebugSupport.VariablesChanged
                .Merge(filterObservable.Select(_ => Unit.Default))
                .Prepend(Unit.Default);
            var gameObjectEnabledObservable = gameObject.OnEnableAsObservable().Select(_ => true)
                .Merge(gameObject.OnDisableAsObservable().Select(_ => false))
                .Prepend(gameObject.activeSelf);

            interfaceNeedsUpdateObservable
                .CombineLatest(gameObjectEnabledObservable, (_, gameObjectEnabled) => gameObjectEnabled)
                .Where(gameObjectEnabled => gameObjectEnabled)
                .CombineLatest(filterObservable, (_, filter) => filter)
                .Subscribe(UpdateVariables)
                .AddTo(this);
        }

        private void UpdateVariables(string filter)
        {
            // remove the existing output
            for (var i = 0; i < variablesRoot.childCount; i++) Destroy(variablesRoot.GetChild(i).gameObject);

            // re-create it
            filter = filter.ToLowerInvariant();
            foreach (var (variableName, variableValue) in StoryDebugSupport.GetVariableValues())
            {
                var lowerVariableName = variableName.ToLowerInvariant();
                if (filter.Length > 0 &&
                    lowerVariableName.IndexOf(filter, StringComparison.InvariantCultureIgnoreCase) < 0) continue;
                var variableTextGameObject = Instantiate(variableTextPrefab, variablesRoot);
                var textComponent = variableTextGameObject.GetComponent<TMP_Text>();
                textComponent.text = $"{variableName} = {variableValue}";
            }
        }
    }
}