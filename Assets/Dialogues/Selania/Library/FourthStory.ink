//Cognome/alias S - Z

=== salvo
<b>Il cancello</b> di Salvo (he/him).
    //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
        {
            - library_unreadStories has Salvo:
                ~ library_unreadStories -= Salvo
                ~ library_readStories += Salvo
                 -> refresh_book_lists ->
        }  
    -> DarkLibraryModeOn ->
    ~ enableBigDialogue()
    

    Il sole stava tramontando ad occidente e illuminava con i suoi raggi obliqui le chiome degli ulivi.<N>Liliana osservava il viale, dritto, che separava la casa dal cancello; al di là la strada era deserta.<N>Silenziosa, come casa sua.<N>Ogni tanto Artù e Marcella miagolavano, cercando la sua attenzione, mentre lei osservava il mondo fuori: era felice quando richiamavano il suo sguardo, era come tornare a respirare. <N>La notte non dormiva più.<N>Era arrabbiata, le mani le tremavano sul telefono, i pensieri non smettevano mai di tormentarla.<N>Era arrabbiata con la vita, con Dio.<N>Aveva paura.

    Era da sola e tutti, tutti lo sapevano e se ne approfittavano: suo fratello, che era stato presente solo nei giorni subito dopo la morte di Alfredo e che poi era tornato alla sua vita di piaceri; suo zio, che aveva blaterato e blaterato di quanto fosse speciale Alfredo e poi aveva cercato di fregarla falciando l’erba e potando gli ulivi facendosi pagare almeno il doppio.<N>Chi te lo può fare sennò?<N>Aveva sputato e lei aveva ingoiato quella verità ed era rimasta in silenzio. <N>Era settembre e la notte non riusciva a interrompere i ricordi dell’ultimo anno con Alfredo, morto a gennaio: la malattia, il suo volto pallido, che avvizziva come una mela al sole, la paura di rimanere da sola, del futuro.  <N>Di nuovo, dopo mesi, era comparso al cancello suo zio, le mani appoggiate alle barre di metallo.<N>Di suo fratello nemmeno l’ombra.

    L’erba doveva essere falciata di nuovo e Liliana avrebbe voluto rispondere di no, ma lo lasciò fare e di nuovo pagò troppo. Ne aveva parlato con sua zia, la sorella di lui: è un porco, le aveva detto, dovresti chiudergli il cancello in faccia.<N>Cosa avrebbe dovuto fare? Facile a dirsi, pensava, mentre la notte rimuginava.<N>Era sempre più stanca, sempre più arrabbiata e la rabbia sembrava attaccarsi alle pareti di casa, come la luce del sole e le ombre degli ulivi. <N>Aveva iniziato ad uscire e, lontano da casa, le sembrava come di vivere piccole parentesi di tranquillità, si sentiva leggera.<N>Il cimitero dove era sepolto Alfredo e la sua vita di prima erano un orizzonte non esplorato.<N>Era da sola.<N>A volte non più sola.

    Durante i mesi invernali suo zio non venne: meglio così.<N>Vennero l’idraulico però e l’elettricista e lei si sentiva presa in giro, una donna sola incapace di fare ciò che voleva, un peso le si chiudeva sul petto. Perché non riusciva ad essere indipendente?<N>Un giorno suo zio tornò.<N>Lei ne aveva parlato con le sue amiche – le nuove, le vecchie -, ne aveva parlato con la casa.<N>Avrebbe fatto da sola.<N>Avrebbe detto di no, “No”, disse a suo zio quel giorno, “farò da sola, troverò qualcun altro”.

    Gli occhi di suo zio divennero due fessure, “Chi ti aiuterebbe?” ringhiò “Non c’è nessuno qua!”.<N>Ma Liliana non voleva cedere: No, ripeteva, No, scelgo io da sola.<N>Lo zio stava per aprire il cancello.<N>Liliana tremava: storie di famiglia raccontavano del passato violento di quell’uomo.<N>Liliana era stanca, tremava di rabbia, urlo di nuovo e più forte “NO” mentre lui apriva il cancello che di scatto si chiuse, tranciando di netto le mani dello zio.<N>Qualche giorno dopo Liliana andò al cimitero. Era una giornata di sole: in lontananza la casa sua e di Alfredo brillava sulle chiome degli ulivi. 

        + [Vorrei leggere ancora.]
            ~ disableBigDialogue()
           -> book_test_intro
        + [Me ne vado.]
            ~ disableBigDialogue()
            -> DarkLibraryModeOff ->
            -> main


