VAR arrivingFrom = ()
VAR bookBGVariations = 0
LIST bookBGStates = bookBGZero, bookBGOne, bookBGTwo, bookBGThree, bookBGFour

=== book_backgrounds_calculator ===
    //cresce a metà storia pg, tranne pg5 che cresce a fine storia, completamento coltivabili e via di seguito.
    {
        - cultivable == () && not plus_cultivable:
            -> plus_cultivable
    }
    
        {
        - bookBGVariations ==  4:
                ~ bookBGStates += ()
                ~ bookBGStates += bookBGFour
                
        - bookBGVariations ==  3:
                ~ bookBGStates += ()
                ~ bookBGStates += bookBGThree
        
        - bookBGVariations ==  2:
                ~ bookBGStates += ()
                ~ bookBGStates += bookBGTwo    
                
        - bookBGVariations ==  1:
                ~ bookBGStates += ()
                ~ bookBGStates += bookBGOne          
        - else:
                ~ bookBGStates += ()
                ~ bookBGStates += bookBGZero

    } 
        ->->
->->

= plus_cultivable
//Se ho finito i coltivabili, si accresce il valore
{debug: la lista dei coltivabili è vuota, perché = {cultivable}, il numero di passaggi da plus_cultivable è {plus_cultivable} e per questo incremento di uno bookBGVariations.}
    ~ bookBGVariations ++
->->

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
    
    - arrivingFrom == GreenhouseMiddlePath:
        ~ move_entity(PG, GreenhouseMiddlePath)
        ~ move_entity(RewriterBook, GreenhouseMiddlePath)
        {
            - gifts_and_ink.sbadata or cultivable_test:
                ~ move_entity(Inventory, GreenhouseMiddlePath)
        }
        ~ arrivingFrom = ()
        ~ disableBigDialogue()
        -> greenhouse_middle_path
        
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
    

}
->->