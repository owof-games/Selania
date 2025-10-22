                    /* ---------------------------------
                    
                      Gestione timing e valori della storia
                    
                     ----------------------------------*/

//Ordine degli stati: 0, Blue, Rosso, Verde, Giallo, Viola.
    LIST firstCharacterPossibleStates = Chitarra, Triangolo, RagazzaOrchestra, FlautoDolce, Ocarina, Violino
    VAR firstCharacterState = Chitarra
    
    VAR minStoryQuesTCountFirstChar = 7
    
    
    VAR firstStory = StoryNotStarted
    VAR charOneEnding = ()


//Tracciamento cucina
    //Autonoma
        VAR firstIsCooking = false
        VAR firstCookingTime = 0
        //Tempo che ci impiega a fare la sua ricetta
        VAR firstCookingMaxTime = 8
    //Nostro invito
        VAR FirstKitchenInvite = false
    

//Tracciamento del dono
    VAR firstGift = ()

//Tengo conto delle interazioni avute per aprire la possibilità di dare un dono
    VAR firstStoryQuestCount = 0
    VAR firstCharacterSpecialEvent = false
    
//Variabili per mettere in pausa la conversazione
    VAR firstPauseTalking = 0
    VAR firstCharPauseDuration = 1
    VAR justTalkedFirstChar = false
    
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
    
    
//Settaggio nome quando partiamo con la discussione (non finale quindi)
=== firstNaming ===
//Se ho un pareggio quindi c'è differenza se blu batte sia giallo che viola (Triangolo)
//Se batte solo giallo (Orchestra)
//Se batte solo viola (FlautoDolce)
//Se blu non batte nessuno dei due (Ocarina)
//((Queste tre ultime scelte son create con la logica di dire che è sempre meno grave se il blu si avvicina a una delle soluzioni più adatte a Chitarra)
//Lascio un "else" nel caso in cui tutti e tre i colori fossero pari, e quindi è nella media.

    {
        //Blu colore più usato
        - (firstBlue > firstGreen) && (firstBlue > firstRed) && (firstBlue > firstYellow) && (firstBlue > firstPurple):
            ~ firstCharacterPossibleStates += Triangolo
                ->->
        //Rosso colore più usato        
        - (firstRed > firstGreen) && (firstRed > firstBlue) && (firstRed > firstYellow) && (firstRed > firstPurple):
            ~ firstCharacterPossibleStates += RagazzaOrchestra
                ->->
        
        //Verde colore più usato        
        - (firstGreen > firstBlue) && (firstGreen > firstRed) && (firstGreen > firstYellow) && (firstGreen > firstPurple):
            ~ firstCharacterPossibleStates += FlautoDolce    
                ->->
        
        //Giallo colore più usato        
        - (firstYellow > firstGreen) && (firstYellow > firstRed) && (firstYellow > firstBlue) && (firstYellow > firstPurple):
            ~ firstCharacterPossibleStates += Ocarina   
                ->->
        
        //Viola colore più usato        
        - (firstPurple > firstGreen) && (firstPurple > firstRed) && (firstPurple > firstYellow) && (firstPurple > firstBlue):
            ~ firstCharacterPossibleStates += Violino    
                ->->
                
        - else:
            {
                - (firstPurple < firstBlue) && (firstYellow < firstBlue):
                        ~ firstCharacterPossibleStates += Triangolo
                        ->->
                - firstPurple && firstYellow > firstBlue:
                        ~ firstCharacterPossibleStates += Ocarina   
                        ->->
                - (firstYellow > firstBlue) && (not firstPurple > firstBlue):
                        ~ firstCharacterPossibleStates += RagazzaOrchestra
                            ->->
                - (firstPurple > firstBlue) && (not firstYellow > firstBlue):
                        ~ firstCharacterPossibleStates += FlautoDolce 
                            ->->
                - else:
                        ~ firstCharacterPossibleStates += RagazzaOrchestra
                            ->->
            }
        }
        ->->    