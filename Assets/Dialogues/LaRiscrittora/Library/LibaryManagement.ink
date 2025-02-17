//Variabili per la gestione della biblioteca
LIST story = Ceci, Gabri, Mario, Francesco, Val, Maura, Leti

//Liste per distinguere storie lette e non
    VAR unreadStories = (Ceci, Gabri, Mario, Francesco, Val, Maura, Leti)
    VAR readStories = ()

//Raggrupamento per lunghezza
    LIST storiesDuration = Short, Average, Long
    VAR readingDuration = ()
    
    VAR shortStories = (Maura, Ceci)
    VAR averageStories = (Val, Mario)
    VAR longStories = (Gabri, Francesco, Leti)

//Books about...
VAR aboutLove = (Ceci, Gabri, Francesco, Val)
VAR aboutRage = (Ceci, Mario, Francesco, Maura)
VAR aboutBody = (Gabri, Mario, Val, Leti)
VAR aboutHome = (Val, Leti)
VAR aboutSelf = (Leti)
VAR aboutForgiveness = ()
VAR aboutDeath = (Maura)
VAR aboutSelfLove = (Val)
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
            ~ readingDuration += Short
        + {averageStories != ()} [Una storia più lunga.]
            ~ readingDuration += Average
        + {longStories != ()} [Qualcosa che richieda qualche minuto.]
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
    - Francesco:
        -> libro_francesco
    - Ceci:
        ->libro_ceci
    - Gabri:
        -> libro_gabri
    - Mario:
        -> libro_mario
    - Val:
        -> libro_val
    - Maura:
        -> libro_maura
    - Leti:
        -> libro_leti

    - else: Non ho trovato un racconto adatto, mi spiace
    -> book_test_intro
    
}


-> DONE

=== reread ===


{shuffle:
    - {readStories has Val: -> title_val| ->reread}
    - {readStories has Francesco: -> title_fra| -> reread}
    - {readStories has Ceci: -> title_ceci| -> reread}
    - {readStories has Gabri: -> title_gabri| -> reread}
    - {readStories has Mario: -> title_mario| -> reread}
    - {readStories has Maura: -> title_maura| -> reread}
    - {readStories has Leti: -> title_leti| -> reread}
}

    = title_val
        + [Rileggo il racconto di Val.]
                -> libro_val
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro        
    
    = title_leti
        + [Rileggo il racconto di Leti.]
                -> libro_leti
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
    
    = title_fra
        + [Rileggo il racconto di Francesco.]
                -> libro_francesco
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
    
    = title_ceci
        + [Rileggo il racconto di Ceci.]
                -> libro_ceci
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
    
    = title_gabri
        + [Rileggo il racconto di Gabri.]
                -> libro_gabri
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
    
    = title_mario
        + [Rileggo il racconto di Mario.]
                -> libro_mario
        + {LIST_COUNT(readStories) > 1}[Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
    
    = title_maura
        + [Rileggo il racconto di Maura.]
                -> libro_maura
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