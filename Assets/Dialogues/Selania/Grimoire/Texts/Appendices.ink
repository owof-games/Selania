/*************************

La logica di comparsa delle appendici è:
    * grimoire_choicesAndRelationships: sbloccata quando ce ne parlano o Mentore o Strega.
    * grimoire_greenhouseAndGifts: sbloccata dopo la prima pianta raccolta (backpack_findedGifts != ()) o dopo il commento di Mentore.
    * grimoire_kitchenAndRelationships: dopo l'apertura della cucina da parte di Chitarra.
    * grimoire_inkAndRewriting: dopo il commento di Mentore sulla riscrittura.
    * grimoire_Sigils: dopo che ce ne parlano Mentore o Strega (l'idea è comunque di non condividerlo subito).

Lato informazioni, da capire con Mattia come strutturiamo le pagine, perché potrebbe aver senso vedere i libri prima dei commenti, più per impaginazione che altro.

**************************/

=== grimoire_choicesAndRelationships
~ temp charNameOne = translator(firstChar_ActualName)
~ temp charNameTwo = translator(secondChar_ActualName)
~ temp charNameThree = translator(thirdChar_ActualName)
~ temp charNameFour = translator(fourthChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)

/*************************

    Commento Mentore se sbloccato

**************************/

/*************************

    Commento Strega se sbloccato

**************************/

/*************************

    Testo scritto da G.M.

**************************/

