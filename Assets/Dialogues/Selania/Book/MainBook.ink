=== main_book ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
{debug: <i>La lista degli oggetti nella stanza è: {bookContents}.}
{debug: <i>Mi trovo in {entity_location(PG)}.}
    -> main


=== book_exit_node ===
+ {are_two_entities_together(PG, BookExit)} [BookExit]
    -> book_tracking_arrive