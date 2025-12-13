//Variabili per la gestione della biblioteca
LIST library_allStories = AdriAllora, AlexiasDAvino, Aza, StenoArtico, B, BeatriceYBottura, CeciliaFormicola, FrancescaToscaRaimondi, Lamia, LorisCasagrandi, Kayleig, ValFaustoLattanzio, Romi, Salvo, Maura, Beatrice, LetiziaVaccarella, Simo, QueerginiaWolf

//Liste per distinguere storie lette e non
    VAR library_unreadStories = (AdriAllora, AlexiasDAvino, Aza, StenoArtico, B, BeatriceYBottura, CeciliaFormicola, FrancescaToscaRaimondi, Lamia, LorisCasagrandi, Kayleig, ValFaustoLattanzio, Romi, Salvo, Maura, Beatrice, LetiziaVaccarella, Simo, QueerginiaWolf)
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
    
//Raggruppamento per lunghezza
    LIST library_storiesDuration = Short, Average, Long
    VAR library_readingDuration = ()
    
    VAR library_shortStories = (StenoArtico, B, LorisCasagrandi, Kayleig, ValFaustoLattanzio, Maura, QueerginiaWolf)
    VAR library_averageStories = (AdriAllora, BeatriceYBottura, CeciliaFormicola, Lamia, Romi, Simo)
    VAR library_longStories = (Aza, AlexiasDAvino, Beatrice, FrancescaToscaRaimondi, Salvo, LetiziaVaccarella)
    
//Books about...
    VAR library_aboutTransformation = (Aza, AlexiasDAvino, B, FrancescaToscaRaimondi, Kayleig, LorisCasagrandi, ValFaustoLattanzio, Salvo, BeatriceYBottura, LetiziaVaccarella)
    VAR library_aboutQuestions = (AdriAllora, AlexiasDAvino, Beatrice, FrancescaToscaRaimondi, ValFaustoLattanzio, StenoArtico, Romi, Simo)
    VAR library_aboutUnprepared = (StenoArtico, Beatrice, Lamia, Simo)
    VAR library_aboutMonsters = (AdriAllora, Aza, B, BeatriceYBottura, CeciliaFormicola, Simo)
    VAR library_aboutFire= (Aza, CeciliaFormicola, Kayleig, BeatriceYBottura, Romi, Maura, LetiziaVaccarella, QueerginiaWolf)
    VAR library_aboutRebellion = (BeatriceYBottura, Lamia, Maura, Salvo, QueerginiaWolf, LorisCasagrandi)

    //Libro che verrà proposto
    VAR library_proposedBook = ()
    

