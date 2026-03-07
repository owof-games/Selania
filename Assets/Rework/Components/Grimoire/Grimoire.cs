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
        [Inject] internal IStoryGrimoire StoryGrimoire = null!;

        private void Start()
        {
            StoryGrimoire.firstLevelGrimoirePageDescriptors.Subscribe(OnFirstLevelGrimoirePageDescriptors).AddTo(this);
        }

        private void OnFirstLevelGrimoirePageDescriptors(IStoryGrimoire.FirstLevelGrimoirePageDescriptor descriptor)
        {
            // show the grimoire (first level)
            grimoireBackground.ShowGrimoire();

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