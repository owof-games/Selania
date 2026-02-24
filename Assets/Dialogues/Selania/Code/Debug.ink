    VAR debug_seedRandom = false
    
//Per abilitare o meno i debug
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
    
//Per disabilitare uscite e cose varie in caso di testing con il sistema stocastico    
    VAR debug_stochastic = true


{debug_seedRandom:
    ~ SEED_RANDOM(246)
}


=== open_dump ===
{
    - debug_testDump == true && (entity_location(FromForestToDump) == Safekeeping):
        ~ move_entity(FromForestToDumpBlocked, Safekeeping)
        ~ move_entity(FromForestToDump, Forest)
}    
->->