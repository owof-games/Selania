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
            - about_ink_usage.sbadata or cultivable_test:
                ~ move_entity(Inventory, Forest)
        }
        ~ disableBigDialogue()
        @exit_from_rewriter_book
  
    
    - arrivingFrom == Greenhouse:
        ~ move_entity(PG, Greenhouse)
        ~ move_entity(RewriterBook, Greenhouse)
        {
            - about_ink_usage.sbadata or cultivable_test:
                ~ move_entity(Inventory, Greenhouse)
        }
        ~ disableBigDialogue()
        @exit_from_rewriter_book

    
    - arrivingFrom == Pond:
        ~ move_entity(PG, Pond)
        ~ move_entity(RewriterBook, Pond)
        {
            - about_ink_usage.sbadata or cultivable_test:
                ~ move_entity(Inventory, Pond)
        }
        ~ disableBigDialogue()
        @exit_from_rewriter_book
    
    - arrivingFrom == Kitchen:
        ~ move_entity(PG, Kitchen)
        ~ move_entity(RewriterBook, Kitchen)
        {
            - about_ink_usage.sbadata or cultivable_test:
                ~ move_entity(Inventory, Kitchen)
        }
        ~ disableBigDialogue()
        @exit_from_rewriter_book

    - arrivingFrom == Library:
        ~ move_entity(PG, Library)
        ~ move_entity(RewriterBook, Library)
        {
            - about_ink_usage.sbadata or cultivable_test:
                ~ move_entity(Inventory, Library)
        }
        ~ disableBigDialogue()
        @exit_from_rewriter_book
        
    - arrivingFrom == Nest:
        ~ move_entity(PG, Nest)
        ~ move_entity(RewriterBook, Nest)
        {
            - about_ink_usage.sbadata or cultivable_test:
                ~ move_entity(Inventory, Nest)
        }    
        ~ disableBigDialogue()
        @exit_from_rewriter_book
        
    - arrivingFrom == TrainStop:
        ~ move_entity(PG, TrainStop)
        ~ move_entity(RewriterBook, TrainStop)
        {
            - about_ink_usage.sbadata or cultivable_test:
                ~ move_entity(Inventory, TrainStop)
        }
        ~ disableBigDialogue()
        @exit_from_rewriter_book

    - arrivingFrom == Bedroom:
        ~ move_entity(PG, Bedroom)
        ~ disableBigDialogue()
        @exit_from_rewriter_book

    
    -else: ERROR: non riesco a trovare il luogo di provenienza; arrivingFrom = {arrivingFrom}
}
->->