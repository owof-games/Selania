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
    
    <i>Abbiamo osservato {player_name}.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
    <i>L'abbiamo vist{player_pronouns has him:o|{player_pronouns has her:a|ə}} accogliere tutte le storie di <>
        {
            - listDumpCharActivators has FirstCharacter:
                    ~ witch_mainStoryPNG += FirstCharacter
                    {charNameOne},<>
            - listDumpCharActivators has SecondCharacter:
                    ~ witch_mainStoryPNG += SecondCharacter
                    {charNameTwo},<>
            - listDumpCharActivators has ThirdCharacter:
                    ~ witch_mainStoryPNG += ThirdCharacter
                    {charNameThree},<>
            - listDumpCharActivators has FourthCharacter:
                    ~ witch_mainStoryPNG += FourthCharacter
                    {charNameFour},<>
            - listDumpCharActivators has FifthCharacter:
                    ~ witch_mainStoryPNG += FifthCharacter
                    {charNameFive},<>
        }
    e abbiamo pensato che {player_name} potrebbe ascoltare un pezzo della nostra.
    <i>Della mia.
    <i>C'è stato un tempo in cui eravamo separazione, in cui usavamo "io".
    <i>Un tempo di confusione.
    <i>Ma non lo sapevamo.
    <i>E abbiamo fatto cose sbagliate.
    <i>Come tradire una persona amica.
    <i>Qualcuna che aveva trovato un modo per arrivare in un luogo speciale, un luogo impossibile.
    <i>Noi le abbiamo rubato quel sapere, {player_name}.
    <i>Noi, io sono arrivata qui dicendo che avrei salvato il mondo.
    <i>Ma volevo soltanto essere vista.
    <i>I perché contano, {player_name}.
    <i>E i miei perché erano sbagliati.
    <i>La madre becca il pullo per pulirgli le piume.
    <i>Il padre becca il pullo per eliminare un rivale.
    <i>E noi abbiamo cercato risposte che ci facessero sentire apprezzate.
    <i>Così tanto da venire abbandonate.
    <i>Abbiamo scoperto che eravamo confuse solo quando la confusione se ne è andata.
    <i>Lasciando spazio al dolore.
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

    <i>{player_name} continua a stupirci.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
    <i>E lo stupore viene da quanto tempo ha dedicato alle parole di <>
        {
            - listDumpCharActivators has FirstCharacter && witch_mainStoryPNG hasnt FirstCharacter:
                    ~ witch_mainStoryPNG += FirstCharacter
                    {charNameOne}.
            - listDumpCharActivators has SecondCharacter && witch_mainStoryPNG hasnt SecondCharacter:
                    ~ witch_mainStoryPNG += SecondCharacter
                    {charNameTwo}.
            - listDumpCharActivators has ThirdCharacter && witch_mainStoryPNG hasnt ThirdCharacter:
                    ~ witch_mainStoryPNG += ThirdCharacter
                    {charNameThree}.
            - listDumpCharActivators has FourthCharacter && witch_mainStoryPNG hasnt FourthCharacter:
                    ~ witch_mainStoryPNG += FourthCharacter
                    {charNameFour}.
            - listDumpCharActivators has FifthCharacter && witch_mainStoryPNG hasnt FifthCharacter:
                    ~ witch_mainStoryPNG += FifthCharacter
                    {charNameFive}.
        }
    <i>Speriamo quindi voglia accogliere ancora anche le nostre.
    <i>Perché è da tempo che sentiamo il bisogno di raccontare la nostra storia.
    <i>Di cosa c'è stato dopo il dolore dell'abbandono.
    <i>Era profondo come l'oceano, quel dolore, e lo sappiamo perché abbiamo provato a raggiungerne il fondo.
    <i>Sassi in tasca e occhi spenti.
    <i>Ma l'acqua nei polmoni ha acceso un rogo.
    <i>Le sue fiamme hanno allontanato le ombre, la sua foga ci ha riportate a riva.
    <i>La sabbia si è fatta vetro mentre gridavamo.
    <i>Mentre insultavamo ogni nome di chi ci aveva abbandonate.
    <i>Dalla biblioteca alla cucina alla serra, abbiamo distrutto tutto ciò che avevano creato.
    <i>Portato le macerie qui, su questa collina, per far sì che niente potesse entrare.
    <i>E con le mani stanche, abbiamo distrutto un albero.
    <i>Un albero che era una promessa, che era una possibilità.
    <i>Un albero curato da una persona amata.
    <i>Il dolore si è fatto rabbia.
    <i>La rabbia si è fatta disprezzo.
    <i>E quando siamo, quando sono crollata davanti a queste radici, mi sono odiata.
    <i>Il ricordo ci brucia anche ora, {player_name}.
    <i>Per cui ci prendiamo un pezzo di tempo, un momento di cura.
    
        -> witch_closing_storylet ->
        -> main

