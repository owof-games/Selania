=== bedroom ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
<i>A presto!</i>
     + [chiudi]
-> main


//ELEMENTI CHE FINIRANNO NEL MENU QUANDO VERRA' CREATO

// === save ===
    // + {are_two_entities_together(MenuSave, PG)} [MenuSave]
    // <i>Il gioco è stato salvato!</i>
    // -
    // -> main

// === load ===
    // + {are_two_entities_together(MenuLoad, PG)} [Load]
    // <i>Il salvataggio è stato correttamente caricato.</i>
    // -
    // -> main

// === quit ===
   //  + {are_two_entities_together(MenuQuit, PG)} [MenuQuit]
    // <i>Progresso salvato. A presto!</i>
    // -
    // -> main
