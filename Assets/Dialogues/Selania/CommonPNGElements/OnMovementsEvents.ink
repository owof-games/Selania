/* ---------------------------------

   Aggiornamenti di stato durante gli spostamenti 

 ----------------------------------*/
 
=== on_movement_events
{debug: passo da on_movement_events.}
//Qui metto tutte quelle funzioni e variazioni che sono richieste a ogni cambio stanza.
~ temp currentPlace = entity_location(PG)

//Passaggio per spostare il grimorio temporaneo in foresta dopo aver scelto il proprio nome.
{
    - player_nameChosen == true && contentsSafekeeping has RewriterBook:
        ~ move_entity(temporaryGrimoire, Forest)
}


//Riduzioni di contatori legati al tempo:
{debug: <i>in on_movement events: riduzioni di contatori legati al tempo.}
    ~ thirdChar_mailPause --
    ~ fifthChar_mailPause --
    
//Riduzione valore Mindfulness per proporne una diversa poi    
    ~ mentor_lastMindfulness --

//Riduzione stanchezza rana
    ~ frog_tiredValue --

//Contatore spostamenti PG
    ~ player_movementsCounter ++
    // E contatore per la notifica di riposo
    ~ player_lastRestingSession ++
        
//Gestione della cucina delle PNG
    
    //Riccio
    //Riccio inizia a cucinare. Metto prima di Chitarra giusto perché il suo storylet coinvolge anche Mentore e quindi forse è più interessante.
    //Ho messo (entity_location(SecondCharacter) != Kitchen) perché così non parte mai la cucina autonoma se c'è qualcunx in cucina.
    
        {
            - player_accessiblePlaces has Kitchen && (not second_char_cooking_tracker) && (entity_location(FirstCharacter) != Kitchen)  && second_char_main_storylets.one && contentsKitchen hasnt TheKitchenFrog && (kitchen_cookingAloneCoolDown == 0):
            
                ~ kitchen_secondCharIsCooking = true
                ~ move_entity(SecondCharacter, Kitchen)
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
            }
        }

    //Chitarra
        {
            - player_accessiblePlaces has Kitchen && (not first_char_cooking_tracker) && (entity_location(SecondCharacter) != Kitchen) && contentsKitchen hasnt TheKitchenFrog && (kitchen_cookingAloneCoolDown == 0):
            
                    ~ kitchen_firstCharIsCooking = true
                    ~ move_entity(FirstCharacter, Kitchen)
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
            }
        }
        
        //Diminuzione del cooldown 
        {
            - kitchen_cookingAloneCoolDown > 0:
                ~ kitchen_cookingAloneCoolDown --
        }
    
//Gestione suoni
    {
        - contentsSafekeeping hasnt TrainNoiseComing:
            ~ move_entity(TrainNoiseComing, Safekeeping)
    }


    {
        - contentsSafekeeping hasnt TrainNoiseGoingAway:
            ~ move_entity(TrainNoiseGoingAway, Safekeeping)
    }
                 
  

//Avvio dialoghi di chiusura
    {
        - firstChar_storyStatus == story_storyEnded:
	        ~ firstChar_exitCounter ++
	}
	
	{
	    - secondChar_storyStatus == story_storyEnded:
	        ~ secondChar_exitCounter ++     
    }

//Spostamento di libro e inventario se scoperti
    {
        - contentsSafekeeping hasnt RewriterBook && currentPlace != Bedroom:
            ~ move_entity(RewriterBook, currentPlace)
    }


//Altre funzioni:
    -> dump_graphic_changer ->
    -> story_time_management_for_PNG->
    -> check_png_randomizable_status ->
    -> characters_speaking ->
    -> moon_state_management ->
    -> special_events_tracking ->
    -> talk_to_me ->

->->

//Riduzione del tempo di pausa del dialogo fino a quando non siamo a 0
=== characters_speaking
    {
        - firstChar_pauseTalking > 0:
            ~ firstChar_pauseTalking --
            {debug: Il valore di firstChar_pauseTalking è {firstChar_pauseTalking}}
        
        - secondChar_pauseTalking > 0:
            ~ secondChar_pauseTalking --
        
        - thirdChar_pauseTalking > 0:
            ~ thirdChar_pauseTalking --
        
        - mentor_pauseTalking > 0:
            ~ mentor_pauseTalking --    
    }
->-> 

