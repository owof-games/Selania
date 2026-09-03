//Cognome/alias L - R
=== lamia
<b>Il sassolino</b> di Lamia (she/they). Instagram: @mannaggiate_
    //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
        {
            - library_unreadStories has Lamia:
                ~ library_unreadStories -= Lamia
                ~ library_readStories += Lamia
                 -> refresh_book_lists ->
        }  
        
    
    È iniziato tutto in una giornata mediocre. Il sole era coperto da nuvole scialbe, e nell'aria ancora si sentiva l'olezzo dei campi fertilizzati di fresco. Tutto è iniziato in una giornata così, anzi, tutto è iniziato nella vasca delle aragoste del ristorante Da Sallustio, in Porta Genova, in una giornata così. Di colpo, uno dei sassolini del fondo dell'acquario ha iniziato a saltare.
    
    
    All'inizio se ne era accorta solo Agata, la cameriera del turno pranzo del mercoledì, e non ci aveva nemmeno dato troppa importanza, dopotutto era assolutamente convinta che quelle aragoste sapessero più di quanto millantavano, ma poco a poco anche i clienti avevano iniziato a notarlo. Un insignificante, minuscolo, delicato sassolino, era riuscito a darsi abbastanza spinta da saltare fuori – forse aiutato dalle correnti del depuratore, dicono alcuni – e a uscire indisturbato dalla porta del locale. Saltellando.
    
    Tutto sarebbe stato dimenticato in fretta, se non fosse che, due giorni dopo, la signora Dorotea giurò di aver visto un sassolino uguale saltare contro il muretto che separava le sue mangrovie dai ciliegi dei Beschi, facendone crollare un angolo. Poi – continuando a giurare – un sassolino alla volta, se ne erano andati via. Il Sindaco, allarmato da questo sconvolgimento dell'ordine naturale delle cose – "I sassolini a terra!

    Sono fondamenta, non pin-up!" gridò sulla gazzetta -, aveva indetto un consiglio d'urgenza con il capo delle forze dell'Ordine, il Commissario Giracollo, l'ingegnere e autoproclamato consigliere all'ordine estetico Ing. Stoppa, il direttore del circolo di bocce "Età d'argento" prof. Severo Giunta, il geologo Malacarta, e il parroco monsignor Levi. «Si tratta di un chiaro attacco all'organo di ordine estetico. Oggi crolla un muretto, domani qui si torna al comunismo!»
    
    «Stoppa non si agiti, dopotutto è solo un sassolino. Insomma, basta ignoralo e svanirà da sé.» «Giunta, intanto si sta parlando di un aggregato calcareo-biogenico con segni di erosione meccanica artificiale e una patina superficiale dovuta a interazioni con composti ammoniacali presenti nei reflui delle aragoste e modifiche dovute alla sinteticità del mangime. Analizziamolo con dovuta cura!» «Basta! Ho bisogno di capire come poterci muovere. Non voglio che sotto il mio mandato scoppi una rivoluzione. Giracollo, te che dici?»
    
    
    «Sindaco, l'unica opzione qui è incollarli a terra. Tutti. Ogni muretto, ogni sasso del viale, ogni minuscola briciola di calcestruzzo che esce dalle fughe delle piastrelle di ogni cucina.» «Inutile incollare qualcosa di demoniaco! Qui, sindaco, propongo di torchiare quelle aragoste, capire come hanno fatto a mettere certe idee strane in mente a quel sasso! Via la testa, il corpo cade.» Mentre discutevano sulle tipologie di colla vinilica in commercio, e vagliavano la possibilità di gambizzare qualcosa che non possiede arti, un rumore attirò la loro attenzione: toc, toc. Dei sassolini avevano iniziato a colpire la finestra.

    //Check per achievement racconti
    -> achievements_onGame_statusUpdate_RM ->

        +  \ {charTag(PG, "neutral")}:       <i>Vorrei leggere ancora.
            
           -> book_test_intro
        +  \ {charTag(PG, "neutral")}:       <i>Me ne vado.
            
            -> DarkLibraryModeOff ->
                     
            -> main