<i><b>Bozza di lettera sugli elementi(?)</i></b>
<i>G.M.</i>

    <s>Ciao tesoro.</s>
    <s>Luce dei miei o</s>
    Ehi.
    Sono qui che non riesco a dormire dopo ieri sera, dopo...
    <s>Non avevo mai fatto sesso, sai?</s>
    Ok, calmati.
    Facciamo che questa è la bozza, idiota.
    Idiota e patetico.
    Poi chiederai a W.R. della carta pulita.
    Sii pratico.
    Pratico e ordinato.
    <i>Cose che voglio mettere nella lettera e che NON RIGUARDANO IL SESSO.</i>
    Sicuramente voglio parlare del discorso dei cinque elementi.
    Che è ovvio che lei e le altre conoscono, sono streghe da una vita.
    Ma come giustamente ha detto O.U.J., a volte una è così avanti nel percorso da dimenticarsi dei dettagli del passato, o una cosa del genere.
    Ok, il mio cervello sta funzionando meglio ora.
    Riesco quasi a non pensare alle sue <s>tet</s> BASTA!
    I cinque elementi.
    I cinque elementi.
    Voglio parlare dei cinque elementi.
    Il nostro sistema magico si basa su cinque elementi: fuoco, terra, acqua, aria e spirito.
    Non è una cosa insolita: la medicina cinese si appoggia su fuoco, terra, acqua, legno e metallo.
    Nella antica Grecia avevamo fuoco, terra, acqua, aria ed etere.
    La tradizione ayurvedica parla di fuoco, terra, acqua, aria e spazio.
    Un gruppo ristretto di simboli, di archetipi, è un ottimo punto di partenza per capire il mondo.
    E cinque è un bel numero: instabile, come tutti i numeri dispari, ma non con troppe cose da ricordare come un nove.
    Per lo meno, io nove cose non me le ricordo di sicuro.
    Insomma: il mondo è enorme e complesso e senza strumenti uno si sente perso.
    Ma se può ridurre tutto a cinque cose, allora è un punto di partenza per un viaggio immenso.
    E il primo punto che voglio dirle, è che davanti a una situazione o a un dialogo, tutte le cose che possiamo dire o fare si riducono a cinque.
    Prendiamo quando si è appoggiata a me ieri sera, sotto la Strega piena, e mi ha sfiorato il collo: avrei potuto agire come l'acqua, e mettere a nudo quei sentimenti che maturo da tempo.
    Oppure come il fuoco, e strapparle i vestiti di dosso.
    (Alla fine ho agito come aria, aria cattiva, e mi sono ripetuto che era razionalmente impossibile. C'è voluto un suo bacio per capire che davvero voleva fare sesso <b>con me</b>.)
    Credo sia quello che è successo col pappagallo: abbiamo trovato due simboli così elementari da cambiarne l'essenza.
    Ma il problema è che gli elementi sono un punto di partenza, non di arrivo.
    E secondo me è per questo che la sua ricerca non sta partendo.
    Perché niente è riducibile a un solo elemento.
    E perché le cose che facciamo assumono un significato nel tempo, accumulandosi assieme alle altre cose che diciamo o facciamo, o che non diciamo.
    (E la de Rossi che mi dice che sono una capra in italiano.)
    Posso dire che O.U.J. è una persona "spirito" perché ha sempre questa visione unitaria, comunitaria, trova sempre il punto di collegamento tra le cose.
    Ma O.U.J. è puro fuoco quando si arrabbia, ed è molto emotiva, e tollera le cazzate che dico, ma sempre fino a un certo punto.
    Per costruire un rapporto con O.U.J. non serve dire sempre cose "spirito".
    E infatti adora K., che è concreta, con le mani sempre nella terra.
    Quindi tutta questa pappardella per dirle cosa, G.M.?
    1. Che in ogni situazione possiamo compiere cinque scelte, e che quelle scelte possono essere lette secondo il nostro sistema magico elementale, ma
    2. Che le persone non sono "un elemento", e per questo i rapporti si costruiscono con alchimie molto più complesse. L'unica soluzione è quindi capire chi si ha davanti, e rendersi vulnerabili.
    3. Che ogni relazione che creiamo, trasforma anche noi.
    Anche se non lei non sembra vederlo.
    Non sono sicuro che per lei sia stata la stessa cosa, l'altra sera.
    E ho un po' paura.
    E se le do poi questa lettera, e pensa che sono un coglione?
    A quel punto non mi vorrà mai più.
    

->->




=== grimoire_greenhouseAndGifts
~ temp charNameOne = translator(firstChar_ActualName)
~ temp charNameTwo = translator(secondChar_ActualName)
~ temp charNameThree = translator(thirdChar_ActualName)
~ temp charNameFour = translator(fourthChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)

/*************************

    Commento Mentore se sbloccato

**************************/
/*************************

    Testo scritto da K.

**************************/

<i><b>Re: Ma se cancellassimo la parte di Franco?</i></b>
<i>Destinatario: barbaraC@edizioniEsoteriche.com</i>

    Mettiamo le cose in chiaro, Barbara: mi avete scritto voi per avere un mio memoir, quindi ora non mi rompete per ridimensionare le mie "follie".
    Ho raccontato della mia relazione con tu sai chi per far felici i vostri followers.
    Ho allungato il brodo sulla faccenda della congrega "così fai felici i tuoi fans, K."(Barbara: non ho fan, non ho followers. Siamo sorelle, punto.)
    Però mi devi lasciare in pace su Franco.
    La sua parte rimane così com'è.
    Anche perché senza Franco non ci sarebbe stata nessuna serra, e senza serra, nessun <i>"Funghi, licheni, muschi: fitomanzia ed erboristeria esoterica"</i>.
    E senza quel libro, la vostra casa editrice sarebbe fallita vent'anni fa.
    E sì, voglio il suo nome per intero, perché deve essere ricordato: Franco Lelio Arpagone Romualdo Arcezio Nepomiceno Alcuino.
    È stato il mio migliore amico e mentore in un periodo bello e complesso.
    Non deve essere dimenticato.
    Ok, ora mi calmo.
    Ma inizio ad essere vecchia per queste stronzate, Barbara.
    E forse scrivere questo memoir è più difficile di quanto pensassi: ho ottantaquattro anni, la mia vita sta finendo, e so ancora così poco del mondo.
    E delle piante.
    Ho provato a tornare più volte in quel luogo, sai?
    Esiste il sentiero, esistono le sue colline.
    Esistono ancora alcune delle fabbriche che si vedevano dalla fontana.
    Eppure non riesco ad arrivarci.
    Forse una parte di me spera di morirci.
    Lì, col ricordo di Franco, col ricordo delle mie amiche.
    Magari rimestando tra le erbe della serra.
    Ti svelo un segreto, anzi, una rivelazione.
    C'è una cosa che ho capito solo ora, da vecchia, ed è perché le piante della serra generano inchiostro se donate (e giuro che se metti questa cosa nel memoir appena sono spirito rendo amari tutti i tuoi piatti per il resto della tua vita! L'inchiostro è tabù. T-A-B-ù. Abbiamo visto cosa è accaduto ad Y.).
    Ho pensato per anni che la faccenda fosse che fare un regalo, un buon regalo, dica molto di quello che pensi della persona, più delle parole.
    Però nei due anni passati con le ragazze di doni ce ne siamo fatti: pensa anche solo all'aiuto che ci siamo date.
    Pensa a come probabilmente G.M. mi abbia salvato dall'esaurimento, trascinandomi via da lì.
    Non è questo un dono grandioso?
    Eppure non ho versato una goccia di inchiostro che una.
    Perché invece accade con le piante della serra?
    Credo che la cosa abbia a che fare con la trasformazione.
    In fondo, tutta la faccenda della "riscrittura", come la chiamava Y., aveva a che fare col trasformare.
    Le domande che genera la serra, le risposte che offre, sono un riflesso di ciò che è in noi fermo e che deve cambiare, smuoversi, mutare.
    Quelle piante crescono sulle nostre ferite, tra le pieghe delle nostre vulnerabilità.
    E cosa c'è di più grande in una relazione, che non regalare con fiducia ciò che ci rende vulnerabili?
    Anzi, forse risuonare, nelle nostre vulnerabilità.
    E per questo alcune piante non stimolano la comparsa dell'inchiostro, altre un po', altre molte.
    Perché alla fin fine, per fortuna, ognuna di noi è vulnerabile in modo diverso.
    Prendi me: sono qui, vecchia e malata a incazzarmi con te, e sai qual è la cosa che mi fa sentire più vulnerabile?
    Non l'arrivo della morte, perché è parte del processo della vita, le piante me l'hanno sempre insegnato.
    È non sapere cosa ne è stato di Franco.
    Se vive, se è morto.
    Quali delle sue storie assurde non ho mai ascoltato.
    E cosa è successo a G.M. dopo la fuga.
    Era così giovane, e l'abbiamo trascinato in una cosa enorme.
    Per cui ti dono la mia vulnerabilità più grande, Barbara: speravo di morire sentendomi una bella persona, ma credo di aver fatto un grosso errore cinquantaquattro anni fa, quando ho permesso a tua zia di portare quel povero quindicenne con noi.
    Forse questo memoir è un modo per chiedergli scusa.
    Per cui non chiedermi di togliere Franco, non chiedermi di sembrare più "normale", non chiedermi di tradire la memoria di quel povero ragazzo.
    K.

