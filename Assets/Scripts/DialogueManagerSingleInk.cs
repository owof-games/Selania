using System;
using Ink.Runtime;
using UnityEngine;
using TMPro;
using System.Collections.Generic;
using System.Collections;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using System.IO;
using System.Linq;
using System.Text;
using UnityEngine.Events;

public class DialogueManagerSingleInk : MonoBehaviour
{
    [Header("Dialogue UI")] [SerializeField]
    private GameObject dialoguePanel;

    [SerializeField] private TextMeshProUGUI dialogueText;
    [SerializeField] private GameObject continueButton;

    [SerializeField] private GameObject dialoguePanelBig;
    [SerializeField] private TextMeshProUGUI dialogueTextBig;
    [SerializeField] private GameObject continueButtonBig;

    //Marco: copiatura elementi gestione bigDialogueMode per nestDialogueMode
    [SerializeField] private GameObject dialoguePanelNest;
    [SerializeField] private TextMeshProUGUI dialogueTextNest;
    [SerializeField] private GameObject continueButtonNest;

    [Header("Choices UI")] [SerializeField]
    private GameObject[] choices;

    private TextMeshProUGUI[] choicesText;
    [SerializeField] private GameObject[] choicesBig;
    private TextMeshProUGUI[] choicesTextBig;

    //Marco: copiatura elementi gestione bigDialogueMode per nestDialogueMode
    [SerializeField] private GameObject[] choicesNest;
    private TextMeshProUGUI[] choicesTextNest;

    private Story story;

    [Header("Ink")] [SerializeField] private string[] allPlaces;
    [SerializeField] private string bigDialogueInkBoolVariable = "bigDialogue";

    //Marco: copiatura elementi gestione bigDialogueMode per nestDialogueMode
    [SerializeField] private string nestDialogueInkBoolVariable = "nestDialogue";

    [Header("Text elements")] [SerializeField]
    private TextAsset inkAssetJSON;

    [SerializeField] private GameObject[] entities;
    [SerializeField] private TextMeshProUGUI displayNameText;
    [SerializeField] private Animator portraitAnimator;
    [SerializeField] private Animator inkAnimatorA;
    [SerializeField] private Animator inkAnimatorB;
    [SerializeField] private Animator inkAnimatorC;
    [SerializeField] private Animator inkAnimatorD;


    [Header("Background setting")] [SerializeField]
    private Image background;

    private const string BACKGROUND_TAG = "background";

    [Header("Bedroom Backgrounds")] [SerializeField]
    private Sprite backBedroom;

    [Header("Forest Backgrounds")] [SerializeField]
    private Sprite backForest;

    [Header("Train Stop Backgrounds")] [SerializeField]
    private Sprite backTrainStop;

    [Header("Greenhouse Backgrounds")] [SerializeField]
    private Sprite backGreenhouse;

    [Header("Pond Backgrounds")] [SerializeField]
    private Sprite backPond;

    [Header("Nest Backgrounds")] [SerializeField]
    private Sprite backNest;

    [Header("Library Backgrounds")] [SerializeField]
    private Sprite backLibrary;

    [SerializeField] private Sprite backNightLibrary;

    [Header("Kitchen Backgrounds")] [SerializeField]
    private Sprite backKitchen;

    [Header("Book Backgrounds")] [SerializeField]
    private Sprite bookBGZero;

    [SerializeField] private Sprite bookBGOne;
    [SerializeField] private Sprite bookBGTwo;
    [SerializeField] private Sprite bookBGThree;
    [SerializeField] private Sprite bookBGFour;
    [SerializeField] private Sprite bookBGFive;


    [Header("Sounds")] [SerializeField] private AudioSource ambientSounds;
    private const string AMBIENTSOUNDS_TAG = "ambientSounds";

    [Header("Bedroom Sounds")] [SerializeField]
    private AudioClip bedroomSounds;

    [Header("Forest Sounds")] [SerializeField]
    private AudioClip forestSounds;

    [Header("Train Stop Sounds")] [SerializeField]
    private AudioClip trainstopSounds;

    [Header("Greenhouse Sounds")] [SerializeField]
    private AudioClip greenhouseSounds;

    [Header("Pond Sounds")] [SerializeField]
    private AudioClip pondSounds;

    [Header("Library Sounds")]
    [SerializeField]
    private AudioClip librarySounds;

    [Header("Kitchen Sounds")]
    [SerializeField]
    private AudioClip kitchenSounds;
    
