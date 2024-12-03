using UnityEngine;

public class PlayerController : MonoBehaviour
{
    public float speed = 10.0f;
    //Variabile che andrò a settare per gestire lo spostamento laterale del personaggio
    private float horizontalInput;
    //Variabile che andrò a settare per gestire le interazioni (click) nello spazio

    // Start is called once before the first execution of Update after the MonoBehaviour is created
        void Start()
        {
            
        }

    // Update is called once per frame
        void Update()
        {
            horizontalInput = Input.GetAxis("Horizontal");
            transform.Translate(Vector2.right * Time.deltaTime * horizontalInput * speed);

        }
}
