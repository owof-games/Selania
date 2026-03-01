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
~ glyph_discoveredSigils += chosenSigil
~ nest_newSigilDiscovered += chosenSigil
~ firstGlyph = ()
~ secondGlyph = ()
~ thirdGlyph = ()

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
