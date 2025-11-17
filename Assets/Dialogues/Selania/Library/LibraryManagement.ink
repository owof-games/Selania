//Variabili per la gestione della biblioteca
LIST library_allStories = AdriAllora, Aza, StenoArtico, B, BeatriceYBottura, CeciliaFormicola, Lamia, ValFaustoLattanzio, Romi, Salvo, Maura, Beatrice, LetiziaVaccarella, QueerginiaWolf

//Liste per distinguere storie lette e non
    VAR library_unreadStories = (AdriAllora, Aza, StenoArtico, B, BeatriceYBottura, CeciliaFormicola, Lamia, ValFaustoLattanzio, Romi, Salvo, Maura, Beatrice, LetiziaVaccarella, QueerginiaWolf)
    VAR library_readStories = ()
    VAR library_temporaryTW = ()
    VAR library_temporaryReadTW = ()
    VAR library_temporaryShortTW = ()
    VAR library_temporaryAverageTW = ()
    VAR library_temporaryLongTW = ()
    VAR library_temporaryTransformationTW = ()
    VAR library_temporaryQuestionsTW = ()
    VAR library_temporaryUnpreparedTW = ()
    VAR library_temporaryMonstersTW = ()
    VAR library_temporaryFireTW = ()
    VAR library_temporaryRebellionTW = ()
    
//Raggrupamento per lunghezza
    LIST library_storiesDuration = Short, Average, Long
    VAR library_readingDuration = ()
    
    VAR library_shortStories = (StenoArtico, B, ValFaustoLattanzio, Maura, QueerginiaWolf)
    VAR library_averageStories = (AdriAllora, BeatriceYBottura, CeciliaFormicola, Lamia, Romi)
    VAR library_longStories = (Aza, Beatrice, Salvo, LetiziaVaccarella)
    
//Books about...
    VAR library_aboutTransformation = (Aza, B, ValFaustoLattanzio, Salvo, BeatriceYBottura, LetiziaVaccarella)
    VAR library_aboutQuestions = (AdriAllora, Beatrice, ValFaustoLattanzio, StenoArtico, Romi)
    VAR library_aboutUnprepared = (StenoArtico, Beatrice, Lamia)
    VAR library_aboutMonsters = (AdriAllora, Aza, B, BeatriceYBottura, CeciliaFormicola)
    VAR library_aboutFire= (Aza, CeciliaFormicola, BeatriceYBottura, Romi, Maura, LetiziaVaccarella, QueerginiaWolf)
    VAR library_aboutRebellion = (BeatriceYBottura, Lamia, Maura, Salvo, QueerginiaWolf)

    //Libro che verrà proposto
    VAR library_proposedBook = ()
    

=== book_test_intro ===
La biblioteca freme all'idea di offrirti una storia da leggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        + {library_readStories != ()} [Voglio rileggere qualcosa.]
        La tua libreria contiene {number_translator(library_readStories)} {libro_libri(library_readStories)}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> reread
            
        + {library_unreadStories != ()} [Vorrei una nuova storia casuale.]
            -> storyRandom
            
        + {library_unreadStories != ()}[Voglio scegliere la mia storia.]
            -> storyQuestions
    
        + [Non voglio più leggere.]
            -> DarkLibraryModeOff ->
            -> main

->->


=== storyRandom ===
//Questo è il più facile: recupero un titolo randomico tra i libri non letti.
    ~ library_proposedBook = ()
    ~ library_proposedBook = LIST_RANDOM(library_unreadStories)
    ->from_list_to_books






