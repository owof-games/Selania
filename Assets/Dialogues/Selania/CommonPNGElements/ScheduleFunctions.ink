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
            ~ player_accessiblePlaces += Greenhouse
            ~ move_entity(FromPondToGreenhouseBlocked, Safekeeping)
            ~ move_entity(FromPondToGreenhouse, Pond)
            // ~ movements_randomablePlaces += Greenhouse
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

//Qui aggiorniamo lo stato di randomizzabilità o meno di unx PNG
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
        
        - firstChar_storyStatus == story_storyEnded && contentsSafekeeping hasnt FirstCharacter:
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
        - secondChar_storyStatus == story_storyEnded && contentsSafekeeping hasnt SecondCharacter:
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
    

//Qui randomizziamo chi può essere randomizzatx.    
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
    
=== special_events_tracking
//Qui traccio tutti gli eventi eccezionali, così li ho in un unico posto: animazioni, cambi assets e via di seguito

//Comparsa lettere dopo fine delle storie (così non compaiono subito.
//La logica è: quando una png se ne va dal gioco, setto  (es.)~ firstChar_mailPause = firstChar_mailPauseDuration
//Quando il valore di firstChar_mailPause è minore di zero: se non c'è già una lettera in giro, sposto la lettera/dogga in stazione.
//Se l'ho letta, quando mi sposterò dalla stazione, il cane se ne andrà
//Se ci sono lettere da leggere e quella del doggo ancora non è stata letta, 
    {
        - first_char_story_ended.goodbye && firstChar_mailPause < 0 && contentsTrainStop hasnt DoggoSecondLetters && not first_character_notes.three:
        
                ~ move_entity(DoggoFirstLetters, TrainStop)
                {debug: Ho messo la nota della prima personaggia alla fermata del bus.}
            
    }
    
    {
        - second_char_story_ended.goodbye && secondChar_mailPause < 0 && contentsTrainStop hasnt DoggoFirstLetters && not second_character_notes.three:
        
                ~ move_entity(DoggoSecondLetters, TrainStop)
                {debug: Ho messo la nota del secondo personaggio alla fermata del bus.}

                
    }
    
    {
        - contentsTrainStop has DoggoNoLetters:
        
                ~ move_entity(DoggoNoLetters, Safekeeping)
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


                


  
                



