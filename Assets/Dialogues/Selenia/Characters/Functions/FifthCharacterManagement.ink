                    /* ---------------------------------
                    
                      Gestione timing e valori della storia
                    
                     ----------------------------------*/
 
 //Possibili nomi
    LIST fifthCharacterPossibleStates= Mentore, NuovoStatoUnoCinque, NuovoStatoDueCinque, NuovoStatoTreCinque
    VAR fifthCharacterState= Mentore
    
    VAR fifthStory = NotStarted

//Tengo conto delle interazioni avute per aprire la possibilità di dare un dono
    VAR fifthStoryQuestCount = 0
    VAR fifthCharacterSpecialEvent = false
    

//Variabili per mettere in pausa la conversazione. Plausibilmente per mentore sarà molto alta all'inizio.
    VAR fifthPauseTalking = 0
    VAR fifthCharPauseDuration = 10
    
//Variabile per il countdown per la sua uscita di scena
    VAR fifthCharEndingDialogue = 0    

//Variabile per il tempo di attesa tra una lettera e l'altra
    VAR fifthWritingPause = 0
    VAR fifthWritingPauseDuration = 5    
    
//STATI UP: ???
//STATI DOWN: ???
    VAR fifthPurple = 0
    VAR fifthYellow = 0
    VAR fifthBlue = 0
    VAR fifthGreen = 0
    VAR fifthRed = 0                    
                     
                    /* ---------------------------------
                    
                       Gestione relazione e nomi
                    
                     ----------------------------------*/
 === fifthNaming ===

->->