=== storyQuestions ===
    //Svuoto il valore del libro
    ~ library_proposedBook = ()
    -> step_one

    = step_one
    {player_name} desidera una storia veloce come una pulce o lenta come la notte?#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        + {library_shortStories != ()} [Qualcosa di brevissimo (max 1500 battute).]
        //(1500 battute max)
            ~ library_readingDuration += Short
        
        + {library_averageStories != ()} [Una storia veloce (max 3000 battute).]
        // (3000 battute max)
            ~ library_readingDuration += Average
        
        + {library_longStories != ()} [Un racconto più lungo (max 8000 battute).]
        // 8000 battute max 
            ~ library_readingDuration += Long
        -
        -> shuffle
        
    
    = shuffle
        {shuffle:
            - {library_aboutTransformation != (): -> about_transformation| -> shuffle}
            - {library_aboutQuestions != (): -> about_questions| -> shuffle}
            - {library_aboutUnprepared != (): -> about_unprepared| -> shuffle}
            - {library_aboutMonsters != (): -> about_monsters| -> shuffle}
            - {library_aboutFire != (): -> about_fire| -> shuffle}
            - {library_aboutRebellion != (): -> about_rebellion| -> shuffle}
        }
    
    
    
    = about_transformation
    La biblioteca ti offre una storia...#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        + {library_readingDuration has Short && library_shortStories^ library_aboutTransformation != ()} [Che racconti di qualcosa che si <b>trasforma</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_shortStories^ library_aboutTransformation)
             -> from_list_to_books
 
        + {library_readingDuration has Average && library_averageStories^ library_aboutTransformation != ()} [Che racconti di qualcosa che si <b>trasforma</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_averageStories ^ library_aboutTransformation)
             -> from_list_to_books           
            
        + {library_readingDuration has Long && library_longStories^ library_aboutTransformation != ()} [Che racconti di qualcosa che si <b>trasforma</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_longStories ^ library_aboutTransformation)
            -> from_list_to_books
        
        //Qui vale per ogni scelta: se effettivamente posso scegliere quel tema, posso decidere di andare comunque avanti. Se invece quel tema è vuoto nella intersezione con la lunghezza della storia selezionata, passo avanti.
        //Questo tasto compare solo se questo tema non è vuoto. Ha senso? sennò non sarei qui, no?
        + {(library_readingDuration has Short && library_shortStories^ library_aboutTransformation != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutTransformation != ()) or (library_readingDuration has Long && library_longStories^ library_aboutTransformation != ())} [No, vorrei un altro tema.]
                -> shuffle
        
        + {(library_readingDuration has Short && library_shortStories^ library_aboutTransformation != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutTransformation != ()) or (library_readingDuration has Long && library_longStories^ library_aboutTransformation != ())} [Non ho più voglia di leggere.]
                ~ library_readingDuration = ()
                -> book_test_intro      
        
        + {(library_readingDuration has Short && library_shortStories^ library_aboutTransformation == ()) or (library_readingDuration has Average && library_averageStories^ library_aboutTransformation == ()) or (library_readingDuration has Long && library_longStories^ library_aboutTransformation == ())}
            -> shuffle
        
    = about_questions       
    La biblioteca ti offre una storia...#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + {library_readingDuration has Short && library_shortStories^ library_aboutQuestions != ()} [Che parli di chi <b>si pone domande</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_shortStories^ library_aboutQuestions)
             -> from_list_to_books
        
        + {library_readingDuration has Average && library_averageStories^ library_aboutQuestions != ()} [Che parli di chi <b>si pone domande</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_averageStories ^ library_aboutQuestions)
         -> from_list_to_books

        + {library_readingDuration has Long && library_longStories^ library_aboutQuestions != ()} [Che parli di chi <b>si pone domande</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_longStories ^ library_aboutQuestions)
         -> from_list_to_books            
        
        
        + {(library_readingDuration has Short && library_shortStories^ library_aboutQuestions != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutQuestions != ()) or (library_readingDuration has Long && library_longStories^ library_aboutQuestions != ())}[No, vorrei un altro tema.]
                -> shuffle
                
                
        + {(library_readingDuration has Short && library_shortStories^ library_aboutQuestions != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutQuestions != ()) or (library_readingDuration has Long && library_longStories^ library_aboutQuestions != ())} [Non ho più voglia di leggere.]
                ~ library_readingDuration = ()
                -> book_test_intro           
        
        + {(library_readingDuration has Short && library_shortStories^ library_aboutQuestions == ()) or (library_readingDuration has Average && library_averageStories^ library_aboutQuestions == ()) or (library_readingDuration has Long && library_longStories^ library_aboutQuestions == ())}
                -> shuffle          
            
            
    = about_unprepared
    La biblioteca ti offre una storia...#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + {library_readingDuration has Short && library_shortStories^ library_aboutUnprepared != ()} [Che mi colga<b> {player_pronouns has him:impreparato|{player_pronouns has her:impreparata|impreparatə}}</b>].
            ~ library_proposedBook = LIST_RANDOM(library_shortStories^ library_aboutUnprepared)
         -> from_list_to_books

        + {library_readingDuration has Average && library_averageStories^ library_aboutUnprepared != ()} [Che mi colga<b> {player_pronouns has him:impreparato|{player_pronouns has her:impreparata|impreparatə}}</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_averageStories ^ library_aboutUnprepared)
        -> from_list_to_books
        
        + {library_readingDuration has Long && library_longStories^ library_aboutUnprepared != ()} [Che mi colga<b> {player_pronouns has him:impreparato|{player_pronouns has her:impreparata|impreparatə}}</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_longStories ^ library_aboutUnprepared)
        -> from_list_to_books            
        
        //Scelte di uscita se ho rifiutato tutte le opzioni precedenti.
        + {(library_readingDuration has Short && library_shortStories^ library_aboutUnprepared != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutUnprepared != ()) or (library_readingDuration has Long && library_longStories^ library_aboutUnprepared != ())}[No, vorrei un altro tema.]
                -> shuffle
                
                
        + {(library_readingDuration has Short && library_shortStories^ library_aboutUnprepared != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutUnprepared != ()) or (library_readingDuration has Long && library_longStories^ library_aboutUnprepared != ())} [Non ho più voglia di leggere.]
                ~ library_readingDuration = ()
                -> book_test_intro           
        
        + {(library_readingDuration has Short && library_shortStories^ library_aboutUnprepared == ()) or (library_readingDuration has Average && library_averageStories^ library_aboutUnprepared == ()) or (library_readingDuration has Long && library_longStories^ library_aboutUnprepared == ())}
                -> shuffle 

    = about_monsters
    La biblioteca ti offre una storia...#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + {library_readingDuration has Short && library_shortStories^ library_aboutMonsters != ()} [Che parli di <b>cose mostruose</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_shortStories^ library_aboutMonsters)
        -> from_list_to_books

        + {library_readingDuration has Average && library_averageStories^ library_aboutMonsters != ()} [Che parli di <b>cose mostruose</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_averageStories ^ library_aboutMonsters)
        -> from_list_to_books
        
        + {library_readingDuration has Long && library_longStories^ library_aboutMonsters != ()} [Che parli di <b>cose mostruose</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_longStories ^ library_aboutMonsters)
        -> from_list_to_books            
        
        //Scelte di uscita se ho rifiutato tutte le opzioni precedenti.
        + {(library_readingDuration has Short && library_shortStories^ library_aboutMonsters != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutMonsters != ()) or (library_readingDuration has Long && library_longStories^ library_aboutMonsters != ())}[No, vorrei un altro tema.]
                -> shuffle
                
                
        + {(library_readingDuration has Short && library_shortStories^ library_aboutMonsters != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutMonsters != ()) or (library_readingDuration has Long && library_longStories^ library_aboutMonsters != ())} [Non ho più voglia di leggere.]
                ~ library_readingDuration = ()
                -> book_test_intro           
        
        + {(library_readingDuration has Short && library_shortStories^ library_aboutMonsters == ()) or (library_readingDuration has Average && library_averageStories^ library_aboutMonsters == ()) or (library_readingDuration has Long && library_longStories^ library_aboutMonsters == ())}
                -> shuffle

    = about_fire  
    La biblioteca ti offre una storia...#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + {library_readingDuration has Short && library_shortStories^ library_aboutFire != ()} [Che racconti di <b>cose che bruciano</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_shortStories^ library_aboutFire)
        -> from_list_to_books

        + {library_readingDuration has Average && library_averageStories^ library_aboutFire != ()} [Che racconti di <b>cose che bruciano</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_averageStories ^ library_aboutFire)
         -> from_list_to_books
        
        + {library_readingDuration has Long && library_longStories^ library_aboutFire != ()} [Che racconti di <b>cose che bruciano</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_longStories ^ library_aboutFire)
         -> from_list_to_books            
        
        //Scelte di uscita se ho rifiutato tutte le opzioni precedenti.
        + {(library_readingDuration has Short && library_shortStories^ library_aboutFire != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutFire != ()) or (library_readingDuration has Long && library_longStories^ library_aboutFire != ())}[No, vorrei un altro tema.]
                -> shuffle
                
                
        + {(library_readingDuration has Short && library_shortStories^ library_aboutFire != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutFire != ()) or (library_readingDuration has Long && library_longStories^ library_aboutFire != ())} [Non ho più voglia di leggere.]
                ~ library_readingDuration = ()
                -> book_test_intro           
        
        + {(library_readingDuration has Short && library_shortStories^ library_aboutFire == ()) or (library_readingDuration has Average && library_averageStories^ library_aboutFire == ()) or (library_readingDuration has Long && library_longStories^ library_aboutFire == ())}
                -> shuffle

    = about_rebellion
    La biblioteca ti offre una storia...#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + {library_readingDuration has Short && library_shortStories^ library_aboutRebellion != ()} [Che urli di <b>sogni e ribellioni</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_shortStories^ library_aboutRebellion)
         -> from_list_to_books

        + {library_readingDuration has Average && library_averageStories^ library_aboutRebellion != ()} [Che urli di <b>sogni e ribellioni</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_averageStories ^ library_aboutRebellion)
        -> from_list_to_books
        
        + {library_readingDuration has Long && library_longStories^ library_aboutRebellion != ()} [Che urli di <b>sogni e ribellioni</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_longStories ^ library_aboutRebellion)
             -> from_list_to_books            
        
        //Scelte di uscita se ho rifiutato tutte le opzioni precedenti.
        + {(library_readingDuration has Short && library_shortStories^ library_aboutRebellion != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutRebellion != ()) or (library_readingDuration has Long && library_longStories^ library_aboutRebellion != ())}[No, vorrei un altro tema.]
                -> shuffle
                
                
        + {(library_readingDuration has Short && library_shortStories^ library_aboutRebellion != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutRebellion != ()) or (library_readingDuration has Long && library_longStories^ library_aboutRebellion != ())} [Non ho più voglia di leggere.]
                ~ library_readingDuration = ()
                -> book_test_intro           
        
        + {(library_readingDuration has Short && library_shortStories^ library_aboutRebellion == ()) or (library_readingDuration has Average && library_averageStories^ library_aboutRebellion == ()) or (library_readingDuration has Long && library_longStories^ library_aboutRebellion == ())}
                -> shuffle                 
        
