/* ---------------------------------

   Gestione avvio e chiusura storie personagge 

 ----------------------------------*/
 //storyRemote è per PNG, per le scelte a distanza. storyPostal è per differenziare la conversazione via posta da quella dal vivo dopo la riscrittura.
    LIST story_storyStatus = story_storyNotStarted, story_storyStarted, story_storyEnded, story_storyPostal, story_storyRemote
    
    //Lista che tiene conto di quali storie sono state concluse
    LIST story_endedStories = story_firstCharStoryEnded, story_secondCharStoryEnded, story_thirdCharStoryEnded, story_fourthCharStoryEnded, story_fifthCharStoryEnded
    
    //Lista che tiene conto in ordine progressivo della quantità di storie concluse
    LIST story_endingOrders = story_oneStoryClosed, story_twoStoriesClosed, story_threeStoriesClosed, story_fourStoriesClosed, story_fiveStoriesClosed

    //Variabili per far comparire i personaggi in scena.
        VAR firstChar_delay = 2
        VAR secondChar_delay= 2
        VAR thirdChar_delay = 4
        VAR openingKitchen_delay = 4
        VAR openingLibrary_delay = 6
        VAR openingNest_delay = 8
        VAR openingPlacesPause = 0
        VAR openingPlacesMaxPause = 2


=== function story_time_management_for_PNG()
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
        - (pond == true or talk_with_first_character) && (mentorChar_storyStatus == story_storyNotStarted):
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
        - ((LIST_COUNT(grimoire_firstChar) + LIST_COUNT(grimoire_secondChar)) > thirdChar_delay) && thirdChar_storyStatus == story_storyNotStarted:
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
    





/* ---------------------------------

   Funzioni legate a comparsa e spostamenti personagge 

 ----------------------------------*/

//Gestione spostamenti: tempo
    //Quando questa è a zero, non ci sono spostamenti.
    VAR movements_changeLocationTimer = 0
    
    //Questo è invece il valore che indica quando far partire la randomizzazione dei luoghi dellə PNG.
    VAR movements_changeLocationTrigger = 9
    
    //Questa è la lista dei luoghi dove lə PNG possono andare. Se serve, posso ampliarla quando si aprono i luoghi, ma è da valutare col bilanciamento.
    //Posti dove possiamo trovarne solo unx: Dump, Library.
    //Posti sicuramente vietati, salvo scene speciali: Bedroom, Nest, Greenhouse. Kitchen solo per scene ad hoc (es: cucina da solx). Tolta fermata del treno per favorire incontri.
    VAR movements_randomablePlaces = (Forest, Pond)


//Gestione spostamenti: personagge
    VAR movements_randomizable_characters = ()


//Qui apriamo i luoghi cambiando gli assets di riferimento: serra, cucina, biblioteca, nido, discarica
=== function opening_places()
{debug: passo da opening_places.}

    //Apertura serra
    {
        - grimoire_fifthChar has grimMentorIntro && (entity_location(FromPondToGreenhouse) == Safekeeping) && greenhouse_findedCultivables hasnt Olobino:
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
            ~ movements_randomablePlaces += Library
            ~ player_accessiblePlaces += Library
            //Attiviamo una pausa per evitare che i luoghi vengano aperti tutti di fila
            ~ openingPlacesPause = openingPlacesMaxPause
    }

    
    //Apertura nido
    {
        - grimoire_thirdChar has grimThirdPreOpenNest && (entity_location(FromLibraryToNest) == Safekeeping):
            ~ player_accessiblePlaces += Nest
            ~ move_entity(FromLibraryToNestBlocked, Safekeeping)
            ~ move_entity(FromLibraryToNest, Library)
            ~ move_entity(mapNest, TrainStop)
            //Attiviamo una pausa per evitare che i luoghi vengano aperti tutti di fila
            ~ openingPlacesPause = openingPlacesMaxPause
    }
    
    //Aggiunta dump ai luoghi randomizzabili
    {
        - grimoire_witch has grimWitchIntro && movements_randomablePlaces hasnt Dump:
            ~ movements_randomablePlaces += Dump
    }

 

