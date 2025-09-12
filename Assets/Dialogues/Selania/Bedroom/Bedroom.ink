=== bedroom ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
{debug: <i>La lista degli oggetti nella stanza è: {bedroomContents}.}
            ~ arrivingFrom = ()
            ~ arrivingFrom = Bedroom
    
    {
        - fourthTier && fifthStory ==StoryEnded:
            <i>Frasi legate al finale del gioco</i>.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        
        -fourthTier:
            <i>Frasi legate al quarto tier</i>.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        
        -thirdTier:
            {~<i>Qualcosa cambia in {name}, qualcosa cambia nella stanza.|<i>L'aria sa di possibilità.|<i>Quale canzone {name} vorrebbe cantare prima di andarsene?}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
    
        -secondTier:
            <i>Frasi legate al secondo tier</i>.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
    
        -firstTier:
            {
                - name != "Senza nome": <i>{~Forse {name} sente il bisogno di riposare un poco?|Ci sono ricordi di queste passeggiate che {name} porterà con sé?|{name} ha imparato qualcosa dall3 su3 nuov3 amic3?}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                
                - else: <i>Il letto attende una persona bisognosa di una pausa.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
            }
            
        - else:
            <i>Il letto attende una persona bisognosa di una pausa.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
    }    
        -> main


=== settings_management
    + {are_two_entities_together(PG, settings)} [settings]
        <i>In futuro qui troverai le impostazioni.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
            -> main
            
    + {are_two_entities_together(PG, SettingsBookVersion)} [SettingsBookVersion]
    <i>In futuro qui troverai le impostazioni.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
            -> main