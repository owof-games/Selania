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
        ///     An observable that produces a value whenever a second level greenhouse grimoire page should be displayed.
        /// </summary>
        Observable<SecondLevelGreenhouseGrimoirePageDescriptor> secondLevelGreenhouseGrimoirePageDescriptors { get; }

        /// <summary>
        ///     An observable that produces a value whenever a second level sigils grimoire page should be displayed.
        /// </summary>
        Observable<SecondLevelSigilsGrimoirePageDescriptor> secondLevelSigilsGrimoirePageDescriptors { get; }

        /// <summary>
        ///     An observable that produces a value whenever a third level sigils grimoire page should be displayed.
        /// </summary>
        Observable<ThirdLevelSigilsGrimoirePageDescriptor> thirdLevelSigilsGrimoirePageDescriptors { get; }

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
        /// Information about navigation bookmarks.
        /// </summary>
        /// <param name="indexText">Text for the 'index' bookmark, if not <c>null</c>, otherwise the bookmark is hidden (e.g. during rewriting).</param>
        /// <param name="backToLevelTwoText">
        ///     Text for the 'back to level two' button, if not <c>null</c>, otherwise the bookmark is
        ///     hidden.
        /// </param>
        /// <param name="previousPageText">
        ///     Text for the 'previous page' button, if not <c>null</c>, otherwise the bookmark is
        ///     hidden.
        /// </param>
        /// <param name="nextPageText">Text for the 'next page' button, if not <c>null</c>, otherwise the bookmark is hidden.</param>
        record BaseNavigationDescriptor(
            string? indexText,
            string? backToLevelTwoText,
            string? previousPageText,
            string? nextPageText);

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
        /// <seealso cref="IStoryGrimoire.firstLevelGrimoirePageDescriptors" />
        record FirstLevelGrimoirePageDescriptor(
            bool isGamerMode,
            IEnumerable<string> enabledLeftButtonNames,
            IEnumerable<AchievementDescriptor> achievements,
            string francoMission,
            SigilDescriptor? sigilDescriptor) : BaseNavigationDescriptor(null, null, null, null);

        /// <summary>
        /// Descriptor of a single greenhouse button.
        /// </summary>
        /// <param name="owned">Whether this plant is currently owned or not.</param>
        /// <param name="name">Name of the plant (as expressed in the ink items).</param>
        record GreenhouseButtonPlantDescriptor(bool owned, string name);

        /// <summary>
        /// Descriptor of the second level page of the greenhouse.
        /// </summary>
        /// <param name="indexText">Text of the "index" choice.</param>
        /// <param name="greenhouseButtonPlantDescriptors">Descriptor for all the buttons.</param>
        record SecondLevelGreenhouseGrimoirePageDescriptor(
            string? indexText,
            IEnumerable<GreenhouseButtonPlantDescriptor> greenhouseButtonPlantDescriptors
        ) : BaseNavigationDescriptor(indexText, null, null, null);

        /// <summary>
        ///     Descriptor for a sigils group (sigil button in second level).
        /// </summary>
        /// <param name="glyph1">First level glyph of the sigil group.</param>
        /// <param name="glyph2">Second level glyph of the sigil group.</param>
        /// <param name="enabled">Whether the currently enabled sigil is in this group.</param>
        record SigilsGroupDescriptor(ISettingsSigils.GlyphType glyph1, ISettingsSigils.GlyphType glyph2, bool enabled);

        /// <summary>
        ///     Descriptor of the second level page of the sigils.
        /// </summary>
        /// <param name="indexText">Text of the "index" choice.</param>
        /// <param name="sigilsGroupDescriptors">Descriptors for all the buttons.</param>
        record SecondLevelSigilsGrimoirePageDescriptor(
            string? indexText,
            IEnumerable<SigilsGroupDescriptor> sigilsGroupDescriptors)
            : BaseNavigationDescriptor(indexText, null, null, null);

        /// <summary>
        ///     Description of a third level sigils' header.
        /// </summary>
        /// <param name="isLocked">Whether the header is locked; if it is, all the rest of the data is ignored.</param>
        /// <param name="title">Title of the page side.</param>
        /// <param name="description">Description of the page side.</param>
        /// <param name="glyph1">First-level glyph for left side sigils.</param>
        /// <param name="glyph2">Second-level glyph for left side sigils.</param>
        record ThirdLevelSigilsGrimoirePageSideDescriptor(
            bool isLocked,
            string title,
            string description,
            ISettingsSigils.GlyphType glyph1,
            ISettingsSigils.GlyphType glyph2);

        /// <summary>
        ///     Description for third level sigils.
        /// </summary>
        /// <param name="isLocked">Whether the sigil is locked; if it is, all the rest of the data is ignored.</param>
        /// <param name="name">Name of the sigil.</param>
        /// <param name="glyph3">Third-level glyph of the sigil (first two levels are given by the header).</param>
        /// <param name="firstLine">First line of description for the sigils.</param>
        /// <param name="secondLine">Second line of description for the sigils.</param>
        /// <param name="thirdLine">Third line of description for the sigils.</param>
        record ThirdLevelSigil(
            bool isLocked,
            string name,
            ISettingsSigils.GlyphType glyph3,
            string firstLine,
            string secondLine,
            string thirdLine);

        /// <summary>
        ///     Descriptor of the third level page of the sigils.
        /// </summary>
        /// <param name="leftSideHeader">Description for the left side header.</param>
        /// <param name="rightSideHeader">Description for the right side header.</param>
        /// <param name="leftSide1">Description of the first left side sigil.</param>
        /// <param name="leftSide2">Description of the second left side sigil.</param>
        /// <param name="leftSide3">Description of the third left side sigil.</param>
        /// <param name="rightSide1">Description of the first right side sigil.</param>
        /// <param name="rightSide2">Description of the second right side sigil.</param>
        /// <param name="rightSide3">Description of the third right side sigil.</param>
        record ThirdLevelSigilsGrimoirePageDescriptor(
            string indexText,
            string backToLevelTwoText,
            string? previousPageText,
            string? nextPageText,
            ThirdLevelSigilsGrimoirePageSideDescriptor leftSideHeader,
            ThirdLevelSigilsGrimoirePageSideDescriptor rightSideHeader,
            ThirdLevelSigil leftSide1,
            ThirdLevelSigil leftSide2,
            ThirdLevelSigil leftSide3,
            ThirdLevelSigil rightSide1,
            ThirdLevelSigil rightSide2,
            ThirdLevelSigil rightSide3
        ) : BaseNavigationDescriptor(indexText, backToLevelTwoText, previousPageText, nextPageText);
    }
}