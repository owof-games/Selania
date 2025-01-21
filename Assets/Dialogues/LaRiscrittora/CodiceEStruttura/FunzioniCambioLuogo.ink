//Funzione per spostarsi da un luogo all'altro a seconda di dove mi trovo -> da vedere se ha senso o meno.
 TODO: vedere se ha senso accorpare tutte le azioni che faccio a ogni cambio di luogo sotto un unico nodo o funzione.
 
 === move_between_rooms(my_location)
 //Strade bloccate
    + {are_two_entities_together(PG, FromForestToLibrary)} [FromForestToLibrary]
            <i>Questa strada risulta bloccata, per ora.</i>
        -> main
    
    + {are_two_entities_together(PG, FromGreenhouseMiddlePathToNothing)} [FromGreenhouseMiddlePathToNothing]
            <i>Questa strada risulta bloccata, per ora.</i>
        -> main    
    //+ {are_two_entities_together(PG, FromBusStopToExitGame)} [FromBusStopToExitGame]
            // <i>Progresso salvato. A presto!</i>
        // -> main

//Strade per arrivare al Bus Stop    
    + {are_two_entities_together(PG, FromForestToBusStop)}  [FromForestToBusStop]
            ~ move_entity(PG, BusStop)
            ~ inCrescita ++
            ~ counterSpostamenti ++    
            -> randomizer_png_location ->
            -> story_time_management_for_PNG->
        -> hub_bus_stop
                
//Streets to Garden       
    + {are_two_entities_together(PG, FromBusStopToGarden)} [FromBusStopToGarden]
            ~ move_entity(PG, Forest)
            ~ inCrescita ++
            ~ counterSpostamenti ++
            -> randomizer_png_location ->
            -> story_time_management_for_PNG->
        -> forest
        
        
    + {are_two_entities_together(PG, FromGreenhouseMiddlePathToGarden)} [FromGreenhouseMiddlePathToGarden]
            ~ move_entity(PG, Forest)
            ~ inCrescita ++
            ~ counterSpostamenti ++
            -> randomizer_png_location ->
            -> story_time_management_for_PNG->
        -> forest
    
 //Streets to GreenhouseMiddlePath   
    + {are_two_entities_together(PG, FromGreenhouseToGreenhouseMiddlePath)} [FromGreenhouseToGreenhouseMiddlePath]
            ~ move_entity(PG, GreenhouseMiddlePath)
            ~ inCrescita ++
            ~ counterSpostamenti ++
            -> randomizer_png_location ->
            -> story_time_management_for_PNG->
        -> greenhouse_middle_path
        
    + {are_two_entities_together(PG, FromForestToGreenhouseMiddlePath)} [FromForestToGreenhouseMiddlePath]
            ~ move_entity(PG, GreenhouseMiddlePath)
            ~ inCrescita ++
            ~ counterSpostamenti ++
            -> randomizer_png_location ->
            -> story_time_management_for_PNG->
        -> greenhouse_middle_path
        
        
//Streets to Greenhouse
    + {are_two_entities_together(PG, FromGreenhouseMiddlePathToGreenhouse)}  [FromGreenhouseMiddlePathToGreenhouse]
            ~ move_entity(PG, Funghi)
            ~ inCrescita ++
            ~ counterSpostamenti ++    
            -> randomizer_png_location ->
            -> story_time_management_for_PNG->
        -> hub_funghi 

// + {my_location == Forest && storiaDue == Conclusa && storiaTre == Conclusa && storiaQuattro == Conclusa} [Biblioteca]
//     ~ move_entity(PG, Biblioteca)
//     ~ inCrescita ++
//     ~ counterSpostamenti ++    
//     -> randomizer_png_location ->
//     -> story_time_management_for_PNG->
//     // -> comparsa_anime ->
    
//     -> hub_biblioteca

// + {my_location == Forest && storiaUno == Conclusa} [Falene]
//     ~ move_entity(PG, Falene)
//     ~ inCrescita ++
//     ~ counterSpostamenti ++    
//     -> randomizer_png_location ->
//     -> story_time_management_for_PNG->
//     // -> comparsa_anime ->
    
//     -> hub_falene
    

    
// + {my_location == Forest && storiaUno == Conclusa} [Labirinto]
//     ~ move_entity(PG, Labirinto)
//     ~ inCrescita ++
//     ~ counterSpostamenti ++    
//     -> randomizer_png_location ->
//     -> story_time_management_for_PNG->
//     // -> comparsa_anime ->
    
//     -> hub_labirinto
    
// + {my_location == Forest && storiaDue == Conclusa && storiaTre == Conclusa && storiaQuattro == Conclusa} [Tisane]
//     ~ move_entity(PG, Tisane)
//     ~ inCrescita ++
//     ~ counterSpostamenti ++    
//     -> randomizer_png_location ->
//     -> story_time_management_for_PNG->
//     // -> comparsa_anime ->
    
//     -> hub_tisane

-    
-> main




