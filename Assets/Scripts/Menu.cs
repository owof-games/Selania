using UnityEngine;
using UnityEngine.SceneManagement;


public class Menu : MonoBehaviour
{

    public void Start()
    {
     

    }

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
            //La mia idea è quella di poter chiamare l'oggetto che ha il dialogueManager e chiamare da lì la funzione LoadGame(). Ha senso?

    }

}
