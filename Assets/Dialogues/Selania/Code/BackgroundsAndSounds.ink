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
           
        - entity_location(PG) == BookPlace:
        
                {
                    - book_BGVariations ==  5:
                        ~ return "bookBGFive"
                    
                    - book_BGVariations ==  4:
                        ~ return "bookBGFour"
                        
                    - book_BGVariations ==  3:
                        ~ return "bookBGThree"
                
                    - book_BGVariations ==  2:
                        ~ return "bookBGTwo"    
                        
                    - book_BGVariations ==  1:
                        ~ return "bookBGOne"          
                    
                    - book_BGVariations ==  0:
                        ~ return "bookBGZero"
                    
                    - else:
                        errore
                } 

        }

=== DarkLibraryModeOn
    #background: backNightLibrary
    {
        - playerAccessiblePlaces has Nest:
            ~ move_entity(FromLibraryToNestNight, Library)
            ~ move_entity(FromLibraryToNest, Safekeeping)
        - else:
            ~ move_entity(FromLibraryToNestBlockedNight, Library)
            ~ move_entity(FromLibraryToNestBlocked, Safekeeping)
    
    }
    
    
    
    
    ~ move_entity(MoonTrees, Library)
    
{
    - not talking_witch.intro.nameWitch:
       ~ move_entity(NewMoonAnim, Library)
    
    - else:
       {
        - moonState == NewMoon:
           ~ move_entity(NewMoonAnim, Library)
        - moonState == FirstQuarter:
            ~ move_entity(FirstQuarterAnim, Library)
        - moonState == FullMoon:
            ~ move_entity(FullMoonAnim, Library)
        - moonState == ThirdQuarter:
            ~ move_entity(ThirdQuarterAnim, Library)
        - moonState == RedMoon:
            ~ move_entity(RedMoonAnim, Library)
       
       }
}
    ->->
    
=== DarkLibraryModeOff    
    #background: backLibrary
    {
        - playerAccessiblePlaces has Nest:
            ~ move_entity(FromLibraryToNestNight, Safekeeping)
            ~ move_entity(FromLibraryToNest, Library)
        - else:
            ~ move_entity(FromLibraryToNestBlockedNight, Safekeeping)
            ~ move_entity(FromLibraryToNestBlocked, Library)
    
    }
    
    
    ~ move_entity(MoonTrees, Safekeeping)
    
    {
        - libraryContents has NewMoonAnim:
           ~ move_entity(NewMoonAnim, Safekeeping)
        - libraryContents has FirstQuarter:
            ~ move_entity(FirstQuarterAnim, Safekeeping)
        - libraryContents has FullMoon:
            ~ move_entity(FullMoonAnim, Safekeeping)
        - libraryContents has ThirdQuarter:
            ~ move_entity(ThirdQuarterAnim, Safekeeping)
        - libraryContents has RedMoon:
            ~ move_entity(RedMoonAnim, Safekeeping)
          
    }    
    
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
                                
    }
    
    
    