->->


=== grimoire_kitchenAndRelationships
~ temp charNameOne = translator(firstChar_ActualName)
~ temp charNameTwo = translator(secondChar_ActualName)
~ temp charNameThree = translator(thirdChar_ActualName)
~ temp charNameFour = translator(fourthChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)

/*************************

    Commento Chitarra

**************************/

/*************************

    Testo scritto per O.U.J.

**************************/
<i><b>Registrazione anonima trascritta per l'archivio della congrega</i></b>

    Vi chiedo scusa per la voce incerta, ma l'emozione è tanta.
    E non conosco un modo per parlare di O.U.J. senza emozionarmi.
    Se fosse qui con noi, oggi, la prima domanda che ci farebbe è: "Com'è che non state mangiando?"
    <i>Risate in sottofondo.</i>
    Uno dei principi di questa congrega è: manifestiamo il futuro consapevoli del nostro passato.
    Ma O.U.J. fa davvero parte del nostro passato?
    Oggi, due agosto duemiladieci, sono passati esattamente trent'anni dalla bomba che ce l'ha portata via mentre era alla stazione di Bologna.
    Bomba messa dalle stesse persone contro cui ha lottato per una vita, con la piazza e con la magia.
    Le stesse persone i cui volti e ideali ora sono al Governo, sdoganati con una leggerezza che alcune di noi, le più vecchie di noi, vivono come un fallimento.
    L'avevamo detto alla fine della guerra, e non ci hanno ascoltate: il fascismo era qualcosa da estirpare.
    Invece hanno lasciato i suoi funzionari nello scheletro della Repubblica, c'è stata l'amnistia.
    E quel passato, quel passato che non doveva ripetersi, è oggi il nostro presente.
    <i>Mormorii dalla sala.</i>
    Ma lo sono anche i suoi anticorpi.
    Molte di voi non erano nemmeno nate quando O.U.J. ha perso la vita, ma tutte voi la conoscete.
    Attraverso i racconti delle più vecchie, come me.
    Attraverso la testimonianza costante di quella capacità di cura e ascolto che solo lei aveva.
    O.U.J. ha lottato, sempre.
    Anche contro la congrega, quando alcune di noi, me compresa, non erano pronte ad accogliere una donna trans tra le nostre fila.
    <i>Una porta viene sbattuta.</i>
    Ci sono volte in cui la cosa migliore che ti possa capitare è di non avere ragione.
    Scusate ma le lacrime rendono difficile leggere.
    <i>Rumore d'acqua in un bicchiere.</i>
    Grazie.
    Dicevo.
    O.U.J. fa davvero parte del nostro passato?
    E la risposta è no.
    Perché O.U.J. è stata il nostro passato, ma soprattutto è il nostro presente e futuro.
    Chi ha avuto la fortuna di cucinare con lei ha visto quanto quell'esperienza potesse essere trasformativa.
    Quante di noi hanno ammesso per la prima volta a voce alta cose di sé che nemmeno conoscevano, mentre condividevano con lei un piatto di zuppa?
    Quante hanno raccontato le difficoltà che vivevano dentro e fuori la congrega con tranquillità, con senso di accoglienza, così da capire cosa fare, cosa cambiare?
    Quante volte il giusto ingrediente ci ha aiutate a capire cosa andava o meno nei nostri rapporti?
    O.U.J. ci ha lasciato uno dei riti più potenti: la condivisione.
    O.U.J. non riconosceva alcun possesso.
    Le cose sono fatte per essere usate da chi ne ha bisogno in quel momento.
    Ha creato un modo di gestire la congrega, e la magia, che mette al centro non il possedere, ma il donare.
    Ha sempre detto che è qualcosa che ha imparato "nel giardino", quando è scomparsa per due anni con altre compagne.
    Ma ho sempre pensato che in realtà quell'esperienza avesse fatto maturare in lei qualcosa che già era lì, viva e potente.
    Pensiamo a come ci ha insegnato a cucinare.
    Cucinare con lei voleva dire rispondere a domande non con "Sì" e "No" e "In realtà credo che...".
    Voleva dire aggiungere della noce moscata in modo inquieto per far capire quanto stesse stretta la famiglia d'origine.
    O rimestare del bicarbonato nell'impasto per far lievitare il pane e parlare del proprio desiderio.
    Il rito della cucina di O.U.J. ci ha tenute assieme durante gli attacchi della polizia, durante l'esplosione del berlusconismo, durante la cementificazione selvaggia dei campi e dei boschi in cui praticavamo.
    Il rito della cucina di O.U.J. ci ha fatto superare i nostri limiti, come quando sorella Wanda ci ha ricordato che "siete diventate un gruppo di femministe bianche viziate".
    Il rito della cucina di O.U.J. ci ha permesso di metterci in ascolto e cambiare.
    Ed è qui la grande differenza tra noi e loro, i fascisti ora al potere: grazie a O.U.J., noi abbiamo imparato a cambiare. Loro non cambiano mai.
    E l'unica cosa che a questo mondo non cambia, è ciò che è morto.
    Per celebrare quindi la vita di O.U.J., ripetiamo assieme le sue tre regole:
    Ogni ingrediente che metto viene dal cuore.
    Ogni critica deve essere un atto d'amore.
    Il pasto è finito quando i piatti sono lavati.
    <i>Rumore di acqua bevuta.</i>
    E ora lascio la parola a K., che ci racconterà alcuni aneddoti della sua amicizia con O.U.J.
    
