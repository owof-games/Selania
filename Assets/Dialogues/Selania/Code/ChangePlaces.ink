//Funzione per spostarsi da un luogo all'altro a seconda di dove mi trovo

 === move_between_rooms(my_location)
 //Book management (the book will be treated as a place)

    // Ho separato la versione blocca amico stocastico da una che non lo blocca perché così se devo testare elementi del libro non ci sono problemi
    + {are_two_entities_together(PG, RewriterBook) && !debug_stochastic}[RewriterBook]
            ~ move_entity(PG, BookPlace)
        -> main_book
    
    //Versione utile se devo testare anche il libro con amico stocastico
    //+ {are_two_entities_together(PG, RewriterBook)}[RewriterBook]
    //        ~ move_entity(PG, BookPlace)
    //    -> main_book    
        
    + {are_two_entities_together(PG, miniBook) && !debug_stochastic} [miniBook]
            ~ move_entity(PG, BookPlace)
        -> main_book      
 
//Streets to and into the Bedroom
    + {are_two_entities_together(PG, FromTrainStopToBedroom)} [FromTrainStopToBedroom]
            ~ move_entity(PG, Bedroom)
        -> on_movement_events ->
        -> bedroom
    
    + {are_two_entities_together(PG, RoomExit) && (not debug_stochastic)} [RoomExit]
    
            Salutiamo {player_name}.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()} 
            Se {player_name} sta per lasciare il prototipo, {player_pronouns has him:lo|{player_pronouns has her:la|lə}} invitiamo a segnarsi questo codice, da riportare sul documento di testing.
            Il codice è {player_purple} - {player_yellow} - {player_blue} - {player_green}- {player_red}; {player_firstStepStatus}; {player_secondStepStatus}; {firstChar_ActualName}; {secondChar_ActualName}.
            Grazie di cuore.
            
                + + (close)[Voglio chiudere <i>Selanìa</i>.]
                    Salutiamo {player_name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                    @quit
                    -> END
                    
                + + [Voglio restare ancora un po'.]
                    -> main
      

//Streets to Bus Stop
    + {are_two_entities_together(PG, RoomLoad)} [RoomLoad]
        ~ move_entity(PG, TrainStop)
            -> train_stop
    
    + {are_two_entities_together(PG, FromForestToTrainStop)}  [FromForestToTrainStop]
            ~ move_entity(PG, TrainStop)
            -> on_movement_events ->
                -> train_stop
                
//Streets to Forest      
    + {are_two_entities_together(PG, FromTrainStopToForest)} [FromTrainStopToForest]
            ~ move_entity(PG, Forest)
            -> on_movement_events ->
                -> forest
        
        
    + {are_two_entities_together(PG, FromPondToForest)} [FromPondToForest]
            ~ move_entity(PG, Forest)
            -> on_movement_events ->
                -> forest
    
    + {are_two_entities_together(PG, FromLibraryToForest)} [FromLibraryToForest]
            ~ move_entity(PG, Forest)
            -> on_movement_events ->
            -> empty_tempTW ->  
                -> forest
    
    
 //Streets to Pond   
    + {are_two_entities_together(PG, FromGreenhouseToPond)} [FromGreenhouseToPond]
            ~ move_entity(PG, Pond)
            //Uscendo dalla serra svuotiamo la lista dei TW temporanei dei coltivabili
            -> empty_tempCultTW ->
            -> on_movement_events ->
            -> pond
        
    + {are_two_entities_together(PG, FromForestToPond)} [FromForestToPond]
            ~ move_entity(PG, Pond)
            -> on_movement_events ->
                -> pond
        
    + {are_two_entities_together(PG, FromKitchenToPond)} [FromKitchenToPond]
            ~ move_entity(PG, Pond)
            //Per sicurezza passo per cooking off, soprattutto nel caso in cui lx png stessero cucinando da solx.
            -> cooking_animations_off ->
            -> on_movement_events ->
                -> pond

//Streets to Greenhouse
    + {are_two_entities_together(PG, FromPondToGreenhouse)}  [FromPondToGreenhouse]
            ~ move_entity(PG, Greenhouse)
            //Entrando in serra aumentiamo il valore di crescita dei coltivabili
            ~ greenhouse_cultivableGrowing ++
            -> growing_check ->
            -> on_movement_events ->
                -> greenhouse


    + {are_two_entities_together(PG, FromPondToGreenhouseBlooming)} [FromPondToGreenhouseBlooming]
            ~ move_entity(PG, Greenhouse)
            //Entrando in serra aumentiamo il valore di crescita dei coltivabili
            ~ greenhouse_cultivableGrowing ++
            -> growing_check ->
            -> on_movement_events ->
            -> greenhouse

    + {are_two_entities_together(PG, FromPondToGreenhouseBlocked)} [FromPondToGreenhouseBlocked]
        <i>Una porta chiusa, un interno buio.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()} 
        -> main
        

    + {are_two_entities_together(PG, FromForestToLibraryBlocked)} [FromForestToLibraryBlocked]
    {
        - debug_testLibrary:
            ~ move_entity(PG, Library)
            -> on_movement_events ->
                -> library
        
        - else:
            Legna e carta proteggono la strada.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main
    }  
    
            
    + {are_two_entities_together(PG, FromForestToLibrary)} [FromForestToLibrary]
            ~ move_entity(PG, Library)
            -> on_movement_events ->
                -> library
        
    + {are_two_entities_together(PG, FromNestToLibrary)} [FromNestToLibrary]
            ~ move_entity(PG, Library)
            -> on_movement_events ->
                -> library
        

    + {are_two_entities_together(PG, FromPondToKitchen)} [FromPondToKitchen]
            ~ move_entity(PG, Kitchen)
                -> on_movement_events ->
                -> empty_tempTW ->  
                -> kitchen

    
    + {are_two_entities_together(PG, FromPondToKitchenBlocked)} [FromPondToKitchenBlocked]
    
    {
        - debug_testKitchen:
            ~ move_entity(PG, Kitchen)
                -> on_movement_events ->
                -> empty_tempTW ->  
                -> kitchen
        - else:
            Un ponte spezzato interrompe il cammino di chi viaggia.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main
    }        


    + {are_two_entities_together(PG, FromLibraryToNest)} [FromLibraryToNest]
            ~ move_entity(PG, Nest)
                -> on_movement_events ->
                -> empty_tempTW ->  
                -> nest

    + {are_two_entities_together(PG, FromLibraryToNestBlocked)} [FromLibraryToNestBlocked]
        {
            - debug_testNest:
                ~ move_entity(PG, Nest)
                    -> on_movement_events ->
                    -> empty_tempTW ->  
                    -> nest
            - else:
                Il relitto di una barca ostacola il cammino di {player_name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                -> main
        }   



