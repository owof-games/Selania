=== nest ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}

{debug: <i>La lista degli oggetti nella stanza è: {contentsNest}.}

{
    - contentsBook hasnt NestRecap:
    ~ move_entity(NestRecap, BookPlace)
}

{
    - nest == 1:
        Vecchie piogge e onde come monito.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        {
            - contentsNest has fireGlyph:
                E un glifo rosso già attende {player_name}, dono di una persona amica dopo la sua riscrittura.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        }
}

//Aggiorniamo lo stato dei bottoni, e poi torniamo a main
    ~ nest_updateButtons()    
-> main


//E qui ci sono tutti i bottoni
=== nest_fireGlyph_button ===
    + {are_two_entities_together(PG,fireGlyph) && nest_fireButton}[fireGlyph]
        ~ saveGlyph(Fire)
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        -> main

=== nest_airGlyph_button ===
    + {are_two_entities_together(PG,airGlyph) && nest_airButton}[airGlyph]
        ~ saveGlyph(Air)
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        -> main

=== nest_earthGlyph_button ===
    + {are_two_entities_together(PG,earthGlyph) && nest_earthButton}[earthGlyph]
        ~ saveGlyph(Earth)
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        -> main

=== nest_waterGlyph_button ===
    + {are_two_entities_together(PG,waterGlyph) && nest_waterButton}[waterGlyph]
        ~ saveGlyph(Water)
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        -> main

=== nest_aetherGlyph_button ===
    + {are_two_entities_together(PG,aetherGlyph) && nest_aetherButton}[aetherGlyph]
        ~ saveGlyph(Aether)
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        -> main