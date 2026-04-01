//Cognome/alias A-E

=== adri_allora
<b>Il mio bellissimo gatto</b> di Adri Allora (ləi).<N>Trigger warning: violenza psicologica, abusi fisici.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}

    + <i>Inizio la lettura.
    //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
        {
            - library_unreadStories has AdriAllora:
                ~ library_unreadStories -= AdriAllora
                ~ library_readStories += AdriAllora
                 -> refresh_book_lists ->
        }  
    + {library_unreadStories has AdriAllora}<i>Per ora non me la sento di affrontare questi temi.
        -> tempTW -> book_test_intro
    + (rimuovi) {library_unreadStories has AdriAllora} <i>Non voglio più incontrare questa storia.
        -> permanentTW -> refresh_book_lists -> book_test_intro
    -
-> DarkLibraryModeOn ->
~ enableBigDialogue()
    
    Mi chiama.<N>La mia rabbia è un gatto che insiste per essere nutrito in continuazione, mi chiama, mi chiama con quell'insistenza che ha costretto sir Isaac Newton a inventare la porticina per i gatti.<N>Ma il mio mi chiama, mi chiama, mi chiama e poi mi ricorda che condivide il novantacinque virgola sei percento del suo DNA con le tigri sopraffacendomi: bevo, disegno, mi drogo, scrivo, mi picchio, dipingo, spacco cose.
    
    Poi mi ritrovo però a dover spiegare che cosa stessi facendo ieri sera visto che non rispondevo al telefono o perché non provo piacere guardando gli acquerelli e il disegno sul muro o come mai ho lo zigomo gonfio (vorrei avere il coraggio di rispondere che la prima regola è non parlarne, invece sono porte goffaggine spigoli e maldestrezza) o perché quella sedia si è rotta.<N>È faticosa come il dolore, la rabbia.
    
    In realtà il nostro è un lavoro di squadra: se non andassi a sgattare in incognito nei social della mia ex, il mio gatto rimarrebbe fuori dalla portata del suo tagliente miagolio.<N>Se non controllassi insistentemente il lavoro degli altri in ufficio.<N>Se non m'impuntassi sul tono svogliato o scocciato.<N>Se non.<N>E invece miagola, miagola, miagola, miagola.
    
    E io a dargli corda, a ingrandire il disegno sul muro, a improvvisare un'altra storia a fumetti con gli acquerelli, a spaccare un'altra antina del mobile della cucina, a bere fino a sfinire la mia coscienza (ma poi che male risvegliarsi il mattino dopo sul pavimento del bagno: non ho più l'età per certe cose).<N>Faccio cose brutte in preda al gatto e poi il gatto mi deride per la bruttezza delle cose che ho fatto e m'infuria.
    
    
    Un giorno, mentre pranzavo di fronte al portatile, ho aperto i social dei miei vecchi colleghi per capire come se la stavano passando dopo che mi ero licenziatə<N>e se la passavano splendidamente,<N>come se fosse stata colpa mia tutta l'acredine attraverso la quale bisognava cercare gli altri in ufficio negli ultimi tempi, gli scazzi, le battute passivo-aggressive<N>e il gatto<N>ha iniziato<N>a miagolare


    e ho stretto la forchetta fortissimo mentre faticavo a ingoiare il boccone e miagola e il pugno mi tremava e miagola e sentivo il sudore freddo e miagola le tempie che pulsano e miagola non riesco a chiudere gli occhi e miagola inizio a ripetermi in testa le cose e <N>poi non so cos'è successo.<N>Ho respirato.
    
    Mi son presə il gatto sulle ginocchia.<N>Ho iniziato ad accarezzarlo.<N>Cos'è che vuoi da me, rabbia?<N>Mi ha rivolto uno sguardo dorato, ha fatto le fusa.<N>E niente: mi ha lasciato quattro buchi sulla coscia con i suoi artigli, 'sta scena m'ha ricordato Frankenstein Junior.
    
        + <i>Vorrei leggere ancora.
        ~ disableBigDialogue()
           -> book_test_intro
        
        + <i>Me ne vado.
        ~ disableBigDialogue()
            -> DarkLibraryModeOff ->
            -> main

=== alexias_d_avino
<b>Il Riflesso</b> di Alexias D'Avino (lui/lei).<N>Instagram: @togetherweread29<N>Trigger warning: lutto, rifiuto da parte della figura genitoriale.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        
        + <i>Inizio la lettura.
        //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
            {
                - library_unreadStories has AlexiasDAvino:
                    ~ library_unreadStories -= AlexiasDAvino
                    ~ library_readStories += AlexiasDAvino
                     -> refresh_book_lists ->
            }  
        + {library_unreadStories has AlexiasDAvino}<i>Per ora non me la sento di affrontare questo tema.
            -> tempTW -> book_test_intro
        + (rimuovi) {library_unreadStories has AlexiasDAvino}<i>Non voglio più incontrare questa storia.
            -> permanentTW -> refresh_book_lists -> book_test_intro
        -
    -> DarkLibraryModeOn ->
    ~ enableBigDialogue()

    Shmi entrò nell'appartamento trascinandosi dietro lo zaino.<N>Odiava il suo lavoro: la contabilità era una delle cose più noiose sulla faccia della Terra e ci si era buttatə a capofitto per paura di finire in mezzo a una strada.<N>Il suo ex fidanzato glielo aveva detto, si stava scavando la fossa da solə.<N>Dopo una lunga doccia, infilò il suo pigiama preferito, quello con le eroine dei manga che tanto amava leggere.
    
    Mentre si guardava allo specchio del bagno, con i capelli raccolti in una coda scomposta, le occhiaie scure sul viso olivastro e un'espressione a metà tra l'angoscia più totale e la noia, si chiese se sarebbe mortə giovane.<N>Magari l'avrebbero trovatə proprio con quel pigiama, con gli occhi spenti e il corpo già rigido e freddo.<N>Dopo quelle riflessioni fondamentali, Shmi entrò con una lentezza disarmante in camera da letto.
    
    Adorava così tanto il colore turchese che aveva arredato la sua stanza con qualsiasi tipo di arredo di quella tonalità.<N>L'unica cosa che stonava era il bianco delle tende che aveva trovato quando aveva affittato l'appartamento.<N>Doveva aggiungere l'acquisto di un nuovo tendaggio alla lista della spesa.<N>Sospirò.
    
    Era diventatə come sua madre, tutto doveva essere coordinato.<N>Sotto controllo,proprio come piaceva a lei.<N>Se avessi un minimo di ordine, non saresti un eterno scapolo!<N>Col tempo, sua madre era venuta a patti con la sua identità e aveva evitato i pronomi maschili.<N>Aveva persino accettato di vederlə con un uomo, ma le sue parole l'avevano feritə lo stesso.

    Nonostante il lavoro, nonostante il tetto sulla sua testa e la prospettiva di una vita piuttosto normale, nulla era in ordine nel cervello di Shmi.<N>Ogni notte si svegliava di soprassalto, con il cuore in gola e le gambe tese, pronte a saltare dal letto e correre il più lontano possibile.<N>Sognava il suo docente di arte che lə urlava contro e lə diceva che non sarebbe mai diventatə unə artista.
    
    Vedeva la delusione negli occhi di sua madre, quando lə aveva detto di volersi laureare in pittura e arti visive.<N>Riviveva il funerale di nonna Olga, l'unica persona che credeva in ləi.<N>Ogni singola volta, Shmi desiderava prendere a pugni qualcuno, strappare i disegni che tappezzavano la parete della camera, un'accozzaglia di colori, bozze tracciate con il carboncino e piccoli quadri dipinti a olio.
    
    Si voltò verso lo specchio di nonna Olga, alto quanto ləi e inserito in una semplice cornice d'argento.<N>I momenti con lei erano i più preziosi.<N>Ricordava i pomeriggi passati a ballare, vestitə da principessa guerriera, i biscotti sempre bruciati e le risate che riempivano quella vecchia casa.<N>Con nonna Olga aveva iniziato a dipingere.
    
    Aveva imparato a sognare.<N>Adesso non vedeva altro che il riflesso di una persona triste.<N>Era dimagritə troppo, forse perché dimenticava di mangiare, e i suoi occhi, piccoli e scuri, rendevano il suo sguardo sempre severo e cupo.<N>Le amiche di Shmi lə dicevano che, con un makeover come quello delle romcom degli anni 2000, sarebbe potutə sembrare unə fotomodellə, visto che era sempre statə parecchio altə.<N>Quante sciocchezze, pensò sbuffando.
    
    Chiuse gli occhi per trattenere le lacrime di frustrazione.<N>Un'aria fresca entrò nella stanza:forse aveva lasciato la finestra aperta, cosa strana, visto che detestava gli odori della metropoli.<N>Quando riaprì gli occhi, quasi inciampò per terra dallo stupore: non era più a casa.
    
    Al posto del parquet, ai suoi piedi c'era una distesa di fili d'erba e fiori.<N>Alzò lo sguardo, vide una casa dipinta di bianco, con il tetto color lavanda.<N>Quella era la sua vecchia casa, immersa tra rose, violette e tulipani di tutte le varietà.<N>Si avvicinò ai gelsomini e non riuscì a trattenere le lacrime quando sentì il loro profumo: dolce e intenso, proprio come lo ricordava.<N>Colse uno dei fiorellini bianchi, quasi di riflesso.
    
    I petali cominciarono a sciogliersi tra le dita, come una tela lasciata sotto la pioggia. Allo stesso modo, ogni cosa intorno a Shmi iniziò a svanire.<N>Fu a quel punto che vide una figura scura, in attesa vicino alla porta d'ingresso.<N>“C-chi sei?” sussurrò. A quel punto, la figura iniziò a camminare verso di ləi.<N>Il terrore percorse tutto il corpo di Shmi, che iniziò a correre verso il lato opposto della casa.<N>Il cuore batteva all'impazzata, il fiato spezzato.<N>Tutto quello che riusciva a fare era scappare.

    Poi, come se fosse saltatə da uno dei suoi dipinti all'altro, Shmi si trovò in spiaggia.<N>Era uno dei suoi posti preferiti, dipinto quando aveva un disperato bisogno di fuggire dalla città.<N>Ma tutto lə sembrava diverso.<N>Le nuvole erano nere, cariche di pioggia.<N>Un'onda alta quasi quanto il palazzo dove abitava minacciava di abbattersi sulla spiaggia con tutta la sua violenza.<N>Vide la figura scura di prima scivolare leggiadra sulla cresta dello tsunami, quasi come se stesse guidando il mare verso di ləi.
    
    Un attimo dopo, stava affogando, il suo corpo lottava disperatamente contro le correnti.<N>Era tutto buio attorno e più si muoveva, meno forza aveva per risalire in superficie.<N>Con un bagliore di luce improvviso, lo scenario cambiò ancora e Shmi riprese a respirare.<N>Mentre vomitava acqua salmastra, un nuovo luogo prese vita attorno a ləi: uno stagno pieno di fiori di loto, illuminato dalla luna e da stelle che sembravano appena uscite da un quadro di Van Gogh.
    
    Non l'aveva mai visto prima, né l'aveva immaginato durante una delle sue esplosioni di creatività.<N>Quando la vista si abituò alla luce degli astri, si accorse che stava camminando sulla superficie dello specchio d'acqua. Shmi cominciò a tremare, non perché fosse ancora bagnatə, ma perché la rabbia le incendiava il cuore.<N>Non bastava che fosse intrappolatə in una vita che non sentiva sua, adesso era tormentatə da chissà quale forza invisibile.<N>Fu allora che la figura si avvicinò, quasi come se avesse sentito i suoi pensieri.
    
    Ora Shmi poteva vedere le sue forme: aveva una silhouette familiare, cinta da un corpetto smeraldo in stile vittoriano, stretto in vita e da un pantalone palazzo sporco di… pittura?<N>I capelli scuri erano legati in una treccia che lə arrivava alle spalle, le perle che portava al collo brillavano come la luna.<N>Gli occhi scuri erano pieni di vita e studiavano Shmi.<N>“Perché stai scappando da me? Da te stessə?”<N>La figura proiettò un pensiero che fece increspare la superficie dello stagno.
    
    
    Shmi si accorse che stringeva tra le mani una spada.<N>«Chi sei? Cosa vuoi da me?!».<N>Urlò, la gola ancora irritata dopo tutta l'acqua di mare che aveva bevuto.<N>“Sono te. Beh, sono la persona che vorresti essere, la principessa guerriera che la nonna amava. Che ti è successo? Non sei più tu!”<N>Shmi non sapeva cosa dire. La rabbia di quella versione di sé così diversa la fece indietreggiare.<N>Era così che lə vedevano le persone attorno a lei?<N>Una creatura piena d'ira?
    
    Davanti alla confusione di Shmi, l'espressione della principessa guerriera si fece più dolce.<N>Non era compassione, ma piena consapevolezza del senso di smarrimento che entrambə provavano.<N>“Puoi ancora aggiustare tutto. Puoi essere chi desideri. La nonna diceva che potevamo fare qualsiasi cosa, finché restavamo fedeli a noi stessə.” Tese la mano verso Shmi. “Facciamolo, insieme.”<N>Quando le loro dita si intrecciarono, Shmi sentì un calore che si sostituì al gelo che aveva provato fino ad allora.
    
    "Non devi più nasconderti, principessa."<N>La voce di nonna arrivò come una carezza, come il profumo di gelsomino e il calore dei suoi abbracci.<N>Shmi non aveva più paura della rabbia.<N>Con essa avrebbe dipinto un nuovo futuro.<N>Quando riaprì gli occhi, era ancor davanti allo specchio.<N>Il suo riflesso, però, era cambiato.<N>In ləi c'era la stessa fiamma che albergava negli occhi della principessa guerriera.<N>Corse nel piccolo soggiorno del suo appartamento.
    
    Dallo sgabuzzino tirò fuori una tela bianca e il cavalletto.<N>Poi afferrò l'astuccio con le matite e i pennelli.<N>Un'infinità di realtà l'aspettava al di là di quella tela bianca.<N>Doveva solo disegnare la porta.<N>“Basta nascondersi.”<N>Il suo futuro cominciò con una pennellata di verde.

        + <i>Vorrei leggere ancora.
            ~ disableBigDialogue()
            -> book_test_intro
        
        + <i>Me ne vado.
            ~ disableBigDialogue()
            -> DarkLibraryModeOff ->
            -> main


=== aza
<b>Luna vergine</b> di Aza (any).<N>Trigger warning: alcolismo, violenza fisica.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        
        + <i>Inizio la lettura.
        //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
            {
                - library_unreadStories has Aza:
                    ~ library_unreadStories -= Aza
                    ~ library_readStories += Aza
                     -> refresh_book_lists ->
            }  
        + {library_unreadStories has Aza}<i>Per ora non me la sento di affrontare questo tema.
            -> tempTW -> book_test_intro
        + (rimuovi) {library_unreadStories has Aza}<i>Non voglio più incontrare questa storia.
            -> permanentTW -> refresh_book_lists -> book_test_intro
        -
    -> DarkLibraryModeOn ->
    ~ enableBigDialogue()
        
    Le caviglie tentennano quando provo a sedermi nella hall dell'hotel, ma in piedi continuerei a fare avanti e indietro col ticchettio dei tacchi che rimbomba, non voglio attirare ulteriormente l'attenzione degli ospiti.<N>La brezza di mare si scaglia dalla porta girevole fino agli ascensori, anche di notte non cede. Un vento medio, di quelli che alza la sabbia ma non gli aquiloni, così da quattro giorni, da quando sono arrivata.<N>Il piano è semplice, ho capito la sua routine, gli ho chiesto se avesse da accendere e abbiamo fatto due chiacchiere, non si è sicuramente accorto di chi sono, non si ricorda di me, la trasformazione ha avuto successo.
    
    
    Quindi è oggi la notte in cui succede. Allora facciamolo succedere.<N>Faccio un respiro profondo e mi incammino verso il lounge bar, la musica jazz-techno l'ho sempre odiata ma sono contenta di avere un ritmo sul quale sbattere l'ansia con le dita.<N>Ordino un drink, annuso la stanza, sta arrivando.<N>"Hey cappello volante!" eccolo. "Ancora sola? Non è mai arrivato a farti compagnia?"
    
    Ho inventato una storia strappalacrime, un fantomatico zio molto ricco che doveva venire in villeggiatura con me, non è mai arrivato perché non è mai esistito.<N>Sono ventitré anni che lavoro a questo piano e risparmio soldi per fingermi ricca.<N>Rispondo con tono malinconico "Ancora sola, morirò sola" lo faccio ridere sguaiatamente.<N>"Una donna così bella non può morire sola, lascialo stare sarà stato impegnato col suo business, sai come sono i clienti" ah sì so benissimo come sono i ricchi.
    
    "Lo capisco… Avrei voluto soltanto che il vento si calmasse e mio zio arrivasse per l'ultima sera, per lo spettacolo pirotecnico" figurati se non abbocca.<N>"Ma zucchero è impossibile restare sole in una notte del genere, posso accompagnarti io, anche Irene sarà entusiasta".<N>Per un attimo mi sento in pena per la moglie di questo viscido uomo, incredibile come lui si offra di fare una cosa e dia per scontato che la sua appendice femminile agirà di conseguenza.<N>"Se c'è anche Irene allora va bene…"
    
    Torniamo alla hall, la sua donna si aggrega, chiacchieriamo del nulla solo io e lui, provo a tenermi indietro, con calma inizio a studiare il suo corpo irregolare.<N>Ci sediamo in un tavolo lontano dalla spiaggia, oggi la luna piena è in vergine, ironico.<N>Ormai Irene non soffre più quando il suo verme da compagnia dedica tutte le sue attenzioni a un'altra donna, ci ignora completamente e ammira lo spettacolo di luci nel cielo.<N>Io e lui chiacchieriamo, di soldi, di lavoro, di figli, di amanti, di sesso e di morte.<N>"Vado in bagno" e Irene scompare, è il momento.
    
    "Sai Jacopo devo confessarti una cosa… Son molto invidiosa di Ire-" si allunga verso il mio viso e appiccica le labbra contro le mie, lo avevo già calcolato, questo è il momento più difficile di oggi, l'apice della fatica, mai stato così impossibile esistere dentro questo corpo, una seconda volta, ma questa volta devo resistere, questa volta è completamente diversa.<N>Sto al bacio, se "bacio" possiamo chiamarlo, stringo gli occhi e apro la bocca, la sua lingua disgustosa invade la mia con un sapore di limone e menta, fingo di non essere me, ma Irene in una normale serata d'estate.<N>"Andiamocene" mormoro, "si certo" ansima.
    
    Ci defiliamo in uno dei piccoli nascondigli in spiaggia, due lettini che lui unisce sbattendoci contro i piedi, i paravento e l'ammasso di fiori freschi ci isola dal resto del mondo, solo le ombre e le luci mi fanno compagnia.<N>Si toglie la maglietta e prova a togliere la mia, credo che nei palpeggiamenti non consensuali abbia sfiorato tante cose che non doveva sfiorare del mio corpo, tipo il coltello che sfilo dalla schiena.<N>Mentre tolgo gli stivali impugno per bene il fazzoletto pregno di fenobarbital, lo agito nell'aria come se fosse l'oggetto più seducente del mondo, lui mi guarda con la faccia di uno che mi sta implorando di essere ammazzato. Mi sento quasi felice.
    
    Mi lancio sul suo corpo, voglio entrargli dentro e farlo esplodere, gli tengo il fazzoletto sulla bocca e dopo qualche secondo le sue membra si placano.<N>Il mio respiro si fa grande e minaccioso, inizio a inspirare frettolosamente come per indurre un attacco di iperventilazione, e poi esco dal nascondiglio e fisso la luna, lascio che mi entri negli occhi e nel cuore. Le vene si fanno bollenti, mentre mi sento diventare gigante finisco di spogliarmi, inizia la trasformazione.
    
    Sento la pelle delle punta delle dita farsi sottile e le unghie allungarsi. Non mi ero mai trasformata in mannara con così tanta manicure e con vestiti così costosi, inizio a perdere lucidità, era questo l'obiettivo, ci siamo entrambe dentro questo corpo.<N>Ventitré anni di studio freddo e preciso che culminano nella furia totale, l'ira mi pervade.
    
    L'ultima cosa che ricordo è la sensazione di sabbia fredda fra le dita dei piedi, i botti dei fuochi d'artificio e il suo ansimare sofferente, non saprò mai se mi ha riconosciuta o meno.
    
        + <i>Vorrei leggere ancora.
            ~ disableBigDialogue()
           -> book_test_intro
        + <i>Me ne vado.
            ~ disableBigDialogue()
            -> DarkLibraryModeOff ->
                     
            -> main


=== steno_artico
<b>Questa rabbia, che mi è stata rubata</b> by StenoArtico (he/him, none).<N>Instagram: @stenoartico<N>Trigger warning: violenza psicologica, abusi fisici, depressione.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        
        + <i>Inizio la lettura.
        //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
            {
                - library_unreadStories has StenoArtico:
                    ~ library_unreadStories -= StenoArtico
                    ~ library_readStories += StenoArtico
                     -> refresh_book_lists ->
            }  
            -> refresh_book_lists ->
        + {library_unreadStories has StenoArtico}<i>Per ora non me la sento di affrontare questo tema.
            -> tempTW -> book_test_intro
        + (rimuovi) {library_unreadStories has StenoArtico}<i>Non voglio più incontrare questa storia.
            -> permanentTW -> refresh_book_lists -> book_test_intro
        -
    -> DarkLibraryModeOn ->
    ~ enableBigDialogue()
    
    Arriva sempre,<N>quando sono già a terra,<N>a prendermi a calci nello stomaco<N>quella voce arrabbiata<N>che mi chiama definisce condanna<N>la persona peggiore possibile<N>inutile<N>schifosa.<N>Ma perché ce l'ha a morte con me?


    Siamo come un coniglio che si azzanna la zampa<N>intrappolata in una tagliola.<N>Ma perché nessuno azzanna il cacciatore?<N> <N>Da dove arriva?<N>È un'eco dell'infanzia? Il commento di una zia stanca e distratta<N>ormai impresso a carne viva nel cervello?<N>Ma forse questa è una domanda malriposta.
    
    Non ha origine,<N>è l'origine: azione e reazione,<N>energia eterna che tocca,<N>rimbalza, trasforma.<N>In fondo tutto è nato da uno scoppio,<N>non da una timida alzata di mano.<N> <N>Questa rabbia, che mi è stata rubata,<N>voglio provare a riabbracciarla.
    
    Voglio catturare il suo fulmine a mani nude.<N>Farà male, ma va bene.<N> <N>Voglio spaccare il labirinto di specchi<N>e farne finestre.<N> <N>Voglio puntare questo nuovo uragano lontano,<N>verso i monti della mia mente,<N>trasformare le loro pale eoliche in eliche<N>e farla decollare.<N>
    
    Verso dove, ancora non lo so.<N>E mi piace.

        + <i>Vorrei leggere ancora.
        ~ disableBigDialogue()
           -> book_test_intro
        + <i>Me ne vado.
        ~ disableBigDialogue()
            -> DarkLibraryModeOff ->
                     
            -> main

=== b
// <b>The touch of anger</b> di K.(she/her).
<b>Il tocco della rabbia</b> di K.(she/her).<N>Trigger warning: violenza fisica, depressione.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        
        + <i>Inizio la lettura.
        //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
            {
                - library_unreadStories has B:
                    ~ library_unreadStories -= B
                    ~ library_readStories += B
                     -> refresh_book_lists ->
            }  
        + {library_unreadStories has B}<i>Per ora non me la sento di affrontare questo tema.
            -> tempTW -> book_test_intro
        + (rimuovi) {library_unreadStories has B}<i>Non voglio più incontrare questa storia.
            -> permanentTW -> refresh_book_lists -> book_test_intro
        -
    -> DarkLibraryModeOn ->
    ~ enableBigDialogue()

    Ricordo ancora nitidamente quanto la rabbia fosse un'emozione che temevo profondamente.<N>Da bambina sono cresciuta subendo gli improvvisi scatti d'ira di mio padre, espressione di un trauma generazionale che non ha mai avuto la possibilità di superare.<N>Naturalmente la rabbia è diventata qualcosa che temevo, e ho modellato la mia vita in modo da evitare di esserne bersaglio.<N>Le persone erano contente di me perché ero una ragazza docile che ascoltava gli insegnanti e gli adulti e che non dava mai preoccupazioni ai suoi genitori.
    
    
    A volte mi ritrovo ancora a pensare a quanto del mio vero io ho nascosto a causa dei miei meccanismi di difesa.<N>La mia infanzia non mi ha fornito gli strumenti per controllare questa emozione durante la mia turbolenta adolescenza.<N>Quando sentivo la rabbia crescere dentro di me questa si trasformava presto in frustrazione, che trovava sfogo sotto forma di lacrime che mi rigavano le guance.<N>E quando diventavo bersaglio di insulti, rabbia e bullismo, non potevo contare su questa importante emozione per combattere l'ingiustizia di cui ero vittima.
    
    Spesso mi sentivo impotente e privata di qualcosa di importante, se non fondamentale.<N>Quando ripenso a quei momenti, spesso mi vengono le lacrime agli occhi perché mi rendo conto di quanto fossi impotente.<N>Ora capisco quanto sia importante la rabbia.<N>Questa emozione trasformativa ha il potere di spezzare le catene che ci imprigionano, di proteggere i nostri cari e di difendere la nostra posizione di fronte alle ingiustizie.<N>È un'onda potente che si abbatte su ciò che ci fa soffrire e lo spazza via, lasciando spazio alla crescita di qualcosa di nuovo.
    
    Imparare a usare la mia rabbia per una buona causa è stato uno dei risultati più gratificanti della mia vita come persona e come donna.<N>E spero che ogni persona là fuori stia vivendo la propria vita al massimo, consapevole di quanto siano preziose tutte le emozioni che proviamo.<N>Anche la rabbia.

    // I still remember vividly how anger was an emotion I deeply feared.
    // As a child, I grew up suffering from my father's sudden outbursts of rage, an expression of a generational trauma he never had the chance to overcome.
    // Naturally, anger became something I feared, and I shaped my life to avoid being its target.
    // People were pleased with me because I was a docile girl who listened to teachers and adults and who never made her parents worry.
    // Sometimes, I still find myself thinking how much of my true self I hid because of my coping mechanisms.
    // My childhood left me with no tools to control this emotion during my turbulent teenage years.
    // When I felt anger swelling up within myself, it would soon become frustration, which found its way outside as tears trickling down my cheeks.
    // And when I became a target of insults, anger and bullying, I couldn't count on this important emotion to fight against the injustice I was suffering from.
    // I often felt powerless and robbed of something important, if not fundamental.
    
    // When I recall these moments, I often feel tears prickling my eyes because I see how helpless I was.
    // Now I know how important anger is.
    // This transformative emotion has the power to break the chains tying us down, to protect our loved ones and to stand our ground in the face of injustice.
    // It is a strong wave that comes crashing down on what makes you suffer and washes it away, leaving room to grow something new.
    
    // Learning to wield my anger for a good cause was one of the most rewarding achievements in my life as a person and as a woman.
    // And I hope that every person out there is also living their life to their fullest, knowing how precious each emotion we feel is… anger too.

        + <i>Vorrei leggere ancora.
            ~ disableBigDialogue()
           -> book_test_intro
        + <i>Me ne vado.
            ~ disableBigDialogue()
            -> DarkLibraryModeOff ->
                     
            -> main

=== beatrice
<b>La rete non esiste</b> di Beatrice (she/her).<N>Instagram: @vistadibea<N>Trigger warning: depressione, religione.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        
        + <i>Inizio la lettura.
        //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
            {
                - library_unreadStories has Beatrice:
                    ~ library_unreadStories -= Beatrice
                    ~ library_readStories += Beatrice
                     -> refresh_book_lists ->
            }  
        + {library_unreadStories has Beatrice}<i>Per ora non me la sento di affrontare questo tema.
            -> tempTW -> book_test_intro
        + (rimuovi) {library_unreadStories has Beatrice}<i>Non voglio più incontrare questa storia.
            -> permanentTW -> refresh_book_lists -> book_test_intro
        -
    -> DarkLibraryModeOn ->
    ~ enableBigDialogue()
    
    Ciao.<N>Ho molte cose che mi frullano dentro ed è molto faticoso mettere ordine.<N>Ma vorrei raccontarti alcune cose che vorrei che tu sapessi.
    
    <b>Capitolo primo: Da dove arrivo.</b><N> <N>Sono la più piccola di quattro sorelle, di una famiglia molto cattolica.<N>Da bambina, osservando il mondo che mi circondava, ho imparato che i due dogmi per essere una "buona persona" sono: devi essere d'aiuto; non devi disturbare.<N>Non li ho messi in pratica sempre, ma con il tempo mi sono adattata, e ho scoperto che i due concetti, messi insieme, sono potentissimi.<N>Ti senti davvero "buona" ad ascoltare gli altri, a sforzarti di comprenderne il punto di vista e a cercare di risolvere problemi, di esserci sempre.
    
    Non so se qualcuno ha vissuto un'esperienza simile alla mia, io però, muovendomi con questi due dogmi, ho scoperto che:<N>ogni persona ha tragedie personali che non possiamo immaginare e motivi concreti e reali per fare quello che fa;<N>non essere di disturbo e ascoltare gli altri e basta, semplicemente, non funziona. 
    
    
    Le tue personali esigenze salteranno fuori, e urleranno forte.<N>Ora mi sta succedendo questo. Le mie esigenze urlano forte e a volte non riesco a capire che direzione prendono. <N>In terapia mi è tornato a galla un ricordo che non sapevo di avere.<N>E scopro che ho un bisogno grande di parlare e di essere ascoltata, anche se darò fastidio, anche se verrò giudicata, anche se non verrò capita.
    
    <N><b>Capitolo secondo: Ricordi che ritornano.</b><N> <N>Quando ero bambina, una ragazza, di poco più grande di me e figlia di amici di famiglia, mi ha toccata, nel senso che mi ha messo le mani nelle mutande per un tempo che non riesco a quantificare, ma che è stato per me lunghissimo.<N>Mi ha poi spogliata e ha continuato, senza che io riuscissi a capire cosa stava succedendo e come reagire.
    
    Non sono sicura di quanti anni avessi, io credevo tra gli otto e i nove, ma ricostruendo probabilmente era prima delle elementari.<N>Questa ragazza era orfana di padre e ricordo che la sensazione che avevo era di non poterne parlare.<N>Era ingiusto parlarne: chi soffre fa cose di cui non si accorge.<N>Poi era giovane.<N>Poi era sesso.<N>E nella mia famiglia di sesso non si parla.<N>Mai.
    
    <N>Credo che, se all'epoca non fossi stata una bambina di famiglia cattolica, in un piccolo paese cattolico, sarebbe stato liberatorio e utile parlarne. Ma non era così.<N>Mi sono sentita molto sola.<N>Ci ho messo anni (quasi 27) per poterne parlare con qualcuno che non fosse la mia terapeuta.<N>La prima volta che l'ho fatto, con il mio attuale partner, via mail, ho letteralmente vomitato.<N>Ho iniziato a parlarne non perché mi andava, ma perché il mondo mi si stava sgretolando addosso.
    
    Stavo male per tutto ciò che riguardava sesso e affettività, evitavo tutti i tipi di contatto, e avevo iniziato ad avere problemi di memoria riguardo a ciò che mi accadeva legato a quella sfera.<N>Un ragazzo con cui collaboravo, un tipo gentile, simpatico, di cui avevo stima, aveva provato a baciarmi e io ho rimosso la cosa per anni, che se mi avesse chiesto "perché ti sei scansata dal bacio?" avrei potuto rispondere solo "quale bacio?". 

    Ho recuperato il ricordo solo aggiustando gli altri pezzi.<N>Con il tempo ho sanato un po' la ferita e ne ho parlato con la mia famiglia, un componente alla volta. <N>Non è andata bene. <N>Ho aperto una porta da cui escono cose inaspettate, in momenti inaspettati.<N>E alcune fanno incredibilmente male.

    <b>Capitolo terzo: La rete a cui non credo.</b><N> <N>Da qualche anno abito in una grande città e vengo a contatto con modi di pensare, politiche, termini che non conosco.<N>Nella grande città ho sentito spesso parlare di rete di supporto.<N>Ogni volta che la sentivo nominare pensavo “io a questa rete non credo, non so cos'è, non la vedo. Sono da sola davanti ad un burrone gigantesco”.<N>Parlare dell'abuso che ho vissuto da bambina mi ha portata ad allontanarmi da molti rapporti, vecchi e nuovi, perché ho ricevuto risposte molto dolorose.<N>Anche nei rapporti nuovi mi accorgo di mantenere un distacco voluto, perché faccio fatica a fidarmi e a sentirmi al sicuro.
    
    Ad un certo punti però è arrivato D.<N>D. parla spesso di politica, abusi, minoranze.<N>Lo ascolto con la tazza di tè calda tra le mani, nel salotto del bilocale in cui vivo con il mio ragazzo, affascinata dalle idee che propone.<N>È una persona trans, parla delle difficoltà che ha vissuto e che vive, di problemi economici e famiglia.<N>Parla di rabbia politica, di transfemminismo.<N>Parla di fare rete. 
    
    Siamo in pieno lockdown, è un giorno di confronto particolarmente tosto con la mia famiglia. Mi viene da piangere e racconto il perché.<N>Racconto tutto.<N>È la terza volta in vita mia che racconto con la voce quello che mi è successo da bambina.<N>Lui ascolta e dice “mi dispiace tanto”.
    
    Inizio a pensare che la rete può esistere. <N>A quel pensiero faccio quello che ho fatto per tutta la vita: mi impegno per essere d'aiuto.<N>Lo aiuto con il trasloco, lo aiuto con il lavoro, lo aiuto trovando un avvocato per lui, gli trovo due clienti, lo aiuto con sua mamma, gli dò un posto di rilevanza in una community digitale che ho riavviato e in cui so che vorrebbe stare.<N>Ci sono sempre, non ho soldi e gli dico “se hai problemi di soldi io ci sono”. Faccio anche un prestito se serve, non mi frega.<N>Io ci sono. Faccio rete.

    
    <b>Capitolo quarto: Non ti fidare.</b><N> <N>D: “Mi uccide che in tutto questo io non ho fatto nulla.  <N>Io non sono l'aggressore, e non accetto di esserlo.”<N>D: “Ti ho scritto così a caso per sentirti e tu mi hai risposto in un modo che mi fa pensare che tu stia bene in generale ma male tra di noi, questo crea un bias su cosa dico o non dico.”<N>D. “Un po' ammetto avrei preferito tu fossi per il "tutto bene tra di noi", e andare avanti :D”<N>D: “Mi spiace per il tuo background e capisco che ti porti a vedere la società come fatta in un certo modo. Vorrei aggiungere però che questo non è l'unico modo di vedere le cose e che sono validi anche altri modi di pensarla. E io sono all'opposto su questo.”
    
    Mi è già successo di sentirmi ed essere usata. Mi è successo di vedere miei giochi diffusi senza il mio nome tra i credits, o di assistere all'elogio di persone che si prendono il merito del mio lavoro o delle mie idee.<N>Mi è già successo che mi escludessero da progetti che avevo avviato io, mi è già successo che mi accusassero di essere io il problema senza il minimo dialogo.<N>Mi è già successo che a fare tutte queste cose fossero persone amiche.<N>Non mi era mai successo però con una persona amica che faceva discorsi politici affini.
    
    E quando mi è successo con D. ho avuto una grande certezza:<N>avevo ragione, la rete non esiste.
    
    
    <b>Capitolo quarto: Ti odio e ti mordo.</b><N> <N>La rete non esiste.<N>Ora che ne sono certa faccio qualcosa che non ho mai fatto prima: mi permetto di odiare.<N>Decido che non ha senso farmi remore, non c'è nessuno da proteggere qui. <N>E allora parlo e scrivo. <N>Scrivo alle persone di cui vorrei fidarmi e racconto quello che è successo, senza la preoccupazione di dover essere buona, educata, comprensiva. <N>Parlo senza cercare di tutelare chi mi ha fatto male. 
    
    Scopro che queste persone mi ascoltano, che dicono “È terribile”, “Cosa posso fare per te?”, “È molto ingiusto”.<N>Scopro anche un'altra cosa: nessuna di queste persone può fare qualcosa per farmi stare bene del tutto.<N>Ma ognuna fa un pezzetto.<N>E questi pezzetti, anche se piccoli, mi aiutano a non sentirmi più da sola.<N>Mi permetto di occupare spazio, fare brutta figura, di rischiare di essere vista come pazza, egoista, o vittimista.
    
    Mi permetto di parlare di quello che è successo, di scriverci un pezzo dentro ad un videogioco amico.<N>Mi permetto di chiedere aiuto, di alzare la voce, di pretendere che il mio dolore sia riconosciuto. <N>Mi permetto di odiarti se non mi rispetti, anche se so che hai una vita difficile anche tu.<N>Anzi, per citare l'amore della mia vita: non è che perché stai male puoi cagarmi in faccia.<N>Sono libera di mordere e di morderti se mi fai male, sono libera di odiarti, sono libera di raccontare la mia storia.
    
    E lo sono anche grazie a voi che mi avete ascoltato.<N>Ma è ora che ce lo diciamo e che lo sappiamo: la rete come ce la raccontiamo non esiste.<N>Se senti che qualcuno ti dice “lì sarai al sicuro” o “questo modo di pensare è più inclusivo di quest'altro” metti di fianco a queste frasi un grande punto di domanda.<N>Se esiste una rete è quella il cui collante sei tu, fatta di singole persone che tu scegli e che ti scelgono.<N>E se qualcuno ti fa del male, semplicemente non ne fa parte.

        + <i>Vorrei leggere ancora.
            ~ disableBigDialogue()
           -> book_test_intro
        + <i>Me ne vado.
            ~ disableBigDialogue()
            -> DarkLibraryModeOff ->
                     
            -> main
            
=== beatrice_y_bottura
<b>Artigli Rosso Ruggine</b> di Beatrice Y. Bottura (she/it).<N>Trigger warning: violenza psicologica, abusi fisici.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        
        + <i>Inizio la lettura.
        //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
            {
                - library_unreadStories has BeatriceYBottura:
                    ~ library_unreadStories -= BeatriceYBottura
                    ~ library_readStories += BeatriceYBottura
                     -> refresh_book_lists ->
            }  
        + {library_unreadStories has BeatriceYBottura}<i>Per ora non me la sento di affrontare questo tema.
            -> tempTW -> book_test_intro
        + {library_unreadStories has BeatriceYBottura}<i>Non voglio più incontrare questa storia.
            -> permanentTW -> refresh_book_lists -> book_test_intro
        -
    -> DarkLibraryModeOn ->
    ~ enableBigDialogue()
    
    Da qualche parte esiste un pozzo artificiale profondo centinaia di metri, una scala a spirale in metallo porta alle sue interiora. <N>Sul suo buio fondo si trova un'enorme gabbia, sterile e opprimente.<N>La gabbia è costruita coi materiali più resistenti conosciuti all'uomo: leghe in metalli esotici, violentemente piegate su se stesse infinite volte per creare strati su strati di resistenza.<N>Questa gabbia è costruita per custodire la più terrificante, più feroce di tutte le bestie.<N>Poco più grande di un essere umano, ma abbastanza imponente da sembrare un grattacielo, la bestia giace al centro della sua gabbia, sempre sveglia, sempre affamata.
    
    Il suo pelo, un tempo cremisi e dorato, è ormai completamente incolore, ricoperto di sangue secco e sporcizia.<N>La possente creatura non ricorda da quanto tempo giace sul fondo di questo inferno assemblato dall'uomo.<N>Le persone che discendono fino al centro del buco ogni giorno non hanno più timore della bestia.<N>Dopotutto, furono i nonni dei loro nonni a imprigionarla, gli uomini d'oggi non hanno modo di ricordare le paure primordiali che l'animale risvegliò nell'umanità quando fu scoperta.<N>Quindi la tagliano, la pungono, la osservano con interesse e con sadismo ma mai con terrore. <N>Nonostante sia sempre circondata da uomini, la bestia rimane sola nella sua gabbia.
    
    
    Passa le giornate a pensare alle sue simili, probabilmente decedute da decenni.<N>Non mangia, non dorme, non beve, ormai nemmeno gioca…<N>Finché un giorno, la bestia guarda dentro di sé per l'ennesima volta, cercando un sollievo che sa fin troppo bene non esiste.<N>Invece si rende conto che non riesce più a ricordare i volti del suo branco.<N>Disperata, la sua mente animale va in crisi, cerca ogni angolo di se stessa per trovare la forma dei suoi amati.
    
    
    Ma la bestia trova solo il tocco della compagna di viaggio che è riuscita a tenerla in vita fino a quel momento:<N>Rabbia.<N>Rabbia dedita a riprendersi la vita che ha perso.<N>Rabbia che a breve scagionerà in un abbagliante performance di denti e artigli.<N>Rabbia che porterà fine all'umanità che l'ha imprigionata.<N>Un ululato affilato come un coltello attraversa il pozzo.<N>La paura smarrita dagli uomini torna in loro mentre vedono la gabbia che li teneva al sicuro distrutta dall'interno. Le urla riempiono la stanza e il loro prezioso intelletto umano viene tagliato come burro.

        + <i>Vorrei leggere ancora.
            ~ disableBigDialogue()
           -> book_test_intro
        + <i>Me ne vado.
            ~ disableBigDialogue()
            -> DarkLibraryModeOff ->
                     
            -> main
