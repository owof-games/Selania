/* ---------------------------------

   Gestione avvio e chiusura storie personagge 

 ----------------------------------*/
    LIST storyStates = StoryNotStarted, StoryStarted, StoryEnded
    
    //Gestione parte dell'albero collegata e recap finale
    LIST endedStories = firstES, secondES, thirdES, fourthES, fifthES
    LIST endingOrders = firstEnd, secondEnd, thirdEnd, fourthEnd, fifthEnd
    VAR char = ()

//COME PROMEMORIA. LISTA DI TIPI DI TONO CHE POSSIAMO TENERE IN UNA CONVERSAZIONE: ROSSO (RABBIA, PASSIONE, AZIONE, OPPOSIZIONE). VIOLA (SPIRITUALITA', VISIONE DEL GRANDE SCHEMA DELLE COSE, SGUARDO POETICO, TESA VERSO UNA MISSIONE). GIALLO (GIOCOSITA', RISATA, DIVERTIMENTO, FANCIULLEZZA). VERDE (CUORE, AFFETTI, CURA DELLE PERSONE CARE, RIFLESSIONE EMOTIVA). BLU (RAZIONALITA', CALCOLO, VISIONE PRATICA, DISCIPLINA).

//Attesa comparsa prima personaggia
    VAR delayFirstChar = 2

//Attesa comparsa quarta personaggia
    VAR delayFourthChar = 4
    
    
=== story_time_management_for_PNG
//Questa la uso per far sentire il rumore del treno dove serve
~ temp CurrentLocation = entity_location(PG)

    //Qui commentato a manetta per non fare partire cose che non dovrebbero partire.
    {
    
        //Dopo essere arrivata per la prima volta allo stagno, compare mentore, e attivo la sua storia
        - (pond == true) && (mentorStory != StoryStarted):
        {debug: introduco mentore in scena.}
                ~ move_entity(Mentor, Forest)
                ~ mentorStory = StoryStarted
    
        //Dopo il delay previsto, compare Chitarra.
        - movementsCounter == delayFirstChar && firstStory == StoryNotStarted:
        {debug: introduco {FirstCharacter} in scena.}
                ~ move_entity(FirstCharacter, TrainStop)
                ~ move_entity(TrainNoise, CurrentLocation)
                ~ firstStory = StoryStarted
                
        //Dopo due steps della storia della prima personaggia, compare la seconda      
        - knowing_first_character.two && secondStory == StoryNotStarted:
        {debug: introduco {SecondCharacter} in scena.}
                ~ move_entity(SecondCharacter, TrainStop)
                ~ move_entity(TrainNoise, CurrentLocation)
                ~ secondStory = StoryStarted
    
        //Dopo aver aperto la biblioteca, compare il terzo png
        //- open_the_library && not (thirdStory == StoryStarted):
            //{debug: introduco {ThirdCharacter} in scena.}
                // ~ move_entity(ThirdCharacter, TrainStop)
                // ~ move_entity(TrainNoise, CurrentLocation)
                // ~ thirdStory = StoryStarted
                
        //X movimenti dopo la furia della mentore, compare la quarta png
        //- movementsCounter == delayFourthChar && mentor_rage:
                //{debug: introduco {FourthCharacter} in scena.}
                //~ move_entity(FourthCharacter, Forest)
                //~ fourthStory = StoryStarted
                //qualcosa per panchina sistemata
                
        //E quando la storia della quarta è a tre, si presenta la mentore come uovo
        //- knowing_fourth_character.three && fifthStory == StoryNotStarted:
                //~ qualcosa per trasformare mentore in uovo
                    
        //E quando la storia della quarta è a cinque steps, parte la storia della mentore
        //- knowing_fourth_character.five && fifthStory == StoryNotStarted && qualcosa per cui abbiamo tocca l'uovo almeno una volta:
                // ~ move_entity(TrainNoise, CurrentLocation)
                //{debug: introduco {FifthCharacter} in scena.}
                //~ fifthStory == StoryStarted:
                //cambiamento asset per mentore, che passa a mostrone
    
    
    
    //Check per l'allontanamento delle personagge
        //- firstStory == StoryEnded && movementsCounter > 10:
            //~ move_entity(FirstCharacter, Safekeeping)
            //~ move_entity(FirstCharacterNotes, TrainStop)
            
        //- secondStory == StoryEnded && movementsCounter > 10:
            //~ move_entity(SecondCharacter, Safekeeping)
            //~ move_entity(SecondCharacterNotes, TrainStop)
            
        //- thirdStory == StoryEnded && movementsCounter > 10:
            //~ move_entity(ThirdCharacter, Safekeeping)
            //~ move_entity(ThirdCharacterNotes, TrainStop)
            
        //- fourthStory == StoryEnded && movementsCounter > 10:
            //~ move_entity(FourthCharacter, Safekeeping)
           // ~ move_entity(FourthCharacterNotes, TrainStop)
            
        //- fifthStory == StoryEnded && movementsCounter > 10:
            //~ move_entity(Mentor, Safekeeping)
           // ~ move_entity(FifthCharacterNotes, TrainStop)
    }
    
        ->->




