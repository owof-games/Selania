using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace Selania.Rework.Components.DebuggingWindow
{
    public class LayoutCopierElement : UIBehaviour, ILayoutElement
    {
        [SerializeField] private LayoutGroup _copiedLayoutElement;

        [SerializeField] private float verticalPadding;

        protected override void OnEnable()
        {
            base.OnEnable();
            SetDirty();
        }

        protected override void OnDisable()
        {
            SetDirty();
            base.OnDisable();
        }

        protected override void OnBeforeTransformParentChanged()
        {
            SetDirty();
        }

        protected override void OnDidApplyAnimationProperties()
        {
            SetDirty();
        }

        protected override void OnTransformParentChanged()
        {
            SetDirty();
        }

#if UNITY_EDITOR
        protected override void OnValidate()
        {
            SetDirty();
        }

#endif

        public void CalculateLayoutInputHorizontal()
        {
            _copiedLayoutElement.CalculateLayoutInputHorizontal();
        }

        public void CalculateLayoutInputVertical()
        {
            _copiedLayoutElement.CalculateLayoutInputVertical();
        }

        public float minWidth => _copiedLayoutElement.minWidth;
        public float preferredWidth => _copiedLayoutElement.preferredWidth;
        public float flexibleWidth => _copiedLayoutElement.flexibleWidth;
        public float minHeight => _copiedLayoutElement.minHeight + verticalPadding;
        public float preferredHeight => _copiedLayoutElement.preferredHeight + verticalPadding;
        public float flexibleHeight => _copiedLayoutElement.flexibleHeight + verticalPadding;
        public int layoutPriority => _copiedLayoutElement.layoutPriority;

        /// <summary>
        ///     Mark the LayoutElement as dirty.
        /// </summary>
        /// <remarks>
        ///     This will make the auto layout system process this element on the next layout pass. This method should be called by
        ///     the LayoutElement whenever a change is made that potentially affects the layout.
        /// </remarks>
        protected void SetDirty()
        {
            if (!IsActive())
                return;
            LayoutRebuilder.MarkLayoutForRebuild(transform as RectTransform);
        }
    }
}