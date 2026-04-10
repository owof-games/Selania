/* ---------------------------------

   Gestione avvio e chiusura storie personagge 

 ----------------------------------*/
    LIST story_storyStatus = story_storyNotStarted, story_storyStarted, story_storyEnded
    
    //Lista che tiene conto di quali storie sono state concluse
    LIST story_endedStories = story_firstCharStoryEnded, story_secondCharStoryEnded, story_thirdCharStoryEnded, story_fourthCharStoryEnded, story_fifthCharStoryEnded
    
    //Lista che tiene conto in ordine progressivo della quantità di storie concluse
    LIST story_endingOrders = story_oneStoryClosed, story_twoStoriesClosed, story_threeStoriesClosed, story_fourStoriesClosed, story_fifthStoriesClosed

    //Variabili per far comparire i personaggi in scena.
        VAR firstChar_delay = 2
        VAR secondChar_delay= 2
        VAR thirdChar_delay = 4
        VAR openingKitchen_delay = 4
        VAR openingLibrary_delay = 6
        VAR openingNest_delay = 8
        VAR openingPlacesPause = 0
        VAR openingPlacesMaxPause = 2


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
        - (LIST_COUNT(grimoire_firstChar) >= secondChar_delay) && secondChar_storyStatus == story_storyNotStarted:
        {debug: introduco {SecondCharacter} in scena.}
                ~ move_entity(SecondCharacter, TrainStop)
                ~ move_entity(TrainNoiseComing, CurrentLocation)
                ~ secondChar_storyStatus = story_storyStarted
    
        //Dopo quattro dialoghi con Chitarra o due con Riccio, compare il terzo PNG.
        - ((LIST_COUNT(grimoire_firstChar) + LIST_COUNT(grimoire_secondChar)) > thirdChar_delay) && not (thirdChar_storyStatus == story_storyStarted):
            {debug: introduco {ThirdCharacter} in scena.}
                ~ move_entity(ThirdCharacter, TrainStop)
                ~ move_entity(TrainNoiseComing, CurrentLocation)
                ~ thirdChar_storyStatus = story_storyStarted
                
        //X movimenti dopo la furia della mentore, compare la quarta png
        //- player_movementsCounter == delayFourthChar && mentor_rage:
                //{debug: introduco {FourthCharacter} in scena.}
                //~ move_entity(FourthCharacter, Forest)
                // ~ move_entity(chaletSmoke, Safekeeping)
                //~ fourthChar_storyStatus = story_storyStarted
                
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


//Qui apriamo i luoghi cambiando gli assets di riferimento: serra, cucina, biblioteca, nido, discarica
=== opening_places
{debug: passo da opening_places.}

    //Apertura serra
    {
        - grimoire_fifthChar has grimChoicesMentor && (entity_location(FromPondToGreenhouse) == Safekeeping) && greenhouse_findedCultivables hasnt Olobino:
            ~ player_accessiblePlaces += Greenhouse
            ~ move_entity(FromPondToGreenhouseBlocked, Safekeeping)
            ~ move_entity(FromPondToGreenhouse, Pond)
            ~ move_entity(mapGreenhouse, TrainStop)
            //Attiviamo una pausa per evitare che i luoghi vengano aperti tutti di fila
            ~ openingPlacesPause = openingPlacesMaxPause
            // ~ movements_randomablePlaces += Greenhouse
    }
    
    //Apertura cucina
    {
        - grimoire_firstChar has grimFirstOpenKitchen && (entity_location(FromPondToKitchen) == Safekeeping):
            ~ player_accessiblePlaces += Kitchen
            ~ move_entity(FromPondToKitchenBlocked, Safekeeping)
            ~ move_entity(FromPondToKitchen, Pond)
            ~ move_entity(mapKitchen, TrainStop)
            //Attiviamo una pausa per evitare che i luoghi vengano aperti tutti di fila
            ~ openingPlacesPause = openingPlacesMaxPause
    }
    
    //Apertura biblioteca
    {
        - grimoire_secondChar has grimSecondOpenLibrary && (entity_location(FromForestToLibrary) == Safekeeping):
            ~ move_entity(FromForestToLibraryBlocked, Safekeeping)
            ~ move_entity(FromForestToLibrary, Forest)
            ~ move_entity(mapLibrary, TrainStop)
            // ~ movements_randomablePlaces += Library
            ~ player_accessiblePlaces += Library
            //Attiviamo una pausa per evitare che i luoghi vengano aperti tutti di fila
            ~ openingPlacesPause = openingPlacesMaxPause
    }

    
    //Apertura nido
    {
        - grimoire_thirdChar has grimThirdOpenNest && (entity_location(FromLibraryToNest) == Safekeeping):
            ~ player_accessiblePlaces += Nest
            ~ move_entity(FromLibraryToNestBlocked, Safekeeping)
            ~ move_entity(FromLibraryToNest, Library)
            ~ move_entity(mapNest, TrainStop)
            //Attiviamo una pausa per evitare che i luoghi vengano aperti tutti di fila
            ~ openingPlacesPause = openingPlacesMaxPause
    }
    