=== book_test_intro ===
    
    <i>La biblioteca mostra le sue storie a {player_name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        
        + {library_readStories != ()} [<i>Voglio rileggere qualcosa.]
            <i>Ad ora {player_name} ha letto {number_translator(library_readStories)} {libro_libri(library_readStories)}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                -> reread
            
        + {library_unreadStories != ()} [<i>Voglio una nuova storia casuale.]
            -> storyRandom
            
        + {library_unreadStories != ()}[<i>Voglio scegliere la mia storia.]
            -> storyQuestions
    
        + [<i>Non voglio più leggere.]
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
    <i>{player_name} desidera una storia veloce come una pulce o lenta come la notte?#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        + {library_shortStories != ()} [<i>Qualcosa di brevissimo (max 1500 battute).]
        //(1500 battute max)
            ~ library_readingDuration += Short
        
        + {library_averageStories != ()} [<i>Una storia veloce (max 3000 battute).]
        // (3000 battute max)
            ~ library_readingDuration += Average
        
        + {library_longStories != ()} [<i>Un racconto più lungo (max 8000 battute).]
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
    <i>La biblioteca offre una storia...#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}

        + {library_readingDuration has Short && library_shortStories^ library_aboutTransformation != ()} [<i>Che racconti di qualcosa che si <b>trasforma</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_shortStories^ library_aboutTransformation)
             -> from_list_to_books
 
        + {library_readingDuration has Average && library_averageStories^ library_aboutTransformation != ()} [<i>Che racconti di qualcosa che si <b>trasforma</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_averageStories ^ library_aboutTransformation)
             -> from_list_to_books           
            
        + {library_readingDuration has Long && library_longStories^ library_aboutTransformation != ()} [<i>Che racconti di qualcosa che si <b>trasforma</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_longStories ^ library_aboutTransformation)
            -> from_list_to_books
        
        //Qui vale per ogni scelta: se effettivamente posso scegliere quel tema, posso decidere di andare comunque avanti. Se invece quel tema è vuoto nella intersezione con la lunghezza della storia selezionata, passo avanti.
        //Questo tasto compare solo se questo tema non è vuoto. Ha senso? sennò non sarei qui, no?
        + {(library_readingDuration has Short && library_shortStories^ library_aboutTransformation != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutTransformation != ()) or (library_readingDuration has Long && library_longStories^ library_aboutTransformation != ())} [<i>No, vorrei un altro tema.]
                -> shuffle
        
        + {(library_readingDuration has Short && library_shortStories^ library_aboutTransformation != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutTransformation != ()) or (library_readingDuration has Long && library_longStories^ library_aboutTransformation != ())} [<i>Non ho più voglia di leggere.]
                ~ library_readingDuration = ()
                -> book_test_intro      
        
        + {(library_readingDuration has Short && library_shortStories^ library_aboutTransformation == ()) or (library_readingDuration has Average && library_averageStories^ library_aboutTransformation == ()) or (library_readingDuration has Long && library_longStories^ library_aboutTransformation == ())}
            -> shuffle
        
    = about_questions       
    <i>La biblioteca offre una storia...#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + {library_readingDuration has Short && library_shortStories^ library_aboutQuestions != ()} [<i>Che parli di chi <b>si pone domande</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_shortStories^ library_aboutQuestions)
             -> from_list_to_books
        
        + {library_readingDuration has Average && library_averageStories^ library_aboutQuestions != ()} [<i>Che parli di chi <b>si pone domande</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_averageStories ^ library_aboutQuestions)
         -> from_list_to_books

        + {library_readingDuration has Long && library_longStories^ library_aboutQuestions != ()} [<i>Che parli di chi <b>si pone domande</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_longStories ^ library_aboutQuestions)
         -> from_list_to_books            
        
        
        + {(library_readingDuration has Short && library_shortStories^ library_aboutQuestions != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutQuestions != ()) or (library_readingDuration has Long && library_longStories^ library_aboutQuestions != ())}[<i>No, vorrei un altro tema.]
                -> shuffle
                
                
        + {(library_readingDuration has Short && library_shortStories^ library_aboutQuestions != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutQuestions != ()) or (library_readingDuration has Long && library_longStories^ library_aboutQuestions != ())} [<i>Non ho più voglia di leggere.]
                ~ library_readingDuration = ()
                -> book_test_intro           
        
        + {(library_readingDuration has Short && library_shortStories^ library_aboutQuestions == ()) or (library_readingDuration has Average && library_averageStories^ library_aboutQuestions == ()) or (library_readingDuration has Long && library_longStories^ library_aboutQuestions == ())}
                -> shuffle          
            
            
    = about_unprepared
    <i>La biblioteca offre una storia...#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + {library_readingDuration has Short && library_shortStories^ library_aboutUnprepared != ()} [<i>Che mi colga<b> {player_pronouns has him:impreparato|{player_pronouns has her:impreparata|impreparatə}}</b>].
            ~ library_proposedBook = LIST_RANDOM(library_shortStories^ library_aboutUnprepared)
         -> from_list_to_books

        + {library_readingDuration has Average && library_averageStories^ library_aboutUnprepared != ()} [<i>Che mi colga<b> {player_pronouns has him:impreparato|{player_pronouns has her:impreparata|impreparatə}}</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_averageStories ^ library_aboutUnprepared)
        -> from_list_to_books
        
        + {library_readingDuration has Long && library_longStories^ library_aboutUnprepared != ()} [<i>Che mi colga<b> {player_pronouns has him:impreparato|{player_pronouns has her:impreparata|impreparatə}}</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_longStories ^ library_aboutUnprepared)
        -> from_list_to_books            
        
        //Scelte di uscita se ho rifiutato tutte le opzioni precedenti.
        + {(library_readingDuration has Short && library_shortStories^ library_aboutUnprepared != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutUnprepared != ()) or (library_readingDuration has Long && library_longStories^ library_aboutUnprepared != ())}[<i>No, vorrei un altro tema.]
                -> shuffle
                
                
        + {(library_readingDuration has Short && library_shortStories^ library_aboutUnprepared != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutUnprepared != ()) or (library_readingDuration has Long && library_longStories^ library_aboutUnprepared != ())} [<i>Non ho più voglia di leggere.]
                ~ library_readingDuration = ()
                -> book_test_intro           
        
        + {(library_readingDuration has Short && library_shortStories^ library_aboutUnprepared == ()) or (library_readingDuration has Average && library_averageStories^ library_aboutUnprepared == ()) or (library_readingDuration has Long && library_longStories^ library_aboutUnprepared == ())}
                -> shuffle 

    = about_monsters
    <i>La biblioteca offre una storia...#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + {library_readingDuration has Short && library_shortStories^ library_aboutMonsters != ()} [<i>Che parli di <b>cose mostruose</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_shortStories^ library_aboutMonsters)
        -> from_list_to_books

        + {library_readingDuration has Average && library_averageStories^ library_aboutMonsters != ()} [<i>Che parli di <b>cose mostruose</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_averageStories ^ library_aboutMonsters)
        -> from_list_to_books
        
        + {library_readingDuration has Long && library_longStories^ library_aboutMonsters != ()} [<i>Che parli di <b>cose mostruose</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_longStories ^ library_aboutMonsters)
        -> from_list_to_books            
        
        //Scelte di uscita se ho rifiutato tutte le opzioni precedenti.
        + {(library_readingDuration has Short && library_shortStories^ library_aboutMonsters != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutMonsters != ()) or (library_readingDuration has Long && library_longStories^ library_aboutMonsters != ())}[<i>No, vorrei un altro tema.]
                -> shuffle
                
                
        + {(library_readingDuration has Short && library_shortStories^ library_aboutMonsters != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutMonsters != ()) or (library_readingDuration has Long && library_longStories^ library_aboutMonsters != ())} [<i>Non ho più voglia di leggere.]
                ~ library_readingDuration = ()
                -> book_test_intro           
        
        + {(library_readingDuration has Short && library_shortStories^ library_aboutMonsters == ()) or (library_readingDuration has Average && library_averageStories^ library_aboutMonsters == ()) or (library_readingDuration has Long && library_longStories^ library_aboutMonsters == ())}
                -> shuffle

    = about_fire  
    <i>La biblioteca offre una storia...#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + {library_readingDuration has Short && library_shortStories^ library_aboutFire != ()} [<i>Che racconti di <b>cose che bruciano</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_shortStories^ library_aboutFire)
        -> from_list_to_books

        + {library_readingDuration has Average && library_averageStories^ library_aboutFire != ()} [<i>Che racconti di <b>cose che bruciano</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_averageStories ^ library_aboutFire)
         -> from_list_to_books
        
        + {library_readingDuration has Long && library_longStories^ library_aboutFire != ()} [<i>Che racconti di <b>cose che bruciano</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_longStories ^ library_aboutFire)
         -> from_list_to_books            
        
        //Scelte di uscita se ho rifiutato tutte le opzioni precedenti.
        + {(library_readingDuration has Short && library_shortStories^ library_aboutFire != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutFire != ()) or (library_readingDuration has Long && library_longStories^ library_aboutFire != ())}[<i>No, vorrei un altro tema.]
                -> shuffle
                
                
        + {(library_readingDuration has Short && library_shortStories^ library_aboutFire != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutFire != ()) or (library_readingDuration has Long && library_longStories^ library_aboutFire != ())} [<i>Non ho più voglia di leggere.]
                ~ library_readingDuration = ()
                -> book_test_intro           
        
        + {(library_readingDuration has Short && library_shortStories^ library_aboutFire == ()) or (library_readingDuration has Average && library_averageStories^ library_aboutFire == ()) or (library_readingDuration has Long && library_longStories^ library_aboutFire == ())}
                -> shuffle

    = about_rebellion
    <i>La biblioteca offre una storia...#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + {library_readingDuration has Short && library_shortStories^ library_aboutRebellion != ()} [<i>Che urli di <b>sogni e ribellioni</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_shortStories^ library_aboutRebellion)
         -> from_list_to_books

        + {library_readingDuration has Average && library_averageStories^ library_aboutRebellion != ()} [<i>Che urli di <b>sogni e ribellioni</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_averageStories ^ library_aboutRebellion)
        -> from_list_to_books
        
        + {library_readingDuration has Long && library_longStories^ library_aboutRebellion != ()} [<i>Che urli di <b>sogni e ribellioni</b>.]
            ~ library_proposedBook = LIST_RANDOM(library_longStories ^ library_aboutRebellion)
             -> from_list_to_books            
        
        //Scelte di uscita se ho rifiutato tutte le opzioni precedenti.
        + {(library_readingDuration has Short && library_shortStories^ library_aboutRebellion != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutRebellion != ()) or (library_readingDuration has Long && library_longStories^ library_aboutRebellion != ())}[<i>No, vorrei un altro tema.]
                -> shuffle
                
                
        + {(library_readingDuration has Short && library_shortStories^ library_aboutRebellion != ()) or (library_readingDuration has Average && library_averageStories^ library_aboutRebellion != ()) or (library_readingDuration has Long && library_longStories^ library_aboutRebellion != ())} [<i>Non ho più voglia di leggere.]
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
    - AlexiasDAvino:
        -> alexias_d_avino
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
    - FrancescaToscaRaimondi:
        -> francesca_tosca_raimondi
    
    - Kayleig:
        -> kayleig
    - Lamia:
        -> lamia       
    - LorisCasagrandi:
        -> loris_casagrandi
    - ValFaustoLattanzio:
        -> val_fausto_lattanzio        
    - Romi:
        -> romi
        
    - Salvo:
        -> salvo
    - Maura:
        -> maura
    - Simo:
        -> simo    
    - LetiziaVaccarella:
        -> letizia_vaccarella
    - QueerginiaWolf:
        -> queerginia_wolf

    - else: <i>La biblioteca non riesce a trovare un racconto adatto.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        -> book_test_intro
    
}


