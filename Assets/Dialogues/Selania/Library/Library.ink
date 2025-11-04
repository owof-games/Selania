=== library ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
            
    {debug: La lista degli oggetti nella stanza è: {libraryContents}.}
    
    {library == 1:Nella biblioteca storie non lette cercano occhi accoglienti.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
    ~ arrivingFrom = Library
    
    -> main




=== reading_place
    + (click) {are_two_entities_together(ReadingPlace, PG)} [ReadingPlace]
        {
            - click == 1:
            ~ saturationVar ++
            ~ move_entity(littleLibrary, Bedroom)
        }
        -> book_test_intro