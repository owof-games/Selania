=== bedroom ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}

{debug: <i>La lista degli oggetti nella stanza è: {contentsBedroom}.}

{
    - bedroom == 1:
        <i>Un morbido letto è comparso, in attesa di membra stanche.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
}        

-> main

=== settings_management
//Gestione delle impostazioni, raggiungibile dal libro e dalla camera da letto
    + {are_two_entities_together(PG, Settings)} [Settings]
        <i>Qui in futuro si potranno modificare le impostazioni.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> main
            
    + {are_two_entities_together(PG, SettingsBookVersion)} [SettingsBookVersion]
        <i>Qui in futuro si potranno modificare le impostazioni.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> rewriter_book_with_flow