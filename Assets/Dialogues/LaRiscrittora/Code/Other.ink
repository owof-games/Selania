

//Funzioni di gestione del background
//Per la nomenclatura: il back di default è backLuogo, il resto vediamo man mano.
=== function tag_background()
{
    - entity_location(PG) == Bedroom:
       ~ return "backBedroom"
       
    - entity_location(PG) == Forest:
        ~ return "backForest"
        
    - entity_location(PG) == BusStop:
        ~ return "backBusStop"
        
    - entity_location(PG) == GreenhouseMiddlePath:
       ~ return "backGreenhouseMiddlePath"
       
    - entity_location(PG) == Greenhouse:
       ~ return "backGreenhouse"       

    - entity_location(PG) == Nest:
        ~ return "backNest"

    - entity_location(PG) == Library:
       ~ return "backLibrary"

    - entity_location(PG) == Laboratory:
       ~ return "backLaboratory"       
                            
}

//Funzioni di gestione sottofondo audio
=== function tag_ambientSounds()
{
    - entity_location(PG) == Bedroom:
       ~ return "bedroomSounds"
       
    - entity_location(PG) == Forest:
        ~ return "forestSounds"
        
    - entity_location(PG) == BusStop:
        ~ return "busstopSounds"
        
    - entity_location(PG) == GreenhouseMiddlePath:
       ~ return "greenhouseMiddlePathSounds"        
        
    - entity_location(PG) == Greenhouse:
       ~ return "greenhouseSounds"

    - entity_location(PG) == Nest:
        ~ return "nestSounds"

    - entity_location(PG) == Library:
       ~ return "librarySounds"

    - entity_location(PG) == Laboratory:
       ~ return "laboratorySounds"       
                            
}

=== on_movement_events
//Qui metto tutte quelle funzioni e variazioni che sono richieste a ogni cambio stanza.

//Riduzioni di contatori legati al tempo:
    ~ firstWritingPause --
    ~ secondWritingPause --
    ~ thirdWritingPause --
    ~ fifthWritingPause --
    
//Aumento di contatori:
    ~ movementsCounter ++
    
//Altre funzioni:
    -> characters_speaking ->
    -> randomizer_png_location ->
    -> story_time_management_for_PNG->    
->->

//Riduzione del tempo di pausa del dialogo fino a quando non siamo a 0
=== characters_speaking
    {
        - firstPauseTalking > 0:
            ~ firstPauseTalking --
            {debug: Il valore di firstPauseTalking è {firstPauseTalking}}
        
        - secondPauseTalking > 0:
            ~ secondPauseTalking --
        
        - thirdPauseTalking > 0:
            ~ thirdPauseTalking --
        
        - fifthPauseTalking > 0:
            ~ fifthPauseTalking --    
    }
->->
    