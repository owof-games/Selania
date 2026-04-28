using System;
using System.Collections.Generic;
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

        [SerializeField] private GrimoireDisplayMuseumSectionScope sectionScope = null!;

        [Inject] internal ILogger<GrimoireDisplayMuseumSectionController> Logger = null!;

        private void Start()
        {
            grimoireBackground.firstLevelButtonClick
                .Subscribe(buttonName => AppendText($"Clicked on first level button '{buttonName}'")).AddTo(this);
            grimoireBackground.secondLevelGreenhouseButtonClick
                .Subscribe(buttonName => AppendText($"Clicked on second level greenhouse button '{buttonName}'"))
                .AddTo(this);
            grimoireBackground.secondLevelCharactersButtonClick
                .Subscribe(buttonName => AppendText($"Clicked on second characters button '{buttonName}'"))
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
            sectionScope.gamerModeSubject.OnNext(true);
            grimoireBackground.SetGamerMode(true);
        }

        public void UnsetGamerMode()
        {
            sectionScope.gamerModeSubject.OnNext(false);
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
            grimoireBackground.ShowBookmarks(null, null, null, null, null);
        }

        public void ShowSecondLevelBookmarks()
        {
            grimoireBackground.ShowBookmarks("index", null, null, null, null);
        }

        public void ShowThirdLevelBookmarks()
        {
            grimoireBackground.ShowBookmarks("index", "Riccio", "Chitarra", "Birra", null);
        }

        public void ShowRewritingBookmarks()
        {
            grimoireBackground.ShowBookmarks("index", "Piante", "Olobino", "???", null);
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

        public void SwitchToSecondLevelCharactersPage()
        {
            grimoireBackground.SwitchToPage(GrimoireBackground.PageType.SecondLevelCharacters);
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

        public void SetSecondLevelChitarra()
        {
            grimoireBackground.SetUpSecondLevelCharacterPage("Chitarra", "Una ragazza in cerca della sua melodia",
                """
                Regalale qualcosa che le ricordi il nonno.
                In cucina aggiungi qualcosa che parli di riposo.
                Leggi una storia di ribellione.
                """,
                "FirstCharacter",
                new List<string> { "Conversation", "Present", "Kitchen" });
        }

        public void SetSecondLevelRiccio()
        {
            grimoireBackground.SetUpSecondLevelCharacterPage("Riccio", "Aculei per difendersi dal mondo",
                """
                Portagli qualcosa legato agli animali.
                Cucina con lui qualcosa di bizzarro.
                Leggi una storia sulla rabbia.
                """,
                "SecondCharacter",
                new List<string> { "Rewrite", "Letters" });
        }

        public void SetPentacleRandomly()
        {
            // create 5 couples of values, where only one has a changed value
            var values = new float[10];
            var changedIndex = Random.Range(0, 5);
            // Debug.Log($"Animating index {changedIndex}");
            for (var i = 0; i < 5; i++)
            {
                var startingValue = (float)Random.Range(-9, 10);
                var endingValue = startingValue;
                if (changedIndex == i)
                {
                    endingValue += Mathf.Sign(endingValue) * Random.Range(1, 3);
                }

                values[i * 2] = startingValue;
                values[i * 2 + 1] = endingValue;
            }

            grimoireBackground.SetUpPentacleValues(
                values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7], values[8],
                values[9]
            );
        }

        public void SwitchToThirdLevelCharacters()
        {
            grimoireBackground.SwitchToPage(GrimoireBackground.PageType.ThirdLevelCharacter);
        }

        public void SetSomeLongText()
        {
            grimoireBackground.SetThirdLevelTextGrimoireText(
                """
                FIRST WITCH 
                When shall we three meet again?
                In thunder, lightning, or in rain?
                SECOND WITCH 
                When the hurly-burly’s done,
                When the battle’s lost and won.
                THIRD WITCH 
                That will be ere the set of sun.
                FIRST WITCH 
                Where the place?
                SECOND WITCH  Upon the heath.
                THIRD WITCH 
                There to meet with Macbeth.
                FIRST WITCH  I come, Graymalkin.
                SECOND WITCH  Paddock calls.
                THIRD WITCH  Anon.
                ALL 
                Fair is foul, and foul is fair;
                Hover through the fog and filthy air.
                They exit.



                Scene 2
                Alarum within. Enter King Duncan, Malcolm,
                Donalbain, Lennox, with Attendants, meeting a bleeding
                Captain.

                DUNCAN 
                What bloody man is that? He can report,
                As seemeth by his plight, of the revolt
                The newest state.
                MALCOLM  This is the sergeant
                Who, like a good and hardy soldier, fought
                ’Gainst my captivity.—Hail, brave friend!
                Say to the King the knowledge of the broil
                As thou didst leave it.
                CAPTAIN  Doubtful it stood,
                As two spent swimmers that do cling together
                And choke their art. The merciless Macdonwald
                (Worthy to be a rebel, for to that
                The multiplying villainies of nature
                Do swarm upon him) from the Western Isles
                Of kerns and gallowglasses is supplied;
                And Fortune, on his damnèd quarrel smiling,
                Showed like a rebel’s whore. But all’s too weak;
                For brave Macbeth (well he deserves that name),
                Disdaining Fortune, with his brandished steel,
                Which smoked with bloody execution,
                Like Valor’s minion, carved out his passage
                Till he faced the slave;
                Which ne’er shook hands, nor bade farewell to him,
                Till he unseamed him from the nave to th’ chops,
                And fixed his head upon our battlements.
                DUNCAN 
                O valiant cousin, worthy gentleman!
                CAPTAIN 
                As whence the sun ’gins his reflection
                Shipwracking storms and direful thunders break,
                So from that spring whence comfort seemed to
                come
                Discomfort swells. Mark, King of Scotland, mark:
                No sooner justice had, with valor armed,
                Compelled these skipping kerns to trust their heels,
                But the Norweyan lord, surveying vantage,
                With furbished arms and new supplies of men,
                Began a fresh assault.
                DUNCAN 
                Dismayed not this our captains, Macbeth and
                Banquo?
                CAPTAIN 
                Yes, as sparrows eagles, or the hare the lion.
                If I say sooth, I must report they were
                As cannons overcharged with double cracks,
                So they doubly redoubled strokes upon the foe.
                Except they meant to bathe in reeking wounds
                Or memorize another Golgotha,
                I cannot tell—
                But I am faint. My gashes cry for help.
                DUNCAN 
                So well thy words become thee as thy wounds:
                They smack of honor both.—Go, get him surgeons.
                The Captain is led off by Attendants.

                Enter Ross and Angus.

                Who comes here?
                MALCOLM  The worthy Thane of Ross.
                LENNOX 
                What a haste looks through his eyes!
                So should he look that seems to speak things
                strange.
                ROSS  God save the King.
                DUNCAN  Whence cam’st thou, worthy thane?
                ROSS  From Fife, great king,
                Where the Norweyan banners flout the sky
                And fan our people cold.
                Norway himself, with terrible numbers,
                Assisted by that most disloyal traitor,
                The Thane of Cawdor, began a dismal conflict,
                Till that Bellona’s bridegroom, lapped in proof,
                Confronted him with self-comparisons,
                Point against point, rebellious arm ’gainst arm,
                Curbing his lavish spirit. And to conclude,
                The victory fell on us.
                DUNCAN  Great happiness!
                ROSS  That now Sweno,
                The Norways’ king, craves composition.
                Nor would we deign him burial of his men
                Till he disbursèd at Saint Colme’s Inch
                Ten thousand dollars to our general use.
                DUNCAN 
                No more that Thane of Cawdor shall deceive
                Our bosom interest. Go, pronounce his present
                death,
                And with his former title greet Macbeth.
                ROSS  I’ll see it done.
                DUNCAN 
                What he hath lost, noble Macbeth hath won.
                They exit.


                Scene 3
                Thunder. Enter the three Witches.

                FIRST WITCH  Where hast thou been, sister?
                SECOND WITCH  Killing swine.
                THIRD WITCH  Sister, where thou?
                FIRST WITCH 
                A sailor’s wife had chestnuts in her lap
                And munched and munched and munched. “Give
                me,” quoth I.
                “Aroint thee, witch,” the rump-fed runnion cries.
                Her husband’s to Aleppo gone, master o’ th’ Tiger;
                But in a sieve I’ll thither sail,
                And, like a rat without a tail,
                I’ll do, I’ll do, and I’ll do.
                SECOND WITCH 
                I’ll give thee a wind.
                FIRST WITCH 
                Th’ art kind.
                THIRD WITCH 
                And I another.
                FIRST WITCH 
                I myself have all the other,
                And the very ports they blow;
                All the quarters that they know
                I’ th’ shipman’s card.
                I’ll drain him dry as hay.
                Sleep shall neither night nor day
                Hang upon his penthouse lid.
                He shall live a man forbid.
                Weary sev’nnights, nine times nine,
                Shall he dwindle, peak, and pine.
                Though his bark cannot be lost,
                Yet it shall be tempest-tossed.
                Look what I have.
                SECOND WITCH  Show me, show me.
                FIRST WITCH 
                Here I have a pilot’s thumb,
                Wracked as homeward he did come.Drum within.
                THIRD WITCH 
                A drum, a drum!
                Macbeth doth come.
                ALL, dancing in a circle 
                The Weïrd Sisters, hand in hand,
                Posters of the sea and land,
                Thus do go about, about,
                Thrice to thine and thrice to mine 
                """
            );
        }

        public void ThirdLevelNextPageIfPossible()
        {
            grimoireBackground.ThirdLevelTextGrimoireNextPage();
        }

        public void ThirdLevelPreviousPageIfPossible()
        {
            grimoireBackground.ThirdLevelTextGrimoirePreviousPage();
        }

        public void SwitchToSecondLevelFranco()
        {
            grimoireBackground.SwitchToPage(GrimoireBackground.PageType.SecondLevelFranco);
        }

        public void SecondLevelFrancoGrimoireLockRecipe()
        {
            grimoireBackground.SecondLevelFrancoGrimoireLockRecipe();
        }

        public void SecondLevelFrancoGrimoireShowRecipe()
        {
            grimoireBackground.SecondLevelFrancoGrimoireShowRecipe("Titolo", "Descrizione", "Contenuti");
        }
    }
}