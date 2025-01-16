//Funzione per spostarsi da un luogo all'altro a seconda di dove mi trovo -> da vedere se ha senso o meno.
 TODO: vedere se ha senso accorpare tutte le azioni che faccio a ogni cambio di luogo sotto un unico nodo o funzione.
 
 === move_between_rooms(my_location)
//+ {my_location == Biblioteca|| my_location == Falene||my_location == Funghi||my_location == Labirinto||my_location == Tisane} [Giardino]
  //  ~ move_entity(PG, Giardino)
    //come prova, lascio che inCrescita aumenti sempre, perché poi viene resettato all'ingresso del test. Vediamo se ha senso o se crea solo casini.
   // ~ inCrescita ++
    //-> random_luogo_mentore ->
    //-> comparsa_anime ->
    
    //-> hub_giardino

+ {are_two_entities_together(PG, FromGardenToNothing)} [FromGardenToNothing]
    <i>Questa strada risulta bloccata, per ora.</i>
    -> main
    
    
// + {are_two_entities_together(PG, FromMausoleumToNothing)} [FromMausoleumToNothing]
//     <i>L'acqua alta blocca la strada. Eppure senti una voce cantare.</i>
//     -> main
    
+ {are_two_entities_together(PG, FromBusStopToGarden)} [FromMausoleumToGarden]
    ~ move_entity(PG, Giardino)
    //come prova, lascio che inCrescita aumenti sempre, perché poi viene resettato all'ingresso del test. Vediamo se ha senso o se crea solo casini.
    ~ inCrescita ++
    ~ counterSpostamenti ++
    -> random_luogo_mentore ->
    -> story_time_management_for_PNG->
    // -> comparsa_anime ->
    
    -> hub_giardino

+ {are_two_entities_together(PG, FromGreenhouseToGarden)} [FromGreenhouseToGarden]
    ~ move_entity(PG, Giardino)
    //come prova, lascio che inCrescita aumenti sempre, perché poi viene resettato all'ingresso del test. Vediamo se ha senso o se crea solo casini.
    ~ inCrescita ++
    ~ counterSpostamenti ++
    -> random_luogo_mentore ->
    -> story_time_management_for_PNG->
    // -> comparsa_anime ->
    
    -> hub_giardino     

+ {are_two_entities_together(PG, FromGardenToBusStop)}  [FromGardenToBusStop]
    ~ move_entity(PG, BusStop)
    ~ inCrescita ++
    ~ counterSpostamenti ++    
    -> random_luogo_mentore ->
    -> story_time_management_for_PNG->
    // -> comparsa_anime ->
    
    -> hub_bus_stop
    
+ {are_two_entities_together(PG, FromGardenToGreenhouse)}  [FromGardenToGreenhouse]
    ~ move_entity(PG, Funghi)
    ~ inCrescita ++
    ~ counterSpostamenti ++    
    -> random_luogo_mentore ->
    -> story_time_management_for_PNG->
    // -> comparsa_anime ->
    
    -> hub_funghi 

+ {my_location == Giardino && storiaDue == Conclusa && storiaTre == Conclusa && storiaQuattro == Conclusa} [Biblioteca]
    ~ move_entity(PG, Biblioteca)
    ~ inCrescita ++
    ~ counterSpostamenti ++    
    -> random_luogo_mentore ->
    -> story_time_management_for_PNG->
    // -> comparsa_anime ->
    
    -> hub_biblioteca

+ {my_location == Giardino && storiaUno == Conclusa} [Falene]
    ~ move_entity(PG, Falene)
    ~ inCrescita ++
    ~ counterSpostamenti ++    
    -> random_luogo_mentore ->
    -> story_time_management_for_PNG->
    // -> comparsa_anime ->
    
    -> hub_falene
    

    
+ {my_location == Giardino && storiaUno == Conclusa} [Labirinto]
    ~ move_entity(PG, Labirinto)
    ~ inCrescita ++
    ~ counterSpostamenti ++    
    -> random_luogo_mentore ->
    -> story_time_management_for_PNG->
    // -> comparsa_anime ->
    
    -> hub_labirinto
    
+ {my_location == Giardino && storiaDue == Conclusa && storiaTre == Conclusa && storiaQuattro == Conclusa} [Tisane]
    ~ move_entity(PG, Tisane)
    ~ inCrescita ++
    ~ counterSpostamenti ++    
    -> random_luogo_mentore ->
    -> story_time_management_for_PNG->
    // -> comparsa_anime ->
    
    -> hub_tisane

-    
-> main