=== witch_third_confession
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    <i>Un'altra storia ascoltata fino alla sua foce.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
    <i>Un altro fiume attraversato da {player_name}.
    <i>Siamo sicure che <>
        {
            - listDumpCharActivators has FirstCharacter && witch_mainStoryPNG hasnt FirstCharacter:
                    ~ witch_mainStoryPNG += FirstCharacter
                    {charNameOne} si senta sollevata <>
            - listDumpCharActivators has SecondCharacter && witch_mainStoryPNG hasnt SecondCharacter:
                    ~ witch_mainStoryPNG += SecondCharacter
                    {charNameTwo} si senta sollevato <>
            - listDumpCharActivators has ThirdCharacter && witch_mainStoryPNG hasnt ThirdCharacter:
                    ~ witch_mainStoryPNG += ThirdCharacter
                    {charNameThree} si senta sollevato <>
            - listDumpCharActivators has FourthCharacter && witch_mainStoryPNG hasnt FourthCharacter:
                    ~ witch_mainStoryPNG += FourthCharacter
                    {charNameFour} si senta sollevata <>
            - listDumpCharActivators has FifthCharacter && witch_mainStoryPNG hasnt FifthCharacter:
                    ~ witch_mainStoryPNG += FifthCharacter
                    {charNameFive} si senta sollevata <>
        }

    dopo questa lunga condivisione.
    <i>Noi nel dolore abbiamo trovato sollievo in una rana.
    <i>Avevamo passato anni tra questi luoghi, ma cieche di orgoglio, cieche di razionalità, non ci eravamo mai accorte di non essere sole.
    <i>Franco ci ha accolte come delle vecchie amiche.
    <i>Franco sapeva tante cose di noi.
    <i>Ogni giorno, per settimane, ci ha raccolte lungo le sue rive, nuotando nell'acqua delle nostre parole.
    <i>Il disprezzo per noi stesse si è fatto domanda, la domanda ha cercato comprensione.
    <i>Un giorno abbiamo chiesto a Franco dove avevamo sbagliato.
    <i>"Volevi conoscere l'acqua, ma ti sei fatta nuotare."
    <i>E coi piedi verso il cielo, abbiamo creduto di capire.
    <i>Abbiamo ripreso a studiare, ma questa volta pensando alle persone amiche, pensando a come avrei potuto aiutarle.
    <i>Ho riconosciuto il mio errore, e ho cercato un modo di farmi perdonare.
    <i>Il disprezzo si è fatto domanda, la domanda comprensione.
    <i>E la comprensione un primo passo verso un nuovo errore.
    <i>Ma ora abbiamo bisogno di un attimo per respirare.
    
        -> witch_closing_storylet ->
        -> main

