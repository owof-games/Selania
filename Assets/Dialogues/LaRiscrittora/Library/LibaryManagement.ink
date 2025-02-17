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
    ->from_list_to_books






=== storyQuestions ===
//Una volta selezionati i temi, sostanzialmente si farà la stessa cosa per ogni tema. Solo l'ultima voce è diversa.
//Opzione extra: visto che uso [storia about qualcosa] posso randomizzare il contenuto lì dentro rimanendo comunque coerente [es random amore|relazioni] così da dare sempre senso di varietà. Da vedere se funziona o se si bara.
//Extra Extra: usare termini della classificazione libraria (vedi Tales of a librarian di Tori amos.

    + {shortStories != ()} [Un racconto brevissimo.]
        ~ readingDuration += Short
    + {averageStories != ()} [Una storia più lunga.]
        ~ readingDuration += Average
    + {longStories != ()} [Qualcosa che richieda qualche minuto.]
        ~ readingDuration += Long
    -
    -> about_love
        
    
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
        + {(readingDuration has Short && shortStories^ aboutLove != ()) or (readingDuration has Average && averageStories^ aboutLove != ()) or (readingDuration has Long && longStories^ aboutLove != ())} [No, vorrei un altro tema.]
                -> about_rage
        
        + {(readingDuration has Short && shortStories^ aboutLove == ()) or (readingDuration has Average && averageStories^ aboutLove == ()) or (readingDuration has Long && longStories^ aboutLove == ())}
            -> about_rage
        
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
                -> about_body
        
        + {(readingDuration has Short && shortStories^ aboutRage == ()) or (readingDuration has Average && averageStories^ aboutRage == ()) or (readingDuration has Long && longStories^ aboutRage == ())}
            -> about_body           
            
            
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
        + [Voglio riprovare uno dei temi precedenti.]
            -> about_love
        + [Non ho più voglia di leggere.]
            ~ readingDuration = ()
            -> book_test_intro
        
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
    - {readStories has Val} 
        -> title_val
    - {readStories has Francesco}
        -> title_fra
    - {readStories has Ceci}
        -> title_ceci
    - {readStories has Gabri}
        -> title_gabri
    - {readStories has Mario}
        -> title_mario
    - {readStories has Maura}
        -> title_maura
    - {readStories has Leti}
        -> title_leti
}

    = title_val
        + [Rileggo il racconto di Val.]
                -> libro_val
        + [Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro        
    
    = title_leti
        + [Rileggo il racconto di Leti.]
                -> libro_leti
        + [Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
    
    = title_fra
        + [Rileggo il racconto di Francesco.]
                -> libro_francesco
        + [Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
    
    = title_ceci
        + [Rileggo il racconto di Ceci.]
                -> libro_ceci
        + [Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
    
    = title_gabri
        + [Rileggo il racconto di Gabri.]
                -> libro_gabri
        + [Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
    
    = title_mario
        + [Rileggo il racconto di Mario.]
                -> libro_mario
        + [Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
    
    = title_maura
        + [Rileggo il racconto di Maura.]
                -> libro_maura
        + [Vorrei rileggere qualcosa di diverso.]
                -> reread
        + [Ho cambiato idea, voglio una storia nuova.]
                -> book_test_intro 
    


->->