->->


=== grimoire_inkAndRewriting
~ temp charNameOne = translator(firstChar_ActualName)
~ temp charNameTwo = translator(secondChar_ActualName)
~ temp charNameThree = translator(thirdChar_ActualName)
~ temp charNameFour = translator(fourthChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)

/*************************

    Commento Mentore se sbloccato

**************************/


/*************************

    Testo scritto da Y.

**************************/

<i><b>Un nuovo nome, una nuova vita: appunti sulla riscrittura.</i></b>
<i>Lectio Magistralis di Y., DAMS di Bologna, ottobre 2004.</i>

    In tutti questi anni non mi sarei mai aspettata di tornare a parlare in un'Università pubblica.
    Non dopo la cacciata che ho subito vent'anni fa da parte dei miei colleghi di Lettere.
    Non dopo essermi vista negare ogni pubblicazione da almeno un decennio.
    Può sembrare un inizio troppo personale per un discorso davanti a giovani studenti e studentesse, a professori di cui per lo più non conosco il nome.
    Ma in fondo sono stata chiamata qui per parlare di qualcosa di molto personale.
    E poi non sono mai stata molto brava a fare le cose per bene.
    Ma c'è una cosa che ho fatto per bene, ormai trent'anni fa.
    Ed è stata quella di scegliermi un nuovo nome.
    Rinunciare a quello che la mia famiglia aveva deciso per me, quello con cui il mondo mi leggeva, valutava, giudicava, e prenderne uno che fosse solo mio.
    Il nome è una cosa potente.
    Ce lo insegna Ursula LeGuin ne "Il mago di Earthsea": conosci il vero nome di qualcuno, e avrai su di lui potere.
    Il mio vecchio nome era un incantesimo che mi teneva imprigionata.
    Ma per giungere al mio nuovo nome ho dovuto fare un percorso.
    Un percorso che ha a che far col riscrivere il mio passato.
    Non intendo un riscrivere di revisione: quella è una vecchia passione che lascio a chi ancora oggi ci è nemico.
    Parlo di una riscrittura che è un cambio di prospettiva, come quando ti rendi conto di aver trovato la protagonista giusta, ma la storia sbagliata.
    Voi qui ora siete così giovani, e sono sicura che vi sarete già sentite dire migliaia di volte che è un'età grandiosa questa, che avete tutto e non lo sapete.
    Credo sia una grandiosa cazzata.
    Ogni età è terribile, ogni età è grandiosa.
    E ogni età è un passo in avanti su una strada che rischia di essere dettata da tutti i passi che abbiamo alle spalle.
    Da come li raccontiamo, li nominiamo.
    La riscrittura di cui parlo è il riprendere in mano il diritto a narrarsi.
    A riconoscere che le cose che ci sono successe, e le cose che facciamo, sono, punto.
    Ma anche che possono essere lette in modi molto diversi.
    Magari ti chiamano Pesante, perché parli sempre di ciò che non va. Ma magari vorresti chiamarti Giustizia, perché noti sempre le storture di questo mondo.
    Magari ti chiamano Pasticciona, perché ti metti sempre nei casini. E invece potresti chiamarti Curiosità, perché credi solo a quello che puoi sperimentare in prima persona.
    Magari ti chiamano Robot, perché sembri riservato e distaccato. Ma forse il tuo vero nome è Voce, perché la tua unicità è così difficile da fare ascoltare, che hai smesso di provare a parlare.
    Magari ti chiamano "Non abbastanza".
    Ti chiamano "Rotta".
    E tu dici: basta.
    Riscriversi e scegliere il proprio nome non è alzarsi e dirsi: da oggi sono questo.
    Per me è stato un processo solitario: avevo la vostra età, e pensavo di essere solamente sbagliata.
    Negli anni ho aiutato altre persone a riscriversi, e come tante cose, anche questo è un processo che funziona al meglio in compagnia.
    Una buona relazione è un forte sicuro nei momenti di cambiamento, quando ci sentiamo vulnerabili.
    Quando mi hanno cacciata da Lettere, l'hanno fatto dicendomi che parlavo di esoterismo, di magia.
    Eppure la pubblicità che ci circonda cerca ogni giorno di riscriverci, per convincerci di avere bisogni che non abbiamo.
    Ma a differenza della pubblicità, quando decidiamo di aiutare o di farci aiutare in un processo di riscrittura, il nuovo nome è qualcosa che viene dal cuore di chi si fa riscrivere.
    Non può essere forzato, non è coercizione.
    E qui vi chiedo di fare con me il salto più grande.
    La mia riscrittura è stata un incidente.
    Ero in pieno trip da fungo, uno dei migliori della mia vita, e mi sono ritrovata tra le dita dell'inchiostro.
    Qualcosa di intimo, di personale, che all'epoca avevo appena iniziato a studiare.
    Riscriversi in compagnia funziona meglio perché una buona relazione produce qualcosa, che chiameremo inchiostro, che è il simbolo della nostra natura più intima.
    Più la relazione è alta, più inchiostro produrremo, più sarà facile riscrivere il modo in cui guardiamo la nostra storia.
    E quell'inchiostro, quella è la cosa su cui lavoriamo per passare dalla persona che ci hanno detto di essere, è ciò che davvero siamo.
    Forse se fossi stata una pittrice avrei pensato più a un ridisegnare che a un riscrivere.
    Se fossi stata scultrice, al trovare la vena nella materia grezza, per farne emergere la figura.
    E forse, se non fossi sempre stata una strega con la passione per libri e vecchi archivi, avrei realizzato sin da subito la cosa più ovvia: le relazioni che viviamo ci cambiano, ci mostrano parti di noi che non conoscevamo.
    Accoglierle è sempre parte del nostro percorso.
    E a volte celebrarle, scegliendo un nuovo nome.
    Vi auguro quindi che le amicizie, gli asti e gli amori che affronterete in questi anni di Università e poi dopo, siano il laboratorio costante per voi per trovare altri cinque, venti, mille nomi.
    Per rompere quel qualcosa che fa dire e decidere agli altri chi siete.
    Per stupirvi sempre della persona che sarete.
    Y.