    [Header("Nest Sounds")] [SerializeField]
    private AudioClip nestSounds;

    [Header("Book Sounds")] [SerializeField]
    private AudioClip bookSounds;

    //TAG UTILIZZATO PER NOME
    private const string SPEAKER_TAG = "speaker";

    //TAG USATO PER RITRATTO
    private const string PORTRAIT_TAG = "portrait";

    //TAGS USATI PER INCHIOSTRO
    private const string INK_TAG_A = "inkA";
    private const string INK_TAG_B = "inkB";
    private const string INK_TAG_C = "inkC";
    private const string INK_TAG_D = "inkD";

    void Start()
    {
        FillChoicesTextMeshPro(choices, ref choicesText);
        FillChoicesTextMeshPro(choicesBig, ref choicesTextBig);
        FillChoicesTextMeshPro(choicesNest, ref choicesTextNest);

        story = new Story(inkAssetJSON.text);

        if (!LoadGame())
        {
            ContinueStory();
        }

        // imposta tutte le variabili di debug a false per sicurezza
        var debugVariableNames = (
            from variableName in story.variablesState
            where variableName.IndexOf("debug", StringComparison.Ordinal) == 0
            select variableName).ToList();
        foreach (var debugVariableName in debugVariableNames)
        {
            story.variablesState[debugVariableName] = false;
        }

        DisableDialoguePanel();

        InkStoryLoaded();
    }

    private void FillChoicesTextMeshPro(GameObject[] choicesGameObjects, ref TextMeshProUGUI[] choicesTextMeshPros)
    {
        choicesTextMeshPros = new TextMeshProUGUI[choicesGameObjects.Length];
        int index = 0;
        foreach (GameObject choice in choicesGameObjects)
        {
            choicesTextMeshPros[index] = choice.GetComponentInChildren<TextMeshProUGUI>();
            index++;
        }
    }

    void ContinueStory()
    {
        if (story.canContinue)
        {
            string currentLine;
            do
            {
                currentLine = story.Continue().Trim();
                UpdateUI(currentLine, story.currentChoices);
            } while (currentLine == "" && story.canContinue);
        }
    }

    [SerializeField] UnityEvent<string> startAnimation;

    private string lastCurrentLine;
    private List<Choice> lastCurrentChoices;

    private void UpdateUI(string currentLine, List<Choice> currentChoices)
    {
        lastCurrentLine = currentLine;
        lastCurrentChoices = currentChoices;

        var sb = new StringBuilder();
        sb.AppendLine($"Current line: {currentLine}");
        sb.AppendLine($"Current choices:");
        foreach (var choice in currentChoices)
        {
            sb.AppendLine($"  {choice.text}");
        }
        Debug.Log(sb.ToString());
        
        bool buttonsEnabled;
        bool mustContinueStory = false;
        if (currentLine == "@interact")
        {
            DisableDialoguePanel();
            buttonsEnabled = true;
        }
        else if (currentLine.StartsWith("@animation:"))
        {
            var animationName = currentLine["@animation:".Length..];
            startAnimation.Invoke(animationName);
            buttonsEnabled = false;
            // ContinueStory();
            mustContinueStory = true;
        }
        else if (currentLine == "@quit")
        {
            buttonsEnabled = false;
            // Application.Quit();
            UnityEngine.SceneManagement.SceneManager.LoadScene("Start");
        }
        else if (currentLine == "@exit_from_rewriter_book")
        {
            // di fronte all'istruzione speciale @exit_from_rewriter_book:
            // torna su flow normale
            story.SwitchToDefaultFlow();

            // ri-abilita background e ambientSounds salvati prima
            UpdateBackground(rewriterBookSavedBackground);
            UpdateMusic(rewriterBookSavedMusic);

            // re-imposta lo stato di big dialogue
            story.variablesState[bigDialogueInkBoolVariable] = rewriterBookSavedIsBigDialogue;

            //Marco: copiatura elementi gestione bigDialogueMode per nestDialogueMode
            // re-imposta lo stato di nest dialogue
            story.variablesState[nestDialogueInkBoolVariable] = rewriterBookSavedIsNestDialogue;
            
            // simulo l'ultima riga, richiamando questo stesso metodo
            UpdateUI(rewriterBookSavedCurrentLine, rewriterBookSavedCurrentChoices);
            return;
        }
        else
        {
            // dialoguePanel.SetActive(true);
            EnableDialoguePanel();
            dialogueText.text = currentLine;
            dialogueTextBig.text = currentLine;
            dialogueTextNest.text = currentLine;
            DisplayChoices(currentChoices);
            buttonsEnabled = false;
        }

        OnOffObject(buttonsEnabled);
        CheckContinueButton();

        HandleTags(story.currentTags);

        if (mustContinueStory)
        {
            ContinueStory();
        }
    }

