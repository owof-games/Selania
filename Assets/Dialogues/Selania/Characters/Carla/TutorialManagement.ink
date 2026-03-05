VAR tutorial_ActivateTutorial = true

//I tutorial saranno: all'inizio in stazione, per spiegare il flusso di gioco in generale (relazione, scelte, inchiostro, rilettura). Alla serra per spiegare il discorso dei doni. In cucina per spiegare come funziona. Al nido per spiegare come funziona.
//I tutorial partono in automatico appena si presenta l'occasione giusta (primo dialogo, accesso al luogo che scatena il discorso a parte forse la cucina, che serve farlo prima).
//Quando le parliamo possiamo anche riavere una spiegazione di qualcosa che abbiamo già incontrato.

LIST tutorial_allTutorialSteps = tutorialChoices, tutorialRelationship, tutorialInk, tutorialRereading, tutorialGreenhouse, tutorialKitchen, tutorialNest

//Valori per decidere quanti storylets in meno rispetto a quelli per arrivare alla riscrittura servono per attivare il tutorial
VAR tutorial_relationshipValueActivator = 4
VAR tutorial_inkValueActivator = 6
VAR tutorial_rereadingValueActivator = 8

//Variabili per attivare il tutorial
VAR tutorial_relationshipActive = false
VAR tutorial_inkActive = false
VAR tutorial_rereadingActive = false


=== on_movement_tutorial_steps ===
//Prima di tutto vedo se attivare o meno le variabili legate al livello di rapporto con l3 PNG
//Tutorial relazioni Carla
{
    - (firstChar_storyletsForRewritingCount + secondChar_storyletsForRewritingCount + thirdChar_storyletsForRewritingCount >= tutorial_relationshipValueActivator) && tutorial_allTutorialSteps hasnt tutorialRelationship:
            ~ tutorial_relationshipActive = true        
}

//Tutorial inchiostro Carla

{
    - (firstChar_storyletsForRewritingCount + secondChar_storyletsForRewritingCount + thirdChar_storyletsForRewritingCount >=  tutorial_inkValueActivator) && tutorial_allTutorialSteps hasnt tutorialInk:
            ~ tutorial_inkActive = true
           
}

//Tutorial riscrittura Carla

{
    - (firstChar_storyletsForRewritingCount + secondChar_storyletsForRewritingCount + thirdChar_storyletsForRewritingCount >=  tutorial_rereadingValueActivator) && tutorial_allTutorialSteps hasnt tutorialRereading:
            ~ tutorial_rereadingActive = true
          
}


//Poi faccio il dispatch dei vari elementi del tutorial. Se Carla è attiva, deve parlare sempre PRIMA di mentore

{
    - are_two_entities_together(PG, Carla) && not tutorial_choicesStorylet:
        -> tutorial_choicesStorylet
    
    - are_two_entities_together(PG, Carla) && tutorial_relationshipActive && not tutorial_relationshipStorylet:
        -> tutorial_relationshipStorylet

    - are_two_entities_together(PG, Carla) && tutorial_inkActive && not tutorial_inkStorylet:
        -> tutorial_inkStorylet

    - are_two_entities_together(PG, Carla) && tutorial_rereadingActive && not tutorial_rereadingStorylet:
        -> tutorial_rereadingStorylet   

}

//E un check per Mentore
{

    //Relazioni e inchiostro
    - are_two_entities_together(PG, Mentor) && tutorial_relationshipActive && not you_are_a_rewriter:

        {   
            //Se il tutorial è attivo, ho raggiunto le condizioni, ma ancora Carla non mi ha spiegato come funzionano le relazioni:
            - tutorial_ActivateTutorial == true && tutorial_allTutorialSteps hasnt tutorialRelationship:
                ->->

            //Se il tutorial è attivo, ho raggiunto le condizioni, e Carla non mi ha spiegato come funzionano le relazioni:
            -tutorial_ActivateTutorial == true && tutorial_allTutorialSteps has tutorialRelationship:
                -> you_are_a_rewriter

            //Se il tutorial non è attivo:    
            - else:
                -> you_are_a_rewriter
            
        }
        
    //Riscrittura e inchiostro
    - are_two_entities_together(PG, Mentor) && tutorial_rereadingActive && not ink_and_rewriting:

        {   
            //Se il tutorial è attivo, ho raggiunto le condizioni, ma ancora Carla non mi ha spiegato come funzionano le relazioni:
            - tutorial_ActivateTutorial == true && tutorial_allTutorialSteps hasnt tutorialRereading:
                ->->

            //Se il tutorial è attivo, ho raggiunto le condizioni, e Carla non mi ha spiegato come funzionano le relazioni:
            -tutorial_ActivateTutorial == true && tutorial_allTutorialSteps has tutorialRereading:
                -> ink_and_rewriting

            //Se il tutorial non è attivo:    
            - else:
                -> ink_and_rewriting
            
        }

}


->->