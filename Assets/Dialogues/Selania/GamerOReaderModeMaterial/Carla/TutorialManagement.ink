VAR tutorial_ActivateTutorial = true


//Valori per decidere quanti storylets in meno rispetto a quelli per arrivare alla riscrittura servono per attivare il tutorial
VAR tutorial_rereadingValueActivator = 8

//Variabili per attivare il tutorial
VAR tutorial_rereadingActive = false


=== on_movement_tutorial_steps ===
//Prima di tutto vedo se attivare o meno le variabili legate al livello di rapporto con l3 PNG
//Tutorial riscrittura Carla

{
    - (firstChar_storyletsForRewritingCount + secondChar_storyletsForRewritingCount + thirdChar_storyletsForRewritingCount >=  tutorial_rereadingValueActivator) && not tutorial_rereadingStorylet:
            ~ tutorial_rereadingActive = true
          
}


//Poi faccio il dispatch dei vari elementi del tutorial. Se Carla è attiva, deve parlare sempre PRIMA di mentore

{
    - are_two_entities_together(PG, Carla) && not tutorial_choicesRelationshipStorylet:
        -> tutorial_choicesRelationshipStorylet

    - are_two_entities_together(PG, Carla) && tutorial_rereadingActive && not tutorial_rereadingStorylet:
        -> tutorial_rereadingStorylet   

}

//E un check per Mentore
{

    //Relazioni e inchiostro
    - are_two_entities_together(PG, Mentor) && not you_are_a_rewriter:

        {   

            //Se il tutorial è attivo, ho raggiunto le condizioni, e Carla mi ha spiegato come funzionano le relazioni:
            - tutorial_ActivateTutorial == true && tutorial_choicesRelationshipStorylet:
                -> you_are_a_rewriter

            //Se il tutorial non è attivo:    
            - tutorial_ActivateTutorial == false:
                -> you_are_a_rewriter

            - else:
                ->->    
            
        }
        
    //Riscrittura e inchiostro
    - are_two_entities_together(PG, Mentor) && tutorial_rereadingActive && not ink_and_rewriting:

        {   
            //Se il tutorial è attivo, ho raggiunto le condizioni, ma ancora Carla non mi ha spiegato come funzionano le relazioni:
            - tutorial_ActivateTutorial == true && not tutorial_greenhouseGiftsInkStorylet:
                ->->

            //Se il tutorial è attivo, ho raggiunto le condizioni, e Carla non mi ha spiegato come funzionano le relazioni:
            -tutorial_ActivateTutorial == true && tutorial_greenhouseGiftsInkStorylet:
                -> ink_and_rewriting

            //Se il tutorial non è attivo:    
            - else:
                -> ink_and_rewriting
            
        }

}


->->