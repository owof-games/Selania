using System.Collections;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.SceneManagement;

public class Intro : MonoBehaviour
{

    [SerializeField] private float videoDuration = 3.0f;
    [SerializeField] private string nextSceneName = "Start";

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        StartCoroutine(WaitAndMoveToNextScene());
    }


    IEnumerator WaitAndMoveToNextScene()
    {
        yield return new WaitForSeconds(videoDuration);
        SceneManager.LoadScene(nextSceneName);
    }


    public void SkipIntro(InputAction.CallbackContext callbackContext)
    {
        SkipIntro();
    }
    
    public void SkipIntro()
    {
        SceneManager.LoadScene(nextSceneName);
    }
}
