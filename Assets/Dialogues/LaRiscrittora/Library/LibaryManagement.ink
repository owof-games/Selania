//Variabili per la gestione della biblioteca
LIST books = libroCeci, libroGabri, libroGreta, libroAnna
VAR readBooks = ()
VAR XBooks = (libroCeci, libroGabri, libroAnna)
VAR YBooks = (libroCeci, libroGreta, libroAnna)
VAR ZBooks = (libroGabri, libroGreta)
    //Libro che verrà proposto
    VAR book = ()
    
    
    
=== books_test ===
+ {XBooks != ()}Vorrei un book x
    + + {XBooks ^ ZBooks != ()} Con qualcosa di z
        ~ book = LIST_MIN(XBooks ^ ZBooks)
        {book}
        ~ XBooks -= book
        ~ ZBooks -= book
        ~ readBooks += book
        -> from_list_to_books
    + + {XBooks ^ YBooks!= ()} Con qualcosa di y    
        ~ book = LIST_MIN(XBooks ^ YBooks)
        {book}
        ~ XBooks -= book
        ~ YBooks -= book
        ~ readBooks += book
        -> from_list_to_books
    + + No, vorrei qualcosa di diverso!
        -> books_test

+ {YBooks != ()}Vorrei un book y
    + + {YBooks ^ ZBooks != ()} Con qualcosa di z
        ~ book = LIST_MIN(YBooks ^ ZBooks)
        ~ ZBooks -= book
        ~ YBooks -= book
        ~ readBooks += book
        -> from_list_to_books
    + + {XBooks ^ YBooks != ()} Con qualcosa di x    
        ~ book = LIST_MIN(XBooks ^ YBooks)
        ~ XBooks -= book
        ~ YBooks -= book
        ~ readBooks += book
        -> from_list_to_books
    + + No, vorrei qualcosa di diverso!
        -> books_test
        

+ {ZBooks != ()}Vorrei un book z
    + + {YBooks ^ ZBooks != ()} Con qualcosa di y
        ~ book = LIST_MIN(YBooks ^ ZBooks)
        ~ ZBooks -= book
        ~ YBooks -= book
        ~ readBooks += book
        -> from_list_to_books
    + + {XBooks ^ ZBooks != ()} Con qualcosa di x    
        ~ book = LIST_MIN(XBooks ^ ZBooks)
        ~ XBooks -= book
        ~ ZBooks -= book
        ~ readBooks += book
        -> from_list_to_books
    + + No, vorrei qualcosa di diverso!
        -> books_test
        
+ {readBooks != ()} Vorrei qualcosa che ho già letto
        -> rereading
+ Mmm, mi è passata la voglia di leggere
    -> library
-
-> DONE

=== from_list_to_books ===
{book:
    - libroAnna:
        -> libro_anna
    - libroCeci:
        ->libro_ceci
    - libroGabri:
        -> libro_gabri
    - libroGreta:
        -> libro_greta

    - else: Non ho trovato un book adatto, mi spiace
    -> books_test
    
}


-> DONE

=== rereading ===
    + {readBooks has libroAnna} Rileggi il racconto di Anna
        -> libro_anna
    + {readBooks has libroCeci} Rileggi il racconto di Ceci
        ->libro_ceci
    + {readBooks has libroGabri} Rileggi il racconto di Gabri
        -> libro_gabri
    + {readBooks has libroGreta} Rileggi il racconto di Greta
        -> libro_greta
    + Ho cambiato idea, voglio una storia nuova.
        -> books_test
    -    
-> library

