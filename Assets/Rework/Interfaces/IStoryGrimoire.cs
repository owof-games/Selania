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
        ///     Possible statuses of a third level greenhouse page.
        /// </summary>
        enum ThirdLevelGreenhouseStatus
        {
            /// <summary>
            ///     The page is not displayed at all (empty page).
            /// </summary>
            Hidden,

            /// <summary>
            ///     The page shows a locked plant.
            /// </summary>
            Locked,

            /// <summary>
            ///     The page shows a used plant.
            /// </summary>
            Consumed,

            /// <summary>
            ///     The page shows a plant currently owned.
            /// </summary>
            Owned,

            /// <summary>
            ///     The page shows a plant currently owned and with an active button.
            /// </summary>
            Active
        }

        /// <summary>
        ///     Possible status for third-level sigils
        /// </summary>
        enum ThirdLevelSigilStatus
        {
            /// <summary>
            ///     Default status.
            /// </summary>
            Default,

            /// <summary>
            ///     Sigil is selected (at most one).
            /// </summary>
            Selected,

            /// <summary>
            ///     Sigil is consumed (cannot be selected any longer).
            /// </summary>
            Consumed,

            /// <summary>
            ///     Sigil is unclickable (some other sigil is already active).
            /// </summary>
            Unclickable
        }

        /// <summary>
        ///     An observable that says whether the grimoire is enabled.
        /// </summary>
        public Observable<bool> IsGrimoireEnabled { get; }

        /// <summary>
        ///     Observable emitted whenever something has changed in the grimoire.
        /// </summary>
        public Observable<Unit> GrimoireChanged { get; }

        /// <summary>
        ///     An observable that produces a <c>Unit.Default</c> whenever a @grimoireClose command is raised.
        /// </summary>
        Observable<Unit> close { get; }

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
        ///     An observable that produces a value whenever a second level characters grimoire page should be displayed.
        /// </summary>
        Observable<SecondLevelCharacterPageDescriptor> secondLevelCharacterPageDescriptors { get; }

        /// <summary>
        ///     An observable that produces a value whenever a second level Franco grimoire page should be displayed.
        /// </summary>
        Observable<SecondLevelFrancoPageDescriptor> secondLevelFrancoPageDescriptors { get; }

        /// <summary>
        ///     An observable that produces a value whenever a second level rules grimoire page should be displayed.
        /// </summary>
        Observable<SecondLevelRulesPageDescriptor> secondLevelRulesPageDescriptors { get; }

        /// <summary>
        ///     An observable that produces a value whenever a second level appendix grimoire page should be displayed.
        /// </summary>
        Observable<SecondLevelAppendixPageDescriptor> secondLevelAppendixPageDescriptors { get; }

        /// <summary>
        ///     An observable that produces a value whenever a third level sigils grimoire page should be displayed.
        /// </summary>
        Observable<ThirdLevelSigilsGrimoirePageDescriptor> thirdLevelSigilsGrimoirePageDescriptors { get; }

        /// <summary>
        ///     An observable that produces a value whenever a third level greenhouse grimoire page should be displayed.
        /// </summary>
        Observable<ThirdLevelGreenhouseGrimoirePageDescriptor> thirdLevelGreenhouseGrimoirePageDescriptors { get; }

        /// <summary>
        ///     An observable that produces a value whenever a third level text page should be displayed.
        /// </summary>
        Observable<ThirdLevelTextGrimoirePageDescriptor> thirdLevelTextGrimoirePageDescriptors { get; }

        /// <summary>
        ///     An observable that produces a value whenever a third level text page should go to the previous page.
        /// </summary>
        Observable<Unit> thirdLevelTextPreviousPage { get; }

        /// <summary>
        ///     An observable that produces a value whenever a third level text page should go to the next page.
        /// </summary>
        Observable<Unit> thirdLevelTextNextPage { get; }

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
            string? nextPageText,
            string? closeChoiceText);

        /// <summary>
        ///     Descriptor for the data to show on the first page of the grimoire.
        /// </summary>
        /// <param name="isGamerMode">Whether the page should be displayed in gamer mode.</param>
        /// <param name="enabledLeftButtonNames">Names of the left buttons enabled, together with a flag indicating whether to show a notification change.</param>
        /// <param name="achievements">
        ///     Descriptors of the achievements; if an achievement is missing, it's supposed to be at value
        ///     0.
        /// </param>
        /// <param name="francoMission">Text for Franco's mission, or empty string if there's no mission.</param>
        /// <param name="sigilDescriptor">Descriptor of the current sigil, or <c>null</c> if there's no active sigil.</param>
        /// <seealso cref="IStoryGrimoire.firstLevelGrimoirePageDescriptors" />
        record FirstLevelGrimoirePageDescriptor(
            bool isGamerMode,
            IEnumerable<(string, bool)> enabledLeftButtonNames,
            IEnumerable<AchievementDescriptor> achievements,
            string francoMission,
            SigilDescriptor? sigilDescriptor) : BaseNavigationDescriptor(null, null, null, null, null);

        /// <summary>
        /// Descriptor of a single greenhouse button.
        /// </summary>
        /// <param name="owned">Whether this plant is currently owned or not.</param>
        /// <param name="name">Name of the plant (as expressed in the ink items).</param>
        /// <param name="isChanged">Whether a notification should be shown on the plant because it's new.</param>
        record GreenhouseButtonPlantDescriptor(bool owned, string name, bool isChanged);

        /// <summary>
        /// Descriptor of the second level page of the greenhouse.
        /// </summary>
        /// <param name="indexText">Text of the "index" choice.</param>
        /// <param name="closeText">Text of the "close" choice.</param>
        /// <param name="greenhouseButtonPlantDescriptors">Descriptor for all the buttons.</param>
        record SecondLevelGreenhouseGrimoirePageDescriptor(
            string? indexText,
            string? closeText,
            IEnumerable<GreenhouseButtonPlantDescriptor> greenhouseButtonPlantDescriptors
        ) : BaseNavigationDescriptor(indexText, null, null, null, closeText);

        /// <summary>
        ///     Descriptor for a sigils group (sigil button in second level).
        /// </summary>
        /// <param name="glyph1">First level glyph of the sigil group.</param>
        /// <param name="glyph2">Second level glyph of the sigil group.</param>
        /// <param name="enabled">Whether the currently enabled sigil is in this group.</param>
        /// <param name="isChanged">Whether the sigil is new from the last time it was seen.</param>
        record SigilsGroupDescriptor(
            ISettingsSigils.GlyphType glyph1,
            ISettingsSigils.GlyphType glyph2,
            bool enabled,
            bool isChanged);

        /// <summary>
        ///     Descriptor of the second level page of the sigils.
        /// </summary>
        /// <param name="indexText">Text of the "index" choice.</param>
        /// <param name="sigilsGroupDescriptors">Descriptors for all the buttons.</param>
        record SecondLevelSigilsGrimoirePageDescriptor(
            string? indexText,
            IEnumerable<SigilsGroupDescriptor> sigilsGroupDescriptors)
            : BaseNavigationDescriptor(indexText, null, null, null, null);

        /// <summary>
        ///     Descriptor for the content of the pentacle.
        /// </summary>
        /// <param name="aetherValue1"></param>
        /// <param name="aetherValue2"></param>
        /// <param name="airValue1"></param>
        /// <param name="airValue2"></param>
        /// <param name="fireValue1"></param>
        /// <param name="fireValue2"></param>
        /// <param name="earthValue1"></param>
        /// <param name="earthValue2"></param>
        /// <param name="waterValue1"></param>
        /// <param name="waterValue2"></param>
        public record PentacleDescriptor(
            float aetherValue1,
            float aetherValue2,
            float airValue1,
            float airValue2,
            float fireValue1,
            float fireValue2,
            float earthValue1,
            float earthValue2,
            float waterValue1,
            float waterValue2);

        /// <summary>
        ///     Descriptor of the second level page of the characters.
        /// </summary>
        /// <param name="inkName">Name of the character in ink (FirstCharacter, SecondCharacter, ...).</param>
        /// <param name="name">Name to display (Chitarra, Riccio, ...).</param>
        /// <param name="description">Description of this character.</param>
        /// <param name="tasks">List of tasks, joined by newlines.</param>
        /// <param name="choices">List of available choice texts, together with a flag that indicates if there's a notification to show for that choice.</param>
        /// <param name="pentacleDescriptor">Descriptor for the contents of the pentacle.</param>
        /// <param name="indexText">Text for the index choice.</param>
        record SecondLevelCharacterPageDescriptor(
            string inkName,
            string name,
            string description,
            string tasks,
            IEnumerable<(string, bool)> choices,
            PentacleDescriptor pentacleDescriptor,
            string indexText)
            : BaseNavigationDescriptor(indexText, null, null, null, null);

        /// <summary>
        ///     Descriptor of the second level page for Franco.
        /// </summary>
        /// <param name="favour">The favor requested.</param>
        /// <param name="recipeTitle">The title of the recipe, or <c>null</c> if the recipe is locked.</param>
        /// <param name="recipeDescription">The recipe description (ignored if <paramref name="recipeTitle"/> is <c>null</c>).</param>
        /// <param name="recipeContents">The recipe contents (ignored if <paramref name="recipeTitle"/> is <c>null</c>)</param>
        /// <param name="indexText">Text for the index choice.</param>
        record SecondLevelFrancoPageDescriptor(
            string favour,
            string? recipeTitle,
            string recipeDescription,
            string recipeContents,
            string indexText)
            : BaseNavigationDescriptor(indexText, null, null, null, null);

        /// <summary>
        ///     Descriptor of the second leve page for the rules.
        /// </summary>
        /// <param name="rules">The rules.</param>
        /// <param name="indexText">Text for the index choice.</param>
        record SecondLevelRulesPageDescriptor(string rules, string indexText)
            : BaseNavigationDescriptor(indexText, null, null, null, null);

        /// <summary>
        ///     Descriptor of the second level page of the appendix.
        /// </summary>
        /// <param name="choices">List of available choice texts, plus a flag indicating if the page has changed since last visit.</param>
        /// <param name="indexText">Text for the index choice.</param>
        record SecondLevelAppendixPageDescriptor(
            IEnumerable<(string, bool)> choices,
            string indexText)
            : BaseNavigationDescriptor(indexText, null, null, null, null);

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
        ///     Description of a third level greenhouse page.
        /// </summary>
        /// <param name="title">Title of the page.</param>
        /// <param name="status">Status of the page.</param>
        /// <param name="plantName">Name of the plant, as it appears in the ink list.</param>
        /// <param name="inkChoice">Ink choice, if the status is active.</param>
        /// <param name="pageContents">Contents of the page: a list of page elements, which are either subtitles or contents.</param>
        record ThirdLevelGreenhousePageDescriptor(
            string title,
            ThirdLevelGreenhouseStatus status,
            string plantName,
            string? inkChoice,
            IList<(bool IsSubtitle, string Text)> pageContents);

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
            string thirdLine,
            ThirdLevelSigilStatus status);

        /// <summary>
        ///     Descriptor of the third level page of the sigils.
        /// </summary>
        /// <param name="indexText">Text of the choice to get back to the index.</param>
        /// <param name="backToLevelTwoText">Text of the choice to get back to the second level (sigils).</param>
        /// <param name="previousPageText">Text of the choice to get to the previous page, if there is a previous page, and <c>null</c> otherwise.</param>
        /// <param name="nextPageText">Text of the choice to get to the next page, if there is a previous page, and <c>null</c> otherwise.</param>
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
        ) : BaseNavigationDescriptor(indexText, backToLevelTwoText, previousPageText, nextPageText, null);

        /// <summary>
        ///     Descriptor of the third level page of the greenhouse.
        /// </summary>
        /// <param name="indexText">Text of the choice to get back to the index.</param>
        /// <param name="backToLevelTwoText">Text of the choice to get back to the second level (greenhouse).</param>
        /// <param name="previousPageText">
        ///     Text of the choice to get to the previous page, if there is a previous page, and
        ///     <c>null</c> otherwise.
        /// </param>
        /// <param name="nextPageText">
        ///     Text of the choice to get to the next page, if there is a previous page, and <c>null</c>
        ///     otherwise.
        /// </param>
        /// <param name="leftPage">Descriptor for the left page.</param>
        /// <param name="rightPage">Descriptor for the right page.</param>
        record ThirdLevelGreenhouseGrimoirePageDescriptor(
            string? indexText,
            string backToLevelTwoText,
            string? previousPageText,
            string? nextPageText,
            string? closeChoice,
            ThirdLevelGreenhousePageDescriptor leftPage,
            ThirdLevelGreenhousePageDescriptor rightPage
        ) : BaseNavigationDescriptor(indexText, backToLevelTwoText, previousPageText, nextPageText, closeChoice);

        /// <summary>
        /// Descriptor for the third level page showing text (third level characters, appendices, and second level moon). 
        /// </summary>
        /// <param name="style">The page style (defines colors and backgrounds)</param>
        /// <param name="icon">Icon to use (character, moon, ...)</param>
        /// <param name="title">The title of the page</param>
        /// <param name="description">The description of the page</param>
        /// <param name="contents">The contents of the page</param>
        /// <param name="indexText">Navigation choice to get back to the index</param>
        /// <param name="backToLevelTwoText">Navigation choice to get back to level two</param>
        /// <param name="previousPageText">Navigation choice to get to the previous page</param>
        /// <param name="nextPageText">Navigation choice to get to the next page</param>
        record ThirdLevelTextGrimoirePageDescriptor(
            string style,
            string icon,
            string title,
            string description,
            string contents,
            string? indexText,
            string? backToLevelTwoText,
            string? previousPageText,
            string? nextPageText
        ) : BaseNavigationDescriptor(indexText, backToLevelTwoText, previousPageText, nextPageText, null);
    }
}