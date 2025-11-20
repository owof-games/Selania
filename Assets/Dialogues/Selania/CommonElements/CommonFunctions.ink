/* ---------------------------------

   Gestione avvio e chiusura storie personagge 

 ----------------------------------*/
    LIST story_storyStatus = story_storyNotStarted, story_storyStarted, story_storyEnded
    
    //Lista che tiene conto di quali storie sono state concluse
    LIST story_endedStories = story_firstCharStoryEnded, story_secondCharStoryEnded, story_thirdCharStoryEnded, story_fourthCharStoryEnded, story_fifthCharStoryEnded
    
    //Lista che tiene conto in ordine progressivo della quantità di storie concluse
    LIST story_endingOrders = story_oneStoryClosed, story_twoStoriesClosed, story_threeStoriesClosed, story_fourStoriesClosed, story_fifthStoriesClosed
    
    //Soluzione temporanea per risolvere il problema degli storylets di mentore
    VAR actual_speaker = ()
    
//COME PROMEMORIA. LISTA DI TIPI DI TONO CHE POSSIAMO TENERE IN UNA CONVERSAZIONE: ROSSO (RABBIA, PASSIONE, AZIONE, OPPOSIZIONE). VIOLA (SPIRITUALITA', VISIONE DEL GRANDE SCHEMA DELLE COSE, SGUARDO POETICO, TESA VERSO UNA MISSIONE). GIALLO (GIOCOSITA', RISATA, DIVERTIMENTO, FANCIULLEZZA). VERDE (CUORE, AFFETTI, CURA DELLE PERSONE CARE, RIFLESSIONE EMOTIVA). BLU (RAZIONALITA', CALCOLO, VISIONE PRATICA, DISCIPLINA).


