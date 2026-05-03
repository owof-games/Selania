                    /* ---------------------------------
                    
                      Gestione timing e valori della storia
                    
                     ----------------------------------*/
 
 //Possibili nomi
    LIST fifthChar_possibleStates= Mostro, Mentore
    VAR fifthChar_ActualName= Mentore
    
//Per mentore, fifthChar_storyStatus sarà la parte di riscrittura, mentorChar_storyStatus tutta la parte di interazione come Mentore
    VAR fifthChar_storyStatus = story_storyNotStarted
    VAR fifthChar_storyEndingPosition = ()
    
//Tracciamento della relazione
    VAR fifthChar_relationshipStatus = 0

    //Utilizzato nella funzione XXX per calcolare la variazione del rapporto dopo la singola scelta.
    VAR fifthChar_RelCalculator = 0
    //Indicator = il valore di Indicator, riproporzionato per l'indicatore della reazione e chiamato in cucina e in riscrittura per i feedback/inchiostro.
    VAR fifthChar_relationshipIndicator = 0
    VAR fifthChar_lastRelationshipIndicator = 0
    //Absolute = il valore totale della relazione, tenuto per tracciamento
    VAR fifthChar_relationshipIndicatorAbsolute = 0
    //Reaction: qui registriamo la reazione che verrà attivata coi sigilli
    VAR fifthChar_relationshipReaction = neutral
 
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
            //Valore ingredienti
        VAR kitchen_fifthCharRecipeNoun = ""
        VAR kitchen_fifthCharRecipeAdjective = ""
        VAR kitchen_fifthCharRecipeComplement = ""
    //Ricetta creata
        VAR kitchen_fifthCharRecipe = ""    
    
//Tracciamento del dono
    VAR fifthChar_giftedObject = ()
    VAR fifthChar_favouritesGifts = (NonTiScordarDiTe, BaccaDellaAddolorata, CantoDelleCompagne)
    VAR fifthChar_goodGifts = (ErbaLiccia, Olobino, BastoneDellOzioso, LanaNotturna)

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
//Questa variabile verifica se abbiamo appena parlato con unx PNG, in modo tale da presentarci in modo diverso le possibili proposte che possiamo farle.
    VAR fifthChar_justTalked = false    
    
//Variabile per il countdown per la sua uscita di scena
    VAR fifthChar_exitCounter = 0    

//Variabile per il tempo di attesa tra una lettera e l'altra
    VAR fifthChar_mailPause = 0
    VAR fifthChar_mailPauseDuration = 5    
    
//Calcolo utilizzo sigilli su png
    VAR fifthChar_usedSigil = 0
    VAR fifthChar_usedSigilsTracking = () 

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
=== fifth_char_closing_letters
    ~ fifthChar_mailPause = fifthChar_mailPauseDuration
    ~ letters_doggoPause = false
    
    //Aggiornamento storylets
    -> grimoire_storylets_updater ->

->->


 === fifthNaming ===

->->



//Formula per la chiusura di uno storylet
=== fifth_char_closing_storylet
        //Gestione crescita piante
        -> growing_check ->
        //Questo evita che venga proposto un altro storylet fino a quando la pausa non è finita
        ~ fifthChar_pauseTalking = fourthChar_pauseDuration
        //Questo è per la gestione delle domande
        ~ fifthChar_justTalked = true
        //L'animazione per via dell'informazione nuova
        @animation:RewriterBook

->->