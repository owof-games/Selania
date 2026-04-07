using System;
using Selania.Rework.Components.DialogueBox;
using TMPro;
using UnityEngine;
using Random = UnityEngine.Random;

namespace Selania.Rework.Components.Museum.Dialogue
{
    public class DialogueMuseumSectionController : MonoBehaviour
    {
        private static readonly string[] AvailableTextLines =
        {
            "A casa ho una vecchia enciclopedia, era del papà, che è piena di disegni e cose sugli animali.",
            "Ora sono meno timida, più in carne, e molto meno secchiona.",
            "Talco dice sempre che bisogna sporcarsi le mani per capire il mondo.",
            "La gente sottovaluta il lavoro dellə camerierə. E per questo veniamo trattat3 come dell3 serv3. In quel caso sputare nei piatti è un dovere politico."
        };

        [SerializeField] private DialogueBox.DialogueBox dialogueBox = null!;

        [SerializeField] private TextMeshProUGUI choiceSelections = null!;

        [SerializeField] private SelaniaSettings settings = null!;

        public void AddLineOfTextNoSpeaker()
        {
            var text = AvailableTextLines[Random.Range(0, AvailableTextLines.Length)];
            dialogueBox.AddTextLine(null, "chitarra_affectionate", text);
        }

        public void AddLineOfTextSpeakerPg()
        {
            var text = AvailableTextLines[Random.Range(0, AvailableTextLines.Length)];
            dialogueBox.AddTextLine("PG", "chitarra_affectionate", text);
        }

        public void AddLineOfTextSpeakerChitarra()
        {
            var text = AvailableTextLines[Random.Range(0, AvailableTextLines.Length)];
            dialogueBox.AddTextLine("Chitarra", "chitarra_affectionate", text);
        }

        public void AddDialogueChoices()
        {
            dialogueBox.AddChoices(new DialogueChoices.Choice[]
            {
                new(1, "Prima scelta, anche se il testo è tecnicamente troppo lungo per starci."),
                new(2, "Seconda scelta."),
                new(3, "Terza scelta, anche se il testo è tecnicamente troppo lungo per starci.")
            }, index => choiceSelections.text = $"{choiceSelections.text}\nSelected choice n. {index}.");
        }

        public void SetChitarraAffectionate()
        {
            dialogueBox.SetPortraitImage("chitarra_affectionate");
        }

        public void SetMentoreHurry()
        {
            dialogueBox.SetPortraitImage("mentore_hurry");
        }

        public void SetNoInk()
        {
            dialogueBox.SetInkStatus(0, 0);
        }

        public void SetFourFull()
        {
            dialogueBox.SetInkStatus(4, 0);
        }

        public void SetTwoFullOneEmpty()
        {
            dialogueBox.SetInkStatus(2, 1);
        }

        public void SetHeartInterval(int index)
        {
            var percentages = new[]
            {
                0,
                settings.percentageBetweenBadAndNormalRelationshipStatusBar,
                settings.percentageBetweenNormalAndGoodRelationshipStatusBar,
                settings.percentageBetweenBrokenAndNormalHeart,
                settings.percentageBetweenNormalAndGreatHeart,
                1
            };
            Array.Sort(percentages);
            var halfWayPercentage = (percentages[index] + percentages[index + 1]) / 2;
            dialogueBox.EnableRelationshipStatus();
            dialogueBox.SetRelationshipStatusLevel(halfWayPercentage);
        }

        public void DisableHeart()
        {
            dialogueBox.DisableRelationshipStatus();
        }
    }
}