->->


//Gestione TW temporanei
=== tempTW
{debug: Entro in tempTW. Prima di operare la funzione, il valore di library_proposedBook è {library_proposedBook}. Unreadstories ha questi libri: {library_unreadStories}, mentre readstories ha questi {library_readStories}.}
    {
    - library_unreadStories has library_proposedBook:
    	~ library_unreadStories -= library_proposedBook
    	~ library_temporaryTW += library_proposedBook
    - library_readStories has library_proposedBook:
    	~ library_readStories -= library_proposedBook
    	~ library_temporaryReadTW +=library_proposedBook
    }
    
    {
    - library_shortStories has library_proposedBook:
        ~ library_shortStories -= library_proposedBook
        ~ library_temporaryShortTW += library_proposedBook
    - library_averageStories has library_proposedBook:
        ~ library_averageStories -= library_proposedBook
        ~ library_temporaryAverageTW += library_proposedBook
    - library_longStories has library_proposedBook:
        ~ library_longStories -= library_proposedBook
        ~ library_temporaryLongTW += library_proposedBook
    }

    {
    - library_aboutTransformation has library_proposedBook:
        ~ library_aboutTransformation -= library_proposedBook
        ~ library_temporaryTransformationTW += library_proposedBook
    }
    {
    - library_aboutQuestions has library_proposedBook:
        ~ library_aboutQuestions -= library_proposedBook
        ~ library_temporaryQuestionsTW += library_proposedBook
    }
    {
    - library_aboutUnprepared has library_proposedBook:
        ~ library_aboutUnprepared -= library_proposedBook
        ~ library_temporaryUnpreparedTW += library_proposedBook
    }
    {
    - library_aboutMonsters has library_proposedBook:
        ~ library_aboutMonsters -= library_proposedBook
        ~ library_temporaryMonstersTW += library_proposedBook
    }
    {
    - library_aboutFire has library_proposedBook:
        ~ library_aboutFire -= library_proposedBook
        ~ library_temporaryFireTW += library_proposedBook
    }
    {
    - library_aboutRebellion has library_proposedBook:
        ~ library_aboutRebellion -= library_proposedBook
        ~ library_temporaryRebellionTW += library_proposedBook
    }

