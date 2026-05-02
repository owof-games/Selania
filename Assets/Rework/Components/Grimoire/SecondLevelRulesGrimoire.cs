using TMPro;
using UnityEngine;

namespace Selania.Rework.Components.Grimoire
{
    public class SecondLevelRulesGrimoire : MonoBehaviour
    {
        [SerializeField] private TMP_Text rulesText = null!;

        public void SetRulesText(string text)
        {
            rulesText.text = text;
        }
    }
}