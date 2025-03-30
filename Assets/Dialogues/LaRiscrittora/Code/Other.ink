

//Funzioni di gestione del background
//Per la nomenclatura: il back di default è backLuogo, il resto vediamo man mano.
// LIST bedroomBGStates = bedroomBGZero, bedroomBGOne, bedroomBGTwo, bedroomBGThree

=== function tag_background()
{
    - entity_location(PG) == Bedroom:
    {
        - bedroomBGStates has bedroomBGThree:
                ~ return "bedroomThree"
    
        - bedroomBGStates has bedroomBGTwo:
                ~ return "bedroomTwo"
        
        - bedroomBGStates has bedroomBGOne:
                ~ return "bedroomOne"
        
        - bedroomBGStates has bedroomBGZero:
                ~ return "bedroomZero"
    
    }
       
       
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
    
    ~ lastMindfulness --
    
//Aumento di contatori:
    ~ movementsCounter ++

//Comparsa lettere dopo fine delle storie (così non compaiono subito.
    {firstCharacterPossibleStates hasnt Chitarra && first_char_story_ended.goodbye:
            ~ move_entity(FirstCharacterNotes, BusStop)
            {debug: Ho messo la nota della prima personaggia alla fermata del bus.}
    }
    {second_char_story_ended.goodbye:
            ~ move_entity(SecondCharacterNotes, BusStop)
            {debug: Ho messo la nota del secondo personaggio alla fermata del bus.}
    }    
    
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


=== bedroom_backgrounds_calculator

    
    {
        - from_list_to_books && (lichene_degli_abissi.step_tre or edera_delle_amanti.step_tre or canto_delle_compagne.step_tre or la_spazzata.step_tre or bacca_della_addolorata.step_tre or non_ti_scordar_di_te.step_tre or brina_dell_impossibile.step_tre):
                ~ bedroomBGStates += ()
                ~ bedroomBGStates += bedroomBGThree
        
        - (lichene_degli_abissi.step_tre or edera_delle_amanti.step_tre or canto_delle_compagne.step_tre or la_spazzata.step_tre or bacca_della_addolorata.step_tre or non_ti_scordar_di_te.step_tre or brina_dell_impossibile.step_tre) && (welcome or talking_fungus):
                ~ bedroomBGStates += ()
                ~ bedroomBGStates += bedroomBGTwo
            
        - welcome or talking_fungus:
                ~ bedroomBGStates += ()
                ~ bedroomBGStates += bedroomBGOne
            
        - else:
                ~ bedroomBGStates += ()
                ~ bedroomBGStates += bedroomBGZero

    } 

->->