=== story_time_management_for_PNG
//Questa la uso per far sentire il rumore del treno dove serve
~ temp CurrentLocation = entity_location(PG)

    //Qui commentato a manetta per non fare partire cose che non dovrebbero partire.
    {
    
        //Dopo essere arrivata per la prima volta allo stagno, compare mentore, e attivo la sua storia
        - (pond == true or talk_with_first_character) && (mentorChar_storyStatus != story_storyStarted):
        {debug: introduco mentore in scena.}
                ~ move_entity(Mentor, Forest)
                ~ mentorChar_storyStatus = story_storyStarted
    
        //Dopo il delay previsto, compare Chitarra.
        - player_movementsCounter == firstChar_delay && firstChar_storyStatus == story_storyNotStarted:
        {debug: introduco {FirstCharacter} in scena.}
                ~ move_entity(FirstCharacter, TrainStop)
                ~ move_entity(TrainNoise, CurrentLocation)
                ~ firstChar_storyStatus = story_storyStarted
                
        //Dopo due steps della storia della prima personaggia, compare la seconda      
        - first_char_main_storylets.two && secondChar_storyStatus == story_storyNotStarted:
        {debug: introduco {SecondCharacter} in scena.}
                ~ move_entity(SecondCharacter, TrainStop)
                ~ move_entity(TrainNoise, CurrentLocation)
                ~ secondChar_storyStatus = story_storyStarted
    
        //Dopo aver aperto la biblioteca, compare il terzo png
        //- open_the_library && not (thirdChar_storyStatus == story_storyStarted):
            //{debug: introduco {ThirdCharacter} in scena.}
                // ~ move_entity(ThirdCharacter, TrainStop)
                // ~ move_entity(TrainNoise, CurrentLocation)
                // ~ thirdChar_storyStatus = story_storyStarted
                
        //X movimenti dopo la furia della mentore, compare la quarta png
        //- player_movementsCounter == delayFourthChar && mentor_rage:
                //{debug: introduco {FourthCharacter} in scena.}
                //~ move_entity(FourthCharacter, Forest)
                //~ fourthChar_storyStatus = story_storyStarted
                //qualcosa per panchina sistemata
                
        //E quando la storia della quarta è a tre, si presenta la mentore come uovo
        //- knowing_fourth_character.three && fifthChar_storyStatus == story_storyNotStarted:
                //~ qualcosa per trasformare mentore in uovo
                    
        //E quando la storia della quarta è a cinque steps, parte la storia della mentore
        //- knowing_fourth_character.five && fifthChar_storyStatus == story_storyNotStarted && qualcosa per cui abbiamo tocca l'uovo almeno una volta:
                // ~ move_entity(TrainNoise, CurrentLocation)
                //{debug: introduco {FifthCharacter} in scena.}
                //~ fifthChar_storyStatus == story_storyStarted:
                //cambiamento asset per mentore, che passa a mostrone
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
        - mentorChar_storyStatus == story_storyStarted:
            ~ movements_randomizable_characters += Mentor
        
        - mentorChar_storyStatus == story_storyEnded:  
            ~ movements_randomizable_characters -= Mentor 
    }


    {
        - firstChar_storyStatus == story_storyStarted:
            ~ movements_randomizable_characters += FirstCharacter
        
        - firstChar_storyStatus == story_storyEnded:  
            ~ movements_randomizable_characters -= FirstCharacter 
    }

    {
        - secondChar_storyStatus == story_storyStarted:
        
        //Evitiamo che venga tolto dalla cucina se sta cucinando
        {
            - kitchen_secondCharIsCooking == true:
                ~ movements_randomizable_characters -= SecondCharacter
            - else:
                ~ movements_randomizable_characters += SecondCharacter
                
        }
        
        - secondChar_storyStatus == story_storyEnded:
                ~ movements_randomizable_characters -= SecondCharacter 
    }
  
    {    
        - thirdChar_storyStatus == story_storyStarted:
             ~ movements_randomizable_characters += ThirdCharacter
        
        - thirdChar_storyStatus == story_storyEnded:
            ~ movements_randomizable_characters -= ThirdCharacter
    }
    
    {
        - fourthChar_storyStatus == story_storyStarted:
            ~ movements_randomizable_characters += FourthCharacter    
        
         - fourthChar_storyStatus == story_storyEnded:
            ~ movements_randomizable_characters -= FourthCharacter 
    }
    
    {
        - fifthChar_storyStatus == story_storyStarted:
            ~ movements_randomizable_characters += Mentor
        
        -   fifthChar_storyStatus == story_storyEnded:  
            ~ movements_randomizable_characters -= Mentor
    }
    
    //Comparsa della rana
    {second_char_main_storylets.three.theFrog && entity_location(TheFrog)!=Pond:
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
    ~ secondChar_mailPause --
    ~ thirdChar_mailPause --
    ~ fifthChar_mailPause --
    
//Riduzione valore Mindfulness per proporne una diversa poi    
    ~ lastMindfulness --

//Riduzione stanchezza rana
    ~ frog_tiredValue --

//Contatore spostamenti PG
    ~ player_movementsCounter ++
    
//Gestione della cucina delle PNG
    
    //Riccio
    //Riccio inizia a cucinare. Metto prima di Chitarra giusto perché il suo storylet coinvolge anche Mentore e quindi forse è più interessante.
    //Ho messo (entity_location(SecondCharacter) != Kitchen) perché così non parte mai la cucina autonoma se c'è qualcunx in cucina.
    
        {
            - player_accessiblePlaces has Kitchen && (not second_char_cooking_tracker) && (entity_location(FirstCharacter) != Kitchen) && second_char_main_storylets:
            
                ~ kitchen_secondCharIsCooking = true
                ~ move_entity(SecondCharacter, Kitchen)
                    -> second_char_cooking_tracker
        }            
        
            
        //Gestione tempi di cucina autonoma di Riccio.
        {debug: il valore di kitchen_secondCharCookingTime è {kitchen_secondCharCookingTime}}
        {debug: il valore disecondtIsCooking è {kitchen_secondCharIsCooking}}
        {
            - kitchen_secondCharIsCooking == true:
            
            {
                - kitchen_secondCharCookingTime < kitchen_secondCharCookingMaxTime:
                    ~ kitchen_secondCharCookingTime ++
                
                - else:
                   ~ kitchen_secondCharIsCooking = false
                   ~ move_entity(SecondCharacter, Pond)
            }
            
        }
    //Chitarra
    //Chitarra inizia a cucinare se abbiamo cucinato almeno una volta.
        {
            - player_accessiblePlaces has Kitchen && (not first_char_cooking_tracker) && (entity_location(SecondCharacter) != Kitchen):
            
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
                }

        }
        
    
//Gestione suoni
    {
        - safekeepingContents hasnt TrainNoise:
            ~ move_entity(TrainNoise, Safekeeping)
    }

                 

//Pause speciali tra un dialogo e l'altro
    {
    
        - mentor_tutorialPauses == true:
            ~ mentor_tutorialPauses = false
        
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
        - safekeepingContents hasnt RewriterBook && currentPlace != Bedroom:
            ~ move_entity(RewriterBook, currentPlace)
    }
    {
        - safekeepingContents hasnt Backpack && currentPlace != Bedroom:
           ~ move_entity(Backpack, currentPlace)
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
        
        - secondChar_pauseTalking > 0:
            ~ secondChar_pauseTalking --
        
        - thirdChar_pauseTalking > 0:
            ~ thirdChar_pauseTalking --
        
        - mentor_pauseTalking > 0:
            ~ mentor_pauseTalking --    
    }
->-> 


=== special_events_tracking
//Qui traccio tutti gli eventi eccezionali, così li ho in un unico posto: animazioni, cambi assets e via di seguito

