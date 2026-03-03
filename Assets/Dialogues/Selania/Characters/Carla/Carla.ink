=== talking_Carla ===
    + {are_two_entities_together(Carla, PG)} [Carla]
                -> questions_Carla


=== questions_Carla
        {~ Frasina shuffle di Carla|Altra frasina di Carla}

    + {tutorial_allTutorialSteps has tutorialChoices} Mi rispiegheresti il discorso delle scelte?
            -> tutorial_choicesStorylet -> questions_Carla
    
    + {tutorial_allTutorialSteps has tutorialRelationship} Non è che mi ridici quella roba delle relazioni?
            -> tutorial_relationshipStorylet -> questions_Carla
    
    + {tutorial_allTutorialSteps has tutorialInk} Non ho capito bene la cosa dell'inchiostro.
            -> tutorial_inkStorylet -> questions_Carla
    
    + {tutorial_allTutorialSteps has tutorialRereading} Com'era quella cosa della rilettura?
            -> tutorial_rereadingStorylet -> questions_Carla
   
    + {tutorial_greenhouseStorylet} Ma quindi cosa devo fare con le piante?
            -> tutorial_greenhouseStorylet -> questions_Carla
   
    + {tutorial_kitchenStorylet} Ho bisogno che mi rispieghi la faccenda della cucina.
            -> tutorial_kitchenStorylet -> questions_Carla
    
    + {tutorial_nestStorylet} Quindi, con quelle pietre sulla spiaggia che ci devo fare?
            -> tutorial_nestStorylet -> questions_Carla
   
    + No, ho cambiato idea
            -> main
    -


-> main