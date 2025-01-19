using Ink.Runtime;
using UnityEngine;
using TMPro;
using System.Collections.Generic;
using System.Collections;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using System.IO;

public class DialogueManagerSingleInk : MonoBehaviour
{

    [Header("Dialogue UI")]
    [SerializeField] private GameObject dialoguePanel;
    [SerializeField] private TextMeshProUGUI dialogueText;


    [SerializeField] private GameObject continueButton;
    private Story story;

    [SerializeField] private string[] allPlaces;

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

    [Header("Bus Stop Backgrounds")]
    [SerializeField] private Sprite backBusStop;

    [Header("Greenhouse Backgrounds")]
    [SerializeField] private Sprite backFunghi;

    [Header("Greenhouse Middle Path Backgrounds")]
    [SerializeField] private Sprite backGreenhouseMiddlePath;    

    [Header("Pets Backgrounds")]
    [SerializeField] private Sprite backFalene;

    [Header("Labirint Backgrounds")]
    [SerializeField] private Sprite backLabirinto;

    [Header("Library Backgrounds")]
    [SerializeField] private Sprite backBiblioteca;

    [Header("Tea Backgrounds")]
    [SerializeField] private Sprite backTisane;


    [Header("Sounds")]
    [SerializeField] private AudioSource ambientSounds;
    private const string AMBIENTSOUNDS_TAG = "ambientSounds";
    [Header("Garden Sounds")]
    [SerializeField] private AudioClip gardenSounds;
    [Header("Bus Stop Sounds")]
    [SerializeField] private AudioClip busstopSounds;
    [Header("Greenhouse Sounds")]
    [SerializeField] private AudioClip greenhouseSounds;

    [Header("Greenhouse Middle Path Sounds")]
    [SerializeField] private AudioClip greenhousemiddlepathSounds;    





    void Start()
    {
        story = new Story(inkAssetJSON.text);
        ContinueStory();
        dialoguePanel.SetActive(false);
        choicesText = new TextMeshProUGUI[choices.Length];
        int index = 0;
        foreach (GameObject choice in choices)
        {
            choicesText[index] = choice.GetComponentInChildren<TextMeshProUGUI>();
            index++;
        }

    }

    void Update()
    {

    }
    
    void ContinueStory()
    {

        if (story.canContinue)
        {
        
            string currentLine = story.Continue().Trim();
            OnOffObject();
            CheckContinueButton();
            SaveGame();

            if (currentLine == "@interact")
            {
                dialoguePanel.SetActive(false);
                
            }

            else
            {
                dialoguePanel.SetActive(true);
                dialogueText.text = currentLine;
                DisplayChoices();
            }

            HandleTags(story.currentTags);

        }
    }

    public void CheckContinueButton()
    {
        if (story.canContinue)
        {

            continueButton.SetActive(true);
        }
        else
        {
            continueButton.SetActive(false);
        }
    }


    public void OnOffObject()
    {
   

        foreach (var placeVariableName in allPlaces)
        {
            var charactersInThePlace = (InkList)story.variablesState[placeVariableName];
           

            Debug.Log(charactersInThePlace);
            if (charactersInThePlace.ContainsItemNamed("PG"))
            {

                foreach (var entity in entities)
                {
                    bool found = false;

                    if (charactersInThePlace.ContainsItemNamed(entity.name) || entity.name == "Load" || entity.name == "Save" || entity.name == "Inventario" || entity.name == "Quit")
                    {
                        found = true;
                    }


        
                    entity.SetActive(found);

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
              
                dialoguePanel.SetActive(true);

                ContinueStory();
                break;

            }
        }
    }

    public void OnClickContinue()
    {

        ContinueStory();



    }

    private void DisplayChoices()
    {
        List<Choice> currentChoices = story.currentChoices;

        if (currentChoices.Count > choices.Length)
        {
            Debug.LogError("More choices were given than the UI che support. Number of choice given; " + currentChoices.Count);
        }

        int index = 0;

        foreach (Choice choice in currentChoices)
        {
            choices[index].gameObject.SetActive(true);
            choicesText[index].text = choice.text;
            index++;
        }

        for (int i = index; i < choices.Length; i++)
        {
            choices[i].gameObject.SetActive(false);
        }


        //StartCoroutine(SelectFirstChoice());

    }


    //Nota: disabilitato per ora perché sennò non mi mette in evidenza la prima scelta.
    //Più avanti ci sarà la possibilità di risolvere questa cosa in modo complesso perché Unity merda
    private IEnumerator SelectFirstChoice()
    {
        EventSystem.current.SetSelectedGameObject(null);
        yield return new WaitForEndOfFrame();
        EventSystem.current.SetSelectedGameObject(choices[0].gameObject);

    }

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

                    //TAG GESTIONE DEL GIARDINO
                    if (tagValue == "backGiardino")
                    {
                        background.sprite = backGiardino;
                    }

                    //TAG GESTIONE DEL BusStop
                    if (tagValue == "backBusStop")
                    {
                        background.sprite = backBusStop;
                    }

                    //TAG GESTIONE DEL SERRA
                    if (tagValue == "backFunghi")
                    {
                        background.sprite = backFunghi;
                    }

                    //BACKGROUND TAG FOR GREENHOUSE MIDDLE PATH
                    if (tagValue == "backGreenhouseMiddlePath")
                    {
                        background.sprite = backGreenhouseMiddlePath;
                    }                    

                    //TAG GESTIONE DEL FALENE
                    if (tagValue == "backFalene")
                    {
                        background.sprite = backFalene;
                    }

                    //TAG GESTIONE DEL LABIRINTO
                    if (tagValue == "backLabirinto")
                    {
                        background.sprite = backLabirinto;
                    }

                    //TAG GESTIONE DEL BIBLIOTECA
                    if (tagValue == "backBiblioteca")
                    {
                        background.sprite = backBiblioteca;
                    }

                    //TAG GESTIONE DEL TISANE
                    if (tagValue == "backTisane")
                    {
                        background.sprite = backTisane;
                    }

                    break;

                case AMBIENTSOUNDS_TAG:

                    //TAG MUSICA SOTTOFONDO GIARDINO
                    if (tagValue == "gardenSounds")
                    {
                        ambientSounds.clip = gardenSounds;
                        ambientSounds.Play();
                    }
                    //TAG MUSICA SOTTOFONDO BusStop
                    if (tagValue == "busstopounds")
                    {
                        ambientSounds.clip = busstopSounds;
                        ambientSounds.Play();
                    }

                    //TAG MUSICA SOTTOFONDO SERRA
                    if (tagValue == "greenhouseSounds")
                    {
                        ambientSounds.clip = greenhouseSounds;
                        ambientSounds.Play();
                    }

                    //MUSIC TAG FOR GREENHOUSE MIDDLE PATH
                    if (tagValue == "greenhousemiddlepathSounds")
                    {
                        ambientSounds.clip = greenhousemiddlepathSounds;
                        ambientSounds.Play();
                    }                    

                    break;

                default:
                    Debug.LogWarning("Tag came in but is not currently handled: " + tag);
                    break;


            }





        }
    }

    public void OnQuitButton()
    {
        SaveGame();
        Application.Quit();

    }

    [System.Serializable]
    public class SaveData
    {
        public string inkState;

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


