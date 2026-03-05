using Selania.Rework.Components.Grimoire;
using UnityEngine;

namespace Selania.Rework.Components.Museum.GrimoireDisplay
{
    public class GrimoireDisplayMuseumSectionController : MonoBehaviour, IAutomaticEditorInject
    {
        [SerializeField] private GrimoireBackground grimoireBackground = null!;

        public void ShowGrimoire()
        {
            grimoireBackground.ShowGrimoire();
        }

        public void HideGrimoire()
        {
            grimoireBackground.HideGrimoire();
        }

        public void DisableAllLeftButtons()
        {
            grimoireBackground.DisableAllLeftButtons();
        }

        public void TunOnSomeLeftButtons()
        {
            grimoireBackground.DisableAllLeftButtons();
            grimoireBackground.EnableLeftButton("FirstCharacter", true);
            grimoireBackground.EnableLeftButton("Franco", true);
            grimoireBackground.EnableLeftButton("Greenhouse", true);
            grimoireBackground.EnableLeftButton("Rules", true);
            grimoireBackground.EnableLeftButton("Lore", true);
            grimoireBackground.EnableLeftButton("Settings", true);
        }

        public void SetGamerMode()
        {
            grimoireBackground.SetGamerMode(true);
        }

        public void UnsetGamerMode()
        {
            grimoireBackground.SetGamerMode(false);
        }

        public void SetSomeAchievements()
        {
            grimoireBackground.SetAchievementStatus("FirstAchievement", 0, 5);
            grimoireBackground.SetAchievementStatus("SecondAchievement", 3, 5);
            grimoireBackground.SetAchievementStatus("ThirdAchievement", 5, 5);
        }
    }
}