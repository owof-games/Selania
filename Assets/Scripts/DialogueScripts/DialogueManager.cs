using UnityEngine;
using TMPro;
using Ink.Runtime;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.EventSystems;

public class DialogueManager : MonoBehaviour
{
    [Header("Dialogue UI")]
    [SerializeField] private GameObject dialoguePanel;
    [SerializeField] private TextMeshProUGUI dialogueText;
    [SerializeField] private TextMeshProUGUI displayNameText;
    [SerializeField] private Animator portraitAnimator;
    private Animator layoutAnimator;

    [Header("Choices UI")]
    [SerializeField] private GameObject[] choices;
    private TextMeshProUGUI[] choicesText;

    private Story currentStory;

    public bool dialogueIsPlaying {get; private set;}
    //Se ho inteso bene {get; private set;} rende la variabile pubblica negli scripts da leggere, ma non possono modificarla;

    private static DialogueManager instance;

    //Forse qui posso risolvere con "speaker" uguale a una lista di possibili outcome dei personaggi (player, mentore etc.)?
    private const string SPEAKER_TAG = "speaker";
    private const string PORTRAIT_TAG = "portrait";
    private const string LAYOUT_TAG = "layout";


    private void Awake()
        {
            if (instance != null)
            {
                Debug.LogWarning("Found more than one Dialogue Manager in the scene");
            }

            instance = this;
        }

    private void Start()
    {
        //In questo modo a inizio del gioco resetto la variabile e disattivo il panel di testo
        dialogueIsPlaying = false;
        dialoguePanel.SetActive(false);

        //get the Layout animator
        layoutAnimator = dialoguePanel.GetComponent<Animator>();
        
        //Con l'opzione qui sotto facciamo in modo che il testo nelle scelte coincida con la quantità di opzioni di scelta presenti nell'array. Prima definiamo la lunghezza dell'array dei GameObject "choices". Da lì aggiungiamo un bottone alla volta.
        choicesText = new TextMeshProUGUI[choices.Length];
        int index = 0;
        foreach (GameObject choice in choices)
        {
            choicesText[index] = choice.GetComponentInChildren<TextMeshProUGUI>();
            index++;

        }

    }


    private void Update()
    {
        //Se non ci sono conversazioni in corso, skippiamo (return)
        if(!dialogueIsPlaying)
        {
            return;
        }

        //Se invece il dialogo è in corso, ci interessa sapere se il giocatore preme il tasto di interazione per mandare avanti la conversazione
        if (InputManager.GetInstance().GetSubmitPressed())
        {
            ContinueStory();
        }

    }


    public static DialogueManager GetInstance()
    {
        return instance;
    }

    public void EnterDialogueMode(TextAsset inkJSON)
    {
        //Quando il dialogo parte, la nuova storia coincide con il file JSON di ink che ho settato nel manager
        currentStory = new Story(inkJSON.text);
        dialogueIsPlaying = true;
        dialoguePanel.SetActive(true);

        //reset portrait, layout and speakers
        displayNameText.text = "???";
        portraitAnimator.Play("default");
        layoutAnimator.Play("right");


        ContinueStory();

    }

    private void ContinueStory()
    {
        //Questo currentStory.canContinue se ho capito bene è una funzione di ink che ci dice se c'è o meno testo da mostrare.
        if (currentStory.canContinue)
        {
            //Questo dice a TextMeshPro che testo mostrare (giusto?)
            dialogueText.text = currentStory.Continue();
            //E chiamiamo le eventuali scelte che abbiamo settato
            DisplayChoices();
            //Gestione tag
            HandleTags(currentStory.currentTags);


        }
        else
        {
           StartCoroutine(ExitDialogueMode()); 
        }

    }

    private void HandleTags(List<string> currentTags)
    {
        //loopiamo la comunque
        foreach (string tag in currentTags)
        {
            //dividi il tag in base al :
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
            //NOTA: anche per i portraits farei comunque poi una costante, con la player sempre a sinistra e gli altri a destra
            switch (tagKey)
            {
                case SPEAKER_TAG:
                    //displayNameText è l'oggetto creato in Unity per mostrare il nome.
                    displayNameText.text = tagValue;
                    //Questo è un tentativo di regolare la posizione del layout a seconda di chi parla
                    //{
                        //if (SPEAKER_TAG == "player")  
                        //{layoutAnimator.Play(left);}
                        //if (SPEAKER_TAG != "player") 
                        //{layoutAnimator.Play(right);}

                    //}
                    break;
                case PORTRAIT_TAG:
                    //Play anima un oggetto chiamato (qui, chiamato dal nome del tag)
                    portraitAnimator.Play(tagValue);
                    break;
                case LAYOUT_TAG:
                    layoutAnimator.Play(tagValue);
                    break;
                 default: 
                 Debug.LogWarning("Tag came in but is not currently handled: "+ tag);
                 break;  
            }

        }
    }

    private IEnumerator ExitDialogueMode()
    {
        //diciamo di aspettare un quinto di secondo prima di fare qualsiasi cosa a dialogo finito.
        yield return new WaitForSeconds(0.2f);

        dialogueIsPlaying = false;
        dialoguePanel.SetActive(false);
        //Credo che l'opzione sotto serva a svuotare TextMeshPro così che non si porti dietro rimasugli di testo?
        dialogueText.text = "";

    }

    private void DisplayChoices()
    {
        List<Choice> currentChoices = currentStory.currentChoices;

        //Questo è un check per essere sicura che non ci siano in ink più scelte di quante non siano accessibili nell'interfaccia di unity
        if (currentChoices.Count > choices.Length)
        {
            Debug.LogError("More choices were given than the UI che support. Number of choice given; " + currentChoices.Count);
        }

        int index = 0;

        //enable and initialize the coices up to the amount of choices for this line of dialogu
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
        currentStory.ChooseChoiceIndex(choiceIndex);
    }


}
