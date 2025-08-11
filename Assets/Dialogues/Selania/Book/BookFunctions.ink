VAR arrivingFrom = ()
VAR bookBGVariations = 0
LIST bookBGStates = bookBGZero, bookBGOne, bookBGTwo, bookBGThree, bookBGFour, bookBGFive



=== book_tracking_arrive ===
//Questa funzione serve per tracciare da quale luogo arriviamo nel libro

{
    - arrivingFrom == Forest:
        ~ move_entity(PG, Forest)
        ~ move_entity(RewriterBook, Forest)
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Forest)
        }
        ~ arrivingFrom = ()
        ~ disableBigDialogue()
        -> forest
    
    - arrivingFrom == Greenhouse:
        ~ move_entity(PG, Greenhouse)
        ~ move_entity(RewriterBook, Greenhouse)
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Greenhouse)
        }
        ~ arrivingFrom = ()
        ~ disableBigDialogue()
        -> greenhouse
    
    - arrivingFrom == Pond:
        ~ move_entity(PG, Pond)
        ~ move_entity(RewriterBook, Pond)
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Pond)
        }
        ~ arrivingFrom = ()
        ~ disableBigDialogue()
        -> pond
        
    - arrivingFrom == Laboratory:
        ~ move_entity(PG, Laboratory)
        ~ move_entity(RewriterBook, Laboratory)
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Laboratory)
        }
        ~ arrivingFrom = ()
        ~ disableBigDialogue()
        -> laboratory

    - arrivingFrom == Library:
        ~ move_entity(PG, Library)
        ~ move_entity(RewriterBook, Library)
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Library)
        }
        ~ arrivingFrom = ()
        ~ disableBigDialogue()
        -> library
        
    - arrivingFrom == Nest:
        ~ move_entity(PG, Nest)
        ~ move_entity(RewriterBook, Nest)
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, Nest)
        }    
        ~ arrivingFrom = ()
        ~ disableBigDialogue()
        -> nest
        
    - arrivingFrom == TrainStop:
        ~ move_entity(PG, TrainStop)
        ~ move_entity(RewriterBook, TrainStop)
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, TrainStop)
        }
        ~ arrivingFrom = ()
        ~ disableBigDialogue()
        -> train_stop

    - arrivingFrom == Bedroom:
        ~ move_entity(PG, Bedroom)
        ~ arrivingFrom = ()
        ~ disableBigDialogue()
        -> bedroom   
    
    -else: ERROR: non riesco a trovare il luogo di provenienza
}
->->