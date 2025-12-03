                    /* ---------------------------------
                    
                      Gestione timing e valori della storia
                    
                     ----------------------------------*/

//Possibili stati Chitarra
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
        //l'abbiamo invitata
        VAR kitchen_firstCharCookingTogetherInvite = false
        //Quante volte l'abbiamo invitata
        VAR kitchen_firstCharCookingTogetherNumberInvite = 0
        //Da quanto ci sta aspettando
        VAR kitchen_firstCharCookingTogetherWaiting = 0
        //Quanta pazienza ha ad aspettarci
        VAR kitchen_firstCharCookingMAXTogetherWaiting = 8
        
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
    VAR firstChar_minStoryletsForRewriting = 9    
    VAR firstChar_specialEvent = false
    
//Variabili per mettere in pausa la conversazione
    VAR firstChar_pauseTalking = 0
    VAR firstChar_pauseDuration = 1
    //Questa variabile verifica se abbiamo appena parlato con unx PNG, in modo tale da presentarci in modo diverso le possibili proposte che possiamo farle.
    VAR firstChar_justTalked = false
    
//Variabile per il countdown per la sua uscita di scena
    VAR firstChar_exitCounter = 0
    VAR firstChar_startingValueExitCounter = 6
    
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
        - firstChar_purple or firstChar_green > firstChar_blue:
            ~ firstChar_relationshipStatus ++
            {debug: aumento l'inchiostro della prima personaggia di un livello. Ora è a {~ firstChar_relationshipStatus}}
    }
    
    {
    
            //Se vengo dalla pre riscrittura:
            - rewriting_proposal_first_character.rewriting:
                {debug: ho cliccato rewriting e quindi faccio gli ultimi passaggi e attivo il feedback.} 
                //"Trasformo" la relazione in inchiostro
                    ~ fromRelationshipToInk(FirstCharacter)
                
                // Mando ai feedback
                    -> firstAffinityFeedback ->
                
                //Arriva il commento della strega
                    ~ inkLevel(FirstCharacter)
                
                //Salvo il massimo di inchiostro raggiunto con la personaggia
                    ~ maxInkLevelUpdater(FirstCharacter)    
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

    Prima però ci terrei a dirti come sono andate le cose tra noi, qui.
            
        {
            -   are_two_entities_together(Mentor, PG):
                Vi lascio un po' di privacy. In bocca al lupo {player_name} e {charNameOne}.#speaker:{mentor_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
                    ~ change_entity_place(Mentor)
        }
        {
            -   are_two_entities_together(SecondCharacter, PG):
                {charNameTwo}, potresti lasciarci un po' da sol3?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                Certissimamente! A dopo!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                    ~ change_entity_place(SecondCharacter)
        }
        
        {
            - firstChar_InkLevel == ink_empty:
                Come direbbe la mia vecchia insegnate di piano: apprezzo lo sforzo, manca il risultato.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                Ci sono stati momenti carini, ma ammetto che per lo più non mi sono sentita molto capita da te.
                Scusa.

            - firstChar_InkLevel == ink_low:
                E, insomma.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                Non è che ci capiamo molto noi due, sai?
                È come se io suonassi Chopin e tu la lambada.
                E la lambada è carina, ma non è roba mia.
                Ha senso? 
            
            - firstChar_InkLevel == ink_normal:
                Ci sono stati beni momenti tra noi, sai?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                Ma anche momenti no, in cui non mi sono sentita capita.
                Non è un reato.
                Ma, insomma, non riesco a fidarmi fino in fondo.
                Scusa.
            
            
            - firstChar_InkLevel == ink_medium:
                E {player_name}: non pensavo avrei trovato una persona amica, qui.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                Mi hai reso l'assenza di Talco, di Ennio, di Valeria moooolto più sopportabile.
                Grazie.
            
            
            - firstChar_InkLevel == ink_high:
                E mi chiedevo: ma che ci hanno separat3 alla nascita?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                Perché mi sento tipo come se avessimo un unico neurone.
                Unit3 in tutto.
                Ed è figa come cosa.
                Talco continua a mancarmi, ma con te mi sento come se fossimo parte da sempre della stessa band.
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
            ~ firstChar_ActualName += Violino
            {debug: passo per Violino e il nome è : {firstChar_ActualName}.}
                ->->
        
        //Giallo colore più usato        
        - (firstChar_yellow > firstChar_green) && (firstChar_yellow > firstChar_red) && (firstChar_yellow > firstChar_blue) && (firstChar_yellow > firstChar_purple):
            ~ firstChar_ActualName += Ocarina
            {debug: passo per Ocarina e il nome è : {firstChar_ActualName}.}
                ->->
        
        //Viola colore più usato        
        - (firstChar_purple > firstChar_green) && (firstChar_purple > firstChar_red) && (firstChar_purple > firstChar_yellow) && (firstChar_purple > firstChar_blue):
        {debug: passo per FlautoDolce e il nome è : {firstChar_ActualName}.}
            ~ firstChar_ActualName += FlautoDolce    
                ->->
                
        - else:
            {
                - (firstChar_purple < firstChar_blue) && (firstChar_green < firstChar_blue):
                        ~ firstChar_ActualName += Triangolo
                        {debug: passo per Triangolo e il nome è : {firstChar_ActualName}.}
                        ->->
                
                - firstChar_purple && firstChar_green > firstChar_blue:
                        ~ firstChar_ActualName += FlautoDolce
                            {debug: passo per FlautoDolce e il nome è : {firstChar_ActualName}.}
                        ->->
                - (firstChar_green > firstChar_blue) && (not firstChar_purple > firstChar_blue):
                        ~ firstChar_ActualName += Violino
                        {debug: passo per Violino e il nome è : {firstChar_ActualName}.}
                            ->->
                - (firstChar_purple > firstChar_blue) && (not firstChar_green > firstChar_blue):
                    {debug: passo per Ocarina e il nome è : {firstChar_ActualName}.}
                        ~ firstChar_ActualName += Ocarina 
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
