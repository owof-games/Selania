// //Una lista degli usi possibili di emotional_words_management
//     LIST nest_emotionalWordsManagementPossibleStatus = Activate, Delete


//Notifichiamo una nuova scoperta
VAR nest_newSigilDiscovered = ()   
    
//Qualcosa che limiti il numero di parole aggiungibili.
//Remind: ogni volta che aggiungo una parola, il limite si aggiorna.
    //Un contatore che aumenta ogni volta che viene aggiunta una parola all'inventario effettivo
    VAR nest_takenEmotionalWords = 0
    
    //Un parametro che indichi il massimo delle parole previste
    VAR nest_maximumEmotionalWordsForRun = 25


