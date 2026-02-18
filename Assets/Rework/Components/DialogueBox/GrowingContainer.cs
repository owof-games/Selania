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

        private RectTransform? _myRectTransform;

        [Inject] internal ILogger<GrowingContainer>? Logger;

        [Inject] internal ISettingsDialogueBox? Settings;

        private RectTransform GetMyRectTransform()
        {
            _myRectTransform ??= (RectTransform)transform;
            return _myRectTransform;
        }

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
            float targetHeight = 0;

            if (GetChildComponent<ILayoutElement>(child, out var layoutElement))
                targetHeight = layoutElement.preferredHeight;

            var myRectTransform = GetMyRectTransform();
            var myHeight = myRectTransform.sizeDelta.y;

            if (Mathf.Approximately(targetHeight, myHeight) ||
                (_currentMotion != null && _currentMotion.Value.IsActive())) return;

            var speed = Settings?.textLineSlideSpeed ?? 1;
            var duration = Mathf.Abs(targetHeight - myHeight) / speed;
            Logger?.ZLogTrace($"Starting movement {myHeight} => {targetHeight} for {duration}");
            _currentMotion = LMotion.Create(myHeight, targetHeight, duration)
                .Bind(myRectTransform, (newHeight, r) => { r.sizeDelta = new Vector2(r.sizeDelta.x, newHeight); })
                .AddTo(this);
            LogOnEnd(_currentMotion.Value).Forget();
        }

        private async UniTaskVoid LogOnEnd(MotionHandle currentMotion)
        {
            await currentMotion.ToUniTask();
            Logger?.ZLogTrace($"Movement completed");
            LayoutRebuilder.MarkLayoutForRebuild(rectTransform);
        }
    }
}