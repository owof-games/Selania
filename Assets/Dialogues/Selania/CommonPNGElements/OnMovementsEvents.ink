/* ---------------------------------

   Aggiornamenti di stato durante gli spostamenti 

 ----------------------------------*/

//Variabile per far comparire una lettera alla volta.
VAR letters_doggoPause = false

=== on_movement_events
{debug: passo da on_movement_events.}
//Prima aggiorno tutti i valori che possono condizionarne altri
    ~ story_time_management_for_PNG()
    ~ on_movement_PG_values()
    ~ on_movement_characters_values()
    ~ on_movement_kitchen_tracker()
    -> on_movement_randomize_png_places ->
    // ~ on_movement_debug_PNG_position()
    ~ on_movement_special_events()
    ~ on_movement_letters_management()
    ~ on_movement_sounds_effects() 
    //Faccio un check sullo stato delle missioni di franco  
    ~ franco_missionsStateUpdater()

//Poi gli elementi grafici/estetici
    ~ opening_places()    
    -> dump_graphic_changer ->
    -> moon_state_management ->
    -> horizontalS_documentDispatcher ->

//E degli achievements
    -> achievements_onGame_statusUpdate_RM ->
    -> achievements_onGame_statusUpdate_GM ->

    // -> notification_system ->
    -> on_movement_tutorial_steps ->

->->



=== function on_movement_debug_PNG_position
~ temp currentPlaceFirstCharacter = entity_location(FirstCharacter)
~ temp currentPlaceSecondCharacter = entity_location(SecondCharacter)
~ temp currentPlaceThirdCharacter = entity_location(ThirdCharacter)
~ temp currentPlaceMentor = entity_location(Mentor)
~ temp currentPlaceFranco = entity_location(Franco)

<i><b>La posizione di {FirstCharacter} è {currentPlaceFirstCharacter}, di {SecondCharacter} è {currentPlaceSecondCharacter}, di {ThirdCharacter} è {currentPlaceThirdCharacter}, di {Mentor} è {currentPlaceMentor}, di {Franco} è {currentPlaceFranco}

//Raccolta di azioni uniche                
=== function on_movement_special_events()
{debug: passo da on_movement_special_events.}
~ temp currentPlace = entity_location(PG)
//Achievements:
    //A inizio gioco, mi salvo la lista di tutte le commissioni di Franco.
    {
        - frog_allAvailableMissions == ():
            ~ frog_allAvailableMissions = frog_availableCommonMissions + frog_availableSpecialMissions
            ~ achievements_fullFranco_maxValue = LIST_COUNT(frog_allAvailableMissions)
    }
    //Idem per i coltivabili
    {
        - greenhouse_allCultivables == ():
            ~ greenhouse_allCultivables += greenhouse_cultivable
            ~ achievements_fullGreenhouse_maxValue = LIST_COUNT(greenhouse_allCultivables)
            //ne aggiungo uno perché considero nel conteggio anche la pianta donata da Franco
            ~ achievements_fullGreenhouse_maxValue ++
    }
    //E per il libri
    {
        - library_allAchievementStories == ():
            ~ library_unreadStories += library_allStories
            ~ library_allAchievementStories += library_unreadStories
            ~ achievements_goodReader_maxValue = LIST_COUNT(library_allAchievementStories)
    }
    //E la lore
    {
        - horizontalS_allAchievementDocs == ():
            ~ horizontalS_allAchievementDocs += horizontalS_allDocs
            ~ achievements_fullLore_maxValue = LIST_COUNT(horizontalS_allAchievementDocs)
    }

//Franco: aggiorno lo stato dei doni disponibili. Blocco questa cosa dopo il primo discorso con Chitarra, perché è una cosa che devo fare solo una volta.
    {
        - grimoire_firstChar == ():
            ~ frog_firstCharAchievableGifts += frog_allCharactersGifts
            ~ frog_secondCharAchievableGifts += frog_allCharactersGifts
            ~ frog_thirdCharAchievableGifts += frog_allCharactersGifts
            ~ frog_fourthCharAchievableGifts += frog_allCharactersGifts
            ~ frog_fifthCharAchievableGifts += frog_allCharactersGifts
            ~ frog_otherGifts += frog_uniqueGifts

    }

