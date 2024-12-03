using UnityEngine;

public class PlayerController : MonoBehaviour
{
    public float speed = 1.0f;
    private float horizontalInput;
    private float interactInput;

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
