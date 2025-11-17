                    /* ---------------------------------
                    
                      Gestione timing e valori della storia
                    
                     ----------------------------------*/

//Possibili nomi
    LIST fourthChar_possibleStates = Mondatrice, NuovoStatoUnoQuattro, NuovoStatoDueQuattro, NuovoStatoTreQuattro
    VAR fourthChar_ActualName = Mondatrice
    
    
    VAR fourthChar_storyStatus = story_storyNotStarted
    VAR fourthChar_storyEndingPosition = ()
    
//Attesa comparsa quarta personaggia
    VAR fourthChar_delay = 4    

//Tracciamento della relazione
    VAR fourthChar_relationshipStatus = 0
   
//Tracciamento cucina
    //Autonoma
        VAR kitchen_fourthCharisCooking = false
        VAR kitchen_fourthCharCookingTime = 0
        //Tempo che ci impiega a fare la sua ricetta
        VAR kitchen_fourthCharCookingMaxTime = 8
    //Nostro invito
        VAR kitchen_fourthCharCookingTogetherInvite = false
    //Valore quarto ingrediente
        VAR kitchen_fourthCharExtraIngredient = ()
        VAR kitchen_fourthCharExtraIngredientReaction = notReaction

//Tracciamento apprezzamento doni/ingredienti. Tutto ciò che è fuori da questa lista = reazione neutrale/disgustata.
    VAR fourthChar_favouritesGifts = ()
    VAR fourthChar_goodGifts = ()
   
//Tracciamento del dono
    VAR fourthChar_giftedObject = ()
    
    
//Tengo conto delle interazioni avute per aprire la possibilità di avviare la riscrittura
    VAR fourthChar_storyletsForRewritingCount = 0
//Quantità di storylets letti dalla giocatrice prima di accedere alla riscrittura
    VAR fourthChar_minStoryletsForRewriting = 7    
    VAR fourthChar_specialEvent = false
    
//Variabili per mettere in pausa la conversazione
    VAR fourthChar_pauseTalking = 0
    VAR fourthChar_pauseDuration = 1
    //Questa variabile verifica se abbiamo appena parlato con unx PNG, in modo tale da presentarci in modo diverso le possibili proposte che possiamo farle.
    VAR fourthChar_justTalked = false
    
//Variabile per il countdown per la sua uscita di scena
    VAR fourthChar_exitCounter = 0
    VAR fourthChar_startingValueExitCounter = 4    

//Variabile per il tempo di attesa tra una lettera e l'altra
    VAR fourthChar_mailPause = 0
    VAR fourthChar_mailPauseDuration = 5
    
//Moltiplicatore del colore per il personaggio
    VAR fourthChar_colorVariation = 3.0    
    
//UP: ???
//DOWN: ???
    VAR fourthChar_purple = 0
    VAR fourthChar_yellow = 0
    VAR fourthChar_blue = 0
    VAR fourthChar_green = 0
    VAR fourthChar_red = 0  
                    /* ---------------------------------
                    
                       Gestione relazione e nomi
                    
                     ----------------------------------*/
=== fourthAffinityCalc ===
//Per la prima personaggia l'importante è che il blu sia bassissimo

    {
        - fourthChar_purple && fourthChar_yellow > fourthChar_blue:
            ~ fourthChar_InkLevel ++
            ~ fourthChar_InkLevel ++
                ->->
        - fourthChar_purple or fourthChar_yellow > fourthChar_blue:
            ~ fourthChar_InkLevel ++
                ->->
    }

->->
    
    
//Settaggio nome quando partiamo con la discussione
=== fourthNaming ===
    {
        - (fourthChar_blue > fourthChar_green) && (fourthChar_blue > fourthChar_red) && (fourthChar_blue > fourthChar_yellow) && (fourthChar_blue > fourthChar_purple):
            ~ fourthChar_possibleStates += Triangolo
                ->->
                
        - (fourthChar_red > fourthChar_green) && (fourthChar_red > fourthChar_blue) && (fourthChar_red > fourthChar_yellow) && (fourthChar_red > fourthChar_purple):
            ~ fourthChar_possibleStates += RagazzaOrchestra
                ->->
                
        - (fourthChar_green > fourthChar_blue) && (fourthChar_green > fourthChar_red) && (fourthChar_green > fourthChar_yellow) && (fourthChar_green > fourthChar_purple):
            ~ fourthChar_possibleStates += FlautoDolce    
                ->->
                
        - (fourthChar_yellow > fourthChar_green) && (fourthChar_yellow > fourthChar_red) && (fourthChar_yellow > fourthChar_blue) && (fourthChar_yellow > fourthChar_purple):
            ~ fourthChar_possibleStates += Ocarina   
                ->->
                
        - (fourthChar_purple > fourthChar_green) && (fourthChar_purple > fourthChar_red) && (fourthChar_purple > fourthChar_yellow) && (fourthChar_purple > fourthChar_blue):
            ~ fourthChar_possibleStates += Violino    
                ->->
                
        - else:
            ~ fourthChar_possibleStates += Chitarra 
            ->->
                
    }

->->   