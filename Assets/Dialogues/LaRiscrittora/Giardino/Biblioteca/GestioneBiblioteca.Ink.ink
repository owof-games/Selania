
//Variabili per la gestione della biblioteca
LIST libri = libroCeci, libroGabri, libroGreta, libroAnna
VAR libriLetti = ()
VAR libriX = (libroCeci, libroGabri, libroAnna)
VAR libriY = (libroCeci, libroGreta, libroAnna)
VAR libriZ = (libroGabri, libroGreta)
    //Libro che verrà proposto
    VAR libro = ()
    
    
    
=== test_libri ===
+ {libriX != ()}Vorrei un libro x
    + + {libriX ^ libriZ != ()} Con qualcosa di z
        ~ libro = LIST_MIN(libriX ^ libriZ)
        {libro}
        ~ libriX -= libro
        ~ libriZ -= libro
        ~ libriLetti += libro
        -> da_lista_a_libri
    + + {libriX ^ libriY!= ()} Con qualcosa di y    
        ~ libro = LIST_MIN(libriX ^ libriY)
        {libro}
        ~ libriX -= libro
        ~ libriY -= libro
        ~ libriLetti += libro
        -> da_lista_a_libri
    + + No, vorrei qualcosa di diverso!
        -> test_libri

+ {libriY != ()}Vorrei un libro y
    + + {libriY ^ libriZ != ()} Con qualcosa di z
        ~ libro = LIST_MIN(libriY ^ libriZ)
        ~ libriZ -= libro
        ~ libriY -= libro
        ~ libriLetti += libro
        -> da_lista_a_libri
    + + {libriX ^ libriY != ()} Con qualcosa di x    
        ~ libro = LIST_MIN(libriX ^ libriY)
        ~ libriX -= libro
        ~ libriY -= libro
        ~ libriLetti += libro
        -> da_lista_a_libri
    + + No, vorrei qualcosa di diverso!
        -> test_libri
        

+ {libriZ != ()}Vorrei un libro z
    + + {libriY ^ libriZ != ()} Con qualcosa di y
        ~ libro = LIST_MIN(libriY ^ libriZ)
        ~ libriZ -= libro
        ~ libriY -= libro
        ~ libriLetti += libro
        -> da_lista_a_libri
    + + {libriX ^ libriZ != ()} Con qualcosa di x    
        ~ libro = LIST_MIN(libriX ^ libriZ)
        ~ libriX -= libro
        ~ libriZ -= libro
        ~ libriLetti += libro
        -> da_lista_a_libri
    + + No, vorrei qualcosa di diverso!
        -> test_libri
        
+ {libriLetti != ()} Vorrei qualcosa che ho già letto
        -> rilettura
+ Mmm, mi è passata la voglia di leggere
    -> hub_biblioteca
-
-> DONE

=== da_lista_a_libri ===
{libro:
    - libroAnna:
        -> libro_anna
    - libroCeci:
        ->libro_ceci
    - libroGabri:
        -> libro_gabri
    - libroGreta:
        -> libro_greta

    - else: Non ho trovato un libro adatto, mi spiace
    -> test_libri
    
}


-> DONE

=== rilettura ===
    + {libriLetti has libroAnna} Rileggi il racconto di Anna
        -> libro_anna
    + {libriLetti has libroCeci} Rileggi il racconto di Ceci
        ->libro_ceci
    + {libriLetti has libroGabri} Rileggi il racconto di Gabri
        -> libro_gabri
    + {libriLetti has libroGreta} Rileggi il racconto di Greta
        -> libro_greta
    + Ho cambiato idea, voglio una storia nuova.
        -> test_libri
    -    
-> hub_biblioteca

