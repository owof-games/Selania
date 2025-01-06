/* ---------------------------------

   Presentazioni

 ----------------------------------*/

=== presentazioni ===
    Sconosciuto: Che buffo, è da un po' che non incontravo una persona nuova.
    Sconosciuto: Immagino tu abbia un milione di domande, vero?
    - (top)
        * [Dove sono?]
            {chiSei:Mentore|Sconosciuto}: Questa è una risposta che potrai trovare solo col tempo.
            {chiSei:Mentore|Sconosciuto}: La cosa che posso dirti con certezza però è che un posto sicuro.
            {chiSei:Mentore|Sconosciuto}: Un posto dove prenderti le cose coi tuoi tempi, direi.
            {chiSei:Mentore|Sconosciuto}: Che non è poi male, no?
            {chiSei:Mentore|Sconosciuto}: So che fuori da qui è tutto un vortice continuo di casini.
                -> top
        * (chiSei) [Chi sei?]
            Sconosciuto: Dipende molto dal momento, e dalla persona che ho davanti.
            Sconosciuto: Ma direi che puoi chiamarmi Mentore.
            Mentore: Non un nome originale ma ehi, almeno ti ricordi chi chiamare se sei in difficoltà, no?
                -> top
        * (vado) [Come me ne vado da qui?]
            {chiSei:Mentore|Sconosciuto}: Dipende.
            {chiSei:Mentore|Sconosciuto}: Se con "qui" intendi questa conversazione, di solito interrompere le chiacchierate è sempre possibile.
            {chiSei:Mentore|Sconosciuto}: Basta dire qualcosa tipo "me ne vado" o simili.
            {chiSei:Mentore|Sconosciuto}: Nei casi più estremi c'è chi dice "quit", che credo sia il verso di un uccellino.
            {chiSei:Mentore|Sconosciuto}: Spesso tornano comunque, e la cosa mi fa piacere.
            {chiSei:Mentore|Sconosciuto}: Per il resto: se sei qui è perché in qualche modo l'hai chiesto.
            {chiSei:Mentore|Sconosciuto}: Forse ancora non lo sapevi, ma non è un problema: Presto o tardi capirai il perché direi.
                -> top
        * {vado} [Me ne vado.]
            {chiSei:Mentore|Sconosciuto}: Giusto un secondo, persona nuova.
            -> name
        * -> name
    
    = name    
        {chiSei:Mentore|Sconosciuto}: Ora tocca a me farti una domanda: come ti devo chiamare?
        {chiSei:Mentore|Sconosciuto}: Puoi usare qualsiasi nome: prendi questa occasione come un piccolo nuovo inizio.
            -> il_mio_nome ->
        {chiSei:Mentore|Sconosciuto}: E quali sono i pronomi in cui ti riconosci?
        {chiSei:Mentore|Sconosciuto}: Ti chiedo già scusa per la quantità ridotta di scelte.
        {chiSei:Mentore|Sconosciuto}: Da qualche parte un giorno ho trovato un testo firmato <i>dev</i> dove qualcuno piangeva nel cercare di "programmare scelte multiple attorno all'uso dei pronomi".
        {chiSei:Mentore|Sconosciuto}: Non ho ben compreso sinceramente, ma mai dire mai: magari in futuro qualche persona troverà una soluzione più efficace.
            -> assegnazione_genere ->
        {chiSei:Mentore|Sconosciuto}: piacere di conoscerti, {nome}.
        {chiSei:Mentore|Sconosciuto}: E {pronomi has maschili: benvenuto|{pronomi has femminili: benvenuta|benvenutə}}. Spero ti troverai bene, qui.
        {not chiSei: Sconosciuto: Ah, che sbadato. Invece tu chiamami <b>Mentore</b>.|Mentore: Forse ne va un po' del mio orgoglio.}
        {not chiSei: Mentore: Forse un po' didascalica come scelta, ma ti assicuro che è molto comoda.|Mentore: Ma se qualcosa non va, non farti problemi a dirmelo.}
        Mentore: Un'altra cosa importante, {nome}.
        Mentore: Nel tuo soggiorno in questo luogo potrebbe accadere che incontrerai qualche situazione complessa.
        Mentore: Non posso prometterti di avere il controllo su tutto, perché in fondo sono il Mentore, non <i>dev</i>.
        Mentore: Ma se ti va puoi dirmi quali sono le cose che ti creano disagio, e farò del mio meglio per non fartele incontrare.
        Mentore: Ci sono temi che vuoi evitare?
            * [Sì.]
                -> trigger_warning ->
            * [Ci penso un poco.]
                Mentore: Per questa come per altre cose, puoi sempre farmi le domande che vuoi quando mi incontri in giro.
            -
        Mentore: Ma in tutto questo non ti ho detto cosa devi fare!
        Mentore: Facciamo così: prova a parlare con uno degli spettri qui nel <b>Mausoleo</b>.
        Mentore: Tipo quello con la tomba gialla.
        Mentore: E poi torna da me.
    -> main      
            
    === dono_e_inchiostro
        Mentore: Sembra che qualcuno ti abbia raccontato la sua storia!
        Mentore: Gli spettri sono totalmente innocui, l'unico problema è che non hanno trovato una soluzione a questioni rimaste aperte quando erano in vita.
        Mentore: Spesso sono storie di rimpianto o rimorso, in alcuni causi di traumi, o sensi di colpa.
        Mentore: E a volte hanno avuto una vita così bella che non accettano davvero di morire.
        Mentore: Sia quel che sia, sono fermi su quel ricordo, convinti che il passato sia il presente.        
        Mentore: In tutte queste situazioni arrivi tu, {nome}.
        Mentore: Prima ascolti per bene quello che dicono.
        Mentore: Poi fai loro un dono adeguato.
        Mentore: E infine aiuti questi spettri a riscrivere un pezzo della loro storia, il pezzo che le blocca qui.
        Mentore: A darsi un nuovo nome.

            - (top2)
            * [Tipo gaslighting?]
                Mentore: No no no assolutamente no.
                Mentore: Anche perché uno spettro preso in giro è uno spettro che diventa davvero, davvero, davvero fastidioso.
                    -> top2
            * [Dovrei dare consigli a uno sconosciuto?]
                Mentore: A volte è più facile aprirsi a chi non si conosce.
                Mentore: E mentre noi riflettiamo sulle loro difficoltà, impariamo anche qualcosa su di noi.
                Mentore: E poi... no, questo te lo dirò tra qualche tempo.
                    -> top2
            *-> dono       
             
    = dono
        Mentore: Quindi: hai sentito la storia di questo spettro.
        Mentore: Il passaggio successivo è fargli un dono.
        Mentore: I doni sono oggetti che puoi recuperare in modi diversi.
        Mentore: Quello più comune è che compaiano mentre cammini tra le varie aree.
        Mentore: Una cosa comodissima è che finiranno direttamente nel tuo zainetto.
        Mentore: Un altro tipo di doni sono quelli che puoi crescere in serra.
        Mentore: Mediti, coltivi qualcosa, e quando questa è cresciuta in alcuni casi puoi raccoglierla come dono.
        Mentore: Altri modi compariranno man mano che sarai più {pronomi has maschili: esperto|{pronomi has femminili: esperta|espertə}}.
        Mentore: Ora, la cosa più importante.
        Mentore: I doni non sono cose a caso da dare allo spettro, ma sono modi per fargli capire che hai ascoltato la sua storia, e che vuoi aiutarlo.
        Mentore: Per aiutarlo avrai bisogno di una risorsa che noi mentori chiamiamo <i>inchiostro</i>: uno strumento che può servirti per aiutare lo spettro a riscrivere la sua storia.
        Mentore: Il dono giusto può permetterti di avere molto inchiostro, e convincerlo con facilità.
        Mentore: Il dono sbagliato potrebbe lasciarti senza inchiostro, rendendoti le cose molto difficili.
        Mentore: In alcuni casi un dono potrebbe perfino permetterti di scoprire un segreto sullo spettro.
        Mentore: Tutti i doni che hai trovato fino a un dato momento sono all'interno del tuo <b>inventario</b>.
        Mentore: Per cui prenditi del tuo tempo, controlla quello che hai nell'inventario.
        Mentore: Cammina, vai alla serra, e torna quando sei {pronomi has maschili: sicuro|{pronomi has femminili: sicura|sicurə}} di avere il dono che ti convince.
        Mentore: Poi parla con lo spettro, dagli il dono, e torna da me.
            * [Capito]
                    -> main

    
    === domande_e_obiettivo
        {statoInchiostroSpettroUno == Vuoto or statoInchiostroSpettroUno == Scarso: Mentore: Non ti demoralizzare, capita a chiunque di non dare il massimo al primo colpo.}
        {statoInchiostroSpettroUno == Normale or statoInchiostroSpettroUno == Medio: Mentore: Bel colpo! Ti sei {pronomi has maschili: guadagnato|{pronomi has femminili: guadagnata|guadagnatə}} subito una bella dose di inchiostro!}
        {statoInchiostroSpettroUno == Altissimo: Mentore: Beh, hai dato allo spettro il suo dono preferito! Sei già {pronomi has maschili: pronto|{pronomi has femminili: pronta|prontə}} per questo incarico!}
        Mentore: Ora arriva la parte più complessa.
        Mentore: Puoi immaginare di dividere questa situazione in due fasi.
        Mentore: Nella prima, poni delle domande allo spettro, in modo da capire meglio cosa prova o pensa.
        Mentore: Tieni conto che dato che il tuo obiettivo è quello di convincerlo ad avere una visione di sé diversa, è più efficace se riesci a farlo riflettere sullo stesso tema o stato d'animo.
        Mentore: Metti ad esempio che è una persona insicura e rabbiosa: farla riflettere solo sulle sue insicurezze o sulla rabbia ti renderà poi la seconda parte più facile.
        Mentore: Ma non demoralizzarti se non è sempre chiaro: come per tutt3 noi, i pensieri di uno spettro sono cose complesse da articolare.
        Mentore: Poi arriva la seconda fase, quella che da il vero e proprio nome al tuo ruolo.
            * [Il mio ruolo?]
            Mentore: Ah, già, ehm, dimenticavo.
            Mentore: Qui chiamiamo il tuo ruolo quello {pronomi has maschili: del <b>Riscrittore</b>|{pronomi has femminili: della <b>Riscrittora</b>|dellə <b>Riscrittorə</b>}}, perché aiuterai queste persone a riscrivere e rileggere il loro passato.
            Mentore: Sei un po' come la persona cara che ti aiuta a cambiare prospettiva quando tutto sembra impossibile.
            Mentore: O il film, il gioco, il libro che ti dà un po' di respiro quando il cervello è travolto dall'ansia.
            Mentore: E quando arriva questo momento di chiarezza, allora lo spettro può finalmente darsi un nuovo nome.
            -
        Mentore: E così arriviamo alla seconda fase. Non farai più domande, ma affermazioni.
        Mentore: Affermazioni per guidare lo spettro a rileggere la sua storia.
        Mentore: Qui, più inchiostro avrai a disposizione più avrai a disposizioni delle "azioni forti": un modo per dire che hai più forza di coinvincimento.
        Mentore: Se sei {pronomi has maschili: riuscito|{pronomi has femminili: riuscita|riuscitə}} nella fase uno a farlo riflettere sullo stesso tema, ti sarà tutto più facile.
            * [E se fallisco?]
                Mentore: Se non c'è azione, non c'è fallimento, {nome}.
                Mentore: Ma se non c'è azione, non c'è nemmeno la vita.
                Mentore: Il tuo compito qui è quello di aiutare lo spettro ad uscire dal suo stallo.
                Mentore: A volte i risultati potrebbero essere diversi da quelli che speravi, e ci sta.
                Mentore: Ma con una buona dose di ascolto ho la certezza che farai qualcosa di magnifico!
                    -> main
        
        
    === feedback_spettro_uno
        Mentore: Beh, direi che è andata, {nome}.
        {effettivoStatoSpettroUno:
            - IlSocievole: Mentore: Hai aiutato lo spettro a riscoprire la sua natura socievole!
            - IlConsapevole: Mentore: Ora lo spettro è capace di riconoscere la necessità della collaborazione!
            - IlGuarente: Mentore: Vedere le proprie ferite è il primo passo per accogliere le parti di noi che non amiamo.
            - IlTerrorizzato: Mentore: La sua paura è stata più forte della tua dedizione. Questo lavoro è più difficile di quanto sembri.
            - LAbbandonato: Mentore: Lo spettro si è ancorato alla sua paura della solitudine, ma son sicuro che tu hai imparato qualcosa di importante.
            - LArrabbiato: Mentore: La rabbia è una grande trasformatrice. Spero solo che il nostro spettro sappia cosa farne.
        }
        
        Mentore: Da adesso in avanti tenderò a spostarmi un poco: ho diverse cosine da fare in giro.
        Mentore: Ma vedrai che ci incontreremo spesso qui in giro.
        Mentore: E per ogni momento di confusione, ricordati che potrai chiedermi qualsiasi cosa.
        Mentore: A presto!
            ~ move_entity(Mentore, Funghi)
            -> main
       

/* ---------------------------------

   Tutorial

 ----------------------------------*/


=== tutorial
//Strutturare come wave sintetica?
    Mentore: Ecco i luoghi che puoi visitare in questo momento.
    Mentre: Su quali vorresti avere un po' di informazioni?

-(top)
    + [Sul mausoleo.]
            Mentore: Il Mausoleo, ad est del Giardino, è il posto dove si trovano i vari spettri.
            Mentore: Non saranno tantissime, non ti preoccupare: ogni {pronomi has maschili: Riscrittore|{pronomi has femminili: Riscrittora|Riscrittorə}} si occupa di uno specifico mausoleo.
            Mentore: All'ingresso troverai diverse lapidi. Ognuna indica lo spettro che vi è contenuto e il nome che si è dato prima di morire.
            Mentore: Alcune richiedono un po' di esperienza prima di interagirci, altre ti chiederanno di ascoltare subito la loro storia.
            Mentore: Ricorda che non puoi mai iniziare una riscrittura senza un dono.
            Mentore: I doni li trovi in giro camminando.
            Mentore: O puoi crearne tu di nuovi, come alle <b>Serre</b>.
            Mentore: Più il dono è vicino a quello che di cui ha bisogno lo spettro, più sarà facile convincerlo a riscrivere la sua versione di sé.
            Mentore: Dopo il dono ti verrà indicata la quantità di <b>inchiostro</b>: più è alto, più sarai capace di riscrivere la visione di sé che ha lo spettro.
            Mentore: E in alcuni casi, potresti scoprire qualcosa di speciale.
                -> top

    + [Sulle serre.]
            Mentore: La serra è un piccolo posto di meditazione.
            Mentore: Tu vai lì, ti guardi in giro.
            Mentore: E se non cresce nulla puoi provare a raccontare qualcosa e lasciare che poi cresca la pianta giusta.
            Mentore: Ci cresce di tutto: funghi, pianti, muschi e cose che non credo abbiano una vera classificazione fuori di qui.
            Mentore: Le cose crescono col loro tempo nelle serre.
            Mentore: E a volte svanisco, se non ci presti attenzione.
            Mentore: Merita andarci ogni tanto.
            -> top

    + [Sul giardino.]
            Mentore: Quello è un po' il nostro posto di passaggio.
            Mentore: Prima era un bosco, ma a forza di camminare è rimasta solo l'erbetta.
            Mentore: E una bella panchina su cui rilassarsi quando il mondo va troppo di fretta.
            -> top

    + {storiaUno == Conclusa}[Sulle falene.]
        Informazioni
            -> top
    + {storiaUno == Conclusa}[Sul labirinto.]
        Informazioni
            -> top
    + {storiaDue == Conclusa}[Sulle tisane.]
        Informazioni
            -> top
    + {storiaDue == Conclusa}[Sulle sirene.]
        Informazioni
            -> top
    + {storiaDue == Conclusa}[Sulla biblioteca.]
        Informazioni
            -> top
    + [Ho cambiato idea]
        -> parlareColMentore
    -

    -> parlareColMentore

=== compito
        Mentore: Te la faccio breve: nel <b>Mausoleo</b> incontrerai degli <b>spettri</b>.
        Mentore: Sono totalmente innocui, l'unico problema è che non hanno trovato una soluzione a questioni rimaste aperte quando erano in vita.
        Mentore: Spesso sono storie di rimpianto o rimorso, in alcuni causi di traumi, o sensi di colpa.
        Mentore: E a volte hanno avuto una vita così bella che non accettano davvero di morire.
        Mentore: Sia quel che sia, sono fermi su quel ricordo, convinti che il passato sia il presente.
        Mentore: In tutte queste situazioni arrivi tu, {nome}:
        Mentore: ascolti per bene quello che dicono,
        Mentore: fai loro un dono adeguato,
        Mentore: e poi aiuti questi spettri a rileggere un pezzo della loro storia, il pezzo che le blocca qui.
        Mentore: A darsi un nuovo nome.
        Mentore: Qui chiamiamo il tuo ruolo quello {pronomi has maschili: del <b>Riscrittore</b>|{pronomi has femminili: della <b>Riscrittora</b>|dellə <b>Riscrittorə</b>}}, perché aiuterai queste persone a riscrivere e rileggere il loro passato.
        Mentore: Due cose importantissime: ci sono più strade per aiutare ogni spettro.
        Mentore: E non sempre puoi portare alla risoluzione che vorresti, e va bene così.
        Mentore: Il tuo obiettivo principale è aiutarli ad uscire dallo stallo in cui sono, il resto viene dopo.
            ->->
/* ---------------------------------

   Aiuto con le storie

 ----------------------------------*/
=== consigli_storie ===
{
    - storiaUno == InCorso:
        -> consigli_storia_uno
    - storiaDue == InCorso:
        -> consigli_storia_due
    - storiaTre == InCorso:
        -> consigli_storia_tre
    - storiaQuattro == InCorso:
        -> consigli_storia_quattro
    - storiaCinque == InCorso:
        -> consigli_storia_cinque
    - storiaSei == InCorso:
        -> consigli_storia_sei
    - storiaSette == InCorso:
        -> consigli_storia_sette 
}

=== consigli_storia_uno
{~ Consiglio storia uno|Consiglio storia uno|Consiglio storia uno}
    ->parlareColMentore

=== consigli_storia_due
Consiglio storia due
    ->parlareColMentore

=== consigli_storia_tre
Consiglio storia tre
    ->parlareColMentore

=== consigli_storia_quattro
Consiglio storia quattro
    ->parlareColMentore


=== consigli_storia_cinque
Consiglio storia cinque
    ->parlareColMentore


=== consigli_storia_sei
Consiglio storia sei
    ->parlareColMentore


=== consigli_storia_sette
Consiglio storia sette
    ->parlareColMentore



/* ---------------------------------

   Trigger Warning
       
//Variabili per tracciare i trigger warning
VAR alcolismo = false
VAR abusi = false
VAR lutto = false

 ----------------------------------*/
 
 === trigger_warning ===
    Mentore: Qui sono i principali temi delicati che potresti incontrare durante le tue chiacchierate.
    Mentore: Riuscirò per la maggior parte dei casi a fare in modo che tu non ne venga mai in contatto se li disabiliti, ma in alcune situazioni. come con gli spettri, le cose sono un po' complicate.
    Mentore: E sono consapevole che ne mancano diversi, ma qui è un lavoro complicato, sono l'unico mentore, ma sono sempre pronto ad accogliere ogni segnalazione.
    Mentore: Nel caso, prova ad evocare <i>dev</i>.

    - (top)
    Mentore: Cosa vorresti evitare?
    + [Preferirei non leggere nulla che riguardi l'abuso di alcool.]
        Mentore: Capisco benissimo. Preferenza registrata.
        ~ alcolismo = false
         + + [C'è altro che vorrei evitare.]
                -> top
         + + [Sono a posto così.]
                ->->
         - -   
    + [Non voglio leggere storie su relazioni abusanti.]
        Mentore: Hai il mio appoggio. Preferenza registrata.
        ~ abusi = false
         + + [C'è altro che vorrei evitare.]
                -> top
         + + [Sono a posto così.]
                ->->
         - -  
    + [Non me la sento di parlare di lutto.]
        Mentore: Sentiti a casa. Preferenza registrata.
        ~ lutto = false
         + + [C'è altro che vorrei evitare.]
                -> top
         + + [Sono a posto così]
                ->->
         - -          
    + [Preferirei evitare storie di solitudine e abbandono.]
        Mentore: Preferenza registrata. E se butta male, sono qui.
        ~ solitudine = false
         + + [C'è altro che vorrei evitare.]
                -> top
         + + [Sono a posto così.]
                ->->
         - -          
    + [Sono a posto così.]
        ->->
    -  
 -> main