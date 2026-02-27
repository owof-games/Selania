/* ---------------------------------

   Gestione avvio e chiusura storie personagge 

 ----------------------------------*/
    LIST story_storyStatus = story_storyNotStarted, story_storyStarted, story_storyEnded
    
    //Lista che tiene conto di quali storie sono state concluse
    LIST story_endedStories = story_firstCharStoryEnded, story_secondCharStoryEnded, story_thirdCharStoryEnded, story_fourthCharStoryEnded, story_fifthCharStoryEnded
    
    //Lista che tiene conto in ordine progressivo della quantità di storie concluse
    LIST story_endingOrders = story_oneStoryClosed, story_twoStoriesClosed, story_threeStoriesClosed, story_fourStoriesClosed, story_fifthStoriesClosed


=== story_time_management_for_PNG
{debug: passo per story_time_management_for_PNG}
//Questa la uso per far sentire il rumore del treno dove serve
~ temp CurrentLocation = entity_location(PG)

    //Qui commentato a manetta per non fare partire cose che non dovrebbero partire.
    {
        //Dopo il delay previsto, compare Chitarra.
        - player_movementsCounter == firstChar_delay && firstChar_storyStatus == story_storyNotStarted:
        {debug: introduco {FirstCharacter} in scena.}
                ~ move_entity(FirstCharacter, TrainStop)
                ~ move_entity(TrainNoiseComing, CurrentLocation)
                ~ firstChar_storyStatus = story_storyStarted

        //Dopo essere arrivata per la prima volta allo stagno, compare mentore, e attivo la sua storia
        - (pond == true or talk_with_first_character) && (mentorChar_storyStatus != story_storyStarted):
        {debug: introduco mentore in scena.}
                ~ move_entity(Mentor, Forest)
                ~ mentorChar_storyStatus = story_storyStarted
    
    
        //Dopo due steps della storia della prima personaggia, compare la seconda      
        - first_char_main_storylets.two && secondChar_storyStatus == story_storyNotStarted:
        {debug: introduco {SecondCharacter} in scena.}
                ~ move_entity(SecondCharacter, TrainStop)
                ~ move_entity(TrainNoiseComing, CurrentLocation)
                ~ secondChar_storyStatus = story_storyStarted
    
        //Dopo aver aperto la biblioteca, compare il terzo png
        //- open_the_library && not (thirdChar_storyStatus == story_storyStarted):
            //{debug: introduco {ThirdCharacter} in scena.}
                // ~ move_entity(ThirdCharacter, TrainStop)
                // ~ move_entity(TrainNoiseComing, CurrentLocation)
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
                // ~ move_entity(TrainNoiseComing, CurrentLocation)
                //{debug: introduco {FifthCharacter} in scena.}
                //~ fifthChar_storyStatus == story_storyStarted:
                //cambiamento asset per mentore, che passa a mostrone
    }
    
        ->->




/* ---------------------------------

   Funzioni legate a comparsa e spostamenti personagge 

 ----------------------------------*/

//Gestione spostamenti: tempo
    //Quando questa è a zero, non ci sono spostamenti.
    VAR movements_changeLocationTimer = 0
    
    //Questo è invece il valore che indica quando far partire la randomizzazione dei luoghi dell3 PNG.
    VAR movements_changeLocationTrigger = 9
    
    //Questa è la lista dei luoghi dove l3 PNG possono andare. Se serve, posso ampliarla quando si aprono i luoghi, ma è da valutare col bilanciamento.
    //Posti dove potremmo trovarle e che per ora sono chiusi: Dump, Greenhouse, Library.
    //Posti sicuramente vietati, salvo scene speciali: Bedroom, Nest. Kitchen solo per scene ad hoc (es: cucina da solx).
    VAR movements_randomablePlaces = (Forest, TrainStop, Pond)


//Gestione spostamenti: personagge
    VAR movements_randomizable_characters = ()


