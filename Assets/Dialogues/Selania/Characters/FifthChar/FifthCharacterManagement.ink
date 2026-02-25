                    /* ---------------------------------
                    
                      Gestione timing e valori della storia
                    
                     ----------------------------------*/
 
 //Possibili nomi
    LIST fifthChar_possibleStates= Uno, Due, Tre
    VAR fifthChar_ActualName= Uno
    
//Per mentore, fifthChar_storyStatus sarà la parte di riscrittura, mentorChar_storyStatus tutta la parte di interazione come Mentore
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
    //Ricetta creata
        VAR kitchen_fifthCharRecipe = ""    
    
//Tracciamento del dono
    VAR fifthChar_giftedObject = ()

//Tracciamento apprezzamento glifi. Tutto ciò che è fuori da questa lista = reazione neutrale.
    VAR fifthChar_positiveGlyphs = ()
    VAR fifthChar_negativeGlyphs = ()
    
//Tengo conto delle interazioni avute per aprire la possibilità di dare un dono
    VAR fifthChar_storyletsForRewritingCount = 0
    VAR fifthChar_minStoryletsForRewriting = 8
    VAR fifthChar_specialEvent = false

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
    VAR fifthChar_aether = 0.00
    VAR fifthChar_earth = 0.00
    VAR fifthChar_air = 0.00
    VAR fifthChar_water = 0.00
    VAR fifthChar_fire = 0.00                    
                     
                     

                     
                    /* ---------------------------------
                    
                       Gestione relazione e nomi
                    
                     ----------------------------------*/
 === fifthNaming ===

->->