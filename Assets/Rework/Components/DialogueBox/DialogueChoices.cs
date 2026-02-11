using System.Collections.Generic;
using System.Linq;
using System.Text;
using Selania.Rework.Interfaces;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using VContainer;

namespace Selania.Rework.Components.DialogueBox
{
    /// <summary>
    ///     The component that handles dialogue choices
    /// </summary>
    public class DialogueChoices : MonoBehaviour, IPointerMoveHandler
    {
        /// <summary>
        ///     The text mesh pro that handles the choices
        /// </summary>
        [SerializeField] private TextMeshProUGUI textMeshProUGUI = null!;

        /// <summary>
        ///     The last set of choices given for the components (if any).
        /// </summary>
        private IList<Choice>? _choices;

        /// <summary>
        ///     The last selected index (-1 = nothing selected).
        /// </summary>
        private int _selectedIndex = -1;

        /// <summary>
        ///     The settings used to read the parameters for the choices.
        /// </summary>
        [Inject] internal ISettingsDialogueBox SettingsDialogueBox = null!;

#if UNITY_EDITOR
        private void OnValidate()
        {
            textMeshProUGUI = GetComponentInChildren<TextMeshProUGUI>();
        }
#endif

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

            if (_selectedIndex == newIndex) return;

            _selectedIndex = newIndex;
            UpdateText();
        }

        /// <summary>
        ///     Set the list of available choices.
        /// </summary>
        /// <param name="choices">The choices to set.</param>
        public void SetChoices(IEnumerable<Choice> choices)
        {
            _choices = choices.ToList();
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

            var sb = new StringBuilder();
            var i = 1;
            foreach (var choice in _choices)
            {
                var color = choice.index == _selectedIndex
                    ? SettingsDialogueBox.selectedChoiceColor
                    : SettingsDialogueBox.defaultChoiceColor;
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

        /// <summary>
        ///     Description of a single choice.
        /// </summary>
        /// <param name="index">The internal index of the choice.</param>
        /// <param name="text">The text of the choice.</param>
        public record Choice(int index, string text);
    }
}