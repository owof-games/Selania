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


}
