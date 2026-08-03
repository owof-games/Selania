using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;
using UnityEngine.UI;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.DialogueBox
{
    /// <summary>
    ///     The component that handles dialogue choices
    /// </summary>
    public class DialogueChoices : Selectable, IPointerMoveHandler, IPointerClickHandler, ISubmitHandler,
        InputActionsDialogueBox.IChoicesSelectionMapActions
    {
        /// <summary>
        ///     The letters used to invoke the choices. Must have a one-to-one correspondence with the actions in the input action
        ///     map.
        /// </summary>
        private static readonly char[] ChoiceKeys =
        {
            '1',
            '2',
            '3',
            '4',
            '5',
            '6',
            '7',
            '8',
            '9',
            '0',
            'A',
            'B',
            'C',
            'D',
            'E',
            'F'
        };

        /// <summary>
        ///     The text mesh pro that handles the choices
        /// </summary>
        [SerializeField] private TextMeshProUGUI textMeshProUGUI = null!;

        /// <summary>
        ///     The logger for this object.
        /// </summary>
        [Inject] internal ILogger<DialogueChoices> Logger = null!;

        /// <summary>
        ///     The settings used to read the parameters for the choices.
        /// </summary>
        [Inject] internal ISettingsDialogueBox SettingsDialogueBox = null!;

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

        protected override void Awake()
        {
            // when the dialogue choice is created, select it
            if (EventSystem.current != null) // could be null in editor mode
                EventSystem.current.SetSelectedGameObject(gameObject, null);
        }

        /// <inheritdoc />
        public void On_1(InputAction.CallbackContext context)
        {
            if (!context.performed) return;
            ChoiceSelected(0);
        }

        /// <inheritdoc />
        public void On_2(InputAction.CallbackContext context)
        {
            if (!context.performed) return;
            ChoiceSelected(1);
        }

        /// <inheritdoc />
        public void On_3(InputAction.CallbackContext context)
        {
            if (!context.performed) return;
            ChoiceSelected(2);
        }

        /// <inheritdoc />
        public void On_4(InputAction.CallbackContext context)
        {
            if (!context.performed) return;
            ChoiceSelected(3);
        }

        /// <inheritdoc />
        public void On_5(InputAction.CallbackContext context)
        {
            if (!context.performed) return;
            ChoiceSelected(4);
        }

        /// <inheritdoc />
        public void On_6(InputAction.CallbackContext context)
        {
            if (!context.performed) return;
            ChoiceSelected(5);
        }

        /// <inheritdoc />
        public void On_7(InputAction.CallbackContext context)
        {
            if (!context.performed) return;
            ChoiceSelected(6);
        }

        /// <inheritdoc />
        public void On_8(InputAction.CallbackContext context)
        {
            if (!context.performed) return;
            ChoiceSelected(7);
        }

        /// <inheritdoc />
        public void On_9(InputAction.CallbackContext context)
        {
            if (!context.performed) return;
            ChoiceSelected(8);
        }

        /// <inheritdoc />
        public void On_0(InputAction.CallbackContext context)
        {
            if (!context.performed) return;
            ChoiceSelected(9);
        }

        /// <inheritdoc />
        public void OnA(InputAction.CallbackContext context)
        {
            if (!context.performed) return;
            ChoiceSelected(10);
        }

        /// <inheritdoc />
        public void OnB(InputAction.CallbackContext context)
        {
            if (!context.performed) return;
            ChoiceSelected(11);
        }

        /// <inheritdoc />
        public void OnC(InputAction.CallbackContext context)
        {
            if (!context.performed) return;
            ChoiceSelected(12);
        }

        /// <inheritdoc />
        public void OnD(InputAction.CallbackContext context)
        {
            if (!context.performed) return;
            ChoiceSelected(13);
        }

        /// <inheritdoc />
        public void OnE(InputAction.CallbackContext context)
        {
            if (!context.performed) return;
            ChoiceSelected(14);
        }

        /// <inheritdoc />
        public void OnF(InputAction.CallbackContext context)
        {
            if (!context.performed) return;
            ChoiceSelected(15);
        }

        /// <inheritdoc />
        public void OnPointerClick(PointerEventData eventData)
        {
            // if we click while hovering a choice, select the choice and destroy this object
            if (_hoveredIndex == -1) return;
            ChoiceSelected(_hoveredIndex);
        }

        /// <inheritdoc />
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

        /// <inheritdoc />
        public void OnSubmit(BaseEventData eventData)
        {
            // if we are selected and there's a choice selected, pick that choice
            if (!_isSelected || _selectedIndex == -1) return;
            ChoiceSelected(_selectedIndex);
        }

        /// <summary>
        ///     Event raised before a choice is picked.
        /// </summary>
        public event Action<ChoiceSelectingEventArgs>? ChoiceSelectingEvent;

        /// <summary>
        ///     Event raised when a choice is picked.
        /// </summary>
        public event Action<int>? ChoiceSelectedEvent;

        /// <inheritdoc />
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
        ///     Updates the text from the choices, the selected index and hovered choice.
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
            var i = 0;
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
                sb.Append(ChoiceKeys[i++]);
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

        /// <summary>
        ///     Pick a choice and send the relative event.
        /// </summary>
        /// <param name="index">Index of the picked choice.</param>
        private void ChoiceSelected(int index)
        {
            Logger.ZLogTrace($"Picked choice {index}");
            var choiceSelectingEventArgs = new ChoiceSelectingEventArgs(index);
            ChoiceSelectingEvent?.Invoke(choiceSelectingEventArgs);
            if (!choiceSelectingEventArgs.Valid)
            {
                Logger.ZLogTrace($"Choice {index} was considered invalid.");
                return;
            }

            ChoiceSelectedEvent?.Invoke(index);
            Destroy(gameObject);
        }

        public class ChoiceSelectingEventArgs
        {
            /// <summary>
            ///     Number of the choice.
            /// </summary>
            public readonly int ChoiceNum;

            /// <summary>
            ///     Whether this choice is valid. Set to <c>false</c> to skip <see cref="DialogueChoices.ChoiceSelectedEvent" /> and
            ///     dialogue choices destruction.
            /// </summary>
            public bool Valid = true;

            public ChoiceSelectingEventArgs(int choiceNum)
            {
                ChoiceNum = choiceNum;
            }
        }

        /// <summary>
        ///     Description of a single choice.
        /// </summary>
        /// <param name="index">The internal index of the choice.</param>
        /// <param name="text">The text of the choice.</param>
        public record Choice(int index, string text);
    }
}