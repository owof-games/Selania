using System;
using Selania.Rework.Interfaces;
using UnityEngine;
using UnityEngine.UI;
using VContainer;

namespace Selania.Rework.Components.Grimoire
{
    /// <summary>
    ///     Handler for setting up the third level sigils buttons.
    /// </summary>
    public class ThirdLevelSigilsButton : MonoBehaviour, IAutomaticEditorInject
    {
        /// <summary>
        ///     Possible statuses of the button.
        /// </summary>
        public enum Status
        {
            /// <summary>
            ///     Standard version.
            /// </summary>
            Standard,

            /// <summary>
            ///     The sigil is activated and animated.
            /// </summary>
            Activated,

            /// <summary>
            ///     The sigil has been used to the end, and it's disabled.
            /// </summary>
            Disabled
        }

        private static readonly int AnimatedCachedAnimatorProperty = Animator.StringToHash("Animated");
        [SerializeField] private Image firstLevelImage = null!;
        [SerializeField] private Image secondLevelImage = null!;
        [SerializeField] private Image thirdLevelImage = null!;
        [SerializeField] private GrimoireButtonSaturationControl firstLevelSaturationControl = null!;
        [SerializeField] private GrimoireButtonSaturationControl secondLevelSaturationControl = null!;
        [SerializeField] private GrimoireButtonSaturationControl thirdLevelSaturationControl = null!;

        [SerializeField] private Sprite disabledBackgroundSprite = null!;
        private Animator _animator = null!;
        private Button _button = null!;
        private GrimoireButtonHelper _grimoireButtonHelper;

        private float _saturation = 1;
        [Inject] internal ISettingsBook SettingsBook = null!;
        [Inject] internal ISettingsSigils SettingsSigils = null!;

        private void Start()
        {
            _button = GetComponent<Button>();
            _animator = GetComponent<Animator>();
            _grimoireButtonHelper = GetComponent<GrimoireButtonHelper>();
        }

        /// <summary>
        ///     Set up the currently showed sigil in the button.
        /// </summary>
        /// <param name="glyph1">First-level glyph.</param>
        /// <param name="glyph2">Second-level glyph</param>
        /// <param name="glyph3">Third-level glyph</param>
        public void SetUp(ISettingsSigils.GlyphType glyph1, ISettingsSigils.GlyphType glyph2,
            ISettingsSigils.GlyphType glyph3)
        {
            firstLevelImage.sprite = SettingsSigils.GetGlyphSprite(glyph1, 0);
            secondLevelImage.sprite = SettingsSigils.GetGlyphSprite(glyph2, 1);
            thirdLevelImage.sprite = SettingsSigils.GetGlyphSprite(glyph3, 2);
            firstLevelImage.color = SettingsSigils.GetGlyphColor(glyph1);
            secondLevelImage.color = SettingsSigils.GetGlyphColor(glyph2);
            thirdLevelImage.color = SettingsSigils.GetGlyphColor(glyph3);
            UpdateSaturationAndColor();
            _button.interactable = true;
        }

        /// <summary>
        ///     Disable the button
        /// </summary>
        public void Disable()
        {
            _button.interactable = false;
            SetStatus(Status.Standard);
        }

        /// <summary>
        /// Set the status of the button.
        /// </summary>
        /// <param name="status">The status of the button.</param>
        public void SetStatus(Status status)
        {
            switch (status)
            {
                case Status.Standard:
                    _grimoireButtonHelper.OverrideOriginalSprite(null);
                    _animator.SetBool(AnimatedCachedAnimatorProperty, false);
                    _saturation = 1;
                    break;
                case Status.Activated:
                    _grimoireButtonHelper.OverrideOriginalSprite(null);
                    _animator.SetBool(AnimatedCachedAnimatorProperty, true);
                    _saturation = 1;
                    break;
                case Status.Disabled:
                    _grimoireButtonHelper.OverrideOriginalSprite(disabledBackgroundSprite);
                    _animator.SetBool(AnimatedCachedAnimatorProperty, false);
                    _saturation = SettingsBook.disabledSigilsSaturationLevel;
                    break;
                default:
                    throw new ArgumentOutOfRangeException(nameof(status), status, null);
            }

            UpdateSaturationAndColor();
        }

        private void UpdateSaturationAndColor()
        {
            firstLevelSaturationControl.SetSaturation(_saturation, firstLevelImage.color);
            secondLevelSaturationControl.SetSaturation(_saturation, secondLevelImage.color);
            thirdLevelSaturationControl.SetSaturation(_saturation, thirdLevelImage.color);
        }
    }
}