    VAR debug_seedRandom = false
    
//Per abilitare o meno i debug
    VAR debug_openAll = false
    VAR debug = true
    VAR debug_cultivable = true
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
} 
{
    - debug_testKitchen == true && (entity_location(FromPondToKitchen) == Safekeeping):
        ~ move_entity(FromPondToKitchenBlocked, Safekeeping)
        ~ move_entity(FromPondToKitchen, Pond)
}
{
    - debug_testLibrary == true && (entity_location(FromForestToLibrary) == Safekeeping):
        ~ move_entity(FromForestToLibraryBlocked, Safekeeping)
        ~ move_entity(FromForestToLibrary, Forest)
} 
{
    - debug_testNest == true && (entity_location(FromLibraryToNest) == Safekeeping):
        ~ move_entity(FromLibraryToNestBlocked, Safekeeping)
        ~ move_entity(FromLibraryToNest, Library)
}
{
    - debug_testGreenhouse == true && (entity_location(FromPondToGreenhouse) == Safekeeping):
        ~ move_entity(FromPondToGreenhouseBlocked, Safekeeping)
        ~ move_entity(FromPondToGreenhouse, Pond)
}
{
    - debug_testFrog == true && (entity_location(TheFrog) == Safekeeping):
        ~ move_entity(TheFrog, Pond)
}      
->->