//Comparsa lettere dopo fine delle storie (così non compaiono subito.
    {first_char_story_ended.goodbye && firstChar_mailPause == 0:
            ~ move_entity(FirstCharacterNotes, TrainStop)
            {debug: Ho messo la nota della prima personaggia alla fermata del bus.}
    }
    
    {second_char_story_ended.goodbye && secondChar_mailPause == 0:
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
            ~ secondChar_purple = secondChar_purple * number
            ~ secondChar_Yellow = secondChar_Yellow * number
            ~ secondChar_Blue = secondChar_Blue * number
            ~ secondChar_Green = secondChar_Green * number
            ~ secondChar_Red = secondChar_Red * number

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



                    /* ---------------------------------
                                    
                Funzione di gestione di doni e ingredienti, accorpata
                                    
                    ----------------------------------*/
                    

=== object_value_for_PNG(object, comingFrom, PNG)
{debug: passo per object_value_for_PNG. Il valore di object è {object}, di comingFrom è {comingFrom}, di PNG {PNG}.}

{
    - PNG == FirstCharacter:
        {
            - comingFrom == Kitchen:
                {debug: passo dai valori di Kitchen.}
                ~ kitchen_firstCharExtraIngredient = object
                
                {   
                    - object == universalIngredient:
                        {debug: oggetto è universalIngredient.}
                            ~ kitchen_firstCharExtraIngredientReaction = goodReaction

                    - firstChar_favouritesGifts has object:
                        {debug: l'oggetto è in firstChar_favouritesGifts.}
                            ~ kitchen_firstCharExtraIngredientReaction = goodReaction

                    - firstChar_goodGifts has object:
                        {debug: l'oggetto è in firstChar_goodGifts.}
                            ~ kitchen_firstCharExtraIngredientReaction = mehReaction
                            
                    - else:
                        {debug: a Chitarra l'oggetto non interessa.}
                            ~ kitchen_firstCharExtraIngredientReaction = badReaction
                            
                }
                ->->
            
            - comingFrom == Backpack:
                {debug: passo dai valori dello zaino.}
                ~ firstChar_giftedObject += object
                
                {   
                    
                    - firstChar_favouritesGifts has object:
                    {~ {translator(firstChar_ActualName)} ti abbraccia, entusiasta.|Sulle guancie di {translator(firstChar_ActualName)} compare una lacrima.|{translator(firstChar_ActualName)} è un concentrato di gioia.}#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                            ~ firstChar_InkLevel ++
                            ~ firstChar_InkLevel ++
         
                    //Presupponiamo che un po' ma non troppo le piaccia l'ingrediente universale
                    - firstChar_goodGifts has object or object == universalIngredient:
                        {~ {translator(firstChar_ActualName)} si passa il dono tra le mani.|{translator(firstChar_ActualName)} ti sorride.|{translator(firstChar_ActualName)} ti ringrazia.}#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                            ~ firstChar_InkLevel ++
                    
                    - else:
                        {~ {translator(firstChar_ActualName)} ignora il dono.|{translator(firstChar_ActualName)} ti ringrazia, e si distrae rapidamente.}#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                }
                
            
            ~ gift_currentReceiver = ()
            -> first_story_gift.ink_outcome    
        
        }
        
        
    
    - PNG == SecondCharacter:
        {
            - comingFrom == Kitchen:
                {debug: passo dai valori di Kitchen.}
                ~ kitchen_secondCharExtraIngredient = object
                
                {   
                    - object == universalIngredient:
                        {debug: oggetto è universalIngredient.}
                            ~ kitchen_secondCharExtraIngredientReaction = goodReaction

                    - secondChar_favouritesGifts has object:
                        {debug: l'oggetto è in secondChar_favouritesGifts.}
                            ~ kitchen_secondCharExtraIngredientReaction = goodReaction

                    - secondChar_goodGifts has object:
                        {debug: l'oggetto è in secondChar_goodGifts.}
                            ~ kitchen_secondCharExtraIngredientReaction = mehReaction
                            
                    - else:
                         {debug: a Riccio l'oggetto non interessa.}
                            ~ kitchen_secondCharExtraIngredientReaction = badReaction
                            
                }
                ->->
            
            - comingFrom == Backpack:
                {debug: passo dai valori dello zaino.}
                ~ secondChar_giftedObject += object
                
                {   
                    
                    - secondChar_favouritesGifts has object:
                       {~ {translator(secondChar_ActualName)} ti abbraccia, entusiasta.|Sulle guancie di {translator(secondChar_ActualName)} compare una lacrima.|{translator(secondChar_ActualName)} è un concentrato di gioia.}#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                        ~ secondChar_InkLevel ++
                        ~ secondChar_InkLevel ++
         
                    //Presupponiamo che un po' ma non troppo le piaccia l'ingrediente universale
                    - secondChar_goodGifts has object or object == universalIngredient:
                        {~ {translator(secondChar_ActualName)} prova ad assaggiare il dono, divertito.|Sulle guancie di {translator(secondChar_ActualName)} compare un grande sorriso.|{translator(secondChar_ActualName)} saltella.}#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                        ~ secondChar_InkLevel ++
                    
                    - else:
                        {~ {translator(secondChar_ActualName)} insegue una lucertola con lo sguardo.|{translator(secondChar_ActualName)} lascia scivolare il dono a terra.}#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                }
            
            ~ gift_currentReceiver = ()
            -> second_story_gift.ink_outcome    
        
        }    

    - else: ERRORE: valore di PNG non supportato {PNG}.

}




->->


