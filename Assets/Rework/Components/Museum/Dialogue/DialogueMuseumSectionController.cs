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

        public void AddLineOfText()
        {
            var text = AvailableTextLines[Random.Range(0, AvailableTextLines.Length)];
            dialogueBox.AddTextLine(text);
        }
    }
}