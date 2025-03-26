//Variabili per la gestione della biblioteca
LIST story = AdriAllora, SalvatoreCiaccio, StenoArtico, CeciliaFormicola,  ValFaustoLattanzio, MauraSacca, BeatriceSgravatto, LetiziaVaccarella, QueerginiaWolf

//Liste per distinguere storie lette e non
    VAR unreadStories = (AdriAllora, SalvatoreCiaccio, StenoArtico, CeciliaFormicola,  ValFaustoLattanzio, MauraSacca, BeatriceSgravatto, LetiziaVaccarella, QueerginiaWolf)
    VAR readStories = ()

//Raggrupamento per lunghezza
    LIST storiesDuration = Short, Average, Long
    VAR readingDuration = ()
    
    VAR shortStories = (ValFaustoLattanzio, StenoArtico)
    VAR averageStories = (CeciliaFormicola)
    VAR longStories = (SalvatoreCiaccio)
    
//Books about...
VAR aboutLove = (CeciliaFormicola, SalvatoreCiaccio, BeatriceSgravatto, ValFaustoLattanzio)
VAR aboutRage = (CeciliaFormicola, AdriAllora, BeatriceSgravatto, MauraSacca)
VAR aboutBody = (SalvatoreCiaccio, AdriAllora, ValFaustoLattanzio, LetiziaVaccarella)
VAR aboutHome = (ValFaustoLattanzio, LetiziaVaccarella)
VAR aboutSelf = (LetiziaVaccarella)
VAR aboutForgiveness = ()
VAR aboutDeath = (MauraSacca)
VAR aboutSelfLove = (ValFaustoLattanzio)
    //Libro che verrà proposto
    VAR book = ()
    

=== book_test_intro ===
        + {readStories != ()} [Voglio rileggere qualcosa.]
        La tua libreria contiene {number_translator(readStories)} {libro_libri(readStories)}.
            -> reread
            
        + [Vorrei una nuova storia casuale.]
            {unreadStories != (): -> storyRandom|<i>Non ci sono più nuove storie</i> ->book_test_intro}
            
        + {unreadStories != ()}[Voglio scegliere la mia storia.]
            {unreadStories != (): -> storyQuestions|<i>Non ci sono più nuove storie</i> ->book_test_intro}
    
        + [Ho cambiato idea.]
            -> main

->->


=== storyRandom ===
//Questo è il più facile: recupero un titolo randomico tra i libri non letti.
    ~ book = LIST_RANDOM(unreadStories)
    -> refresh_book_lists ->from_list_to_books






