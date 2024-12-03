using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using Ink.Parsed;

public class DialogueTrigger : MonoBehaviour
//Per creare il dialogue trigger, ovvero la possibilità di capire se è il caso o meno di far partire una conversazione, accorpiamo prima tutta la parte di riconoscimento della vicinanza del player e poi la parte di interazione, e quindi carichiamo da qui la storia da INK.
//Valutare se poi togliere spostamenti e trigger in movimento a favore di un clicca e bona.

{
    [Header("Visual Cue")]
    [SerializeField] private GameObject visualCue;

    [Header("Ink JSON")]
    [SerializeField] private TextAsset inkJson;
    private bool playerInRange;
    

    private void Awake()
    
        {
            //All'avvio del gioco settiamo su falsa la vicinanza della PG e il visualCue dell'oggetto che si porterà questo script
            playerInRange = false;
            visualCue.SetActive(false);

        }

    private void Update()
        {
            
            if (playerInRange)
                {
                    visualCue.SetActive(true);
                    //Mi sa che alla base base è questa la cosa che mi serve.
                    if (InputManager.GetInstance().GetInteractPressed())
                        {
                            Debug.Log(inkJson.text);
                        }
                }

            else
                {
                    visualCue.SetActive(false);
                }

        }    
        


    //Con questa funzione diciamo al gioco cosa fare quando il collider di questo oggetto entra in contatto con un altro collider
    private void OnTriggerEnter2D(Collider2D collider)
        {
            if(collider.gameObject.tag == "Player")
                {
                    playerInRange = true;
                }
        }

    //Con questa funzione diciamo al gioco cosa fare quando il collider di questo oggetto esce dal contatto con un altro collider
    private void OnTriggerExit2D(Collider2D collider)
        {
            if(collider.gameObject.tag == "Player")
                {
                    playerInRange = false;
                }
        }
   
}