{debug: Dopo aver operato la funzione, il valore di library_proposedBook è {library_proposedBook}. Unreadstories ha questi libri: {library_unreadStories}, mentre readstories ha questi {library_readStories}.}    
->->


//Chiamo questa funzione per i trigger warning temporanei, quando voglio evitare una storia solo in una occasione
=== empty_tempTW
{debug: passo per empty_tempTW. Prima di operare la funzione, la lista di storie non lette contiene {library_unreadStories} e la lista delle storie non lette ed evitate contiene {library_temporaryTW}. La lista delle storie da rileggere è {library_readStories} e le storie da rileggere evitate sono {library_temporaryReadTW}.}
    ~ library_unreadStories += library_temporaryTW
    ~ library_temporaryTW = ()
    ~ library_readStories += library_temporaryReadTW
    ~ library_temporaryReadTW = ()

    ~ library_shortStories += library_temporaryShortTW
    ~ library_temporaryShortTW = ()
    ~ library_averageStories += library_temporaryAverageTW
    ~ library_temporaryAverageTW = ()
    ~ library_longStories += library_temporaryLongTW
    ~ library_temporaryLongTW = ()

    ~ library_aboutTransformation += library_temporaryTransformationTW
    ~ library_temporaryTransformationTW = ()
    ~ library_aboutQuestions += library_temporaryQuestionsTW
    ~ library_temporaryQuestionsTW = ()
    ~ library_aboutUnprepared += library_temporaryUnpreparedTW
    ~ library_temporaryUnpreparedTW = ()
    ~ library_aboutMonsters += library_temporaryMonstersTW
    ~ library_temporaryMonstersTW = ()
    ~ library_aboutFire += library_temporaryFireTW
    ~ library_temporaryFireTW = ()
    ~ library_aboutRebellion += library_temporaryRebellionTW
    ~ library_temporaryRebellionTW = ()

