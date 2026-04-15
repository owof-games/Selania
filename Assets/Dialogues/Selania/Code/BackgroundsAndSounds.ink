//Funzioni di gestione del background
//Per la nomenclatura: il back di default è backLuogo, il resto vediamo man mano.
=== function tag_background()

    {
        - entity_location(PG) == Bedroom:
            ~ return "backBedroom"

        - entity_location(PG) == Forest:
            ~ return "backForest"
            
        - entity_location(PG) == TrainStop:
            {
                - not mentor_rage:
                    ~ return "backTrainStop"
                - else:
                    ~ return "backTrainStopBroken"
            }
            
        - entity_location(PG) == Pond:
           ~ return "backPond"
           
        - entity_location(PG) == Greenhouse:
           ~ return "backGreenhouse"       
    
        - entity_location(PG) == Nest:
            ~ return "backNest"
    
        - entity_location(PG) == Library:
           ~ return "backLibrary"
    
        - entity_location(PG) == Kitchen:
           ~ return "backKitchen"

        - entity_location(PG) == Dump:
           ~ return "backDump"   
           
        - entity_location(PG) == BookPlace:
        
            ~ return "bookBGZero"

        }

=== DarkLibraryModeOn
    #background: backNightLibrary
    #ambientSounds: nightLibrarySounds
    {
        - player_accessiblePlaces has Nest:
            ~ move_entity(FromLibraryToNestNight, Library)
            ~ move_entity(FromLibraryToNest, Safekeeping)
        - else:
            ~ move_entity(FromLibraryToNestBlockedNight, Library)
            ~ move_entity(FromLibraryToNestBlocked, Safekeeping)
    }
    
    ~ move_entity(MoonTrees, Library)
    
    {
        - witch_moonState == NewMoon:
            ~ move_entity(NewMoonAnim, Library)

        - witch_moonState == FirstQuarter:
            ~ move_entity(FirstQuarterAnim, Library)

        - witch_moonState == FullMoon:
            ~ move_entity(FullMoonAnim, Library)

        - witch_moonState == ThirdQuarter:
            ~ move_entity(ThirdQuarterAnim, Library)
            
        - witch_moonState == RedMoon:
            ~ move_entity(RedMoonAnim, Library)
    }
    ->->
    
=== DarkLibraryModeOff    
    #background: backLibrary
    #ambientSounds: librarySounds
    {
        - player_accessiblePlaces has Nest:
            ~ move_entity(FromLibraryToNestNight, Safekeeping)
            ~ move_entity(FromLibraryToNest, Library)
        - else:
            ~ move_entity(FromLibraryToNestBlockedNight, Safekeeping)
            ~ move_entity(FromLibraryToNestBlocked, Library)
    
    }
    
    ~ move_entity(MoonTrees, Safekeeping)
    
    {
        - contentsLibrary has NewMoonAnim:
           ~ move_entity(NewMoonAnim, Safekeeping)
        
        - contentsLibrary has FirstQuarterAnim:
            ~ move_entity(FirstQuarterAnim, Safekeeping)
        
        - contentsLibrary has FullMoonAnim:
            ~ move_entity(FullMoonAnim, Safekeeping)
        
        - contentsLibrary has ThirdQuarterAnim:
            ~ move_entity(ThirdQuarterAnim, Safekeeping)
        
        - contentsLibrary has RedMoonAnim:
            ~ move_entity(RedMoonAnim, Safekeeping)
          
    }    
    
    -> achievements_onGame_statusUpdate_RM ->
    ->->
    
    

//Funzioni di gestione sottofondo audio
=== function tag_ambientSounds()
    {
        - entity_location(PG) == Bedroom:
           ~ return "bedroomSounds"
           
        - entity_location(PG) == Forest:
            ~ return "forestSounds"
            
        - entity_location(PG) == TrainStop:
            ~ return "trainstopSounds"
            
        - entity_location(PG) == Pond:
           ~ return "pondSounds"
           
        - entity_location(PG) == Greenhouse:
           ~ return "greenhouseSounds"
    
        - entity_location(PG) == Nest:
            ~ return "nestSounds"
    
        - entity_location(PG) == Library:
           ~ return "librarySounds"
    
        - entity_location(PG) == Kitchen:
           ~ return "kitchenSounds"
           
        - entity_location(PG) == BookPlace:
            ~ return "bookSounds"

        - entity_location(PG) == Dump:
            ~ return "dumpSounds"               
                                
    }
    
    
    