//Cose legate allx PNG.
    //Se ho fatto almeno una riscrittura, sposto thirdChar_pauseDuration da 2 a 1.
   {
        - LIST_COUNT(story_endedStories) >= 1 && thirdChar_pauseDuration != 1:
            ~ thirdChar_pauseDuration = 1
   } 


//Elementi per la camera da letto
    //Chiusura gioco
    {
        - grimoire_firstChar != () or grimoire_appendices != () or grimoire_fifthChar != () && contentsSafekeeping has BedClosingGame:
            ~ move_entity(BedClosingGame, Bedroom)
    }

    //Prima pianta coltivata
    {
        - greenhouse_findedCultivables != () && contentsSafekeeping has greenhouseOpened:
            ~ move_entity(greenhouseOpened, Bedroom)

    }
    //Prima cucinata con qualcunx
    {
        - (grimoire_firstChar has grimFirstCharKitchenEnded or grimoire_secondChar has grimSecondCharKitchenEnded or grimoire_thirdChar has grimThirdCharKitchenEnded) && contentsSafekeeping has kitchenOpened:
            ~ move_entity(kitchenOpened, Bedroom)
    }

    //Primo libro letto
    {
        - library_readStories != () && contentsSafekeeping has libraryOpened:
            ~ move_entity(libraryOpened, Bedroom)
    }

    //Primo sigillo creato
    {
        - LIST_COUNT(glyph_discoveredSigils) >= 4 && contentsSafekeeping has nestOpened:
            ~ move_entity(nestOpened, Bedroom)
    }        

    //Prima missione Franco completata
    {
        - frog_allMissionsCompleted !=() && contentsSafekeeping has francoOpened:
            ~ move_entity(francoOpened, Bedroom)
    }

    //Apertura dump
    {
        - grimoire_witch has grimWitchIntro && contentsSafekeeping has dumpOpened:
            ~ move_entity(dumpOpened, Bedroom)
    }

    //Ritratti PNG
    // {
    //     - firstChar_storyStatus == story_storyEnded && contentsSafekeeping has firstCharPaint:
    //         ~ move_entity(firstCharPaint, Bedroom)
    // }

    // {
    //     - secondChar_storyStatus == story_storyEnded && contentsSafekeeping has secondCharPaint:
    //         ~ move_entity(secondCharPaint, Bedroom)
    // }

    // {
    //     - thirdChar_storyStatus == story_storyEnded && contentsSafekeeping has thirdCharPaint:
    //         ~ move_entity(thirdCharPaint, Bedroom)
    // }

    // {
    //     - fourthChar_storyStatus == story_storyEnded && contentsSafekeeping has fourthCharPaint:
    //         ~ move_entity(fourthCharPaint, Bedroom)
    // }

    // {
    //     - fifthChar_storyStatus == story_storyEnded && contentsSafekeeping has fifthCharPaint:
    //         ~ move_entity(fifthCharPaint, Bedroom)
    // }

    


//Altri elementi grafici:
    //A crescita Olobino, cambio asset accesso serra  
    {
        - greenhouse_findedCultivables has Olobino && (entity_location(FromPondToGreenhouseBlooming) == Safekeeping):
            ~ move_entity(FromPondToGreenhouse, Safekeeping)
            ~ move_entity(FromPondToGreenhouseBlooming, Pond)
    }


    //Spostamento grimorio se scoperto
    {
        - contentsSafekeeping hasnt Grimoire && currentPlace != Bedroom:
            ~ move_entity(Grimoire, currentPlace)
    }

   
           


