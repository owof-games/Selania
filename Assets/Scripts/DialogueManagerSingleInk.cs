using Ink.Runtime;
using UnityEngine;
using TMPro;
using System.Collections.Generic;
using System.Collections;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using System.IO;
using Unity.VisualScripting;
// //using UnityEditor.Overlays;


public class DialogueManagerSingleInk : MonoBehaviour
{
    //Field è la variabile all'interno di una classe

    [Header("Dialogue UI")]
    [SerializeField] private GameObject dialoguePanel;
    [SerializeField] private TextMeshProUGUI dialogueText;


    [SerializeField] private GameObject continueButton;
    private Story story;



    [Header("Text elements")]
    [SerializeField] private TextAsset inkAssetJSON;
    [SerializeField] private GameObject[] entities;


    [Header("Choices UI")]
    [SerializeField] private GameObject[] choices;
    private TextMeshProUGUI[] choicesText;


    [Header("Background setting")]
    [SerializeField] private Image background;
    private const string BACKGROUND_TAG = "background";
    [Header("Garden Backgrounds")]
    [SerializeField] private Sprite backGiardino;
    [Header("Mausoleum Backgrounds")]
    [SerializeField] private Sprite backMausoleo;
    [Header("Greenhouse Backgrounds")]
    [SerializeField] private Sprite backFunghi;
    [Header("Pets Backgrounds")]
    [SerializeField] private Sprite backFalene;
    [Header("Labirint Backgrounds")]
    [SerializeField] private Sprite backLabirinto;
    [Header("Sirens Backgrounds")]
    [SerializeField] private Sprite backSirene;
    [Header("Library Backgrounds")]
    [SerializeField] private Sprite backBiblioteca;
    [Header("Tea Backgrounds")]
    [SerializeField] private Sprite backTisane;
    

    [Header("Sounds")]
    [SerializeField] private AudioSource ambientSounds;
    private const string AMBIENTSOUNDS_TAG = "ambientSounds";
    [Header("Garden Sounds")]
    [SerializeField] private AudioClip gardenSounds;
    [Header("Mausoleum Sounds")]
    [SerializeField] private AudioClip mausoleumSounds;
    [Header("Greenhouse Sounds")]
    [SerializeField] private AudioClip greenhouseSounds;





    void Start()
    {
        story = new Story(inkAssetJSON.text);
        ContinueStory();

        dialoguePanel.SetActive(false);

        //Elemento aggiunto dopo l'ultima "lezione" di Mattia
        //Con l'opzione qui sotto facciamo in modo che il testo nelle scelte coincida con la quantità di opzioni di scelta presenti nell'array. Prima definiamo la lunghezza dell'array dei GameObject "choices". Da lì aggiungiamo un bottone alla volta.
        //Questa roba forse l'ho capita fino a un certo punto: perché uso GetComponent e non SetActive?
        choicesText = new TextMeshProUGUI[choices.Length];
        int index = 0;
            foreach (GameObject choice in choices)
            {
                choicesText[index] = choice.GetComponentInChildren<TextMeshProUGUI>();
                index++;
            }

        //GetComponent<Image>();
    }

    void Update()
    {
        //Se non ci sono conversazioni in corso, skippiamo (return)
        // if(!dialogueIsPlaying)
        //    return;
        //}

        //Se invece il dialogo è in corso, ci interessa sapere se il giocatore preme il tasto di interazione per mandare avanti la conversazione
        // if (InputManager.GetInstance().GetSubmitPressed())
        // {
        //     ContinueStory();
        // }
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
                dialoguePanel.SetActive(false);
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

            else
            {
                //Attiviamo il panel di dialogo
                dialoguePanel.SetActive(true);
                //Associamo al testo di Unity il testo di INK.
                dialogueText.text = currentLine;
                DisplayChoices();
            }

            HandleTags(story.currentTags);

        }
    }




//Mi serve per cominciare la conversazione
    public void OnClick(string entity)
    {
        //scorriamo tutte le scelte possibili, e poi confrontiamo ogni scelta con il valore di stringa "entity"
        foreach (var choice in story.currentChoices)
        {
            if(choice.text.Trim() == entity)
            {
                //In questo modo recuperiamo il valore indice di una scelta
                var choiceIndex = choice.index;
                //Questo è "scegli questo indice di scelta", vai a questa scelta (Es: mentore 0 come indice, vai alla scelta 0, quindi il mentore)
                //Se il metodo parte con dei verbi come Choose, Set, Get sono "agenti". Con Is, etc, restituiscono valori.
                story.ChooseChoiceIndex(choiceIndex);
                //In ink questo significa andare all'inizio della parentesi quadra (+[xsxx]), non ha ancora compito la scelta.
                //Attiviamo il panel di dialogo
                dialoguePanel.SetActive(true);
                //Associamo al testo di Unity il testo di INK.
                ContinueStory();
                break;
                //break esce dal primo ciclo che trova, in modo da evitare che mi vada a testare tutto il rimanente. Metterla sempre.
            }
        }
    }

    public void OnClickContinue()
    {
        //Tentativo disabilitare presenza bottone in caso di scelte disponibili
        // List<Choice> currentChoices = story.currentChoices;
        // if (currentChoices.Count == 0)
        // {
        //     continueButton.SetActive(true);
        //     ContinueStory();
        // }
        // else
        // {
        //     continueButton.SetActive(false);
        // }
        ContinueStory();

    }

