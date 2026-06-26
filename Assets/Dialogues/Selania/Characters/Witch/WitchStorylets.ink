=== open_the_dump
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        
    
        {charTag(TheWitch, witch_state())}:                         <i>Crediamo sia giunto il momento di presentarci, {player_name}.
                                                                    <i>Aspettiamo {player_name} ai margini della foresta.

            -> witch_closing_storylet ->
            ->-> 


=== witch_about_appendices
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    {charTag(TheWitch, witch_state())}:                             <i>{player_name} ha sbloccato una voce del grimorio: le appendici.
                                                                    <i>Le appendici raccolgono materiale importante per comprendere la natura di questo luogo.
                                                                    <i>E la saggezza di chi l'ha attraversato prima di {player_name}.
                                                                    <i>Ma se {player_name} è quel tipo di persona che preferisce comprendere le cose in autonomia, consigliamo di attendere prima di esplorarne le pagine.
                                                                    <i>Se invece {player_name} si sente smarrit{player_pronoun has him:o|{player_pronoun has her:a|ə}}, lì può trovarci informazioni importanti.


            -> witch_closing_storylet ->
            ->-> 


=== witch_intro
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(TheWitch, witch_state())}:                         <i>A volte dimentichiamo quando sarà ieri, cos'è successo domani.
                                                                    <i>Ma non dimentichiamo mai {player_name}.
                                                                    <i>Le nostre radici vibrano di voci, le nostre pietre si riempiono di storie.
                                                                    <i>{player_name} ci ha portato questa gioia.
                                                                    <i>C'è qualcosa che {player_name} vorrebbe dirci?

            + \ {charTag(PG, "neutral")}:                           Mi farebbe piacere ringraziarti per il tuo aiuto.
                    -> glyph_choice_manager(true, waterC)->

                {charTag(TheWitch, witch_state())}:                 <i>E grazie a {player_name} per aver aiutato noi.
                                                                    <i>La separazione è una illusione.
                                                                    <i>{player_name} è noi, noi siamo {charNameOne}.
                                                                    <i>{charNameOne} è {charNameTwo} che è {charNameThree} che è {charNameFive}.
                                                                    <i>E {charNameFive} è {player_name}.
                                                                    <i>Che è noi.</i>
                
            + \ {charTag(PG, "neutral")}:                           Esci dalla mia testa! Subito!
                    -> glyph_choice_manager(true, fireC)->

                {charTag(TheWitch, witch_state())}:                 <i>Non siamo nella testa di {player_name}.
                                                                    <i>Non più di quanto {player_name} sia nella sua stessa testa.
                                                                    <i>Non meno di quanto {player_name} sia nella nostra.
                                                                    <i>È come se {player_name} ci chiedesse di non essere.
                                                                    <i>E questa è una cosa che non è e non sarà.</i>
                
            + \ {charTag(PG, "neutral")}:                           Parli di radici, quindi sei un albero?
                    -> glyph_choice_manager(true, airC)->

                {charTag(TheWitch, witch_state())}:                 <i>Le piante raccontano storie da notte a giorno. 
                                                                    <i>E noi non siamo una pianta.
                                                                    <i>Ma siamo una pianta.
                                                                    <i>E non parliamo.
                                                                    <i>Eppure senti la nostra voce.
                                                                    <i>E ascoltiamo.
                                                                    <i>Con le radici nel cielo.
                                                                    <i>I rami a terra.
                                                                    <i>E il tronco in {player_name}.
                
            + \ {charTag(PG, "neutral")}:                           Quindi sei tu a fare andare avanti la baracca.
                    -> glyph_choice_manager(true, earthC)->

                {charTag(TheWitch, witch_state())}:                 <i>Piove, il pozzo si riempie.
                                                                    <i>Il viaggiatore si disseta.
                                                                    <i>Chi deve ringraziare? Il pozzo, la pioggia, o il giorno che ha iniziato a viaggiare?
        
            + \ {charTag(PG, "neutral")}:                           <i>Cosa è successo domani</i>: vieni dal futuro?
                    -> glyph_choice_manager(true, aetherC)->
                {charTag(TheWitch, witch_state())}:                 <i>La mosca vive un'istante, ma per lei il suo tempo è una vita.
                                                                    <i>Noi viviamo nel sempremai, e confondiamo i tempi.
                                                                    <i>Ma il tempo di {player_name} è quello giusto per {player_name}.
            
            -
                                                                    <i>Noi siamo sussurro e siamo ascolto. 
                                                                    <i>Un sorriso attento ai bisogni di {player_name}.
                                                                    <i>Ricordiamo il tempo in cui un nome era importante anche per noi.
                                                                    <i>Ci hanno chiamata Strega, Radice e Fiamma.
                                                                    <i>Ci hanno chiamata Luna e Parola.
                                                                    <i>Con quale nome {player_name} vorrebbe chiamarci?


            + \ {charTag(PG, "neutral")}:                           Strega.
                -> glyph_choice_manager(true, aetherC)->
                ~ witch_actualName += Strega

            + \ {charTag(PG, "neutral")}:                           Luna.
                -> glyph_choice_manager(true, waterC)->
                ~ witch_actualName += Luna

            + \ {charTag(PG, "neutral")}:                           Parola.
                -> glyph_choice_manager(true, airC)->
                ~ witch_actualName += Parola

            + \ {charTag(PG, "neutral")}:                           Radice.
                -> glyph_choice_manager(true, earthC)->
                ~ witch_actualName += Radice

            + \ {charTag(PG, "neutral")}:                           Fiamma.
                -> glyph_choice_manager(true, fireC)->
                ~ witch_actualName += Fiamma
            - (nameChosen)
            {charTag(TheWitch, witch_state())}:                     <i>E {witch_actualName} saremo.
                                                                    <i>Ora altre voci ci chiamano, ma aspetteremo {player_name} per quando ne avrà bisogno.
    
            -> witch_closing_storylet ->
            -> main



