using R3;
using UnityEngine;
using UnityEngine.UI;

namespace Selania.Rework.Components.Grimoire
{
    public class SecondLevelGreenhouseButton : MonoBehaviour
    {
        /// <summary>
        ///     The name of this plant.
        /// </summary>
        [field: SerializeField]
        [Tooltip("The name of this plant.")]
        public string plantName { get; set; } = null!;

        /// <summary>
        ///     (lazy) reference to the button component.
        /// </summary>
        private Button? _button;

        /// <summary>
        ///     (lazy) reference to the saturation control component on this button.
        /// </summary>
        private GrimoireButtonSaturationControl? _grimoireButtonSaturationControl;

        /// <summary>
        ///     See <see cref="Selectable.interactable" />.
        /// </summary>
        public bool interactable
        {
            // get
            // {
            //     _button ??= GetComponent<Button>();
            //     return _button.interactable;
            // }
            set
            {
                _button ??= GetComponent<Button>();
                _button.interactable = value;
            }
        }

        /// <summary>
        ///     An observable that produces an event with this button's name for every click.
        /// </summary>
        public Observable<string> click => GetComponent<Button>().OnClickAsObservable().Select(_ => plantName);

        /// <summary>
        ///     Set the saturation of the image. Facade method over <see cref="GrimoireButtonSaturationControl.SetSaturation(float)" />.
        /// </summary>
        /// <param name="saturation">The new saturation (0..1).</param>
        public void SetSaturation(float saturation)
        {
            _grimoireButtonSaturationControl ??= GetComponent<GrimoireButtonSaturationControl>();
            _grimoireButtonSaturationControl.SetSaturation(saturation);
        }
    }
}