=== maura
    <b>Polvere</b> di Maura (she/they).<N>Instagram: @maura_sacca<N>Trigger warning: violenza fisica.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
       
        + [Inizio la lettura.]
    //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
            {
                - library_unreadStories has Maura:
                    ~ library_unreadStories -= Maura
                    ~ library_readStories += Maura
                     -> refresh_book_lists ->
            }  
        + {library_unreadStories has Maura}[Per ora non me la sento di affrontare questo tema.]
                -> tempTW -> book_test_intro
        + {library_unreadStories has Maura}[Non presentarmi più questo racconto.]
            ~ library_unreadStories -= Maura
                -> refresh_book_lists -> book_test_intro
        -
    -> DarkLibraryModeOn ->
    ~ enableBigDialogue()
    
    Me lo chiede per l'ennesima volta, dopo i miei già innumerevoli no.<N>A questo punto faccio uscire tutta la mia rabbia urlando fino a perdere il respiro.<N>Tirando fuori tutte le cose che mi ero tenuta dentro.<N>E come tutte le volte che provo ad alzare la voce e a farmi sentire lui mi guarda come se fossi pazza.<N>E sì, lo sono.<N>Sono pazza.<N>Quella pazzia che quando fuoriesce non puoi più controllare.

    Tutte le frasi che avevo cercato di dire con calma, a mezza bocca in quegli anni passati, adesso mi fanno bruciare i polmoni, mi rompono la voce.<N>Pur non avendo più fiato continuo a urlare cercando di prendere il respiro per non morire di asfissia <N>Ad ogni urlo divento sempre più grande mentre lui si rimpicciolisce.<N>Sono enorme mentre lui è diventato piccolo, così piccolo che posso stringerlo nel palmo della mia mano.<N>Sento che ha paura della mia pazzia.<N>E fa bene.<N>La mia mano comincia a stringersi attorno a lui, facendo attenzione a non coprirgli la faccia perché non voglio perdermi neanche un secondo della sua sofferenza.
    
    Prova a parlare, a chiedermi pietà, e io rido.<N>La malvagità stampata sul mio volto - Perché non provi a chiedermelo di nuovo? -.<N>Lui apre la bocca.<N>Urlo più forte - CHIEDIMELO ANCORA! -<N>Nel momento in cui prova di nuovo a prendere fiato lo stringo con entrambe le mani e lo faccio diventare polvere.<N>Raccolgo il cumulo rimasto nella conca della mia mano e lo soffio al vento.<N>Lo guardo volare via con il sorriso sul volto mentre ritorno alle mie dimensioni normali.<N>Mi accorgo che anche la mia pazzia sta volando via.<N>La riacciuffo immediatamente “Tu resti qua con me.

        + [Vorrei leggere ancora.]
            ~ disableBigDialogue()
           -> book_test_intro
        + [Me ne vado.]
            ~ disableBigDialogue()
            -> DarkLibraryModeOff ->
                     
            -> main


