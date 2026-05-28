using R3;

namespace Selania.Rework.Interfaces
{
    public interface IStorySigilSupport
    {
        /// <summary>
        ///     An observable producing <c>null</c> if there's no active sigil, or the triplet of glyphs of that sigil (from bottom
        ///     to top).
        /// </summary>
        Observable<SigilDescriptor?> ActiveSigil { get; }

        /// <summary>
        ///     An observable producing the number of usages available for the active sigil. It's <c>0</c> if there's no active
        ///     sigil.
        /// </summary>
        Observable<int> ActiveSigilAvailableUsages { get; }

        public record SigilDescriptor(
            ISettingsSigils.GlyphType Glyph1,
            ISettingsSigils.GlyphType Glyph2,
            ISettingsSigils.GlyphType Glyph3);
    }
}