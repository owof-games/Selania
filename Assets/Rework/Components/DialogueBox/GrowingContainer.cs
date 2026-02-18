using System.Diagnostics.CodeAnalysis;
using Cysharp.Threading.Tasks;
using LitMotion;
using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using UnityEngine;
using UnityEngine.UI;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.DialogueBox
{
    public class GrowingContainer : LayoutGroup, IAutomaticEditorInject
    {
        [SerializeField] private GameObject child = null!;

        private MotionHandle? _currentMotion;

        private float _preferredHeight;
        [Inject] internal ILogger<GrowingContainer>? Logger;

        [Inject] internal ISettingsDialogueBox? Settings;

        public override float preferredHeight => _preferredHeight;

        public override void CalculateLayoutInputVertical()
        {
            if (!GetChildComponent<ILayoutElement>(child, out var layoutElement)) return;
            layoutElement.CalculateLayoutInputVertical();
            SetLayoutInputForAxis(layoutElement.minHeight, layoutElement.preferredHeight, layoutElement.flexibleHeight,
                1);
        }

        public override void CalculateLayoutInputHorizontal()
        {
            if (!GetChildComponent<ILayoutElement>(child, out var layoutElement)) return;
            layoutElement.CalculateLayoutInputHorizontal();
            SetLayoutInputForAxis(layoutElement.minWidth, layoutElement.preferredWidth, layoutElement.flexibleWidth, 0);
        }

        private bool GetChildComponent<T>(GameObject child, [NotNullWhen(true)] out T? childRectTransform)
        {
            if (child.TryGetComponent<T>(out var component))
            {
                childRectTransform = component!;
                return true;
            }

            Logger?.ZLogError($"Child component does not have a rect transform");
            childRectTransform = default;
            return false;
        }

        public override void SetLayoutHorizontal()
        {
        }

        public override void SetLayoutVertical()
        {
            float height = 0;

            if (GetChildComponent<ILayoutElement>(child, out var layoutElement)) height = layoutElement.preferredHeight;

            if (!Mathf.Approximately(height, _preferredHeight) &&
                (_currentMotion == null || !_currentMotion.Value.IsActive()))
            {
                var speed = Settings?.textLineSlideSpeed ?? 1;
                var duration = Mathf.Abs(height - _preferredHeight) / speed;
                Logger?.ZLogTrace($"Starting movement {_preferredHeight} => {height} for {duration}");
                _currentMotion = LMotion.Create(_preferredHeight, height, duration)
                    .Bind(child, (newHeight, c) => { _preferredHeight = newHeight; })
                    .AddTo(this);
                LogOnEnd(_currentMotion.Value).Forget();
            }
        }

        private async UniTaskVoid LogOnEnd(MotionHandle currentMotion)
        {
            await currentMotion.ToUniTask();
            Logger?.ZLogTrace($"Movement completed");
        }
    }
}