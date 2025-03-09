using System.Collections;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.SceneManagement;

public class Intro : MonoBehaviour
{

    [SerializeField] private float videoDuration = 3.0f;

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        StartCoroutine(WaitAndMoveToNextScene());
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }


    IEnumerator WaitAndMoveToNextScene()
    {
        yield return new WaitForSeconds(videoDuration);
        SceneManager.LoadScene(1);
    }


    public void SkipIntro(InputAction.CallbackContext callbackContext)
    {
        SceneManager.LoadScene(1);
    }
}