//Questa roba ti permette di attivare i tasti e metterci il testo, adattala poi a questa situazione (viene dal prototipo originale.)
    private void DisplayChoices()
    {
        List<Choice> currentChoices = story.currentChoices;

        //Questo è un check per essere sicura che non ci siano in ink più scelte di quante non siano accessibili nell'interfaccia di unity
        if (currentChoices.Count > choices.Length)
        {
            Debug.LogError("More choices were given than the UI che support. Number of choice given; " + currentChoices.Count);
        }

        int index = 0;

        //enable and initialize the choices up to the amount of choices for this line of dialogue
        foreach(Choice choice in currentChoices)
        {
            choices[index].gameObject.SetActive(true);
            choicesText[index].text = choice.text;
            index++;
        }

        //skippa poi le scelte che sono vuote e non vanno attivate nell'interfaccia
        for(int i = index; i <choices.Length; i++)
        {
            choices[i].gameObject.SetActive(false);
        }


        StartCoroutine(SelectFirstChoice());

    }


    //Questa funzione risolve il problema per cui non ci sono opzioni cliccabili evidenziando la prima di default.
    private IEnumerator SelectFirstChoice()
    {
        //EventSystem chiede prima di venir svuotato, poi di selezionare il primo utile
        EventSystem.current.SetSelectedGameObject(null);
        yield return new WaitForEndOfFrame();
        EventSystem.current.SetSelectedGameObject(choices[0].gameObject);

    }

    public void MakeChoice(int choiceIndex)
    {
        story.ChooseChoiceIndex(choiceIndex);
        //Abbiamo messo questa cosa perché ink prima si sposta sulla scelta, e poi avanza. cosa che nel codice prima non c'era
        ContinueStory();
    }




     private void HandleTags(List<string> currentTags)
    {
        //loopiamo la comunque
        foreach (string tag in currentTags)
        {
            //dividi il tag in base al :
            //Split non divide in due, divide ogni volta che c'è un : e poi ricomincia il giro (foreach), tipo gatto: cane: giardino
            string[] splitTag = tag.Split(':');
            //Check di sicurezza per evitare che ci siano più di due elementi
            if (splitTag.Length != 2)
            {
                Debug.LogError("Tag could not appropriately parsed: " + tag);
            }
            //Posso partire da qui per recuperare il nome del parlante?
            string tagKey = splitTag[0].Trim();
            string tagValue = splitTag[1].Trim();


            //Da qui partiamo con uno switch dei tag
            switch (tagKey)
            {
                case BACKGROUND_TAG:

                    //TAG GESTIONE DEL GIARDINO
                        if(tagValue == "backGiardino") {
                            background.sprite = backGiardino;
                        }

                    //TAG GESTIONE DEL MAUSOLEO
                        if(tagValue == "backMausoleo") {
                            background.sprite = backMausoleo;
                        }

                    //TAG GESTIONE DEL SERRA
                        if(tagValue == "backFunghi") {
                            background.sprite = backFunghi;
                        }

                    //TAG GESTIONE DEL FALENE
                        if(tagValue == "backFalene") {
                            background.sprite = backFalene;
                        }

                    //TAG GESTIONE DEL LABIRINTO
                        if(tagValue == "backLabirinto") {
                            background.sprite = backLabirinto;
                        }

                    //TAG GESTIONE DEL SIRENE
                        if(tagValue == "backSirene") {
                            background.sprite = backSirene;
                        }

                    //TAG GESTIONE DEL BIBLIOTECA
                        if(tagValue == "backBiblioteca") {
                            background.sprite = backBiblioteca;
                        }

                    //TAG GESTIONE DEL TISANE
                        if(tagValue == "backTisane") {
                            background.sprite = backTisane;
                        }

                        break;

                    case AMBIENTSOUNDS_TAG:

                    //TAG MUSICA SOTTOFONDO GIARDINO
                    if(tagValue == "gardenSounds") {
                            ambientSounds.clip = gardenSounds;
                            ambientSounds.Play();
                        }
                    //TAG MUSICA SOTTOFONDO MAUSOLEO
                    if(tagValue == "mausoleumSounds") {
                            ambientSounds.clip = mausoleumSounds;
                            ambientSounds.Play();
                        } 

                    //TAG MUSICA SOTTOFONDO SERRA
                    if(tagValue == "greenhouseSounds") {
                            ambientSounds.clip = greenhouseSounds;
                            ambientSounds.Play();
                        }         

                      break;  

                 default:
                 Debug.LogWarning("Tag came in but is not currently handled: "+ tag);
                 break;


            }



                

        }
    }

    
    //Mea culpa: questa roba viene da chatGPT
    [System.Serializable]
    public class SaveData
        {
            public string inkState; // Stato della storia di ink

        }
    public void SaveGame()
    {
        SaveData saveData = new SaveData
        {
            inkState = story.state.ToJson()
        };

        string json = JsonUtility.ToJson(saveData);
        File.WriteAllText(Application.persistentDataPath + "/savefile.json", json);
        Debug.Log("Gioco salvato!");
    }

    public void LoadGame()
    {
        string path = Application.persistentDataPath + "/savefile.json";
        if (File.Exists(path))
        {
            string json = File.ReadAllText(path);
            SaveData saveData = JsonUtility.FromJson<SaveData>(json);

            // Ripristina lo stato di Ink
            story.state.LoadJson(saveData.inkState);
            Debug.Log("Gioco caricato!");
        }
        else
        {
            Debug.LogWarning("Nessun salvataggio trovato!");
        }
    }

}


