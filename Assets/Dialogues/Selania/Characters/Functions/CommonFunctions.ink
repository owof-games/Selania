/* ---------------------------------

   Gestione avvio e chiusura storie personagge 

 ----------------------------------*/
    LIST story_storyStatus = story_storyNotStarted, story_storyStarted, story_storyEnded
    
    //Lista che tiene conto di quali storie sono state concluse
    LIST story_endedStories = story_firstCharStoryEnded, story_secondCharStoryEnded, story_thirdCharStoryEnded, story_fourthCharStoryEnded, story_fifthCharStoryEnded
    
    //Lista che tiene conto in ordine progressivo della quantità di storie concluse
    LIST story_endingOrders = story_oneStoryClosed, story_twoStoriesClosed, story_threeStoriesClosed, story_fourStoriesClosed, story_fifthStoriesClosed
    
    
//COME PROMEMORIA. LISTA DI TIPI DI TONO CHE POSSIAMO TENERE IN UNA CONVERSAZIONE: ROSSO (RABBIA, PASSIONE, AZIONE, OPPOSIZIONE). VIOLA (SPIRITUALITA', VISIONE DEL GRANDE SCHEMA DELLE COSE, SGUARDO POETICO, TESA VERSO UNA MISSIONE). GIALLO (GIOCOSITA', RISATA, DIVERTIMENTO, FANCIULLEZZA). VERDE (CUORE, AFFETTI, CURA DELLE PERSONE CARE, RIFLESSIONE EMOTIVA). BLU (RAZIONALITA', CALCOLO, VISIONE PRATICA, DISCIPLINA).


=== story_time_management_for_PNG
//Questa la uso per far sentire il rumore del treno dove serve
~ temp CurrentLocation = entity_location(PG)

    //Qui commentato a manetta per non fare partire cose che non dovrebbero partire.
    {
    
        //Dopo essere arrivata per la prima volta allo stagno, compare mentore, e attivo la sua storia
        - (pond == true) && (mentorStory != story_storyStarted):
        {debug: introduco mentore in scena.}
                ~ move_entity(Mentor, Forest)
                ~ mentorStory = story_storyStarted
    
        //Dopo il delay previsto, compare Chitarra.
        - player_movementsCounter == firstChar_delay && firstChar_storyStatus == story_storyNotStarted:
        {debug: introduco {FirstCharacter} in scena.}
                ~ move_entity(FirstCharacter, TrainStop)
                ~ move_entity(TrainNoise, CurrentLocation)
                ~ firstChar_storyStatus = story_storyStarted
                
        //Dopo due steps della storia della prima personaggia, compare la seconda      
        - knowing_first_character.two && secondStory == story_storyNotStarted:
        {debug: introduco {SecondCharacter} in scena.}
                ~ move_entity(SecondCharacter, TrainStop)
                ~ move_entity(TrainNoise, CurrentLocation)
                ~ secondStory = story_storyStarted
    
        //Dopo aver aperto la biblioteca, compare il terzo png
        //- open_the_library && not (thirdStory == story_storyStarted):
            //{debug: introduco {ThirdCharacter} in scena.}
                // ~ move_entity(ThirdCharacter, TrainStop)
                // ~ move_entity(TrainNoise, CurrentLocation)
                // ~ thirdStory = story_storyStarted
                
        //X movimenti dopo la furia della mentore, compare la quarta png
        //- player_movementsCounter == delayFourthChar && mentor_rage:
                //{debug: introduco {FourthCharacter} in scena.}
                //~ move_entity(FourthCharacter, Forest)
                //~ fourthStory = story_storyStarted
                //qualcosa per panchina sistemata
                
        //E quando la storia della quarta è a tre, si presenta la mentore come uovo
        //- knowing_fourth_character.three && fifthStory == story_storyNotStarted:
                //~ qualcosa per trasformare mentore in uovo
                    
        //E quando la storia della quarta è a cinque steps, parte la storia della mentore
        //- knowing_fourth_character.five && fifthStory == story_storyNotStarted && qualcosa per cui abbiamo tocca l'uovo almeno una volta:
                // ~ move_entity(TrainNoise, CurrentLocation)
                //{debug: introduco {FifthCharacter} in scena.}
                //~ fifthStory == story_storyStarted:
                //cambiamento asset per mentore, che passa a mostrone
    
    
    
    //Check per l'allontanamento delle personagge
        //- firstChar_storyStatus == story_storyEnded && player_movementsCounter > 10:
            //~ move_entity(FirstCharacter, Safekeeping)
            //~ move_entity(FirstCharacterNotes, TrainStop)
            
        //- secondStory == story_storyEnded && player_movementsCounter > 10:
            //~ move_entity(SecondCharacter, Safekeeping)
            //~ move_entity(SecondCharacterNotes, TrainStop)
            
        //- thirdStory == story_storyEnded && player_movementsCounter > 10:
            //~ move_entity(ThirdCharacter, Safekeeping)
            //~ move_entity(ThirdCharacterNotes, TrainStop)
            
        //- fourthStory == story_storyEnded && player_movementsCounter > 10:
            //~ move_entity(FourthCharacter, Safekeeping)
           // ~ move_entity(FourthCharacterNotes, TrainStop)
            
        //- fifthStory == story_storyEnded && player_movementsCounter > 10:
            //~ move_entity(Mentor, Safekeeping)
           // ~ move_entity(FifthCharacterNotes, TrainStop)
    }
    
        ->->




