VAR firstGlyph = ()
VAR secondGlyph = ()
VAR thirdGlyph = ()

VAR nest_fireButton = false
VAR nest_airButton = false
VAR nest_waterButton = false
VAR nest_earthButton = false
VAR nest_aetherButton = false

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
            - nest_foundedGlyphs has fireGlyph:
                E un glifo rosso già attende {player_name}, dono di una persona amica dopo la sua riscrittura.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        }
}

~ nest_updateButtons()
-> main
    
//Per prima cosa passiamo dalla funzione di attivazione/disattivazione dei tasti glyph_activator_function 
    // -> glyph_activator_function -> main


=== function nest_updateButtons() ===

~ nest_airButton = canChooseGlyph(Air)
~ nest_fireButton = canChooseGlyph(Fire)
~ nest_earthButton = canChooseGlyph(Earth)
~ nest_waterButton = canChooseGlyph(Water)
~ nest_aetherButton = canChooseGlyph(Aether)




=== function canChooseGlyph(checkedGlyph) ===

~ temp first = firstGlyph
~ temp second = secondGlyph
~ temp third = thirdGlyph
{
    - not firstGlyph:
        ~ first = checkedGlyph
    - not secondGlyph:
        ~ second = checkedGlyph
    - not thirdGlyph:
        ~ third = checkedGlyph
}

// primo step: ottenere la lista dei sigilli che posso creare scegliendo first, second e third
~ temp allSigils = LIST_ALL(glyph_allSigils)
{first and not second and not third:
    ~ allSigils = sigilsWithGlyphInFirstPosition(first)
}
{first and second and not third:
    ~ allSigils = sigilsWithGlyphInFirstPosition(first) ^ sigilsWithGlyphInSecondPosition(second)
}
{first and second and third:
    ~ allSigils = sigilsWithGlyphInFirstPosition(first) ^ sigilsWithGlyphInSecondPosition(second) ^ sigilsWithGlyphInThirdPosition(third)
}
{debug_nest: I sigilli con first={first}, second={second}, third={third} sono {allSigils}}

// secondo step: togliere quelli già scoperti
~ allSigils -= glyph_discoveredSigils
{debug_nest: I sigilli rimasti sono {allSigils}}

// terzo step: verificare se ne è rimasto almeno uno
~ temp someRemaining = allSigils != ()
{debug_nest: Rimangono sigilli? {someRemaining}}

~ return someRemaining


=== function checkSigilCompleted() ===
{not thirdGlyph:
    ~ return
}
~ temp chosenSigil = sigilsWithGlyphInFirstPosition(firstGlyph) ^ sigilsWithGlyphInSecondPosition(secondGlyph) ^ sigilsWithGlyphInThirdPosition(thirdGlyph)
{debug_nest: Il sigillo scelto è: {chosenSigil}}
~ glyph_discoveredSigils += chosenSigil
~ firstGlyph = ()
~ secondGlyph = ()
~ thirdGlyph = ()



=== function saveGlyph(glyph) ===
{
    - not firstGlyph:
        ~ firstGlyph = glyph
    - not secondGlyph:
        ~ secondGlyph = glyph
    - not thirdGlyph:
        ~ thirdGlyph = glyph
}


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