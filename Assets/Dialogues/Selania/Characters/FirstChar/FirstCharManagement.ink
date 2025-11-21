                    /* ---------------------------------
                    
                      Gestione timing e valori della storia
                    
                     ----------------------------------*/

//Ordine degli stati: 0, Blue, Rosso, Verde, Giallo, Viola.
    LIST firstChar_possibleStates = Chitarra, Triangolo, RagazzaOrchestra, FlautoDolce, Ocarina, Violino
    VAR firstChar_ActualName = Chitarra
    
    //Stato della storia (non avviata, avviata, conclusa)
    VAR firstChar_storyStatus = story_storyNotStarted
    
    //Ordine di conclusione della riscrittura (prima storia conclusa, seconda storia conclusa)
    VAR firstChar_storyEndingPosition = ()

//Attesa comparsa prima personaggia
    VAR firstChar_delay = 2

//Tracciamento della relazione
    VAR firstChar_relationshipStatus = 0

//Tracciamento cucina
    //Autonoma
        VAR kitchen_firstCharIsCooking = false
        VAR kitchen_firstCharCookingTime = 0
        //Tempo che ci impiega a fare la sua ricetta
        VAR kitchen_firstCharCookingMaxTime = 8
    //Nostro invito
        VAR kitchen_firstCharCookingTogetherInvite = false
    //Valore quarto ingrediente
        VAR kitchen_firstCharExtraIngredient = ()
        VAR kitchen_firstCharExtraIngredientReaction = notReaction

//Tracciamento apprezzamento doni/ingredienti. Tutto ciò che è fuori da questa lista = reazione neutrale/disgustata.
    VAR firstChar_favouritesGifts = (NonTiScordarDiTe, BaccaDellaAddolorata, CantoDelleCompagne)
    VAR firstChar_goodGifts = (ErbaLiccia, Olobino, BastoneDellOzioso, LanaNotturna)
    
    
//Tracciamento del dono
    VAR firstChar_giftedObject = ()


//Tengo conto delle interazioni avute per aprire la possibilità di avviare la riscrittura
    VAR firstChar_storyletsForRewritingCount = 0
//Quantità di storylets letti dalla giocatrice prima di accedere alla riscrittura
    VAR firstChar_minStoryletsForRewriting = 7    
    VAR firstChar_specialEvent = false
    
//Variabili per mettere in pausa la conversazione
    VAR firstChar_pauseTalking = 0
    VAR firstChar_pauseDuration = 1
    //Questa variabile verifica se abbiamo appena parlato con unx PNG, in modo tale da presentarci in modo diverso le possibili proposte che possiamo farle.
    VAR firstChar_justTalked = false
    
//Variabile per il countdown per la sua uscita di scena
    VAR firstChar_exitCounter = 0
    VAR firstChar_startingValueExitCounter = 4
    
//Variabile per il tempo di attesa tra una lettera e l'altra
    VAR firstChar_mailPause = 0
    VAR firstChar_mailPauseDuration = 5
    
//Moltiplicatore del colore per il personaggio
    VAR firstChar_colorVariation = 3.0    
    
//STATI UP: Viola e Giallo.
//STATI DOWN: Blu.
    VAR firstChar_purple = 0.00
    VAR firstChar_yellow = 0.00
    VAR firstChar_blue = 0.00
    VAR firstChar_green = 0.00
    VAR firstChar_red = 0.00





                    /* ---------------------------------
                    
                       Gestione relazione e nomi
                    
                     ----------------------------------*/

