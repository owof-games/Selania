LIST tutorial_allCarlaTutorials = tutorialChoicesRelationship, tutorialRereading, tutorialInterface, tutorialGrimoire, tutorialGreenhouse, tutorialKitchen, tutorialNest, tutorialSigils

VAR tutorial_CarlaDiscoveredTutorials= ()

VAR tutorial_MentorTutorial = false
VAR tutorial_CarlaTutorial = false
VAR tutorial_CarlaRelationshipIndicator = 0


//Variabili per attivare i tutorial
VAR tutorial_inkActive = false
VAR tutorial_inkActive_requested = false
VAR tutorial_rereadingActive = false
VAR tutorial_choicesActive = false

//Gestione Carla
VAR tutorial_CarlaRelationshipIndicator_enabled = false
VAR tutorial_CarlaInkIndicator = ink_empty


=== on_movement_tutorial_steps ===
//Prima di tutto vedo se attivare o meno le variabili legate al livello di rapporto con lə PNG

    //Tutorial scelte (per Mentore). Basta aver parlato una volta con Chitarra
    {
        - grimoire_firstChar != ():
                ~ tutorial_choicesActive = true
    }
    //Tutorial inchiostro e dono
    {
        - (grimoire_firstChar has grimFirstCharThree) or (grimoire_secondChar has grimSecondCharFour) or (grimoire_thirdChar has grimThirdCharThree):
                ~ tutorial_inkActive = true
        //Serve anche un'altra condizione per cui io cerco di fare il dono, e mi viene detto che devo parlare con Mentore o Carla, e a questo punto tutorial_inkActive diventa vero.
        
        - tutorial_inkActive_requested == true:
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
        - are_two_entities_together(PG, Carla) && tutorial_CarlaDiscoveredTutorials hasnt tutorialChoicesRelationship && tutorial_CarlaTutorial == true:
                -> tutorial_carlaChoicesRelationshipStorylet

        - are_two_entities_together(PG, Carla)  && entity_location(PG) == Bedroom && tutorial_CarlaDiscoveredTutorials hasnt tutorialInterface:
                -> tutorial_carlaInterfaceStorylets

        - are_two_entities_together(PG, Carla) && tutorial_rereadingActive == true && tutorial_CarlaDiscoveredTutorials hasnt tutorialRereading && tutorial_CarlaTutorial == true:
                -> tutorial_carlaRereadingStorylet

        //parte dopo che mi è stato dato il libro da Mentore
        - are_two_entities_together(PG, Carla) && grimoire_isEnabled == true && tutorial_CarlaDiscoveredTutorials has tutorialGrimoire && tutorial_CarlaTutorial == true:
                -> tutorial_carlaGrimoireStorylet        

        - tutorial_CarlaTutorial == true && entity_location(PG) == Greenhouse && tutorial_CarlaDiscoveredTutorials hasnt tutorialGreenhouse && tutorial_CarlaTutorial == true:
                -> tutorial_carlaGreenhouseGiftsInkStorylet

        - tutorial_CarlaTutorial == true && entity_location(PG) == Kitchen && tutorial_CarlaDiscoveredTutorials hasnt tutorialKitchen && tutorial_CarlaTutorial == true:
                -> tutorial_carlaKitchenStorylet

        - tutorial_CarlaTutorial == true && entity_location(PG) == Nest && tutorial_CarlaDiscoveredTutorials hasnt tutorialNest && tutorial_CarlaTutorial == true:
                -> tutorial_carlaNestStorylet

    }

//E un check per Mentore: i tutorial partiranno solo se tutorial_MentorTutorial == true:
//C'è una parte commentata perché prima Mentore aspettava i commenti di Carla per proporre tutorial, ma ora credo abbia senso che sia autonoma.
    {
        //Come funzionano le chiacchierate
        - are_two_entities_together(PG, Mentor) && tutorial_choicesActive == true && grimoire_appendices hasnt grimChoicesMentor && tutorial_MentorTutorial == true:

                -> tutorial_mentorTalkingChoiceRelationship


            // {   

            //     //Se il tutorial di Carla è attivo, ho raggiunto le condizioni, e Carla mi ha spiegato come funzionano le relazioni:
            //     - tutorial_CarlaTutorial == true && tutorial_CarlaDiscoveredTutorials has tutorialChoicesRelationship:
            //         -> tutorial_mentorTalkingChoiceRelationship

            //     //Se il tutorial di Carla non è attivo:    
            //     - tutorial_CarlaTutorial == false:
            //         -> tutorial_mentorTalkingChoiceRelationship

            //     - else:
            //         ->->
                
            // }

        //Relazioni e inchiostro
        - are_two_entities_together(PG, Mentor) && tutorial_inkActive == true && grimoire_appendices has grimChoicesMentor && grimoire_appendices hasnt grimInkMentor && tutorial_MentorTutorial == true:

                -> tutorial_mentorInkAndYouAreARewriter

            // {   

            //     //Se il tutorial di Carla è attivo, ho raggiunto le condizioni, e Carla mi ha spiegato come funzionano le relazioni:
            //     - tutorial_CarlaTutorial == true && tutorial_CarlaDiscoveredTutorials has tutorialChoicesRelationship:
            //         -> tutorial_mentorInkAndYouAreARewriter

            //     //Se il tutorial di Carla non è attivo:    
            //     - tutorial_CarlaTutorial == false:
            //         -> tutorial_mentorInkAndYouAreARewriter

            //     - else:
            //         ->->
                
            // }
            
        //Riscrittura e inchiostro
        - are_two_entities_together(PG, Mentor) && tutorial_rereadingActive == true && grimoire_appendices hasnt grimRewritingMentor && tutorial_MentorTutorial == true:

                -> tutorial_mentorInkAndRewriting

            // {   
            //     //Se il tutorial di Carla è attivo, ho raggiunto le condizioni, ma ancora Carla non mi ha spiegato come funziona la gestione dell'inchiostro:
            //     - tutorial_CarlaTutorial == true && tutorial_CarlaDiscoveredTutorials hasnt tutorialGreenhouse:
            //         ->->

            //     //Se il tutorial di Carla è attivo, ho raggiunto le condizioni, e Carla non mi ha spiegato come funziona la gestione dell'inchiostro:
            //     -tutorial_CarlaTutorial == true && tutorial_CarlaDiscoveredTutorials has tutorialGreenhouse:
            //         -> tutorial_mentorInkAndRewriting

            //     //Se il tutorial di Carla non è attivo, mi affido a tutorial_rereadingActive:
            //     - tutorial_CarlaTutorial == false
            //         -> tutorial_mentorInkAndRewriting
                
            // }

    }


//E uno per la strega
{
    - are_two_entities_together(TheWitch, PG) && entity_location(PG) == Dump && grimoire_witch has grimWitchIntro && grimoire_fifthChar has grimMentorIntro && grimoire_witch hasnt grimChoicesWitch:
        -> tutorial_witchRelationship

    - are_two_entities_together(TheWitch, PG) && entity_location(PG) == Dump && player_accessiblePlaces has Nest && grimoire_witch has grimChoicesWitch && grimoire_witch hasnt grimSigilsWitch:
        -> tutorial_witchSigils

}

->->