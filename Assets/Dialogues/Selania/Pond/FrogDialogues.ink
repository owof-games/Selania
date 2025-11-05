=== welcoming_frog
{frogDebug: passo da welcoming_frog.}
~ temp charNameTwo = translator(secondCharacterState)
~ temp charNameOne = translator(firstCharacterState)
    
    + {are_two_entities_together(TheFrog, PG)} [TheFrog]

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
Arriviamo qui solo se non ci sono quest attive.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral


    + {firstStory == StoryStarted} [Chitarra]
        ~  currentMissionAboutChar = missionCharOne
        {
            - LIST_COUNT(allCharOneGifts - charOneGifts) >0:
                Ho ancora qualcosa da donare.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Vado alla gestione missione#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            - else:
                Temo tu sappia già tutto su questo personaggio#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        }
            -> autonomy_mission_verify
        
    
    + {secondStory == StoryStarted} [Riccio]
        ~  currentMissionAboutChar = missionCharTwo
        {
            - LIST_COUNT(allCharTwoGifts - charTwoGifts) >0:
                Ho ancora qualcosa da donare.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Vado alla gestione missione#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            - else:
                Temo tu sappia già tutto su questo personaggio#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        }
            -> autonomy_mission_verify
        
    
    + {thirdStory == StoryStarted} [PNG 3]
        ~  currentMissionAboutChar = missionCharThree
            -> autonomy_mission_verify
        
    + {fourthStory == StoryStarted} [PNG 4]
        ~  currentMissionAboutChar = missionCharFour
            -> autonomy_mission_verify
        
    + {fifthStory == StoryStarted} [PNG 5 (non come mentore)]
        ~  currentMissionAboutChar = missionCharFive
            -> autonomy_mission_verify
        
    
    + {firstGift !=() or secondGift !=() or fourthIngredientNameFirstCharacter !=() or fourthIngredientNameSecondCharacter != ()}[Ho bisogno di recuperare una pianta che ho utilizzato.]
        //Nota: per ora sono quattro massimi gli utilizzi di un coltivabile, per cui non serve un menu ad hoc. Poi capire come fare.
            -> cultivable_recovery
    
    
    + {availableSpecialMissions != ()}[Sorprendimi]
        ~  currentMissionAboutChar = specialDelivery
            //Per queste non passiamo mai dalla verifica dell'autonomia.
            -> missions_dispatcher ->
    -

->->

//Questa funzione ci permette di levare gli elementi inutili perché scoperti autonomamente (es: ho già fatto un dono).
//Ed è questa la funzione che fa salire il contatore di autonomia.