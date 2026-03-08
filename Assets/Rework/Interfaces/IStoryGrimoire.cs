using System.Collections.Generic;
using R3;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     Part of the story management that regards the grimoire.
    /// </summary>
    public interface IStoryGrimoire
    {
        /// <summary>
        ///     An observable that produces a value whenever a top level grimoire page should be displayed.
        /// </summary>
        Observable<FirstLevelGrimoirePageDescriptor> firstLevelGrimoirePageDescriptors { get; }

        /// <summary>
        ///     Switches to the flow of the grimoire.
        /// </summary>
        /// <seealso cref="SwitchFromGrimoire" />
        public void SwitchToGrimoire();

        /// <summary>
        ///     Switches back to the main story starting from grimoire.
        /// </summary>
        /// <seealso cref="SwitchToGrimoire" />
        public void SwitchFromGrimoire();

        /// <summary>
        ///     Descriptor of an achievement.
        /// </summary>
        /// <param name="achievementName">Name of the achievement to set-up.</param>
        /// <param name="amount">The amount of this achievement (from 0 to <paramref name="max" />).</param>
        /// <param name="max">The maximum amount of the achievement.</param>
        /// <seealso cref="FirstLevelGrimoirePageDescriptor" />
        public record AchievementDescriptor(string achievementName, int amount, int max);

        /// <summary>
        ///     Descriptor for a sigil.
        /// </summary>
        /// <param name="firstPositionGlyph">Glyph in the first position.</param>
        /// <param name="secondPositionGlyph">Glyph in the second position.</param>
        /// <param name="thirdPositionGlyph">Glyph in the third position.</param>
        /// <param name="text">Text to show about the number of usages available.</param>
        /// <seealso cref="FirstLevelGrimoirePageDescriptor" />
        public record SigilDescriptor(
            ISettingsSigils.GlyphType firstPositionGlyph,
            ISettingsSigils.GlyphType secondPositionGlyph,
            ISettingsSigils.GlyphType thirdPositionGlyph,
            string text);

        /// <summary>
        ///     Descriptor for the data to show on the first page of the grimoire.
        /// </summary>
        /// <param name="isGamerMode">Whether the page should be displayed in gamer mode.</param>
        /// <param name="enabledLeftButtonNames">Names of the left buttons enabled.</param>
        /// <param name="achievements">
        ///     Descriptors of the achievements; if an achievement is missing, it's supposed to be at value
        ///     0.
        /// </param>
        /// <param name="francoMission">Text for Franco's mission, or empty string if there's no mission.</param>
        /// <param name="sigilDescriptor">Descriptor of the current sigil, or <c>null</c> if there's no active sigil.</param>
        /// <param name="hasIndex">Whether the 'index' bookmark is active (it's <c>false</c> during rewriting).</param>
        /// <param name="backToLevelTwoText">
        ///     Text for the 'back to level two' button, if not <c>null</c>, otherwise the bookmark is
        ///     hidden.
        /// </param>
        /// <param name="previousPageText">
        ///     Text for the 'previous page' button, if not <c>null</c>, otherwise the bookmark is
        ///     hidden.
        /// </param>
        /// <param name="nextPageText">Text for the 'next page' button, if not <c>null</c>, otherwise the bookmark is hidden.</param>
        /// <seealso cref="IStoryGrimoire.firstLevelGrimoirePageDescriptors" />
        record FirstLevelGrimoirePageDescriptor(
            bool isGamerMode,
            IEnumerable<string> enabledLeftButtonNames,
            IEnumerable<AchievementDescriptor> achievements,
            string francoMission,
            SigilDescriptor? sigilDescriptor,
            bool hasIndex,
            string? backToLevelTwoText,
            string? previousPageText,
            string? nextPageText);
    }
}