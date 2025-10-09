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
~ temp CurrentLocation = entity_location(PG)
    //Qui commentato a manetta per non fare partire cose che non dovrebbero partire.
    {
    
    //Dopo il delay previsto, compare Chitarra.
        - movementsCounter == delayFirstChar && firstStory == StoryNotStarted:
                ~ move_entity(FirstCharacter, TrainStop)
                ~ move_entity(TrainNoise, CurrentLocation)
                ~ firstStory = StoryStarted
                
    //Dopo due steps della storia della prima personaggia, compare la seconda      
        - knowing_first_character.two && secondStory == StoryNotStarted:
                ~ move_entity(SecondCharacter, TrainStop)
                ~ move_entity(TrainNoise, CurrentLocation)
                ~ secondStory = StoryStarted
    
    //Al primo dono fatto, compare il terzo png
        //- first_story_gift.ink_outcome or second_story_gift.ink_outcome:
               // ~ move_entity(ThirdCharacter, TrainStop)    
                //~ thirdStory = StoryStarted
                
    //Due movimenti dopo la furia della mentore, compare la quarta png
        //- movementsCounter == delayFourthChar && mentor_rage:
                //~ move_entity(FourthCharacter, Forest)
                //~ fourthStory = StoryStarted
                //qualcosa per panchina sistemata
                
    //E quando la storia della quarta è a tre, si presenta la mentore come uovo
        //- knowing_fourth_character.three && fifthStory == StoryNotStarted:
                //~ qualcosa per trasformare mentore in uovo
                    
    //E quando la storia della quarta è a cinque steps, parte la storia della mentore
        //- knowing_fourth_character.five && fifthStory == StoryNotStarted && qualcosa per cui abbiamo tocca l'uovo almeno una volta:
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
    VAR firstTierPlaces =(Forest, TrainStop, Pond)
    VAR secondTierPlaces =(Forest, TrainStop, Library, Pond)
    VAR thirdTierPlaces = (Forest, TrainStop, Library, Laboratory, Pond)
    VAR fourthTierPlaces = (Forest, TrainStop, Library, Nest, Laboratory, Pond)

//Gestione spostamenti: luoghi. I luoghi si aprono alla fine di ogni storia.
    //First tier: tier iniziale.
    VAR firstTier = false
    //Second tier. Con la fine della prima storia.
    VAR secondTier = false
    //Third Tier. Con la fine della seconda storia.
    VAR thirdTier = false
    //Fourth Tier. Con la fine della terza storia.
    VAR fourthTier = false

//Gestione spostamenti: personagge
    VAR randomizable_characters = (Mentor)
    
=== randomizer_png_location
//Ho una lista di luoghi che svuoto e poi resetto, così che sia percepibile come effettivamente randomica
//Questa parte sarà da sistemare una volta che avrò completato tutti gli spazi.

    //Check stato tier
    {   
            // - open_the_third_place:
                    //~ fourthTier = true
                    
            // - open_the_kitchen:
                     //~ thirdTier = true
                     
            - (firstStory == StoryEnded) or (secondStory == StoryEnded):
                     ~ secondTier = true
                     //Abilito l'accesso alla library
                     ~ move_entity(FromForestToLibraryDesat, Safekeeping)
                     ~ move_entity(FromForestToLibrary, Forest)
                     
            - firstStory == StoryNotStarted:
                    ~ move_entity(Mentor, TrainStop)
                    ~ firstTier = true
    }
    
    //Aggiunta delle personagge randomizzabili quando la loro storia è attiva. Non serve la mentore perché va per la sua.

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
  
    //{    
        //- thirdStory == StoryStarted:
            // ~ randomizable_characters += ThirdCharacter
        
        // - thirdStory == StoryEnded:
            // ~ randomizable_characters -= ThirdCharacter
    //}
    
    //{
        // - fourthStory == StoryStarted:
            // ~ randomizable_characters += FourthCharacter    
        
        // - fourthStory == StoryEnded:
            // ~ randomizable_characters -= FourthCharacter 
    //}
    
    {//se ho raggiunto il tempo trigger, resetto il valore, metto la mentore tra le randomizzabili, e poi vado avanti.
        - changeLocationTimer == changeLocationTrigger:
            ~ changeLocationTimer = 0
            ~ randomizable_characters += Mentor
            {debug: <i> Il valore del Timer è {changeLocationTimer} e quindi randomizzo il luogo.}
            {   
                
                //- fourthTier == true:
                    //-> randomizer_fourth_tier
                //- thirdTier == true:
                    //-> randomizer_third_tier
                - secondTier == true:
                    -> randomizer_second_tier
                - firstTier == true:
                    -> randomizer_first_tier
            }
        //altrimenti, aumento il valore e skippo
        - else:
        {debug: <i>il valore del Timer è {changeLocationTimer} e quindi lo aumento.}
            ~ changeLocationTimer ++
            ->->

    }

=== randomizer_first_tier
    = top
        ~ temp character = LIST_RANDOM(randomizable_characters)
        ~ temp location = LIST_RANDOM(firstTierPlaces)
        ~ move_entity(character, location)
        ~ randomizable_characters -= character
    
        {debug: <i> {character} si trova in {location}.}
        
        {
            - randomizable_characters != ():
                -> top
            - else:
                ->->
        }
        
    {debug:<i> {character} è stato spostato in {location}.}

=== randomizer_second_tier
    = top
        ~ temp character = LIST_RANDOM(randomizable_characters)
        ~ temp location = LIST_RANDOM(secondTierPlaces)
        ~ move_entity(character, location)
        ~ randomizable_characters -= character    
        
        {debug: <i>{character} si trova in {location}.}       
        
        {
            - randomizable_characters != ():
                -> top
            - else:
                ->->
        }

    {debug: <i>{character} è stato spostato in {location}.}
    ->->

=== randomizer_third_tier
    = top
        ~ temp character = LIST_RANDOM(randomizable_characters)
        ~ temp location = LIST_RANDOM(thirdTierPlaces)
        ~ move_entity(character, location)
        ~ randomizable_characters -= character
        
        {debug: <i>{character} si trova in {location}.}
        
        {
            - randomizable_characters != ():
                -> top
            - else:
                ->->
        }
        
        {debug: <i>{character} è stato spostato in {location}.}
    

        ->->
    
=== randomizer_fourth_tier
        = top
        ~ temp character = LIST_RANDOM(randomizable_characters)
        ~ temp location = LIST_RANDOM(firstTierPlaces)
        ~ move_entity(character, location)
        ~ randomizable_characters -= character
        
        {debug: <i> {character} si trova in {location}.}
        
        {
            - randomizable_characters != ():
                -> top
            - else:
                ->->
        }
        
        {debug:<i> {character} è stato spostato in {location}.}

        ->->




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
    
    {
       - knowing_second_character.five.theFrog && not are_two_entities_together(TheFrog, Mentor):
            {debug: Ho spostato la rana allo stagno.}
           ~  move_entity(TheFrog, Pond)
       - else:
           ~  move_entity(TheFrog, Safekeeping)
           {debug: Ho spostato la rana nel Safekeeping.}
    }

//Altre funzioni:
    -> characters_speaking ->
    -> randomizer_png_location ->
    -> story_time_management_for_PNG->    

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


