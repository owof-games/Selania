//Funzione per spostarsi da un luogo all'altro a seconda di dove mi trovo

 === move_between_rooms(my_location)
 //Book management (the book will be treated as a place)
 
    // Ho separato la versione blocca amico stocastico da una che non lo blocca perché così se devo testare elementi del libro non ci sono problemi
    + {are_two_entities_together(PG, RewriterBook) && !debugStochastic}[RewriterBook]
            ~ move_entity(PG, BookPlace)
        -> main_book
    
    //Versione utile se devo testare anche il libro con amico stocastico
    //+ {are_two_entities_together(PG, RewriterBook)}[RewriterBook]
    //        ~ move_entity(PG, BookPlace)
    //    -> main_book    
        
    + {are_two_entities_together(PG, miniBook) && !debugStochastic} [miniBook]
            ~ move_entity(PG, BookPlace)
        -> main_book      
 
//Streets to and into the Bedroom
    + {are_two_entities_together(PG, FromTrainStopToBedroom)} [FromTrainStopToBedroom]
            ~ move_entity(PG, Bedroom)
        -> on_movement_events ->
        -> bedroom
    
    + {are_two_entities_together(PG, RoomExit) && (not debugStochastic)} [RoomExit]
    
            Salutiamo {name}.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()} 
            Se {name} sta per lasciare il prototipo, {pronouns has him:lo|{pronouns has her:la|lə}} invitiamo a segnarsi questo codice, da riportare sul documento di testing.
            Il codice è {playerPurple} - {playerYellow} - {playerBlue} - {playerGreen}- {playerRed}; {playerFirstStory}; {playerSecondStory}; {firstCharacterState}; {secondCharacterState}.
            Grazie di cuore.
            
                + + [Voglio chiudere <i>Selanìa</i>.]
                    A presto, {name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
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
            -> on_movement_events ->
                -> pond

//Streets to Greenhouse
    + {are_two_entities_together(PG, FromPondToGreenhouse)}  [FromPondToGreenhouse]
            ~ move_entity(PG, Greenhouse)
            //Entrando in serra aumentiamo il valore di crescita dei coltivabili
            ~ growing ++
            -> growing_check ->
            -> on_movement_events ->
                -> greenhouse


    + {are_two_entities_together(PG, FromPondToGreenhouseBlooming)} [FromPondToGreenhouseBlooming]
            ~ move_entity(PG, Greenhouse)
            //Entrando in serra aumentiamo il valore di crescita dei coltivabili
            ~ growing ++
            -> growing_check ->
            -> on_movement_events ->
            -> greenhouse

    + {are_two_entities_together(PG, FromPondToGreenhouseBlocked)} [FromPondToGreenhouseBlocked]
        <i>La porta risulta chiusa, l'interno è buio.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()} 
        -> main
        

//Streets to Library
    + {debug_test_library} [LibraryTest]
            ~ move_entity(PG, Library)
            -> on_movement_events ->
                -> library
                
    + {are_two_entities_together(PG, FromForestToLibraryBlocked)} [FromForestToLibraryBlocked]
        Un cumulo di carta e colonne di legno blocca la strada.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main
            
    + {are_two_entities_together(PG, FromForestToLibrary)} [FromForestToLibrary]
            ~ move_entity(PG, Library)
            -> on_movement_events ->
                -> library
        
    + {are_two_entities_together(PG, FromNestToLibrary)} [FromNestToLibrary]
            ~ move_entity(PG, Library)
            -> on_movement_events ->
                -> library
        

//Streets to Kitchen
    + {debug_test_kitchen} [KitchenTest]
            ~ move_entity(PG, Library)
            -> on_movement_events ->
                -> kitchen


    + {are_two_entities_together(PG, FromPondToKitchen)} [FromPondToKitchen]
            ~ move_entity(PG, Kitchen)
                -> on_movement_events ->
                -> empty_tempTW ->  
                -> kitchen

    
    + {are_two_entities_together(PG, FromPondToKitchenBlocked)} [FromPondToKitchenBlocked]
    <i>Questa strada risulta bloccata.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main


//Streets to Nest
    + {debug_test_nest} [NestTest]
            ~ move_entity(PG, Nest)
            -> on_movement_events ->
                -> nest

    + {are_two_entities_together(PG, FromLibraryToNest)} [FromLibraryToNest]
            ~ move_entity(PG, Nest)
                -> on_movement_events ->
                -> empty_tempTW ->  
                -> nest

    + {are_two_entities_together(PG, FromLibraryToNestBlocked)} [FromLibraryToNestBlocked]
        <i>Questa strada risulta bloccata.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main



