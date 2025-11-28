=== welcoming_frog
{debug_frog: passo da welcoming_frog.}
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
+ {are_two_entities_together(TheFrog, PG) or (debug_testFrog == true)} [TheFrog]

    
                
                
                //Prima verifico se ci sono missioni attive e nel caso offro il reminder.
                -> closed_mission_verify ->
                //Altrimenti aggiorno la lista delle cose fatte in autonomia e poi procedo.
                -> discovered_things_updater ->


- (top)
    {
        - welcoming_frog.top == 1:
            ~ player_somethingStrange ++
            ~ saturationVar ++
            ~ book_BGVariations ++
            ~ move_entity(bowl, Bedroom)
            ~ move_entity(waterLily, Bedroom)
            ~ move_entity(FrogRecap, BookPlace)
            La rana si presenta per la prima volta, e ci dice che è qui per aiutarci e aiutare questo posto.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    }
    
La rana ci saluta.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
      
      
      + [Me ne vado.]
        -> main
        
      + [Chiedo un aiuto alla rana.]
      {debug_frog: il valore di frog_availableSpecialMissions è {frog_availableSpecialMissions}.}
      {debug_frog: player_accessiblePlaces contiene {player_accessiblePlaces}.}

    {       //Special mission one offre la nota
        - frog_pauseSpecialMission < 1 && (frog_availableSpecialMissions has specialMissionOne) && (player_accessiblePlaces ? Nest) && second_char_main_storylets.four:
            {debug_frog: condizioni rispettate per poter offrire la prima missione speciale.}
                -> special_mission_one
            
        - firstChar_storyStatus == story_storyStarted && firstChar_giftedObject == () && frog_firstCharObtainedGifts hasnt charOneCultivable:
            {debug_frog: condizioni rispettate per poter offrire info sul dono per Chitarra.}
                -> autonomy_mission_verify
        
            //Special mission two offre l'ingrediente universale
        - frog_pauseSpecialMission < 1 && (frog_availableSpecialMissions has specialMissionTwo) && (player_accessiblePlaces ? Kitchen):
            {debug_frog: condizioni rispettate per poter offrire la seconda missione speciale.}
                -> special_mission_two      
    
                
        - firstChar_storyStatus == story_storyStarted && !ending_cooking_with_first_char && frog_firstCharObtainedGifts hasnt charOneCooking:
            {debug_frog: condizioni rispettate per poter offrire info sull'ingrediente per Chitarra.}
                -> autonomy_mission_verify
                
        - firstChar_storyStatus == story_storyStarted && player_accessiblePlaces has Nest && frog_firstCharObtainedGifts hasnt charOneEmotionalWord:
            {debug_frog: condizioni rispettate per poter offrire info su parola per Chitarra.}
                -> autonomy_mission_verify
                
        - firstChar_storyStatus == story_storyStarted && player_accessiblePlaces has Library && frog_firstCharObtainedGifts hasnt charOneLibrary:
            {debug_frog: condizioni rispettate per poter offrire info su racconto per Chitarra.}
                -> autonomy_mission_verify
                
        - secondChar_storyStatus == story_storyStarted && secondChar_giftedObject == () && frog_secondCharObtainedGifts hasnt charTwoCultivable:
            {debug_frog: condizioni rispettate per poter offrire info sul dono per Riccio.}
                -> autonomy_mission_verify
                
        - secondChar_storyStatus == story_storyStarted && !ending_cooking_with_second_char && frog_secondCharObtainedGifts hasnt charTwoCooking:
            {debug_frog: condizioni rispettate per poter offrire info su ingrediente per Chitarra.}
                -> autonomy_mission_verify
                
        - secondChar_storyStatus == story_storyStarted && player_accessiblePlaces has Nest && frog_secondCharObtainedGifts hasnt charTwoEmotionalWord:
            {debug_frog: condizioni rispettate per poter offrire info sul dono per Chitarra.}
                -> autonomy_mission_verify
                
        - secondChar_storyStatus == story_storyStarted && player_accessiblePlaces has Library && frog_secondCharObtainedGifts hasnt charTwoLibrary:
            {debug_frog: condizioni rispettate per poter offrire info su parola per Chitarra.}
                -> autonomy_mission_verify
                
        - (frog_recoverableCultivables!= ()):
            {debug_frog: condizioni rispettate per poter offrire info su racconto per Chitarra.}
                -> autonomy_mission_verify
                
        - LIST_COUNT(frog_firstCharObtainedGifts) == 4 && LIST_COUNT(frog_secondCharObtainedGifts) == 4 && frog_availableSpecialMissions == ():
            Non ho più niente da offrirti {player_name}. Ora è tutto nelle tue mani#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                -> main
        
        - else:
            Per ora non ho niente da darti, ma torna più avanti!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                -> main
    }





