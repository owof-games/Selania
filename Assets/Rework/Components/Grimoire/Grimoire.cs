using System;
using System.Linq;
using Microsoft.Extensions.Logging;
using R3;
using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.Grimoire
{
    public class Grimoire : MonoBehaviour, IAutomaticEditorInject
    {
        [SerializeField] private GrimoireBackground grimoireBackground = null!;
        [SerializeField] private OpenGrimoireButton openGrimoireButton = null!;
        [Inject] internal ILogger<Grimoire> Logger = null!;
        [Inject] internal IStoryChoicesSelector StoryChoicesSelector = null!;
        [Inject] internal IStoryGrimoire StoryGrimoire = null!;

        private void Start()
        {
            // story events
            StoryGrimoire.close.Subscribe(OnClose).AddTo(this);
            StoryGrimoire.firstLevelGrimoirePageDescriptors.Subscribe(OnFirstLevelGrimoirePageDescriptors).AddTo(this);
            StoryGrimoire.secondLevelGreenhouseGrimoirePageDescriptors
                .Subscribe(OnSecondLevelGreenhouseGrimoirePageDescriptors).AddTo(this);
            StoryGrimoire.secondLevelSigilsGrimoirePageDescriptors.Subscribe(OnSecondLevelSigilsGrimoirePageDescriptors)
                .AddTo(this);
            StoryGrimoire.secondLevelCharacterPageDescriptors.Subscribe(OnSecondLevelCharacterGrimoirePageDescriptors)
                .AddTo(this);
            StoryGrimoire.thirdLevelSigilsGrimoirePageDescriptors.Subscribe(OnThirdLevelSigilsGrimoirePageDescriptors)
                .AddTo(this);
            StoryGrimoire.thirdLevelGreenhouseGrimoirePageDescriptors
                .Subscribe(OnThirdLevelGreenhouseGrimoirePageDescriptors)
                .AddTo(this);
            // grimoire events: navigation
            grimoireBackground.indexChoiceObservable.Subscribe(PickChoice).AddTo(this);
            grimoireBackground.backToLevelTwoObservable.Subscribe(PickChoice).AddTo(this);
            grimoireBackground.previousPageObservable.Subscribe(PickChoice).AddTo(this);
            grimoireBackground.nextPageObservable.Subscribe(PickChoice).AddTo(this);
            grimoireBackground.closeObservable.Subscribe(PickChoice).AddTo(this);
            // grimoire events: specific page buttons
            grimoireBackground.firstLevelButtonClick.Subscribe(PickChoice).AddTo(this);
            grimoireBackground.secondLevelSigilsButtonClick.Subscribe(PickSigilChoice).AddTo(this);
            grimoireBackground.thirdLevelSigilsButtonClick.Subscribe(PickChoice).AddTo(this);
            grimoireBackground.secondLevelGreenhouseButtonClick.Subscribe(PickChoice).AddTo(this);
            grimoireBackground.thirdLevelGreenhouseButtonClickOnLeft
                .Select((isLeft, i) => (isLeft, i))
                .CombineLatest(
                    StoryGrimoire.thirdLevelGreenhouseGrimoirePageDescriptors,
                    (x, descriptor) =>
                        x.isLeft ? (x.i, descriptor.leftPage.inkChoice) : (x.i, descriptor.rightPage.inkChoice))
                .DistinctUntilChangedBy(x => x.i)
                .Select(x => x.inkChoice)
                .WhereNotNull()
                .Subscribe(PickChoice)
                .AddTo(this);
        }

        private void PickChoice(string buttonName)
        {
            Logger.ZLogInformation($"Picking grimoire choice: {buttonName}");
            StoryChoicesSelector.PickChoiceWithText(buttonName);
        }

        private void OnClose(Unit _)
        {
            grimoireBackground.HideGrimoire();
        }

        private void OnFirstLevelGrimoirePageDescriptors(IStoryGrimoire.FirstLevelGrimoirePageDescriptor descriptor)
        {
            // show the grimoire (first level)
            grimoireBackground.ShowGrimoire();
            grimoireBackground.SwitchToPage(GrimoireBackground.PageType.FirstLevel);

            // set up the grimoire to show the info described in descriptor
            grimoireBackground.SetGamerMode(descriptor.isGamerMode);
            grimoireBackground.DisableAllLeftButtons();
            foreach (var leftButton in descriptor.enabledLeftButtonNames)
                grimoireBackground.EnableLeftButton(leftButton, true);

            foreach (var achievement in descriptor.achievements)
                grimoireBackground.SetAchievementStatus(achievement.achievementName, achievement.amount,
                    achievement.max);

            grimoireBackground.SetFrancoMission(descriptor.francoMission);

            if (descriptor.sigilDescriptor == null)
                grimoireBackground.HideSigil();
            else
                grimoireBackground.ShowSigil(descriptor.sigilDescriptor.firstPositionGlyph,
                    descriptor.sigilDescriptor.secondPositionGlyph, descriptor.sigilDescriptor.thirdPositionGlyph,
                    descriptor.sigilDescriptor.text);

            // set up navigation
            SetUpNavigation(descriptor);
        }

        private void OnSecondLevelGreenhouseGrimoirePageDescriptors(
            IStoryGrimoire.SecondLevelGreenhouseGrimoirePageDescriptor descriptor)
        {
            // show the grimoire (second level greenhouse)
            grimoireBackground.ShowGrimoire();
            grimoireBackground.SwitchToPage(GrimoireBackground.PageType.SecondLevelGreenhouse);

            // set up the grimoire to show the info described in descriptor
            grimoireBackground.DisableAllGreenhouseButtons();
            foreach (var buttonDescriptor in descriptor.greenhouseButtonPlantDescriptors)
            {
                grimoireBackground.SetGreenhouseButtonStatus(buttonDescriptor.name,
                    buttonDescriptor.owned
                        ? GrimoireBackground.GreenhouseButtonStatus.Shown
                        : GrimoireBackground.GreenhouseButtonStatus.Exhausted);
            }

            // set up navigation
            SetUpNavigation(descriptor);
        }

        private void OnSecondLevelSigilsGrimoirePageDescriptors(
            IStoryGrimoire.SecondLevelSigilsGrimoirePageDescriptor descriptor)
        {
            // show the grimoire (second level sigils)
            grimoireBackground.ShowGrimoire();
            grimoireBackground.SwitchToPage(GrimoireBackground.PageType.SecondLevelSigils);

            // set up the grimoire to show the info described in descriptor
            grimoireBackground.DisableAllSigilsButtons();
            foreach (var buttonDescriptor in descriptor.sigilsGroupDescriptors)
                grimoireBackground.SetSecondLevelSigilButtonStatus(buttonDescriptor.glyph1, buttonDescriptor.glyph2,
                    buttonDescriptor.enabled
                        ? GrimoireBackground.SecondLevelSigilButtonStatus.Enabled
                        : GrimoireBackground.SecondLevelSigilButtonStatus.Shown);

            // set up navigation
            SetUpNavigation(descriptor);
        }

        private void OnSecondLevelCharacterGrimoirePageDescriptors(
            IStoryGrimoire.SecondLevelCharacterPageDescriptor descriptor)
        {
            // show the grimoire (second level character)
            grimoireBackground.ShowGrimoire();
            grimoireBackground.SwitchToPage(GrimoireBackground.PageType.SecondLevelCharacters);

            // set up the grimoire to show the info described in descriptor
            grimoireBackground.SetUpSecondLevelCharacterPage(descriptor.name, descriptor.description, descriptor.tasks,
                descriptor.inkName, descriptor.choices.ToList());

            // set up the pentacle too
            grimoireBackground.SetUpPentacleValues(
                descriptor.pentacleDescriptor.aetherValue1, descriptor.pentacleDescriptor.aetherValue2,
                descriptor.pentacleDescriptor.airValue1, descriptor.pentacleDescriptor.airValue2,
                descriptor.pentacleDescriptor.fireValue1, descriptor.pentacleDescriptor.fireValue2,
                descriptor.pentacleDescriptor.earthValue1, descriptor.pentacleDescriptor.earthValue2,
                descriptor.pentacleDescriptor.waterValue1, descriptor.pentacleDescriptor.waterValue2);

            // set up navigation
            SetUpNavigation(descriptor);
        }

        private void PickSigilChoice((ISettingsSigils.GlyphType, ISettingsSigils.GlyphType) secondLevelSigil)
        {
            StoryChoicesSelector.PickChoiceWithText($"{secondLevelSigil.Item1}{secondLevelSigil.Item2}");
        }

        private void OnThirdLevelSigilsGrimoirePageDescriptors(
            IStoryGrimoire.ThirdLevelSigilsGrimoirePageDescriptor descriptor)
        {
            // show the grimoire (third level sigils)
            grimoireBackground.ShowGrimoire();
            grimoireBackground.SwitchToPage(GrimoireBackground.PageType.ThirdLevelSigils);

            // set up the grimoire header to show the info in the descriptor
            grimoireBackground.SetUpThirdLevelSigilsHeader(
                descriptor.leftSideHeader.isLocked ? "" : descriptor.leftSideHeader.title,
                descriptor.leftSideHeader.isLocked ? "" : descriptor.leftSideHeader.description,
                descriptor.leftSideHeader.isLocked
                    ? null
                    : (descriptor.leftSideHeader.glyph1, descriptor.leftSideHeader.glyph2),
                descriptor.rightSideHeader.isLocked ? "" : descriptor.rightSideHeader.title,
                descriptor.rightSideHeader.isLocked ? "" : descriptor.rightSideHeader.description,
                descriptor.rightSideHeader.isLocked
                    ? null
                    : (descriptor.rightSideHeader.glyph1, descriptor.rightSideHeader.glyph2)
            );

            // set up the grimoire body to show the info in the descriptor
            grimoireBackground.DisableAllThirdLevelSigilsRows();
            var sigilDescriptors = new[]
            {
                descriptor.leftSide1, descriptor.leftSide2, descriptor.leftSide3, descriptor.rightSide1,
                descriptor.rightSide2, descriptor.rightSide3
            };
            var referenceHeaders = new[]
            {
                descriptor.leftSideHeader,
                descriptor.leftSideHeader,
                descriptor.leftSideHeader,
                descriptor.rightSideHeader,
                descriptor.rightSideHeader,
                descriptor.rightSideHeader
            };
            for (var i = 0; i < sigilDescriptors.Length; i++)
            {
                var sigilDescriptor = sigilDescriptors[i];
                var referenceHeader = referenceHeaders[i];
                if (sigilDescriptor.isLocked) continue;
                grimoireBackground.SetUpThirdLevelSigilRow(
                    i,
                    sigilDescriptor.name,
                    sigilDescriptor.firstLine,
                    sigilDescriptor.secondLine,
                    sigilDescriptor.thirdLine,
                    (referenceHeader.glyph1, referenceHeader.glyph2, sigilDescriptor.glyph3),
                    sigilDescriptor.status
                );
            }

            // set up navigation
            SetUpNavigation(descriptor);
        }

        private void OnThirdLevelGreenhouseGrimoirePageDescriptors(
            IStoryGrimoire.ThirdLevelGreenhouseGrimoirePageDescriptor descriptor)
        {
            // show the grimoire (third level greenhouse)
            grimoireBackground.ShowGrimoire();
            grimoireBackground.SwitchToPage(GrimoireBackground.PageType.ThirdLevelGreenhouse);

            // set up the grimoire header to show the info in the descriptor
            for (var i = 0; i < 2; i++)
            {
                var isLeft = i == 0;
                var pageDescriptor = isLeft ? descriptor.leftPage : descriptor.rightPage;
                switch (pageDescriptor.status)
                {
                    case IStoryGrimoire.ThirdLevelGreenhouseStatus.Hidden:
                        grimoireBackground.ThirdLevelGreenhouseHidePage(isLeft);
                        break;
                    case IStoryGrimoire.ThirdLevelGreenhouseStatus.Locked:
                        grimoireBackground.ThirdLevelGreenhouseDisablePage(isLeft);
                        break;
                    case IStoryGrimoire.ThirdLevelGreenhouseStatus.Consumed:
                    case IStoryGrimoire.ThirdLevelGreenhouseStatus.Owned:
                    case IStoryGrimoire.ThirdLevelGreenhouseStatus.Active:
                    {
                        var text = string.Join("\n",
                            pageDescriptor.pageContents.Select(c =>
                                c.IsSubtitle ? $"<b><i>{c.Text}</i></b>" : c.Text));
                        grimoireBackground.ThirdLevelGreenhouseFillPage(isLeft,
                            pageDescriptor.title,
                            pageDescriptor.status == IStoryGrimoire.ThirdLevelGreenhouseStatus.Owned,
                            pageDescriptor.status switch
                            {
                                IStoryGrimoire.ThirdLevelGreenhouseStatus.Active => ThirdLevelGreenhouseButton.Status
                                    .Active,
                                IStoryGrimoire.ThirdLevelGreenhouseStatus.Owned => ThirdLevelGreenhouseButton.Status
                                    .Owned,
                                _ => ThirdLevelGreenhouseButton.Status.Consumed
                            },
                            pageDescriptor.plantName, text);
                        break;
                    }
                    default:
                        throw new ArgumentOutOfRangeException(nameof(pageDescriptor.status), pageDescriptor.status,
                            $"Unknown third level greenhouse page status {pageDescriptor.status}");
                }
            }

            // set up navigation
            SetUpNavigation(descriptor);
        }

        /// <summary>
        /// Set up the bookmark navigation from a descriptor.
        /// </summary>
        /// <param name="descriptor">The navigation descriptor.</param>
        private void SetUpNavigation(IStoryGrimoire.BaseNavigationDescriptor descriptor)
        {
            grimoireBackground.ShowBookmarks(descriptor.indexText, descriptor.backToLevelTwoText,
                descriptor.previousPageText, descriptor.nextPageText, descriptor.closeChoiceText);
        }

        /// <summary>
        ///     Callback method invoked when the grimoire has requested to close.
        /// </summary>
        public void OnGrimoireCloseButtonClick()
        {
            openGrimoireButton.OnGrimoireCloseButtonClick();
            grimoireBackground.HideGrimoire();
            StoryGrimoire.SwitchFromGrimoire();
        }
    }
}