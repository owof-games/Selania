//Funzione per spostarsi da un luogo all'altro a seconda di dove mi trovo

 === move_between_rooms(my_location)
 //Strade bloccate
    + {are_two_entities_together(PG, FromForestToLibrary)} [FromForestToLibrary]
            <i>Questa strada risulta bloccata, per ora.</i>
        -> main
    
    + {are_two_entities_together(PG, FromGreenhouseMiddlePathToNest)} [FromGreenhouseMiddlePathToNest]
            <i>Questa strada risulta bloccata, per ora.</i>
        -> main    
    
    + {are_two_entities_together(PG, FromBusStopToExitGame)} [FromBusStopToExitGame]
         <i>Progresso salvato. A presto!</i>
     -> main

//Strade per arrivare al Bus Stop    
    + {are_two_entities_together(PG, FromForestToBusStop)}  [FromForestToBusStop]
            ~ move_entity(PG, BusStop)
            ~ movementsCounter ++    
            -> randomizer_png_location ->
            -> story_time_management_for_PNG->
        -> bus_stop
                
//Streets to Garden       
    + {are_two_entities_together(PG, FromBusStopToForest)} [FromBusStopToForest]
            ~ move_entity(PG, Forest)
            ~ movementsCounter ++
            -> randomizer_png_location ->
            -> story_time_management_for_PNG->
        -> forest
        
        
    + {are_two_entities_together(PG, FromGreenhouseMiddlePathToForest)} [FromGreenhouseMiddlePathToForest]
            ~ move_entity(PG, Forest)
            ~ movementsCounter ++
            -> randomizer_png_location ->
            -> story_time_management_for_PNG->
        -> forest
    
 //Streets to GreenhouseMiddlePath   
    + {are_two_entities_together(PG, FromGreenhouseToGreenhouseMiddlePath)} [FromGreenhouseToGreenhouseMiddlePath]
            ~ move_entity(PG, GreenhouseMiddlePath)
            ~ movementsCounter ++
            -> randomizer_png_location ->
            -> story_time_management_for_PNG->
        -> greenhouse_middle_path
        
    + {are_two_entities_together(PG, FromForestToGreenhouseMiddlePath)} [FromForestToGreenhouseMiddlePath]
            ~ move_entity(PG, GreenhouseMiddlePath)
            ~ movementsCounter ++
            -> randomizer_png_location ->
            -> story_time_management_for_PNG->
        -> greenhouse_middle_path
        
        
//Streets to Greenhouse
    + {are_two_entities_together(PG, FromGreenhouseMiddlePathToGreenhouse)}  [FromGreenhouseMiddlePathToGreenhouse]
            ~ move_entity(PG, Greenhouse)
            ~ movementsCounter ++
            ~ growing ++
            -> growing_check ->
            -> randomizer_png_location ->
            -> story_time_management_for_PNG->
        -> greenhouse


-    
-> main




