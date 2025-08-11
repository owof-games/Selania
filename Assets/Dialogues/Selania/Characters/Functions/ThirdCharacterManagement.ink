                    /* ---------------------------------
                    
                      Gestione timing e valori della storia
                    
                     ----------------------------------*/

//Possibili nomi
    LIST thirdCharacterPossibleStates = SpettroDelVuoto, Arrabbiato, Guarente, Terrorizzato, Abbandonato, Socievole, Consapevole
    VAR thirdCharacterState = SpettroDelVuoto
    
    VAR thirdStory = NotStarted
    
//Tracciamento del dono
    VAR thirdGift = ()   
    
//Tengo conto delle interazioni avute per aprire la possibilità di dare un dono
    VAR thirdStoryQuestCount = 0
    VAR thirdCharacterSpecialEvent = false
    
//Variabili per mettere in pausa la conversazione
    VAR thirdPauseTalking = 0
    VAR thirdCharPauseDuration = 4
    
//Variabile per il countdown per la sua uscita di scena
    VAR thirdCharEndingDialogue = 0    

//Variabile per il tempo di attesa tra una lettera e l'altra
    VAR thirdWritingPause = 0
    VAR thirdWritingPauseDuration = 5
    
//UP: ???
//DOWN: ???
    VAR thirdPurple = 0
    VAR thirdYellow = 0
    VAR thirdBlue = 0
    VAR thirdGreen = 0
    VAR thirdRed = 0                       
                     
                    /* ---------------------------------
                    
                       Gestione relazione e nomi
                    
                     ----------------------------------*/
 
 
=== thirdAffinityCalc ===

->->

=== thirdNaming ===

->->
