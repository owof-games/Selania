using UnityEngine;
using Ink.Runtime;
using UnityEngine.UI;

public class NonTiScordarDiTe : MonoBehaviour
{
[SerializeField] DialogueManagerSingleInk dialogueManager; //qui su unity gli associo il dialogue
[SerializeField] Image image; //Questa cosa la imposto da editor, ed è l'immagine della prima personaggia
[SerializeField] Sprite StepVuoto;
[SerializeField] Sprite StepZero;
[SerializeField] Sprite StepUno;
[SerializeField] Sprite StepDue;
[SerializeField] Sprite StepTre;


    // Update is called once per frame
    void Update()
    {
        StatoColtivabile();
        
    }

    

    private void StatoColtivabile()
    //Chiamo poi in ogni update
    {
        //Chiamare il dialogue manager e fargli eseguire questa riga di codice
        var step = dialogueManager.GetEffettivoStatoNonTiScordarDiTe();
        if (step.ContainsItemNamed("stepVuoto"))
        {
            image.sprite = StepVuoto;
        }
        else if (step.ContainsItemNamed("stepZero"))

        {   
            image.sprite = StepZero;
        }
        else if (step.ContainsItemNamed("stepUno"))

        {   
            image.sprite = StepUno;
        }
        else if (step.ContainsItemNamed("stepDue"))
        {   
           
            image.sprite = StepDue;
        }
        else if (step.ContainsItemNamed("stepTre"))
        {
            
            image.sprite = StepTre;
        }
    }
}
