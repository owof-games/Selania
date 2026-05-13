LIST tutorial_allCarlaTutorials = tutorialChoicesRelationship, tutorialRereading, tutorialInterface, tutorialGrimoire, tutorialGreenhouse, tutorialKitchen, tutorialNest, tutorialSigils

VAR tutorial_CarlaDiscoveredTutorials= ()

VAR tutorial_ActivateTutorial = true
VAR tutorial_CarlaRelationshipIndicator = 0


//Variabili per attivare i tutorial
VAR tutorial_inkActive = false
VAR tutorial_rereadingActive = false


=== on_movement_tutorial_steps ===
//Prima di tutto vedo se attivare o meno le variabili legate al livello di rapporto con l3 PNG

    //Tutorial inchiostro
    {
        - (grimoire_firstChar has grimFirstCharThree) or (grimoire_secondChar has grimSecondCharFour) or (grimoire_thirdChar has grimThirdCharThree):
                ~ tutorial_inkActive = true
    }

    //Tutorial riscrittura
    {
        - (grimoire_firstChar has grimFirstCharFive) or (grimoire_secondChar has grimSecondCharFive) or (grimoire_thirdChar has grimThirdCharFive):
                ~ tutorial_rereadingActive = true
    }

//Poi faccio il dispatch dei vari elementi del tutorial. Se Carla è attiva, deve parlare sempre PRIMA di mentore
//Tutti i tutorial di Carla passano da qui, a parte quello sui sigilli, che va sbloccato subito dopo aver parlato con Boccale

    {
        - are_two_entities_together(PG, Carla) && not tutorial_carlaChoicesRelationshipStorylet && settings_gamerMode == true:
            -> tutorial_carlaChoicesRelationshipStorylet

        //questa è una posizione temporanea, poi faremo in modo di farlo partire all'avvio del gioco.
        // - are_two_entities_together(PG, Carla)  && entity_location(PG) == Forest && not tutorial_carlaInterfaceStorylets && settings_gamerMode == true:
        //     -> tutorial_carlaInterfaceStorylets

        - are_two_entities_together(PG, Carla) && tutorial_rereadingActive == true && not tutorial_carlaRereadingStorylet && settings_gamerMode == true:
                -> tutorial_carlaRereadingStorylet

        //parte dopo che mi è stato dato il libro da Mentore
        - are_two_entities_together(PG, Carla) && grimoire_isEnabled == true && not tutorial_carlaGrimoireStorylet && settings_gamerMode == true:
                -> tutorial_carlaGrimoireStorylet        

        - tutorial_ActivateTutorial == true && entity_location(PG) == Greenhouse && not tutorial_carlaGreenhouseGiftsInkStorylet && settings_gamerMode == true:
                -> tutorial_carlaGreenhouseGiftsInkStorylet

        - tutorial_ActivateTutorial == true && entity_location(PG) == Kitchen && not tutorial_carlaKitchenStorylet && settings_gamerMode == true:
                -> tutorial_carlaKitchenStorylet

        - tutorial_ActivateTutorial == true && entity_location(PG) == Nest && not tutorial_carlaNestStorylet && settings_gamerMode == true:
                -> tutorial_carlaNestStorylet

    }

//E un check per Mentore
    {
        //Relazioni e inchiostro
        - are_two_entities_together(PG, Mentor) && tutorial_inkActive == true && grimoire_appendices has grimChoicesMentor && grimoire_appendices hasnt grimInkMentor:

            {   

                //Se il tutorial è attivo, ho raggiunto le condizioni, e Carla mi ha spiegato come funzionano le relazioni:
                - tutorial_ActivateTutorial == true && tutorial_carlaChoicesRelationshipStorylet:
                    -> tutorial_mentorInkAndYouAreARewriter

                //Se il tutorial non è attivo:    
                - tutorial_ActivateTutorial == false:
                    -> tutorial_mentorInkAndYouAreARewriter

                - else:
                    ->->
                
            }
            
        //Riscrittura e inchiostro
        - are_two_entities_together(PG, Mentor) && tutorial_rereadingActive == true && grimoire_appendices hasnt grimRewritingMentor:

            {   
                //Se il tutorial è attivo, ho raggiunto le condizioni, ma ancora Carla non mi ha spiegato come funzionano le relazioni:
                - tutorial_ActivateTutorial == true && not tutorial_carlaGreenhouseGiftsInkStorylet:
                    ->->

                //Se il tutorial è attivo, ho raggiunto le condizioni, e Carla non mi ha spiegato come funzionano le relazioni:
                -tutorial_ActivateTutorial == true && tutorial_carlaGreenhouseGiftsInkStorylet:
                    -> tutorial_mentorInkAndRewriting

                //Se il tutorial non è attivo, mi affido a tutorial_rereadingActive:
                - tutorial_ActivateTutorial == false
                    -> tutorial_mentorInkAndRewriting
                
            }

    }


//E uno per la strega
{
    - are_two_entities_together(TheWitch, PG) && entity_location(PG) == Dump && witch_intro && tutorial_mentorTalkingChoiceRelationship && grimoire_appendices hasnt grimChoicesWitch:
        -> tutorial_witchRelationship

    - are_two_entities_together(TheWitch, PG) && entity_location(PG) == Dump && player_accessiblePlaces has Nest && grimoire_appendices has grimChoicesWitch && grimoire_appendices hasnt grimSigilsWitch:
        -> tutorial_witchSigils

}

->->