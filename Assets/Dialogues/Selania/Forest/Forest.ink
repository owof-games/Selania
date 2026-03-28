=== forest ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
            
{debug: <i>La lista degli oggetti nella stanza è: {contentsForest}.}

{
    - forest == 1:
        <i>La foresta è canto sospeso.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
}

-> main




///Bottoni per i documenti

// === docDump_document
//     + {are_two_entities_together(PG, docDump)}[docDump]
//         -> horizontalS_storyletsDispatcher

// === docKitchen_document
//     + {are_two_entities_together(PG, docKitchen)}[docKitchen]
//         -> horizontalS_storyletsDispatcher

// === docGreenhouse_document
//     + {are_two_entities_together(PG, docGreenhouse)}[docGreenhouse]
//         -> horizontalS_storyletsDispatcher

// === docNest_document
//     + {are_two_entities_together(PG, docNest)}[docNest]
//         -> horizontalS_storyletsDispatcher             

// === docLibrary_document
//     + {are_two_entities_together(PG, docLibrary)}[docLibrary]
//         -> horizontalS_storyletsDispatcher   