using Ink.Runtime;
using UnityEngine;

public class DialogueManagerSingleInk : MonoBehaviour
{
    //Field è la variabile all'interno di una classe
    [SerializeField] private TextAsset inkAssetJSON;
    [SerializeField] private GameObject[] entities;
    private Story story;


    void Start()
    {
        story = new Story(inkAssetJSON.text);
        ContinueStory();
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
                //Questa è una versione semplificata del for. Funziona per array, liste
                foreach (var entity in entities)
                {
                    bool found = false;

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


                }
            }


        }
    }
}