=== loris_casagrandi
<b>Volevo essere solo cervello</b>, di Loris Casagrandi (he/him - she/her). Instagram: @lorisdesign4exp Trigger warning: riferimento a gesti ti autolesionismo o violenza.
        
        +  \ {charTag(PG, "neutral")}:       <i>Inizio la lettura.
        //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
            {
                - library_unreadStories has LorisCasagrandi:
                    ~ library_unreadStories -= LorisCasagrandi
                    ~ library_readStories += LorisCasagrandi
                     -> refresh_book_lists ->
            }  
        + {library_unreadStories has LorisCasagrandi} \ {charTag(PG, "neutral")}:       <i>Per ora non me la sento di affrontare questo tema.
            -> tempTW -> book_test_intro
        + {library_unreadStories has LorisCasagrandi} \ {charTag(PG, "neutral")}:       <i>Non voglio più incontrare questa storia.
            ~ library_unreadStories -= LorisCasagrandi
                -> refresh_book_lists -> book_test_intro
        -
    
    

    Volevo essere solo cervello, per non assomigliarti, per dimenticare che ti ho avuto come modello. Pilota di un mecha di carne, player di un avatar non scelto. Eppure non ha funzionato perché avevi plasmato i miei percorsi mentali. Per questo ho strappato tutto e sono ripartito da zero, per scoprire che anche in quel vuoto rimaneva la tua veste. Così mi sono ripreso il mio corpo, ho cercato di strapparmi la pelle perché  non la volevo più addosso. Volevo togliere le forme che vi avevi tatuato, I solchi abitudinari che vi avevi tracciato, i modi di cui non mi sono mai liberato.
    
    Ho provato con forza a scavare più a fondo, oltre il muscolo, fino all'osso dove ho trovato di nuovo il tuo marchio. Anche nel midollo ho trovato il sapore dei tuoi traumi, per questo senza più risorse ho provato ad abbracciarmi: lacrime, risa e pianti nei fiumi del mio sangue. In quella follia e in quel caos ho trovato magia, la forza di rendere quel odore di morte una cosa mia, e l'ho urlato a pieni polmoni. 
    
    Con violenza l'ho urlato alla mia ansia e ai miei errori, l'ho urlato alla tua immagine, l'ho urlato alle tue idee che erano la mia  croce. L'ho gridato in corteo e alle mie etichette, alla vita e alle politiche fasciste. Ed è da allora che come un'accetta che taglia il legno mi faccio strada tra la vita e il sogno. Un colpo alla volta faccio di me il mio unico regno e non mi curo di cosa perdo per strada, ogni fronda tagliata, caduta e abbandonata sarà ricreata o ne rimarrò senza: in ogni caso sarà una nuova cicatrice da me scelta e non inflitta dalla tua cura scellerata.
    
    //Check per achievement racconti
    -> achievements_onGame_statusUpdate_RM ->

        +  \ {charTag(PG, "neutral")}:       <i>Vorrei leggere ancora.
            
           -> book_test_intro
        +  \ {charTag(PG, "neutral")}:       <i>Me ne vado.
            
            -> DarkLibraryModeOff ->
                     
            -> main



