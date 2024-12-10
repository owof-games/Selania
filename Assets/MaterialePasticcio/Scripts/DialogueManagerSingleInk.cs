using Ink.Runtime;
using UnityEngine;
using TMPro;

public class DialogueManagerSingleInk : MonoBehaviour
{
    //Field è la variabile all'interno di una classe
    [SerializeField] private TextAsset inkAssetJSON;
    [SerializeField] private GameObject[] entities;

    //Queste sono modifiche fatte dopo il lavoro con Mattia.
    [SerializeField] private GameObject dialoguePanel;
    [SerializeField] private TextMeshProUGUI dialogueText;
    private Story story;


    void Start()
    {
        story = new Story(inkAssetJSON.text);
        ContinueStory();
        //Queste sono modifiche fatte dopo il lavoro con Mattia. L'idea è di iniziare settando comunque come attivo il panel di dialogo per testare i testi, poi si procederà con il disattivarlo quando necessario.
        dialoguePanel.SetActive(false);
    }

    void Update()
    {
    }

    void ContinueStory()
    {
        //se la storia può continuare, falla continuare.
        //esamina la riga corrente.
        //se è un interact, dobbiamo fare qualcosa di speciale.
        if (story.canContinue)
        {
            //Vado alla prossima riga di testo
            //Creo una variabile string a cui assegno il valore della riga corrente di ink
            //Devo leggere il codice qui sotto al contrario: prima chiamo story.Continue() che mi dà il contenuto, poi lo assegno alla variabile.
            string currentLine = story.Continue().Trim();

            if (currentLine == "@interact")
            {
                //Interact è la nostra prima eccezione. Se ho un interact, vuol dire che sono nell'hub principale, e qui troverò la lista di tutte le entità interagibili nel gioco.
                //Quello che devo capire ora è quali siano attive e quali no, per cui il tunnel, che porta allo stitch dell'oggetto, avrà la sue condizioni per apparire o meno (es: se siamo nello stesso luogo).
                //Tutto quello che mi serve ora è di verificare che ogni singola scelta (perché nella struttura creata il nostro tunnel ci porta sempre a una scelta, es + [mentore]) sia o meno attiva (come in Loop: + {are_two_entities_together(Elia, Ettore) && peopleTalking==false} [character:Elia] -> elia_acting ->).
                //E se è attiva, trasformare un valore booleano da falso a vero.
                //Per fare tutta questa cosa, utilizziamo una versione semplificata del for. Funziona per array, liste.

                //Entity è una variabile locale creata per questo foreach, che viene associata a tutti i GameObject "entities" che abbiamo caricato su Unity.
                foreach (var entity in entities)
                {
                    bool found = false;

                    //Choice è una variabile locale creata per questo foreach, a cui viene associata una choice in INK (story.currentChoices, dove "story" è il nome che abbiamo dato noi alla nostra storia, e currentChoices è una delle funzione di INK)
                    foreach (var choice in story.currentChoices)
                    {
                        //Qui abbiamo recuperato il testo della scelta e l'abbiamo assegnato a una variabile
                        var choiceText = choice.text.Trim();
                        //Qui abbiamo recuperato il nome del nostro game object e l'abbiamo assegnato a una variabile
                        var entityName = entity.name;
                        //Qui verifichiamo se le due cose sono uguali o no
                        if (entityName == choiceText)
                        {
                            found = true;
                        }
                    }

                    //Invece di fare check if/else, dato che valore found true/false sempre, chiamo direttamente SetActive(found);
                    entity.SetActive(found);
                    
                    //Ci sono altre cose che dobbiamo fare con i contenuti di @interact?
                    //Plausibilmente non in questa funzione: sicuramente gli oggetti in scena poi ci passeranno dei testi quando interagiremo con loro, ma per questo aspetto conviene fare una funzione sperata, perché è una cosa diversa.

                }
            }
            //Qui posso inserire ulteriori eccezioni (es: @move, se dovessi farne uso?)
            

            //Se invece la storia può continuare (story.canContinue == true) ma non ci sono eccezioni, cosa voglio che accada?
            //Che all'interazione con un oggetto, parta il corrispettivo dialogo.
            //Forse un primo step può essere solo che se clicco un oggetto si apre il box di dialogo.
            //E che poi venga stampata una frase (senza fare un distinguo tra chi dice cosa, che potrei fare poi).
            //E per far questa cosa, devo associare il testo di ink al box di testo di Unity (cosa più easy).

            //Da qui in sotto son tutti tentativi di far partire il dialogo, tentativi che NON VANNO, sob
            else
            {
                //Attiviamo il panel di dialogo
                dialoguePanel.SetActive(true);
                //Associamo al testo di Unity il testo di INK.
                dialogueText.text = story.Continue();
            }

        }
    }

    void OnClick()
    {
        if(Input.GetKey(KeyCode.Mouse0))
        {
            //Attiviamo il panel di dialogo
                dialoguePanel.SetActive(true);
                //Associamo al testo di Unity il testo di INK.
                dialogueText.text = story.Continue();
        } 
        
    }
}
