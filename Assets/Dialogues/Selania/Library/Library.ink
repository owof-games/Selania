=== library ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
            
{debug: La lista degli oggetti nella stanza è: {libraryContents}.}

{library == 1:Nella biblioteca storie non lette cercano occhi accoglienti.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}

~ arrivingFrom = Library

// {library == 1:La biblioteca ti accoglie fremente.|{~Storie non lette cercano occhi accoglienti.|La poltrona raccoglie i pensieri di infinit3 Riscrittor3.|Le vecchie mensole si raccontano antiche rivoluzioni.|Le ragnatele cantano le proprie rabbie.|La lampada illumina l'inaspettato.}}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        
    
-> main


=== reading_place
    + (click) {are_two_entities_together(ReadingPlace, PG)} [ReadingPlace]
        {
            - click == 1:
            ~ saturationVar ++
            ~ move_entity(littleLibrary, Bedroom)
        }
        -> book_test_intro