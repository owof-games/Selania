//Variabile per tracciare la stanza in cui mi trovo quando apro il libro
    VAR book_arrivingFromTracking = ()

//Variabili per la gestione della variazione del background del libro: uso un contatore che aumenta e che poi si sposta sulla lista dei possibili stati, che è sempre progressiva.
    VAR book_BGVariations = 0
    LIST book_BGStates = bookBGZero, bookBGOne, bookBGTwo, bookBGThree, bookBGFour, bookBGFive



=== book_tracking_arrive ===
//Questa funzione serve per tracciare da quale luogo arriviamo nel libro
// in tutti i casi in cui c'è @exit_from_rewriter_book, non andrà più avanti: in UpdateUI di DialogueManagerSingleInk viene fatto switch al flow di default, e quindi smette di eseguire questo flow

{
    - book_arrivingFromTracking == Forest:
        ~ move_entity(PG, Forest)
        ~ move_entity(RewriterBook, Forest)
        {
            - you_are_a_rewriter.sbadata or cultivable_test:
                ~ move_entity(Backpack, Forest)
        }
        ~ disableBigDialogue()
        @exit_from_rewriter_book
  
    
    - book_arrivingFromTracking == Greenhouse:
        ~ move_entity(PG, Greenhouse)
        ~ move_entity(RewriterBook, Greenhouse)
        {
            - you_are_a_rewriter.sbadata or cultivable_test:
                ~ move_entity(Backpack, Greenhouse)
        }
        ~ disableBigDialogue()
        @exit_from_rewriter_book

    
    - book_arrivingFromTracking == Pond:
        ~ move_entity(PG, Pond)
        ~ move_entity(RewriterBook, Pond)
        {
            - you_are_a_rewriter.sbadata or cultivable_test:
                ~ move_entity(Backpack, Pond)
        }
        ~ disableBigDialogue()
        @exit_from_rewriter_book
    
    - book_arrivingFromTracking == Kitchen:
        ~ move_entity(PG, Kitchen)
        ~ move_entity(RewriterBook, Kitchen)
        {
            - you_are_a_rewriter.sbadata or cultivable_test:
                ~ move_entity(Backpack, Kitchen)
        }
        ~ disableBigDialogue()
        @exit_from_rewriter_book

    - book_arrivingFromTracking == Library:
        ~ move_entity(PG, Library)
        ~ move_entity(RewriterBook, Library)
        {
            - you_are_a_rewriter.sbadata or cultivable_test:
                ~ move_entity(Backpack, Library)
        }
        ~ disableBigDialogue()
        @exit_from_rewriter_book
        
    - book_arrivingFromTracking == Nest:
        ~ move_entity(PG, Nest)
        ~ move_entity(RewriterBook, Nest)
        {
            - you_are_a_rewriter.sbadata or cultivable_test:
                ~ move_entity(Backpack, Nest)
        }    
        ~ disableBigDialogue()
        @exit_from_rewriter_book
        
    - book_arrivingFromTracking == TrainStop:
        ~ move_entity(PG, TrainStop)
        ~ move_entity(RewriterBook, TrainStop)
        {
            - you_are_a_rewriter.sbadata or cultivable_test:
                ~ move_entity(Backpack, TrainStop)
        }
        ~ disableBigDialogue()
        @exit_from_rewriter_book

    - book_arrivingFromTracking == Bedroom:
        ~ move_entity(PG, Bedroom)
        ~ disableBigDialogue()
        @exit_from_rewriter_book

    
    -else: ERROR: non riesco a trovare il luogo di provenienza; book_arrivingFromTracking = {book_arrivingFromTracking}
}
-> main