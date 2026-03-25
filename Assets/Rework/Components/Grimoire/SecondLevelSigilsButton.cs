using R3;
using Selania.Rework.Interfaces;
using UnityEngine;
using UnityEngine.UI;
using VContainer;

namespace Selania.Rework.Components.Grimoire
{
    /// <summary>
    ///     Component that sets up the glyphs for the second level button
    /// </summary>
    public class SecondLevelSigilsButton : MonoBehaviour, IAutomaticEditorInject
    {
        private static readonly int Enabled = Animator.StringToHash("Enabled");

        [field: Tooltip("The first level glyph.")]
        [field: SerializeField]
        public ISettingsSigils.GlyphType firstLevelGlyph { get; private set; }

        [field: Tooltip("The second level glyph.")]
        [field: SerializeField]
        public ISettingsSigils.GlyphType secondLevelGlyph { get; private set; }

        [Tooltip("The image component that contains the first level glyph.")] [SerializeField]
        private Image firstLevelGlyphImage = null!;

        [Tooltip("The image component that contains the second level glyph.")] [SerializeField]
        private Image secondLevelGlyphImage = null!;

        [Tooltip("The animator for the enabled state")] [SerializeField]
        private Animator animator = null!;

        /// <summary>
        ///     The settings regarding sigils
        /// </summary>
        [Inject] internal ISettingsSigils SettingsSigils = null!;

        /// <summary>
        ///     An observable that produces an event with this button's name for every click.
        /// </summary>
        public Observable<(ISettingsSigils.GlyphType, ISettingsSigils.GlyphType)> click => GetComponent<Button>()
            .OnClickAsObservable().Select(_ => (firstLevelGlyph, secondLevelGlyph));


        private void Start()
        {
            firstLevelGlyphImage.sprite = SettingsSigils.GetGlyphSprite(firstLevelGlyph, 0);
            firstLevelGlyphImage.color = SettingsSigils.GetGlyphColor(firstLevelGlyph);
            secondLevelGlyphImage.sprite = SettingsSigils.GetGlyphSprite(secondLevelGlyph, 1);
            secondLevelGlyphImage.color = SettingsSigils.GetGlyphColor(secondLevelGlyph);
        }

        /// <summary>
        ///     Enable or disable the animation.
        /// </summary>
        /// <param name="enabledValue">Whether the sigil is enabled.</param>
        public void EnableAnimation(bool enabledValue)
        {
            animator.SetBool(Enabled, enabledValue);
        }
    }
}