=== simo
<b>SCP</b> di Simo (they/he).<N>Instragram: @il_radioattivo<N>Trigger violenza, deadnaming, morte.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        + [Inizio la lettura.]
//Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
            {
                - library_unreadStories has Simo:
                    ~ library_unreadStories -= Simo
                    ~ library_readStories += Simo
                     -> refresh_book_lists ->
            }        
        + {library_unreadStories has Simo}[Per ora non me la sento di affrontare questo tema.]
            -> tempTW -> book_test_intro
        + {library_unreadStories has Simo}[Non presentarmi più questo racconto.]
            ~ library_unreadStories -= Simo
                -> refresh_book_lists -> book_test_intro
        -
    -> DarkLibraryModeOn ->
    ~ enableBigDialogue()


    Da anni studio gli SCP. Avete sicuramente presente, dai, quegli eventi paranormali che in qualche modo connettono il nostro mondo a un mondo alternativo, diverso, alieno - questo in realtà non è molto chiaro.<N>Come appaiono? Come oggetti o luoghi che in qualche modo non si comportano come dovrebbero.<N>Da un rasoio elettrico che si accende automaticamente quando lo si direziona verso nord a una sedia che va in autocombustione quando un sente il suono di un tram.<N>Ecco, in questo mio studio, in realtà, ho sempre finito per imbattermi in SCP legati in qualche modo a specifiche emozioni.

    Tipo lo specchio in grado di percepire se chi lo osserva prova amore(facendone sparire il riflesso), oppure lo stereo che suonava La Cucaracha quando percepiva invidia nell'aria.<N>Però, senza dubbio, l'SCP più strano che ho incontrato è stata una porta. Fra l'altro è stato l'unico<N>SCP con cui ho avuto a che fare in grado di parlare.<N>"<i>Ciao.</i>"<N>"Uh, ciao. Chi sei?"<N>"<i>Io.</i>"<N>"Io chi?"<N>"<i>La porta.</i>"<N>"In che senso “la porta”?"

    "<i>La porta. La porta. Vedi molte altre porte di fronte a te o nel resto di questo corridoio?</i>"<N>"Beh, ehm, no, cioè, nel senso."<N>"<i>Ti ricordo che dovresti essere tu l'umanoide in grado di parlare, non io. Io teoricamente dovrei essere solo una porta di legno massello.</i>"<N>"Hai ragione, scusami."<N>"<i>Ahahah! Assurdo. È la prima volta che chiedi scusa a una porta, vero?</i>"<N>"Sì. Oddio, beh, in realtà no."<N>"<i>No?</i>"<N>"No. Ero a casa di mia nonna. Un pugno, aveva di nuovo sbagliato a chiamarmi per nome."<N>"<i>Capisco.</i>"

    "Curioso." <N>"<i>Che cosa?</i>"<N>"Non ho mai chiesto scusa a mia nonna per la porta."<N>"<i>C'è da capire se si meritava le tue scuse.</i>"<N>"No. Ma non importa. Credo. Dopo quella volta l'ho rivista solo una volta. Al suo funerale."<N>"<i>Capisco. Ma hai chiesto scusa alla porta.</i>"<N>"Sì. Non c'entrava nulla, si era solo trovata davanti a me nel momento sbagliato."<N>"<i>Eh, ogni tanto noi porte lo facciamo.</i>"<N>"Di mettervi nel mezzo."

    "<i>Sì, ma non soltanto.</i>"<N>"Che intendi?"<N>"<i>Intendo che siamo custodi. Non di oggetti, tesori, averi, persone. Nah.</i>"<N>"Ok. Custodi di cosa, allora?"<N>"<i>Pensaci: com'eri prima di quel pugno alla porta? No, non rispondere, lo so già: fuggivi dal mondo, dalle persone, dal giudizio e da chissà che altro.</i>"<N>"Già."<N>"<i>Poi hai incontrato quella porta. Un pugno, un singolo pugno. Da allora tutto è cambiato, vero?</i>"<N>"Già."<N>"<i>Ecco di cosa siamo custodi. Del vostro io, della vostra realtà, della vostra identità. Della vostra rabbia."

    "Rabbia? È questo che sei?"<N>"<i>Cos'è? Percepisco forse della delusione?</i>"<N>"No, no, anzi. Solo che, boh, ti immaginavo più violenta."<N>"<i>Sì, sì, ci credo, guarda. Magari ti immaginavi che la rabbia fosse, che so, un fucile d'assalto, vero?"<N>"E invece..."<N>"E invece sei una porta decisamente pacata."<N>"<i>Ma sì, che senso avrebbe che io urlassi, strepitassi, sbattessi? Cambierebbe forse qualcosa del mio essere porta? Nah, per nulla.</i>"

    "Invece..."<N>"<i>Invece se ad aprirmi, sbattermi, rompermi, sfondarmi, sei tu...</i>"<N>"Cosa troverò al di là?"<N>"<i>Al di là di me?</i>"<N>"Sì."<N>"<i>Dai un'occhiata.</i>"

        + [Vorrei leggere ancora.]
            ~ disableBigDialogue()
           -> book_test_intro
        
        + [Me ne vado.]
            ~ disableBigDialogue()
            -> DarkLibraryModeOff ->
            -> main
            

