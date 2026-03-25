using R3;
using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;

namespace Selania.Rework.Components.Grimoire
{
    public class Grimoire : MonoBehaviour, IAutomaticEditorInject
    {
        [SerializeField] private GrimoireBackground grimoireBackground = null!;
        [SerializeField] private OpenGrimoireButton openGrimoireButton = null!;
        [Inject] internal IStoryChoicesSelector StoryChoicesSelector = null!;
        [Inject] internal IStoryGrimoire StoryGrimoire = null!;

        private void Start()
        {
            // story events
            StoryGrimoire.firstLevelGrimoirePageDescriptors.Subscribe(OnFirstLevelGrimoirePageDescriptors).AddTo(this);
            StoryGrimoire.secondLevelGreenhouseGrimoirePageDescriptors
                .Subscribe(OnSecondLevelGreenhouseGrimoirePageDescriptors).AddTo(this);
            StoryGrimoire.secondLevelSigilsGrimoirePageDescriptors.Subscribe(OnSecondLevelSigilsGrimoirePageDescriptors)
                .AddTo(this);
            StoryGrimoire.thirdLevelSigilsGrimoirePageDescriptors.Subscribe(OnThirdLevelSigilsGrimoirePageDescriptors)
                .AddTo(this);
            // grimoire events
            grimoireBackground.indexChoiceObservable.Subscribe(PickChoice).AddTo(this);
            grimoireBackground.backToLevelTwoObservable.Subscribe(PickChoice).AddTo(this);
            grimoireBackground.previousPageObservable.Subscribe(PickChoice).AddTo(this);
            grimoireBackground.nextPageObservable.Subscribe(PickChoice).AddTo(this);
            grimoireBackground.firstLevelButtonClick.Subscribe(PickChoice).AddTo(this);
            grimoireBackground.secondLevelSigilsButtonClick.Subscribe(PickSigilChoice).AddTo(this);
        }

        private void PickChoice(string firstLevelButtonName)
        {
            StoryChoicesSelector.PickChoiceWithText(firstLevelButtonName);
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

        /// <summary>
        /// Set up the bookmark navigation from a descriptor.
        /// </summary>
        /// <param name="descriptor">The navigation descriptor.</param>
        private void SetUpNavigation(IStoryGrimoire.BaseNavigationDescriptor descriptor)
        {
            grimoireBackground.ShowBookmarks(descriptor.indexText, descriptor.backToLevelTwoText,
                descriptor.previousPageText, descriptor.nextPageText);
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