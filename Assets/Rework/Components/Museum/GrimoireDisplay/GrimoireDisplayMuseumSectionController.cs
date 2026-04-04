using System;
using Microsoft.Extensions.Logging;
using R3;
using Selania.Rework.Components.Grimoire;
using Selania.Rework.Interfaces;
using TMPro;
using UnityEngine;
using VContainer;
using ZLogger;
using Random = UnityEngine.Random;

namespace Selania.Rework.Components.Museum.GrimoireDisplay
{
    public class GrimoireDisplayMuseumSectionController : MonoBehaviour, IAutomaticEditorInject
    {
        [SerializeField] private GrimoireBackground grimoireBackground = null!;

        [SerializeField] private TextMeshProUGUI output = null!;

        [Inject] internal ILogger<GrimoireDisplayMuseumSectionController> Logger = null!;

        private void Start()
        {
            grimoireBackground.firstLevelButtonClick
                .Subscribe(buttonName => AppendText($"Clicked on first level button '{buttonName}'")).AddTo(this);
            grimoireBackground.secondLevelGreenhouseButtonClick
                .Subscribe(buttonName => AppendText($"Clicked on second level greenhouse button '{buttonName}'"))
                .AddTo(this);
        }

        private void AppendText(string s)
        {
            if (output.text.Length == 0)
            {
                output.text = s;
            }
            else
            {
                output.text += '\n';
                output.text += s;
            }
        }

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
            grimoireBackground.ShowBookmarks(null, null, null, null);
        }

        public void ShowSecondLevelBookmarks()
        {
            grimoireBackground.ShowBookmarks("index", null, null, null);
        }

        public void ShowThirdLevelBookmarks()
        {
            grimoireBackground.ShowBookmarks("index", "Riccio", "Chitarra", "Birra");
        }

        public void ShowRewritingBookmarks()
        {
            grimoireBackground.ShowBookmarks("index", "Piante", "Olobino", "???");
        }

        public void SwitchToFirstLevelPage()
        {
            grimoireBackground.SwitchToPage(GrimoireBackground.PageType.FirstLevel);
        }

        public void SwitchToSecondLevelGreenhousePage()
        {
            grimoireBackground.SwitchToPage(GrimoireBackground.PageType.SecondLevelGreenhouse);
        }

        public void SwitchToSecondLevelSigilsPage()
        {
            grimoireBackground.SwitchToPage(GrimoireBackground.PageType.SecondLevelSigils);
        }

        public void SwitchToThirdLevelSigilsPage()
        {
            grimoireBackground.SwitchToPage(GrimoireBackground.PageType.ThirdLevelSigils);
        }

        public void SwitchToThirdLevelGreenhousePage()
        {
            grimoireBackground.SwitchToPage(GrimoireBackground.PageType.ThirdLevelGreenhouse);
        }

        public void RandomizeGreenhouseButtons()
        {
            var buttonNames = new[]
            {
                "BaccaDellaAddolorata", "BarbaDellInciampo", "BastoneDellOzioso", "BrinaDellImpossibile",
                "CantoDelleCompagne", "CardoAspinato", "EderaDelleAmanti", "ErbaLiccia", "FalsaPalude", "LanaNotturna",
                "LicheneDegliAbissi", "NonTiScordarDiTe", "Olobino", "LaSpazzata"
            };
            var statuses =
                (GrimoireBackground.GreenhouseButtonStatus[])Enum.GetValues(
                    typeof(GrimoireBackground.GreenhouseButtonStatus));
            foreach (var button in buttonNames)
            {
                var status = statuses[Random.Range(0, statuses.Length)];
                grimoireBackground.SetGreenhouseButtonStatus(button, status);
            }
        }

        public void RandomizeSigilButtons()
        {
            var glyphTypes = (ISettingsSigils.GlyphType[])Enum.GetValues(typeof(ISettingsSigils.GlyphType));
            foreach (var glyphType1 in glyphTypes)
            foreach (var glyphType2 in glyphTypes)
            {
                if (glyphType1 == glyphType2) continue;
                grimoireBackground.SetSecondLevelSigilButtonStatus(glyphType1, glyphType2,
                    Random.value < 0.5
                        ? GrimoireBackground.SecondLevelSigilButtonStatus.Locked
                        : GrimoireBackground.SecondLevelSigilButtonStatus.Shown);
            }

            for (;;)
            {
                var glyphType1 = glyphTypes[Random.Range(0, glyphTypes.Length)];
                var glyphType2 = glyphTypes[Random.Range(0, glyphTypes.Length)];
                if (glyphType1 == glyphType2) continue;
                grimoireBackground.SetSecondLevelSigilButtonStatus(glyphType1, glyphType2,
                    GrimoireBackground.SecondLevelSigilButtonStatus.Enabled);
                break;
            }
        }