=== witch_fourth_confession
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)


    <i>Sono tante le cose che {player_name} ha ascoltato da <>
        {
            - listDumpCharActivators has FourthCharacter && witch_mainStoryPNG hasnt FourthCharacter:
                    ~ witch_mainStoryPNG += FourthCharacter
                    {charNameFour},<>
            - listDumpCharActivators has FifthCharacter && witch_mainStoryPNG hasnt FifthCharacter:
                    ~ witch_mainStoryPNG += FifthCharacter
                    {charNameFive},<>
        }
    e poche le cose che vorremmo ancora raccontar{player_pronouns has him:gli|{player_pronouns has her:le|lə}}.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
    <i>Per un cucciolo ogni bastone è un nuovo gioco.
    <i>Ma per un cane adulto un bastone è solo un bastone.
    <i>Al cambiamento bisognerebbe arrivare come cuccioli.
    <i>Noi ci eravamo arrivate convinte di avere occhi aperti allo stupore, ma eravamo capaci di vedere solo il bastone.
    <i>E così ci siamo immerse nella ricerca, ignorando noi stesse, ignorando Franco.
    <i>Di corsa dalla spiaggia alla foresta alla stazione, fino a quando le corse non si sono fatte passi.
    <i>I passi strascicati.
    <i>E le gambe non hanno ceduto.
    <i>Passavamo le ore stese allo stagno in silenzio con Franco, gli occhi pieni di lacrime, per poi spostarci in cucina.
    <i>Utilizzare quel poco che rimaneva, pensare alle voci che l'avevano riempita.
    <i>Che non avevo ascoltato.
    <i>Il dolore di mesi prima mi aveva portato ad affondare.
    <i>Ora galleggiavo nel grigio.
    <i>"Volevi conoscere l'acqua, ma ti sei fatta nuotare", mi aveva detto Franco.
    <i>"Ti sei fatta prendere dal sapere, e hai lasciato che il sapere ti comandasse", ho letto io.
    <i>Ma poi un giorno, i piedi nelle acque della cucina, il loro riflesso spezzato.
    <i>E ho davvero capito di che cosa parlasse Franco.
    <i>Ma le cose belle richiedono il giusto spazio, {player_name}, e quindi concluderemo questa storia un'altra volta.
    <i>Ma grazie per avermi ascoltata.

        -> witch_closing_storylet ->
        -> main

=== witch_fifth_confession
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    <i>{player_name} ha ascoltato le storie di tutte, anche di <>

        {
            - listDumpCharActivators has FourthCharacter && witch_mainStoryPNG hasnt FourthCharacter:
                    ~ witch_mainStoryPNG += FourthCharacter
                    {charNameFour}, <>
            - listDumpCharActivators has FifthCharacter && witch_mainStoryPNG hasnt FifthCharacter:
                    ~ witch_mainStoryPNG += FifthCharacter
                    {charNameFive}, <>
        }
    e ora si conclude anche la nostra.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
    <i>"Volevi conoscere l'acqua, ma ti sei fatta nuotare", mi aveva detto Franco.
    <i>E un'altra persona saggia diceva sempre: "Noi siamo le nostre relazioni".
    <i>Quella persona aveva passato due anni a cucinare tra quegli spazi che avevo reso maceria.
    <i>Creando uno spazio di unione nei giorni disperati, ascoltandoci negli entusiasmi e nelle noie.
    <i>Per lei, tutto è relazione.
    <i>Se volevo conoscere l'acqua, dovevo diventare acqua.
    <i>Se volevo conoscere questo luogo, dovevo diventare questo luogo.
    <i>Invece di correre mi sono seduta, e ho ascoltato.
    <i>Le dissertazioni delle libellule e gli amori delle lucciole.
    <i>I canti delle api e i desideri degli uccelli.
    <i>E poi più giù, tra i sogni degli alberi, i ricordi dell'acqua.
    <i>Su, nelle gioie delle nubi, nelle certezze del cielo.
    <i>Il suono di ogni fiore ripeteva il suo nome, il nome di questo luogo.
    <i>Ho lasciato che mi riempisse, che diventassimo relazione.
    <i>Ho rinunciato al mio io e ho trovato un noi.
    <i>Siamo diventate Selanìa.
    <i>Abbiamo invitato il mondo a trovarci.
    <i>Per poter cambiare.

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

