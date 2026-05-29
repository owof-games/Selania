using R3;

namespace Selania.Rework.Interfaces
{
    public interface IStorySigilSupport
    {
        /// <summary>
        ///     An observable producing <c>null</c> if there's no active sigil, or the glyphs of that sigil + number of usages.
        /// </summary>
        Observable<SigilDescriptor?> ActiveSigilInfo { get; }

        public record SigilDescriptor(
            ISettingsSigils.GlyphType Glyph1,
            ISettingsSigils.GlyphType Glyph2,
            ISettingsSigils.GlyphType Glyph3,
            int numUsages);
    }
}