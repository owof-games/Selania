using UnityEngine;

namespace Selania.Rework.Components.Grimoire
{
    public class Grimoire : MonoBehaviour, IAutomaticEditorInject
    {
        [SerializeField] private GrimoireBackground grimoireBackground = null!;

        public void OnGrimoireButtonClick()
        {
            grimoireBackground.ShowGrimoire();
        }

        public void OnGrimoireCloseButtonClick()
        {
            grimoireBackground.HideGrimoire();
        }
    }
}