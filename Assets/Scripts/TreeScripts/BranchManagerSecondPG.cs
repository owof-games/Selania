using UnityEngine;
using UnityEngine.UI;

public class BranchManagerSecondPG : MonoBehaviour
{

[SerializeField] DialogueManagerSingleInk dialogueManager; //qui su unity gli associo il dialogue
[SerializeField] Image immagineBranch; //Questa cosa la imposto da editor, ed è l'immagine della prima personaggia
[SerializeField] Sprite emptyStatus;
[SerializeField] Sprite blueStatus;
[SerializeField] Sprite purpleStatus;
[SerializeField] Sprite greenStatus;
[SerializeField] Sprite yellowStatus;
[SerializeField] Sprite redStatus;
[SerializeField] Sprite mixedStatus;




    // Update is called once per frame
    void Update()
    {
        PlayerStoryCheck();
    }

    

    private void PlayerStoryCheck()
    //Chiamo poi in ogni update
    {
        //Chiamare il dialogue manager e fargli eseguire questa riga di codice
        var statoFinale = dialogueManager.GetPlayerSecondStory();
        if (statoFinale.ContainsItemNamed("emptyStatus"))
        {
            //Debug.Log(statoFinale);
            immagineBranch.sprite = emptyStatus;
        }
        
        else if (statoFinale.ContainsItemNamed("blueStatus"))
        {
            immagineBranch.sprite = blueStatus;
        }
        
        else if (statoFinale.ContainsItemNamed("purpleStatus"))
        {
            immagineBranch.sprite = purpleStatus;
        }    
        
        else if (statoFinale.ContainsItemNamed("greenStatus"))
        {
            immagineBranch.sprite = greenStatus;
        }
        
        else if (statoFinale.ContainsItemNamed("yellowStatus"))
        {
            immagineBranch.sprite = yellowStatus;
        }  

        else if (statoFinale.ContainsItemNamed("redStatus"))
        {
            immagineBranch.sprite = redStatus;
        }
        
        else if (statoFinale.ContainsItemNamed("mixedStatus"))
        {
            immagineBranch.sprite = mixedStatus;
        }           
    }



}