/* ---------------------------------

   Funzioni legate a comparsa e spostamenti personagge 

 ----------------------------------*/

//Gestione spostamenti: tempo
    //Quando questa è a zero, non ci sono spostamenti
    VAR movements_changeLocationTimer = 0
    
    //Questo è invece il valore che indica quando far partire la randomizzazione dei luoghi dell3 PNG
    VAR movements_changeLocationTrigger = 9
    
    //Questa è la lista dei luoghi dove l3 PNG possono andare. All'inizio è ridotta a tre, poi si amplia man mano che sblocchiamo posti.
    VAR movements_randomablePlaces = (Forest, TrainStop, Pond)


//Gestione spostamenti: personagge
    VAR movements_randomizable_characters = ()


//Qui apriamo i luoghi cambiando gli assets di riferimento
=== opening_places
{debug: passo da opening_places.}
    {
        - welcome.your_name && (entity_location(FromPondToGreenhouse) == Safekeeping) && not olobino.step_tre.colto:
            ~ movements_randomablePlaces += Greenhouse
            ~ player_accessiblePlaces += Greenhouse
            ~ move_entity(FromPondToGreenhouseBlocked, Safekeeping)
            ~ move_entity(FromPondToGreenhouse, Pond)
    }
    
    {
        - open_the_kitchen && (entity_location(FromPondToKitchen) == Safekeeping):
            ~ player_accessiblePlaces += Kitchen
            ~ move_entity(FromPondToKitchenBlocked, Safekeeping)
            ~ move_entity(FromPondToKitchen, Pond)
    }
    
    {
        - open_nest && (entity_location(FromLibraryToNest) == Safekeeping):
            ~ player_accessiblePlaces += Nest
            ~ move_entity(FromLibraryToNestBlocked, Safekeeping)
            ~ move_entity(FromLibraryToNest, Library)
    }
    
    {
        - open_the_library && (entity_location(FromForestToLibrary) == Safekeeping):
        
            ~ move_entity(FromForestToLibraryBlocked, Safekeeping)
            ~ move_entity(FromForestToLibrary, Forest)
            ~ movements_randomablePlaces += Library
            ~ player_accessiblePlaces += Library
    }

->->   

=== check_png_randomizable_status
//Prima cosa: se una storia è iniziata, aggiungo la personaggia alla lista dei randomizzabili, altrimenti la levo
    {debug: passo da check_png_randomizable_status.}
    
    {
        - mentorStory == story_storyStarted:
            ~ movements_randomizable_characters += Mentor
        
        - mentorStory == story_storyEnded:  
            ~ movements_randomizable_characters -= Mentor 
    }


    {
        - firstChar_storyStatus == story_storyStarted:
            ~ movements_randomizable_characters += FirstCharacter
        
        - firstChar_storyStatus == story_storyEnded:  
            ~ movements_randomizable_characters -= FirstCharacter 
    }

    {
        - secondStory == story_storyStarted:
        
        //Evitiamo che venga tolto dalla cucina se sta cucinando
        {
            - secondIsCooking == true:
                ~ movements_randomizable_characters -= SecondCharacter
            - else:
                ~ movements_randomizable_characters += SecondCharacter
                
        }
        
        - secondStory == story_storyEnded:
                ~ movements_randomizable_characters -= SecondCharacter 
    }
  
    {    
        - thirdStory == story_storyStarted:
             ~ movements_randomizable_characters += ThirdCharacter
        
        - thirdStory == story_storyEnded:
            ~ movements_randomizable_characters -= ThirdCharacter
    }
    
    {
        - fourthStory == story_storyStarted:
            ~ movements_randomizable_characters += FourthCharacter    
        
         - fourthStory == story_storyEnded:
            ~ movements_randomizable_characters -= FourthCharacter 
    }
    
    {
        - fifthStory == story_storyStarted:
            ~ movements_randomizable_characters += Mentor
        
        -   fifthStory == story_storyEnded:  
            ~ movements_randomizable_characters -= Mentor
    }
    
    //Comparsa della rana
    {knowing_second_character.four.theFrog && (not are_two_entities_together(TheFrog, Mentor)) && entity_location(TheFrog)!=Pond:
            {debug: Ho spostato la rana allo stagno.}
           ~  move_entity(TheFrog, Pond)
    }
    
    -> randomize_png_location
    


    
    
