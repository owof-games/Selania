=== welcoming_frog
{frogDebug: passo da welcoming_frog.}
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
+ {are_two_entities_together(TheFrog, PG) or (debug_test_frog == true)} [TheFrog]

    {
        - welcoming_frog == 1:
            ~ somethingStrange ++
            ~ saturationVar ++
            ~ bookBGVariations ++
            ~ move_entity(bowl, Bedroom)
            ~ move_entity(waterLily, Bedroom)
            ~ move_entity(FrogRecap, BookPlace)
            La rana si presenta per la prima volta, e ci dice che è qui per aiutarci e aiutare questo posto.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    }
                
                
                //Prima verifico se ci sono missioni attive e nel caso offro il reminder.
                -> closed_mission_verify ->
                //Altrimenti aggiorno la lista delle cose fatte in autonomia e poi procedo.
                -> discovered_things_updater ->


- (top)
La rana ci saluta.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
      
      
      + [Me ne vado.]
        -> main
        
      + [Chiedo un aiuto alla rana.]

    {
        -  (firstStory == StoryStarted && ((firstGift == () && charOneGifts hasnt charOneCultivable) or (!ending_cooking_with_first_char && charOneGifts hasnt charOneCooking) or (playerAccessiblePlaces has Nest && charOneGifts hasnt charOneEmotionalWord) or (playerAccessiblePlaces has Library && charOneGifts hasnt charOneLibrary))) or (secondStory == StoryStarted && ((secondGift == () && charTwoGifts hasnt charTwoCultivable) or (!ending_cooking_with_second_char && charTwoGifts hasnt charTwoCooking) or (playerAccessiblePlaces has Nest && charTwoGifts hasnt charTwoEmotionalWord) or (playerAccessiblePlaces has Library && charTwoGifts hasnt charTwoLibrary)) or (firstGift !=() or secondGift !=() or fourthIngredientNameFirstCharacter !=() or fourthIngredientNameSecondCharacter != ()) or (availableSpecialMissions != () && playerAccessiblePlaces has Kitchen && playerAccessiblePlaces has Nest)):
            Ti aiuto con piacere!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                -> autonomy_mission_verify
        
        - LIST_COUNT(charOneGifts) == 4 && LIST_COUNT(charTwoGifts) == 4 && availableSpecialMissions == ():
            Non ho più niente da offrirti {name}. Ora è tutto nelle tue mani#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                -> main
        
        - else:
            Per ora non ho niente da darti, ma torna più avanti!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                -> main
    }





