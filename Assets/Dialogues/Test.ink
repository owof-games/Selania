-> main

//Ricorda: in INK la logica è che una riga è attaccata a tutte le scelte dopo, per cui @interacti è collegato ora anche a mentore, anima.

=== main
@interact #background: {tag_background()}

<- spostamenti
<- mentore
<- anima
<- inventario
+ -> main

=== hub_giardino

-> main


=== hub_biblioteca

->main


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

//TEST SPOSTAMENTO
//Giardino e Biblioteca sono item di lista
LIST luoghi = Giardino, Biblioteca
LIST personagge = Mentore, PG, Anima
VAR contenutoGiardino = (PG, Mentore, Anima)
VAR contenutoBiblioteca = ()

=== function entity_location(entity)
{
    - contenutoGiardino has entity:
        ~ return Giardino
    - contenutoBiblioteca has entity:
        ~ return Biblioteca
    - else:
        DEBUG: error, cannot find {entity} anywhere!
        ~ return 0
}


/*
~ temp CurrentLocation = entity_location(PG)
~ move_entity(AnimellaUno, CurrentLocation)
*/
//Funzione per spostare un'entità da un luogo a un altro
=== function move_entity(entity, destination)

~ temp CurrentLocation = entity_location(entity)
{CurrentLocation:
    - Giardino:
        ~ contenutoGiardino -= entity
    - Biblioteca:
        ~ contenutoBiblioteca -= entity
        
    - else:
        DEBUG: error, cannot understand location {CurrentLocation} while trying to move {entity} out.
}

{destination:
    - Giardino:
        ~ contenutoGiardino += entity
    - Biblioteca:
        ~ contenutoBiblioteca += entity
    - else:
        DEBUG: error, cannot understand location {destination} while trying to move {entity} in.
}

=== spostamenti 
    + {entity_location(PG) == Biblioteca} [Giardino]
    ~ move_entity(PG, Giardino)
    
        -> hub_giardino

+ {entity_location(PG) == Giardino} [Biblioteca]
    ~ move_entity(PG, Biblioteca)

    -> hub_biblioteca

->->

=== function tag_background()
{
    - entity_location(PG) == Biblioteca:
       ~ return "backBiblioteca"
    - entity_location(PG) == Giardino:
        ~ return "backDue"
}