=== randomize_png_location    
{debug: randomize_png_location.}

    {//se ho raggiunto il tempo trigger, resetto il valore, e poi vado avanti.
        - movements_changeLocationTimer >= movements_changeLocationTrigger:
        {debug: <i> Il valore del Timer è {movements_changeLocationTimer} e quindi randomizzo il luogo.}
            -> top

        //altrimenti, aumento il valore e skippo
        - else:
        {debug: <i>il valore del Timer è {movements_changeLocationTimer} e quindi lo aumento.}
            ~ movements_changeLocationTimer ++
            ->->
    }
    
    //provare così, o vedere se invece è il caso di creare una variabile temporanea per le liste
            = top
            ~ movements_changeLocationTimer = 0
            //~ temp list_character = movements_randomizable_characters
            ~ temp character = LIST_RANDOM(movements_randomizable_characters)
                {debug: le personagge randomizzabili sono {movements_randomizable_characters}}
                //{debug: le personagge nella lista temporanea sono {movements_randomizable_characters}}
                {debug: la personaggia randomizzata è {character}}
            ~ temp location = LIST_RANDOM(movements_randomablePlaces)
                {debug: i luoghi randomizzabili sono {movements_randomablePlaces}}
                {debug: il luogo scelto per la randomizzazione è {location}}
            
            ~ move_entity(character, location)
            ~ movements_randomizable_characters -= character    
            
            {debug: <i>{character} si trova in {location}.}       
            
            {
               - movements_randomizable_characters != ():
                    -> top
               - else:
                    ->->
            }
    
    ->->
    
 
/* ---------------------------------

   Aggiornamenti di stato durante gli spostamenti 

 ----------------------------------*/

    
=== on_movement_events
//Qui metto tutte quelle funzioni e variazioni che sono richieste a ogni cambio stanza.
~ temp currentPlace = entity_location(PG)

{debug: passo per on_movement_events}
//Riduzioni di contatori legati al tempo:
    ~ firstChar_mailPause --
    ~ secondWritingPause --
    ~ thirdWritingPause --
    ~ fifthWritingPause --
    
    ~ lastMindfulness --
    
    ~ tiredFrog --
    

    
    
//Aumento di contatori:

    //Contatore spostamenti PG
    ~ player_movementsCounter ++
    
    //Gestione della cucina delle PNG
        //Chitarra
        
            //Chitarra inizia a cucinare se abbiamo cucinato almeno una volta.
            {
                - (cooking_with_first_char or cooking_with_second_char) && (not first_char_cooking_tracker):
                        ~ kitchen_firstCharisCooking = true
                        ~ move_entity(FirstCharacter, Kitchen)
                            -> first_char_cooking_tracker 
            }
            

            {debug: il valore di kitchen_firstCharCookingTime è {kitchen_firstCharCookingTime}}
            {debug: il valore di kitchen_firstCharisCooking è {kitchen_firstCharisCooking}}
            {
                - kitchen_firstCharisCooking == true:
                
                    {
                    
                        - kitchen_firstCharCookingTime < kitchen_firstCharCookingMaxTime:
                            ~ kitchen_firstCharCookingTime ++
                        
                        - else:
                           ~ kitchen_firstCharisCooking = false
                           ~ move_entity(FirstCharacter, Pond)
                    }
    
            }
            
        //Riccio
        
            //Riccio inizia a cucinare. Accade dopo aver fatto pace con Mentore.
            {
                - about_violence_and_peace && not second_char_cooking_tracker:
                    ~ secondIsCooking = true
                    ~ move_entity(SecondCharacter, Kitchen)
                        -> second_char_cooking_tracker
            }            
            
                
            {debug: il valore di secondCookingTime è {secondCookingTime}}
            {debug: il valore disecondtIsCooking è {secondIsCooking}}
            {
                - secondIsCooking == true:
                
                {
                    - secondCookingTime < secondCookingMaxTime:
                        ~ secondCookingTime ++
                    
                    - else:
                       ~ secondIsCooking = false
                       ~ move_entity(SecondCharacter, Pond)
    
                }
    
            }
    

//Check di sicurezza per conchiglia
//    {
//        - availableSpecialMissions hasnt specialMissionOne and nestContents hasnt purpleShell:
//                   ~ move_entity(purpleShell, Nest)
//    }

//Gestione suoni
    {
        - safekeepingContents hasnt TrainNoise:
            ~ move_entity(TrainNoise, Safekeeping)
    }

                 