=== letizia_vaccarella
<b>Dodici stelle</b> di Letizia Vaccarella (she/her).<N>Instagram: @aidoruinquantumland<N>Trigger warning: depressione.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        + [Inizio la lettura.]
//Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
            {
                - library_unreadStories has LetiziaVaccarella:
                    ~ library_unreadStories -= LetiziaVaccarella
                    ~ library_readStories += LetiziaVaccarella
                     -> refresh_book_lists ->
            }        
        + {library_unreadStories has LetiziaVaccarella}[Per ora non me la sento di affrontare questo tema.]
            -> tempTW -> book_test_intro
        + {library_unreadStories has LetiziaVaccarella}[Non presentarmi più questo racconto.]
            ~ library_unreadStories -= LetiziaVaccarella
                -> refresh_book_lists -> book_test_intro
        -
    -> DarkLibraryModeOn ->
    ~ enableBigDialogue()
    
    Jodorowsky diceva che qualsiasi guarigione richiede la disobbedienza perché alla base di ogni malattia c'è un divieto.<N>E se da un lato mi dico ma che cazzo ne sa Jodorowsky, lui leggeva i tarocchi di Marsiglia, io sono da Rider-Waite anzi da Waite-Smith; dall'altra, mentre conto le stelle disegnate sulla corona dell'imperatrice, inizio a pensare alla mia malattia. <N>Credo di averla da sempre, o comunque non mi ricordo di non averla avuta.<N>Di solito i sintomi sono blandi e facili da tenere sotto controllo, per questo guardandomi non diresti mai che sono malata.<N>Ma lei c’è, è sempre lì.<N>Sottopelle, come un fiume nero che scorre in profondità, nascosto agli occhi del mondo, anche a quelli che provano a vedermi per davvero anzi, sopratutto a quelli.
    
    A volte si manifesta con un peso nel petto, altre con un tremore nelle mani, ma il sintomo più frequente è il silenzio.<N>Il silenzio che mi avvolge e mi soffoca, che mi impone di abbassare lo sguardo, di sorridere quando non voglio, di accettare tutto con pacata rassegnazione.<N>Osservo la carta tra le dita.<N>L’Imperatrice mi fissa con il suo volto sereno, la corona di stelle che le adorna il capo.<N>Conta le stelle, mi dico.<N>Una, due, tre… Dodici.<N>Come i mesi dell’anno, come le ore di un orologio che segna l’eterno sospeso che è la mia vita.<N>Lei è la creatrice, la Demetra risolta, la dea feconda. <N>Ma io? Io mi sento sterile di parole, di possibilità, soffocata da una prigione senza sbarre.
    
    Di nuovo da un medico che non sa dirmi cosa ho.<N>“È stress,” dice. “Forse ansia, forse un problema psicosomatico. Ha provato a perdere qualche chilo?”.<N>Non può vedere il veleno che mi scorre dentro, che si accumula in ogni “sì” detto quando volevo dire “no”, in ogni “va tutto bene”, mi ripeto che dovrei andare da una medica.<N>Torno a casa dai tarocchi, Waite-Smith naturalmente, mescolo le carte 7 volte, le divido per 3 volte in 3 mazzi e per tre volte ne rifaccio un mazzo unico.<N>Chiudo gli occhi, faccio scorrere il mazzo sotto le dita, il pollice accarezza ogni singola lama, cercando di leggere ogni fibra della carta.<N>Non ho una domanda precisa in testa, solo un vago sentire ma so che ormai io e loro ci capiamo anche senza parlare.<N>Lo sento, quel brivido leggero e quel tremore nella pancia, le dita si bloccano su una carta, la giro, la Forza.<N>La donna accarezza il leone, la sua mano sfiora le fauci aperte, ma non c’è paura nel suo volto.<N>Mi domando se anche lei abbia trattenuto la rabbia, per quanto tempo? Avrà dovuto imparare a domarla? 
    
    Giro una carta, il Diavolo, la lancio via. Non voglio più domarla. Voglio lasciarla uscire.<N>Un’altra carta, la Morte.<N>Inizio a sperimentare un nuovo sintomo: il calore. Un fuoco che mi cresce dentro, che mi riempie il petto e le mani.<N>Non è febbre, non è dolore.<N>È qualcosa di diverso, qualcosa che non ho mai sentito prima.<N>E allora faccio qualcosa che non ho mai fatto: urlo.<N>Non un grido di paura, non un lamento, ma un urlo vero.<N>Forte, vibrante, un’onda che rompe il silenzio e spazza via anni di obbedienza.
    
    E mentre urlo, sento che qualcosa dentro di me cambia.<N>Il fiume nero smette di scorrere in segreto e si trasforma in un incendio che mi brucia, ma non mi distrugge. Mi purifica.<N>Giro il mazzo, l’ultima carta, il Matto.<N>Il viaggiatore con il fagotto sulla spalla, il piede sospeso sull’orlo del precipizio.<N>Un salto nel vuoto, un atto di fede.<N>Lo guardo e sorrido, per la prima volta da mesi, da anni o forse da sempre, è un sorriso che è tutto mio ed è solo per me.

        + [Vorrei leggere ancora.]
            ~ disableBigDialogue()
           -> book_test_intro
        
        + [Me ne vado.]
            ~ disableBigDialogue()
            -> DarkLibraryModeOff ->
            -> main
            
    

