                    /* ---------------------------------
                    
                      Gestione timing e valori della storia
                    
                     ----------------------------------*/

//Ordine degli stati: 0, Blue, Rosso, Verde, Giallo, Viola.
    LIST firstCharacterPossibleStates = Chitarra, Triangolo, RagazzaOrchestra, FlautoDolce, Ocarina, Violino
    VAR firstCharacterState = Chitarra
    
    VAR firstStory = NotStarted

//Tracciamento del dono
    VAR firstGift = ()

//Tengo conto delle interazioni avute per aprire la possibilità di dare un dono
    VAR firstStoryQuestCount = 0
    VAR firstCharacterSpecialEvent = false
    
//Variabili per mettere in pausa la conversazione
    VAR firstPauseTalking = 0
    VAR firstCharPauseDuration = 3
    
//Variabile per il countdown per la sua uscita di scena
    VAR firstCharEndingDialogue = 0
    
//Variabile per il tempo di attesa tra una lettera e l'altra
    VAR firstWritingPause = 0
    VAR firstWritingPauseDuration = 5
    
//STATI UP: Viola e Giallo.
//STATI DOWN: Blu.
    VAR firstPurple = 0
    VAR firstYellow = 0
    VAR firstBlue = 0
    VAR firstGreen = 0
    VAR firstRed = 0




                    /* ---------------------------------
                    
                       Gestione relazione e nomi
                    
                     ----------------------------------*/

=== firstAffinityCalc ===
//Per la prima personaggia l'importante è che il blu sia bassissimo

    {
        - firstPurple && firstYellow > firstBlue:
            ~ firstCharacterInkLevel ++
            ~ firstCharacterInkLevel ++
                ->->
        - firstPurple or firstYellow > firstBlue:
            ~ firstCharacterInkLevel ++
                ->->
    }

->->
    
    
//Settaggio nome quando partiamo con la discussione
=== firstNaming ===
    {
        - (firstBlue > firstGreen) && (firstBlue > firstRed) && (firstBlue > firstYellow) && (firstBlue > firstPurple):
            ~ firstCharacterPossibleStates += Triangolo
                ->->
                
        - (firstRed > firstGreen) && (firstRed > firstBlue) && (firstRed > firstYellow) && (firstRed > firstPurple):
            ~ firstCharacterPossibleStates += RagazzaOrchestra
                ->->
                
        - (firstGreen > firstBlue) && (firstGreen > firstRed) && (firstGreen > firstYellow) && (firstGreen > firstPurple):
            ~ firstCharacterPossibleStates += FlautoDolce    
                ->->
                
        - (firstYellow > firstGreen) && (firstYellow > firstRed) && (firstYellow > firstBlue) && (firstYellow > firstPurple):
            ~ firstCharacterPossibleStates += Ocarina   
                ->->
                
        - (firstPurple > firstGreen) && (firstPurple > firstRed) && (firstPurple > firstYellow) && (firstPurple > firstBlue):
            ~ firstCharacterPossibleStates += Violino    
                ->->
                
        - else:
            ~ firstCharacterPossibleStates += Chitarra 
            ->->
                
    }

->->    