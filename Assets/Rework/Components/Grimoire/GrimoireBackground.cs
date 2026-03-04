using UnityEngine;
using UnityEngine.Events;

namespace Selania.Rework.Components.Grimoire
{
    public class GrimoireBackground : MonoBehaviour
    {
        private static readonly int Opened = Animator.StringToHash("Opened");

        [Tooltip("Invoked when the grimoire is asked to close.")] [SerializeField]
        private UnityEvent close = new();

        private Animator _animator = null!;

        private void Awake()
        {
            _animator = GetComponent<Animator>();
        }

        public void ShowGrimoire()
        {
            _animator.SetBool(Opened, true);
        }

        public void HideGrimoire()
        {
            _animator.SetBool(Opened, false);
        }

        /// <summary>
        ///     Callback for the close button.
        /// </summary>
        public void OnCloseButtonClicked()
        {
            close.Invoke();
        }
    }
}