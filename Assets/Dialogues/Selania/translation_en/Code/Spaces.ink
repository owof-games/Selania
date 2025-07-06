//Funzione per tracciare se una data entità si trova o meno in un determinato luogo

=== function entity_location(entity)
{
    - forestContents has entity:
        ~ return Forest
    - busStopContents has entity:
        ~ return BusStop
    - libraryContents has entity:
        ~ return Library
    - nestContents has entity:
        ~ return Nest
    - greenhouseContents has entity:
        ~ return Greenhouse
    - laboratoryContents has entity:
        ~ return Laboratory
    - greenhouseMiddlePathContents has entity:
        ~ return GreenhouseMiddlePath         
    - safekeepingContents has entity:
        ~ return Safekeeping
    - bedroomContents has entity:
        ~ return Bedroom
    - else:
        DEBUG: error, cannot find {entity} anywhere!
        {safekeepingContents}
        ~ return Forest
}


/*
~ temp CurrentLocation = entity_location(PG)
~ move_entity(AnimellaUno, CurrentLocation)
*/
//Funzione per spostare un'entità da un luogo a un altro
=== function move_entity(entity, destination)

~ temp CurrentLocation = entity_location(entity)
{CurrentLocation:
    - Forest:
        ~ forestContents -= entity
    - BusStop:
        ~ busStopContents -= entity
    - Library:
        ~ libraryContents -= entity
    - Nest:
        ~ nestContents-= entity
    - Greenhouse:
        ~ greenhouseContents -= entity
    - Laboratory:
        ~ laboratoryContents -= entity
    - GreenhouseMiddlePath:
        ~ greenhouseMiddlePathContents -= entity        
    - Safekeeping:
        ~ safekeepingContents -= entity
    - Bedroom:
        ~ bedroomContents -= entity
    - else:
        DEBUG: error, cannot understand location {CurrentLocation} while trying to move {entity} out.
}

{destination:
    - Forest:
        ~ forestContents += entity
    - BusStop:
        ~ busStopContents += entity
    - Library:
        ~ libraryContents += entity
    - Nest:
        ~ nestContents += entity
    - Greenhouse:
        ~ greenhouseContents += entity
    - Laboratory:
        ~ laboratoryContents += entity
    - GreenhouseMiddlePath:
        ~ greenhouseMiddlePathContents += entity         
    - Safekeeping:
        ~ safekeepingContents += entity
    - Bedroom:
        ~ bedroomContents += entity    
    - else:
        DEBUG: error, cannot understand location {destination} while trying to move {entity} in.
}


//Funzioni per capire se due entità sono nello stesso luogo
=== function are_two_entities_together(entity1, entity2)
~ return entity_location(entity1) == entity_location(entity2)


== function are_entities_together_in(entity1, entity2, location)
~ return entity_location(entity1) == entity_location(entity2) and entity_location(entity1) == location


//Funzione per avvicinare una PNG alla personaggia protagonista
 === function move_first_entity_to_second_entity_location(entity1,entity2)
    ~ temp entity2_location = entity_location(entity2)
    ~ move_entity(entity1, entity2_location)
    
=== function change_entity_place(entity)
    {
        - are_two_entities_together(entity, PG):
            {
                - entity_location(PG) == BusStop:
                    ~ move_entity(entity, Forest)
                - else:
                    ~ move_entity(entity, BusStop)
            }
    }  
