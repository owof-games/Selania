//Variabili per la gestione della biblioteca
LIST story = AdriAllora, Aza, StenoArtico, B, BeatriceYBottura, CeciliaFormicola, Lamia, ValFaustoLattanzio, Romi, Salvo, Maura, Beatrice, LetiziaVaccarella, QueerginiaWolf

//Liste per distinguere storie lette e non
    VAR unreadStories = (AdriAllora, Aza, StenoArtico, B, BeatriceYBottura, CeciliaFormicola, Lamia, ValFaustoLattanzio, Romi, Salvo, Maura, Beatrice, LetiziaVaccarella, QueerginiaWolf)
    VAR readStories = ()

//Raggrupamento per lunghezza
    LIST storiesDuration = Short, Average, Long
    VAR readingDuration = ()
    
    VAR shortStories = (StenoArtico, B, ValFaustoLattanzio, Maura, QueerginiaWolf)
    VAR averageStories = (AdriAllora, BeatriceYBottura, CeciliaFormicola, Lamia, Romi)
    VAR longStories = (Aza, Beatrice, Salvo, LetiziaVaccarella)
    
TODO: aggiungere negli about e nei trigger la storia di B.    
//Books about...
    VAR aboutTransformation = (Aza, ValFaustoLattanzio, Salvo, BeatriceYBottura, LetiziaVaccarella)
    VAR aboutQuestions = (AdriAllora, Beatrice, ValFaustoLattanzio, StenoArtico, Romi)
    VAR aboutUnprepared = (StenoArtico, Beatrice, Lamia)
    VAR aboutMonsters = (AdriAllora, Aza, BeatriceYBottura, CeciliaFormicola)
    VAR aboutFire= (Aza, CeciliaFormicola, BeatriceYBottura, Romi, Maura, LetiziaVaccarella, QueerginiaWolf)
    VAR aboutRebellion = (BeatriceYBottura, Lamia, Maura, Salvo, QueerginiaWolf)

    //Libro che verrà proposto
    VAR book = ()
    

=== book_test_intro ===
<i>La biblioteca freme all'idea di offrirti una storia da leggere.</i>
        + {readStories != ()} [Voglio rileggere qualcosa.]
        <i>La tua libreria contiene {number_translator(readStories)} {libro_libri(readStories)}.</i>
            -> reread
            
        + {unreadStories != ()} [Vorrei una nuova storia casuale.]
            -> storyRandom
            
        + {unreadStories != ()}[Voglio scegliere la mia storia.]
            -> storyQuestions
    
        + [Ho cambiato idea.]
            -> main

->->


=== storyRandom ===
//Questo è il più facile: recupero un titolo randomico tra i libri non letti.
    ~ book = ()
    ~ book = LIST_RANDOM(unreadStories)
    -> refresh_book_lists ->from_list_to_books






