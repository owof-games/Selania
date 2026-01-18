using UnityEngine;
using Ink.Runtime;
using UnityEngine.UI;


public class LicheneDegliAbissi : MonoBehaviour
{
[SerializeField] DialogueManagerSingleInk dialogueManager; //qui su unity gli associo il dialogue
[SerializeField] Image image; //Questa cosa la imposto da editor, ed è l'immagine della prima personaggia
[SerializeField] Sprite NotStarted;
[SerializeField] Sprite StepZero;
[SerializeField] Sprite StepOne;
[SerializeField] Sprite StepTwo;
[SerializeField] Sprite StepThree;


    // Update is called once per frame
    void Update()
    {
        CultivableState();
        
    }

    

    private void CultivableState()
    //Chiamo poi in ogni update
    {
        //Chiamare il dialogue manager e fargli eseguire questa riga di codice
        var step = dialogueManager.GetEffettivoStatoLicheneDegliAbissi();
        if (step.ContainsItemNamed("notStarted"))
        {
            image.sprite = NotStarted;
        }
        else if (step.ContainsItemNamed("stepZero"))

        {   
            image.sprite = StepZero;
        }
        else if (step.ContainsItemNamed("stepOne"))

        {   
            image.sprite = StepOne;
        }
        else if (step.ContainsItemNamed("stepTwo"))
        {   
           
            image.sprite = StepTwo;
        }
        else if (step.ContainsItemNamed("stepThree"))
        {
            
            image.sprite = StepThree;
        }
    }
}
