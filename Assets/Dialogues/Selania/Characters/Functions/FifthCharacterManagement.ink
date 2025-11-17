                    /* ---------------------------------
                    
                      Gestione timing e valori della storia
                    
                     ----------------------------------*/
 
 //Possibili nomi
    LIST fifthChar_possibleStates= Mentore, NuovoStatoUnoCinque, NuovoStatoDueCinque, NuovoStatoTreCinque
    VAR fifthChar_ActualName= Mentore
    
    //Per mentore, fifthChar_storyStatus sarà la parte di riscrittura, mentorChar_storyStatus tutta la parte di interazione come Mentore
    VAR mentorChar_storyStatus = story_storyNotStarted
    VAR fifthChar_storyStatus = story_storyNotStarted
    VAR fifthChar_storyEndingPosition = ()
    
//Tracciamento della relazione
    VAR fifthChar_relationshipStatus = 0 
 
    
//Tracciamento del dono
    VAR fifthChar_giftedObject = ()

    
//Tengo conto delle interazioni avute per aprire la possibilità di dare un dono
    VAR fifthStoryQuestCount = 0
    VAR fifthCharacterSpecialEvent = false
    
    //Questa variabile mi serve solo per evitare che Mentore mi dia subito lo storylet questions dopo gifts_and_inks
    VAR tutorialPauses = false
    

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
                     
                     
//VARIABILI NARRATIVI
VAR riccioMentoreViciniColpo = false
VAR riccioMentoreViciniInnaffiatoio = false
                     
                    /* ---------------------------------
                    
                       Gestione relazione e nomi
                    
                     ----------------------------------*/
 === fifthNaming ===

->->