//Gestione della posta 
=== function on_movement_letters_management()
{debug: passo da on_movement_letters_management.}
~ temp currentPlace = entity_location(PG)



    {
        - firstChar_storyStatus == story_storyEnded && firstChar_mailPause < 0 && grimoire_firstChar hasnt grimFirstCharLetterFour && letters_doggoPause == false:
        
                ~ move_entity(DoggoFirstLetters, TrainStop)
                {debug: Ho messo la nota della prima personaggia alla fermata del bus.}
                ~ letters_doggoPause = true
                {debug: ho messo in pausa le altre lettere.}

        - else:
            {
                - firstChar_storyStatus == story_storyEnded:
                    ~ firstChar_mailPause --   
            }
                 
    }
    
    {
        - secondChar_storyStatus == story_storyEnded && secondChar_mailPause < 0 && grimoire_secondChar hasnt grimSecondCharLetterFour && letters_doggoPause == false:
        
                ~ move_entity(DoggoSecondLetters, TrainStop)
                {debug: Ho messo la nota del secondo personaggio alla fermata del bus.}
                ~ letters_doggoPause = true
                {debug: ho messo in pausa le altre lettere.}

        - else:
            {
                - secondChar_storyStatus == story_storyEnded:
                    ~ secondChar_mailPause --   
            }
                
    }

    {
        - thirdChar_storyStatus == story_storyEnded && thirdChar_mailPause < 0 && grimoire_thirdChar hasnt grimThirdCharLetterFour && letters_doggoPause == false:
        
                ~ move_entity(DoggoThirdLetters, TrainStop)
                {debug: Ho messo la nota del third personaggio alla fermata del bus.}
                ~ letters_doggoPause = true
                {debug: ho messo in pausa le altre lettere.}

        - else:
            {
                - thirdChar_storyStatus == story_storyEnded:
                    ~ thirdChar_mailPause --   
            }        

                
    }

    {
        - fourthChar_storyStatus == story_storyEnded && fourthChar_mailPause < 0 && grimoire_fourthChar hasnt grimFourthCharLetterFour  && letters_doggoPause == false:
        
                ~ move_entity(DoggoFourthLetters, TrainStop)
                {debug: Ho messo la nota del fourth personaggio alla fermata del bus.}
                ~ letters_doggoPause = true
                {debug: ho messo in pausa le altre lettere.}

        - else:
            {
                - fourthChar_storyStatus == story_storyEnded:
                    ~ fourthChar_mailPause --   
            }        

                
    }   

    {
        - fifthChar_storyStatus == story_storyEnded && fifthChar_mailPause < 0 && grimoire_fifthChar hasnt grimFifthCharLetterFour  && letters_doggoPause == false:
        
                ~ move_entity(DoggoFifthLetters, TrainStop)
                {debug: Ho messo la nota del fifth personaggio alla fermata del bus.}
                ~ letters_doggoPause = true
                {debug: ho messo in pausa le altre lettere.}

        - else:
            {
                - fifthChar_storyStatus == story_storyEnded:
                    ~ fifthChar_mailPause --   
            }        

                
    }    
    {
        - contentsTrainStop has DoggoNoLetters:
        
                ~ move_entity(DoggoNoLetters, Safekeeping)
                {debug: Ho spostato la dogga nel safekeeping.}
                ~ letters_doggoPause = false
                {debug: ho tolto dalla pausa le altre lettere.}
    
    }


    


//Gestione dei suoni legati agli spostamenti
=== function on_movement_sounds_effects()
{debug: passo da on_movement_sounds_effects.}
    
//Gestione suoni
    {
        - contentsSafekeeping hasnt TrainNoiseComing:
            ~ move_entity(TrainNoiseComing, Safekeeping)
    }


    {
        - contentsSafekeeping hasnt TrainNoiseGoingAway:
            ~ move_entity(TrainNoiseGoingAway, Safekeeping)
    }
                 
  