=== val_fausto_lattanzio
<b>Home</b>, di Val Fausto Lattanzio (he/they). Instagram: @_whimsival Trigger warning: disforia, dismorfia.

        +  \ {charTag(PG, "neutral")}:       <i>Inizio la lettura.
        //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
            {
                - library_unreadStories has ValFaustoLattanzio:
                    ~ library_unreadStories -= ValFaustoLattanzio
                    ~ library_readStories += ValFaustoLattanzio
                     -> refresh_book_lists ->
            }  
        + {library_unreadStories has ValFaustoLattanzio} \ {charTag(PG, "neutral")}:       <i>Per ora non me la sento di affrontare questo tema.
            -> tempTW -> book_test_intro
        + {library_unreadStories has ValFaustoLattanzio} \ {charTag(PG, "neutral")}:       <i>Non voglio più incontrare questa storia.
            ~ library_unreadStories -= ValFaustoLattanzio
                -> refresh_book_lists -> book_test_intro
        -
    
    
    
    I have lived in this house forever, even though I never chose it—it's the house my mother chose for me. The pink walls of my room have witnessed my childhood, then my adolescence, all the way to this moment. This is the right house for you, my mother says, and I lie down on the bed and stare at the ceiling while the man who says he loves me enters my body, pressing onto me dozens of blog posts and newspaper articles: How to Put a Woman in Her Place, Ten Steps to Drive Her Crazy, Why Men Are Good at Dominating —because that's what men who love women do, they get on top, and they push, and they pant into their faces.

    And so he enters me and asks if I like it, and my obedient voice answers Yes, yes, I like it, even though my body feels nothing, even though the rabid dog inside me thrashes, even though  I  want  to  tear  this  man  open with spider legs, even though I want to slam my head against the wall until I no longer recognize it, even though I can only come when I lie on my bed and touch myself, without penetration, without him—now that, 
    
    finally,  testosterone is secretly coursing through me, and I imagine myself on top, penetrating, claiming, doing what my body wants, and my rage erupts, and the dog's chain snaps, and my body shiny with T-gel is the meltdown of the universe—the entire universe kicks and screams and thrashes with me. And my house is quiet now. Its walls are drenched in colors I have never seen before, flung in strokes. My body is the home I have chosen for myself.

    //Check per achievement racconti
    -> achievements_onGame_statusUpdate_RM ->

        +  \ {charTag(PG, "neutral")}:       <i>Vorrei leggere ancora.
            
           -> book_test_intro
        +  \ {charTag(PG, "neutral")}:       <i>Me ne vado.
            
            -> DarkLibraryModeOff ->
                     
            -> main

=== romi
<b>Il principe sbagliato</b> di Sofia Abatangelo alias Romi alias Romi Sofia Abatangelo(any). Instagram: @romiabatangelo Trigger warning: violenza psicologica.
        +  \ {charTag(PG, "neutral")}:       <i>Inizio la lettura.
        //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
            {
                - library_unreadStories has Romi:
                    ~ library_unreadStories -= Romi
                    ~ library_readStories += Romi
                     -> refresh_book_lists ->
            }  
        + {library_unreadStories has Romi} \ {charTag(PG, "neutral")}:       <i>Per ora non me la sento di affrontare questo tema.
            -> tempTW -> book_test_intro
        + {library_unreadStories has Romi} \ {charTag(PG, "neutral")}:       <i>Non voglio più incontrare questa storia.
            ~ library_unreadStories -= Romi
                -> refresh_book_lists -> book_test_intro
        -
    
    

    C'era una volta un principe che non ne faceva mai un giusta. Il suo modo di muoversi era sbagliato, il suo modo di vestirsi era sbagliato, il suo modo di parlare era sbagliato. Anche il suo modo di pensare era completamente sbagliato. Ma la cosa più sbagliata del principe erano le sue emozioni. A volte rideva, piangeva o si arrabbiava per un nonnulla, mentre altre volte il suo volto rimaneva impassibile quando invece avrebbe dovuto animarsi.
    
    Così, anche se era un principe, ogni persona della sua corte - dal consigliere allo stalliere, dalla regina alla sguattera di cucina - non faceva che dirgli come muoversi, come vestirsi, come camminare, come parlare, e perfino quello che avrebbe dovuto sentire e pensare. Il principe cercava in tutti i modi di seguire i consigli che gli venivano dati, ma per quanto ci provasse finiva sempre per sbagliare tutto lo stesso. Così gli anni passarono e il principe non divenne mai re. Si era circondato di consiglieri che potessero insegnargli a comportarsi come un principe.
    
    
    Ma questi o si seccavano quando lui non capiva e finivano per abbandonarlo, oppure, con la scusa che era sbagliato, gli davano ordini come se fosse un domestico, punendolo quando non riusciva ad eseguirli. E fu così che il principe venne scacciato dal suo stesso castello e si trovò rinchiuso nelle segrete. I giorni passarono, i mesi passarono, gli anni passarono, e il principe se ne stava buono buono nella sua cella, cercando di non farsi vedere né sentire, finendo per convincersi di non meritare altro che quella vita da recluso.
    
    Finché un giorno ci fu un terremoto che aprì uno squarcio nel muro, verso una zona delle segrete che non aveva mai esplorato prima. Il principe vagò a lungo, cercando una via di uscita da quello che sembrava diventato un labirinto, senza riuscire ad andare nè avanti nè indietro, finché un giorno non si trovò davanti a una grossa porta di ferro battuto dipinta di rosso. A quella vista il cuore del principe si riempì di coraggio e la porta, pur pesantissima, si mosse facilmente al tocco delicato del principe, come se lo stesse aspettando.
    
    Il principe si trovò nell'armeria del castello, dove erano custodite tutte le armi che gli erano destinate per diritto di nascita ma che, siccome era sbagliato, nessuno gli aveva mai permesso di toccare. La sua attenzione venne catturata da una lunga spada dorata, brillante come il sole. Il principe la prese, finalmente senza che nessuno potesse impedirgli di farlo, e quando la impugnò fu come se un fuoco gli si fosse acceso dentro.
    
    Così, con la spada in pugno, il principe uscì dall'armeria e vide davanti a sé una scala che lo portò fuori dalle segrete poi sempre più su,  nelle cucine del castello dove il cuoco gli aveva detto di smettere di fare i capricci e mangiare senza fare tante storie,
    
    nella biblioteca dove i precettori gli dicevano che  pensava troppo e ubbidiva poco, fino alle stanze reali, dove aveva sentito il Re dire alla Regina che si vergognava di lui. E con la spada in mano si riprese tutto ciò che gli apparteneva di diritto.

    //Check per achievement racconti
    -> achievements_onGame_statusUpdate_RM ->
    
        +  \ {charTag(PG, "neutral")}:       <i>Vorrei leggere ancora.
            
           -> book_test_intro
        +  \ {charTag(PG, "neutral")}:       <i>Me ne vado.
            
            -> DarkLibraryModeOff ->
                     
            -> main


