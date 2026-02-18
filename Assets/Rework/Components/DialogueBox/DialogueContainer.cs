using System;
using UnityEngine;
using UnityEngine.EventSystems;

namespace Selania.Rework.Components.DialogueBox
{
    /// <summary>
    /// A container for the dialogue used to catch clicks that are interpreted as requests to advance in the dialogue.
    /// </summary>
    public class DialogueContainer : MonoBehaviour, IPointerClickHandler
    {
        public void OnPointerClick(PointerEventData eventData)
        {
            OnClick?.Invoke();
        }

        public event Action? OnClick;
    }
}