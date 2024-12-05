using UnityEngine;
using TMPro;
using Ink.Runtime;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.EventSystems;


public class ObjectFound : MonoBehaviour
{
    [Header("Dialogue UI")]
    [SerializeField] private GameObject infoPanel;
    [SerializeField] private TextMeshProUGUI infoText;

    public bool objectFound = false;

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        objectFound = false;
        infoPanel.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        if(objectFound == false)
        {
            infoPanel.SetActive(false);
        }
        else
        {   infoPanel.SetActive(true);
            infoText.text = "Hai trovato un oggetto!";
            //ci serve qualcosa per cui "onClick" setti objectFound su false e quindi si disattivi il pannello
        }
    }


}   
