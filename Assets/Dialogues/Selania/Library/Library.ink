=== library ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
            
    {debug: La lista degli oggetti nella stanza è: {contentsLibrary}.}
    
    {library == 1:<i>Nella biblioteca storie non lette cercano cuori accoglienti.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        
        -> witch_frog_mission_notifier ->
        -> talk_to_me ->
    
    ~ book_arrivingFromTracking = Library
    
    -> main




=== reading_place
    + (click) {are_two_entities_together(ReadingPlace, PG)} [ReadingPlace]
        {
            - click == 1:
            ~ saturationVar ++
            ~ move_entity(libraryOpened, Bedroom)
        }
        -> book_test_intro