using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class AnalyticsConsent : MonoBehaviour
{
    [SerializeField] private Toggle toggle;
    [SerializeField] private string nextSceneName = "Intro";

    private void Start()
    {
        AnalyticsManager.IsEnabled = toggle.isOn;
    }

    public void OnConsentChange(bool consent)
    {
        AnalyticsManager.IsEnabled = consent;
    }

    public void GoToIntro()
    {
        SceneManager.LoadScene(nextSceneName);
    }
}