=== tutorial_witchRelationship
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

// - Cosa indica:
//     - Le scelte non sono un modo di vedere il mondo, ma di viverlo. Non sono giuste o sbagliate, non sono uno strumento per conquistare la fiducia. L’espressione di sé è importante.
//     - Relazione come cosa complicata: alla lunga non è detto che ciò che la persona vuole da te sia quello di cui ha bisogno.
//     - La riscrittura è un momento a sé, e questa è una cosa importante da far capire in vista dei sigilli.
//     - Non sei mai tu a scegliere il nome: tu sei una guida, ma la strada è di chi la percorre.

->->


=== tutorial_witchSigils
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

// - Cosa indica:
//     - Riprende il discorso di qui sopra, ci spiega che i sigilli sono attivi anche durante la riscrittura perché non influenzano il rapporto, ma la percezione di ciò che diciamo. Le scelte, e i sigilli, raccontano una visione del mondo.
//     - Qui arriva anche la spiegazione delle scelte, che ora è a inizio gioco.
//     - non sono in opposizione, ma in comunicazione, generano sinergie, cose nuove
//     - il mutare che è portato rimane positivo, anche quando sembra negativo: serve che qualcosa perisca, si disgreghi, affinché il nuovo emerga. solo la morte è immutevole (e non è manco vero).

->->


=== about_glyph_choices
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)



    <i>Ciò che in te respira ricorda.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
    <i>Ricorda che ogni dialogo è una strada.
    <i>Che ogni strada è una scelta.
    <i>E che ogni scelta importante apre cinque vie.
    <i>Un vicolo di curiosità e disubbidienza.
    <i>Un sentiero di azione e protesta.
    <i>Un cammino di analisi e comprensione.
    <i>Un viottolo di affetto e cura.
    <i>Una calle di saggezza e spiritualità.
    <i>Ogni scelta e ogni passo accumulano visioni del mondo.
        ~ move_entity(RulesRecap, BookPlace)
        @animation:RewriterBook
    <i>Raccontando la storia di chi cammina.
    - (bookUpdate)
    
->->



=== about_the_book
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(mentor_ActualName)

        
            {
                - first_character_recap.check && second_character_recap.check && greenhouse_recap.check:
                    <i>{player_name} cerca spesso risposte tra le pagine del libro.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                
                - else:
                    <i>{player_name} cerca di rado risposte tra le pagine del libro.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }
        <i>Un libro è ricordo condiviso.
        <i>Una magia che pronuncia sé stessa.
        <i>Per questo le pagine si popolano man mano che {player_name} vive.
        <i>A volte il libro usa la nostra voce.
        <i>A volte ritrova altri nomi e parole.
        <i>In una canzone collettiva che guida {player_name} alla comprensione.
    @animation:RewriterBook
    - (bookUpdate)
    -> main

