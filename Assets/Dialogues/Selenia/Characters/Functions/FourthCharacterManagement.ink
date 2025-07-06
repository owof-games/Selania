                    /* ---------------------------------
                    
                      Gestione timing e valori della storia
                    
                     ----------------------------------*/

//Possibili nomi
    LIST fourthCharacterPossibleStates = Mondatrice, NuovoStatoUnoQuattro, NuovoStatoDueQuattro, NuovoStatoTreQuattro
    VAR fourthCharacterState = Mondatrice
    
    
    VAR fourthStory = NotStarted

//Tengo conto delle interazioni avute per aprire la possibilità di dare un dono
    VAR fourthStoryQuestCount = 0
    VAR fourthCharacterSpecialEvent = false
    
//Variabili per mettere in pausa la conversazione
    VAR fourthPauseTalking = 0
    VAR fourthCharPauseDuration = 4
    
//Variabile per il countdown per la sua uscita di scena
    VAR fourthCharEndingDialogue = 0    

//Variabile per il tempo di attesa tra una lettera e l'altra
    VAR fourthWritingPause = 0
    VAR fourthWritingPauseDuration = 5
    
//UP: ???
//DOWN: ???
    VAR fourthPurple = 0
    VAR fourthYellow = 0
    VAR fourthBlue = 0
    VAR fourthGreen = 0
    VAR fourthRed = 0  
                    /* ---------------------------------
                    
                       Gestione relazione e nomi
                    
                     ----------------------------------*/
 === fourthNaming ===

->->