//Pause speciali tra un dialogo e l'altro
    {
    
        - tutorialPauses == true:
            ~ tutorialPauses = false
        
    }
    

//Avvio dialoghi di chiusura
    {
        - firstChar_storyStatus == story_storyEnded:
	        ~ firstChar_exitCounter ++
	}
	
	{
	    - secondStory == story_storyEnded:
	        ~ secondCharEndingDialogue ++     
    }

//Spostamento di libro e inventario se scoperti
    {
        - safekeepingContents hasnt RewriterBook && currentPlace != Bedroom:
            ~ move_entity(RewriterBook, currentPlace)
    }
    {
        - safekeepingContents hasnt Inventory && currentPlace != Bedroom:
           ~ move_entity(Inventory, currentPlace)
    }



//Altre funzioni:
    -> story_time_management_for_PNG->
    -> check_png_randomizable_status ->
    -> characters_speaking ->
    -> moon_state_management ->
    -> special_events_tracking ->


->->

//Riduzione del tempo di pausa del dialogo fino a quando non siamo a 0
=== characters_speaking
    {
        - firstChar_pauseTalking > 0:
            ~ firstChar_pauseTalking --
            {debug: Il valore di firstChar_pauseTalking è {firstChar_pauseTalking}}
        
        - secondPauseTalking > 0:
            ~ secondPauseTalking --
        
        - thirdPauseTalking > 0:
            ~ thirdPauseTalking --
        
        - fifthPauseTalking > 0:
            ~ fifthPauseTalking --    
    }
->-> 


=== special_events_tracking
//Qui traccio tutti gli eventi eccezionali, così li ho in un unico posto: animazioni, cambi assets e via di seguito

//Comparsa lettere dopo fine delle storie (così non compaiono subito.
    {firstChar_possibleStates hasnt Chitarra && first_char_story_ended.goodbye:
            ~ move_entity(FirstCharacterNotes, TrainStop)
            {debug: Ho messo la nota della prima personaggia alla fermata del bus.}
    }
    
    {second_char_story_ended.goodbye:
            ~ move_entity(SecondCharacterNotes, TrainStop)
            {debug: Ho messo la nota del secondo personaggio alla fermata del bus.}
    }
    
//Eventi legati alla serra    
    {
        - olobino.step_tre.colto && (entity_location(FromPondToGreenhouseBlooming) == Safekeeping):
            ~ move_entity(FromPondToGreenhouse, Safekeeping)
            ~ move_entity(FromPondToGreenhouseBlooming, Pond)
    }

->->
                

=== color_modifier(partner, number)
//funzione utile per modificare botte di colori
{debug: passo per color_modifier. Il valore di partner è {partner}, quello di number è {number}.}

    {
        - partner == FirstCharacter:
            ~ firstChar_purple = firstChar_purple * number
            ~ firstChar_yellow = firstChar_yellow * number
            ~ firstChar_blue = firstChar_blue * number
            ~ firstChar_green = firstChar_green * number
            ~ firstChar_red = firstChar_red * number
            
    
        - partner == SecondCharacter:
            ~ secondPurple = secondPurple * number
            ~ secondYellow = secondYellow * number
            ~ secondBlue = secondBlue * number
            ~ secondGreen = secondGreen * number
            ~ secondRed = secondRed * number

    }
->->
  
  
  
                
/* ---------------------------------
                
Funzione di traduzione da variabile a stringa 
                
----------------------------------*/

=== function translator(characterState)
    {characterState:
    
    //Personaggia Uno
        - Chitarra:
            ~ return "Chitarra"
        - Triangolo:
            ~ return "Triangolo"
        - RagazzaOrchestra:
            ~ return "Orchestra"
        - FlautoDolce:
            ~ return "Flauto Dolce"
        - Ocarina:
            ~ return "Ocarina"
        - Violino:
            ~ return "Violino"

    //Personaggia Due       
        - Riccio:
            ~ return "Riccio"
        - Grizzly:
            ~ return "Grizzly"
        - Lupo:
            ~ return "Lupo"
        - Delfino:
            ~ return "Delfino"
        - Capibara:
            ~ return "Capibara"
        - Corvo:
            ~ return "Corvo"

    //Personaggia Tre
        - SpettroDelVuoto:
            ~ return "Spettro del Vuoto"
        - Consapevole: 
            ~ return "Consapevole"
        - Guarente: 
            ~ return "Guarente"    
        - Socievole: 
            ~ return "Socievole"
        - Terrorizzato: 
            ~ return "Terrorizzato"
        - Abbandonato: 
            ~ return "Abbandonato"    
        - Arrabbiato: 
            ~ return "Arrabbiato"            
    
    //Personaggia Quattro        
        - Mondatrice:
            ~ return "Mondatrice"

    //Personaggia Cinque        
        - Mentore:
            ~ return "Mentore"

    }