->->   

//Qui aggiorniamo lo stato di randomizzabilità o meno di unx PNG
=== on_movement_randomize_png_places
//Prima cosa: se una storia è iniziata, aggiungo la personaggia alla lista dei randomizzabili, altrimenti la levo
    {debug: passo da on_movement_randomize_png_places.}
    
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

                - firstChar_PondInvite == true:
                    ~ movements_randomizable_characters -= FirstCharacter    
                
                - else:
                    ~ movements_randomizable_characters += FirstCharacter
            }
        
        
    }

    {
        - secondChar_storyStatus == story_storyStarted:
        
        //Evitiamo che venga tolto dalla cucina se sta cucinando o se ci sta aspettando in cucina, o se non gli abbiamo mai parlato
            {
                - grimoire_secondChar == ():
                    ~ movements_randomizable_characters -= SecondCharacter 
                
                - kitchen_secondCharIsCooking == true:
                    ~ movements_randomizable_characters -= SecondCharacter

                - kitchen_secondCharCookingTogetherInvite == true:
                    ~ movements_randomizable_characters -= SecondCharacter    

                - secondChar_ForestInvite == true:
                    ~ movements_randomizable_characters -= SecondCharacter 

                - else:
                    ~ movements_randomizable_characters += SecondCharacter
                    
            }

    }


    {
        - thirdChar_storyStatus == story_storyStarted:
        
        //Evitiamo che venga tolto dalla cucina se sta cucinando o se ci sta aspettando in cucina
            {
                - grimoire_thirdChar == ():
                    ~ movements_randomizable_characters -= ThirdCharacter 

                - kitchen_thirdCharIsCooking == true:
                    ~ movements_randomizable_characters -= ThirdCharacter

                - kitchen_thirdCharCookingTogetherInvite == true:
                    ~ movements_randomizable_characters -= ThirdCharacter    

                - thirdChar_LibraryInvite == true:
                    ~ movements_randomizable_characters -= ThirdCharacter 

                - else:
                    ~ movements_randomizable_characters += ThirdCharacter
                    
            }

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
    {grimoire_secondChar has grimSecondCharTwo && entity_location(Franco) == Safekeeping:
            {debug: Ho spostato la rana allo stagno.}
           ~  move_entity(Franco, Pond)
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
                //Per il pezzo qui sotto, l'idea è di avere unx solx personaggix alla volta in biblioteca e nella discarica, se e solo se comunque lx dovessi sbloccare come aree (e a quel punto mi basta aggiungerle a movements_randomablePlaces)
                    // {
                    //     - location == Dump:
                    //         {
                    //             - (contentsDump has FirstCharacter) or (contentsDump has SecondCharacter) or (contentsDump has ThirdCharacter) or (contentsDump has Mentor):
                    //                 ~ location = Forest
                    //         }
                    // }
                    // {
                    //     - location == Library:
                    //         {
                    //             - (contentsLibrary has FirstCharacter) or (contentsLibrary has SecondCharacter) or (contentsLibrary has ThirdCharacter) or (contentsLibrary has Mentor):
                    //                 ~ location = Pond
                    //         }
                    // }
            //Scelto il luogo e lx PNG, sposto e resetto.
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
    
 