/* ---------------------------------

   Funzioni legate a comparsa e spostamenti personagge 

 ----------------------------------*/

//REMIND: metà storia personaggia -> compare nuova personaggia. Fine storia personaggia -> si attiva un nuovo luogo.

//Gestione spostamenti: tempo
    VAR changeLocationTimer = 0
    VAR changeLocationTrigger = 9

//Settaggio luoghi attivi a seconda del tier
//Nota: fino a quando il gioco non sarà completo, la biblioteca si aprirà per ultima, sostituendo il primo dei luoghi mancanti.
    //VAR firstTierPlaces =(Forest, TrainStop, Pond)
    //VAR secondTierPlaces =(Forest, TrainStop, Library, Pond)
    //VAR thirdTierPlaces = (Forest, TrainStop, Library, Laboratory, Pond)
    //VAR fourthTierPlaces = (Forest, TrainStop, Library, Nest, Laboratory, Pond)
    
    VAR randomablePlaces = (Forest, TrainStop, Pond)
    // Laboratory, Library, Nest, Greenhouse

//Gestione spostamenti: luoghi. I luoghi si aprono alla fine di ogni storia.
    //First tier: tier iniziale.
    //VAR firstTier = false
    //Second tier. Con la fine della prima storia.
    //VAR secondTier = false
    //Third Tier. Con la fine della seconda storia.
    //VAR thirdTier = false
    //Fourth Tier. Con la fine della terza storia.
    //VAR fourthTier = false

//Gestione spostamenti: personagge
    VAR randomizable_characters = ()
    

=== check_png_randomizable_status
//Prima cosa: se una storia è iniziata, aggiungo la personaggia alla lista dei randomizzabili, altrimenti la levo
    {debug: passo da check_png_randomizable_status.}
    
    {
        - mentorStory == StoryStarted:
            ~ randomizable_characters += Mentor
        
        - mentorStory == StoryEnded:  
            ~ randomizable_characters -= Mentor 
    }


    {
        - firstStory == StoryStarted:
            ~ randomizable_characters += FirstCharacter
        
        - firstStory == StoryEnded:  
            ~ randomizable_characters -= FirstCharacter 
    }

    {
        - secondStory == StoryStarted:
                ~ randomizable_characters += SecondCharacter
                    
        - secondStory == StoryEnded:
                ~ randomizable_characters -= SecondCharacter 
    }
  
    {    
        - thirdStory == StoryStarted:
             ~ randomizable_characters += ThirdCharacter
        
        - thirdStory == StoryEnded:
            ~ randomizable_characters -= ThirdCharacter
    }
    
    {
        - fourthStory == StoryStarted:
            ~ randomizable_characters += FourthCharacter    
        
         - fourthStory == StoryEnded:
            ~ randomizable_characters -= FourthCharacter 
    }
    
    {
        - fifthStory == StoryStarted:
            ~ randomizable_characters += Mentor
        
        -   fifthStory == StoryEnded:  
            ~ randomizable_characters -= Mentor
    }
    
    //Comparsa della rana
    {knowing_second_character.five.theFrog && (not are_two_entities_together(TheFrog, Mentor)) && entity_location(TheFrog)!=Pond:
            {debug: Ho spostato la rana allo stagno.}
           ~  move_entity(TheFrog, Pond)
    }
    
    -> opening_places
    

