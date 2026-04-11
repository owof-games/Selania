//Variabili per registrare temporaneamente il valore di un glifo in fase di creazione di un sigillo.
VAR firstGlyph = ()
VAR secondGlyph = ()
VAR thirdGlyph = ()

//Variabili per accendere/spegnere un bottone del glifo a seconda delle condizioni previste
VAR nest_fireButton = false
VAR nest_airButton = false
VAR nest_waterButton = false
VAR nest_earthButton = false
VAR nest_aetherButton = false


//Notifichiamo una nuova scoperta
VAR nest_newSigilDiscovered = ()   

//Tracciamento per commissione franco
VAR nest_francoUsedEarth = false
VAR nest_francoChosenSigil = ()

//Funzioni per la creazione dei sigilli nel nido

//Questa formula viene chiamata ad ingresso del nido e dopo ogni scelta per spegnere/accendere i glifi che ci permettono di creare sigilli
=== function nest_updateButtons() ===

    ~ nest_airButton = canChooseGlyph(Air)
    ~ nest_fireButton = canChooseGlyph(Fire)
    ~ nest_earthButton = canChooseGlyph(Earth)
    ~ nest_waterButton = canChooseGlyph(Water)
    ~ nest_aetherButton = canChooseGlyph(Aether)


//Questa funzione vede di scelta in scelta se esistono le condizioni per attivare o meno un tasto, e aggiorna poi nest_updateButtons.
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

    // secondo step e mezzo: tolgo i sigilli che usano glifi non ancora disponibili
    {(not are_two_entities_together(PG,earthGlyph)) && (not are_two_entities_together(PG,earthGlyph_off)):
        ~ allSigils -= sigilsWithGlyphInFirstPosition(Earth)
        ~ allSigils -= sigilsWithGlyphInSecondPosition(Earth)
        ~ allSigils -= sigilsWithGlyphInThirdPosition(Earth)
    }

    {not are_two_entities_together(PG,fireGlyph) && (not are_two_entities_together(PG,fireGlyph_off)):
        ~ allSigils -= sigilsWithGlyphInFirstPosition(Fire)
        ~ allSigils -= sigilsWithGlyphInSecondPosition(Fire)
        ~ allSigils -= sigilsWithGlyphInThirdPosition(Fire)
    }

    // terzo step: verificare se ne è rimasto almeno uno
    ~ temp someRemaining = allSigils != ()
    {debug_nest: Rimangono sigilli? {someRemaining}}

    ~ return someRemaining

//Questa funzione verifica se abbiamo compiuto tre scelte, e in quel caso genera il sigillo, attiva la notifica prevista e svuota le variabili temporanee
=== function checkSigilCompleted() ===
{not thirdGlyph:
    ~ return
}

~ temp chosenSigil = sigilsWithGlyphInFirstPosition(firstGlyph) ^ sigilsWithGlyphInSecondPosition(secondGlyph) ^ sigilsWithGlyphInThirdPosition(thirdGlyph)
{debug_nest: Il sigillo scelto è: {chosenSigil}}

//aggiungo il sigillo a quelli scoperti
~ glyph_discoveredSigils += chosenSigil

//svuoto il valore del glifo
~ firstGlyph = ()
~ secondGlyph = ()
~ thirdGlyph = ()

//con questo pezzetto informo il sistema di notifica di notificare il nuovo sigillo trovato SE non sono in commissione franco
{
    - nest_francoUsedEarth == false:
        ~ nest_newSigilDiscovered += chosenSigil
    - else: 
       ~ nest_francoChosenSigil = chosenSigil
}



//Questa funzione decide a quale step di glifo assegnare la scelta fatta
=== function saveGlyph(glyph) ===
{
    - not firstGlyph:
        ~ firstGlyph = glyph
    - not secondGlyph:
        ~ secondGlyph = glyph
    - not thirdGlyph:
        ~ thirdGlyph = glyph
}


//Funzioni per check posizione glifo
=== function sigilsWithGlyphInFirstPosition(glyph) ===
{glyph:
    - Air:
        ~ return glyph_firstAir
    - Fire:
        ~ return glyph_firstFire
    - Earth:
        ~ return glyph_firstEarth
    - Water:
        ~ return glyph_firstWater
    - Aether:
        ~ return glyph_firstAether
}

=== function sigilsWithGlyphInSecondPosition(glyph) ===
{glyph:
    - Air:
        ~ return glyph_secondAir
    - Fire:
        ~ return glyph_secondFire
    - Earth:
        ~ return glyph_secondEarth
    - Water:
        ~ return glyph_secondWater
    - Aether:
        ~ return glyph_secondAether
}

=== function sigilsWithGlyphInThirdPosition(glyph) ===
{glyph:
    - Air:
        ~ return glyph_thirdAir
    - Fire:
        ~ return glyph_thirdFire
    - Earth:
        ~ return glyph_thirdEarth
    - Water:
        ~ return glyph_thirdWater
    - Aether:
        ~ return glyph_thirdAether
}




=== nest_reactivateGliphs ===

{
    - contentsNest has fireGlyph_off:
        ~ move_entity(fireGlyph, Nest)
        ~ move_entity(fireGlyph_off, Safekeeping)
}

{
    - contentsNest has waterGlyph_off:
        ~ move_entity(waterGlyph, Nest)
        ~ move_entity(waterGlyph_off, Safekeeping)
}

{
    - contentsNest has airGlyph_off:
        ~ move_entity(airGlyph, Nest)
        ~ move_entity(airGlyph_off, Safekeeping)
}

{
    - contentsNest has earthGlyph_off:
        ~ move_entity(earthGlyph, Nest)
        ~ move_entity(earthGlyph_off, Safekeeping)
}

{
    - contentsNest has aetherGlyph_off:
        ~ move_entity(aetherGlyph, Nest)
        ~ move_entity(aetherGlyph_off, Safekeeping)
}
    
->->


=== function set_up_glyphs() ===

~ _setup_up_glyph(waterGlyph, waterGlyph_off, nest_waterButton)
~ _setup_up_glyph(earthGlyph, earthGlyph_off, nest_earthButton)
~ _setup_up_glyph(fireGlyph, fireGlyph_off, nest_fireButton)
~ _setup_up_glyph(aetherGlyph, aetherGlyph_off, nest_aetherButton)
~ _setup_up_glyph(airGlyph, airGlyph_off, nest_airButton)


=== function _setup_up_glyph(glyph, glyph_off, is_in_scene) ===
{not are_two_entities_together(PG, glyph) and not are_two_entities_together(PG, glyph_off):
    ~ return
}

~ temp buttonDestination = Safekeeping
~ temp buttonOffDestination = Nest
{is_in_scene:
    ~ buttonDestination = Nest
    ~ buttonOffDestination = Safekeeping
}
~ move_entity(glyph, buttonDestination)
~ move_entity(glyph_off, buttonOffDestination)