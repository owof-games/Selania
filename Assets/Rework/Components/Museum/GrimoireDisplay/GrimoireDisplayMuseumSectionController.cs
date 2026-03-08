using System;
using Selania.Rework.Components.Grimoire;
using Selania.Rework.Interfaces;
using UnityEngine;
using Random = UnityEngine.Random;

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

        public void SetSomeGamerModeAchievements()
        {
            grimoireBackground.SetAchievementStatus("FirstAchievement", Random.Range(0, 6), 5);
            grimoireBackground.SetAchievementStatus("SecondAchievement", Random.Range(0, 6), 5);
            grimoireBackground.SetAchievementStatus("ThirdAchievement", Random.Range(0, 6), 5);
        }

        public void SetSomeReaderModeAchievements()
        {
            grimoireBackground.SetAchievementStatus("FirstAchievementRM", Random.Range(0, 6), 5);
            grimoireBackground.SetAchievementStatus("SecondAchievementRM", Random.Range(0, 6), 5);
            grimoireBackground.SetAchievementStatus("ThirdAchievementRM", Random.Range(0, 6), 5);
        }

        public void EmptyFrancoMission()
        {
            grimoireBackground.SetFrancoMission("");
        }

        public void SetFrancoMission()
        {
            grimoireBackground.SetFrancoMission("Coltiva almeno tre piante nella serra.");
        }

        public void HideSigil()
        {
            grimoireBackground.HideSigil();
        }

        public void ShowRandomSigil()
        {
            var glyphs = (ISettingsSigils.GlyphType[])Enum.GetValues(typeof(ISettingsSigils.GlyphType));
            var texts = new[]
            {
                "Un uso rimasto",
                "Due usi rimasti",
                "Tre usi rimasti"
            };

            ISettingsSigils.GlyphType secondGlyph, thirdGlyph;
            var firstGlyph = glyphs[Random.Range(0, glyphs.Length)];

            do
            {
                secondGlyph = glyphs[Random.Range(0, glyphs.Length)];
            } while (secondGlyph == firstGlyph);

            do
            {
                thirdGlyph = glyphs[Random.Range(0, glyphs.Length)];
            } while (thirdGlyph == firstGlyph || thirdGlyph == secondGlyph);

            var text = texts[Random.Range(0, texts.Length)];

            grimoireBackground.ShowSigil(firstGlyph, secondGlyph, thirdGlyph, text);
        }

        public void ShowFirstLevelBookmarks()
        {
            grimoireBackground.ShowBookmarks(false, null, null, null);
        }

        public void ShowSecondLevelBookmarks()
        {
            grimoireBackground.ShowBookmarks(true, null, null, null);
        }

        public void ShowThirdLevelBookmarks()
        {
            grimoireBackground.ShowBookmarks(true, "Riccio", "Chitarra", "Birra");
        }

        public void ShowRewritingBookmarks()
        {
            grimoireBackground.ShowBookmarks(false, "Piante", "Olobino", "???");
        }
    }
}