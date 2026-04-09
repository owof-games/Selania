=== library ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
            
{debug: La lista degli oggetti nella stanza è: {contentsLibrary}.}
    
{
    -library == 1:
        {charTag(witch_tag(), witch_state())}   <i>Nella biblioteca storie non lette cercano cuori accoglienti.
}

-> main

=== reading_place
    + (click) {are_two_entities_together(ReadingPlace, PG)} [ReadingPlace]
        {
            - click == 1:
                ~ move_entity(libraryOpened, Bedroom)
        }
        -> book_test_intro