=== firstAffinityCalc ===
//Questo mi serve per aggiornare il valore di affinità.
//Ad ora è chiamata solo in cucina e prima della riscrittura, e solo in riscrittura stampa una informazione.
//Per la prima personaggia l'importante è che il blu sia bassissimo

    //In questa prima fase di testing, punterò su una soluzione di difficoltà media: basta che o giallo o viola siano maggiori del blu.
    {
        - firstChar_purple or firstChar_yellow > firstChar_blue:
            ~ firstChar_relationshipStatus ++
            {debug: aumento l'inchiostro della prima personaggia di un livello. Ora è a {~ firstChar_relationshipStatus}}  
    }
    
    {
    
            //Se vengo dalla preriscrittura:
            - rewriting_proposal_first_character.rewriting:
                {debug: ho cliccato rewriting e quindi faccio gli ultimi passaggi e attivo il feedback.} 
                //"Trasformo" la relazione in inchiostro
                    ~ fromRelationshipToInk(firstChar_relationshipStatus)
                // Mando ai feedback
                    -> firstAffinityFeedback ->
                
                //Arriva il commento della strega
                    ~ inkLevel(firstChar_InkLevel)
                
                //Salvo il massimo di inchiostro raggiunto con la personaggia
                    ~ maxInkLevelUpdater(firstChar_InkLevel)    
                        ->-> 
            
            // altrimenti, mando avanti
            - else:
                ->->    
    
    }
    

    
    //La soluzione più tosta potrebbe essere questa invece.
    
    //{
    //    - firstChar_purple && firstChar_yellow > firstChar_blue:
    //        ~ firstChar_relationshipStatus ++
    //            ->->
    //}

            ->->
    




=== firstAffinityFeedback
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
{debug: passo per firstAffinityFeedback. Lo stato di inchiostro è {firstChar_InkLevel}.}

    Prima di cominciare, ci tengo a dirti cosa penso del rapporto tra di noi.
        {
            -   are_two_entities_together(Mentor, PG):Sicuro è il caso che vi lasci il vostro spazio.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                    ~ change_entity_place(Mentor)
        }
        {
            -   are_two_entities_together(SecondCharacter, PG):Nanetto, ci lasceresti un po' da sole?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                    ~ change_entity_place(SecondCharacter)
        }  
    
        {
            - firstChar_InkLevel == ink_empty:  Non è che possa dirmi di esser capita da te, sai?
            #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
            
            
            - firstChar_InkLevel == ink_low: Non è che ci capiamo molto noi due, sai? È come se io suonassi Chopin e tu la lambada. Una lambada noiosa. Una lamboring.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
            
            - firstChar_InkLevel == ink_normal: Siamo un po' in modalità random, vero? A volte ci avviciniamo, a volte ciaone proprio, tutta una musica diversa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            
            
            - firstChar_InkLevel == ink_medium: Non pensavo avrei trovato una persona amica, qui. Grazie, {player_name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
            
            
            - firstChar_InkLevel == ink_high: Talco continua a mancarmi, ma con te mi sento come se fossimo parte da sempre della stessa band.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
        }


->->


//Settaggio nome quando partiamo con la discussione (non finale quindi)

=== firstNaming ===
{debug: passo per firstNaming.}
{debug: prima di operare,il valore del nome è: {firstChar_ActualName}.}
 //Svuoto il valore per sicurezza
 ~ firstChar_ActualName = ()
 {debug: svuoto firstChar_ActualName : {firstChar_ActualName}.}
 
    {
        //Blu colore più usato
        - (firstChar_blue > firstChar_green) && (firstChar_blue > firstChar_red) && (firstChar_blue > firstChar_yellow) && (firstChar_blue > firstChar_purple):
            ~ firstChar_ActualName += Triangolo
            {debug: passo per Triangolo e il nome è : {firstChar_ActualName}.}
                ->->
        //Rosso colore più usato        
        - (firstChar_red > firstChar_green) && (firstChar_red > firstChar_blue) && (firstChar_red > firstChar_yellow) && (firstChar_red > firstChar_purple):
            ~ firstChar_ActualName += RagazzaOrchestra
            {debug: passo per Orchestra e il nome è : {firstChar_ActualName}.}
                ->->
        
        //Verde colore più usato        
        - (firstChar_green > firstChar_blue) && (firstChar_green > firstChar_red) && (firstChar_green > firstChar_yellow) && (firstChar_green > firstChar_purple):
            ~ firstChar_ActualName += FlautoDolce
            {debug: passo per FlautoDolce e il nome è : {firstChar_ActualName}.}
                ->->
        
        //Giallo colore più usato        
        - (firstChar_yellow > firstChar_green) && (firstChar_yellow > firstChar_red) && (firstChar_yellow > firstChar_blue) && (firstChar_yellow > firstChar_purple):
            ~ firstChar_ActualName += Ocarina
            {debug: passo per Ocarina e il nome è : {firstChar_ActualName}.}
                ->->
        
        //Viola colore più usato        
        - (firstChar_purple > firstChar_green) && (firstChar_purple > firstChar_red) && (firstChar_purple > firstChar_yellow) && (firstChar_purple > firstChar_blue):
        {debug: passo per Violino e il nome è : {firstChar_ActualName}.}
            ~ firstChar_ActualName += Violino    
                ->->
                
        - else:
            {
                - (firstChar_purple < firstChar_blue) && (firstChar_yellow < firstChar_blue):
                        ~ firstChar_ActualName += Triangolo
                        {debug: passo per Triangolo e il nome è : {firstChar_ActualName}.}
                        ->->
                - firstChar_purple && firstChar_yellow > firstChar_blue:
                        ~ firstChar_ActualName += Ocarina   
                            {debug: passo per Ocarina e il nome è : {firstChar_ActualName}.}
                        ->->
                - (firstChar_yellow > firstChar_blue) && (not firstChar_purple > firstChar_blue):
                        ~ firstChar_ActualName += RagazzaOrchestra
                        {debug: passo per Orchestra e il nome è : {firstChar_ActualName}.}
                            ->->
                - (firstChar_purple > firstChar_blue) && (not firstChar_yellow > firstChar_blue):
                    {debug: passo per FlautoDolce e il nome è : {firstChar_ActualName}.}
                        ~ firstChar_ActualName += FlautoDolce 
                            ->->
                - else:
                        ~ firstChar_ActualName += RagazzaOrchestra
                            {debug: passo per Orchestra e il nome è : {firstChar_ActualName}.}
                            ->->
            }
        }
        ->->
        
//Formula per la chiusura di uno storylet
=== first_char_closing_storylet
        //Questo evita che venga proposto un altro storylet fino a quando la pausa non è finita
        ~ firstChar_pauseTalking = firstChar_pauseDuration
        //Questo è per la gestione delle domande
        ~ firstChar_justTalked = true
        //L'animazione per via dell'informazione nuova
        @animation:RewriterBook

->->
