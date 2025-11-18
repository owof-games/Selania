using UnityEngine;

public class AudioPanScript : MonoBehaviour

{
    public AudioSource audioSource; 
    public float targetPan = 0f;     // Il valore verso cui vuoi andare (-1 sinistra, 1 destra)
    public float speed = 1f;         // Velocità della transizione

    void Start()
    {
        if (audioSource == null)
            audioSource = GetComponent<AudioSource>();
    }

    void Update()
    {
        if (audioSource != null)
        {
            audioSource.panStereo = Mathf.PingPong(Time.time * speed, 2f) - 1f;

        }
    }
}