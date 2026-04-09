=== forest ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
            
{debug: <i>La lista degli oggetti nella stanza è: {contentsForest}.}

{
    - forest == 1:
        {charTag(TheWitch, witch_state())}   <i>La foresta è canto sospeso.</i>
}

-> main




///Bottoni per i documenti

=== docDump_document
    + {are_two_entities_together(PG, docDump)}[docDump]
        -> horizontalS_storyletsDispatcher

=== docKitchen_document
    + {are_two_entities_together(PG, docKitchen)}[docKitchen]
        -> horizontalS_storyletsDispatcher

=== docGreenhouse_document
    + {are_two_entities_together(PG, docGreenhouse)}[docGreenhouse]
        -> horizontalS_storyletsDispatcher

=== docNest_document
    + {are_two_entities_together(PG, docNest)}[docNest]
        -> horizontalS_storyletsDispatcher             

=== docLibrary_document
    + {are_two_entities_together(PG, docLibrary)}[docLibrary]
        -> horizontalS_storyletsDispatcher   