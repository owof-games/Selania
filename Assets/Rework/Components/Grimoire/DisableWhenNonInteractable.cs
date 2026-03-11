using R3;
using UnityEngine;
using UnityEngine.UI;

namespace Selania.Rework.Components.Grimoire
{
    /// <summary>
    ///     Script that disables an element when another becomes non interactable, and vice versa.
    /// </summary>
    [ExecuteInEditMode]
    public class DisableWhenNonInteractable : MonoBehaviour
    {
        [SerializeField] [Tooltip("The selectable whose interactable status is checked.")]
        private Selectable selectable = null!;

        [SerializeField]
        [Tooltip("The target that gets enabled or disabled according to the selectable's interactable status.")]
        private Behaviour target = null!;

        private void Start()
        {
            Observable.EveryUpdate()
                .Select(_ => selectable.interactable)
                .DistinctUntilChanged()
                .Subscribe(interactable => target.enabled = interactable)
                .AddTo(this);
        }
    }
}