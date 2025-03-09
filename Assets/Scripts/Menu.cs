using System.IO;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;



public class Menu : MonoBehaviour
{

    [SerializeField] Button continueButton;


    void Start()
    {
        var fileName = Application.persistentDataPath + "/savefile.json";
        if (File.Exists(fileName))
        {

            continueButton.interactable = true;
        }

        else
        {

            continueButton.interactable = false;

        }

    }

    public void OnPlayButton()
    {
        SceneManager.LoadScene(2);
    }

    public void OnQuitButton()
    {
        Application.Quit();
    }


    public void OnNewGameButton()
    {
        var fileName = Application.persistentDataPath + "/savefile.json";
        if (File.Exists(fileName))
        {

            File.Delete(fileName);
        }

        SceneManager.LoadScene(2);
    }

}