//Qui apriamo i luoghi cambiando gli assets di riferimento
=== opening_places
{debug: passo da opening_places.}
    {
        - welcome.your_name && (entity_location(FromPondToGreenhouse) == Safekeeping) && not olobino.step_tre.colto:
            // ~ movements_randomablePlaces += Greenhouse
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
            // ~ movements_randomablePlaces += Library
            ~ player_accessiblePlaces += Library
    }


    //Per ora mi appoggio a Riccio, ma poi sbloccherò con PNG3
    {
        - second_char_main_storylets.three && (entity_location(FromForestToDump) == Safekeeping) && (entity_location(PG) != Forest):
            Crediamo sia giunto il momento ti parlare, {player_name}.
            Ti aspettiamo ai margini della foresta.
            Capirai come trovarci.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ move_entity(FromForestToDumpBlocked, Safekeeping)
                ~ move_entity(FromForestToDump, Forest)
                ~ player_accessiblePlaces += Dump
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
        //Evitiamo che venga tolta dalla cucina se sta cucinando o se ci sta aspettando in cucina
            {
                - kitchen_firstCharIsCooking == true:
                    ~ movements_randomizable_characters -= FirstCharacter

                - kitchen_firstCharCookingTogetherInvite == true:
                    ~ movements_randomizable_characters -= FirstCharacter
                
                - else:
                    ~ movements_randomizable_characters += FirstCharacter
            }
        
        - firstChar_storyStatus == story_storyEnded && not first_char_story_ended.goodbye:
            //Così evitiamo che sia alla fermata del treno al momento della partenza, in modo da fare poi l'animazione.
            ~ movements_randomizable_characters -= FirstCharacter 
            ~ move_entity(FirstCharacter, Forest)
    }

    {
        - secondChar_storyStatus == story_storyStarted && second_char_main_storylets.one:
        
        //Evitiamo che venga tolto dalla cucina se sta cucinando o se ci sta aspettando in cucina
        {
            - kitchen_secondCharIsCooking == true:
                ~ movements_randomizable_characters -= SecondCharacter

            - kitchen_secondCharCookingTogetherInvite == true:
                ~ movements_randomizable_characters -= SecondCharacter    
                    
            - else:
                ~ movements_randomizable_characters += SecondCharacter
                
        }
        //Così evitiamo che sia alla fermata del treno al momento della partenza, in modo da fare poi l'animazione.
        - secondChar_storyStatus == story_storyEnded && not second_char_story_ended.goodbye:
            ~ movements_randomizable_characters -= SecondCharacter   
            ~  move_entity(SecondCharacter, Forest)
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
    {second_char_main_storylets.two.theFrog && entity_location(TheFrog)!=Pond:
            {debug: Ho spostato la rana allo stagno.}
           ~  move_entity(TheFrog, Pond)
    }
    
    
    -> randomize_png_location
    


    
    
=== randomize_png_location    
{debug: randomize_png_location.}

    {
        //se ho raggiunto il tempo trigger, resetto il valore, e poi vado avanti.
        - movements_changeLocationTimer >= movements_changeLocationTrigger:
        {debug: <i> Il valore del Timer è {movements_changeLocationTimer} e quindi randomizzo il luogo.}
            -> top

        //altrimenti, aumento il valore e skippo
        - else:
        {debug: <i>il valore del Timer è {movements_changeLocationTimer} e quindi lo aumento.}
            ~ movements_changeLocationTimer ++
            ->->
    }
    
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
    {debug: <i>in on_movement events: arrivo alle altre funzioni.}
    -> notification_system ->
    {debug: <i>in on_movement events: esco dal notification system.}
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


=== special_events_tracking
//Qui traccio tutti gli eventi eccezionali, così li ho in un unico posto: animazioni, cambi assets e via di seguito

//Comparsa lettere dopo fine delle storie (così non compaiono subito.
//La logica è: quando una png se ne va dal gioco, setto  (es.)~ firstChar_mailPause = firstChar_mailPauseDuration
//Quando il valore di firstChar_mailPause è minore di zero: se non c'è già una lettera in giro, sposto la lettera/dogga in stazione.
//Se l'ho letta, quando mi sposterò dalla stazione, il cane se ne andrà
//Se ci sono lettere da leggere e quella del doggo ancora non è stata letta, 
    {
        - first_char_story_ended.goodbye && firstChar_mailPause < 0 && contentsTrainStop hasnt SecondCharacterNotes && not first_character_notes.three:
        
                ~ move_entity(FirstCharacterNotes, TrainStop)
                {debug: Ho messo la nota della prima personaggia alla fermata del bus.}
            
    }
    
    {
        - second_char_story_ended.goodbye && secondChar_mailPause < 0 && contentsTrainStop hasnt FirstCharacterNotes && not second_character_notes.three:
        
                ~ move_entity(SecondCharacterNotes, TrainStop)
                {debug: Ho messo la nota del secondo personaggio alla fermata del bus.}

                
    }
    
    {
        - contentsTrainStop has DoggoNoNotes:
        
                ~ move_entity(DoggoNoNotes, Safekeeping)
                {debug: Ho spostato la dogga nel safekeeping.}
    
    }
    
    
    ~ firstChar_mailPause --
    ~ secondChar_mailPause --
    
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
            ~ firstChar_aether = firstChar_aether * number
            ~ firstChar_earth = firstChar_earth * number
            ~ firstChar_air = firstChar_air * number
            ~ firstChar_water = firstChar_water * number
            ~ firstChar_fire= firstChar_fire* number
            
    
        - partner == SecondCharacter:
            ~ secondChar_aether = secondChar_aether * number
            ~ secondChar_earth = secondChar_earth * number
            ~ secondChar_air = secondChar_air * number
            ~ secondChar_water = secondChar_water * number
            ~ secondChar_fire = secondChar_fire * number

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
~ disableNestDialogue()
{
    - PNG == FirstCharacter:
        {
            - comingFrom == Kitchen:
                {debug: passo dai valori di Kitchen.}
                ~ kitchen_firstCharExtraIngredient = object
                //Levo dalla lista di cose che può donarci la rana
                ~ frog_firstCharObtainedGifts += charOneCooking
                
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
                //Levo dalla lista di cose che può donarci la rana
                ~ frog_firstCharObtainedGifts += charOneCultivable
                
                {   
                    
                    - firstChar_favouritesGifts has object:
                    <i>{~{translator(firstChar_ActualName)} abbraccia {player_name} entusiasta.|Sulle guance di {translator(firstChar_ActualName)} compare una lacrima.|{translator(firstChar_ActualName)} è un concentrato di gioia.}#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                            ~ firstChar_InkLevel ++
                            ~ firstChar_InkLevel ++
         
                    //Presupponiamo che un po' ma non troppo le piaccia l'ingrediente universale
                    - firstChar_goodGifts has object or object == universalIngredient:
                        <i>{~{translator(firstChar_ActualName)} si passa il dono tra le mani.|{translator(firstChar_ActualName)} sorride.|{translator(firstChar_ActualName)} ringrazia {player_name}.}#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                            ~ firstChar_InkLevel ++
                    
                    - else:
                        <i>{~{translator(firstChar_ActualName)} ignora il dono.|{translator(firstChar_ActualName)} ringrazia {player_name} e si distrae rapidamente.}#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                }
                
            
            ~ gift_currentReceiver = ()
            -> first_story_gift.ink_outcome    
        
        }
        
        
    
    - PNG == SecondCharacter:
        {
            - comingFrom == Kitchen:
                {debug: passo dai valori di Kitchen.}
                ~ kitchen_secondCharExtraIngredient = object
                //Levo dalla lista di cose che può donarci la rana
                ~ frog_secondCharObtainedGifts += charTwoCooking
                
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
                //Levo dalla lista di cose che può donarci la rana
                ~ frog_secondCharObtainedGifts += charTwoCultivable
                
                {   
                    
                    - secondChar_favouritesGifts has object:
                       <i>{~{translator(secondChar_ActualName)} abbraccia {player_name}, entusiasta.|Sulle guance di {translator(secondChar_ActualName)} compare una lacrima.|{translator(secondChar_ActualName)} è un concentrato di gioia.}#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                        ~ secondChar_InkLevel ++
                        ~ secondChar_InkLevel ++
         
                    //Presupponiamo che un po' ma non troppo le piaccia l'ingrediente universale
                    - secondChar_goodGifts has object or object == universalIngredient:
                        <i>{~{translator(secondChar_ActualName)} prova ad assaggiare il dono, divertito.|Sulle guance di {translator(secondChar_ActualName)} compare un grande sorriso.|{translator(secondChar_ActualName)} saltella.}#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                        ~ secondChar_InkLevel ++
                    
                    - else:
                        <i>{~{translator(secondChar_ActualName)} insegue una lucertola con lo sguardo.|{translator(secondChar_ActualName)} lascia scivolare il dono a terra.}#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                }
            
            ~ gift_currentReceiver = ()
            -> second_story_gift.ink_outcome    
        
        }    

    - else: 
        ERRORE: valore di PNG non supportato {PNG}.


}




->->


