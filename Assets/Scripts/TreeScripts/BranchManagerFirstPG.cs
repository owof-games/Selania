using UnityEngine;
using Ink.Runtime;
using UnityEngine.UI;

public class BranchManagerFirstPG : MonoBehaviour
{

[SerializeField] DialogueManagerSingleInk dialogueManager; //qui su unity gli associo il dialogue
[SerializeField] Image immagineBranch; //Questa cosa la imposto da editor, ed è l'immagine della prima personaggia
[SerializeField] Sprite LIndeciso;
[SerializeField] Sprite IlGiocoso;
[SerializeField] Sprite StatoDue;
[SerializeField] Sprite StatoTre;
[SerializeField] Sprite StatoQuattro;
[SerializeField] Sprite StatoCinque;
[SerializeField] Sprite StatoSei;




    // Update is called once per frame
    void Update()
    {
        StatoFinalePersonagge();
    }

    

    private void StatoFinalePersonagge()
    //Chiamo poi in ogni update
    {
        //Chiamare il dialogue manager e fargli eseguire questa riga di codice
        var statoFinale = dialogueManager.GetEffettivoStatoPGUno();
        if (statoFinale.ContainsItemNamed("LIndeciso"))
        {
            //Debug.Log(statoFinale);
            immagineBranch.sprite = LIndeciso;
        }
        else if (statoFinale.ContainsItemNamed("IlGiocoso"))
        {
            immagineBranch.sprite = IlGiocoso;
        }
    }
}