    public void CheckContinueButton()
    {
        if (story.canContinue)
        {
            continueButton.SetActive(true);
            continueButtonBig.SetActive(true);
            continueButtonNest.SetActive(true);
        }
        else
        {
            continueButton.SetActive(false);
            continueButtonBig.SetActive(false);
            continueButtonNest.SetActive(false);
        }
    }

    [SerializeField] private Button rewriterBookButton;


    public void OnOffObject(bool buttonsEnabled)
    {
        foreach (var placeVariableName in allPlaces)
        {
            var charactersInThePlace = (InkList)story.variablesState[placeVariableName];
            Debug.Log($"Place name ={placeVariableName},characters = {charactersInThePlace}");
            Debug.Assert(charactersInThePlace != null, "Se è null vuol dire che la variabile non esiste lato ink.");


            Debug.Log(charactersInThePlace);
            if (charactersInThePlace.ContainsItemNamed("PG"))
            {
                foreach (var entity in entities)
                {
                    bool found = false;

                    if (charactersInThePlace.ContainsItemNamed(entity.name)) // || entity.name == "Inventory"
                    {
                        found = true;
                    }


                    entity.SetActive(found);

                    var button = entity.GetComponent<Button>();
                    if(button != null) {
                        button.interactable = button == rewriterBookButton || buttonsEnabled;
                    }
                }

                break;
            }
        }
    }


    public void OnClick(string entity)
    {
        foreach (var choice in story.currentChoices)
        {
            if (choice.text.Trim() == entity)
            {
                var choiceIndex = choice.index;

                story.ChooseChoiceIndex(choiceIndex);

                // dialoguePanel.SetActive(true);
                EnableDialoguePanel();

                ContinueStory();
                break;
            }
        }
    }

    private string rewriterBookSavedBackground;
    private string rewriterBookSavedMusic;
    private bool rewriterBookSavedIsBigDialogue;
    //Marco: copiatura elementi gestione bigDialogueMode per nestDialogueMode
    private bool rewriterBookSavedIsNestDialogue;
    private string rewriterBookSavedCurrentLine;
    private List<Choice> rewriterBookSavedCurrentChoices;

    private const string RewriterBookFlowName = "RewriterBook";
    private const string RewriterBookKnotName = "rewriter_book_with_flow";

    public void OnRewriterBook()
    {
        // salvare background e ambientSounds correnti, da ripristinare quando si esce
        rewriterBookSavedBackground = lastBackgroundValue;
        rewriterBookSavedMusic = lastMusicValue;

        // salvare anche dialog corrente + suo stato + scelte, nel caso sia attivo
        //Marco: copiatura elementi gestione bigDialogueMode per nestDialogueMode
        rewriterBookSavedIsBigDialogue = (bool)story.variablesState[bigDialogueInkBoolVariable];
        rewriterBookSavedIsNestDialogue = (bool)story.variablesState[nestDialogueInkBoolVariable];
        rewriterBookSavedCurrentLine = lastCurrentLine;
        rewriterBookSavedCurrentChoices = lastCurrentChoices;
        
        // passa a flow RewriterBook
        story.SwitchFlow(RewriterBookFlowName);
        
        // salta a nodo rewriter_book_with_flow
        story.ChoosePathString(RewriterBookKnotName);
        
        // continue story
        ContinueStory();
    }

    public void OnClickContinue()
    {
        ContinueStory();
    }

    private void DisplayChoices(List<Choice> currentChoices)
    {
        var choiceGameObjects = GetChoiceGameObjects();
        var choiceTextMeshPros = GetChoiceTextMeshPros();

        if (currentChoices.Count > choiceGameObjects.Length)
        {
            Debug.LogError(
                $"More choices were given than the UI che support. Number of choices given: {currentChoices.Count}. Number of button choices available: {choiceGameObjects.Length}");
        }

        int index = 0;

        foreach (Choice choice in currentChoices)
        {
            choiceGameObjects[index].SetActive(true);
            choiceTextMeshPros[index].text = choice.text;
            index++;
        }

        for (int i = index; i < choiceGameObjects.Length; i++)
        {
            choiceGameObjects[i].SetActive(false);
        }
    }