        public void ThirdLevelSigilsHeadersLocked()
        {
            grimoireBackground.SetUpThirdLevelSigilsHeader("", "", null, "", "", null);
        }

        public void ThirdLevelSigilsHeadersOnlyTitle()
        {
            grimoireBackground.SetUpThirdLevelSigilsHeader("Pontile", "",
                (ISettingsSigils.GlyphType.Air, ISettingsSigils.GlyphType.Aether), "Altro", "",
                (ISettingsSigils.GlyphType.Air, ISettingsSigils.GlyphType.Fire));
        }

        public void ThirdLevelSigilsHeadersFull()
        {
            grimoireBackground.SetUpThirdLevelSigilsHeader("Pontile", "per tuffarsi nel mare di sé",
                (ISettingsSigils.GlyphType.Air, ISettingsSigils.GlyphType.Aether), "Altro", "altro sottotitolo.",
                (ISettingsSigils.GlyphType.Air, ISettingsSigils.GlyphType.Fire));
        }

        public void ThirdLevelSigilsAllLocked()
        {
            grimoireBackground.DisableAllThirdLevelSigilsRows();
        }

        public void ThirdLevelSigilsRandomized()
        {
            grimoireBackground.DisableAllThirdLevelSigilsRows();
            var activated = Random.Range(0, 6);
            Logger.ZLogInformation($"Activated: {activated}");
            for (var i = 0; i < 6; i++)
            {
                var level = Random.Range(0, 5);
                if (level == 0) continue;
                var status = i == activated ? IStoryGrimoire.ThirdLevelSigilStatus.Selected :
                    Random.Range(0f, 1f) < 0.5f ? IStoryGrimoire.ThirdLevelSigilStatus.Default :
                    IStoryGrimoire.ThirdLevelSigilStatus.Consumed;
                Logger.ZLogInformation($"sigil {i}: level {level}, status {status}");
                grimoireBackground.SetUpThirdLevelSigilRow(i,
                    "Strappo",
                    level > 1 ? "qualcosa" : "",
                    level > 2 ? "altra riga" : "",
                    level > 3 ? "ultima riga" : "",
                    (ISettingsSigils.GlyphType.Air,
                        i < 3 ? ISettingsSigils.GlyphType.Aether : ISettingsSigils.GlyphType.Fire,
                        i switch
                        {
                            0 => ISettingsSigils.GlyphType.Fire,
                            1 => ISettingsSigils.GlyphType.Earth,
                            2 => ISettingsSigils.GlyphType.Water,
                            3 => ISettingsSigils.GlyphType.Earth,
                            4 => ISettingsSigils.GlyphType.Water,
                            5 => ISettingsSigils.GlyphType.Aether,
                            _ => throw new ArgumentOutOfRangeException()
                        }
                    ),
                    status
                );
            }
        }

        public void ThirdLevelGreenhouseFirstSet()
        {
            grimoireBackground.ThirdLevelGreenhouseDisablePage(true);
            grimoireBackground.ThirdLevelGreenhouseHidePage(false);
        }

        public void ThirdLevelGreenhouseSecondSet()
        {
            grimoireBackground.ThirdLevelGreenhouseFillPage(true, "Left", true,
                ThirdLevelGreenhouseButton.Status.Active, "BaccaDellaAddolorata", "descrizione bacca");
            grimoireBackground.ThirdLevelGreenhouseFillPage(false, "Right", false,
                ThirdLevelGreenhouseButton.Status.Consumed, "BarbaDellInciampo", "descrizione bacca");
        }

        public void ThirdLevelGreenhouseThirdSet()
        {
            grimoireBackground.ThirdLevelGreenhouseFillPage(true, "Left", true,
                ThirdLevelGreenhouseButton.Status.Owned, "BastoneDellOzioso", "descrizione bacca");
            grimoireBackground.ThirdLevelGreenhouseHidePage(false);
        }
    }
}