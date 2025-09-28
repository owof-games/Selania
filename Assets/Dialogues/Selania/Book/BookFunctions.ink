VAR arrivingFrom = ()
VAR bookBGVariations = 0
LIST bookBGStates = bookBGZero, bookBGOne, bookBGTwo, bookBGThree, bookBGFour, bookBGFive



=== book_tracking_arrive ===
//Questa funzione serve per tracciare da quale luogo arriviamo nel libro
// in tutti i casi in cui c'è @exit_from_rewriter_book, non andrà più avanti: in UpdateUI di DialogueManagerSingleInk viene fatto switch al flow di default, e quindi smette di eseguire questo flow

{
    - arrivingFrom == Forest:
        ~ move_entity(PG, Forest)
        ~ move_entity(RewriterBook, Forest)
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Forest)
        }
        ~ disableBigDialogue()
        @exit_from_rewriter_book
        // -> forest
    
    - arrivingFrom == Greenhouse:
        ~ move_entity(PG, Greenhouse)
        ~ move_entity(RewriterBook, Greenhouse)
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Greenhouse)
        }
        ~ disableBigDialogue()
        @exit_from_rewriter_book
        // -> greenhouse
    
    - arrivingFrom == Pond:
        ~ move_entity(PG, Pond)
        ~ move_entity(RewriterBook, Pond)
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Pond)
        }
        ~ disableBigDialogue()
        @exit_from_rewriter_book
        // -> pond
        
    - arrivingFrom == Laboratory:
        ~ move_entity(PG, Laboratory)
        ~ move_entity(RewriterBook, Laboratory)
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Laboratory)
        }
        ~ disableBigDialogue()
        @exit_from_rewriter_book
        // -> laboratory

    - arrivingFrom == Library:
        ~ move_entity(PG, Library)
        ~ move_entity(RewriterBook, Library)
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Library)
        }
        ~ disableBigDialogue()
        @exit_from_rewriter_book
        // -> library
        
    - arrivingFrom == Nest:
        ~ move_entity(PG, Nest)
        ~ move_entity(RewriterBook, Nest)
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Nest)
        }    
        ~ disableBigDialogue()
        @exit_from_rewriter_book
        // -> nest
        
    - arrivingFrom == TrainStop:
        ~ move_entity(PG, TrainStop)
        ~ move_entity(RewriterBook, TrainStop)
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, TrainStop)
        }
        ~ disableBigDialogue()
        @exit_from_rewriter_book
        // -> train_stop

    - arrivingFrom == Bedroom:
        ~ move_entity(PG, Bedroom)
        ~ disableBigDialogue()
        @exit_from_rewriter_book
        // -> bedroom   
    
    -else: ERROR: non riesco a trovare il luogo di provenienza; arrivingFrom = {arrivingFrom}
}
->->