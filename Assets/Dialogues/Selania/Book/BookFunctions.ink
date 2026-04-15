//Variabile per tracciare la stanza in cui mi trovo quando apro il libro
    VAR book_arrivingFromTracking = ()



=== book_tracking_arrive ===
//Questa funzione serve per tracciare da quale luogo arriviamo nel libro
// in tutti i casi in cui c'è @exit_from_rewriter_book, non andrà più avanti: in UpdateUI di DialogueManagerSingleInk viene fatto switch al flow di default, e quindi smette di eseguire questo flow

{
    - book_arrivingFromTracking == Forest:
        ~ move_entity(PG, Forest)
        ~ move_entity(Grimoire, Forest)
        ~ disableBigDialogue()

        @exit_from_rewriter_book
    
    - book_arrivingFromTracking == Dump:
        ~ move_entity(PG, Dump)
        ~ move_entity(Grimoire, Dump)
        ~ disableBigDialogue()

        @exit_from_rewriter_book
    
    - book_arrivingFromTracking == Greenhouse:
        ~ move_entity(PG, Greenhouse)
        ~ move_entity(Grimoire, Greenhouse)
        ~ disableBigDialogue()

        @exit_from_rewriter_book

    
    - book_arrivingFromTracking == Pond:
        ~ move_entity(PG, Pond)
        ~ move_entity(Grimoire, Pond)
        ~ disableBigDialogue()

        @exit_from_rewriter_book
    
    - book_arrivingFromTracking == Kitchen:
        ~ move_entity(PG, Kitchen)
        ~ move_entity(Grimoire, Kitchen)
        ~ disableBigDialogue()
        @exit_from_rewriter_book

    - book_arrivingFromTracking == Library:
        ~ move_entity(PG, Library)
        ~ move_entity(Grimoire, Library)
        ~ disableBigDialogue()

        @exit_from_rewriter_book
        
    - book_arrivingFromTracking == Nest:
        ~ move_entity(PG, Nest)
        ~ move_entity(Grimoire, Nest)
        ~ disableBigDialogue()

        @exit_from_rewriter_book
        
    - book_arrivingFromTracking == TrainStop:
        ~ move_entity(PG, TrainStop)
        ~ move_entity(Grimoire, TrainStop)
        ~ disableBigDialogue()

        @exit_from_rewriter_book

    - book_arrivingFromTracking == Bedroom:
        ~ move_entity(PG, Bedroom)
        ~ disableBigDialogue()

        @exit_from_rewriter_book

    -else: ERROR: non riesco a trovare il luogo di provenienza; book_arrivingFromTracking = {book_arrivingFromTracking}
}

@exit_from_rewriter_book
-> main