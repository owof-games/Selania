//Funzione per spostarsi da un luogo all'altro a seconda di dove mi trovo -> da vedere se ha senso o meno.
 
 === move_between_rooms(my_location)

+ {my_location == Biblioteca||my_location == Mausoleo|| my_location == Falene||my_location == Funghi||my_location == Labirinto||my_location == Tisane} [{~ Ti sposti in|Vai nel|Ti rechi al} giardino]
    ~ move_entity(PG, Giardino)
    //come prova, lascio che inCrescita aumenti sempre, perché poi viene resettato all'ingresso del test. Vediamo se ha senso o se crea solo casini.
    ~ inCrescita ++
    -> random_luogo_mentore ->
    -> comparsa_anime ->
    
    -> hub_giardino

+ {my_location == Giardino} [{~ Ti sposti verso il|Vai nel|Ti rechi al} mausoleo]
    ~ move_entity(PG, Mausoleo)
    ~ inCrescita ++
    -> random_luogo_mentore ->
    -> comparsa_anime ->
    
    -> hub_mausoleo


+ {my_location == Giardino && storiaDue == Conclusa && storiaTre == Conclusa && storiaQuattro == Conclusa} [{~ Ti sposti in|Vai nella|Ti rechi alla} biblioteca]
    ~ move_entity(PG, Biblioteca)
    ~ inCrescita ++
    -> random_luogo_mentore ->
    -> comparsa_anime ->
    
    -> hub_biblioteca

+ {my_location == Giardino && storiaUno == Conclusa} [{~ Ti sposti dalle|Vai dalle|Ti rechi dalle} falene]
    ~ move_entity(PG, Falene)
    ~ inCrescita ++
    -> random_luogo_mentore ->
    -> comparsa_anime ->
    
    -> hub_falene
    
+ {my_location == Giardino} [{~ Ti sposti dai|Vai dai|Ti rechi dai} funghi]
    ~ move_entity(PG, Funghi)
    ~ inCrescita ++
    -> random_luogo_mentore ->
    -> comparsa_anime ->
    
    -> hub_funghi   
    
+ {my_location == Giardino && storiaUno == Conclusa} [{~ Ti sposti nel|Vai nel|Ti rechi nel} labirinto]
    ~ move_entity(PG, Labirinto)
    ~ inCrescita ++
    -> random_luogo_mentore ->
    -> comparsa_anime ->
    
    -> hub_labirinto
    
+ {my_location == Giardino && storiaDue == Conclusa && storiaTre == Conclusa && storiaQuattro == Conclusa} [{~ Ti sposti dalle|Vai dalle|Ti rechi dalle} tisane]
    ~ move_entity(PG, Tisane)
    ~ inCrescita ++
    -> random_luogo_mentore ->
    -> comparsa_anime ->
    
    -> hub_tisane

+ {my_location == Giardino && storiaDue == Conclusa && storiaTre == Conclusa && storiaQuattro == Conclusa} [{~ Ti sposti nell'|Vai alla|Ti rechi nell'} area delle sirene]
    ~ move_entity(PG, Sirene)
    ~ inCrescita ++
    -> random_luogo_mentore ->
    -> comparsa_anime ->
    
    -> hub_sirene   

-    
-> main