-> DONE

=== reread ===
//Per sicurezza svuoto library_proposedBook
~ library_proposedBook = ()

{shuffle:
    - {library_readStories has AdriAllora: -> reread_adri_allora| -> reread}
    - {library_readStories has AlexiasDAvino: -> reread_alexias_d_avino| -> reread}    
    - {library_readStories has Aza: -> reread_aza| -> reread}    
    - {library_readStories has StenoArtico: -> reread_steno_artico| -> reread}
    - {library_readStories has B: -> reread_b| -> reread}     
    - {library_readStories has Beatrice: -> reread_beatrice| -> reread}    
    - {library_readStories has BeatriceYBottura: -> reread_beatrice_y_bottura| -> reread}
    
    - {library_readStories has CeciliaFormicola: -> reread_cecilia_formicola| -> reread}
    - {library_readStories has FrancescaToscaRaimondi: -> reread_francesca_tosca_raimondi| -> reread}   
    
    - {library_readStories has Kayleig: -> reread_kayleig| ->reread} 
    - {library_readStories has Lamia: -> reread_lamia| ->reread}
    - {library_readStories has LorisCasagrandi: -> reread_loris_casagrandi| ->reread} 
    - {library_readStories has ValFaustoLattanzio: -> reread_val_lattanzio| ->reread}
    - {library_readStories has Romi: -> reread_romi| ->reread}
    
    - {library_readStories has Salvo: -> reread_salvo| -> reread}
    - {library_readStories has Maura: -> reread_maura| -> reread}
    - {library_readStories has Simo: -> reread_simo| -> reread}
    - {library_readStories has LetiziaVaccarella: -> reread_letizia_vaccarella| -> reread}
    - {library_readStories has QueerginiaWolf: -> reread_queerginia_wolf| -> reread}
}


    
    = reread_adri_allora
    <i>La biblioteca si chiede cosa {player_name} voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [<i>Rileggo <b>Il mio bellissimo gatto</b> di Adri Allora(ləi).]
                -> adri_allora
        + {LIST_COUNT(library_readStories) > 1}[<i>Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [<i>Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro
    
    = reread_alexias_d_avino
    <i>La biblioteca si chiede cosa {player_name} voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [<i>Rileggo <b>Il Riflesso</b> di Alexias D'Avino (lui/lei).]
                -> alexias_d_avino
        + {LIST_COUNT(library_readStories) > 1}[<i>Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [<i>Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro            
                
    = reread_aza
    <i>La biblioteca si chiede cosa {player_name} voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        + [<i>Rileggo <b>Luna vergine</b> di Aza (any).]
                -> aza
        + {LIST_COUNT(library_readStories) > 1}[<i>Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [<i>Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro                 
    
    = reread_steno_artico
    <i>La biblioteca si chiede cosa {player_name} voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [<i>Rileggo <b>Questa rabbia, che mi è stata rubata</b> by StenoArtico (he/him, none).]
                -> steno_artico
        + {LIST_COUNT(library_readStories) > 1}[<i>Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [<i>Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
    
    = reread_b
    <i>La biblioteca si chiede cosa {player_name} voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [<i>Rileggo <b>Il tocco della rabbia</b> di K.(she/her).]
                -> b
        + {LIST_COUNT(library_readStories) > 1}[<i>Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [<i>Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
                
    = reread_beatrice
    <i>La biblioteca si chiede cosa {player_name} voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [<i>Rileggo <b>La rete non esiste</b> di Beatrice (she/her).]
                -> beatrice
        + {LIST_COUNT(library_readStories) > 1}[<i>Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [<i>Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
                
    = reread_beatrice_y_bottura
    <i>La biblioteca si chiede cosa {player_name} voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [<i>Rileggo <b>Artigli Rosso Ruggine</b> di Beatrice Y. Bottura (she/it).]
                -> beatrice_y_bottura
        + {LIST_COUNT(library_readStories) > 1}[<i>Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [<i>Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 



                
    = reread_cecilia_formicola
    <i>La biblioteca si chiede cosa {player_name} voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [<i>Rileggo <b>Fuochino</b> di Cecilia Formicola (she/her).]
                -> cecilia_formicola
        + {LIST_COUNT(library_readStories) > 1}[<i>Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [<i>Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
 
    = reread_francesca_tosca_raimondi
    <i>La biblioteca si chiede cosa {player_name} voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [<i>Rileggo <b>Trecentotrenta metri</b> di Francesca Tosca Raimondi (she/her).]
                -> francesca_tosca_raimondi
        + {LIST_COUNT(library_readStories) > 1}[<i>Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [<i>Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
    
    
    = reread_kayleig
    <i>La biblioteca si chiede cosa {player_name} voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [<i>Rileggo <b>Volevo che mia madre fosse forte</b> di Kayleig (she/her).]
                -> kayleig
        + {LIST_COUNT(library_readStories) > 1}[<i>Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [<i>Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro  
    
    
    = reread_lamia
    <i>La biblioteca si chiede cosa {player_name} voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [<i>Rileggo <b>Il sassolino</b> di Lamia (she/they).]
                -> lamia
        + {LIST_COUNT(library_readStories) > 1}[<i>Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [<i>Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
    
    = reread_loris_casagrandi
    <i>La biblioteca si chiede cosa {player_name} voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [<i>Rileggo <b>Volevo essere solo cervello</b> di Loris Casagrandi (he/him - she/her).]
                -> loris_casagrandi
        + {LIST_COUNT(library_readStories) > 1}[<i>Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [<i>Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro             
    
    = reread_val_lattanzio
    <i>La biblioteca si chiede cosa {player_name} voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [<i>Rileggo <b>Home</b> di Val Fausto Lattanzio (he/they).]
                -> val_fausto_lattanzio
        + {LIST_COUNT(library_readStories) > 1}[<i>Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [<i>Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro        
    
    = reread_romi
    <i>La biblioteca si chiede cosa {player_name} voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [<i>Rileggo <b>Il principe sbagliato</b> di Romi (any).]
                -> romi
        + {LIST_COUNT(library_readStories) > 1}[<i>Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [<i>Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro   
 
 
    = reread_salvo
    <i>La biblioteca si chiede cosa {player_name} voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [<i>Rileggo <b>Il cancello</b> di Salvo (he/him).]
                -> salvo
        + {LIST_COUNT(library_readStories) > 1}[<i>Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [<i>Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
                
    = reread_maura
    <i>La biblioteca si chiede cosa {player_name} voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [<i>Rileggo <b>Polvere</b> di Maura (she/they).]
                -> maura
        + {LIST_COUNT(library_readStories) > 1}[<i>Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [<i>Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro        
    
    = reread_simo
    <i>La biblioteca si chiede cosa {player_name} voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [<i>Rileggo <b>SCP</b> di Simo (they/he).]
                -> simo
        + {LIST_COUNT(library_readStories) > 1}[<i>Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [<i>Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 

    = reread_letizia_vaccarella
    <i>La biblioteca si chiede cosa {player_name} voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [<i>Rileggo <b>Dodici Stelle</b> di Letizia Vaccarella (she/her).]
                -> letizia_vaccarella
        + {LIST_COUNT(library_readStories) > 1}[<i>Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [<i>Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro     
    
    = reread_queerginia_wolf
    <i>La biblioteca si chiede cosa {player_name} voglia rileggere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        + [<i>Rileggo <b>Giallo</b> di Queerginia Wolf/Marco Spelgatti (she/he/they).]
                -> queerginia_wolf
        + {LIST_COUNT(library_readStories) > 1}[<i>Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [<i>Ho cambiato idea, voglio una storia nuova.]
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