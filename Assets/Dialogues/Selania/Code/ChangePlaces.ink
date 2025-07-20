//Funzione per spostarsi da un luogo all'altro a seconda di dove mi trovo

 === move_between_rooms(my_location)
 
 //Book management (the book will be treated as a place)
    + {are_two_entities_together(PG, RewriterBook)}[RewriterBook]
        -> book_backgrounds_calculator ->
            ~ move_entity(PG, BookPlace)
        -> main_book
 
//Streets to and into the Bedroom
    + {are_two_entities_together(PG, FromTrainStopToBedroom)} [FromTrainStopToBedroom]
        //Calcolo del background
        -> bedroom_backgrounds_calculator ->
            ~ move_entity(PG, Bedroom)
        -> bedroom
    
    + {are_two_entities_together(PG, RoomExit) && (not debugStochastic)} [RoomExit]
        @animation:Cat
        -> END
      

//Streets to Bus Stop
    + {are_two_entities_together(PG, RoomLoad)} [RoomLoad]
        ~ move_entity(PG, TrainStop)
        // ~ arrivingFrom = ()
        //~ arrivingFrom = TrainStop
        {
            - foundLibro:
                ~ move_entity(RewriterBook, TrainStop)
        }
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, TrainStop)
        }
        -> train_stop
    
    + {are_two_entities_together(PG, FromForestToTrainStop)}  [FromForestToTrainStop]
            ~ move_entity(PG, TrainStop)
            //~ arrivingFrom = ()
            //~ arrivingFrom = TrainStop
        {
            - foundLibro:
                ~ move_entity(RewriterBook, TrainStop)
        }
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, TrainStop)
        }        
            -> on_movement_events ->
                -> train_stop
                
//Streets to Garden       
    + {are_two_entities_together(PG, FromTrainStopToForest)} [FromTrainStopToForest]
            ~ move_entity(PG, Forest)
            //~ arrivingFrom = ()
            //~ arrivingFrom = Forest
        {
            - foundLibro:
                ~ move_entity(RewriterBook, Forest)
        }
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Forest)
        }        
            -> on_movement_events ->
                -> forest
        
        
    + {are_two_entities_together(PG, FromGreenhouseMiddlePathToForest)} [FromGreenhouseMiddlePathToForest]
            ~ move_entity(PG, Forest)
            //~ arrivingFrom = ()
            //~ arrivingFrom = Forest            
        {
            - foundLibro:
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
            //~ arrivingFrom = ()
            //~ arrivingFrom = Forest            
        {
            - foundLibro:
                ~ move_entity(RewriterBook, Forest)
        }
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Forest)
        }         
            -> on_movement_events ->
                -> forest
    
    
 //Streets to GreenhouseMiddlePath   
    + {are_two_entities_together(PG, FromGreenhouseToGreenhouseMiddlePath)} [FromGreenhouseToGreenhouseMiddlePath]
            ~ move_entity(PG, GreenhouseMiddlePath)
            //~ arrivingFrom = ()
            //~ arrivingFrom = GreenhouseMiddlePath            
        {
            - foundLibro:
                ~ move_entity(RewriterBook, GreenhouseMiddlePath)
        }
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, GreenhouseMiddlePath)
        }     
            -> on_movement_events ->
                -> greenhouse_middle_path
        
    + {are_two_entities_together(PG, FromForestToGreenhouseMiddlePath)} [FromForestToGreenhouseMiddlePath]
            ~ move_entity(PG, GreenhouseMiddlePath)
            //~ arrivingFrom = ()
            //~ arrivingFrom = GreenhouseMiddlePath             
        {
            - foundLibro:
                ~ move_entity(RewriterBook, GreenhouseMiddlePath)
        }
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, GreenhouseMiddlePath)
        }         
            -> on_movement_events ->
                -> greenhouse_middle_path
        
        
//Streets to Greenhouse
    + {are_two_entities_together(PG, FromGreenhouseMiddlePathToGreenhouse)}  [FromGreenhouseMiddlePathToGreenhouse]
            ~ move_entity(PG, Greenhouse)
            //~ arrivingFrom = ()
            //~ arrivingFrom = Greenhouse            
        {
            - foundLibro:
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
    + {are_two_entities_together(PG, FromForestToLibraryDesat) && secondTier == false} [FromForestToLibraryDesat]
        <i>Questa strada risulta bloccata, per ora.</i> #speaker:{fungus_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait:fungus_neutral
        //~ move_entity(PG, Library)
        //-> library
            -> main
            
    + {are_two_entities_together(PG, FromForestToLibrary) && secondTier == true} [FromForestToLibrary]
            ~ move_entity(PG, Library)
            //~ arrivingFrom = ()
            //~ arrivingFrom = Library             
        {
            - foundLibro:
                ~ move_entity(RewriterBook, Library)
        }
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Library)
        }         
            -> on_movement_events ->
                -> library
        
//Streets to Nest
    
    + {are_two_entities_together(PG, FromGreenhouseMiddlePathToNest)} [FromGreenhouseMiddlePathToNest]
            <i>Questa strada risulta bloccata.</i> #speaker:{fungus_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait:fungus_neutral
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
        - not fourthTier: <i>Questa strada risulta bloccata.</i> #speaker:{fungus_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait:fungus_neutral
            -> main
        - else:
            ~ move_entity(PG, Laboratory)
            //~ arrivingFrom = ()
            //~ arrivingFrom = Laboratory             
        {
            - foundLibro:
                ~ move_entity(RewriterBook, Laboratory)
        }
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Laboratory)
        }        
            -> on_movement_events ->
                -> laboratory
    }
            
        

-    
-> main




