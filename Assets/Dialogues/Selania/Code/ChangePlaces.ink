//Funzione per spostarsi da un luogo all'altro a seconda di dove mi trovo

 === move_between_rooms(my_location)
 

 
 //Book management (the book will be treated as a place)
    + {are_two_entities_together(PG, RewriterBook) && !debugStochastic}[RewriterBook]
            ~ move_entity(PG, BookPlace)
        -> main_book
        
    + {are_two_entities_together(PG, miniBook) && !debugStochastic} [miniBook]
            ~ move_entity(PG, BookPlace)
        -> main_book      
 
//Streets to and into the Bedroom
    + {are_two_entities_together(PG, FromTrainStopToBedroom)} [FromTrainStopToBedroom]
            ~ move_entity(PG, Bedroom)
        -> on_movement_events ->
        -> bedroom
    
    + {are_two_entities_together(PG, RoomExit) && (not debugStochastic)} [RoomExit]
    
            Salutiamo {name}.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()} 
            Se {name} sta per lasciare il prototipo, {pronouns has him:lo|{pronouns has her:la|lə}} invitiamo a segnarsi questo codice, da riportare sul documento di testing.
            Il codice è {playerPurple} - {playerYellow} - {playerBlue} - {playerGreen}- {playerRed}; {playerFirstStory}; {playerSecondStory}; {firstCharacterState}; {secondCharacterState}.
            Grazie di cuore.
            
                + + [Voglio chiudere <i>Selanìa</i>.]
                    A presto, {name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                    @quit
                    -> moon_state_management ->
                    -> END
                    
                + + [Voglio restare ancora un po'.]
                    -> main
      

//Streets to Bus Stop
    + {are_two_entities_together(PG, RoomLoad)} [RoomLoad]
        ~ move_entity(PG, TrainStop)
        {
            - foundLibro or take_this_book:
                ~ move_entity(RewriterBook, TrainStop)
        }
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, TrainStop)
        }
        -> train_stop
    
    + {are_two_entities_together(PG, FromForestToTrainStop)}  [FromForestToTrainStop]
            ~ move_entity(PG, TrainStop)
        {
            - foundLibro or take_this_book:
                ~ move_entity(RewriterBook, TrainStop)
        }
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, TrainStop)
        }        
            -> on_movement_events ->
                -> train_stop
                
//Streets to Forest      
    + {are_two_entities_together(PG, FromTrainStopToForest)} [FromTrainStopToForest]
            ~ move_entity(PG, Forest)
        {
            - foundLibro or take_this_book:
                ~ move_entity(RewriterBook, Forest)
        }
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Forest)
        }        
            -> on_movement_events ->
                -> forest
        
        
    + {are_two_entities_together(PG, FromPondToForest)} [FromPondToForest]
            ~ move_entity(PG, Forest)
        {
            - foundLibro or take_this_book:
                ~ move_entity(RewriterBook, Forest)
        }
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Forest)
        }         
            
            -> on_movement_events ->
                -> forest
    
    + {are_two_entities_together(PG, FromLibraryToForest)} [FromLibraryToForest]
            ~ move_entity(PG, Forest)
           
        {
            - foundLibro or take_this_book:
                ~ move_entity(RewriterBook, Forest)
        }
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Forest)
        }         
            -> on_movement_events ->
            -> empty_tempTW ->  
                -> forest
    
    
 //Streets to Pond   
    + {are_two_entities_together(PG, FromGreenhouseToPond)} [FromGreenhouseToPond]
            ~ move_entity(PG, Pond)
        {
            - foundLibro or take_this_book:
                ~ move_entity(RewriterBook, Pond)
        }
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Pond)
        }    
            //Uscendo dalla serra svuotiamo la lista dei TW temporanei dei coltivabili
            -> empty_tempCultTW ->
            -> on_movement_events ->
            -> pond
        
    + {are_two_entities_together(PG, FromForestToPond)} [FromForestToPond]
            ~ move_entity(PG, Pond)
        {
            - foundLibro or take_this_book:
                ~ move_entity(RewriterBook, Pond)
        }
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Pond)
        }         
            -> on_movement_events ->
                -> pond
        
        
//Streets to Greenhouse
    + {are_two_entities_together(PG, FromPondToGreenhouse)}  [FromPondToGreenhouse]
            ~ move_entity(PG, Greenhouse)
        {
            - foundLibro or take_this_book:
                ~ move_entity(RewriterBook, Greenhouse)
        }
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Greenhouse)
        }         
            ~ growing ++
            -> growing_check ->
            -> on_movement_events ->
                -> greenhouse


    + {are_two_entities_together(PG, FromPondToGreenhouseBlooming)} [FromPondToGreenhouseBlooming]
            ~ move_entity(PG, Greenhouse)
        {
            - foundLibro or take_this_book:
                ~ move_entity(RewriterBook, Greenhouse)
        }
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Greenhouse)
        }         
            ~ growing ++
            -> growing_check ->
            -> on_movement_events ->
                -> greenhouse




//Streets to Library
    + {debug_test_library} [LibraryTest]
            ~ move_entity(PG, Library)
                -> library
                
    + {are_two_entities_together(PG, FromForestToLibraryDesat) && secondTier == false} [FromForestToLibraryDesat]
        Un cumulo di carta e colonne di legno blocca la strada.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main
            
    + {are_two_entities_together(PG, FromForestToLibrary) && secondTier == true} [FromForestToLibrary]
            ~ move_entity(PG, Library)
        {
            - foundLibro or take_this_book:
                ~ move_entity(RewriterBook, Library)
        }
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Library)
        }         
            -> on_movement_events ->
                -> library
        
//Streets to Nest
    
    + {are_two_entities_together(PG, FromPondToNest)} [FromPondToNest]
            Nonostante i radi fiori, non riesci ad avanzare.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main
    
    //{
    //    - not thirdTier: <i>Questa strada risulta bloccata.</i>
    //        -> main
    //    - else:
    //        ~ move_entity(PG, Nest)
    //        -> on_movement_events ->
    //            -> nest
    //}    
    


//Streets to Laboratory
        
    + {are_two_entities_together(PG, FromLibraryToLaboratory)} [FromLibraryToLaboratory]
    
    {
        - not fourthTier: <i>Questa strada risulta bloccata.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main
        - else:
            ~ move_entity(PG, Laboratory)
        {
            - foundLibro or take_this_book:
                ~ move_entity(RewriterBook, Laboratory)
        }
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Laboratory)
        }        
            -> on_movement_events ->
            -> empty_tempTW ->  
                -> laboratory
    }
            
        

-    
-> main