{debug: dopo aver applicato empty_tempTW, la lista di storie non lette contiene {library_unreadStories} e la lista delle storie evitate contiene {library_temporaryTW}.La lista delle storie da rileggere è {library_readStories} e i trigger sono attivi per {library_temporaryReadTW}.}

->->

//Funzione di rimozione permanente di un racconto
=== permanentTW
{debug: Entro in permanentTW. Prima di operare la funzione, il valore di library_proposedBook è {library_proposedBook}. Unreadstories ha questi libri: {library_unreadStories}, mentre readstories ha questi {library_readStories}.}
{
    - library_unreadStories has library_proposedBook:
    	~ library_unreadStories -= library_proposedBook
    - library_readStories has library_proposedBook:
    	~ library_readStories -= library_proposedBook
}
{debug: Dopo aver operato la funzione, il valore di library_proposedBook è {library_proposedBook}. Unreadstories ha questi libri: {library_unreadStories}, mentre readstories ha questi {library_readStories}.}   
->->
    
=== refresh_book_lists
//A prescindere prima di tutto levo il libro dalle storie non lette e lo metto tra le storie lette.

    ~ library_readingDuration =()
{
    
    - library_shortStories has library_proposedBook:
        ~ library_shortStories -= library_proposedBook
    - library_averageStories has library_proposedBook:
        ~ library_averageStories -= library_proposedBook
    - library_longStories has library_proposedBook:
        ~ library_longStories -= library_proposedBook
}
{
    - library_aboutTransformation has library_proposedBook:
        ~ library_aboutTransformation -= library_proposedBook
}
{
    - library_aboutQuestions has library_proposedBook:
        ~ library_aboutQuestions -= library_proposedBook
}
{
    - library_aboutUnprepared has library_proposedBook:
        ~ library_aboutUnprepared -= library_proposedBook
}
{
    - library_aboutMonsters has library_proposedBook:
        ~ library_aboutMonsters -= library_proposedBook
}
{
    - library_aboutFire has library_proposedBook:
        ~ library_aboutFire -= library_proposedBook
}
{
    - library_aboutRebellion has library_proposedBook:
        ~ library_aboutRebellion -= library_proposedBook

}
->->