=== storyQuestions ===
    //Svuoto il valore del libro
    ~ book = ()
    -> step_one

    = step_one
        + {shortStories != ()} [Qualcosa di brevissimo (max 1500 battute).]
        //(1500 battute max)
            ~ readingDuration += Short
        
        + {averageStories != ()} [Una storia veloce (max 3000 battute).]
        // (3000 battute max)
            ~ readingDuration += Average
        
        + {longStories != ()} [Un racconto più lungo (max 8000 battute).]
        // 8000 battute max 
            ~ readingDuration += Long
        -
        -> shuffle
        
    
    = shuffle
        {shuffle:
            - {aboutTransformation != (): -> about_transformation| -> shuffle}
            - {aboutQuestions != (): -> about_questions| -> shuffle}
            - {aboutUnprepared != (): -> about_unprepared| -> shuffle}
            - {aboutMonsters != (): -> about_monsters| -> shuffle}
            - {aboutFire != (): -> about_fire| -> shuffle}
            - {aboutRebellion != (): -> about_rebellion| -> shuffle}
        }
    
    
    
    = about_transformation
    <i>La biblioteca ti offre una storia...</i>
        + {readingDuration has Short && shortStories^ aboutTransformation != ()} [Che racconta di qualcosa che si trasforma.]
            ~ book = LIST_RANDOM(shortStories^ aboutTransformation)
            -> refresh_book_lists -> from_list_to_books
 
        + {readingDuration has Average && averageStories^ aboutTransformation != ()} [Che racconta di qualcosa che si trasforma.]
            ~ book = LIST_RANDOM(averageStories ^ aboutTransformation)
            -> refresh_book_lists -> from_list_to_books           
            
        + {readingDuration has Long && longStories^ aboutTransformation != ()} [Che racconta di qualcosa che si trasforma.]
            ~ book = LIST_RANDOM(longStories ^ aboutTransformation)
            -> refresh_book_lists -> from_list_to_books
        
        //Qui vale per ogni scelta: se effettivamente posso scegliere quel tema, posso decidere di andare comunque avanti. Se invece quel tema è vuoto nella intersezione con la lunghezza della storia selezionata, passo avanti.
        TODO: come fare in modo che non venga proposto questo tasto se non ci sono altri temi disponibili?
        //Questo tasto compare solo se questo tema non è vuoto. Ha senso? sennò non sarei qui, no?
        + {(readingDuration has Short && shortStories^ aboutTransformation != ()) or (readingDuration has Average && averageStories^ aboutTransformation != ()) or (readingDuration has Long && longStories^ aboutTransformation != ())} [No, vorrei un altro tema.]
                -> shuffle
        
        + {(readingDuration has Short && shortStories^ aboutTransformation != ()) or (readingDuration has Average && averageStories^ aboutTransformation != ()) or (readingDuration has Long && longStories^ aboutTransformation != ())} [Non ho più voglia di leggere.]
                ~ readingDuration = ()
                -> book_test_intro      
        
        + {(readingDuration has Short && shortStories^ aboutTransformation == ()) or (readingDuration has Average && averageStories^ aboutTransformation == ()) or (readingDuration has Long && longStories^ aboutTransformation == ())}
            -> shuffle
        
    = about_questions       
    <i>La biblioteca ti offre una storia...</i> 
    
        + {readingDuration has Short && shortStories^ aboutQuestions != ()} [Che parla di chi si pone domande.]
            ~ book = LIST_RANDOM(shortStories^ aboutQuestions)
            -> refresh_book_lists -> from_list_to_books
        
        + {readingDuration has Average && averageStories^ aboutQuestions != ()} [Che parla di chi si pone domande.]
            ~ book = LIST_RANDOM(averageStories ^ aboutQuestions)
            -> refresh_book_lists -> from_list_to_books

        + {readingDuration has Long && longStories^ aboutQuestions != ()} [Che parla di chi si pone domande.]
            ~ book = LIST_RANDOM(longStories ^ aboutQuestions)
            -> refresh_book_lists -> from_list_to_books            
        
        
        + {(readingDuration has Short && shortStories^ aboutQuestions != ()) or (readingDuration has Average && averageStories^ aboutQuestions != ()) or (readingDuration has Long && longStories^ aboutQuestions != ())}[No, vorrei un altro tema.]
                -> shuffle
                
                
        + {(readingDuration has Short && shortStories^ aboutQuestions != ()) or (readingDuration has Average && averageStories^ aboutQuestions != ()) or (readingDuration has Long && longStories^ aboutQuestions != ())} [Non ho più voglia di leggere.]
                ~ readingDuration = ()
                -> book_test_intro           
        
        + {(readingDuration has Short && shortStories^ aboutQuestions == ()) or (readingDuration has Average && averageStories^ aboutQuestions == ()) or (readingDuration has Long && longStories^ aboutQuestions == ())}
                -> shuffle          
            
            
    = about_unprepared
    <i>La biblioteca ti offre una storia...</i>
    
        + {readingDuration has Short && shortStories^ aboutUnprepared != ()} [Che mi colga {pronouns has him: impreparato|{pronouns has her: impreparata|impreparatə}}]
            ~ book = LIST_RANDOM(shortStories^ aboutUnprepared)
            -> refresh_book_lists -> from_list_to_books

        + {readingDuration has Average && averageStories^ aboutUnprepared != ()} [Che mi colga {pronouns has him: impreparato|{pronouns has her: impreparata|impreparatə}}]
            ~ book = LIST_RANDOM(averageStories ^ aboutUnprepared)
            -> refresh_book_lists -> from_list_to_books
        
        + {readingDuration has Long && longStories^ aboutUnprepared != ()} [Che mi colga {pronouns has him: impreparato|{pronouns has her: impreparata|impreparatə}}]
            ~ book = LIST_RANDOM(longStories ^ aboutUnprepared)
            -> refresh_book_lists -> from_list_to_books            
        
        //Scelte di uscita se ho rifiutato tutte le opzioni precedenti.
        + {(readingDuration has Short && shortStories^ aboutUnprepared != ()) or (readingDuration has Average && averageStories^ aboutUnprepared != ()) or (readingDuration has Long && longStories^ aboutUnprepared != ())}[No, vorrei un altro tema.]
                -> shuffle
                
                
        + {(readingDuration has Short && shortStories^ aboutUnprepared != ()) or (readingDuration has Average && averageStories^ aboutUnprepared != ()) or (readingDuration has Long && longStories^ aboutUnprepared != ())} [Non ho più voglia di leggere.]
                ~ readingDuration = ()
                -> book_test_intro           
        
        + {(readingDuration has Short && shortStories^ aboutUnprepared == ()) or (readingDuration has Average && averageStories^ aboutUnprepared == ()) or (readingDuration has Long && longStories^ aboutUnprepared == ())}
                -> shuffle 

    = about_monsters
    <i>La biblioteca ti offre una storia...</i>
    
        + {readingDuration has Short && shortStories^ aboutMonsters != ()} [Che parla di cose mostruose.]
            ~ book = LIST_RANDOM(shortStories^ aboutMonsters)
            -> refresh_book_lists -> from_list_to_books

        + {readingDuration has Average && averageStories^ aboutMonsters != ()} [Che parla di cose mostruose.]
            ~ book = LIST_RANDOM(averageStories ^ aboutMonsters)
            -> refresh_book_lists -> from_list_to_books
        
        + {readingDuration has Long && longStories^ aboutMonsters != ()} [Che parla di cose mostruose.]
            ~ book = LIST_RANDOM(longStories ^ aboutMonsters)
            -> refresh_book_lists -> from_list_to_books            
        
        //Scelte di uscita se ho rifiutato tutte le opzioni precedenti.
        + {(readingDuration has Short && shortStories^ aboutMonsters != ()) or (readingDuration has Average && averageStories^ aboutMonsters != ()) or (readingDuration has Long && longStories^ aboutMonsters != ())}[No, vorrei un altro tema.]
                -> shuffle
                
                
        + {(readingDuration has Short && shortStories^ aboutMonsters != ()) or (readingDuration has Average && averageStories^ aboutMonsters != ()) or (readingDuration has Long && longStories^ aboutMonsters != ())} [Non ho più voglia di leggere.]
                ~ readingDuration = ()
                -> book_test_intro           
        
        + {(readingDuration has Short && shortStories^ aboutMonsters == ()) or (readingDuration has Average && averageStories^ aboutMonsters == ()) or (readingDuration has Long && longStories^ aboutMonsters == ())}
                -> shuffle

    = about_fire  
    <i>La biblioteca ti offre una storia...</i>
    
        + {readingDuration has Short && shortStories^ aboutFire != ()} [Che racconta di cose che bruciano.]
            ~ book = LIST_RANDOM(shortStories^ aboutFire)
            -> refresh_book_lists -> from_list_to_books

        + {readingDuration has Average && averageStories^ aboutFire != ()} [Che racconta di cose che bruciano.]
            ~ book = LIST_RANDOM(averageStories ^ aboutFire)
            -> refresh_book_lists -> from_list_to_books
        
        + {readingDuration has Long && longStories^ aboutFire != ()} [Che racconta di cose che bruciano.]
            ~ book = LIST_RANDOM(longStories ^ aboutFire)
            -> refresh_book_lists -> from_list_to_books            
        
        //Scelte di uscita se ho rifiutato tutte le opzioni precedenti.
        + {(readingDuration has Short && shortStories^ aboutFire != ()) or (readingDuration has Average && averageStories^ aboutFire != ()) or (readingDuration has Long && longStories^ aboutFire != ())}[No, vorrei un altro tema.]
                -> shuffle
                
                
        + {(readingDuration has Short && shortStories^ aboutFire != ()) or (readingDuration has Average && averageStories^ aboutFire != ()) or (readingDuration has Long && longStories^ aboutFire != ())} [Non ho più voglia di leggere.]
                ~ readingDuration = ()
                -> book_test_intro           
        
        + {(readingDuration has Short && shortStories^ aboutFire == ()) or (readingDuration has Average && averageStories^ aboutFire == ()) or (readingDuration has Long && longStories^ aboutFire == ())}
                -> shuffle

    = about_rebellion
    <i>La biblioteca ti offre una storia...</i>
    
        + {readingDuration has Short && shortStories^ aboutRebellion != ()} [Che urla di sogni e ribellioni.]
            ~ book = LIST_RANDOM(shortStories^ aboutRebellion)
            -> refresh_book_lists -> from_list_to_books

        + {readingDuration has Average && averageStories^ aboutRebellion != ()} [Che urla di sogni e ribellioni.]
            ~ book = LIST_RANDOM(averageStories ^ aboutRebellion)
            -> refresh_book_lists -> from_list_to_books
        
        + {readingDuration has Long && longStories^ aboutRebellion != ()} [Che urla di sogni e ribellioni.]
            ~ book = LIST_RANDOM(longStories ^ aboutRebellion)
            -> refresh_book_lists -> from_list_to_books            
        
        //Scelte di uscita se ho rifiutato tutte le opzioni precedenti.
        + {(readingDuration has Short && shortStories^ aboutRebellion != ()) or (readingDuration has Average && averageStories^ aboutRebellion != ()) or (readingDuration has Long && longStories^ aboutRebellion != ())}[No, vorrei un altro tema.]
                -> shuffle
                
                
        + {(readingDuration has Short && shortStories^ aboutRebellion != ()) or (readingDuration has Average && averageStories^ aboutRebellion != ()) or (readingDuration has Long && longStories^ aboutRebellion != ())} [Non ho più voglia di leggere.]
                ~ readingDuration = ()
                -> book_test_intro           
        
        + {(readingDuration has Short && shortStories^ aboutRebellion == ()) or (readingDuration has Average && averageStories^ aboutRebellion == ()) or (readingDuration has Long && longStories^ aboutRebellion == ())}
                -> shuffle                 
        
