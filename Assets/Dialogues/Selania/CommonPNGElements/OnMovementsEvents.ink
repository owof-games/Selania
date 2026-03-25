/* ---------------------------------

   Aggiornamenti di stato durante gli spostamenti 

 ----------------------------------*/

=== on_movement_events
{debug: passo da on_movement_events.}
//Prima aggiorno tutti i valori che possono condizionarne altri
    -> story_time_management_for_PNG->
    -> on_movement_PG_values ->
    -> on_movement_characters_values ->
    -> on_movement_kitchen_tracker ->
    -> on_movement_randomize_png_places ->
    -> on_movement_special_events ->
    -> on_movement_letters_management ->
    -> on_movement_sounds_effects ->    

//Poi gli elementi grafici/estetici
    -> opening_places ->       
    -> dump_graphic_changer ->
    -> moon_state_management ->
    -> horizontalS_documentDispatcher ->
    -> talk_to_me ->
    
//E degli achievements
    -> achievements_onGame_statusUpdate_RM ->
    -> achievements_onGame_statusUpdate_GM ->

    // -> notification_system ->
    -> on_movement_tutorial_steps ->
    -> talk_to_me -> 
      
->->


//Raccolta di azioni uniche                
=== on_movement_special_events
{debug: passo da on_movement_special_events.}
~ temp currentPlace = entity_location(PG)
//Abilito Carla se siamo in modalità tutorial
    {
        - tutorial_ActivateTutorial == true && not tutorial_choicesRelationshipStorylet:
            ~ move_entity(Carla, TrainStop)
            {debug: il tutorial è attivo e quindi sposto Carla alla fermata del treno.}
    }

//A crescita Olobino, cambio asset accesso serra  
    {
        - olobino.step_tre.colto && (entity_location(FromPondToGreenhouseBlooming) == Safekeeping):
            ~ move_entity(FromPondToGreenhouse, Safekeeping)
            ~ move_entity(FromPondToGreenhouseBlooming, Pond)
    }


//Spostamento di libro e inventario se scoperti
    {
        - contentsSafekeeping hasnt Grimoire && currentPlace != Bedroom:
            ~ move_entity(Grimoire, currentPlace)
    }


