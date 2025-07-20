VAR arrivingFrom = ()
LIST bookBGStates = (bookBGZero), bookBGOne, bookBGTwo, bookBGThree


=== book_backgrounds_calculator ===
    //passaggio book calculator backgrounds
        {
        - from_list_to_books && (lichene_degli_abissi.step_tre or edera_delle_amanti.step_tre or canto_delle_compagne.step_tre or la_spazzata.step_tre or bacca_della_addolorata.step_tre or non_ti_scordar_di_te.step_tre or brina_dell_impossibile.step_tre):
                ~ bookBGStates += ()
                ~ bookBGStates += bookBGThree
        
        - (lichene_degli_abissi.step_tre or edera_delle_amanti.step_tre or canto_delle_compagne.step_tre or la_spazzata.step_tre or bacca_della_addolorata.step_tre or non_ti_scordar_di_te.step_tre or brina_dell_impossibile.step_tre) && (welcome or talking_fungus):
                ~ bookBGStates += ()
                ~ bookBGStates += bookBGTwo
            
        - welcome or talking_fungus:
                ~ bookBGStates += ()
                ~ bookBGStates += bookBGOne
            
        - else:
                ~ bookBGStates += ()
                ~ bookBGStates += bookBGZero

    } 
        ->->
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