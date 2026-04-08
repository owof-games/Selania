=== open_the_dump
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
    
    <i>Crediamo sia giunto il momento ti parlare di persona, {player_name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    <i>Ti aspettiamo ai margini della foresta.
    <i>Capirai come trovarci.</i>

        
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
        <i>{player_name} cosa si domanda?</i>
        
            + Posso sfiorarti?
                    -> glyph_modifier_variation_management(PG, waterC)->
                <i>{player_name} sente la voce del Canto delle Compagne.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>{player_name} realizza che è {player_pronouns has him:collegato|{player_pronouns has her:collegata|collegatə}} a {charNameOne}.
                <i>A {charNameTwo}.
                <i>A {mentorName}.
                <i>E ogni collegamento riporta a pochi istanti fa, quando ha sfiorato il suo stesso viso.
                <i>Il contatto ha risvegliato un ricordo.
                <i>E quel ricordo, {player_name}, è il tuo sfiorarci.</i>
                
            + Ehi tu, esci dalla mia testa! Subito!
                    -> glyph_modifier_variation_management(PG, fireC)->
                <i>Non siamo nella testa di {player_name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Non più di quanto {player_name} sia nella sua stessa testa.
                <i>Non meno di quanto {player_name} sia nella nostra.
                <i>È come se {player_name} ci chiedesse di non essere.
                <i>E questa è una cosa che non è e non sarà.</i>
                
            + Le piante non possono parlare.
                    -> glyph_modifier_variation_management(PG, airC)->
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
                <i>Da te.</i>
                
            + Ci piace la gioia!
                    -> glyph_modifier_variation_management(PG, earthC)->
                <i>E a noi piace {player_name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>E tutte le emozioni che genera con le sue azioni.
                <i>E tutti i tempi che {player_name} vive, ha vissuto e vivrà.</i>
            
            + La tua voce mi guida dal mio arrivo.
                    -> glyph_modifier_variation_management(PG, aetherC)->
                <i>E la tua guida noi, {player_name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>La separazione è una illusione.
                <i>{player_name} è noi, noi siamo {charNameOne}.
                <i>{charNameOne} è {charNameTwo} che è {mentorName}.
                <i>E {mentorName} è {player_name}.
                <i>Che è noi.</i>
            -
        <i>Noi siamo sussurro e siamo ascolto. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        <i>Un sorriso attento ai bisogni di {player_name}.
        <i>Se {player_name} osserva la luna, noi saremo con {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}}.
        <i>Ecco, sì: oggi saremo la luna.
            - (nameWitch)
        <i>Queste radici cercano di imparare le voci del terreno.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}

        -> witch_closing_storylet ->
        -> main



=== the_witch_and_the_frog
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

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
    <i>Non ubbidisce ad alcuna autorità, ad alcuna legge, se non quella della cura delle altre persone.</i>
    - 
        -> witch_closing_storylet ->
        -> main



//Confessioni sulla sua storia
=== witch_first_confession
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

// Rifiuto e negazione: parla del crollo, del furto di un documento a una compagna che l’ha portata in quel luogo, ma colpevolizza le compagne → si è sentita abbandonata.
    
    <i>Abbiamo osservato {player_name}.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
    <i>L'abbiamo vist{player_pronouns has him:o|{player_pronouns has her:a|ə}} accogliere tutte le storie di <>
        {
            - listDumpCharActivators has FirstCharacter:
                    {charNameOne},<>
            - listDumpCharActivators has SecondCharacter:
                    {charNameTwo},<>
            - listDumpCharActivators has ThirdCharacter:
                    {charNameThree},<>
            - listDumpCharActivators has FourthCharacter:
                    {charNameFour},<>
            - listDumpCharActivators has FifthCharacter:
                    {charNameFive},<>
        }
    e abbiamo pensato che {player_name} potrebbe ascoltare un pezzo della nostra.
    <i>Della mia.
    <i>C'è stato un tempo in cui eravamo separazione, in cui usavamo "io".
    <i>Un tempo di confusione.
    <i>Ma non lo sapevamo.
    <i>E abbiamo fatto cose sbagliate.
    <i>Come tradire una persona amica, qualcuna che faceva parte della nostra congrega.
    <i>Qualcuna che aveva trovato un modo per arrivare in un luogo speciale, un luogo del possibile.
    <i>Noi le abbiamo rubato quel sapere, {player_name}.
    <i>Noi siamo arrivate qui dicendo che avremmo salvato il mondo.
    <i>Ma volendo sentirci solo importanti.
    <i>Viste.
    <i>Abbiamo fatto di tutto per essere viste, apprezzate, amate.
    <i>Così tanto da venire abbandonate.
    <i>C'è stato un tempo di confusione.
    <i>E poi è arrivato il dolore.
    <i>Ma una vita è lunga da raccontare.
    <i>A dopo, {player_name}.

        -> witch_closing_storylet ->
        -> main

=== witch_second_confession
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
// Rabbia: incontro con Franco. crea la discarica per bloccare l’accesso da cui erano arrivate, in un mix di “sono pericolosa per gli altri” e “questo posto è pericoloso, il mondo non lo deve avere”. Ha cercato di uccidere l'albero, l'ha tagliato lei. Non voleva che rimanesse niente di chi l'ha abbandonata.
    
    <i>{player_name} continua a stupirci.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
    

    -> witch_closing_storylet ->
    -> main

=== witch_third_confession
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
// Contrattazione: Franco le dice“ Sei sempre stata come XXX che cercava di essere YYY invece di essere totalmente XXX”. 


    -> witch_closing_storylet ->
    -> main

=== witch_fourth_confession
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
// Depressione: è la storyline che dovrebbe arrivare dopo la riscrittura di Nonna Molotov, cosa racconta?
//Sicuro ci dirà comunque che a quel punto aveva capito che U.O.J. aveva ragione, che il fulcro di tutto è la relazione, ma oramai non aveva nessuno con cui interagire.

    -> witch_closing_storylet ->
    -> main

=== witch_fifth_confession
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
// Accettazione: decide di riscrivere il suo nome nel nome del luogo, di Selanìa, scoperto attraverso Franco, in modo da perdersi nel luogo stesso e diventare pura relazione, per attirare persone bisognose della riscrittura.
// Capisce solo ora le parole di Franco di settimane prima: “A quel punto ha capito che sì, aveva sbagliato, ma che non serviva piangere, non serviva essere qualcosa che non era: serviva accogliere la sua indole più profonda, trasformativa, come quella dei sigilli, e far sì che altre persone potessero avere uno spazio sicuro in cui ritrovarsi, farsi forti per uscire da lì, cambiare le cose. Diventare Selanìa, diventare il luogo in cui ci troviamo.” Come siamo diventate "noi"

    -> witch_closing_storylet ->
    -> main


=== witch_allSigils_opening ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(mentor_ActualName)

    <i>{player_name} ha finito le riscritture.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
    <i>Ci sono ancora un po' di cose da fare, ma se vuole, prima di continuare, possiamo sbloccare tutte le informazioni mancanti riguardo ai sigilli.
    <i>Per il piacere di condividere la conoscenza.

    + <i>No, preferirei di no.</i>
        <i>La neve si scioglie al sole.
        <i>E {player_name} si prepara per una nuova primavera.

    + (yes) <i>Certo che sì!</i>
        -> glyph_open_all_sigils ->
        <i>Ora il grimorio è colmo delle descrizioni mancanti.</i>
    -   
    <i>{player_name} quando vuole sa già dove trovarci.</i>

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
            -> glyph_modifier_variation_management(PG, waterC)->
            
        + SCelta rossa.
            -> glyph_modifier_variation_management(PG, fireC)->
            
        + Scelta blu.
            -> glyph_modifier_variation_management(PG, airC)->
     
        + Scelta gialla.
            -> glyph_modifier_variation_management(PG, earthC)->
 
        + Scelta viola.
            -> glyph_modifier_variation_management(PG, aetherC)->
        -        
    Cose.
    -> witch_closing_storylet ->
    -> main

