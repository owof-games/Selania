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
            // grimoire events
            grimoireBackground.IndexChoiceObservable.Subscribe(PickChoice).AddTo(this);
            grimoireBackground.firstLevelButtonClick.Subscribe(PickChoice).AddTo(this);
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