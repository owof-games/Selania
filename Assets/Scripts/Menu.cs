using UnityEngine;
using UnityEngine.SceneManagement;
using Ink.Runtime;
using System.IO;


public class Menu : MonoBehaviour
{
private Story story;


    public void OnPlayButton ()
    {
        SceneManager.LoadScene(1);
    }

    public void OnQuitButton ()
    {
        Application.Quit();
    }

    public void OnContinueButton ()
    {   
        LoadGame();
        SceneManager.LoadScene(1);
    }


        public class SaveData
        {
            public string inkState; // Stato della storia di ink

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
