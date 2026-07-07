//Funzione per spostarsi da un luogo all'altro a seconda di dove mi trovo

 === move_between_rooms(my_location)
//Streets to and into the Bedroom
    + {are_two_entities_together(PG, FromTrainStopToBedroom)} [FromTrainStopToBedroom]
            ~ move_entity(PG, Bedroom)
            -> on_movement_events ->
                -> bedroom
    
    + {are_two_entities_together(PG, BedClosingGame) && (not debug_stochastic)} [BedClosingGame]
    
            {charTag(TheWitch, witch_state())}:   <i>Un letto morbido attende {player_name}.</i> 
            
                + + (close)<i>Ho bisogno di riposare.</i>
                    {charTag(TheWitch, witch_state())}:   <i>Salutiamo {player_name}.</i>
                    //Resettiamo il contatore del riposo della giocatrice
                        ~ player_lastRestingSession = 0
                    @quit
                    -> END
                    
                + + <i>Resto ancora un po'.</i>
                    -> main
    
    //Solo scelta per l'amico stocastico
    //Uscita solo se ho chiuso tre riscritture
    + {are_two_entities_together(PG, BedClosingGame) && (debug_stochastic == true) && LIST_COUNT(story_endedStories) >= 3} [BedClosingGame]
            @quit
                -> END

    //Uscita solo se sono state concluse tutte le missioni di Franco
    // + {are_two_entities_together(PG, BedClosingGame) && (debug_stochastic == true) && story_endedStories != () && frog_allMissionsCompleted == ()} [BedClosingGame]
    //         @quit
    //             -> END            


//Streets to Train Stop
    + {are_two_entities_together(PG, FromBedroomToTrainStop)} [FromBedroomToTrainStop]
        ~ move_entity(PG, TrainStop)
        -> on_movement_events ->
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

    + {are_two_entities_together(PG, FromDumpToForest)} [FromDumpToForest]
            ~ move_entity(PG, Forest)
            -> on_movement_events ->
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
            -> on_movement_events ->
            //Funzione per far crescere le piante (se in coltivazione)
            -> growing_check ->
                -> greenhouse


    + {are_two_entities_together(PG, FromPondToGreenhouseBlooming)} [FromPondToGreenhouseBlooming]
            ~ move_entity(PG, Greenhouse)
            -> on_movement_events ->
            -> greenhouse

    + {are_two_entities_together(PG, FromPondToGreenhouseBlocked)} [FromPondToGreenhouseBlocked]
        {charTag(TheWitch, witch_state())}:   <i>Una porta chiusa, un interno buio.</i> 
        -> main

    //Streets to Library    

    + {are_two_entities_together(PG, FromForestToLibraryBlocked)} [FromForestToLibraryBlocked]
    {
        - debug_testLibrary:
            ~ move_entity(PG, Library)
            -> on_movement_events ->
                -> library
        
        - else:
            {charTag(TheWitch, witch_state())}:   <i>Un masso blocca la strada.</i>
            -> main
    }  
    
            
    + {are_two_entities_together(PG, FromForestToLibrary)} [FromForestToLibrary]
            ~ move_entity(PG, Library)
            -> on_movement_events ->
                -> library
        
    + {are_two_entities_together(PG, FromNestToLibrary) and not firstGlyph} [FromNestToLibrary]
            ~ move_entity(PG, Library)
            -> on_movement_events ->
                -> library
        

    //Streets to Kitchen
    + {are_two_entities_together(PG, FromPondToKitchen)} [FromPondToKitchen]
            ~ move_entity(PG, Kitchen)
                -> on_movement_events ->
                -> kitchen

    
    + {are_two_entities_together(PG, FromPondToKitchenBlocked)} [FromPondToKitchenBlocked]
    
    {
        - debug_testKitchen:
            ~ move_entity(PG, Kitchen)
                -> on_movement_events ->
                -> kitchen
        - else:
            {charTag(TheWitch, witch_state())}:   <i>Un ponte spezzato interrompe il cammino di chi viaggia.</i>
            -> main
    }        


    //Streets to Nest
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
                    -> nest
            - else:
                {charTag(TheWitch, witch_state())}:   <i>Un relitto ostacola il cammino di {player_name}.</i>
                -> main
        }   

    //Streets to Dump
    + {are_two_entities_together(PG, FromForestToDump)} [FromForestToDump]
            ~ move_entity(PG, Dump)
                -> on_movement_events ->
                -> dump

