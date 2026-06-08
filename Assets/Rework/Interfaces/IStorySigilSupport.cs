using R3;

namespace Selania.Rework.Interfaces
{
    public interface IStorySigilSupport
    {
        /// <summary>
        ///     An observable producing <c>null</c> if there's no active sigil, or the glyphs of that sigil + number of usages.
        /// </summary>
        Observable<SigilDescriptor?> ActiveSigilInfo { get; }

        /// <summary>
        ///     An observable that emits a value every time an active sigil is used.
        /// </summary>
        Observable<Unit> SigilInfluence { get; }

        /// <summary>
        ///     A descriptor for the currently used sigil.
        /// </summary>
        /// <param name="Glyph1">First (lowest) glyph of the sigil.</param>
        /// <param name="Glyph2">Second (middle) glyph of the sigil.</param>
        /// <param name="Glyph3">Third (topmost) glyph of the sigil.</param>
        /// <param name="NumUsages">Number of available usages.</param>
        public record SigilDescriptor(
            ISettingsSigils.GlyphType Glyph1,
            ISettingsSigils.GlyphType Glyph2,
            ISettingsSigils.GlyphType Glyph3,
            int NumUsages);
    }
}