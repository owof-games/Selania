//Gestione background
VAR saturationVar = 0
    
    
    
//Funzioni di gestione del background
//Per la nomenclatura: il back di default è backLuogo, il resto vediamo man mano.
=== function tag_background()
{debug: <i>il valore di saturazione è di {saturationVar}.}

    {
        - entity_location(PG) == Bedroom:
            ~ return "backBedroom"

        - entity_location(PG) == Forest:
            ~ return "backForest"
            
        - entity_location(PG) == TrainStop:
            ~ return "backTrainStop"
            
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
           
        - entity_location(PG) == BookPlace:
        
                {
                    - bookBGVariations ==  5:
                        ~ return "bookBGFive"
                    
                    - bookBGVariations ==  4:
                        ~ return "bookBGFour"
                        
                    - bookBGVariations ==  3:
                        ~ return "bookBGThree"
                
                    - bookBGVariations ==  2:
                        ~ return "bookBGTwo"    
                        
                    - bookBGVariations ==  1:
                        ~ return "bookBGOne"          
                    
                    - bookBGVariations ==  0:
                        ~ return "bookBGZero"
                    
                    - else:
                        errore
                } 

        }
        

//Funzioni di gestione sottofondo audio
=== function tag_ambientSounds()
    {
        - entity_location(PG) == Bedroom:
           ~ return "bedroomSounds"
           
        - entity_location(PG) == Forest:
            ~ return "forestSounds"
            
        - entity_location(PG) == TrainStop:
            ~ return "trainstopSounds"
            
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
           
        - entity_location(PG) == BookPlace:
            ~ return "bookSounds"           
                                
    }
    
    
    
=== function fungus_state()
{
    - talking_fungus.first_story_ended_check.nameFungus:
       ~ return "moon_neutral"
     - else:
       ~ return "fungus_anonimo"
}

=== DarkLibraryModeOn
    #background: backNightLibrary
    ~ move_entity(FromLibraryToLaboratoryNight, Library)
    ~ move_entity(FromLibraryToLaboratory, Safekeeping)
    ->->
    
=== DarkLibraryModeOff    
    #background: backLibrary
    ~ move_entity(FromLibraryToLaboratoryNight, Safekeeping)
    ~ move_entity(FromLibraryToLaboratory, Library)
    ->->