=== from_list_to_books ===
{library_proposedBook:
    - AdriAllora:
        -> adri_allora
    - Aza:
        -> aza
    - StenoArtico:
        -> steno_artico
    - B:
        -> b
    - Beatrice:
        -> beatrice
    - BeatriceYBottura:
        -> beatrice_y_bottura

        
    - CeciliaFormicola:
        -> cecilia_formicola   

    - Lamia:
        -> lamia         
    - ValFaustoLattanzio:
        -> val_fausto_lattanzio        
    - Romi:
        -> romi
        
    - Salvo:
        -> salvo
    - Maura:
        -> maura
    - LetiziaVaccarella:
        -> letizia_vaccarella
    - QueerginiaWolf:
        -> queerginia_wolf

    - else: Non abbiamo trovato un racconto adatto, ci spiace.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    -> book_test_intro
    
}


-> DONE

=== reread ===
//Per sicurezza svuoto library_proposedBook
~ library_proposedBook = ()

{shuffle:
    - {library_readStories has AdriAllora: -> reread_adri_allora| -> reread}
    - {library_readStories has Aza: -> reread_aza| -> reread}    
    - {library_readStories has Salvo: -> reread_salvo| -> reread}
    - {library_readStories has StenoArtico: -> reread_steno_artico| -> reread}
    - {library_readStories has B: -> reread_b| -> reread}     
    - {library_readStories has Beatrice: -> reread_beatrice| -> reread}    
    - {library_readStories has BeatriceYBottura: -> reread_beatrice_y_bottura| -> reread}
    
    - {library_readStories has CeciliaFormicola: -> reread_cecilia_formicola| -> reread}   
    
    - {library_readStories has Lamia: -> reread_lamia| ->reread} 
    - {library_readStories has ValFaustoLattanzio: -> reread_val_lattanzio| ->reread}
    - {library_readStories has Romi: -> reread_romi| ->reread}    
    
    - {library_readStories has Maura: -> reread_maura| -> reread}
    - {library_readStories has LetiziaVaccarella: -> reread_letizia_vaccarella| -> reread}
    - {library_readStories has QueerginiaWolf: -> reread_queerginia_wolf| -> reread}
}


    
    = reread_adri_allora
    La biblioteca si chiede cosa tu voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [Rileggo <b>Il mio bellissimo gatto</b> di Adri Allora(ləi).]
                -> adri_allora
        + {LIST_COUNT(library_readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro
                
    = reread_aza
    La biblioteca si chiede cosa tu voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        + [Rileggo <b>Luna vergine</b> di Aza (any).]
                -> aza
        + {LIST_COUNT(library_readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro                 
    
    = reread_steno_artico
    La biblioteca si chiede cosa tu voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [Rileggo <b>This anger</b> by StenoArtico (he/him, none).]
                -> steno_artico
        + {LIST_COUNT(library_readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
    
    = reread_b
    La biblioteca si chiede cosa tu voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [Rileggo <b>The touch of anger</b> di K.(she/her).]
                -> b
        + {LIST_COUNT(library_readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
                
    = reread_beatrice
    La biblioteca si chiede cosa tu voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [Rileggo <b>La rete non esiste di Beatrice(she/her).]
                -> beatrice
        + {LIST_COUNT(library_readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
                
    = reread_beatrice_y_bottura
    La biblioteca si chiede cosa tu voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [Rileggo <b>Artigli Rosso Ruggine</b> di Beatrice Y. Bottura (she/it).]
                -> beatrice_y_bottura
        + {LIST_COUNT(library_readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 



                
    = reread_cecilia_formicola
    La biblioteca si chiede cosa tu voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [Rileggo <b>Getting warm</b> di Cecilia Formicola (she/her).]
                -> cecilia_formicola
        + {LIST_COUNT(library_readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
 
 
 
    = reread_lamia
    La biblioteca si chiede cosa tu voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [Rileggo <b>Il sassolino</b> di Lamia (she/they).]
                -> lamia
        + {LIST_COUNT(library_readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro  
    
    = reread_val_lattanzio
    La biblioteca si chiede cosa tu voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [Rileggo <b>Home</b> di Val Fausto Lattanzio (he/they).]
                -> val_fausto_lattanzio
        + {LIST_COUNT(library_readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro        
    
    = reread_romi
    La biblioteca si chiede cosa tu voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [Rileggo <b>Il principe sbagliato</b> di Romi (any).]
                -> val_fausto_lattanzio
        + {LIST_COUNT(library_readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro   
 
 
    = reread_salvo
    La biblioteca si chiede cosa tu voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [Rileggo <b>Il cancello</b> di Salvo (he/him).]
                -> salvo
        + {LIST_COUNT(library_readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
                
    = reread_maura
    La biblioteca si chiede cosa tu voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [Rileggo <b>Polvere</b> di Maura (she/they).]
                -> maura
        + {LIST_COUNT(library_readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro        
    

    = reread_letizia_vaccarella
    La biblioteca si chiede cosa tu voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [Rileggo <b>Dodici Stelle</b> di Letizia Vaccarella (she/her).]
                -> letizia_vaccarella
        + {LIST_COUNT(library_readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro     
    
    = reread_queerginia_wolf
    La biblioteca si chiede cosa tu voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [Rileggo <b>Giallo</b> di Queerginia Wolf/Marco Spelgatti (she/he/they).]
                -> queerginia_wolf
        + {LIST_COUNT(library_readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
    
        


->->

=== function number_translator(list)
{
    - LIST_COUNT(list) == 0: zero
    - LIST_COUNT(list) == 1: un
    - LIST_COUNT(list) == 2: due
    - LIST_COUNT(list) == 3: tre
    - LIST_COUNT(list) == 4: quattro
    - LIST_COUNT(list) == 5: cinque
    - LIST_COUNT(list) == 6: sei
    - LIST_COUNT(list) == 7: sette
    
}


=== function libro_libri(list)
    {LIST_COUNT(list) == 1:racconto|racconti}