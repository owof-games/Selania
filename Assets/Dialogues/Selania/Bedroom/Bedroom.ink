=== bedroom ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
{debug: <i>La lista degli oggetti nella stanza è: {bedroomContents}.}
    
    ~ book_arrivingFromTracking = Bedroom

    {
        - bedroom == 1:
            Un morbido letto è comparso, in attesa di membra stanche.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                -> main

    }        
  
        -> main





=== settings_management
//Gestione delle impostazioni, raggiungibie dal libro e dalla camera da letto
    + {are_two_entities_together(PG, settings)} [settings]
        In futuro qui {player_name} accederà alle impostazioni.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> main
            
    + {are_two_entities_together(PG, SettingsBookVersion)} [SettingsBookVersion]
        In futuro qui {player_name} accederà alle impostazioni.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> rewriter_book_with_flow