->->




=== grimoire_Sigils
~ temp charNameOne = translator(firstChar_ActualName)
~ temp charNameTwo = translator(secondChar_ActualName)
~ temp charNameThree = translator(thirdChar_ActualName)
~ temp charNameFour = translator(fourthChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)
//Da aprire con un LIST_COUNT > 2, perché i fogli sparsi danno molte informazioni.
/*************************

    Commento Boccale

**************************/


/*************************

    Commento Mentore se sbloccato

**************************/

/*************************

    Commento Strega se sbloccato

**************************/
/*************************

    Testo scritto da S.C.

**************************/
<i><b>Fogli sparsi trovati al Nido, nessuna firma.</i></b>


    G.M.: se trovi questi fogli ma sei ancora dell'idea di capire come i sigilli funzionino con la tua testolina magnifica, non leggere, perché ci sono molti dettagli.
    Può anche darsi che troverai un modo più intelligente del mio di capirli.
    O che di nuovo non ti raccapezzerai col mio modo di ragionare.
    
    Sono arrivata a una quadra.
    1. Posso creare qualsiasi tipo di sigillo, l'importante è che un glifo non venga ripetuto.
    2. Posso usarne solo uno alla volta.
    3. E una volta che l'ho usato, non posso più recuperarlo.
    Cosa che mi genera molta frustrazione.

    Inoltre non posso usare tutto quello che creo.
    1. Con quattro glifi il sigillo implode subito. Svanisce nel nulla, puff.
    2. Con quello a cinque l'energia è così forte che a distanza di due giorni ho ancora una gamba semibloccata. Per fortuna avevo vicino il piede e non la faccia quando li ho attivati.
    3. Tre glifi creano un sigillo instabile, ma che regge tre utilizzi prima di consumarsi.
    4. Due glifi sono stabili, ma per questo inutilizzabili. Sono però utili per capire come funzionano le loro varianti a tre glifi.
    Infine:
    1. Il primo glifo che inserisco nel sigillo sembra esserne sempre rafforzato.
    2. Il secondo non subisce particolari modifiche.
    3. Il terzo invece ne esce in qualche modo indebolito, anche se non per forza in modo negativo.
    È come un accordo sospeso, che può concludere il brano o generare un cambiamento.
    Uh.
    Sto scrivendo ad elenco come G.M. e con la stessa mancanza di fuoco di Y., mi prendo una pausa.

    Ho iniziato a raccogliere in modo logico i sigilli che ho scoperto.
    Sto costruendo una guida per il futuro, perché credo siano lo strumento più potente che abbiamo mai trovato in questo luogo.
    Avendo trovato cinque glifi, i sigilli stabili, quelli a due, sono venti.
    Ognuno di questi può avere tre varianti a tre glifi, che sono instabili, ma il sigillo a due aiuta che li accomuna aiuta a capirne meglio la natura, il fuoco.
    Il modo in cui ragionano è così alieno, che sto usando un linguaggio più evocativo, simile a quello degli i-Ching, per descriverne le proprietà.
    Anche perché non ho ancora capito fino in fondo cosa possano fare.
    Ad esempio quello che ho chiamato <i>Zolla</i> mi è diventato chiaro grazie a K.
    "Rami sotterranei e lana di micelio. Florido il trifoglio, nuda la senape."
    K. mi ha spiegato che nei campi il trifoglio prospera quando la rete del micelio fungino è estesa, collegando erbe e piante.
    Ma la senape soffre in questa situazione, perché incapace di connettersi alla rete, e si ritrova con un terreno povero dell'azoto che le serve.
    <i>Zolla</i> è un sigillo che parla di radici che crescono assieme, che si aiutano a vicenda, e la domanda che rimane aperta è: dove finisce il confine tra supporto e dipendenza?
    Un altro sigillo molto chiaro è quello che ho chiamato <i>Uncinetto</i>, pensando a mia madre.
    "Si spoglia la pecora, si essica il cardo. Dalla stalla al filatoio, dal filatoio alla torre".
    La logica che ho usato è quella di trovare nel punto di contatto tra il fuoco (azione e trasformazione) e la terra (la parte che concretizza l'azione) la figura del sigillo stabile <i>Calibro</i>, come emblema dell'artigianalità.
    <i>Uncinetto</i> ha qualcosa di spirituale, è un chiedersi: le cose che creiamo, a chi vanno, chi connettono? Di chi facciamo il bene?
    Perché alla torre c'è il carceriere, e c'è il carcerato.

    
    Dopo l'esperienza con G.M., ho lanciato un incantesimo sul taccuino che sto creando: se qualcuno studierà i sigilli utilizzandolo, vedrà comparire le frasi poco per volta, e a caso.
    Ho bisogno che ci sia prudenza, che ci sia attenzione, perché non tutto è così chiaro (ancora mi chiedo a cosa serva <i>Dado</i>, così come metà dei sigilli con la stella per dominante).
    Se lasciassi il taccuino totalmente accessibile sin da subito, l'illusione del sapere spingerebbe la persona a fare mosse sciocche.
    Non sono ancora così sicura che questi sigilli siano una buona cosa.
    O.U.J. dice che ci sono strumenti nati per fare il bene, altri il male, ma che per lo più il loro valore sta nell'utilizzo che ne facciamo.
    Io li ho usati pensando di far del bene, e ho ferito una persona amica.
    Spero che le altre possano cavare da tutto questo qualcosa di davvero utile per le nostre lotte.
    Oggi, otto giugno settantaquattro, chiudo finalmente i miei studi.
    Ora voglio solo riprendere a dedicarmi alle persone che mi hanno accompagnata fin qui.
    Negli ultimi mesi le ho completamente trascurate.

->->