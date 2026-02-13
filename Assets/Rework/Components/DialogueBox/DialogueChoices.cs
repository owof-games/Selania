using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using TMPro;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.DialogueBox
{
    /// <summary>
    ///     The component that handles dialogue choices
    /// </summary>
    public class DialogueChoices : Selectable, IPointerMoveHandler, IPointerClickHandler, ISubmitHandler
    {
        /// <summary>
        ///     The text mesh pro that handles the choices
        /// </summary>
        [SerializeField] private TextMeshProUGUI textMeshProUGUI = null!;

        /// <summary>
        ///     Event raised when a choice is picked.
        /// </summary>
        public UnityEvent<int> choiceSelectedEvent = new();

        /// <summary>
        ///     The last set of choices given for the components (if any).
        /// </summary>
        private IList<Choice>? _choices;

        /// <summary>
        ///     The index over which the mouse is currently hovering, or <c>-1</c> if the mouse is not hovering over a
        ///     choice or out of this component.
        /// </summary>
        private int _hoveredIndex = -1;

        /// <summary>
        ///     Flag used to know if we're selected. Can't directly query EventSystem.current.currentSelectedGameObject
        ///     because during the OnDeselect event the object is not yet deselected.
        /// </summary>
        private bool _isSelected;

        /// <summary>
        ///     The last selected index (-1 = nothing selected).
        /// </summary>
        private int _selectedIndex = -1;

        /// <summary>
        ///     The logger for this object.
        /// </summary>
        [Inject] internal ILogger<DialogueChoices> Logger = null!;

        /// <summary>
        ///     The settings used to read the parameters for the choices.
        /// </summary>
        [Inject] internal ISettingsDialogueBox SettingsDialogueBox = null!;

        protected override void Start()
        {
            // when the dialogue choice is created, select it
            EventSystem.current.SetSelectedGameObject(gameObject, null);
        }

#if UNITY_EDITOR
        protected override void OnValidate()
        {
            textMeshProUGUI = GetComponentInChildren<TextMeshProUGUI>();
        }
#endif

        public void OnPointerClick(PointerEventData eventData)
        {
            // if we click while hovering a choice, select the choice and destroy this object
            if (_hoveredIndex == -1) return;
            ChoiceSelected(_hoveredIndex);
        }

        public void OnPointerMove(PointerEventData eventData)
        {
            // adapted from https://www.youtube.com/watch?v=LNwYgN47qqk
            // updates the choice selection
            var mousePosition = new Vector3(eventData.position.x, eventData.position.y, 0f);
            var linkIndex = TMP_TextUtilities.FindIntersectingLink(textMeshProUGUI, mousePosition, Camera.main);

            var newIndex = -1;
            if (linkIndex >= 0)
            {
                var linkInfo = textMeshProUGUI.textInfo.linkInfo[linkIndex];
                newIndex = int.Parse(linkInfo.GetLinkID());
            }

            if (_hoveredIndex == newIndex) return;

            _hoveredIndex = newIndex;
            UpdateText();
        }

        public void OnSubmit(BaseEventData eventData)
        {
            // if we are selected and there's a choice selected, pick that choice
            if (!_isSelected || _selectedIndex == -1) return;
            ChoiceSelected(_hoveredIndex);
        }

        public override void OnPointerExit(PointerEventData eventData)
        {
            // when the pointer exits, there's no longer a hovered choice
            if (_hoveredIndex == -1) return;
            _hoveredIndex = -1;
            UpdateText();
        }

        /// <summary>
        ///     Set the list of available choices.
        /// </summary>
        /// <param name="choices">The choices to set.</param>
        public void SetChoices(IEnumerable<Choice> choices)
        {
            _choices = choices.ToList();
            _selectedIndex = _choices.Count > 0 ? _choices[0].index : -1;
            UpdateText();
        }

        /// <summary>
        ///     Updates the text from the choices and the selected index.
        /// </summary>
        private void UpdateText()
        {
            if (_choices == null)
            {
                textMeshProUGUI.text = "";
                return;
            }

            Logger.ZLogTrace(
                $"Redrawing choices: isSelected={_isSelected}, selectedIndex={_selectedIndex}, hoveredIndex={_hoveredIndex}");

            var sb = new StringBuilder();
            var i = 1;
            foreach (var choice in _choices)
            {
                Color color;
                if (choice.index == _hoveredIndex)
                    color = SettingsDialogueBox.hoveredChoiceColor;
                else if (choice.index == _selectedIndex && _isSelected)
                    color = SettingsDialogueBox.selectedChoiceColor;
                else
                    color = SettingsDialogueBox.defaultChoiceColor;

                sb.Append("<b><color=#");
                sb.Append(ColorUtility.ToHtmlStringRGB(color));
                sb.Append("><link=\"");
                sb.Append(choice.index);
                sb.Append("\">");
                sb.Append(i++);
                sb.Append(".<indent=");
                sb.Append(SettingsDialogueBox.choiceIndentationPercentage);
                sb.Append("%>");
                sb.Append(choice.text);
                sb.AppendLine("</indent></link></color></b>");
            }

            textMeshProUGUI.text = sb.ToString();
        }

        /// <inheritdoc />
        public override void OnMove(AxisEventData eventData)
        {
            // if we have no choices, there's nothing to do
            if (_choices == null)
            {
                Logger.ZLogTrace($"OnMove with no choices: demand to Selectable.OnMove");
                base.OnMove(eventData);
                return;
            }

            // update the selected index if required/possible
            var update = false;
            var choiceIndex = _choices.IndexOf(choice => choice.index == _selectedIndex);
            // ReSharper disable once SwitchStatementMissingSomeEnumCasesNoDefault
            switch (eventData.moveDir)
            {
                case MoveDirection.Down when choiceIndex < _choices.Count - 1:
                    Logger.ZLogTrace($"OnMove can move down");
                    choiceIndex++;
                    update = true;
                    break;
                case MoveDirection.Up when choiceIndex > 0:
                    Logger.ZLogTrace($"OnMove can move up");
                    choiceIndex--;
                    update = true;
                    break;
            }

            // update text and mark event as used if the selected index changed
            if (!update)
            {
                // out of bounds: delegate to selectable move
                Logger.ZLogTrace($"OnMove could not move: demand to Selectable.OnMove");
                base.OnMove(eventData);
                return;
            }

            Logger.ZLogTrace($"OnMove handles the internal movement and doesn't demand to Selectable");
            eventData.Use();
            _selectedIndex = _choices[choiceIndex].index;
            UpdateText();
        }

        /// <inheritdoc />
        public override void OnSelect(BaseEventData eventData)
        {
            _isSelected = true;
            base.OnSelect(eventData);
            // when this object gets selected, update the text so that the internally-selected entry gets highlighted
            UpdateText();
        }

        /// <inheritdoc />
        public override void OnDeselect(BaseEventData eventData)
        {
            _isSelected = false;
            base.OnDeselect(eventData);
            // when this object gets deselected, update the text so that the internally-selected entry stops being
            // highlighted
            UpdateText();
        }

        private void ChoiceSelected(int index)
        {
            Logger.ZLogTrace($"Picked choice {index}");
            choiceSelectedEvent.Invoke(index);
            Destroy(gameObject);
        }

        /// <summary>
        ///     Description of a single choice.
        /// </summary>
        /// <param name="index">The internal index of the choice.</param>
        /// <param name="text">The text of the choice.</param>
        public record Choice(int index, string text);
    }
}