//Dopo aver parlato con Boccale, si apre l'accesso alla discarica
    {
        - third_char_main_storylets.one && (entity_location(FromForestToDump) == Safekeeping) && (entity_location(PG) != Forest):
            Crediamo sia giunto il momento ti parlare, {player_name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            Ti aspettiamo ai margini della foresta.
            Capirai come trovarci.
                ~ move_entity(FromForestToDumpBlocked, Safekeeping)
                ~ move_entity(FromForestToDump, Forest)
                ~ move_entity(mapDump, TrainStop)
                ~ player_accessiblePlaces += Dump
    }

->->    
           


//Gestione della posta 
=== on_movement_letters_management
{debug: passo da on_movement_letters_management.}
~ temp currentPlace = entity_location(PG)

//Variabile per far comparire una lettera alla volta.
VAR letters_doggoPause = false

    {
        - first_char_story_ended.goodbye && firstChar_mailPause < 0 && not first_character_notes.three && letters_doggoPause == false:
        
                ~ move_entity(DoggoFirstLetters, TrainStop)
                {debug: Ho messo la nota della prima personaggia alla fermata del bus.}
                ~ letters_doggoPause = true
                {debug: ho messo in pausa le altre lettere.}
            
    }
    
    {
        - second_char_story_ended.goodbye && secondChar_mailPause < 0 && not second_character_notes.three && letters_doggoPause == false:
        
                ~ move_entity(DoggoSecondLetters, TrainStop)
                {debug: Ho messo la nota del secondo personaggio alla fermata del bus.}
                ~ letters_doggoPause = true
                {debug: ho messo in pausa le altre lettere.}

                
    }

    {
        - third_char_story_ended.goodbye && thirdChar_mailPause < 0 && not third_character_notes.three && letters_doggoPause == false:
        
                ~ move_entity(DoggoThirdLetters, TrainStop)
                {debug: Ho messo la nota del third personaggio alla fermata del bus.}
                ~ letters_doggoPause = true
                {debug: ho messo in pausa le altre lettere.}

                
    }
    
    {
        - contentsTrainStop has DoggoNoLetters:
        
                ~ move_entity(DoggoNoLetters, Safekeeping)
                {debug: Ho spostato la dogga nel safekeeping.}
                ~ letters_doggoPause = false
                {debug: ho tolto dalla pausa le altre lettere.}
    
    }



    //Riduzione della pausa tra le lettere
    ~ firstChar_mailPause --
    ~ secondChar_mailPause --
    ~ thirdChar_mailPause --
    ~ fourthChar_mailPause --
    ~ fifthChar_mailPause --
    
->->

//Gestione dei suoni legati agli spostamenti
=== on_movement_sounds_effects
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
                 
  
->->



//Gestione dei valori delle PNG legati agli spostamenti (pause dialogo, mindfulness etc.)
=== on_movement_characters_values
{debug: passo per on_movement_characters_values}
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


    //Riduzione valore Mindfulness per proporne una diversa poi    
    ~ mentor_lastMindfulness --

    //Riduzione stanchezza rana
    ~ frog_tiredValue --

    //Avvio dialoghi di chiusura
    {
        - firstChar_storyStatus == story_storyEnded:
	        ~ firstChar_exitCounter ++
	}
	
	{
	    - secondChar_storyStatus == story_storyEnded:
	        ~ secondChar_exitCounter ++     
    }

    {
	    - thirdChar_storyStatus == story_storyEnded:
	        ~ thirdChar_exitCounter ++     
    }

->-> 


//Contatori della PG
=== on_movement_PG_values ===
{debug: passo da on_movement_PG_values.}
    //Contatore spostamenti PG
    ~ player_movementsCounter ++
    // E contatore per la notifica di riposo
    ~ player_lastRestingSession ++

->->


//Gestione della cucina delle PNG
=== on_movement_kitchen_tracker ===
{debug: passo da on_movement_kitchen_tracker.}
    //Riccio
    //Riccio inizia a cucinare. Metto prima di Chitarra giusto perché il suo storylet coinvolge anche Mentore e quindi forse è più interessante.
    //Ho messo (entity_location(SecondCharacter) != Kitchen) perché così non parte mai la cucina autonoma se c'è qualcunx in cucina.
    
        {
            - player_accessiblePlaces has Kitchen && (not second_char_cooking_tracker) && kitchen_kitchenOccupied == false && second_char_main_storylets.one && (kitchen_cookingAloneCoolDown == 0):
            
                ~ kitchen_secondCharIsCooking = true
                ~ move_entity(SecondCharacter, Kitchen)
                ~ kitchen_kitchenOccupied = true
                    -> second_char_cooking_tracker
        }            
        
            
        //Gestione tempi di cucina autonoma di Riccio.
        {debug: il valore di kitchen_secondCharCookingTime è {kitchen_secondCharCookingTime}}
        {debug: il valore di secondCharIsCooking è {kitchen_secondCharIsCooking}}
        {
            - kitchen_secondCharIsCooking == true:
            
            {
                - kitchen_secondCharCookingTime < kitchen_secondCharCookingMaxTime:
                    ~ kitchen_secondCharCookingTime ++
                
                - else:
                    ~ kitchen_secondCharIsCooking = false
                    ~ move_entity(SecondCharacter, Pond)
                    //Attivo il cooldown, così altre png non vanno subito a cucinare da sole
                    ~ kitchen_cookingAloneCoolDown = kitchen_cookingAloneCoolDownMAX
                    //E poi sposto gli elementi decorativi in cucina
                    ~ move_entity(BatHouseFront, Kitchen)
                    ~ move_entity(BatHouseRetro, Kitchen)
                    ~ move_entity(Bat, Kitchen)
                    ~ kitchen_kitchenOccupied = false
                    
            }
            
        }

        //Gestione attesa in cucina di Riccio se invitato a cucinare
        {   
            - kitchen_secondCharCookingTogetherInvite == true:
            
            {
                - kitchen_secondCharCookingTogetherWaiting < kitchen_secondCharCookingMAXTogetherWaiting:
                    ~ kitchen_secondCharCookingTogetherWaiting ++
                
                - else:
                   ~ kitchen_secondCharCookingTogetherInvite = false
                   ~ kitchen_secondCharCookingTogetherWaiting = 0
                   ~ move_entity(SecondCharacter, Pond)
                   ~ kitchen_kitchenOccupied = false
            }
        }

    //Chitarra
        {
            - player_accessiblePlaces has Kitchen && (not first_char_cooking_tracker) && kitchen_kitchenOccupied == false && (kitchen_cookingAloneCoolDown == 0):
            
                    ~ kitchen_firstCharIsCooking = true
                    ~ move_entity(FirstCharacter, Kitchen)
                    ~ kitchen_kitchenOccupied = true
                        -> first_char_cooking_tracker 
        }
        
        //Gestione tempi di cucina autonoma di Chitarra.
        {debug: il valore di kitchen_firstCharCookingTime è {kitchen_firstCharCookingTime}}
        {debug: il valore di kitchen_firstCharIsCooking è {kitchen_firstCharIsCooking}}
        {
            - kitchen_firstCharIsCooking == true:
            
                {
                
                    - kitchen_firstCharCookingTime < kitchen_firstCharCookingMaxTime:
                        ~ kitchen_firstCharCookingTime ++
                    
                    - else:
                       ~ kitchen_firstCharIsCooking = false
                       ~ move_entity(FirstCharacter, Pond)
                       //Attivo il cooldown, così altre png non vanno subito a cucinare da sole
                        ~ kitchen_cookingAloneCoolDown = kitchen_cookingAloneCoolDownMAX
                       //E poi sposto gli elementi decorativi in cucina
                       ~ move_entity(FirstCharCookingAloneOBJ, Kitchen)
                       ~ kitchen_kitchenOccupied = false
                }

        }

        //Gestione attesa in cucina di Chitarra se invitata a cucinare
        {   
            - kitchen_firstCharCookingTogetherInvite == true:
            
            {
                - kitchen_firstCharCookingTogetherWaiting < kitchen_firstCharCookingMAXTogetherWaiting:
                    ~ kitchen_firstCharCookingTogetherWaiting ++
                
                - else:
                   ~ kitchen_firstCharCookingTogetherInvite = false
                   ~ kitchen_firstCharCookingTogetherWaiting = 0
                   ~ move_entity(FirstCharacter, Pond)
                   ~ kitchen_kitchenOccupied = false
            }
        }
        
    

    //TerzoPNG
        {
            - player_accessiblePlaces has Kitchen && (not third_char_cooking_tracker) && kitchen_firstCharIsCooking == false && (kitchen_cookingAloneCoolDown == 0):
            
                    ~ kitchen_thirdCharIsCooking = true
                    ~ move_entity(ThirdCharacter, Kitchen)
                    ~ kitchen_kitchenOccupied = true
                        -> third_char_cooking_tracker 
        }
        
        //Gestione tempi di cucina autonoma di PNG3.
        {debug: il valore di kitchen_thirdCharCookingTime è {kitchen_thirdCharCookingTime}}
        {debug: il valore di kitchen_thirdCharIsCooking è {kitchen_thirdCharIsCooking}}
        {
            - kitchen_thirdCharIsCooking == true:
            
                {
                
                    - kitchen_thirdCharCookingTime < kitchen_thirdCharCookingMaxTime:
                        ~ kitchen_thirdCharCookingTime ++
                    
                    - else:
                       ~ kitchen_thirdCharIsCooking = false
                       ~ move_entity(ThirdCharacter, Pond)
                       //Attivo il cooldown, così altre png non vanno subito a cucinare da sole
                        ~ kitchen_cookingAloneCoolDown = kitchen_cookingAloneCoolDownMAX
                       //E poi sposto gli elementi decorativi in cucina
                       ~ move_entity(ThirdCharCookingAloneOBJ, Kitchen)
                       ~ kitchen_kitchenOccupied = false
                }

        }

        //Gestione attesa in cucina di PNG3 se invitato a cucinare
        {   
            - kitchen_thirdCharCookingTogetherInvite == true:
            
            {
                - kitchen_thirdCharCookingTogetherWaiting < kitchen_thirdCharCookingMAXTogetherWaiting:
                    ~ kitchen_thirdCharCookingTogetherWaiting ++
                
                - else:
                   ~ kitchen_thirdCharCookingTogetherInvite = false
                   ~ kitchen_thirdCharCookingTogetherWaiting = 0
                   ~ move_entity(ThirdCharacter, Pond)
                   ~ kitchen_kitchenOccupied = false
            }
        }
        
        //Diminuzione del cooldown 
        {
            - kitchen_cookingAloneCoolDown > 0:
                ~ kitchen_cookingAloneCoolDown --
        }

->->        