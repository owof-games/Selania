using System;
using UnityEngine;

namespace Selania.Rework.Components.Grimoire
{
    [RequireComponent(typeof(Animator))]
    public class GrimoireNotification : MonoBehaviour
    {
        private static readonly int NotificationVisible = Animator.StringToHash("NotificationVisible");
        private Animator? _animator;

        private void Awake()
        {
            _animator = GetComponent<Animator>();
        }

        public void ShowNotification()
        {
            if (_animator == null) throw new InvalidOperationException("Wait for Awake()");
            _animator.SetBool(NotificationVisible, true);
        }
    }
}