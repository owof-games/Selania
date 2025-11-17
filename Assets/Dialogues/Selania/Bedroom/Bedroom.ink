=== bedroom ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
{debug: <i>La lista degli oggetti nella stanza è: {bedroomContents}.}
            ~ book_arrivingFromTracking = Bedroom

    {
        - bedroom == 1:
            Un letto è comparso, e attende chi ha bisogno di riposare.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                -> main

    }        
  
        -> main


=== settings_management
    + {are_two_entities_together(PG, settings)} [settings]
        In futuro qui troverai le impostazioni.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> main
            
    + {are_two_entities_together(PG, SettingsBookVersion)} [SettingsBookVersion]
    In futuro qui troverai le impostazioni.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> rewriter_book_with_flow