using TMPro;
using UnityEngine;

namespace Selania.Rework.Components.Museum.ChoicePicker
{
    public class ChoicePickerMuseumSectionDebugController : MonoBehaviour
    {
        [SerializeField] private TextMeshProUGUI textMeshProUGUI = null!;

        public void OnChoicePicked(string text)
        {
            textMeshProUGUI.text = textMeshProUGUI.text + "\n" + text;
        }
    }
}