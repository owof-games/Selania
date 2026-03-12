=== talking_Carla ===
    + {are_two_entities_together(Carla, PG)} [Carla]
                -> questions_Carla


=== questions_Carla
        {~ Frasina shuffle di Carla|Altra frasina di Carla}#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored

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

        + Sbloccami tutti i sigilli.
                -> glyph_open_all_sigils ->
        Dopo l'operazione, glyph_discoveredSigils = {LIST_COUNT(glyph_discoveredSigils)}
                -> questions_Carla
                
        + No, ho cambiato idea
                -> main
        -


-> main