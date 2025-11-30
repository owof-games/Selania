using UnityEngine;
using UnityEngine.UI;

public class OpenLink : MonoBehaviour
{
    [SerializeField] private string url;
    [SerializeField] private Button button;

#if UNITY_EDITOR
    private void OnValidate()
    {
        if (button == null)
            button = GetComponent<Button>();
    }
#endif

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        if (string.IsNullOrEmpty(url))
        {
            Debug.LogError("Missing URL for OpenLink", this);
        }

        button.onClick.AddListener(OnClick);
    }

    private void OnClick()
    {
        Application.OpenURL(url);
    }
}