=== storyQuestions ===


    = step_one
        + {shortStories != ()} [Un racconto brevissimo.]
        //(1500 battute max)
            ~ readingDuration += Short
        + {averageStories != ()} [Una storia più lunga.]
        // (3000 battute max)
            ~ readingDuration += Average
        + {longStories != ()} [Qualcosa che richieda qualche minuto.]
        // 6000 battute max 
            ~ readingDuration += Long
        -
        -> shuffle
        
    
    = shuffle
        {shuffle:
            - {aboutLove != (): -> about_love| -> shuffle}
            - {aboutRage != (): -> about_rage| -> shuffle}
            - {aboutBody != (): -> about_body| -> shuffle}
        }
    
    
    
    = about_love
        + {readingDuration has Short && shortStories^ aboutLove != ()} [Che parli d'amore.]
            ~ book = LIST_RANDOM(shortStories^ aboutLove)
            -> refresh_book_lists -> from_list_to_books
 
        + {readingDuration has Average && averageStories^ aboutLove != ()} [Che parli d'amore.]
            ~ book = LIST_RANDOM(averageStories ^ aboutLove)
            -> refresh_book_lists -> from_list_to_books           
            
        + {readingDuration has Long && longStories^ aboutLove != ()} [Che parli d'amore.]
            ~ book = LIST_RANDOM(longStories ^ aboutLove)
            -> refresh_book_lists -> from_list_to_books
        
        //Qui vale per ogni scelta: se effettivamente posso scegliere quel tema, posso decidere di andare comunque avanti. Se invece quel tema è vuoto nella intersezione con la lunghezza della storia selezionata, passo avanti.
        TODO: come fare in modo che non venga proposto questo tasto se non ci sono altri temi disponibili?
        + {(readingDuration has Short && shortStories^ aboutLove != ()) or (readingDuration has Average && averageStories^ aboutLove != ()) or (readingDuration has Long && longStories^ aboutLove != ())} [No, vorrei un altro tema.]
                -> shuffle
        
        + {(readingDuration has Short && shortStories^ aboutLove != ()) or (readingDuration has Average && averageStories^ aboutLove != ()) or (readingDuration has Long && longStories^ aboutLove != ())} [Non ho più voglia di leggere.]
                ~ readingDuration = ()
                -> book_test_intro      
        
        + {(readingDuration has Short && shortStories^ aboutLove == ()) or (readingDuration has Average && averageStories^ aboutLove == ()) or (readingDuration has Long && longStories^ aboutLove == ())}
            -> shuffle
        
    = about_rage        
            
        + {readingDuration has Short && shortStories^ aboutRage != ()} [Che parli di rabbia.]
            ~ book = LIST_RANDOM(shortStories^ aboutRage)
            -> refresh_book_lists -> from_list_to_books
        
        + {readingDuration has Average && averageStories^ aboutRage != ()} [Che parli di rabbia.]
            ~ book = LIST_RANDOM(averageStories ^ aboutRage)
            -> refresh_book_lists -> from_list_to_books

        + {readingDuration has Long && longStories^ aboutRage != ()} [Che parli di rabbia.]
            ~ book = LIST_RANDOM(longStories ^ aboutRage)
            -> refresh_book_lists -> from_list_to_books            
        
        
        + {(readingDuration has Short && shortStories^ aboutRage != ()) or (readingDuration has Average && averageStories^ aboutRage != ()) or (readingDuration has Long && longStories^ aboutRage != ())}[No, vorrei un altro tema.]
                -> shuffle
                
                
        + {(readingDuration has Short && shortStories^ aboutRage != ()) or (readingDuration has Average && averageStories^ aboutRage != ()) or (readingDuration has Long && longStories^ aboutRage != ())} [Non ho più voglia di leggere.]
                ~ readingDuration = ()
                -> book_test_intro           
        
        + {(readingDuration has Short && shortStories^ aboutRage == ()) or (readingDuration has Average && averageStories^ aboutRage == ()) or (readingDuration has Long && longStories^ aboutRage == ())}
                -> shuffle          
            
            
    = about_body     
        + {readingDuration has Short && shortStories^ aboutBody != ()} [Che parli di corpi.]
            ~ book = LIST_RANDOM(shortStories^ aboutBody)
            -> refresh_book_lists -> from_list_to_books

        + {readingDuration has Average && averageStories^ aboutBody != ()} [Che parli di corpi.]
            ~ book = LIST_RANDOM(averageStories ^ aboutBody)
            -> refresh_book_lists -> from_list_to_books
        
        + {readingDuration has Long && longStories^ aboutBody != ()} [Che parli di corpi.]
            ~ book = LIST_RANDOM(longStories ^ aboutBody)
            -> refresh_book_lists -> from_list_to_books            
        
        //Scelte di uscita se ho rifiutato tutte le opzioni precedenti.
        + {(readingDuration has Short && shortStories^ aboutBody != ()) or (readingDuration has Average && averageStories^ aboutBody != ()) or (readingDuration has Long && longStories^ aboutBody != ())}[No, vorrei un altro tema.]
                -> shuffle
                
                
        + {(readingDuration has Short && shortStories^ aboutBody != ()) or (readingDuration has Average && averageStories^ aboutBody != ()) or (readingDuration has Long && longStories^ aboutBody != ())} [Non ho più voglia di leggere.]
                ~ readingDuration = ()
                -> book_test_intro           
        
        + {(readingDuration has Short && shortStories^ aboutBody == ()) or (readingDuration has Average && averageStories^ aboutBody == ()) or (readingDuration has Long && longStories^ aboutBody == ())}
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
    
    - aboutLove has book:
        ~ aboutLove -= book
    - aboutRage has book:
        ~ aboutRage -= book
    - aboutBody has book:
        ~ aboutBody -= book         

}
->->


=== from_list_to_books ===
{book:
    - AdriAllora:
        -> adri_allora
    - StenoArtico:
        -> steno_artico        
    - SalvatoreCiaccio:
        -> salvatore_ciaccio
        
    - CeciliaFormicola:
        -> cecilia_formicola   
        
    - ValFaustoLattanzio:
        -> val_fausto_lattanzio        


    - MauraSacca:
        -> maura_sacca
    - BeatriceSgravatto:
        -> beatrice_sgravatto        
    - LetiziaVaccarella:
        -> letizia_vaccarella
    - QueerginiaWolf:
        -> queerginia_wolf

    - else: Non ho trovato un racconto adatto, mi spiace
    -> book_test_intro
    
}


-> DONE

=== reread ===

{shuffle:
    - {readStories has AdriAllora: -> reread_adri_allora| -> reread}
    - {readStories has SalvatoreCiaccio: -> reread_salvatore_ciaccio| -> reread}
    - {readStories has StenoArtico: -> reread_steno_artico| -> reread}
    
    - {readStories has CeciliaFormicola: -> reread_cecilia_formicola| -> reread}    
    
    - {readStories has ValFaustoLattanzio: -> reread_val_lattanzio| ->reread}
    
    
    - {readStories has MauraSacca: -> reread_maura_sacca| -> reread}
    - {readStories has BeatriceSgravatto: -> reread_beatrice_sgravatto| -> reread}
    - {readStories has LetiziaVaccarella: -> reread_letizia_vaccarella| -> reread}
    - {readStories has QueerginiaWolf: -> reread_queerginia_wolf| -> reread}
}


    
    = reread_adri_allora
        + [Rileggo <i>XXX</i>di Adri Allora(333/ddd).]
                -> adri_allora
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
    
     = reread_steno_artico
        + [Rileggo <i> This anger</i> by StenoArtico (he/him, none).]
                -> steno_artico
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
                
    = reread_salvatore_ciaccio
        + [Rileggo <i>Il cancello</i> di Salvatore Ciaccio (ee/yyy).]
                -> salvatore_ciaccio
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 



                
    = reread_cecilia_formicola
        + [Rileggo <i>Getting warm</i> di Cecilia Formicola (she/her).]
                -> cecilia_formicola
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
 
 
 
 
    
    = reread_val_lattanzio
        + [Rileggo <i>Home</i> di Val Fausto Lattanzio (he/they).]
                -> val_fausto_lattanzio
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro        
 
 
 
 
     = reread_maura_sacca
        + [Rileggo "XXX" di Maura Sacca (ee/yyy).]
                -> maura_sacca
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro        
    
    = reread_beatrice_sgravatto
        + [Rileggo <i>TITOLO</i> di Beatrice Sgravatto (ee/yyy).]
                -> beatrice_sgravatto
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 

    = reread_letizia_vaccarella
        + [Rileggo <i>Dodici Stelle</i> di Letizia Vaccarella (she/her).]
                -> letizia_vaccarella
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro     
    
    = reread_queerginia_wolf
        + [Rileggo "XXX" di Queerginia Wolf/Marco Spelgatti (she/he/they).]
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