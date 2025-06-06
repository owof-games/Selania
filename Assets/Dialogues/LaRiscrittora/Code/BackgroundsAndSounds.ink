//Gestione background
    LIST bedroomBGStates = (bedroomBGZero), bedroomBGOne, bedroomBGTwo, bedroomBGThree

//Funzioni di gestione del background
//Per la nomenclatura: il back di default è backLuogo, il resto vediamo man mano.
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
            
        - entity_location(PG) == TrainStop:
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
            
        - entity_location(PG) == TrainStop:
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