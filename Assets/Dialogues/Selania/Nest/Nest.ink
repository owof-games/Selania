=== nest ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}

{debug: <i>La lista degli oggetti nella stanza è: {contentsNest}.}

{
    - nest == 1 && png_commonPauseTalking == false:
        {charTag(TheWitch, witch_state())}:   <i>Vecchie piogge e onde come monito.</i>
        {
            - contentsNest has fireGlyph:
                <i>E un glifo rosso già attende {player_name}, dono di una persona amica dopo la sua riscrittura.</i>
        }
}

//Aggiorniamo lo stato dei bottoni, e poi torniamo a main
    ~ nest_updateButtons()

-> main


=== franco_inTheNest
+ {are_two_entities_together(Franco, PG) && entity_location(PG) == Nest} [Franco]
    -> franco_storyletsManagement -> main

//E qui ci sono tutti i bottoni
=== nest_fireGlyph_button ===
    + {are_two_entities_together(PG,fireGlyph) && nest_fireButton && not are_two_entities_together(PG,Franco)}[fireGlyph]
        ~ saveGlyph(Fire)
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        -> main

=== nest_airGlyph_button ===
    + {are_two_entities_together(PG,airGlyph) && nest_airButton && not are_two_entities_together(PG,Franco)}[airGlyph]
        ~ saveGlyph(Air)
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        -> main

=== nest_earthGlyph_button ===
    + {are_two_entities_together(PG,earthGlyph) && nest_earthButton && not are_two_entities_together(PG,Franco)}[earthGlyph]
        ~ saveGlyph(Earth)
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        -> main

=== nest_waterGlyph_button ===
    + {are_two_entities_together(PG,waterGlyph) && nest_waterButton && not are_two_entities_together(PG,Franco)}[waterGlyph]
        ~ saveGlyph(Water)
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        -> main

=== nest_aetherGlyph_button ===
    + {are_two_entities_together(PG,aetherGlyph) && nest_aetherButton && not are_two_entities_together(PG,Franco)}[aetherGlyph]
        ~ saveGlyph(Aether)
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        -> main


//Questa è la variante pensata SOLO per la commissione di Franco
//E qui ci sono tutti i bottoni
=== nest_Franco_fireGlyph_button ===
    + {are_two_entities_together(PG,fireGlyph) && are_two_entities_together(PG,Franco) && nest_francoUsedEarth && nest_fireButton}[fireGlyph]
        ~ saveGlyph(Fire)
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        -> main

=== nest_Franco_airGlyph_button ===
    + {are_two_entities_together(PG,airGlyph) && are_two_entities_together(PG,Franco) && nest_francoUsedEarth && nest_airButton}[airGlyph]
        ~ saveGlyph(Air)
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        -> main

=== nest_Franco_earthGlyph_button ===
    + {are_two_entities_together(PG,earthGlyph) && are_two_entities_together(PG,Franco) && nest_earthButton}[earthGlyph]
        ~ saveGlyph(Earth)
        ~ nest_francoUsedEarth = true
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        -> main

=== nest_Franco_waterGlyph_button ===
    + {are_two_entities_together(PG,waterGlyph) && are_two_entities_together(PG,Franco) && nest_francoUsedEarth && nest_waterButton}[waterGlyph]
        ~ saveGlyph(Water)
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        -> main

=== nest_Franco_aetherGlyph_button ===
    + {are_two_entities_together(PG,aetherGlyph) && are_two_entities_together(PG,Franco) && nest_francoUsedEarth && nest_aetherButton}[aetherGlyph]
        ~ saveGlyph(Aether)
        ~ checkSigilCompleted()
        ~ nest_updateButtons()
        -> main 




