=== main_book ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
{debug: <i>La lista degli oggetti nella stanza è: {bookContents}.}
{debug: <i>Mi trovo in {entity_location(PG)}.}

//Gestione suoni (per evitare che mi parta il suono del treno quando si è attivato e apro e chiudo il libro e non ho cambiato luogo)
    {
        - safekeepingContents hasnt TrainNoiseComing:
            ~ move_entity(TrainNoiseComing, Safekeeping)
    }
    {
        - safekeepingContents hasnt TrainNoiseGoingAway:
            ~ move_entity(TrainNoiseGoingAway, Safekeeping)
    }


    -> main


=== book_exit_node ===
+ {are_two_entities_together(PG, BookExit)} [BookExit]
    -> book_tracking_arrive
    
    

// questo knot viene chiamato esplicitamente da ink su un flow separato quando si fa click sul bottone del rewriter book
=== rewriter_book_with_flow ===
~ move_entity(PG, BookPlace)
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}

@interact
<- first_character_recap
<- second_character_recap
<- third_character_recap
<- fourth_character_recap
<- fifth_character_recap
<- frog_character_recap
<- dog_character_recap
<- witch_character_recap
<- greenhouse_recap
<- kitchen_recap
<- nest_recap
<- rules_recap
<- settings_management
+ [BookExit]
    -> book_tracking_arrive

+ -> rewriter_book_with_flow