=== queerginia_wolf

        -> DarkLibraryModeOn ->
        ~ enableBigDialogue()
        //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
        {
            - library_unreadStories has QueerginiaWolf:
                ~ library_unreadStories -= QueerginiaWolf
                ~ library_readStories += QueerginiaWolf
                 -> refresh_book_lists ->
        }
        
<b>Giallo</b> di Queerginia Wolf/Marco Spelgatti (she/he/they).<N>Instagram: @queerginiawolf

    Non hai fatto nulla di male.<N>Lanciavi i tuoi fiori nell'aria, il polline rendeva il sentiero giallo per settimane.<N>Accoglievi gli uccelli, offrivi i tuoi vecchi rami ai cani felici che correvano sopra le tue radici. <N>Tenevi ferma la terra, assorbivi l'acqua.<N>Trasformavi il sole in ombra, in aria.<N>Stamani sono passata e ti hanno tagliato.<N>Ci hanno messo tre ore e due minuti a cancellare i tuoi decenni.<N>A segare i tuoi rami fioriti, il tuo tronco su cui le formiche scendevano e salivano.<N>Nel parco è rimasto un vuoto più ampio dello spazio che hai mai occupato.
    
    L'ho fatto senza pensarci: ho posato la mano a terra.<N>Ho pregato.<N>E tutto quello che vedevo ha bruciato.<N>Ma.<N>Stasera, tornando niente fuoco, niente fuliggine. <N>Ma vicino alla tua carcassa il cane e io abbiamo notato un pollone.<N>Tenace e piccolino teso verso l'alto, i rami ancora gemme, la corteccia morbida e rigata.<N>Le macchine che ti hanno tagliato moriranno.<N>Spariranno gli uomini che le hanno comandate.
    
    Ma tu, di notte in notte, riprenderai a lanciare i tuoi fiori nell'aria.<N>A rendere gialla la strada verso casa.

        + [Vorrei leggere ancora.]
            ~ disableBigDialogue()
           -> book_test_intro
        + [Me ne vado.]
            ~ disableBigDialogue()
            -> DarkLibraryModeOff ->
            -> main
    
    