    private TextMeshProUGUI[] GetChoiceTextMeshPros()
    {
        //Marco: copiatura elementi gestione bigDialogueMode per nestDialogueMode
        return IsBigDialogueMode() ? choicesTextBig : choicesText;
        return IsNestDialogueMode() ? choicesTextNest : choicesText;
    }

    private GameObject[] GetChoiceGameObjects()
    {
        //Marco: copiatura elementi gestione bigDialogueMode per nestDialogueMode
        return IsBigDialogueMode() ? choicesBig : choices;
        return IsNestDialogueMode() ? choicesNest : choices;
    }


    

    //Nota: disabilitato per ora perché sennò non mi mette in evidenza la prima scelta.
    //Più avanti ci sarà la possibilità di risolvere questa cosa in modo complesso perché Unity merda
    // private IEnumerator SelectFirstChoice()
    // {
    //     EventSystem.current.SetSelectedGameObject(null);
    //     yield return new WaitForEndOfFrame();
    //     EventSystem.current.SetSelectedGameObject(GetChoiceGameObjects()[0].gameObject);
    // }

    public void MakeChoice(int choiceIndex)
    {
        story.ChooseChoiceIndex(choiceIndex);
        ContinueStory();
    }


    private void HandleTags(List<string> currentTags)
    {
        foreach (string tag in currentTags)
        {
            string[] splitTag = tag.Split(':');

            if (splitTag.Length != 2)
            {
                Debug.LogError("Tag could not appropriately parsed: " + tag);
            }

            string tagKey = splitTag[0].Trim();
            string tagValue = splitTag[1].Trim();


            switch (tagKey)
            {
                case BACKGROUND_TAG:

                    UpdateBackground(tagValue);


                    // Salviamo solo quando entriamo in una nuova "scena", e solo se siamo sul flow di default
                    // (e.g.: non nel diario)
                    if (story.currentFlowIsDefaultFlow)
                    {
                        SaveGame();
                    }

                    break;

                case AMBIENTSOUNDS_TAG:

                    UpdateMusic(tagValue);

                    break;


                case SPEAKER_TAG:
                    displayNameText.text = tagValue;
                    Debug.Log("speaker" + tagValue);
                    break;


                case PORTRAIT_TAG:
                    portraitAnimator.Play(tagValue);
                    Debug.Log("portrait" + tagValue);
                    break;

                case INK_TAG_A:
                    inkAnimatorA.Play(tagValue);
                    Debug.Log("inkA" + tagValue);
                    break;

                case INK_TAG_B:
                    inkAnimatorB.Play(tagValue);
                    Debug.Log("inkB" + tagValue);
                    break;

                case INK_TAG_C:
                    inkAnimatorC.Play(tagValue);
                    Debug.Log("inkC" + tagValue);
                    break;

                case INK_TAG_D:
                    inkAnimatorD.Play(tagValue);
                    Debug.Log("inkD" + tagValue);
                    break;

                default:
                    Debug.LogWarning("Tag came in but is not currently handled: " + tag);
                    break;
            }
        }
    }

    private string lastMusicValue;

    private void UpdateMusic(string tagValue)
    {
        lastMusicValue = tagValue;
        
        switch (tagValue)
        {
            //TAG MUSICA SOTTOFONDO CAMERA DA LETTO
            case "bedroomSounds":
                UpdateAmbientSounds(bedroomSounds);
                break;
            //TAG MUSICA SOTTOFONDO GIARDINO
            case "forestSounds":
                UpdateAmbientSounds(forestSounds);
                break;
            //TAG MUSICA SOTTOFONDO TrainStop
            case "trainstopSounds":
                UpdateAmbientSounds(trainstopSounds);
                break;
            //MUSIC TAG FOR GREENHOUSE
            case "greenhouseSounds":
                UpdateAmbientSounds(greenhouseSounds);
                break;
            //MUSIC TAG FOR POND
            case "pondSounds":
                UpdateAmbientSounds(pondSounds);
                break;
            //MUSIC TAG FOR LIBRARY
            case "librarySounds":
                UpdateAmbientSounds(librarySounds);
                break;
            //TAG MUSICA CUCINA
            case "kitchenSounds":
                UpdateAmbientSounds(kitchenSounds);
                break; 
            //TAG MUSICA CUCINA
            case "nestSounds":
                UpdateAmbientSounds(nestSounds);
                break;                   
            //TAG MUSICA SOTTOFONDO LIBRO
            case "bookSounds":
                UpdateAmbientSounds(bookSounds);
                break;
            default:
                Debug.LogWarning($"Cannot find audio erp {tagValue}");
                break;
        }
    }

