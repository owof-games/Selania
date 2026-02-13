using Selania.Rework.Components.DialogueBox;
using UnityEngine;

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

        public void AddLineOfTextNoSpeaker()
        {
            var text = AvailableTextLines[Random.Range(0, AvailableTextLines.Length)];
            dialogueBox.AddTextLine(null, text);
        }

        public void AddLineOfTextSpeakerPg()
        {
            var text = AvailableTextLines[Random.Range(0, AvailableTextLines.Length)];
            dialogueBox.AddTextLine("PG", text);
        }

        public void AddLineOfTextSpeakerChitarra()
        {
            var text = AvailableTextLines[Random.Range(0, AvailableTextLines.Length)];
            dialogueBox.AddTextLine("Chitarra", text);
        }

        public void AddDialogueChoices()
        {
            dialogueBox.AddChoices(new DialogueChoices.Choice[]
            {
                new(1, "Prima scelta, anche se il testo è tecnicamente troppo lungo per starci."),
                new(2, "Seconda scelta."),
                new(3, "Terza scelta, anche se il testo è tecnicamente troppo lungo per starci.")
            });
        }
    }
}