//Qui apriamo i luoghi cambiando gli assets di riferimento
=== opening_places
{debug: passo da opening_places.}
    {
        - welcome.your_name && (entity_location(FromPondToGreenhouse) == Safekeeping):
            ~ randomablePlaces += Greenhouse
            ~ playerAccessiblePlaces += Greenhouse
            ~ move_entity(FromPondToGreenhouseBlocked, Safekeeping)
            ~ move_entity(FromPondToGreenhouse, Pond)
    }
    
    {
        - open_the_kitchen && (entity_location(FromPondToKitchen) == Safekeeping):
            ~ playerAccessiblePlaces += Kitchen
            ~ move_entity(FromPondToKitchenBlocked, Safekeeping)
            ~ move_entity(FromPondToKitchen, Pond)
    }
    
    {
        - open_the_third_place && (entity_location(FromLibraryToNest) == Safekeeping):
            ~ playerAccessiblePlaces += Nest
            ~ move_entity(FromLibraryToNestBlocked, Safekeeping)
            ~ move_entity(FromLibraryToNest, Pond)
    }
    
    {
        - open_the_library && (entity_location(FromForestToLibrary) == Safekeeping):
        
            ~ move_entity(FromForestToLibraryBlocked, Safekeeping)
            ~ move_entity(FromForestToLibrary, Forest)
            ~ randomablePlaces += Library
            ~ playerAccessiblePlaces += Library
    }

-> randomize_png_location
    
    
=== randomize_png_location    
{debug: randomize_png_location.}

    {//se ho raggiunto il tempo trigger, resetto il valore, e poi vado avanti.
        - changeLocationTimer == changeLocationTrigger:
        {debug: <i> Il valore del Timer è {changeLocationTimer} e quindi randomizzo il luogo.}
            -> top

        //altrimenti, aumento il valore e skippo
        - else:
        {debug: <i>il valore del Timer è {changeLocationTimer} e quindi lo aumento.}
            ~ changeLocationTimer ++
            ->->
    }
    
    //provare così, o vedere se invece è il caso di creare una variabile temporanea per le liste
            = top
            ~ changeLocationTimer = 0
            //~ temp list_character = randomizable_characters
            ~ temp character = LIST_RANDOM(randomizable_characters)
                {debug: le personagge randomizzabili sono {randomizable_characters}}
                //{debug: le personagge nella lista temporanea sono {randomizable_characters}}
                {debug: la personaggia randomizzata è {character}}
            ~ temp location = LIST_RANDOM(randomablePlaces)
                {debug: i luoghi randomizzabili sono {randomablePlaces}}
                {debug: il luogo scelto per la randomizzazione è {location}}
            
            ~ move_entity(character, location)
            ~ randomizable_characters -= character    
            
            {debug: <i>{character} si trova in {location}.}       
            
            {
               - randomizable_characters != ():
                    -> top
               - else:
                    ->->
            }
    
    ->->
    
    
    

    
//Vecchia versione commentata    
    
    //{//se ho raggiunto il tempo trigger, resetto il valore, metto la mentore tra le randomizzabili, e poi vado avanti.
        //- changeLocationTimer == changeLocationTrigger:
           //~ changeLocationTimer = 0
           // ~ randomizable_characters += Mentor
            //{debug: <i> Il valore del Timer è {changeLocationTimer} e quindi randomizzo il luogo.}
            //{   
                
                //- fourthTier == true:
                    //-> randomizer_fourth_tier
                //- thirdTier == true:
                    //-> randomizer_third_tier
                //- secondTier == true:
                    //-> randomizer_second_tier
                //- firstTier == true:
                    //-> randomizer_first_tier
            //}
        //altrimenti, aumento il valore e skippo
        //- else:
        //{debug: <i>il valore del Timer è {changeLocationTimer} e quindi lo aumento.}
            //~ changeLocationTimer ++
            //->->

    //}

