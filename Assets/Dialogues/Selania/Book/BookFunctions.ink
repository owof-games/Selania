VAR arrivingFrom = ()


=== book_backgrounds_calculator ===
TODO: codice per cambio background libro
    //passaggio book calculator backgrounds
->->


=== book_tracking_arrive ===
//Questa funzione serve per tracciare da quale luogo arriviamo nel libro
{
    - arrivingFrom == Forest:
        ~ move_entity(PG, Forest)
        ~ move_entity(RewriterBook, Forest)
        ~ move_entity(Inventory, Forest)
        ~ arrivingFrom = ()
        -> forest
    
    - arrivingFrom == Greenhouse:
        ~ move_entity(PG, Greenhouse)
        ~ move_entity(RewriterBook, Greenhouse)
        ~ move_entity(Inventory, Greenhouse)
        ~ arrivingFrom = ()
        -> greenhouse
    
    - arrivingFrom == GreenhouseMiddlePath:
        ~ move_entity(PG, GreenhouseMiddlePath)
        ~ move_entity(RewriterBook, GreenhouseMiddlePath)
        ~ move_entity(Inventory, GreenhouseMiddlePath)
        ~ arrivingFrom = ()
        -> greenhouse_middle_path
        
    - arrivingFrom == Laboratory:
        ~ move_entity(PG, Laboratory)
        ~ move_entity(RewriterBook, Laboratory)
        ~ move_entity(Inventory, Laboratory)
        ~ arrivingFrom = ()
        -> laboratory

    - arrivingFrom == Library:
        ~ move_entity(PG, Library)
        ~ move_entity(RewriterBook, Library)
        ~ move_entity(Inventory, Library)
        ~ arrivingFrom = ()
        -> library
        
    - arrivingFrom == Nest:
        ~ move_entity(PG, Nest)
        ~ move_entity(RewriterBook, Nest)
        ~ move_entity(Inventory, Nest)
        ~ arrivingFrom = ()
        -> nest
        
    - arrivingFrom == TrainStop:
        ~ move_entity(PG, TrainStop)
        ~ move_entity(RewriterBook, TrainStop)
        ~ move_entity(Inventory, TrainStop)
        ~ arrivingFrom = ()
        -> train_stop
    

}
->->