=== the_witch_and_the_frog
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    

    {charTag(TheWitch, witch_state())}:                             <i>Le radici ci raccontano dell'incontro di {player_name} con Franco.
                                                                    <i>E il nostro tronco porta il ricordo di Franco e di tutte le rane venute prima e dopo di lui.
                                                                    <i>Franco è un'anima semplice con un grande impegno.
                                                                    <i>Franco è come il vento che invisibile porta pollini e alleggerisce il volo delle rondini.
                                                                    <i>Come acqua leggera su un terreno asciutto.
                                                                    <i>Vede i bisogni che popolano questi spazi.
                                                                    <i>Le voci non ascoltate.
                                                                    <i>E fa in modo che tutte le mancanze vengano risanate.
                                                                    <i>Attento a chi ha troppo, attento a chi ha poco.
                                                                    <i>Un vecchio detto dice: "Quando la palude piange, la rana ascolta".
                                                                    <i>Franco sorride sempre, ma conosce il pianto di tuttə noi.
                                                                    <i>Non ubbidisce ad alcuna autorità, ad alcuna legge, se non quella della cura delle altre persone.</i>
        -> witch_closing_storylet ->
        -> main



//Confessioni sulla sua storia
=== witch_first_confession
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    
    {charTag(TheWitch, witch_state())}:                             <i>Abbiamo osservato {player_name}.
                                                                    <i>L'abbiamo vist{player_pronoun has him:o|{player_pronoun has her:a|ə}} accogliere tutte le storie di <>
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
    

    {charTag(TheWitch, witch_state())}:                             <i>{player_name} continua a stupirci.
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
    

    {charTag(TheWitch, witch_state())}:                             <i>Un'altra storia ascoltata fino alla sua foce.
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
    


    {charTag(TheWitch, witch_state())}:                             <i>Sono tante le cose che {player_name} ha ascoltato da <>
                                                                {
                                                                    - listDumpCharActivators has FourthCharacter && witch_mainStoryPNG hasnt FourthCharacter:
                                                                            ~ witch_mainStoryPNG += FourthCharacter
                                                                            {charNameFour},<>
                                                                    - listDumpCharActivators has FifthCharacter && witch_mainStoryPNG hasnt FifthCharacter:
                                                                            ~ witch_mainStoryPNG += FifthCharacter
                                                                            {charNameFive},<>
                                                                }
                                                                    e poche le cose che vorremmo ancora raccontar{player_pronoun has him:gli|{player_pronoun has her:le|lə}}.
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
    

    {charTag(TheWitch, witch_state())}:                             <i>{player_name} ha ascoltato le storie di tutte, anche di <>
                                                                {
                                                                    - listDumpCharActivators has FourthCharacter && witch_mainStoryPNG hasnt FourthCharacter:
                                                                            ~ witch_mainStoryPNG += FourthCharacter
                                                                            {charNameFour}, <>
                                                                    - listDumpCharActivators has FifthCharacter && witch_mainStoryPNG hasnt FifthCharacter:
                                                                            ~ witch_mainStoryPNG += FifthCharacter
                                                                            {charNameFive}, <>
                                                                }
                                                                    e ora si conclude anche la nostra.
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
    

            {charTag(TheWitch, witch_state())}:                     <i>{player_name} ha finito le riscritture.
                                                                    <i>Ci sono ancora un po' di cose da fare, ma se vuole, prima di continuare, possiamo sbloccare tutte le informazioni mancanti riguardo ai sigilli.
                                                                    <i>Per il piacere di condividere la conoscenza.

                        + \ {charTag(PG, "neutral")}:               <i>No, preferirei di no.</i>
            {charTag(TheWitch, witch_state())}:                     <i>La neve si scioglie al sole.
                                                                    <i>E {player_name} si prepara per una nuova primavera.

                        + (yes) \ {charTag(PG, "neutral")}:         <i>Certo che sì!</i>
                        -> glyph_open_all_sigils ->
            {charTag(TheWitch, witch_state())}:                     <i>Ora il grimorio è colmo delle descrizioni mancanti.</i>
                                                                    -   
            {charTag(TheWitch, witch_state())}:                     <i>{player_name} quando vuole sa già dove trovarci.</i>

    ->->    


=== final ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    

    {charTag(TheWitch, witch_state())}:    Cose
    
        + \ {charTag(PG, "neutral")}:         Scelta acqua.
            -> glyph_choice_manager(true, waterC)->
            
        + \ {charTag(PG, "neutral")}:         Scelta fuoco.
            -> glyph_choice_manager(true, fireC)->
            
        + \ {charTag(PG, "neutral")}:         Scelta aria.
            -> glyph_choice_manager(true, airC)->
     
        + \ {charTag(PG, "neutral")}:         Scelta terra.
            -> glyph_choice_manager(true, earthC)->
 
        + \ {charTag(PG, "neutral")}:         Scelta spirito.
            -> glyph_choice_manager(true, aetherC)->
        -        
    Cose.
    -> witch_closing_storylet ->
    -> main