->->


    
=== refresh_book_lists
//A prescindere prima di tutto levo il libro dalle storie non lette e lo metto tra le storie lette.
    ~ unreadStories -= book
    ~ readStories += book
    ~ readingDuration =()
{
    
    - shortStories has book:
        ~ shortStories -= book
    - averageStories has book:
        ~ averageStories -= book
    - longStories has book:
        ~ longStories -= book
    
    - aboutTransformation has book:
        ~ aboutTransformation -= book
    - aboutQuestions has book:
        ~ aboutQuestions -= book
    - aboutUnprepared has book:
        ~ aboutUnprepared -= book
    - aboutMonsters has book:
        ~ aboutMonsters -= book
    - aboutFire has book:
        ~ aboutFire -= book
    - aboutRebellion has book:
        ~ aboutRebellion -= book           

}
->->


=== from_list_to_books ===
{book:
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

    - else: <i>Non abbiamo trovato un racconto adatto, ci spiace.</i>
    -> book_test_intro
    
}


-> DONE

=== reread ===

{shuffle:
    - {readStories has AdriAllora: -> reread_adri_allora| -> reread}
    - {readStories has Aza: -> reread_aza| -> reread}    
    - {readStories has Salvo: -> reread_salvo| -> reread}
    - {readStories has StenoArtico: -> reread_steno_artico| -> reread}
    - {readStories has B: -> reread_b| -> reread}     
    - {readStories has Beatrice: -> reread_beatrice| -> reread}    
    - {readStories has BeatriceYBottura: -> reread_beatrice_y_bottura| -> reread}
    
    - {readStories has CeciliaFormicola: -> reread_cecilia_formicola| -> reread}   
    
    - {readStories has Lamia: -> reread_lamia| ->reread} 
    - {readStories has ValFaustoLattanzio: -> reread_val_lattanzio| ->reread}
    - {readStories has Romi: -> reread_romi| ->reread}    
    
    - {readStories has Maura: -> reread_maura| -> reread}
    - {readStories has LetiziaVaccarella: -> reread_letizia_vaccarella| -> reread}
    - {readStories has QueerginiaWolf: -> reread_queerginia_wolf| -> reread}
}


    
    = reread_adri_allora
    <i>La biblioteca si chiede cosa tu voglia rileggere.</i>
    
        + [Rileggo <i>Il mio bellissimo gatto</i>di Adri Allora(ləi).]
                -> adri_allora
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro
                
    = reread_aza
    <i>La biblioteca si chiede cosa tu voglia rileggere.</i>
    
        + [Rileggo <i>Luna vergine</i> di Aza (any).]
                -> aza
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro                 
    
    = reread_steno_artico
    <i>La biblioteca si chiede cosa tu voglia rileggere.</i>
    
        + [Rileggo <i> This anger</i> by StenoArtico (he/him, none).]
                -> steno_artico
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
    
    = reread_b
    <i>La biblioteca si chiede cosa tu voglia rileggere.</i>
    
        + [Rileggo <i>Lwwww</i> di B(she/her).]
                -> b
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
                
    = reread_beatrice
    <i>La biblioteca si chiede cosa tu voglia rileggere.</i>
    
        + [Rileggo <i>La rete non esiste</i> di Beatrice(she/her).]
                -> beatrice
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
                
    = reread_beatrice_y_bottura
    <i>La biblioteca si chiede cosa tu voglia rileggere.</i>
    
        + [Rileggo <i>Artigli Rosso Ruggine</i> di Beatrice Y. Bottura (she/it).]
                -> beatrice_y_bottura
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 



                
    = reread_cecilia_formicola
    <i>La biblioteca si chiede cosa tu voglia rileggere.</i>
    
        + [Rileggo <i>Getting warm</i> di Cecilia Formicola (she/her).]
                -> cecilia_formicola
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
 
 
 
    = reread_lamia
    <i>La biblioteca si chiede cosa tu voglia rileggere.</i>
    
        + [Rileggo <i>Il sassolino</i> di Lamia (she/they).]
                -> lamia
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro  
    
    = reread_val_lattanzio
    <i>La biblioteca si chiede cosa tu voglia rileggere.</i>
    
        + [Rileggo <i>Home</i> di Val Fausto Lattanzio (he/they).]
                -> val_fausto_lattanzio
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro        
    
    = reread_romi
    <i>La biblioteca si chiede cosa tu voglia rileggere.</i>
    
        + [Rileggo <i>Il principe sbagliato</i> di Romi (any).]
                -> val_fausto_lattanzio
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro   
 
 
    = reread_salvo
    <i>La biblioteca si chiede cosa tu voglia rileggere.</i>
    
        + [Rileggo <i>Il cancello</i> di Salvo (he/him).]
                -> salvo
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
                
    = reread_maura
    <i>La biblioteca si chiede cosa tu voglia rileggere.</i>
    
        + [Rileggo <i>Polvere</i> di Maura (she/they).]
                -> maura
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro        
    

    = reread_letizia_vaccarella
    <i>La biblioteca si chiede cosa tu voglia rileggere.</i>
    
        + [Rileggo <i>Dodici Stelle</i> di Letizia Vaccarella (she/her).]
                -> letizia_vaccarella
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro     
    
    = reread_queerginia_wolf
    <i>La biblioteca si chiede cosa tu voglia rileggere.</i>
    
        + [Rileggo <i>Giallo</i> di Queerginia Wolf/Marco Spelgatti (she/he/they).]
                -> queerginia_wolf
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
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