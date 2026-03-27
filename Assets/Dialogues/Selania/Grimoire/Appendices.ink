/*************************

La logica di comparsa delle appendici è:
    * grimoire_choicesAndRelationships: sbloccata quando ce ne parlano o Mentore o Luna.
    * grimoire_greenhouseAndGifts: sbloccata dopo la prima pianta raccolta (backpack_findedGifts != ()) o dopo il commento di Mentore.
    * grimoire_kitchenAndRelationships: dopo l'apertura della cucina da parte di Chitarra.
    * grimoire_inkAndRewriting: dopo il commento di Mentore o di Luna sulla riscrittura.
    * grimoire_Sigils: dopo che ce ne parlano Mentore o Luna (l'idea è comunque di non condividerlo subito).

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

    Commento Luna se sbloccato

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
    Prendiamo quando si è appoggiata a me ieri sera, sotto la luna piena, e mi ha sfiorato il collo: avrei potuto agire come l'acqua, e mettere a nudo quei sentimenti che maturo da tempo.
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
* Tipo di testo: mail all'editore per un memoir
* Elementi della storia orizzontale: ha provato a tornare al luogo, senza mai riuscirci.
* Elementi di spiegazione:
* Nome intero di Franco, qualcosa su Franco e la serra, sua nonna, e su come siano collegati (K.) Parte con "no, non correggerò una parola della parte su Franco, anche se dovessi risultare pazza". Non dice mai che è una rana.
-

    Mettiamo le cose in chiaro, Barbara: mi avete scritto voi per avere un mio memoir, quindi ora non mi rompete per ridimensionare le mie "follie".
    Ho raccontato della mia relazione con tu sai chi per far felici i vostri followers.
    Ho allungato il brodo sulla faccenda della coven "così fai felici i tuoi fans, K."(Barbara: non ho fan, non ho followers. Siamo sorelle, punto.)
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
    Anche di S.C., nonostante tutto.
    Magari rimestando tra le erbe della serra.
    C'è una cosa che ho capito solo ora, da vecchia, ed è perché le piante della serra generano inchiostro se donate (e giuro che se metti questa cosa nel memoir appena sono spirito rendo amari tutti i tuoi piatti per il resto della tua vita! L'inchiostro è tabù. T-A-B-ù.).
    Ho pensato per anni che la faccenda fosse che fare un regalo, un buon regalo, dica molto di quello che pensi della persona, più delle parole.
    Però nei due anni passati con le ragazze di doni ce ne siamo fatti: pensa anche solo all'aiuto che ci siamo date.
    Pensa a come probabilmente G.M. mi abbia salvato la vita, trascinandomi via da lì.
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
    Per cui ti dono la mia vulnerabilità più grande, Barbara: speravo di morire sentendomi una bella persona, ma credo di aver fatto un grosso errore cinquantaquattro anni fa, quando ho permesso a S.C. di portare quel povero quindicenne con noi.
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
* Tipo di testo: una prefazione scritta per il ricettario di O.U.J. (da parte della vecchia coven, da nominare in giro nei documenti)
* Elementi della storia orizzontale: morte di O.U.J., strage di Bologna, il caso e la sua lotta contro quelle persone.
* Elementi di spiegazione: Gli elementi vivi e le caratteristiche di quel luogo, l'economia di scambio.
-


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

    Commento Luna se sbloccato

**************************/

/*************************

    Testo scritto da Y.

**************************/
* Tipo di testo: appunti per un convegno
* Elementi della storia orizzontale: 
* Elementi di spiegazione:
* Dove S.C. vede uno stallo sullo studio dell'inchiostro, Y ha trovato qualcosa di profondo.
* Y e il dono dell'olobino, il dono ha generato inchiostro.
-

->->




=== grimoire_Sigils
~ temp charNameOne = translator(firstChar_ActualName)
~ temp charNameTwo = translator(secondChar_ActualName)
~ temp charNameThree = translator(thirdChar_ActualName)
~ temp charNameFour = translator(fourthChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)

/*************************

    Commento Boccale

**************************/


/*************************

    Commento Mentore se sbloccato

**************************/

/*************************

    Commento Luna se sbloccato

**************************/
/*************************

    Testo scritto da S.C.

**************************/
* Tipo di testo: appunti operativi.
* Elementi della storia orizzontale: non ho scambi, relazioni, devo fare tutto da sola.
* Elementi di spiegazione: logica di massima.
-

Partiamo da questo:
    Sono arrivata a una quadra.
    Esistono venti sigilli stabili.
    Li chiamo "stabili" perché non mutano, non influenzano il mondo, ma sono lenti con cui interpretarlo, capirlo.
    E sono composti sempre da due glifi irripetibili.
    Ogni sigillo stabile ha tre varianti "instabili", derivate dall'aggiunta di un altro glifo.
    E sono instabili perché da una parte durano giusto una manciata di utilizzi, ma per questo interagiscono col mondo.
    E la cosa che non avevo capito davvero fino in fondo, è che questa instabilità apre a delle ambiguità.
    Sono sicura che Altare farebbe davvero bene a O.U.J. per esempio, perché è una persona già solida, mentre G.M. è così piccolo, giovane, deve ancora scoprire tanto su di sé.
    So che è giusto, so che è sensato.
    Sto anche scrivendo tutto quello che ho scoperto in un taccuino, con tutte le suggestioni che ho pensato, precise ma non troppo, evocative, perché questi sigilli parlano una lingua che non è nostra.
    E con questo materiale finalmente posso tornare anche dalle altre, spiegare, far capire che tutta questa fatica, queste tensioni alla fine sono servite a qualcosa.
    Sono sicura che K. troverà un uso per la sua serra, e Y. per creare libri trasformativi e G.M., credo che col giusto sigillo G.M. possa scoprire cosa l'ha ferito con Altare.
    Ora corro da loro, e così facciamo una grande festa.
    S.C.


->->