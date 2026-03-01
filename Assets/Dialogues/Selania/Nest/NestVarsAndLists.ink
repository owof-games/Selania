VAR nest_foundedGlyphs = (aetherGlyph, waterGlyph, airGlyph)

    
//Una lista degli usi possibili di emotional_words_management
    LIST nest_emotionalWordsManagementPossibleStatus = Activate, Delete

//Una lista delle parole trovate. Se una parola è qui dentro, una volta "suonata" non passerò da emotional_backpack_management
    VAR nest_discoveredEmotionalWords = ()

//Il tracciamento della parola appena scoperta
    VAR nest_newlyDiscoveredEmotionalWord = ()


//L'inventario effettivo
    VAR nest_ownedEmotionalWords = ()
    
//Una variabile che tiene conto di quale sia la parola attiva ora
    VAR nest_activeEmotionalWord = ()

//Una lista delle parole effettivamente utilizzate
    VAR nest_usedEmotionaWords = ()

 //Notifichiamo una nuova scoperta
    VAR nest_newSigilDiscovered = ()   
    
//Qualcosa che limiti il numero di parole aggiungibili.
//Remind: ogni volta che aggiungo una parola, il limite si aggiorna.
    //Un contatore che aumenta ogni volta che viene aggiunta una parola all'inventario effettivo
    VAR nest_takenEmotionalWords = 0
    
    //Un parametro che indichi il massimo delle parole previste
    VAR nest_maximumEmotionalWordsForRun = 25


