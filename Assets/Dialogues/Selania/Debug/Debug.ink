    VAR debug_seedRandom = false

//Per abilitare o meno i debug
    VAR debug = false
    VAR debug_cultivable = false
    VAR debug_changeName = false
    VAR debug_kitchen = false
    VAR debug_nest = false
    VAR debug_frog = false
    VAR debug_horizontalS = false
    VAR debug_achievements = false
    VAR debug_PNGLocation = false
    //Testing lo utilizzo per funzioni ed elementi speciali che mi servono in ink, come l'accesso permanente al grimorio.
    VAR debug_testing = false

    //per testare i luoghi non subito aperti con calma
    VAR debug_testLibrary = false
    VAR debug_testKitchen = false
    VAR debug_testNest = false
    VAR debug_testFrog = false
    VAR debug_testDump = false
    VAR debug_testGreenhouse = false
    VAR debug_dialogues = false

//Per disabilitare uscite e cose varie in caso di testing con il sistema stocastico
    VAR debug_stochastic = false


{debug_seedRandom:
    ~ SEED_RANDOM(246)
}
