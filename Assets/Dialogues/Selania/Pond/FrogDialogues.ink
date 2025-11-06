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
                }
                
                
                //Prima verifico se ci sono missioni attive e nel caso offro il reminder.
                -> closed_mission_verify ->
                //Altrimenti aggiorno la lista delle cose fatte in autonomia e poi procedo.
                -> discovered_things_updater ->


- (top)
Qui la rana ci saluta.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
      
      + Vorrei chiederti un aiuto.
        -

    {
        -  (firstStory == StoryStarted && ((firstGift == () && charOneGifts hasnt charOneCultivable) or (!ending_cooking_with_first_char && charOneGifts hasnt charOneCooking) or (playerAccessiblePlaces has Nest && charOneGifts hasnt charOneEmotionalWord) or (playerAccessiblePlaces has Library && charOneGifts hasnt charOneLibrary))) or (secondStory == StoryStarted && ((secondGift == () && charTwoGifts hasnt charTwoCultivable) or (!ending_cooking_with_second_char && charTwoGifts hasnt charTwoCooking) or (playerAccessiblePlaces has Nest && charTwoGifts hasnt charTwoEmotionalWord) or (playerAccessiblePlaces has Library && charTwoGifts hasnt charTwoLibrary)) or (firstGift !=() or secondGift !=() or fourthIngredientNameFirstCharacter !=() or fourthIngredientNameSecondCharacter != ()) or (availableSpecialMissions != () && playerAccessiblePlaces has Kitchen && playerAccessiblePlaces has Nest)):
            Certo!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                -> autonomy_mission_verify
        
        - LIST_COUNT(charOneGifts) == 4 && LIST_COUNT(charTwoGifts) == 4 && availableSpecialMissions == ():
            Ti ho aiutato come potevo, {name}. Ora è tutto nelle tue mani#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                -> main
        
        - else:
            Per ora non ho niente da darti, ma torna più avanti!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                -> main
    }




=== frog_about_who_questions
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
Quindi, come posso aiutarti? #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral

- (top)
    
    + {firstStory == StoryStarted} [Ho bisogno di una mano con Chitarra.]
        ~  currentMissionAboutChar = missionCharOne
  
        {
            - LIST_COUNT(charOneGifts) == 4:
                Temo tu sappia già tutto su questo personaggio#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                {debug: la quantità di doni di PNGUno è {LIST_COUNT(charOneGifts)},}
                        -> top
            - else:
                {
                    - (firstGift == () && charOneGifts hasnt charOneCultivable) or (!ending_cooking_with_first_char && charOneGifts hasnt charOneCooking) or (playerAccessiblePlaces has Nest && charOneGifts hasnt charOneEmotionalWord) or (playerAccessiblePlaces has Library && charOneGifts hasnt charOneLibrary):
                        La rana ha qualcosa di utile da donarti#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        -> frog_gift_dispatcher
                    
                    - else:
                        Per ora la rana non può aiutarti con {charNameOne}, ma ti consiglia di tornare più avanti.
                            -> top
                }
                
        }
            
        
    
    + {secondStory == StoryStarted} [Ho bisogno di una mano con Riccio.]
        ~  currentMissionAboutChar = missionCharTwo
        {
            - LIST_COUNT(charTwoGifts) == 4:
                Temo tu sappia già tutto su questo personaggio#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                {debug: la quantità di doni di PNGDue è {LIST_COUNT(charTwoGifts)},}
                        -> top
            - else:
                {
                    - (secondGift == () && charTwoGifts hasnt charTwoCultivable) or (!ending_cooking_with_second_char && charTwoGifts hasnt charTwoCooking) or (playerAccessiblePlaces has Nest && charTwoGifts hasnt charTwoEmotionalWord) or (playerAccessiblePlaces has Library && charTwoGifts hasnt charTwoLibrary):
                        La rana ha qualcosa di utile da donarti#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        -> frog_gift_dispatcher
                    
                    - else:
                        Per ora la rana non può aiutarti con {charNameTwo}, ma ti consiglia di tornare più avanti.
                            -> top
                }
                
        }
        
    
    + {thirdStory == StoryStarted} [PNG 3]
        ~  currentMissionAboutChar = missionCharThree
            -> frog_gift_dispatcher
        
    + {fourthStory == StoryStarted} [PNG 4]
        ~  currentMissionAboutChar = missionCharFour
            -> frog_gift_dispatcher
        
    + {fifthStory == StoryStarted} [PNG 5 (non come mentore)]
        ~  currentMissionAboutChar = missionCharFive
            -> frog_gift_dispatcher
        
    
    + {firstGift !=() or secondGift !=() or fourthIngredientNameFirstCharacter !=() or fourthIngredientNameSecondCharacter != ()}[Ho bisogno di recuperare una pianta che ho utilizzato.]
        //Nota: per ora sono quattro massimi gli utilizzi di un coltivabile, per cui non serve un menu ad hoc. Poi capire come fare.
            -> cultivable_recovery
    
    + [Ho cambiato idea.]
        -> main
    -

->->