//Qui aggiorniamo lo stato di randomizzabilità o meno di unx PNG
=== on_movement_randomize_png_places
//Prima cosa: se una storia è iniziata, aggiungo la personaggia alla lista dei randomizzabili, altrimenti la levo
    {debug: passo da on_movement_randomize_png_places.}
    
    {
        - mentorChar_storyStatus == story_storyStarted:
            ~ movements_randomizable_characters += Mentor
        
        - mentorChar_storyStatus != story_storyStarted:  
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
                    {
                        - firstChar_PondWaiting > 0:
                            ~ firstChar_PondWaiting --
                            ~ movements_randomizable_characters -= FirstCharacter 

                        - else:
                            ~ firstChar_PondInvite = false
                            ~ movements_randomizable_characters += FirstCharacter
                    }  
                
                - else:
                    ~ movements_randomizable_characters += FirstCharacter
            }

        - else:
            ~ movements_randomizable_characters -= FirstCharacter     
        
        
    }

    {
        - secondChar_storyStatus == story_storyStarted:
        //Evitiamo che venga tolto dalla cucina se sta cucinando o se ci sta aspettando in cucina, o se non gli abbiamo mai parlato
            {
                // - grimoire_secondChar == ():
                //     ~ movements_randomizable_characters -= SecondCharacter 
                
                - kitchen_secondCharIsCooking == true:
                    ~ movements_randomizable_characters -= SecondCharacter

                - kitchen_secondCharCookingTogetherInvite == true:
                    ~ movements_randomizable_characters -= SecondCharacter    

                - secondChar_ForestInvite == true:
                    {
                        - secondChar_ForestWaiting > 0:
                            ~ secondChar_ForestWaiting --
                            ~ movements_randomizable_characters -= SecondCharacter 

                        - else:
                            ~ secondChar_ForestInvite = false
                            ~ movements_randomizable_characters += SecondCharacter 
                    }

                - else:
                    ~ movements_randomizable_characters += SecondCharacter
            }
        - else:
            ~ movements_randomizable_characters -= SecondCharacter 

    }


    {
        - thirdChar_storyStatus == story_storyStarted:
        //Evitiamo che venga tolto dalla cucina se sta cucinando o se ci sta aspettando in cucina
            {
                // - grimoire_thirdChar == ():
                //     ~ movements_randomizable_characters -= ThirdCharacter 

                - kitchen_thirdCharIsCooking == true:
                    ~ movements_randomizable_characters -= ThirdCharacter

                - kitchen_thirdCharCookingTogetherInvite == true:
                    ~ movements_randomizable_characters -= ThirdCharacter    

                - thirdChar_LibraryInvite == true:
                    {
                        - thirdChar_LibraryWaiting > 0:
                            ~ thirdChar_LibraryWaiting --
                            ~ movements_randomizable_characters -= ThirdCharacter 

                        - else:
                            ~ thirdChar_LibraryInvite = false
                            ~ movements_randomizable_characters += ThirdCharacter 
                    }

                //Invito della strega
                - witch_thirdCharSummoned == true:
                    ~ movements_randomizable_characters -= ThirdCharacter 
                    
                - else:
                    ~ movements_randomizable_characters += ThirdCharacter   
            }

        - else:
            ~ movements_randomizable_characters -= ThirdCharacter     

    }
  
    
    {
        - fourthChar_storyStatus == story_storyStarted:
            ~ movements_randomizable_characters += FourthCharacter    
        
         - else:
            ~ movements_randomizable_characters -= FourthCharacter 
    }
    
    {
        - fifthChar_storyStatus == story_storyStarted:
            ~ movements_randomizable_characters += FifthCharacter
        
        - else:  
            ~ movements_randomizable_characters -= FifthCharacter
    }
    
    //Comparsa della rana
    {grimoire_secondChar has grimSecondCharTwo && entity_location(Franco) == Safekeeping:
            {debug: Ho spostato la rana allo stagno.}
           ~  move_entity(Franco, Pond)
    }
    
    {debug: esco da on_movement_randomize_png_places. movements_randomizable_characters contiene {movements_randomizable_characters}}
    -> randomize_png_location
    

//Qui randomizziamo chi può essere randomizzatx.    
=== randomize_png_location    
{debug: passo da randomize_png_location.}

    {
        //se ho raggiunto il tempo trigger, resetto il valore, e poi vado avanti.
        - movements_changeLocationTimer >= movements_changeLocationTrigger && movements_randomizable_characters != ():
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
                    {
                        - location == Dump:
                            {
                                - (contentsDump has FirstCharacter) or (contentsDump has SecondCharacter) or (contentsDump has ThirdCharacter) or (contentsDump has Mentor):
                                    {debug: il luogo random è Dump, ma visto che c'è già {contentsDump}, mando {character} alla foresta.}
                                    ~ location = Forest
                            }

                        - location == Library:
                            {
                                - (contentsLibrary has FirstCharacter) or (contentsLibrary has SecondCharacter) or (contentsLibrary has ThirdCharacter) or (contentsLibrary has Mentor):
                                    {debug: il luogo random è Library, ma visto che c'è già {contentsLibrary}, mando {character} allo stagno.}
                                    ~ location = Pond
                            }
                    }
            //Scelto il luogo e lx PNG, sposto e resetto.
            ~ move_entity(character, location)
            ~ movements_randomizable_characters -= character    
            
            {debug: <i>{character} si trova in {location}.}       
            
            {
               - movements_randomizable_characters != ():
               {debug: movements_randomizable_characters ha ancora {movements_randomizable_characters} e quindi ripeto.} 
                    -> top
               - else:
                    ->->
            }
    
    {debug: esco da randomize_png_location.}
    ->->
    
 