//Gestione dei valori delle PNG legati agli spostamenti (pause dialogo, mindfulness etc.)
=== function on_movement_characters_values()
{debug: passo per on_movement_characters_values}
    {
        - png_commonPauseTalking == true:
            ~ png_commonPauseTalking = false 
    }

    {
        - firstChar_pauseTalking > 0:
            ~ firstChar_pauseTalking --
            {debug: Il valore di firstChar_pauseTalking è {firstChar_pauseTalking}}
    }

    {    
        - secondChar_pauseTalking > 0:
            ~ secondChar_pauseTalking --
    } 

    {    
        - thirdChar_pauseTalking > 0:
            ~ thirdChar_pauseTalking --
    }

    {    
        - fourthChar_pauseTalking > 0:
            ~ fourthChar_pauseTalking --
    }  

    {    
        - fifthChar_pauseTalking > 0:
            ~ fifthChar_pauseTalking --
    }  

    {   
        - mentor_pauseTalking > 0:
            ~ mentor_pauseTalking --    
    }

    {   
        - witch_pauseTalking > 0:
            ~ witch_pauseTalking --    
    } 
    {
        - frog_pauseSpecialMission > 0:
           ~ frog_pauseSpecialMission --
    }
    {
        - openingPlacesPause > 0:
            ~ openingPlacesPause --
    }

    {
        - mentor_lastMindfulness > 0:
            ~ mentor_lastMindfulness --
    }

    {
        - frog_tiredValue > 0:
            ~ frog_tiredValue --

        - else:     
            //Se è nel safekeeping, vuol dire che non è nel nest o in cucina ad aspettarmi
            {
                - contentsSafekeeping has Franco && grimoire_secondChar has grimSecondCharTwo:
                        ~ move_entity(Franco, Pond)
            }    
    }



//Contatori della PG
=== function on_movement_PG_values()
{debug: passo da on_movement_PG_values.}
    //Contatore spostamenti PG
    ~ player_movementsCounter ++
    // E contatore per la notifica di riposo
    ~ player_lastRestingSession ++

//Aggiornamento per la parte di argomenti "strani" per mentore
//Step uno: verifico se c'è un nuovo argomento strano

    {
        - grimoire_franco has grimFrancoFirst && player_somethingStrange hasnt strangeFrog:
            ~ player_somethingStrangeTalkable += strangeFrog
            ~ player_somethingStrange += strangeFrog
    
    }

    {
        - greenhouse_findedCultivables != () && player_somethingStrange hasnt strangeVoice:
            ~ player_somethingStrangeTalkable += strangeVoice
            ~ player_somethingStrange += strangeVoice
    
    }

    {
        - grimoire_witch has grimWitchIntro && player_somethingStrange hasnt strangeVase:
            ~ player_somethingStrangeTalkable += strangeVase
            ~ player_somethingStrange += strangeVase
    
    }

    {
        - grimoire_witch has grimWitchIntro && player_somethingStrange hasnt strangeGrimoire:
            ~ player_somethingStrangeTalkable += strangeGrimoire
            ~ player_somethingStrange += strangeGrimoire
    
    }