//=== randomizer_first_tier
    //= top
        //~ temp character = LIST_RANDOM(randomizable_characters)
        //~ temp location = LIST_RANDOM(firstTierPlaces)
        //~ move_entity(character, location)
        //~ randomizable_characters -= character
    
        //{debug: <i> {character} si trova in {location}.}
        
        //{
        //    - randomizable_characters != ():
        //        -> top
       //     - else:
        //        ->->
        //}
        
    //{debug:<i> {character} è stato spostato in {location}.}

//=== randomizer_second_tier
    //= top
       // ~ temp character = LIST_RANDOM(randomizable_characters)
       // ~ temp location = LIST_RANDOM(secondTierPlaces)
        //~ move_entity(character, location)
        //~ randomizable_characters -= character    
        //
        //{debug: <i>{character} si trova in {location}.}       
        //
        //{
        //    - randomizable_characters != ():
        //        -> top
        //    - else:
        //        ->->
        //}

    //{debug: <i>{character} è stato spostato in {location}.}
    //->->

//=== randomizer_third_tier
   // = top
       // ~ temp character = LIST_RANDOM(randomizable_characters)
       // ~ temp location = LIST_RANDOM(thirdTierPlaces)
       // ~ move_entity(character, location)
       // ~ randomizable_characters -= character
       // 
       // {debug: <i>{character} si trova in {location}.}
       // 
       // {
      //      - randomizable_characters != ():
      //          -> top
      //      - else:
       //         ->->
      //  }
      //  
     //   {debug: <i>{character} è stato spostato in {location}.}
    //

      //  ->->
    
//=== randomizer_fourth_tier
        //= top
        //~ temp character = LIST_RANDOM(randomizable_characters)
       // ~ temp location = LIST_RANDOM(firstTierPlaces)
       // ~ move_entity(character, location)
       // ~ randomizable_characters -= character
      //  
      //  {debug: <i> {character} si trova in {location}.}
      //  
       // {
      //      - randomizable_characters != ():
      //          -> top
       //     - else:
      //          ->->
      //  }
     //   
       // {debug:<i> {character} è stato spostato in {location}.}
//
      // ->->




/* ---------------------------------

   Aggiornamenti di stato durante gli spostamenti 

 ----------------------------------*/

    
=== on_movement_events
//Qui metto tutte quelle funzioni e variazioni che sono richieste a ogni cambio stanza.

//Riduzioni di contatori legati al tempo:
    ~ firstWritingPause --
    ~ secondWritingPause --
    ~ thirdWritingPause --
    ~ fifthWritingPause --
    
    ~ lastMindfulness --
    
//Aumento di contatori:
    ~ movementsCounter ++
    
//Pause speciali tra un dialogo e l'altro
    {
    
        - tutorialPauses == true:
            ~ tutorialPauses = false
        
    }
    

//Avvio dialoghi di chiusura
    {
        - firstStory == StoryEnded:
	        ~ firstCharEndingDialogue ++
	}
	
	{
	    - secondStory == StoryEnded:
	        ~ secondCharEndingDialogue ++     
    }


//Altre funzioni:
    -> special_events_tracking ->
    -> characters_speaking ->
    -> check_png_randomizable_status ->
    -> story_time_management_for_PNG->
    -> moon_state_management ->

->->

//Riduzione del tempo di pausa del dialogo fino a quando non siamo a 0
=== characters_speaking
    {
        - firstPauseTalking > 0:
            ~ firstPauseTalking --
            {debug: Il valore di firstPauseTalking è {firstPauseTalking}}
        
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

//Gestione suoni
    {
           - safekeepingContents hasnt TrainNoise:
               ~ move_entity(TrainNoise, Safekeeping)
    }


//Comparsa lettere dopo fine delle storie (così non compaiono subito.
    {firstCharacterPossibleStates hasnt Chitarra && first_char_story_ended.goodbye:
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


