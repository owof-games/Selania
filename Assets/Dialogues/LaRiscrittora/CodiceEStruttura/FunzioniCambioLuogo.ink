//Funzione per spostarsi da un luogo all'altro a seconda di dove mi trovo -> da vedere se ha senso o meno.
 TODO: vedere se ha senso accorpare tutte le azioni che faccio a ogni cambio di luogo sotto un unico nodo o funzione.
 
 === move_between_rooms(my_location)
    + {are_two_entities_together(PG, FromGardenToNothing)} [FromGardenToNothing]
            <i>Questa strada risulta bloccata, per ora.</i>
        -> main
        
    + {are_two_entities_together(PG, FromBusStopToExitGame)} [FromBusStopToExitGame]
            <i>Progresso salvato. A presto!</i>
        -> main    
        
    + {are_two_entities_together(PG, FromBusStopToGarden)} [FromBusStopToGarden]
            ~ move_entity(PG, Giardino)
            //~ inCrescita ++
            //~ counterSpostamenti ++
            // -> randomizer_png_location ->
            // -> story_time_management_for_PNG->
        -> hub_giardino
    
    + {are_two_entities_together(PG, FromGreenhouseToGarden)} [FromGreenhouseToGarden]
            ~ move_entity(PG, Giardino)
            //~ inCrescita ++
            //~ counterSpostamenti ++
            // -> randomizer_png_location ->
            // -> story_time_management_for_PNG->
        -> hub_giardino     
    
    + {are_two_entities_together(PG, FromGardenToBusStop)}  [FromGardenToBusStop]
            ~ move_entity(PG, BusStop)
            //~ inCrescita ++
            //~ counterSpostamenti ++    
            // -> randomizer_png_location ->
            // -> story_time_management_for_PNG->
        -> hub_bus_stop
        
    + {are_two_entities_together(PG, FromGardenToGreenhouse)}  [FromGardenToGreenhouse]
            ~ move_entity(PG, Funghi)
            //~ inCrescita ++
            //~ counterSpostamenti ++    
            // -> randomizer_png_location ->
            // -> story_time_management_for_PNG->
        -> hub_funghi 

// + {my_location == Giardino && storiaDue == Conclusa && storiaTre == Conclusa && storiaQuattro == Conclusa} [Biblioteca]
//     ~ move_entity(PG, Biblioteca)
//     ~ inCrescita ++
//     ~ counterSpostamenti ++    
//     -> randomizer_png_location ->
//     -> story_time_management_for_PNG->
//     // -> comparsa_anime ->
    
//     -> hub_biblioteca

// + {my_location == Giardino && storiaUno == Conclusa} [Falene]
//     ~ move_entity(PG, Falene)
//     ~ inCrescita ++
//     ~ counterSpostamenti ++    
//     -> randomizer_png_location ->
//     -> story_time_management_for_PNG->
//     // -> comparsa_anime ->
    
//     -> hub_falene
    

    
// + {my_location == Giardino && storiaUno == Conclusa} [Labirinto]
//     ~ move_entity(PG, Labirinto)
//     ~ inCrescita ++
//     ~ counterSpostamenti ++    
//     -> randomizer_png_location ->
//     -> story_time_management_for_PNG->
//     // -> comparsa_anime ->
    
//     -> hub_labirinto
    
// + {my_location == Giardino && storiaDue == Conclusa && storiaTre == Conclusa && storiaQuattro == Conclusa} [Tisane]
//     ~ move_entity(PG, Tisane)
//     ~ inCrescita ++
//     ~ counterSpostamenti ++    
//     -> randomizer_png_location ->
//     -> story_time_management_for_PNG->
//     // -> comparsa_anime ->
    
//     -> hub_tisane

-    
-> main




