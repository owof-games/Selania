                    /* ---------------------------------
                    
                      Gestione timing e valori della storia
                    
                     ----------------------------------*/

//Possibili nomi
    LIST fourthChar_possibleStates = NonnaMolotov
    VAR fourthChar_ActualName = NonnaMolotov
    
    
    VAR fourthChar_storyStatus = story_storyNotStarted
    VAR fourthChar_storyEndingPosition = ()
    
//Attesa comparsa quarta personaggia
    VAR fourthChar_delay = 4    

//Tracciamento della relazione
    VAR fourthChar_relationshipStatus = 0

    //Utilizzato nella funzione XXX per calcolare la variazione del rapporto dopo la singola scelta.
    VAR fourthChar_RelCalculator = 0
    //Indicator = il valore di Indicator, riproporzionato per l'indicatore della reazione e chiamato in cucina e in riscrittura per i feedback/inchiostro.
    VAR fourthChar_relationshipIndicator = 0
    //Absolute = il valore totale della relazione, tenuto per tracciamento
    VAR fourthChar_relationshipIndicatorAbsolute = 0
    //Reaction: qui registriamo la reazione che verrà attivata coi sigilli
    VAR fourthChar_relationshipReaction = neutral

//Tracciamento cucina
    //Autonoma
        VAR kitchen_fourthCharisCooking = false
        VAR kitchen_fourthCharCookingTime = 0
        //Tempo che ci impiega a fare la sua ricetta
        VAR kitchen_fourthCharCookingMaxTime = 8
    //Nostro invito
        VAR kitchen_fourthCharCookingTogetherInvite = false
    //Valore quarto ingrediente
        VAR kitchen_fourthCharRecipeNoun = ""
        VAR kitchen_fourthCharRecipeAdjective = ""
        VAR kitchen_fourthCharRecipeComplement = ""
        VAR kitchen_fourthCharExtraIngredient = ()
        VAR kitchen_fourthCharExtraIngredientReaction = notReaction
    //Ricetta creata
        VAR kitchen_fourthCharRecipe = ""    

//Tracciamento apprezzamento doni/ingredienti. Tutto ciò che è fuori da questa lista = reazione neutrale/disgustata.
    VAR fourthChar_favouritesGifts = ()
    VAR fourthChar_goodGifts = ()
   
//Tracciamento del dono
    VAR fourthChar_giftedObject = ()

//Tracciamento apprezzamento glifi. Tutto ciò che è fuori da questa lista = reazione neutrale.
    VAR fourthChar_positiveGlyphs = ()
    VAR fourthChar_negativeGlyphs = ()    
    
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
    VAR fourthChar_glyphVariation = 3.0    
//Calcolo utilizzo sigilli su png
    VAR fourthChar_usedSigil = 0  
    VAR fourthChar_usedSigilsTracking = () 

//UP: ???
//DOWN: ???
    VAR fourthChar_aether = 0.00
    VAR fourthChar_earth = 0.00
    VAR fourthChar_air = 0.00
    VAR fourthChar_water = 0.00
    VAR fourthChar_fire = 0.00
                    /* ---------------------------------
                    
                       Gestione relazione e nomi
                    
                     ----------------------------------*/

=== fourth_char_closing_letters
    ~ fourthChar_mailPause = fourthChar_mailPauseDuration
    ~ letters_doggoPause = false
    
    //Aggiornamento storylets
    -> grimoire_storylets_updater ->

->->


=== fourthAffinityCalc ===
//Per la prima personaggia l'importante è che il blu sia bassissimo

    {
        - fourthChar_aether && fourthChar_earth > fourthChar_air:
            ~ fourthChar_InkLevel ++
            ~ fourthChar_InkLevel ++
                ->->
        - fourthChar_aether or fourthChar_earth > fourthChar_air:
            ~ fourthChar_InkLevel ++
                ->->
    }

->->
    
    
//Settaggio nome quando partiamo con la discussione
=== fourthNaming ===
    {
        - (fourthChar_air > fourthChar_water) && (fourthChar_air > fourthChar_fire) && (fourthChar_air > fourthChar_earth) && (fourthChar_air > fourthChar_aether):
            ~ fourthChar_possibleStates += Triangolo
                ->->
                
        - (fourthChar_fire > fourthChar_water) && (fourthChar_fire > fourthChar_air) && (fourthChar_fire > fourthChar_earth) && (fourthChar_fire > fourthChar_aether):
            ~ fourthChar_possibleStates += RagazzaOrchestra
                ->->
                
        - (fourthChar_water > fourthChar_air) && (fourthChar_water > fourthChar_fire) && (fourthChar_water > fourthChar_earth) && (fourthChar_water > fourthChar_aether):
            ~ fourthChar_possibleStates += FlautoDolce    
                ->->
                
        - (fourthChar_earth > fourthChar_water) && (fourthChar_earth > fourthChar_fire) && (fourthChar_earth > fourthChar_air) && (fourthChar_earth > fourthChar_aether):
            ~ fourthChar_possibleStates += Ocarina   
                ->->
                
        - (fourthChar_aether > fourthChar_water) && (fourthChar_aether > fourthChar_fire) && (fourthChar_aether > fourthChar_earth) && (fourthChar_aether > fourthChar_air):
            ~ fourthChar_possibleStates += Violino    
                ->->
                
        - else:
            ~ fourthChar_possibleStates += Chitarra 
            ->->
                
    }

->-> 


//Formula per la chiusura di uno storylet
=== fourth_char_closing_storylet
        //Gestione crescita piante
        -> growing_check ->
        //Questo evita che venga proposto un altro storylet fino a quando la pausa non è finita
        ~ fourthChar_pauseTalking = fourthChar_pauseDuration
        //Questo è per la gestione delle domande
        ~ fourthChar_justTalked = true
        //L'animazione per via dell'informazione nuova
        @animation:RewriterBook

->->