=== nicola

<b>San Benefizio</b> di garak_the_tailor (they/them). 

            {
                - library_unreadStories has Nicola:
                    ~ library_unreadStories -= Nicola
                    ~ library_readStories += Nicola
                     -> refresh_book_lists ->
            }  

    
    

    “Entriamo in quello che è il vero e proprio cuore del monastero: il chiostro superiore. Nel XV secolo, i monaci commissionano un ciclo di affreschi sulla vita del fondatore della congregazione: San Benefizio Coperni. Nato in una delle famiglie più ricche e potenti del granducato, viene cresciuto nell’agiatezza, costantemente seguito da tutori. Benché fosse stato avviato allo studio del trivio e del quadrivio, il ragazzo non mostrava alcuna propensione verso le scienze, le arti, la letteratura, la filosofia… Verso alcunché… Benefizio passò la sua infanzia e la sua adolescenza ad attendere un’illuminazione, e nonostante l’impegno e la dedizione, dimostrò più volte che… beh… non era roba per lui. 
    
    Il padre, Alberico, si convinse comunque a iscrivere Benefizio alla Grande Scuola Urbana. E qui, nel primo affresco del nostro ciclo, incontriamo proprio il santo, poco più che ragazze􀆩o, che lascia la nobile casa paterna per dirigersi nell’Urbe. In questo dipinto murale, la cui didascalia recita “Come lo dimonio fa perdere la Bussola a Benefizio”, possiamo notare come i primi tempi nella scuola risultano davvero molto travagliati: il ragazzo non riusciva a integrarsi, combattuto tra la dissolutezza della grande ci􀆩à e la crescente aspirazione verso l’Altissimo. Finché un giorno, in una locanda gestita da male femmine, il santo conosce i due giovani che di lì a poco diverranno i suoi più cari amici: Riccotto Riccotti e Lombardo Nanetti. I prossimi affreschi ci raccontano la via della depravazione che i tre imboccano. Tentato costantemente dai piaceri della carne, con una disponibilità pressoché illimitata garantita dai fondi della famiglia Coperni, Benefizio, Riccotto e Lombardo trasformarono quello che doveva essere un percorso di crescita in una lenta discesa verso il peccato. Qui vediamo l’affresco intitolato “Come Benefizio decide di gestire il racket delle male femmine”; in questo affresco possiamo ammirare l’episodio di “Come i tre vendono farina tagliata con sabbia ai mugnai della ci􀆩à”; ancora: “Come Riccotto e Lombardo fanno debiti con i giocatori d’azzardo”; “Come Lombardo e Benefizio tentano di avvelenare un prete che non pagava il pizzo”; e infine: “Benefizio e lo sfortunato pastorello”. 
    
    Ne “Come dei banditi, guidati dal demonio e mandati dal tizio a cui Riccotto e Lombardo dovevano dei soldi, fanno violenza molto brutta ai tre giovani” vediamo Benefizio ottenere la rivelazione. Mentre i bruti lo percuotono, egli vede una lunga scala, composta da mille e più pioli, che ascende verso l’empireo; lungo questa scala, monaci di bianco vestiti cercano di raggiungere il Paradiso. Alcuni di loro però scivolano e cadono rovinosamente al suolo, rimanendo immobili nelle polle di sangue. Altri però, assistiti da figure angeliche, riescono a oltrepassare la barriera delle nubi e scompaiono avvolti dalla luce. Mentre perde i sensi, Benefizio capisce che quello sarebbe stato il suo destino. Benefizio, Riccotto e Lombardo prendono così la decisione di abbandonare gli studi e, ispirati dalle vite dei Grandi Padri Eremiti, ritirarsi il più possibile lontano dal mondo… e dagli strozzini. Ma come fare? Come trovare un sito in cui insediarsi per iniziare il proprio percorso anacoretico? La soluzione la vediamo in questo affresco, dove i giovani si recano da Alberico. L’uomo accoglie con dolore la decisione del figlio di farsi monaco eremita… Conviene a questo punto soffermarsi sulla maestria del pi􀆩ore, in grado di tratteggiare la pena paterna in poche linee, racchiudendola tu􀆩a nello sguardo sofferente di Alberico.
    
    Vero è che per alcuni critici negli occhi del genitore sembra annidarsi più… diciamo… del sollievo. Ma a noi piace attenerci alla versione canonica, che si concretizza con la scelta da parte di Alberico di donare ai tre un appezzamento di terreno improduttivo e arido, situato in cima a una collina nel bel mezzo del deserto di Cappona, a poca distanza dal villaggio di Garbata: il nome di quel luogo era ed è Colle Vigneto di Sopra. E giungiamo alla trasfigurazione di Benefizio, il miracolo a cui dobbiamo la fortuna della congregazione vignetana. Durante il primo inverno sul Colle, egli lamenta i sintomi di una febbre molto violenta, a sua detta causata dal demonio. Il santo ordina ai confratelli di aiutarlo portandogli carne ben co􀆩a e vino speziato, soprattutto vino speziato. Durante la notte, il giovane abate si sveglia di soprassalto e dice agli altri di aver sognato una grotta circondata da arbusti di pungitopo e sambuco: l’ingresso è sigillato da un grande masso, ma dall'interno filtra una luce pura e intensa. Benefizio inizia così la ricerca di tale misterioso speco, convinto che quello avuto sia stato un sogno rivelatore. Arrancando nella neve, seguito dai suoi compagni, Benefizio avanza nella tormenta. Stremato, il santo ode un rumore, un rantolo sordo che echeggia poco distante. Seguendo quel suono, la comitiva raggiunge l’accesso a un antro buio. Senza indugio, il nostro entra nell’anfratto e chiede agli altri monaci di sigillare l’ingresso con una grande roccia, proprio come nel suo sogno. I compagni obbediscono, manifestando la loro preoccupazione: Benefizio allora li redarguisce “Mi è stato dato un segno inequivocabile che in questa grotta risiede la Luce. Serrate questo foro nella montagna e lasciatelo chiuso finché non riceverete un segno altrettanto chiaro”. I monaci, colpiti dalla risolutezza del santo, fanno rotolare il grande masso nell’ingresso della grta. Inizia così la loro veglia di fronte a quello che verrà chiamato, nei secoli a venire, l’Orifizio di San Benefizio, o il San Buco, da cui si dice derivi appunto il nome della pianta. Discesa la sera, i monaci si preparano a trascorrere la notte al freddo e al gelo, quando tu􀆩o d’un tratto dall'interno dell’Orifizio giungono urla belluine alternate a ruggiti spaventosi. Poi, all’improvviso, dalla grotta, solo silenzio. I monaci spostano dunque la grossa pietra: a terra, brandelli di stoffa bianca, di carne e pelle, ovunque schizzi di sangue e in mezzo a questo spettacolo si erge maestoso un orso. I vignetani, atterriti e al contempo estasiati, si rendono conto di aver assistito all’incredibile trasformazione di Benefizio in una bestia: il corpo originario si era aperto, dischiuso, facendo emergere la possente creatura dal suo interno. Mentre i monaci rifle􀆩ono sul senso di tu􀆩o questo, l’orso aggredisce con i suoi artigli due di loro, uccidendoli sul colpo. 
    
    La tradizione vuole che questi due fossero i peccatori della comunità. Anche Riccotto perde una gamba, tranciata di netto dall’animale, e si ritiene che questo gesto significasse che il giovane aveva perso la retta via e che dovesse tornarci… anche zoppicando in caso… Dopo questi cruenti accadimenti, l’orso si volta e torna nel San Buco, mentre i monaci rimasto in piedi richiudono lesti l’ingresso con il masso: un semplice fugace sguardo dell’animale è sufficiente per far capire loro le intenzioni di Benefizio, ovvero proseguire la sua santa mutazione in solitaria, lontano dal mondo. I confratelli decidono così di restare lì, a vegliare quel luogo sacro, cercando di capire cosa fare, perché senza il fondatore sarebbe mancata la guida spirituale, il sostegno alla fede nei momenti di sconforto, l’infinito amore verso tu􀆩a la comunità. E, aggiungo, sarebbe venuto a mancare anche il supporto economico della famiglia Coperni, con il rischio dell’annullamento della concessione del terreno alla congregazione. 
    
    Con il passare dei giorni però, nonostante il freddo, una piccola folla in adorazione si raduna proprio di fronte all’Orifizio: il racconto della sacra metamorfosi aveva raggiunto anche le campagne circostanto, attirando l’attenzione di contadini e popolani che in poco tempo si riversano sul Colle per ammirare il miracolo, portandosi appresso soldi e regalie. I monaci ricevono notizie anche da Alberico il quale, avendo perso il figlio, pare aver perso anche la fede e reclama a gran voce i suoi terreni. Sembra davvero una situazione difficile da gestire, con i fedeli che esigono di vedere il prodigio da una parte e le pressioni del vecchio Coperni dall’altra. Ma ancora una volta è proprio lo stesso Benefizio a sciogliere il nodo formatosi nelle gole dei vignetani. 
    
    Un mattino, da dietro il colle, ricompare proprio lui, il santo! Nudo, decisamente più basso, con occhi cerulei anziché castani, con capelli rossi anziché mori, con una lunga barba, affamato, con un naso più adunco, con lineamenti germanici, con voce diversa, incapace di parlare bene la nostra lingua e probabilmente più giovane di almeno una decina di anni. Ma è indubbiamente Benefizio! Inizialmente è disorientato, pare non capire cosa sta succedendo, e nella sua infinita modestia continua a ripetere “Io no Benefizio, io no Benefizio”, ma poi i confratelli lo lavano, lo vestono e lo mostrano al popolo, che si genuflette. Nell’ultimo affresco, vediamo la congregazione portare Benefizio al cospetto di Alberico il quale, dopo la sorpresa e la perplessità iniziale, apre di nuovo il suo cuore alla fede, permettendo ai monaci di restare a Colle Vigneto. Alcune fonti, mai confermate, parlano di un ravvedimento del Coperni padre dopo aver saputo la quantità di donazioni, regalie e contributi che l’Orifizio di San Benefizio attirava ogni giorno sulle sue proprietà e su cui poteva chiedere una percentuale… Ma sono solo fonti apocrife… 
    
    Da quel momento la congregazione di Colle Vigneto di Sopra cresce in numero, in grazia… e in ricchezza… tutto nel nome di San Benefizio Coperni, colui che nell’Orifizio si trasfigurò insegnandoci che chi vive nella luce di Nostro Signore potrà anche morire nel peccato, ma rinascerà a nuova vita, trasformandosi, mutando, ma restando sempre fedele all’Altissimo.
    
    E pure a se stesso direi…

    //Check per achievement racconti
    -> achievements_onGame_statusUpdate_RM ->
    
        +  \ {charTag(PG, "neutral")}:       <i>Vorrei leggere ancora.
            
           -> book_test_intro
        +  \ {charTag(PG, "neutral")}:       <i>Me ne vado.
            
            -> DarkLibraryModeOff ->
                     
            -> main