    private string lastBackgroundValue;

    private void UpdateBackground(string tagValue)
    {
        lastBackgroundValue = tagValue;
        
        //TAG GESTIONE DELLA CAMERA DA LETTO
        if (tagValue == "backBedroom")
        {
            background.sprite = backBedroom;
        }

        //TAG GESTIONE DELLA FORESTA
        if (tagValue == "backForest")
        {
            background.sprite = backForest;
        }

        //TAG GESTIONE DEL TRAIN STOP
        if (tagValue == "backTrainStop")
        {
            background.sprite = backTrainStop;
        }

        //TAG GESTIONE DELLA SERRA
        if (tagValue == "backGreenhouse")
        {
            background.sprite = backGreenhouse;
        }

        //BACKGROUND TAG FOR POND
        if (tagValue == "backPond")
        {
            background.sprite = backPond;
        }

        //TAG GESTIONE DEL NIDO
        if (tagValue == "backNest")
        {
            background.sprite = backNest;
        }

        //TAG GESTIONE DELLA BIBLIOTECA
        if (tagValue == "backLibrary")
        {
            background.sprite = backLibrary;
        }

        if (tagValue == "backNightLibrary")
        {
            background.sprite = backNightLibrary;
        }

        //TAG GESTIONE DELLA CUCINA
        if (tagValue == "backKitchen")
        {
            background.sprite = backKitchen;
        }

        //TAG GESTIONE DEL LIBRO
        if (tagValue == "bookBGZero")
        {
            background.sprite = bookBGZero;
        }

        if (tagValue == "bookBGOne")
        {
            background.sprite = bookBGOne;
        }

        if (tagValue == "bookBGTwo")
        {
            background.sprite = bookBGTwo;
        }

        if (tagValue == "bookBGThree")
        {
            background.sprite = bookBGThree;
        }

        if (tagValue == "bookBGFour")
        {
            background.sprite = bookBGFour;
        }

        if (tagValue == "bookBGFive")
        {
            background.sprite = bookBGFive;
        }
    }

    private void UpdateAmbientSounds(AudioClip clip)
    {
        ambientSounds.clip = clip;
        if (!ambientSounds.isPlaying)
        {
            ambientSounds.Play();
        }
    }


    //Questo viene utilizzato dai BranchManager
    public InkList GetPlayerFirstStory()
    {
        return (InkList)story.variablesState["playerFirstStory"];
    }

    public InkList GetPlayerSecondStory()
    {
        return (InkList)story.variablesState["playerSecondStory"];
    }

    //Questo viene utilizzato dai coltivabili
    public InkList GetEffettivoStatoCantoDelleCompagne()
    {
        return (InkList)story.variablesState["growthCantoDelleCompagne"];
    }

    public InkList GetEffettivoStatoLaSpazzata()
    {
        return (InkList)story.variablesState["growthLaSpazzata"];
    }

    public InkList GetEffettivoStatoLicheneDegliAbissi()
    {
        return (InkList)story.variablesState["growthLicheneDegliAbissi"];
    }

    public InkList GetEffettivoStatoBrinaDellImpossibile()
    {
        return (InkList)story.variablesState["growthBrinaDellImpossibile"];
    }

    public InkList GetEffettivoStatoBaccaDellaAddolorata()
    {
        return (InkList)story.variablesState["growthBaccaDellaAddolorata"];
    }

    public InkList GetEffettivoStatoNonTiScordarDiTe()
    {
        return (InkList)story.variablesState["growthNonTiScordarDiTe"];
    }

    public InkList GetEffettivoStatoEderaDelleAmanti()
    {
        return (InkList)story.variablesState["growthEderaDelleAmanti"];
    }

    public InkList GetEffettivoStatoCardoAspinato()
    {
        return (InkList)story.variablesState["growthCardoAspinato"];
    }

    public InkList GetEffettivoStatoBastoneDellOzioso()
    {
        return (InkList)story.variablesState["growthBastoneDellOzioso"];
    }   
    public InkList GetEffettivoStatoBarbaDellInciampo()
    {
        return (InkList)story.variablesState["growthBarbaDellInciampo"];
    }   
    public InkList GetEffettivoStatoOlobino()
    {
        return (InkList)story.variablesState["growthOlobino"];
    }
    public InkList GetEffettivoStatoFalsaPalude()
    {
        return (InkList)story.variablesState["growthFalsaPalude"];
    }      
    public InkList GetEffettivoStatoLanaNotturna()
    {
        return (InkList)story.variablesState["growthLanaNotturna"];
    }      
    public InkList GetEffettivoStatoErbaLiccia()
    {
        return (InkList)story.variablesState["growthErbaLiccia"];
    }    
    [System.Serializable]
    public class SaveData
    {
        public string inkState;
    }

