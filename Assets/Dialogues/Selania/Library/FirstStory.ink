//Cognome/alias A-E

=== adri_allora
<b>Il mio bellissimo gatto</b> di Adri Allora (ləi). Trigger warning: violenza psicologica, abusi fisici.

    +  \ {charTag(PG, "neutral")}:       <i>Inizio la lettura.
    //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
        {
            - library_unreadStories has AdriAllora:
                ~ library_unreadStories -= AdriAllora
                ~ library_readStories += AdriAllora
                 -> refresh_book_lists ->
        }  
    + {library_unreadStories has AdriAllora} \ {charTag(PG, "neutral")}:                    <i>Per ora non me la sento di affrontare questi temi.
        -> tempTW -> book_test_intro
    + {library_unreadStories has AdriAllora}  \ {charTag(PG, "neutral")}:         <i>Non voglio più incontrare questa storia.
        -> permanentTW -> refresh_book_lists -> book_test_intro
    -


    
    Mi chiama. La mia rabbia è un gatto che insiste per essere nutrito in continuazione, mi chiama, mi chiama con quell'insistenza che ha costretto sir Isaac Newton a inventare la porticina per i gatti. Ma il mio mi chiama, mi chiama, mi chiama e poi mi ricorda che condivide il novantacinque virgola sei percento del suo DNA con le tigri sopraffacendomi: bevo, disegno, mi drogo, scrivo, mi picchio, dipingo, spacco cose.
    
    Poi mi ritrovo però a dover spiegare che cosa stessi facendo ieri sera visto che non rispondevo al telefono o perché non provo piacere guardando gli acquerelli e il disegno sul muro o come mai ho lo zigomo gonfio (vorrei avere il coraggio di rispondere che la prima regola è non parlarne, invece sono porte goffaggine spigoli e maldestrezza) o perché quella sedia si è rotta. È faticosa come il dolore, la rabbia.
    
    In realtà il nostro è un lavoro di squadra: se non andassi a sgattare in incognito nei social della mia ex, il mio gatto rimarrebbe fuori dalla portata del suo tagliente miagolio. Se non controllassi insistentemente il lavoro degli altri in ufficio. Se non m'impuntassi sul tono svogliato o scocciato. Se non. E invece miagola, miagola, miagola, miagola.
    
    E io a dargli corda, a ingrandire il disegno sul muro, a improvvisare un'altra storia a fumetti con gli acquerelli, a spaccare un'altra antina del mobile della cucina, a bere fino a sfinire la mia coscienza (ma poi che male risvegliarsi il mattino dopo sul pavimento del bagno: non ho più l'età per certe cose). Faccio cose brutte in preda al gatto e poi il gatto mi deride per la bruttezza delle cose che ho fatto e m'infuria.
    
    
    Un giorno, mentre pranzavo di fronte al portatile, ho aperto i social dei miei vecchi colleghi per capire come se la stavano passando dopo che mi ero licenziatə e se la passavano splendidamente, come se fosse stata colpa mia tutta l'acredine attraverso la quale bisognava cercare gli altri in ufficio negli ultimi tempi, gli scazzi, le battute passivo-aggressive e il gatto ha iniziato a miagolare


    e ho stretto la forchetta fortissimo mentre faticavo a ingoiare il boccone e miagola e il pugno mi tremava e miagola e sentivo il sudore freddo e miagola le tempie che pulsano e miagola non riesco a chiudere gli occhi e miagola inizio a ripetermi in testa le cose e  poi non so cos'è successo. Ho respirato.
    
    Mi son presə il gatto sulle ginocchia. Ho iniziato ad accarezzarlo. Cos'è che vuoi da me, rabbia? Mi ha rivolto uno sguardo dorato, ha fatto le fusa. E niente: mi ha lasciato quattro buchi sulla coscia con i suoi artigli, 'sta scena m'ha ricordato Frankenstein Junior.
    
    //Check per achievement racconti
    -> achievements_onGame_statusUpdate_RM ->
    
        +  \ {charTag(PG, "neutral")}:       <i>Vorrei leggere ancora.
        
           -> book_test_intro
        
        +  \ {charTag(PG, "neutral")}:       <i>Me ne vado.
        
            -> DarkLibraryModeOff ->
            -> main

=== alexias_d_avino
<b>Il Riflesso</b> di Alexias D'Avino (lui/lei). Instagram: @togetherweread29 Trigger warning: lutto, rifiuto da parte della figura genitoriale.
        
        +  \ {charTag(PG, "neutral")}:       <i>Inizio la lettura.
        //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
            {
                - library_unreadStories has AlexiasDAvino:
                    ~ library_unreadStories -= AlexiasDAvino
                    ~ library_readStories += AlexiasDAvino
                     -> refresh_book_lists ->
            }  
        +  {library_unreadStories has AlexiasDAvino} \ {charTag(PG, "neutral")}:       <i>Per ora non me la sento di affrontare questo tema.
            -> tempTW -> book_test_intro
        +  {library_unreadStories has AlexiasDAvino}\ {charTag(PG, "neutral")}:       <i>Non voglio più incontrare questa storia.
            -> permanentTW -> refresh_book_lists -> book_test_intro
        -
    
    

    Shmi entrò nell'appartamento trascinandosi dietro lo zaino. Odiava il suo lavoro: la contabilità era una delle cose più noiose sulla faccia della Terra e ci si era buttatə a capofitto per paura di finire in mezzo a una strada. Il suo ex fidanzato glielo aveva detto, si stava scavando la fossa da solə. Dopo una lunga doccia, infilò il suo pigiama preferito, quello con le eroine dei manga che tanto amava leggere.
    
    Mentre si guardava allo specchio del bagno, con i capelli raccolti in una coda scomposta, le occhiaie scure sul viso olivastro e un'espressione a metà tra l'angoscia più totale e la noia, si chiese se sarebbe mortə giovane. Magari l'avrebbero trovatə proprio con quel pigiama, con gli occhi spenti e il corpo già rigido e freddo. Dopo quelle riflessioni fondamentali, Shmi entrò con una lentezza disarmante in camera da letto.
    
    Adorava così tanto il colore turchese che aveva arredato la sua stanza con qualsiasi tipo di arredo di quella tonalità. L'unica cosa che stonava era il bianco delle tende che aveva trovato quando aveva affittato l'appartamento. Doveva aggiungere l'acquisto di un nuovo tendaggio alla lista della spesa. Sospirò.
    
    Era diventatə come sua madre, tutto doveva essere coordinato. Sotto controllo,proprio come piaceva a lei. Se avessi un minimo di ordine, non saresti un eterno scapolo! Col tempo, sua madre era venuta a patti con la sua identità e aveva evitato i pronomi maschili. Aveva persino accettato di vederlə con un uomo, ma le sue parole l'avevano feritə lo stesso.

    Nonostante il lavoro, nonostante il tetto sulla sua testa e la prospettiva di una vita piuttosto normale, nulla era in ordine nel cervello di Shmi. Ogni notte si svegliava di soprassalto, con il cuore in gola e le gambe tese, pronte a saltare dal letto e correre il più lontano possibile. Sognava il suo docente di arte che lə urlava contro e lə diceva che non sarebbe mai diventatə unə artista.
    
    Vedeva la delusione negli occhi di sua madre, quando lə aveva detto di volersi laureare in pittura e arti visive. Riviveva il funerale di nonna Olga, l'unica persona che credeva in ləi. Ogni singola volta, Shmi desiderava prendere a pugni qualcuno, strappare i disegni che tappezzavano la parete della camera, un'accozzaglia di colori, bozze tracciate con il carboncino e piccoli quadri dipinti a olio.
    
    Si voltò verso lo specchio di nonna Olga, alto quanto ləi e inserito in una semplice cornice d'argento. I momenti con lei erano i più preziosi. Ricordava i pomeriggi passati a ballare, vestitə da principessa guerriera, i biscotti sempre bruciati e le risate che riempivano quella vecchia casa. Con nonna Olga aveva iniziato a dipingere.
    
    Aveva imparato a sognare. Adesso non vedeva altro che il riflesso di una persona triste. Era dimagritə troppo, forse perché dimenticava di mangiare, e i suoi occhi, piccoli e scuri, rendevano il suo sguardo sempre severo e cupo. Le amiche di Shmi lə dicevano che, con un makeover come quello delle romcom degli anni 2000, sarebbe potutə sembrare unə fotomodellə, visto che era sempre statə parecchio altə. Quante sciocchezze, pensò sbuffando.
    
    Chiuse gli occhi per trattenere le lacrime di frustrazione. Un'aria fresca entrò nella stanza:forse aveva lasciato la finestra aperta, cosa strana, visto che detestava gli odori della metropoli. Quando riaprì gli occhi, quasi inciampò per terra dallo stupore: non era più a casa.
    
    Al posto del parquet, ai suoi piedi c'era una distesa di fili d'erba e fiori. Alzò lo sguardo, vide una casa dipinta di bianco, con il tetto color lavanda. Quella era la sua vecchia casa, immersa tra rose, violette e tulipani di tutte le varietà. Si avvicinò ai gelsomini e non riuscì a trattenere le lacrime quando sentì il loro profumo: dolce e intenso, proprio come lo ricordava. Colse uno dei fiorellini bianchi, quasi di riflesso.
    
    I petali cominciarono a sciogliersi tra le dita, come una tela lasciata sotto la pioggia. Allo stesso modo, ogni cosa intorno a Shmi iniziò a svanire. Fu a quel punto che vide una figura scura, in attesa vicino alla porta d'ingresso. "C-chi sei?" sussurrò. A quel punto, la figura iniziò a camminare verso di ləi. Il terrore percorse tutto il corpo di Shmi, che iniziò a correre verso il lato opposto della casa. Il cuore batteva all'impazzata, il fiato spezzato. Tutto quello che riusciva a fare era scappare.

    Poi, come se fosse saltatə da uno dei suoi dipinti all'altro, Shmi si trovò in spiaggia. Era uno dei suoi posti preferiti, dipinto quando aveva un disperato bisogno di fuggire dalla città. Ma tutto lə sembrava diverso. Le nuvole erano nere, cariche di pioggia. Un'onda alta quasi quanto il palazzo dove abitava minacciava di abbattersi sulla spiaggia con tutta la sua violenza. Vide la figura scura di prima scivolare leggiadra sulla cresta dello tsunami, quasi come se stesse guidando il mare verso di ləi.
    
    Un attimo dopo, stava affogando, il suo corpo lottava disperatamente contro le correnti. Era tutto buio attorno e più si muoveva, meno forza aveva per risalire in superficie. Con un bagliore di luce improvviso, lo scenario cambiò ancora e Shmi riprese a respirare. Mentre vomitava acqua salmastra, un nuovo luogo prese vita attorno a ləi: uno stagno pieno di fiori di loto, illuminato dalla luna e da stelle che sembravano appena uscite da un quadro di Van Gogh.
    
    Non l'aveva mai visto prima, né l'aveva immaginato durante una delle sue esplosioni di creatività. Quando la vista si abituò alla luce degli astri, si accorse che stava camminando sulla superficie dello specchio d'acqua. Shmi cominciò a tremare, non perché fosse ancora bagnatə, ma perché la rabbia le incendiava il cuore. Non bastava che fosse intrappolatə in una vita che non sentiva sua, adesso era tormentatə da chissà quale forza invisibile. Fu allora che la figura si avvicinò, quasi come se avesse sentito i suoi pensieri.
    
    Ora Shmi poteva vedere le sue forme: aveva una silhouette familiare, cinta da un corpetto smeraldo in stile vittoriano, stretto in vita e da un pantalone palazzo sporco di… pittura? I capelli scuri erano legati in una treccia che lə arrivava alle spalle, le perle che portava al collo brillavano come la luna. Gli occhi scuri erano pieni di vita e studiavano Shmi. "Perché stai scappando da me? Da te stessə?" La figura proiettò un pensiero che fece increspare la superficie dello stagno.
    
    
    Shmi si accorse che stringeva tra le mani una spada. «Chi sei? Cosa vuoi da me?!». Urlò, la gola ancora irritata dopo tutta l'acqua di mare che aveva bevuto. "Sono te. Beh, sono la persona che vorresti essere, la principessa guerriera che la nonna amava. Che ti è successo? Non sei più tu!" Shmi non sapeva cosa dire. La rabbia di quella versione di sé così diversa la fece indietreggiare. Era così che lə vedevano le persone attorno a lei? Una creatura piena d'ira?
    
    Davanti alla confusione di Shmi, l'espressione della principessa guerriera si fece più dolce. Non era compassione, ma piena consapevolezza del senso di smarrimento che entrambə provavano. "Puoi ancora aggiustare tutto. Puoi essere chi desideri. La nonna diceva che potevamo fare qualsiasi cosa, finché restavamo fedeli a noi stessə." Tese la mano verso Shmi. "Facciamolo, insieme." Quando le loro dita si intrecciarono, Shmi sentì un calore che si sostituì al gelo che aveva provato fino ad allora.
    
    "Non devi più nasconderti, principessa." La voce di nonna arrivò come una carezza, come il profumo di gelsomino e il calore dei suoi abbracci. Shmi non aveva più paura della rabbia. Con essa avrebbe dipinto un nuovo futuro. Quando riaprì gli occhi, era ancor davanti allo specchio. Il suo riflesso, però, era cambiato. In ləi c'era la stessa fiamma che albergava negli occhi della principessa guerriera. Corse nel piccolo soggiorno del suo appartamento.
    
    Dallo sgabuzzino tirò fuori una tela bianca e il cavalletto. Poi afferrò l'astuccio con le matite e i pennelli. Un'infinità di realtà l'aspettava al di là di quella tela bianca. Doveva solo disegnare la porta. "Basta nascondersi." Il suo futuro cominciò con una pennellata di verde.

    //Check per achievement racconti
    -> achievements_onGame_statusUpdate_RM ->

        +  \ {charTag(PG, "neutral")}:       <i>Vorrei leggere ancora.
            
            -> book_test_intro
        
        +  \ {charTag(PG, "neutral")}:       <i>Me ne vado.
            
            -> DarkLibraryModeOff ->
            -> main


=== aza
<b>Luna vergine</b> di Aza (any). Trigger warning: alcolismo, violenza fisica.
        
        +  \ {charTag(PG, "neutral")}:       <i>Inizio la lettura.
        //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
            {
                - library_unreadStories has Aza:
                    ~ library_unreadStories -= Aza
                    ~ library_readStories += Aza
                     -> refresh_book_lists ->
            }  
        +  {library_unreadStories has Aza}\ {charTag(PG, "neutral")}:       <i>Per ora non me la sento di affrontare questo tema.
            -> tempTW -> book_test_intro
        + {library_unreadStories has Aza} \ {charTag(PG, "neutral")}:       <i>Non voglio più incontrare questa storia.
            -> permanentTW -> refresh_book_lists -> book_test_intro
        -
    
    
        
    Le caviglie tentennano quando provo a sedermi nella hall dell'hotel, ma in piedi continuerei a fare avanti e indietro col ticchettio dei tacchi che rimbomba, non voglio attirare ulteriormente l'attenzione degli ospiti. La brezza di mare si scaglia dalla porta girevole fino agli ascensori, anche di notte non cede. Un vento medio, di quelli che alza la sabbia ma non gli aquiloni, così da quattro giorni, da quando sono arrivata. Il piano è semplice, ho capito la sua routine, gli ho chiesto se avesse da accendere e abbiamo fatto due chiacchiere, non si è sicuramente accorto di chi sono, non si ricorda di me, la trasformazione ha avuto successo.
    
    
    Quindi è oggi la notte in cui succede. Allora facciamolo succedere. Faccio un respiro profondo e mi incammino verso il lounge bar, la musica jazz-techno l'ho sempre odiata ma sono contenta di avere un ritmo sul quale sbattere l'ansia con le dita. Ordino un drink, annuso la stanza, sta arrivando. "Hey cappello volante!" eccolo. "Ancora sola? Non è mai arrivato a farti compagnia?"
    
    Ho inventato una storia strappalacrime, un fantomatico zio molto ricco che doveva venire in villeggiatura con me, non è mai arrivato perché non è mai esistito. Sono ventitré anni che lavoro a questo piano e risparmio soldi per fingermi ricca. Rispondo con tono malinconico "Ancora sola, morirò sola" lo faccio ridere sguaiatamente. "Una donna così bella non può morire sola, lascialo stare sarà stato impegnato col suo business, sai come sono i clienti" ah sì so benissimo come sono i ricchi.
    
    "Lo capisco… Avrei voluto soltanto che il vento si calmasse e mio zio arrivasse per l'ultima sera, per lo spettacolo pirotecnico" figurati se non abbocca. "Ma zucchero è impossibile restare sole in una notte del genere, posso accompagnarti io, anche Irene sarà entusiasta". Per un attimo mi sento in pena per la moglie di questo viscido uomo, incredibile come lui si offra di fare una cosa e dia per scontato che la sua appendice femminile agirà di conseguenza. "Se c'è anche Irene allora va bene…"
    
    Torniamo alla hall, la sua donna si aggrega, chiacchieriamo del nulla solo io e lui, provo a tenermi indietro, con calma inizio a studiare il suo corpo irregolare. Ci sediamo in un tavolo lontano dalla spiaggia, oggi la luna piena è in vergine, ironico. Ormai Irene non soffre più quando il suo verme da compagnia dedica tutte le sue attenzioni a un'altra donna, ci ignora completamente e ammira lo spettacolo di luci nel cielo. Io e lui chiacchieriamo, di soldi, di lavoro, di figli, di amanti, di sesso e di morte. "Vado in bagno" e Irene scompare, è il momento.
    
    "Sai Jacopo devo confessarti una cosa… Son molto invidiosa di Ire-" si allunga verso il mio viso e appiccica le labbra contro le mie, lo avevo già calcolato, questo è il momento più difficile di oggi, l'apice della fatica, mai stato così impossibile esistere dentro questo corpo, una seconda volta, ma questa volta devo resistere, questa volta è completamente diversa. Sto al bacio, se "bacio" possiamo chiamarlo, stringo gli occhi e apro la bocca, la sua lingua disgustosa invade la mia con un sapore di limone e menta, fingo di non essere me, ma Irene in una normale serata d'estate. "Andiamocene" mormoro, "si certo" ansima.
    
    Ci defiliamo in uno dei piccoli nascondigli in spiaggia, due lettini che lui unisce sbattendoci contro i piedi, i paravento e l'ammasso di fiori freschi ci isola dal resto del mondo, solo le ombre e le luci mi fanno compagnia. Si toglie la maglietta e prova a togliere la mia, credo che nei palpeggiamenti non consensuali abbia sfiorato tante cose che non doveva sfiorare del mio corpo, tipo il coltello che sfilo dalla schiena. Mentre tolgo gli stivali impugno per bene il fazzoletto pregno di fenobarbital, lo agito nell'aria come se fosse l'oggetto più seducente del mondo, lui mi guarda con la faccia di uno che mi sta implorando di essere ammazzato. Mi sento quasi felice.
    
    Mi lancio sul suo corpo, voglio entrargli dentro e farlo esplodere, gli tengo il fazzoletto sulla bocca e dopo qualche secondo le sue membra si placano. Il mio respiro si fa grande e minaccioso, inizio a inspirare frettolosamente come per indurre un attacco di iperventilazione, e poi esco dal nascondiglio e fisso la luna, lascio che mi entri negli occhi e nel cuore. Le vene si fanno bollenti, mentre mi sento diventare gigante finisco di spogliarmi, inizia la trasformazione.
    
    Sento la pelle delle punta delle dita farsi sottile e le unghie allungarsi. Non mi ero mai trasformata in mannara con così tanta manicure e con vestiti così costosi, inizio a perdere lucidità, era questo l'obiettivo, ci siamo entrambe dentro questo corpo. Ventitré anni di studio freddo e preciso che culminano nella furia totale, l'ira mi pervade.
    
    L'ultima cosa che ricordo è la sensazione di sabbia fredda fra le dita dei piedi, i botti dei fuochi d'artificio e il suo ansimare sofferente, non saprò mai se mi ha riconosciuta o meno.
    
    //Check per achievement racconti
    -> achievements_onGame_statusUpdate_RM ->

        +  \ {charTag(PG, "neutral")}:       <i>Vorrei leggere ancora.
            
           -> book_test_intro
        +  \ {charTag(PG, "neutral")}:       <i>Me ne vado.
            
            -> DarkLibraryModeOff ->
                     
            -> main


=== steno_artico
<b>Questa rabbia, che mi è stata rubata</b> by StenoArtico (he/him, none). Instagram: @stenoartico Trigger warning: violenza psicologica, abusi fisici, depressione.
        
        +  \ {charTag(PG, "neutral")}:       <i>Inizio la lettura.
        //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
            {
                - library_unreadStories has StenoArtico:
                    ~ library_unreadStories -= StenoArtico
                    ~ library_readStories += StenoArtico
                     -> refresh_book_lists ->
            }  
            -> refresh_book_lists ->
        + {library_unreadStories has StenoArtico} \ {charTag(PG, "neutral")}:       <i>Per ora non me la sento di affrontare questo tema.
            -> tempTW -> book_test_intro
        +  {library_unreadStories has StenoArtico}\ {charTag(PG, "neutral")}:       <i>Non voglio più incontrare questa storia.
            -> permanentTW -> refresh_book_lists -> book_test_intro
        -
    
    
    
    Arriva sempre, quando sono già a terra, a prendermi a calci nello stomaco quella voce arrabbiata che mi chiama definisce condanna la persona peggiore possibile inutile schifosa. Ma perché ce l'ha a morte con me?


    Siamo come un coniglio che si azzanna la zampa intrappolata in una tagliola. Ma perché nessuno azzanna il cacciatore?   Da dove arriva? È un'eco dell'infanzia? Il commento di una zia stanca e distratta ormai impresso a carne viva nel cervello? Ma forse questa è una domanda malriposta.
    
    Non ha origine, è l'origine: azione e reazione, energia eterna che tocca, rimbalza, trasforma. In fondo tutto è nato da uno scoppio, non da una timida alzata di mano.   Questa rabbia, che mi è stata rubata, voglio provare a riabbracciarla.
    
    Voglio catturare il suo fulmine a mani nude. Farà male, ma va bene.   Voglio spaccare il labirinto di specchi e farne finestre.   Voglio puntare questo nuovo uragano lontano, verso i monti della mia mente, trasformare le loro pale eoliche in eliche e farla decollare. 
    
    Verso dove, ancora non lo so. E mi piace.

    //Check per achievement racconti
    -> achievements_onGame_statusUpdate_RM ->

        +  \ {charTag(PG, "neutral")}:       <i>Vorrei leggere ancora.
        
           -> book_test_intro
        +  \ {charTag(PG, "neutral")}:       <i>Me ne vado.
        
            -> DarkLibraryModeOff ->
                     
            -> main

=== b
// <b>The touch of anger</b> di K.(she/her).
<b>Il tocco della rabbia</b> di K.(she/her). Trigger warning: violenza fisica, depressione.
        
        +  \ {charTag(PG, "neutral")}:       <i>Inizio la lettura.
        //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
            {
                - library_unreadStories has B:
                    ~ library_unreadStories -= B
                    ~ library_readStories += B
                     -> refresh_book_lists ->
            }  
        +  {library_unreadStories has B}\ {charTag(PG, "neutral")}:       <i>Per ora non me la sento di affrontare questo tema.
            -> tempTW -> book_test_intro
        +  {library_unreadStories has B}\ {charTag(PG, "neutral")}:       <i>Non voglio più incontrare questa storia.
            -> permanentTW -> refresh_book_lists -> book_test_intro
        -
    
    

    Ricordo ancora nitidamente quanto la rabbia fosse un'emozione che temevo profondamente. Da bambina sono cresciuta subendo gli improvvisi scatti d'ira di mio padre, espressione di un trauma generazionale che non ha mai avuto la possibilità di superare. Naturalmente la rabbia è diventata qualcosa che temevo, e ho modellato la mia vita in modo da evitare di esserne bersaglio. Le persone erano contente di me perché ero una ragazza docile che ascoltava gli insegnanti e gli adulti e che non dava mai preoccupazioni ai suoi genitori.
    
    
    A volte mi ritrovo ancora a pensare a quanto del mio vero io ho nascosto a causa dei miei meccanismi di difesa. La mia infanzia non mi ha fornito gli strumenti per controllare questa emozione durante la mia turbolenta adolescenza. Quando sentivo la rabbia crescere dentro di me questa si trasformava presto in frustrazione, che trovava sfogo sotto forma di lacrime che mi rigavano le guance. E quando diventavo bersaglio di insulti, rabbia e bullismo, non potevo contare su questa importante emozione per combattere l'ingiustizia di cui ero vittima.
    
    Spesso mi sentivo impotente e privata di qualcosa di importante, se non fondamentale. Quando ripenso a quei momenti, spesso mi vengono le lacrime agli occhi perché mi rendo conto di quanto fossi impotente. Ora capisco quanto sia importante la rabbia. Questa emozione trasformativa ha il potere di spezzare le catene che ci imprigionano, di proteggere i nostri cari e di difendere la nostra posizione di fronte alle ingiustizie. È un'onda potente che si abbatte su ciò che ci fa soffrire e lo spazza via, lasciando spazio alla crescita di qualcosa di nuovo.
    
    Imparare a usare la mia rabbia per una buona causa è stato uno dei risultati più gratificanti della mia vita come persona e come donna. E spero che ogni persona là fuori stia vivendo la propria vita al massimo, consapevole di quanto siano preziose tutte le emozioni che proviamo. Anche la rabbia.

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

    //Check per achievement racconti
    -> achievements_onGame_statusUpdate_RM ->

        +  \ {charTag(PG, "neutral")}:       <i>Vorrei leggere ancora.
            
           -> book_test_intro
        +  \ {charTag(PG, "neutral")}:       <i>Me ne vado.
            
            -> DarkLibraryModeOff ->
                     
            -> main
            
=== beatrice_y_bottura
<b>Artigli Rosso Ruggine</b> di Beatrice Y. Bottura (she/it). Trigger warning: violenza psicologica, abusi fisici.
        
        +  \ {charTag(PG, "neutral")}:       <i>Inizio la lettura.
        //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
            {
                - library_unreadStories has BeatriceYBottura:
                    ~ library_unreadStories -= BeatriceYBottura
                    ~ library_readStories += BeatriceYBottura
                     -> refresh_book_lists ->
            }  
        + {library_unreadStories has BeatriceYBottura} \ {charTag(PG, "neutral")}:       <i>Per ora non me la sento di affrontare questo tema.
            -> tempTW -> book_test_intro
        + {library_unreadStories has BeatriceYBottura} \ {charTag(PG, "neutral")}:          <i>Non voglio più incontrare questa storia.
            -> permanentTW -> refresh_book_lists -> book_test_intro
        -
    
    
    
    Da qualche parte esiste un pozzo artificiale profondo centinaia di metri, una scala a spirale in metallo porta alle sue interiora.  Sul suo buio fondo si trova un'enorme gabbia, sterile e opprimente. La gabbia è costruita coi materiali più resistenti conosciuti all'uomo: leghe in metalli esotici, violentemente piegate su se stesse infinite volte per creare strati su strati di resistenza. Questa gabbia è costruita per custodire la più terrificante, più feroce di tutte le bestie. Poco più grande di un essere umano, ma abbastanza imponente da sembrare un grattacielo, la bestia giace al centro della sua gabbia, sempre sveglia, sempre affamata.
    
    Il suo pelo, un tempo cremisi e dorato, è ormai completamente incolore, ricoperto di sangue secco e sporcizia. La possente creatura non ricorda da quanto tempo giace sul fondo di questo inferno assemblato dall'uomo. Le persone che discendono fino al centro del buco ogni giorno non hanno più timore della bestia. Dopotutto, furono i nonni dei loro nonni a imprigionarla, gli uomini d'oggi non hanno modo di ricordare le paure primordiali che l'animale risvegliò nell'umanità quando fu scoperta. Quindi la tagliano, la pungono, la osservano con interesse e con sadismo ma mai con terrore.  Nonostante sia sempre circondata da uomini, la bestia rimane sola nella sua gabbia.
    
    
    Passa le giornate a pensare alle sue simili, probabilmente decedute da decenni. Non mangia, non dorme, non beve, ormai nemmeno gioca… Finché un giorno, la bestia guarda dentro di sé per l'ennesima volta, cercando un sollievo che sa fin troppo bene non esiste. Invece si rende conto che non riesce più a ricordare i volti del suo branco. Disperata, la sua mente animale va in crisi, cerca ogni angolo di se stessa per trovare la forma dei suoi amati.
    
    
    Ma la bestia trova solo il tocco della compagna di viaggio che è riuscita a tenerla in vita fino a quel momento: Rabbia. Rabbia dedita a riprendersi la vita che ha perso. Rabbia che a breve scagionerà in un abbagliante performance di denti e artigli. Rabbia che porterà fine all'umanità che l'ha imprigionata. Un ululato affilato come un coltello attraversa il pozzo. La paura smarrita dagli uomini torna in loro mentre vedono la gabbia che li teneva al sicuro distrutta dall'interno. Le urla riempiono la stanza e il loro prezioso intelletto umano viene tagliato come burro.

    //Check per achievement racconti
    -> achievements_onGame_statusUpdate_RM ->
    
        +  \ {charTag(PG, "neutral")}:       <i>Vorrei leggere ancora.
            
           -> book_test_intro
        +  \ {charTag(PG, "neutral")}:       <i>Me ne vado.
            
            -> DarkLibraryModeOff ->
                     
            -> main
