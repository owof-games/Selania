using UnityEngine;

namespace Selania.Rework.Components.Grimoire
{
    public class Grimoire : MonoBehaviour, IAutomaticEditorInject
    {
        private static readonly int Opened = Animator.StringToHash("Opened");

        [SerializeField] private Animator bookAnimator = null!;

        public void OnGrimoireButtonClick()
        {
            bookAnimator.SetBool(Opened, true);
        }
    }
}