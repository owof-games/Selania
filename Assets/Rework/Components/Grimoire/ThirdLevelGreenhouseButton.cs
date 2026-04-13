using Microsoft.Extensions.Logging;
using R3;
using Selania.Rework.Interfaces;
using UnityEngine;
using UnityEngine.UI;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.Grimoire
{
    public class ThirdLevelGreenhouseButton : MonoBehaviour, IAutomaticEditorInject
    {
        /// <summary>
        ///     Possible statuses of this button
        /// </summary>
        public enum Status
        {
            /// <summary>
            ///     The button can be clicked.
            /// </summary>
            Active,

            /// <summary>
            ///     The button is full color, but cannot be clicked.
            /// </summary>
            Owned,

            /// <summary>
            ///     The button cannot be clicked and it's desaturated.
            /// </summary>
            Consumed
        }

        [Tooltip("Background when the button cannot be clicked")] [SerializeField]
        private Sprite nonActiveBackground = null!;

        [Tooltip("Button image")] [SerializeField]
        private Image image = null!;

        private Observable<Unit>? _click;

        /// <summary>
        ///     (lazy) reference to the grimoire button helper.
        /// </summary>
        private GrimoireButtonHelper? _grimoireButtonHelper;

        /// <summary>
        ///     (lazy) reference to the saturation control component on this button.
        /// </summary>
        private GrimoireButtonSaturationControl? _grimoireButtonSaturationControl;

        private Status _status = Status.Consumed;

        /// <summary>
        ///     The logger for this component.
        /// </summary>
        [Inject] internal ILogger<ThirdLevelGreenhouseButton> Logger = null!;

        /// <summary>
        ///     The settings regarding the book.
        /// </summary>
        [Inject] internal ISettingsBook SettingsBook = null!;

        public Observable<Unit> click =>
            _click ??= GetComponent<Button>().OnClickAsObservable().Where(_ => _status == Status.Active);

        /// <summary>
        ///     Set the current status of the button.
        /// </summary>
        /// <param name="status">The status of the button.</param>
        public void SetStatus(Status status)
        {
            _status = status;
            var isConsumed = status == Status.Consumed;
            var isActive = status == Status.Active;

            // set the saturation
            _grimoireButtonSaturationControl ??= GetComponent<GrimoireButtonSaturationControl>();
            _grimoireButtonSaturationControl.SetSaturation(isConsumed
                ? SettingsBook.exhaustedGreenhouseButtonSaturationLevel
                : 1f);

            // set the button style
            _grimoireButtonHelper ??= GetComponent<GrimoireButtonHelper>();
            _grimoireButtonHelper.OverrideOriginalSprite(isActive ? null : nonActiveBackground);
            _grimoireButtonHelper.SetAlternativePosition(isActive);
            _grimoireButtonHelper.SetLogicallyDisabledStatus(!isActive);
        }

        /// <summary>
        ///     Set the image for the button.
        /// </summary>
        /// <param name="plantName">Name of the plant for the image.</param>
        public void SetImage(string plantName)
        {
            var sprite = SettingsBook.GetGreenhouseSprite(plantName);
            if (sprite == null)
            {
                Logger.ZLogWarning($"There is no image for plan with name {plantName}, add it to the selania settings");
                return;
            }

            image.sprite = sprite;
        }
    }
}