=== nest ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
    -> achievements_onGame_statusUpdate_GM ->
{debug: <i>La lista degli oggetti nella stanza è: {contentsNest}.}

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
    + {are_two_entities_together(PG,fireGlyph) && nest_fireButton && not are_two_entities_together(PG,Franco)}[fireGlyph]
        ~ saveGlyph(Fire)
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        ~ move_entity(fireGlyph, Safekeeping)
        ~ move_entity(fireGlyph_off, Nest)
        -> main

=== nest_airGlyph_button ===
    + {are_two_entities_together(PG,airGlyph) && nest_airButton && not are_two_entities_together(PG,Franco)}[airGlyph]
        ~ saveGlyph(Air)
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        ~ move_entity(airGlyph, Safekeeping)
        ~ move_entity(airGlyph_off, Nest)
        -> main

=== nest_earthGlyph_button ===
    + {are_two_entities_together(PG,earthGlyph) && nest_earthButton && not are_two_entities_together(PG,Franco)}[earthGlyph]
        ~ saveGlyph(Earth)
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        ~ move_entity(earthGlyph, Safekeeping)
        ~ move_entity(earthGlyph_off, Nest)
        -> main

=== nest_waterGlyph_button ===
    + {are_two_entities_together(PG,waterGlyph) && nest_waterButton && not are_two_entities_together(PG,Franco)}[waterGlyph]
        ~ saveGlyph(Water)
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        ~ move_entity(waterGlyph, Safekeeping)
        ~ move_entity(waterGlyph_off, Nest)
        -> main

=== nest_aetherGlyph_button ===
    + {are_two_entities_together(PG,aetherGlyph) && nest_aetherButton && not are_two_entities_together(PG,Franco)}[aetherGlyph]
        ~ saveGlyph(Aether)
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        ~ move_entity(aetherGlyph, Safekeeping)
        ~ move_entity(aetherGlyph_off, Nest)
        -> main


//Questa è la variante pensata SOLO per la missione di Franco
//E qui ci sono tutti i bottoni
=== nest_Franco_fireGlyph_button ===
    + {are_two_entities_together(PG,fireGlyph) && are_two_entities_together(PG,Franco) && nest_francoUsedEarth && nest_fireButton}[fireGlyph]
        ~ saveGlyph(Fire)
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        ~ move_entity(fireGlyph, Safekeeping)
        ~ move_entity(fireGlyph_off, Nest)
        -> main

=== nest_Franco_airGlyph_button ===
    + {are_two_entities_together(PG,airGlyph) && are_two_entities_together(PG,Franco) && nest_francoUsedEarth && nest_airButton}[airGlyph]
        ~ saveGlyph(Air)
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        ~ move_entity(airGlyph, Safekeeping)
        ~ move_entity(airGlyph_off, Nest)
        -> main

=== nest_Franco_earthGlyph_button ===
    + {are_two_entities_together(PG,earthGlyph) && are_two_entities_together(PG,Franco) && nest_earthButton}[earthGlyph]
        ~ saveGlyph(Earth)
        ~ nest_francoUsedEarth = true
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        ~ move_entity(earthGlyph, Safekeeping)
        ~ move_entity(earthGlyph_off, Nest)
        -> main

=== nest_Franco_waterGlyph_button ===
    + {are_two_entities_together(PG,waterGlyph) && are_two_entities_together(PG,Franco) && nest_francoUsedEarth && nest_waterButton}[waterGlyph]
        ~ saveGlyph(Water)
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        ~ move_entity(waterGlyph, Safekeeping)
        ~ move_entity(waterGlyph_off, Nest)
        -> main

=== nest_Franco_aetherGlyph_button ===
    + {are_two_entities_together(PG,aetherGlyph) && are_two_entities_together(PG,Franco) && nest_francoUsedEarth && nest_aetherButton}[aetherGlyph]
        ~ saveGlyph(Aether)
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        ~ move_entity(aetherGlyph, Safekeeping)
        ~ move_entity(aetherGlyph_off, Nest)
        -> main        