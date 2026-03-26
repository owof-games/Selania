VAR tutorial_ActivateTutorial = true
VAR tutorial_CarlaRelationshipIndicator = 0


//Valori per decidere quanti storylets in meno rispetto a quelli per arrivare alla riscrittura servono per attivare il tutorial
VAR tutorial_rereadingValueActivator = 8

//Variabili per attivare il tutorial
VAR tutorial_rereadingActive = false


=== on_movement_tutorial_steps ===
//Prima di tutto vedo se attivare o meno le variabili legate al livello di rapporto con l3 PNG

    {
        - (firstChar_storyletsForRewritingCount + secondChar_storyletsForRewritingCount + thirdChar_storyletsForRewritingCount >=  tutorial_rereadingValueActivator) && not tutorial_carlaRereadingStorylet:
                ~ tutorial_rereadingActive = true
            
    }


//Poi faccio il dispatch dei vari elementi del tutorial. Se Carla è attiva, deve parlare sempre PRIMA di mentore
//Tutti i tutorial di Carla passano da qui, a parte quello sui sigilli, che va sbloccato subito dopo aver parlato con Boccale

{
    - are_two_entities_together(PG, Carla) && not tutorial_carlaChoicesRelationshipStorylet:
        -> tutorial_carlaChoicesRelationshipStorylet

    //questa è una posizione temporanea, poi faremo in modo di farlo partire all'avvio del gioco.
    // - are_two_entities_together(PG, Carla)  && entity_location(PG) == Forest && not tutorial_carlaInterfaceStorylets:
    //     -> tutorial_carlaInterfaceStorylets

    - are_two_entities_together(PG, Carla) && tutorial_rereadingActive && not tutorial_carlaRereadingStorylet:
        -> tutorial_carlaRereadingStorylet

    //parte dopo che mi è stato dato il libro da Mentore
    - are_two_entities_together(PG, Carla) && tutorial_mentorTalkingChoiceRelationship && not tutorial_carlaGrimoireStorylet:
        -> tutorial_carlaGrimoireStorylet        

    - tutorial_ActivateTutorial == true && entity_location(PG) == Greenhouse && not tutorial_carlaGreenhouseGiftsInkStorylet:
            -> tutorial_carlaGreenhouseGiftsInkStorylet

    - tutorial_ActivateTutorial == true && entity_location(PG) == Kitchen && not tutorial_carlaKitchenStorylet:
            -> tutorial_carlaKitchenStorylet

    - tutorial_ActivateTutorial == true && entity_location(PG) == Nest && not tutorial_carlaNestStorylet:
            -> tutorial_carlaNestStorylet

}

//E un check per Mentore
{

    //Relazioni e inchiostro
    - are_two_entities_together(PG, Mentor) && not tutorial_mentorInkAndYouAreARewriter:

        {   

            //Se il tutorial è attivo, ho raggiunto le condizioni, e Carla mi ha spiegato come funzionano le relazioni:
            - tutorial_ActivateTutorial == true && tutorial_carlaChoicesRelationshipStorylet:
                -> tutorial_mentorInkAndYouAreARewriter

            //Se il tutorial non è attivo:    
            - tutorial_ActivateTutorial == false && backpack_findedGifts != ():
                -> tutorial_mentorInkAndYouAreARewriter

            - else:
                ->->    
            
        }
        
    //Riscrittura e inchiostro
    - are_two_entities_together(PG, Mentor) && tutorial_rereadingActive && not tutorial_mentorInkAndRewriting:

        {   
            //Se il tutorial è attivo, ho raggiunto le condizioni, ma ancora Carla non mi ha spiegato come funzionano le relazioni:
            - tutorial_ActivateTutorial == true && not tutorial_carlaGreenhouseGiftsInkStorylet:
                ->->

            //Se il tutorial è attivo, ho raggiunto le condizioni, e Carla non mi ha spiegato come funzionano le relazioni:
            -tutorial_ActivateTutorial == true && tutorial_carlaGreenhouseGiftsInkStorylet:
                -> tutorial_mentorInkAndRewriting

            //Se il tutorial non è attivo, mi affido a tutorial_rereadingActive:
            - tutorial_ActivateTutorial == false && tutorial_rereadingActive == true:
                -> tutorial_mentorInkAndRewriting
            
        }

}


//E uno per la strega
{
    - are_two_entities_together(TheWitch, PG) && entity_location(PG) == Dump && witch_intro && tutorial_mentorTalkingChoiceRelationship && not tutorial_witchRelationship:
        -> tutorial_witchRelationship

    - are_two_entities_together(TheWitch, PG) && entity_location(PG) == Dump && player_accessiblePlaces has Nest && tutorial_witchRelationship && not tutorial_witchSigils:
        -> tutorial_witchSigils

}

->->