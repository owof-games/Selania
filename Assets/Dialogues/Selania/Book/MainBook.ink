=== main_book ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
{debug: <i>La lista degli oggetti nella stanza è: {bookContents}.}
{debug: <i>Mi trovo in {entity_location(PG)}.}
    + [Qualcosa]
    //{entity_location(FrogRecap)}
    -> main


=== book_exit_node ===
//Soluzione temporanea per poter uscire dal libro, poi creo funzione
+ {are_two_entities_together(PG, BookExit)} [BookExit]
    ~ move_entity(PG, Forest)
    -> forest