-> main

//Ricorda: in INK la logica è che una riga è attaccata a tutte le scelte dopo, per cui @interacti è collegato ora anche a mentore, anima.

=== main
@interact #background: {tag_background()}

<- spostamenti
<- mentore
<- anima
<- inventario
+ -> main

//Dialoghi base
=== mentore
+ [Mentore]
Mentore: Ti dico delle cose.
Mentore: E altre cose. #background: backGiardino
Mentore: Giusto per vedere quanto la tiro lunga.
-
    + Buffo no?
    + Altra scelta
-
-> main

=== anima
+[Anima]
Anima: Io dico altre cose.
- 
    + Cosa ne pensi?
-    
-> main

=== inventario
+ [Inventario]
Nell'inventario ci sono mele, pere, kiwi.
    -
    + Manca qualcosa?
    -
-> main

//Luoghi
=== hub_giardino
Mentore: ti trovi nel giardino
-> main


=== hub_mausoleo
Mentore: ti trovi nel mausoleo
->main

=== hub_funghi
Mentore: ti trovi nelle serre
-> main


=== hub_falene
Mentore: ti trovi dalle falene
->main

=== hub_labirinto
Mentore: ti trovi nel labirinto
-> main


=== hub_biblioteca
Mentore: ti trovi nella biblioteca
->main


=== hub_tisane
Mentore: ti trovi nella teeria
->main

=== hub_sirene
Mentore: ti trovi dalle sirene
->main

//TEST SPOSTAMENTO
//Giardino e Biblioteca sono item di lista
LIST luoghi = Giardino, Mausoleo, Funghi, Biblioteca, Falene, Labirinto, Tisane, Sirene
LIST personagge = Mentore, PG, Anima
VAR contenutoGiardino = (PG, Mentore, Anima)
VAR contenutoBiblioteca = ()
VAR contenutoMausoleo = ()
VAR contenutoFunghi = ()
VAR contenutoLabirinto = ()
VAR contenutoFalene = ()
VAR contenutoTisane = ()
VAR contenutoSirene = ()

=== function entity_location(entity)
{
- contenutoGiardino has entity:
        ~ return Giardino
    - contenutoMausoleo has entity:
        ~ return Mausoleo
    - contenutoBiblioteca has entity:
        ~ return Biblioteca
    - contenutoFalene has entity:
        ~ return Falene
    - contenutoFunghi has entity:
        ~ return Funghi
    - contenutoLabirinto has entity:
        ~ return Labirinto
    - contenutoTisane has entity:
        ~ return Tisane   
    - contenutoSirene has entity:
        ~ return Sirene
    - else:
        DEBUG: error, cannot find {entity} anywhere!
        ~ return 0
}


/*
~ temp CurrentLocation = entity_location(PG)(PG)
~ move_entity(AnimellaUno, CurrentLocation)
*/
//Funzione per spostare un'entità da un luogo a un altro
=== function move_entity(entity, destination)

~ temp CurrentLocation = entity_location(PG)
{CurrentLocation:
    - Giardino:
        ~ contenutoGiardino -= entity
    - Mausoleo:
        ~ contenutoMausoleo -= entity
    - Biblioteca:
        ~ contenutoBiblioteca -= entity
    - Falene:
        ~ contenutoFalene -= entity
    - Funghi:
        ~ contenutoFunghi -= entity
    - Labirinto:
        ~ contenutoLabirinto -= entity
    - Tisane:
        ~ contenutoTisane -= entity
    - Sirene:
        ~ contenutoSirene -= entity
        
    - else:
        DEBUG: error, cannot understand location {CurrentLocation} while trying to move {entity} out.
}

{destination:
    - Giardino:
        ~ contenutoGiardino += entity
    - Mausoleo:
        ~ contenutoMausoleo += entity
    - Biblioteca:
        ~ contenutoBiblioteca += entity
    - Falene:
        ~ contenutoFalene += entity
    - Funghi:
        ~ contenutoFunghi += entity
    - Labirinto:
        ~ contenutoLabirinto += entity
    - Tisane:
        ~ contenutoTisane += entity        
    - Sirene:
        ~ contenutoSirene += entity
    - else:
        DEBUG: error, cannot understand location {destination} while trying to move {entity} in.
}

=== spostamenti 
// Mausoleo, Funghi, Biblioteca, Falene, Labirinto, Tisane, Sirene
+ {entity_location(PG) == Biblioteca||entity_location(PG) == Mausoleo|| entity_location(PG) == Falene||entity_location(PG) == Funghi||entity_location(PG) == Labirinto||entity_location(PG) == Tisane} [{~ Ti sposti in|Vai nel|Ti rechi al} giardino]
    ~ move_entity(PG, Giardino)
    
    -> hub_giardino

+ {entity_location(PG) == Giardino} [{~ Ti sposti verso il|Vai nel|Ti rechi al} mausoleo]
    ~ move_entity(PG, Mausoleo)
    
    -> hub_mausoleo


+ {entity_location(PG) == Giardino} [{~ Ti sposti in|Vai nella|Ti rechi alla} biblioteca]
    ~ move_entity(PG, Biblioteca)
    
    -> hub_biblioteca

+ {entity_location(PG) == Giardino} [{~ Ti sposti dalle|Vai dalle|Ti rechi dalle} falene]
    ~ move_entity(PG, Falene)
    -> hub_falene
    
+ {entity_location(PG) == Giardino} [{~ Ti sposti dai|Vai dai|Ti rechi dai} funghi]
    ~ move_entity(PG, Funghi)
    
    -> hub_funghi   
    
+ {entity_location(PG) == Giardino} [{~ Ti sposti nel|Vai nel|Ti rechi nel} labirinto]
    ~ move_entity(PG, Labirinto)
 
    
    -> hub_labirinto
    
+ {entity_location(PG) == Giardino} [{~ Ti sposti dalle|Vai dalle|Ti rechi dalle} tisane]
    ~ move_entity(PG, Tisane)

    
    -> hub_tisane

+ {entity_location(PG) == Giardino} [{~ Ti sposti nell'|Vai alla|Ti rechi nell'} area delle sirene]
    ~ move_entity(PG, Sirene)

    
    -> hub_sirene 

->->

=== function tag_background()
{

    - entity_location(PG) == Giardino:
        ~ return "backGiardino"
        
    - entity_location(PG) == Mausoleo:
        ~ return "backMausoleo"
        
    - entity_location(PG) == Funghi:
       ~ return "backFunghi"

    - entity_location(PG) == Falene:
        ~ return "backFalene"
        
    - entity_location(PG) == Labirinto:
        ~ return "backLabirinto"
        
    - entity_location(PG) == Sirene:
       ~ return "backSirene"

    - entity_location(PG) == Biblioteca:
       ~ return "backBiblioteca"

    - entity_location(PG) == Tisane:
       ~ return "backTisane"      
}


