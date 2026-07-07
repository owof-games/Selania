using R3;
using UnityEngine;
using UnityEngine.UI;

namespace Selania.Rework.Components.Grimoire
{
    public class TopLevelButton : MonoBehaviour
    {
        [field: SerializeField]
        [field: Tooltip("Name of the top level button, as it's set in the ink story")]
        public string buttonName { get; private set; } = null!;

        [SerializeField] private GrimoireNotification grimoireNotification = null!;

        private Selectable? _selectable;

        public bool interactable
        {
            set
            {
                _selectable ??= GetComponent<Selectable>();
                _selectable.interactable = value;
            }
        }

        /// <summary>
        ///     An observable that produces an event with this button's name for every click.
        /// </summary>
        public Observable<string> click => GetComponent<Button>().OnClickAsObservable().Select(_ => buttonName);

        public void ShowNotification(bool show)
        {
            grimoireNotification.ShowNotification(show);
        }
    }
}