using UnityEngine;
using TMPro;
using Ink.Runtime;

public class DialogueManager : MonoBehaviour
{
    [Header("Dialogue UI")]
    [SerializeField] private GameObject dialoguePanel;
    [SerializeField] private TextMeshProUGUI dialogueText;

    private Story currentStory;

    public bool dialogueIsPlaying {get; private set;}
    //Se ho inteso bene {get; private set;} rende la variabile pubblica negli scripts da leggere, ma non possono modificarla;

    private static DialogueManager instance;



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

        ContinueStory();

    }

    private void ContinueStory()
    {
        //Questo currentStory.canContinue se ho capito bene è una funzione di ink che ci dice se c'è o meno testo da mostrare.
        if (currentStory.canContinue)
        {
            //Questo dice a TextMeshPro che testo mostrare (giusto?)
            dialogueText.text = currentStory.Continue();
        }
        else
        {
           ExitDialogueMode(); 
        }

    }

    private void ExitDialogueMode()
    {
        dialogueIsPlaying = false;
        dialoguePanel.SetActive(false);
        //Credo che l'opzione sotto serva a svuotare TextMeshPro così che non si porti dietro rimasugli di testo?
        dialogueText.text = "";

    }

}
