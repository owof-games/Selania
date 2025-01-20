using UnityEngine;
using Ink.Runtime;
using UnityEngine.UI;
using Debug = UnityEngine.Debug;


public class CantoDelleCompagne : MonoBehaviour
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
        var step = dialogueManager.GetEffettivoStatoCantoDelleCompagne();
        if (step.ContainsItemNamed("StepVuoto"))
        {
            Debug.Log(step);
            image.sprite = StepVuoto;
        }
        else if (step.ContainsItemNamed("StepZero"))

        {   Debug.Log(step);
            image.sprite = StepZero;
        }
        else if (step.ContainsItemNamed("StepUno"))

        {   Debug.Log(step);
            image.sprite = StepUno;
        }
        else if (step.ContainsItemNamed("StepDue"))
        {   
            Debug.Log(step);
            image.sprite = StepDue;
        }
        else if (step.ContainsItemNamed("StepTre"))
        {
            Debug.Log(step);
            image.sprite = StepTre;
        }
    }
}
