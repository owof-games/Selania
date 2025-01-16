//Funzione per spostarsi da un luogo all'altro a seconda di dove mi trovo -> da vedere se ha senso o meno.
 
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
    
+ {are_two_entities_together(PG, FromMausoleumToGarden)} [FromMausoleumToGarden]
    ~ move_entity(PG, Giardino)
    //come prova, lascio che inCrescita aumenti sempre, perché poi viene resettato all'ingresso del test. Vediamo se ha senso o se crea solo casini.
    ~ inCrescita ++
    -> random_luogo_mentore ->
    // -> comparsa_anime ->
    
    -> hub_giardino

+ {are_two_entities_together(PG, FromGreenhouseToGarden)} [FromGreenhouseToGarden]
    ~ move_entity(PG, Giardino)
    //come prova, lascio che inCrescita aumenti sempre, perché poi viene resettato all'ingresso del test. Vediamo se ha senso o se crea solo casini.
    ~ inCrescita ++
    -> random_luogo_mentore ->
    // -> comparsa_anime ->
    
    -> hub_giardino     

+ {are_two_entities_together(PG, FromGardenToMausoleum)}  [FromGardenToBusStop]
    ~ move_entity(PG, BusStop)
    ~ inCrescita ++
    -> random_luogo_mentore ->
    // -> comparsa_anime ->
    
    -> hub_bus_stop
    
+ {are_two_entities_together(PG, FromGardenToGreenhouse)}  [FromGardenToGreenhouse]
    ~ move_entity(PG, Funghi)
    ~ inCrescita ++
    -> random_luogo_mentore ->
    // -> comparsa_anime ->
    
    -> hub_funghi 

+ {my_location == Giardino && storiaDue == Conclusa && storiaTre == Conclusa && storiaQuattro == Conclusa} [Biblioteca]
    ~ move_entity(PG, Biblioteca)
    ~ inCrescita ++
    -> random_luogo_mentore ->
    // -> comparsa_anime ->
    
    -> hub_biblioteca

+ {my_location == Giardino && storiaUno == Conclusa} [Falene]
    ~ move_entity(PG, Falene)
    ~ inCrescita ++
    -> random_luogo_mentore ->
    // -> comparsa_anime ->
    
    -> hub_falene
    

    
+ {my_location == Giardino && storiaUno == Conclusa} [Labirinto]
    ~ move_entity(PG, Labirinto)
    ~ inCrescita ++
    -> random_luogo_mentore ->
    // -> comparsa_anime ->
    
    -> hub_labirinto
    
+ {my_location == Giardino && storiaDue == Conclusa && storiaTre == Conclusa && storiaQuattro == Conclusa} [Tisane]
    ~ move_entity(PG, Tisane)
    ~ inCrescita ++
    -> random_luogo_mentore ->
    // -> comparsa_anime ->
    
    -> hub_tisane

+ {my_location == Giardino && storiaDue == Conclusa && storiaTre == Conclusa && storiaQuattro == Conclusa} [Sirene]
    ~ move_entity(PG, Sirene)
    ~ inCrescita ++
    -> random_luogo_mentore ->
    // -> comparsa_anime ->
    
    -> hub_sirene   

-    
-> main