//Gestione della cucina delle PNG
=== function on_movement_kitchen_tracker()
{debug_kitchen: passo da on_movement_kitchen_tracker.}
{debug_kitchen: i contenuti di contentsKitchen sono {contentsKitchen}.}

    //Check zero: se la cucina non è stata sbloccata, skippo. Così poi non devo più chiedermelo.
    {
        - player_accessiblePlaces hasnt Kitchen:
            {debug_kitchen: la cucina non è ancora sbloccata, per cui esco subito da on_movement_kitchen_tracker.}
            ~ return
    }


    //Primo check: la cucina è occupata?
    {
        - contentsKitchen has FirstCharacter:
            ~ kitchen_kitchenOccupied = true

        - contentsKitchen has SecondCharacter:
            ~ kitchen_kitchenOccupied = true

        - contentsKitchen has ThirdCharacter:
            ~ kitchen_kitchenOccupied = true

        - contentsKitchen has FourthCharacter:
            ~ kitchen_kitchenOccupied = true
        
        - contentsKitchen has FifthCharacter:
            ~ kitchen_kitchenOccupied = true

        - contentsKitchen has Franco:
            ~ kitchen_kitchenOccupied = true

        - else:
            ~ kitchen_kitchenOccupied = false            
    }

    //Secondo check: stato personagge
    //Riccio
    //Riccio inizia a cucinare. Metto prima di Chitarra giusto perché il suo storylet coinvolge anche Mentore e quindi forse è più interessante.
    
        {
            - kitchen_secondCharHasCooked == false && kitchen_kitchenOccupied == false && grimoire_secondChar has grimSecondCharOne && (kitchen_cookingAloneCoolDown == 0) && secondChar_ForestInvite == false && secondChar_storyStatus == story_storyStarted:
                {debug_kitchen: le condizioni sono giuste per far cucinare Riccio da solo}
                ~ kitchen_secondCharIsCooking = true
                ~ move_entity(SecondCharacterCucina, Kitchen)
                ~ move_entity(SecondCharacter, Safekeeping)
                ~ kitchen_kitchenOccupied = true
                ~ cooking_animations_on()
                
        }            
        
            
        //Gestione tempi di cucina autonoma di Riccio.
        {debug: il valore di kitchen_secondCharCookingTime è {kitchen_secondCharCookingTime}}
        {debug: il valore di secondCharIsCooking è {kitchen_secondCharIsCooking}}
        {
            - kitchen_secondCharIsCooking == true:
            
            {
                - kitchen_secondCharCookingTime < kitchen_secondCharCookingMaxTime:
                    ~ kitchen_secondCharCookingTime ++
                    {debug_kitchen: aumento il valore di cucina autonoma di Riccio a {kitchen_secondCharCookingTime}.}
                
                - else:
                    ~ kitchen_secondCharIsCooking = false
                    ~ kitchen_secondCharHasCooked = true
                    ~ move_entity(SecondCharacter, Pond)
                    ~ move_entity(SecondCharacterCucina, Safekeeping)
                    //Attivo il cooldown, così altre png non vanno subito a cucinare da sole
                    ~ kitchen_cookingAloneCoolDown = kitchen_cookingAloneCoolDownMAX
                    //E poi sposto gli elementi decorativi in cucina
                    ~ move_entity(BatHouseFront, Kitchen)
                    ~ move_entity(BatHouseRetro, Kitchen)
                    ~ move_entity(Bat, Kitchen)
                    ~ kitchen_kitchenOccupied = false
                    ~ cooking_animations_off()
                    {debug_kitchen: Riccio ha finito di cucinare.}
            }
        }

        //Gestione attesa in cucina di Riccio se invitato a cucinare
        {   
            - kitchen_secondCharCookingTogetherInvite == true:
                {debug_kitchen: Riccio è stato invitato in cucina.}
            {
                - kitchen_secondCharCookingTogetherWaiting < kitchen_secondCharCookingMAXTogetherWaiting:
                    ~ kitchen_secondCharCookingTogetherWaiting ++
                    {debug_kitchen: Riccio ci sta aspettando in cucina, kitchen_secondCharCookingTogetherWaiting è {kitchen_secondCharCookingTogetherWaiting}.}
                
                - else:
                    ~ kitchen_secondCharCookingTogetherInvite = false
                    ~ kitchen_secondCharCookingTogetherWaiting = 0
                    ~ move_entity(SecondCharacter, Pond)
                    ~ move_entity(SecondCharacter, Pond)
                    ~ move_entity(SecondCharacterCucina, Safekeeping)
                    ~ kitchen_kitchenOccupied = false
                   {debug_kitchen: Riccio cha smesso di aspettarci in cucina.}
            }
        }

    //Chitarra
        {
            - kitchen_firstCharHasCooked == false && kitchen_kitchenOccupied == false && (kitchen_cookingAloneCoolDown == 0) && firstChar_storyStatus == story_storyStarted:
            
                    ~ kitchen_firstCharIsCooking = true
                    ~ move_entity(FirstCharacterCucina, Kitchen)
                    ~ move_entity(FirstCharacter, Safekeeping)
                    ~ kitchen_kitchenOccupied = true
                    ~ cooking_animations_on()
                  
        }
        
        //Gestione tempi di cucina autonoma di Chitarra.
        {debug: il valore di kitchen_firstCharCookingTime è {kitchen_firstCharCookingTime}}
        {debug: il valore di kitchen_firstCharIsCooking è {kitchen_firstCharIsCooking}}
        {
            - kitchen_firstCharIsCooking == true:
                {debug_kitchen: le condizioni sono giuste per far cucinare Chitarra da sola}
                {
                
                    - kitchen_firstCharCookingTime < kitchen_firstCharCookingMaxTime:
                        ~ kitchen_firstCharCookingTime ++
                        {debug_kitchen: kitchen_firstCharCookingTime è {kitchen_firstCharCookingTime}.}
                    
                    - else:
                       ~ kitchen_firstCharIsCooking = false
                       ~ kitchen_firstCharHasCooked = true
                       ~ move_entity(FirstCharacter, Pond)
                       ~ move_entity(FirstCharacterCucina, Safekeeping)
                       //Attivo il cooldown, così altre png non vanno subito a cucinare da sole
                        ~ kitchen_cookingAloneCoolDown = kitchen_cookingAloneCoolDownMAX
                       //E poi sposto gli elementi decorativi in cucina
                       ~ move_entity(FirstCharCookingAloneOBJ, Kitchen)
                       ~ kitchen_kitchenOccupied = false
                       ~ cooking_animations_off()
                       {debug_kitchen: chitarra ha finito di cucinare da sola.}
                }

        }

        //Gestione attesa in cucina di Chitarra se invitata a cucinare
        {   
            - kitchen_firstCharCookingTogetherInvite == true:
            {debug_kitchen: chitarra ci aspetta in cucina su nostro invito.}
            {
                - kitchen_firstCharCookingTogetherWaiting < kitchen_firstCharCookingMAXTogetherWaiting:
                    ~ kitchen_firstCharCookingTogetherWaiting ++
                    {debug_kitchen: cucina ci aspetta in cucina da kitchen_firstCharCookingTogetherWaiting {kitchen_firstCharCookingTogetherWaiting}}
                
                - else:
                   ~ kitchen_firstCharCookingTogetherInvite = false
                   ~ kitchen_firstCharCookingTogetherWaiting = 0
                   ~ move_entity(FirstCharacter, Pond)
                   ~ move_entity(FirstCharacterCucina, Safekeeping)
                   ~ kitchen_kitchenOccupied = false
                   {debug_kitchen: chitarra ha smesso di aspettarci in cucina.}
            }
        }
        
    

    //TerzoPNG
        {
            - kitchen_thirdCharHasCooked == false && kitchen_kitchenOccupied == false && grimoire_thirdChar has grimThirdCharOne && (kitchen_cookingAloneCoolDown == 0) && thirdChar_LibraryInvite == false && thirdChar_storyStatus == story_storyStarted:
                {debug_kitchen: le condizioni per far cucinare Boccale da solo sono valide.}
                    ~ kitchen_thirdCharIsCooking = true
                    ~ move_entity(ThirdCharacter, Safekeeping)
                    ~ move_entity(ThirdCharacterCucina, Kitchen)
                    ~ kitchen_kitchenOccupied = true
                    ~ cooking_animations_on()
                    
        }
        
        //Gestione tempi di cucina autonoma di PNG3.
        {debug: il valore di kitchen_thirdCharCookingTime è {kitchen_thirdCharCookingTime}}
        {debug: il valore di kitchen_thirdCharIsCooking è {kitchen_thirdCharIsCooking}}
        {
            - kitchen_thirdCharIsCooking == true:
            {debug_kitchen: Boccale sta cucinando da solo.}
                {
                
                    - kitchen_thirdCharCookingTime < kitchen_thirdCharCookingMaxTime:
                        ~ kitchen_thirdCharCookingTime ++
                        {debug_kitchen: boccale cucina da solo da {kitchen_thirdCharCookingTime}.}
                    
                    - else:
                       ~ kitchen_thirdCharIsCooking = false
                       ~ kitchen_thirdCharHasCooked = true
                       ~ move_entity(ThirdCharacter, Pond)
                       ~ move_entity(ThirdCharacterCucina, Safekeeping)
                       //Attivo il cooldown, così altre png non vanno subito a cucinare da sole
                        ~ kitchen_cookingAloneCoolDown = kitchen_cookingAloneCoolDownMAX
                       //E poi sposto gli elementi decorativi in cucina
                       ~ move_entity(ThirdCharCookingAloneOBJ, Kitchen)
                       ~ kitchen_kitchenOccupied = false
                       ~ cooking_animations_off()
                       {debug_kitchen: boccale ha finito di cucinare da solo}
                }

        }

        //Gestione attesa in cucina di PNG3 se invitato a cucinare
        {   
            - kitchen_thirdCharCookingTogetherInvite == true:
            {debug_kitchen: boccale ci aspetta in cucina}
            
            {
                - kitchen_thirdCharCookingTogetherWaiting < kitchen_thirdCharCookingMAXTogetherWaiting:
                    ~ kitchen_thirdCharCookingTogetherWaiting ++
                     {debug_kitchen: boccale ci aspetta in cucina da {kitchen_thirdCharCookingTogetherWaiting}.}
                
                - else:
                   ~ kitchen_thirdCharCookingTogetherInvite = false
                   ~ kitchen_thirdCharCookingTogetherWaiting = 0
                   ~ move_entity(ThirdCharacter, Pond)
                   ~ move_entity(ThirdCharacterCucina, Safekeeping)
                   ~ kitchen_kitchenOccupied = false
                   {debug_kitchen: boccale ha smesso di aspettarci in cucina.}
            }
        }
        
        //Diminuzione del cooldown 
        {
            - kitchen_cookingAloneCoolDown > 0:
                ~ kitchen_cookingAloneCoolDown --
        }



    //QuartaPNG
        {
            - kitchen_fourthCharHasCooked == false && kitchen_kitchenOccupied == false && grimoire_fourthChar has grimFourthCharOne && (kitchen_cookingAloneCoolDown == 0) && fourthChar_storyStatus == story_storyStarted:
                {debug_kitchen: le condizioni per far cucinare Nonna da sola sono valide.}
                    ~ kitchen_fourthCharIsCooking = true
                    ~ move_entity(FourthCharacter, Safekeeping)
                    ~ move_entity(FourthCharacterCucina, Kitchen)
                    ~ kitchen_kitchenOccupied = true
                    ~ cooking_animations_on()
                    
        }
        
        //Gestione tempi di cucina autonoma di PNG3.
        {debug: il valore di kitchen_fourthCharCookingTime è {kitchen_fourthCharCookingTime}}
        {debug: il valore di kitchen_fourthCharIsCooking è {kitchen_fourthCharIsCooking}}
        {
            - kitchen_fourthCharIsCooking == true:
            {debug_kitchen: Nonna sta cucinando da solo.}
                {
                
                    - kitchen_fourthCharCookingTime < kitchen_fourthCharCookingMaxTime:
                        ~ kitchen_fourthCharCookingTime ++
                        {debug_kitchen: Nonna cucina da sola da {kitchen_fourthCharCookingTime}.}
                    
                    - else:
                       ~ kitchen_fourthCharIsCooking = false
                       ~ kitchen_fourthCharHasCooked = true
                       ~ move_entity(FourthCharacter, Pond)
                       ~ move_entity(FourthCharacterCucina, Safekeeping)
                       //Attivo il cooldown, così altre png non vanno subito a cucinare da sole
                        ~ kitchen_cookingAloneCoolDown = kitchen_cookingAloneCoolDownMAX
                       //E poi sposto gli elementi decorativi in cucina
                       ~ move_entity(FourthCharCookingAloneOBJ, Kitchen)
                       ~ kitchen_kitchenOccupied = false
                       ~ cooking_animations_off()
                       {debug_kitchen: Nonna ha finito di cucinare da solo}
                }

        }

        //Gestione attesa in cucina di PNG3 se invitato a cucinare
        {   
            - kitchen_fourthCharCookingTogetherInvite == true:
            {debug_kitchen: Nonna ci aspetta in cucina}
            
            {
                - kitchen_fourthCharCookingTogetherWaiting < kitchen_fourthCharCookingMAXTogetherWaiting:
                    ~ kitchen_fourthCharCookingTogetherWaiting ++
                     {debug_kitchen: Nonna ci aspetta in cucina da {kitchen_fourthCharCookingTogetherWaiting}.}
                
                - else:
                   ~ kitchen_fourthCharCookingTogetherInvite = false
                   ~ kitchen_fourthCharCookingTogetherWaiting = 0
                   ~ move_entity(FourthCharacter, Pond)
                   ~ move_entity(FourthCharacterCucina, Safekeeping)
                   ~ kitchen_kitchenOccupied = false
                   {debug_kitchen: Nonna ha smesso di aspettarci in cucina.}
            }
        }
        
        //Diminuzione del cooldown 
        {
            - kitchen_cookingAloneCoolDown > 0:
                ~ kitchen_cookingAloneCoolDown --
        }


     //QuintaPNG
        {
            - kitchen_fifthCharHasCooked == false && kitchen_kitchenOccupied == false && grimoire_fifthChar has grimFifthCharOne && (kitchen_cookingAloneCoolDown == 0) && fifthChar_storyStatus == story_storyStarted:
                {debug_kitchen: le condizioni per far cucinare Boccale da solo sono valide.}
                    ~ kitchen_fifthCharIsCooking = true
                    ~ move_entity(FifthCharacter, Safekeeping)
                    ~ move_entity(FifthCharacterCucina, Kitchen)
                    ~ kitchen_kitchenOccupied = true
                    ~ cooking_animations_on()
                    
        }
        
        //Gestione tempi di cucina autonoma di PNG3.
        {debug: il valore di kitchen_fifthCharCookingTime è {kitchen_fifthCharCookingTime}}
        {debug: il valore di kitchen_fifthCharIsCooking è {kitchen_fifthCharIsCooking}}
        {
            - kitchen_fifthCharIsCooking == true:
            {debug_kitchen: Boccale sta cucinando da solo.}
                {
                
                    - kitchen_fifthCharCookingTime < kitchen_fifthCharCookingMaxTime:
                        ~ kitchen_fifthCharCookingTime ++
                        {debug_kitchen: boccale cucina da solo da {kitchen_fifthCharCookingTime}.}
                    
                    - else:
                       ~ kitchen_fifthCharIsCooking = false
                       ~ kitchen_fifthCharHasCooked = true
                       ~ move_entity(FifthCharacter, Pond)
                       ~ move_entity(FifthCharacterCucina, Safekeeping)
                       //Attivo il cooldown, così altre png non vanno subito a cucinare da sole
                        ~ kitchen_cookingAloneCoolDown = kitchen_cookingAloneCoolDownMAX
                       //E poi sposto gli elementi decorativi in cucina
                       ~ move_entity(FifthCharCookingAloneOBJ, Kitchen)
                       ~ kitchen_kitchenOccupied = false
                       ~ cooking_animations_off()
                       {debug_kitchen: boccale ha finito di cucinare da solo}
                }

        }

        //Gestione attesa in cucina di PNG3 se invitato a cucinare
        {   
            - kitchen_fifthCharCookingTogetherInvite == true:
            {debug_kitchen: boccale ci aspetta in cucina}
            
            {
                - kitchen_fifthCharCookingTogetherWaiting < kitchen_fifthCharCookingMAXTogetherWaiting:
                    ~ kitchen_fifthCharCookingTogetherWaiting ++
                     {debug_kitchen: boccale ci aspetta in cucina da {kitchen_fifthCharCookingTogetherWaiting}.}
                
                - else:
                   ~ kitchen_fifthCharCookingTogetherInvite = false
                   ~ kitchen_fifthCharCookingTogetherWaiting = 0
                   ~ move_entity(FifthCharacter, Pond)
                   ~ move_entity(FifthCharacterCucina, Safekeeping)
                   ~ kitchen_kitchenOccupied = false
                   {debug_kitchen: boccale ha smesso di aspettarci in cucina.}
            }
        }
        
        //Diminuzione del cooldown 
        {
            - kitchen_cookingAloneCoolDown > 0:
                ~ kitchen_cookingAloneCoolDown --
        }
