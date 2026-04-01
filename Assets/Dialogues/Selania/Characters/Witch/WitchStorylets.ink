=== open_the_dump
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
    
    Crediamo sia giunto il momento ti parlare di persona, {player_name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    Ti aspettiamo ai margini della foresta.
    Capirai come trovarci.

        
    -> witch_closing_storylet ->
    -> main

=== witch_intro
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        <i>Le nostre radici ci connettono a nuove voci, nuove storie.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
        <b>Ci.</b>
        <i>La cicatrice rimane, ma da essa esplode la vita.
        <i>Torniamo a percepire, e questa è gioia.
        <i>{player_name} ci ha portato questa gioia.
        <i>{player_name} cosa si domanda?
        
            + Posso sfiorarti?
                    -> glyph_modifier_variation_management(PG, waterC, decreaseNo)->
                <i>{player_name} sente la voce del Canto delle Compagne.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>{player_name} realizza che è {player_pronouns has him:collegato|{player_pronouns has her:collegata|collegatə}} a {charNameOne}.
                <i>A {charNameTwo}.
                <i>A {mentorName}.
                <i>E ogni collegamento riporta a pochi istanti fa, quando ha sfiorato il suo stesso viso.
                <i>Il contatto ha risvegliato un ricordo.
                <i>E quel ricordo, {player_name}, è il tuo sfiorarci.
                
            + Ehi tu, esci dalla mia testa! Subito!
                    -> glyph_modifier_variation_management(PG, fireC, decreaseNo)->
                <i>Non siamo nella testa di {player_name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Non più di quanto {player_name} sia nella sua stessa testa.
                <i>Non meno di quanto {player_name} sia nella nostra.
                <i>È come se {player_name} ci chiedesse di non essere.
                <i>E questa è una cosa che non è e non sarà.
                
            + Le piante non possono parlare.
                    -> glyph_modifier_variation_management(PG, airC, decreaseNo)->
                <i>Le piante raccontano storie da notte a giorno. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>E noi non siamo una pianta.
                <i>Ma siamo una pianta.
                <i>E non parliamo.
                <i>Eppure accade.
                <i>E ascoltiamo.
                <i>Elaboriamo.
                <i>Scopriamo.
                <i>In te.
                <i>Con te.
                <i>Per te.
                <i>Da te.
                
            + Ci piace la gioia!
                    -> glyph_modifier_variation_management(PG, earthC, decreaseNo)->
                <i>E a noi piace {player_name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>E tutte le emozioni che genera con le sue azioni.
                <i>E tutti i tempi che {player_name} vive, ha vissuto e vivrà.
            
            + La tua voce mi guida dal mio arrivo.
                    -> glyph_modifier_variation_management(PG, aetherC, decreaseNo)->
                <i>E la tua guida noi, {player_name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>La separazione è una illusione.
                <i>{player_name} è noi, noi siamo {charNameOne}.
                <i>{charNameOne} è {charNameTwo} che è {mentorName}.
                <i>E {mentorName} è {player_name}.
                <i>Che è noi.
            -
        <i>Noi siamo sussurro e siamo ascolto. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        <i>Un sorriso attento ai bisogni di {player_name}.
        <i>Se {player_name} osserva la luna, noi saremo con {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}}.
        <i>Ecco, sì: oggi saremo la luna.
            - (nameWitch)
        <i>Queste radici cercano di imparare le voci del terreno.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}

        -> witch_closing_storylet ->
        -> main



=== the_witch_and_the_frog

    <i>Le radici ci raccontano del tuo incontro con Franco.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
    <i>E il nostro tronco porta il ricordo di Franco e di tutte le rane venute prima e dopo di lui.
    <i>Franco è un'anima semplice con un grande impegno.
    <i>Franco è come il vento che invisibile porta pollini e alleggerisce il volo delle rondini.
    <i>Come acqua leggera su un terreno asciutto.
    <i>Vede i bisogni che popolano questi spazi.
    <i>Le voci non ascoltate.
    <i>E fa in modo che tutte le mancanze vengano risanate.
    <i>Attento a chi ha troppo, attento a chi ha poco.
    <i>Un vecchio detto dice: "Quando la palude piange, la rana ascolta".
    <i>Franco sorride sempre, ma conosce il pianto di tutt3 noi.
    <i>Non ubbidisce ad alcuna autorità, ad alcuna legge, se non quella della cura delle altre persone.
    - 


        -> witch_closing_storylet ->
        -> main



//Confessioni sulla sua storia

=== witch_first_confession
Primo pezzo storia strega


    -> witch_closing_storylet ->
    -> main

=== witch_second_confession
Secondo pezzo storia strega


    -> witch_closing_storylet ->
    -> main

=== witch_third_confession
Terzo pezzo storia strega


    -> witch_closing_storylet ->
    -> main

=== witch_fourth_confession
Quarto pezzo storia strega


    -> witch_closing_storylet ->
    -> main

=== witch_fifth_confession
Quinto pezzo storia strega. Scopriamo che il suo nome è M.M., come la persona che ha commentato greenhouse e nido.


    -> witch_closing_storylet ->
    -> main


=== witch_allSigils_opening ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(mentor_ActualName)

Ehi {player_name}, hai finito tutte le riscritture. Se vuoi posso anche sbloccarti tutti i significati dei sigilli, che ne dici?
    + No
        Capisco
    + (yes) Sì 
        -> glyph_open_all_sigils ->
        Fatto
    -   
Ciao ciao.

-> main    


=== final ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(mentor_ActualName)
    Hai donato la Selanìa, il gioco è finito.
    Compare lo sfondo stellato.
    
        + Scelta verde.
            -> glyph_modifier_variation_management(PG, waterC, decreaseNo)->
            
        + SCelta rossa.
            -> glyph_modifier_variation_management(PG, fireC, decreaseNo)->
            
        + Scelta blu.
            -> glyph_modifier_variation_management(PG, airC, decreaseNo)->
     
        + Scelta gialla.
            -> glyph_modifier_variation_management(PG, earthC, decreaseNo)->
 
        + Scelta viola.
            -> glyph_modifier_variation_management(PG, aetherC, decreaseNo)->
        -        
    Cose.
    -> witch_closing_storylet ->
    -> main

