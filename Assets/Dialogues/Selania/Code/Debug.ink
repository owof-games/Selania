    VAR debug_seedRandom = true
    
//Per abilitare o meno i debug
    VAR debug_openAll = false
    VAR debug = false
    VAR debug_cultivable = false
    VAR debug_changeName = false
    VAR debug_kitchen = false
    VAR debug_nest = false
    VAR debug_frog = false
    
    //per testare i luoghi non subito aperti con calma
    VAR debug_testLibrary = false
    VAR debug_testKitchen = false
    VAR debug_testNest = false
    VAR debug_testFrog = false
    VAR debug_testDump = false
    VAR debug_testGreenhouse = false
    
//Per disabilitare uscite e cose varie in caso di testing con il sistema stocastico    
    VAR debug_stochastic = true


{debug_seedRandom:
    ~ SEED_RANDOM(246)
}


=== debug_places_open ===

{
    - debug_openAll == true:

            ~ debug_testLibrary = true
            ~ debug_testKitchen = true
            ~ debug_testNest = true
            ~ debug_testDump = true
            ~ debug_testGreenhouse = true
        
}


{
    - debug_testDump == true && (entity_location(FromForestToDump) == Safekeeping):
        ~ move_entity(FromForestToDumpBlocked, Safekeeping)
        ~ move_entity(FromForestToDump, Forest)
        ~ player_accessiblePlaces += Dump
} 
{
    - debug_testKitchen == true && (entity_location(FromPondToKitchen) == Safekeeping):
        ~ move_entity(FromPondToKitchenBlocked, Safekeeping)
        ~ move_entity(FromPondToKitchen, Pond)
        ~ player_accessiblePlaces += Kitchen
}
{
    - debug_testLibrary == true && (entity_location(FromForestToLibrary) == Safekeeping):
        ~ move_entity(FromForestToLibraryBlocked, Safekeeping)
        ~ move_entity(FromForestToLibrary, Forest)
        ~ player_accessiblePlaces += Library
} 
{
    - debug_testNest == true && (entity_location(FromLibraryToNest) == Safekeeping):
        ~ move_entity(FromLibraryToNestBlocked, Safekeeping)
        ~ move_entity(FromLibraryToNest, Library)
        ~ player_accessiblePlaces += Nest
}
{
    - debug_testGreenhouse == true && (entity_location(FromPondToGreenhouse) == Safekeeping):
        ~ move_entity(FromPondToGreenhouseBlocked, Safekeeping)
        ~ move_entity(FromPondToGreenhouse, Pond)
        ~ player_accessiblePlaces += Greenhouse
}
{
    - debug_testFrog == true && (entity_location(TheFrog) == Safekeeping):
        ~ move_entity(TheFrog, Pond)
}      
->->