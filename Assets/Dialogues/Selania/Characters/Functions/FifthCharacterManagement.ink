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
 
 //Tracciamento cucina
    //Autonoma
        VAR kitchen_fifthCharIsCooking = false
        VAR kitchen_fifthCharCookingTime = 0
        //Tempo che ci impiega a fare la sua ricetta
        VAR kitchen_fifthCharCookingMaxTime = 8
    //Nostro invito
        VAR kitchen_fifthCharCookingTogetherInvite = false
    //Valore quarto ingrediente
        VAR kitchen_fifthCharExtraIngredient = ()
        VAR kitchen_fifthCharExtraIngredientReaction = notReaction
    
//Tracciamento del dono
    VAR fifthChar_giftedObject = ()

    
//Tengo conto delle interazioni avute per aprire la possibilità di dare un dono
    VAR fifthChar_storyletsForRewritingCount = 0
    VAR fifthChar_specialEvent = false
    
    //Questa variabile mi serve solo per evitare che Mentore mi dia subito lo storylet questions dopo gifts_and_inks
    VAR mentor_tutorialPauses = false
    

//Variabili per mettere in pausa la conversazione. Plausibilmente per mentore sarà molto alta all'inizio.
    VAR fifthChar_pauseTalking = 0
    VAR fifthChar_pauseDuration = 10
    
//Variabile per il countdown per la sua uscita di scena
    VAR fifthChar_exitCounter = 0    

//Variabile per il tempo di attesa tra una lettera e l'altra
    VAR fifthChar_mailPause = 0
    VAR fifthChar_mailPauseDuration = 5    
    
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