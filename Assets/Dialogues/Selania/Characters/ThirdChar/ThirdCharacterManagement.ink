                    /* ---------------------------------
                    
                      Gestione timing e valori della storia
                    
                     ----------------------------------*/

//Possibili nomi
    LIST thirdChar_possibleStates = SpettroDelVuoto, Arrabbiato, Guarente, Terrorizzato, Abbandonato, Socievole, Consapevole
    VAR thirdChar_ActualName = SpettroDelVuoto
    
    VAR thirdChar_storyStatus = story_storyNotStarted
    VAR thirdChar_storyEndingPosition = ()
  
//Tracciamento della relazione
    VAR thirdChar_relationshipStatus = 0  
  

//Tracciamento cucina
    //Autonoma
        VAR kitchen_thirdCharisCooking = false
        VAR kitchen_thirdCharCookingTime = 0
        //Tempo che ci impiega a fare la sua ricetta
        VAR kitchen_thirdCharCookingMaxTime = 8
    //Nostro invito
        VAR kitchen_thirdCharCookingTogetherInvite = false
    //Valore quarto ingrediente
        VAR kitchen_thirdCharExtraIngredient = ()
        VAR kitchen_thirdCharExtraIngredientReaction = notReaction
    //Ricetta creata
        VAR kitchen_thirdCharRecipe = ""    

//Tracciamento apprezzamento doni/ingredienti. Tutto ciò che è fuori da questa lista = reazione neutrale/disgustata.
    VAR thirdChar_favouritesGifts = ()
    VAR thirdChar_goodGifts = ()

   
//Tracciamento del dono
    VAR thirdChar_giftedObject = ()
    
//Tengo conto delle interazioni avute per aprire la possibilità di avviare la riscrittura
    VAR thirdChar_storyletsForRewritingCount = 0
//Quantità di storylets letti dalla giocatrice prima di accedere alla riscrittura
    VAR thirdChar_minStoryletsForRewriting = 7    
    VAR thirdChar_specialEvent = false
    
//Variabili per mettere in pausa la conversazione
    VAR thirdChar_pauseTalking = 0
    VAR thirdChar_pauseDuration = 1
    //Questa variabile verifica se abbiamo appena parlato con unx PNG, in modo tale da presentarci in modo diverso le possibili proposte che possiamo farle.
    VAR thirdChar_justTalked = false
    
//Variabile per il countdown per la sua uscita di scena
    VAR thirdChar_exitCounter = 0
    VAR thirdChar_startingValueExitCounter = 4  

//Variabile per il tempo di attesa tra una lettera e l'altra
    VAR thirdChar_mailPause = 0
    VAR thirdChar_mailPauseDuration = 5
    
//Moltiplicatore del colore per il personaggio
    VAR thirdChar_colorVariation = 3.0    
    
//UP: ???
//DOWN: ???
    VAR thirdChar_aether = 0.00
    VAR thirdChar_earth = 0.00
    VAR thirdChar_air = 0.00
    VAR thirdChar_water = 0.00
    VAR thirdChar_fire = 0.00                   
                     
                    /* ---------------------------------
                    
                       Gestione relazione e nomi
                    
                     ----------------------------------*/
 
 
=== thirdAffinityCalc ===

->->

=== thirdNaming ===

->->