    public void SaveGame()
    {
        //Se PG è nella stanza, mando return e non faccio nulla, altrimenti salvo
        // if (IsPGInBedroom())
        // {
        //     return;
        // }

        SaveData saveData = new SaveData
        {
            inkState = story.state.ToJson()
        };

        string json = JsonUtility.ToJson(saveData);
        File.WriteAllText(Application.persistentDataPath + "/savefile.json", json);
        Debug.Log("Gioco salvato!");
    }

    public bool LoadGame()
    {
        string path = Application.persistentDataPath + "/savefile.json";
        if (File.Exists(path))
        {
            Debug.Log($"Carico gioco da {path}");
            string json = File.ReadAllText(path);
            SaveData saveData = JsonUtility.FromJson<SaveData>(json);

            // Ripristina lo stato di Ink
            story.state.LoadJson(saveData.inkState);
            Debug.Log("Gioco caricato!");
            ContinueStory();
            UpdateUI(story.currentText.Trim(), story.currentChoices);
            return true;
        }
        else
        {
            Debug.LogWarning("Nessun salvataggio trovato!");
            //OnClick("RoomLoad");
            return false;
        }
    }


    public bool IsPGInBedroom()
    {
        var bedroomContents = (InkList)story.variablesState["bedroomContents"];
        return bedroomContents.ContainsItemNamed("PG");
    }


    private bool IsBigDialogueMode()
    {
        var isBigDialogueMode = (bool)story.variablesState[bigDialogueInkBoolVariable];
        return isBigDialogueMode;
    }

//Marco: copiatura elementi gestione bigDialogueMode per nestDialogueMode
    private bool IsNestDialogueMode()
    {
        var IsNestDialogueMode = (bool)story.variablesState[nestDialogueInkBoolVariable];
        return IsNestDialogueMode;
    }
    

    private void EnableDialoguePanel()
    {
        //Marco: copiatura elementi gestione bigDialogueMode per nestDialogueMode
        if (IsNestDialogueMode())
        {
            dialoguePanel.SetActive(false);
            dialoguePanelBig.SetActive(false);
            dialoguePanelNest.SetActive(true);
        }
        else if (IsBigDialogueMode())
        {
            dialoguePanel.SetActive(false);
            dialoguePanelBig.SetActive(true);
            dialoguePanelNest.SetActive(false);
        }
        else
        {
            dialoguePanel.SetActive(true);
            dialoguePanelBig.SetActive(false);
            dialoguePanelNest.SetActive(false);
        }
    }

    private void DisableDialoguePanel()
    {
        dialoguePanel.SetActive(false);
        dialoguePanelBig.SetActive(false);
        dialoguePanelNest.SetActive(false);
    }

    /*
     * Sezione per aggancio verso Talo
     */

    [Tooltip(
        "Invoked whenever the Ink story has been loaded (if a save game has been found, otherwise straight after the story has been created and the first step has been entered)")]
    public UnityEvent onInkStoryLoaded = new();

    /// <summary>
    /// Whether the Ink story has been loaded
    /// </summary>
    public bool IsInkStoryLoaded { get; private set; }

    void InkStoryLoaded()
    {
        onInkStoryLoaded.Invoke();
        IsInkStoryLoaded = true;
    }

    /// <summary>
    /// Register a variable observer. Whenever the variable with given name changes, the variable observer gets
    /// called.
    /// </summary>
    /// <param name="variableName">Name of the variable to observe.</param>
    /// <param name="variableObserver">Callback method that is called whenever the variable changes.</param>
    /// <returns>A method that de-register the observer.</returns>
    public System.Action RegisterVariableObserver(string variableName, Story.VariableObserver variableObserver)
    {
        story.ObserveVariable(variableName, variableObserver);
        return () => story.RemoveVariableObserver(variableObserver);
    }

    /// <summary>
    /// Get the value of a variable.
    /// </summary>
    /// <param name="variableName">Name of the variable to get the value of.</param>
    /// <returns>The value of the variable.</returns>
    public object GetVariableValue(string variableName)
    {
        return story.variablesState[variableName];
    }
}