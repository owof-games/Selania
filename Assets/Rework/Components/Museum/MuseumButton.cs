using System;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using Debug = System.Diagnostics.Debug;

namespace Selania.Rework.Components.Museum
{
    public class MuseumButton : MonoBehaviour
    {
        private string _text = "";
        private TextMeshProUGUI? _textMeshProUGUI;

        private void Start()
        {
            _textMeshProUGUI = GetComponentInChildren<TextMeshProUGUI>();
            Debug.Assert(_textMeshProUGUI != null, nameof(_textMeshProUGUI) + " != null");
            _textMeshProUGUI.text = _text;
            _text = "";
        }

        /// <summary>
        ///     Set the text of the button.
        /// </summary>
        /// <param name="text">Text of the button.</param>
        public void SetText(string text)
        {
            if (_textMeshProUGUI == null)
                _text = text;
            else
                _textMeshProUGUI.text = text;
        }

        /// <summary>
        ///     Add a listener to the button.
        /// </summary>
        /// <param name="action">The listener to add.</param>
        /// <param name="payload">The payload that will be passed to the action when invoked.</param>
        public void OnClick<T>(Action<T> action, T payload)
        {
            GetComponent<Button>().onClick.AddListener(() => action(payload));
        }
    }
}