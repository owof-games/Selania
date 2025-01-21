/* ---------------------------------

   Presentazioni

 ----------------------------------*/

=== welcome ===
    Sconosciuto: Che buffo, è da un po' che non incontravo una persona nuova.
    Sconosciuto: Immagino tu abbia un milione di domande, vero?
    - (top)
        * (dove) [Dove sono?]
            {chiSei:Mentor|Sconosciuto}: Questa è una risposta che potrai trovare solo col tempo.
            {chiSei:Mentor|Sconosciuto}: La cosa che posso dirti con certezza però è che un posto sicuro.
            {chiSei:Mentor|Sconosciuto}: Un posto dove prenderti le cose coi tuoi tempi, direi.
            {chiSei:Mentor|Sconosciuto}: Che non è poi male, no?
            {chiSei:Mentor|Sconosciuto}: So che fuori da qui è tutto un vortice continuo di casini.
                -> top
        * (chiSei) [Chi sei?]
            Sconosciuto: Dipende molto dal momento, e dalla persona che ho davanti.
            Sconosciuto: Ma direi che puoi chiamarmi Mentor.
            Mentor: Non un name originale ma ehi, almeno ti ricordi chi chiamare se sei in difficoltà, no?
                -> top
        * (vado) [Come me ne vado da qui?]
            {chiSei:Mentor|Sconosciuto}: Dipende.
            {chiSei:Mentor|Sconosciuto}: Se con "qui" intendi questa conversazione, di solito interrompere le chiacchierate è sempre possibile.
            {chiSei:Mentor|Sconosciuto}: Basta dire qualcosa tipo "me ne vado" o simili.
            {chiSei:Mentor|Sconosciuto}: Nei casi più estremi c'è chi dice "quit", che credo sia il verso di un uccellino.
            {chiSei:Mentor|Sconosciuto}: Spesso tornano comunque, e la cosa mi fa piacere.
            {chiSei:Mentor|Sconosciuto}: Per il resto: se sei qui è perché in qualche modo l'hai chiesto.
            {chiSei:Mentor|Sconosciuto}: Forse ancora non lo sapevi, ma non è un problema: Presto o tardi capirai il perché direi.
                -> top
        * {vado} [Me ne vado.]
            {chiSei:Mentor|Sconosciuto}: Giusto un secondo, persona nuova.
            -> your_name
        * {vado or chiSei or dove} [Perfetto: ma ora?]
            -> your_name
        * -> your_name
    
    = your_name    
        {chiSei:Mentor|Sconosciuto}: Ora tocca a me farti una domanda: come ti devo chiamare?
        {chiSei:Mentor|Sconosciuto}: Puoi usare qualsiasi name: prendi questa occasione come un nuovo inizio.
            -> name_choice ->
        {chiSei:Mentor|Sconosciuto}: E quali sono i pronouns in cui ti riconosci?
        {chiSei:Mentor|Sconosciuto}: Ti chiedo già scusa per la quantità ridotta di scelte.
        {chiSei:Mentor|Sconosciuto}: Da qualche parte un giorno ho trovato un testo firmato <i>dev</i> dove qualcuno piangeva nel cercare di "programmare scelte multiple attorno all'uso dei pronouns".
        {chiSei:Mentor|Sconosciuto}: Non ho ben compreso sinceramente, ma mai dire mai: magari in futuro qualche persona troverà una soluzione più efficace.
            -> gender ->
        {chiSei:Mentor|Sconosciuto}: piacere di conoscerti, {name}.
        {chiSei:Mentor|Sconosciuto}: E {pronouns has him: benvenuto|{pronouns has her: benvenuta|benvenutə}}. Spero ti troverai bene, qui.
        {not chiSei: Sconosciuto: Ah, che sbadato. Invece tu chiamami <b>Mentor</b>.|Mentor: Forse ne va un po' del mio orgoglio.}
        {not chiSei: Mentor: Forse un po' didascalica come scelta, ma ti assicuro che è molto comoda.|Mentor: Ma se qualcosa non va, non farti problemi a dirmelo.}
        Mentor: Un'altra cosa importante, {name}.
        Mentor: Nel tuo soggiorno in questo luogo potrebbe accadere che incontrerai qualche situazione complessa.
        Mentor: Non posso prometterti di avere il controllo su tutto, perché in fondo sono il Mentor, non <i>dev</i>.
        Mentor: Ma se ti va puoi dirmi quali sono le cose che ti creano disagio, e farò del mio meglio per non fartele incontrare.
                -> trigger_warning ->
        Mentor: Ma in tutto questo non ti ho detto cosa devi fare!
        Mentor: Facciamo così: prova a parlare con uno degli spettri qui alla <b>fermata del bus</b>.
        Mentor: Tipo quello con la tomba arancione.
        Mentor: E poi torna da me.
    -> main      
            
    === gifts_and_ink
        Mentor: Sembra che qualcuno ti abbia raccontato la sua storia!
        Mentor: Gli spettri sono totalmente innocui, l'unico problema è che non hanno trovato una soluzione a questioni rimaste aperte quando erano in vita.
        Mentor: Spesso sono storie di rimpianto o rimorso, in alcuni casi di traumi, o sensi di colpa.
        Mentor: E a volte hanno avuto una vita così bella che non accettano davvero di morire.
        Mentor: Sia quel che sia, sono fermi su quel ricordo, convinti che il passato sia il presente.        
        Mentor: In tutte queste situazioni arrivi tu, {name}.
        Mentor: Prima ascolti per bene quello che dicono.
        Mentor: Poi fai loro un dono adeguato.
        Mentor: E infine aiuti questi spettri a riscrivere un pezzo della loro storia, il pezzo che le blocca qui.
        Mentor: A darsi un nuovo name.

            - (top2)
            * [Tipo gaslighting?]
                Mentor: No no no assolutamente no.
                Mentor: Anche perché uno spettro preso in giro è uno spettro che diventa davvero, davvero, davvero fastidioso.
                    -> top2
            * [Dovrei dare consigli a uno sconosciuto?]
                Mentor: A volte è più facile aprirsi a chi non si conosce.
                Mentor: E mentre noi riflettiamo sulle loro difficoltà, impariamo anche qualcosa su di noi.
                Mentor: E poi... no, questo te lo dirò tra qualche tempo.
                    -> top2
            * -> gift      
             
    = gift
        Mentor: Quindi: hai sentito la storia di questo spettro.
        Mentor: Il passaggio successivo è fargli un dono.
        Mentor: I doni sono oggetti che puoi recuperare in modi diversi.
        Mentor: Quello più comune è che compaiano mentre cammini tra le varie aree.
        Mentor: Una cosa comodissima è che finiranno direttamente nel tuo zainetto.
        Mentor: Un altro tipo di doni sono quelli che puoi crescere in serra.
        Mentor: Mediti, coltivi qualcosa, e quando questa è cresciuta in alcuni casi puoi raccoglierla come dono.
        Mentor: Altri modi compariranno man mano che sarai più {pronouns has him: esperto|{pronouns has her: esperta|espertə}}.
        Mentor: Ora, la cosa più importante.
        Mentor: I doni non sono cose a caso da dare allo spettro, ma sono modi per fargli capire che hai ascoltato la sua storia, e che vuoi aiutarlo.
        Mentor: Per aiutarlo avrai bisogno di una risorsa che noi mentori chiamiamo <i>inchiostro</i>: uno strumento che può servirti per aiutare lo spettro a riscrivere la sua storia.
        Mentor: Il dono giusto può permetterti di avere molto inchiostro, e convincerlo con facilità.
        Mentor: Il dono sbagliato potrebbe lasciarti senza inchiostro, rendendoti le cose molto difficili.
        Mentor: In alcuni casi un dono potrebbe perfino permetterti di scoprire un segreto sullo spettro.
        Mentor: Tutti i doni che hai trovato fino a un dato momento sono all'interno del tuo <b>inventario</b>.
        Mentor: Per cui prenditi del tuo tempo, controlla quello che hai nell'inventario.
        Mentor: Cammina, vai alla serra, e torna quando sei {pronouns has him: sicuro|{pronouns has her: sicura|sicurə}} di avere il dono che ti convince.
        Mentor: Poi parla con lo spettro, dagli il dono, e torna da me.
            * [Capito]
                    -> main

    
    === questions
        {statoInchiostroPersonaggiaUno == Vuoto or statoInchiostroPersonaggiaUno == Scarso: Mentor: Non ti demoralizzare, capita a chiunque di non dare il massimo al primo colpo.}
        {statoInchiostroPersonaggiaUno == Normale or statoInchiostroPersonaggiaUno == Medio: Mentor: Bel colpo! Ti sei {pronouns has him: guadagnato|{pronouns has her: guadagnata|guadagnatə}} subito una bella dose di inchiostro!}
        {statoInchiostroPersonaggiaUno == Altissimo: Mentor: Beh, hai dato allo spettro il suo dono preferito! Sei già {pronouns has him: pronto|{pronouns has her: pronta|prontə}} per questo incarico!}
        Mentor: Ora arriva la parte più complessa.
        Mentor: Puoi immaginare di dividere questa situazione in due fasi.
        Mentor: Nella prima, poni delle domande allo spettro, in modo da capire meglio cosa prova o pensa.
        Mentor: Tieni conto che dato che il tuo obiettivo è quello di convincerlo ad avere una visione di sé diversa, è più efficace se riesci a farlo riflettere sullo stesso tema o stato d'animo.
        Mentor: Metti ad esempio che è una persona insicura e rabbiosa: farla riflettere solo sulle sue insicurezze o sulla rabbia ti renderà poi la seconda parte più facile.
        Mentor: Ma non demoralizzarti se non è sempre chiaro: come per tutt3 noi, i pensieri di uno spettro sono cose complesse da articolare.
        Mentor: Poi arriva la seconda fase, quella che da il vero e proprio name al tuo ruolo.
            * [Il mio ruolo?]
            Mentor: Ah, già, ehm, dimenticavo.
            Mentor: Qui chiamiamo il tuo ruolo quello {pronouns has him: del <b>Riscrittore</b>|{pronouns has her: della <b>Riscrittora</b>|dellə <b>Riscrittorə</b>}}, perché aiuterai queste persone a riscrivere e rileggere il loro passato.
            Mentor: Sei un po' come la persona cara che ti aiuta a cambiare prospettiva quando tutto sembra impossibile.
            Mentor: O il film, il gioco, il libro che ti dà un po' di respiro quando il cervello è travolto dall'ansia.
            Mentor: E quando arriva questo momento di chiarezza, allora lo spettro può finalmente darsi un nuovo name.
            -
        Mentor: E così arriviamo alla seconda fase. Non farai più domande, ma affermazioni.
        Mentor: Affermazioni per guidare lo spettro a rileggere la sua storia.
        Mentor: Qui, più inchiostro avrai a disposizione più avrai a disposizioni delle "azioni forti": un modo per dire che hai più forza di coinvincimento.
        Mentor: Se sei {pronouns has him: riuscito|{pronouns has her: riuscita|riuscitə}} nella fase uno a farlo riflettere sullo stesso tema, ti sarà tutto più facile.
            * [E se fallisco?]
                Mentor: Se non c'è azione, non c'è fallimento, {name}.
                Mentor: Ma se non c'è azione, non c'è nemmeno la vita.
                Mentor: Il tuo compito qui è quello di aiutare lo spettro ad uscire dal suo stallo.
                Mentor: A volte i risultati potrebbero essere diversi da quelli che speravi, e ci sta.
                Mentor: Ma con una buona dose di ascolto ho la certezza che farai qualcosa di magnifico!
                    -> main
        
        
    === first_character_feedback
        Mentor: Beh, direi che è andata, {name}.
        {firstCharacterState:
            - IlSocievole: Mentor: Hai aiutato lo spettro a riscoprire la sua natura socievole!
            - IlConsapevole: Mentor: Ora lo spettro è capace di riconoscere la necessità della collaborazione!
            - IlGuarente: Mentor: Vedere le proprie ferite è il primo passo per accogliere le parti di noi che non amiamo.
            - IlTerrorizzato: Mentor: La sua paura è stata più forte della tua dedizione. Questo lavoro è più difficile di quanto sembri.
            - LAbbandonato: Mentor: Lo spettro si è ancorato alla sua paura della loneliness, ma son sicuro che tu hai imparato qualcosa di importante.
            - LArrabbiato: Mentor: La rabbia è una grande trasformatrice. Spero solo che il nostro spettro sappia cosa farne.
        }
        
        Mentor: Da adesso in avanti tenderò a spostarmi un poco: ho diverse cosine da fare in giro.
        Mentor: Ma vedrai che ci incontreremo spesso qui in giro.
        Mentor: E per ogni momento di confusione, ricordati che potrai chiedermi qualsiasi cosa.
        Mentor: A presto!
            ~ move_entity(Mentor, Greenhouse)
            -> main
       

/* ---------------------------------

   Tutorial

 ----------------------------------*/


=== tutorial
//Strutturare come wave sintetica?
    Mentor: Ecco i luoghi che puoi visitare in questo momento.
    Mentre: Su quali vorresti avere un po' di informazioni?
TODO: riordinare in base ai nuovi tier
-(top)
    + [Sulla fermata del bus.]
            Mentor: La fermata, ad est del Giardino, è il posto dove si trovano i vari spettri.
            Mentor: Non saranno tantissime, non ti preoccupare: ogni {pronouns has him: Riscrittore|{pronouns has her: Riscrittora|Riscrittorə}} si occupa di uno specifico giardino.
            Mentor: All'ingresso troverai diverse lapidi. Ognuna indica lo spettro che vi è contenuto e il name che si è dato prima di morire.
            Mentor: Alcune richiedono un po' di esperienza prima di interagirci, altre ti chiederanno di ascoltare subito la loro storia.
            Mentor: Ricorda che non puoi mai iniziare una riscrittura senza un dono.
            Mentor: I doni li trovi in giro camminando.
            Mentor: O puoi crearne tu di nuovi, come alle <b>Serre</b>.
            Mentor: Più il dono è vicino a quello che di cui ha bisogno lo spettro, più sarà facile convincerlo a riscrivere la sua versione di sé.
            Mentor: Dopo il dono ti verrà indicata la quantità di <b>inchiostro</b>: più è alto, più sarai capace di riscrivere la visione di sé che ha lo spettro.
            Mentor: E in alcuni casi, potresti scoprire qualcosa di speciale.
                -> top

    + [Sulle serre.]
            Mentor: La serra è un piccolo posto di meditazione.
            Mentor: Tu vai lì, ti guardi in giro.
            Mentor: E se non cresce nulla puoi provare a raccontare qualcosa e lasciare che poi cresca la pianta giusta.
            Mentor: Ci cresce di tutto: funghi, pianti, muschi e cose che non credo abbiano una vera classificazione fuori di qui.
            Mentor: Le cose crescono col loro tempo nelle serre.
            Mentor: E a volte svanisco, se non ci presti attenzione.
            Mentor: Merita andarci ogni tanto.
            -> top

    + [Sulla foresta.]
            Mentor: Quello è un po' il nostro posto di passaggio.
            Mentor: Prima era un bosco, ma a forza di camminare è rimasta solo l'erbetta.
            Mentor: E una bella panchina su cui rilassarsi quando il mondo va troppo di fretta.
            -> top

    + {firstStory == Ended}[Sulle falene.]
        Informazioni
            -> top
    + {firstStory == Ended}[Sul labirinto.]
        Informazioni
            -> top
    + {secondStory == Ended}[Sulle Laboratory.]
        Informazioni
            -> top
    + {secondStory == Ended}[Sulle sirene.]
        Informazioni
            -> top
    + {secondStory == Ended}[Sulla Libary.]
        Informazioni
            -> top
    + [Vorrei parlare di qualcosa di diverso.]
        -> speaking_with_mentor
    -

    -> speaking_with_mentor

=== to_do
        Mentor: Te la faccio breve: alla <b>fermata del bus</b> incontrerai degli <b>spettri</b>.
        Mentor: Sono totalmente innocui, l'unico problema è che non hanno trovato una soluzione a questioni rimaste aperte quando erano in vita.
        Mentor: Spesso sono storie di rimpianto o rimorso, in alcuni casi di traumi, o sensi di colpa.
        Mentor: E a volte hanno avuto una vita così bella che non accettano davvero di morire.
        Mentor: Sia quel che sia, sono fermi su quel ricordo, convinti che il passato sia il presente.
        Mentor: In tutte queste situazioni arrivi tu, {name}:
        Mentor: ascolti per bene quello che dicono,
        Mentor: fai loro un dono adeguato,
        Mentor: e poi aiuti questi spettri a rileggere un pezzo della loro storia, il pezzo che le blocca qui.
        Mentor: A darsi un nuovo name.
        Mentor: Qui chiamiamo il tuo ruolo quello {pronouns has him: del <b>Riscrittore</b>|{pronouns has her: della <b>Riscrittora</b>|dellə <b>Riscrittorə</b>}}, perché aiuterai queste persone a riscrivere e rileggere il loro passato.
        Mentor: Due cose importantissime: ci sono più strade per aiutare ogni spettro.
        Mentor: E non sempre puoi portare alla risoluzione che vorresti, e va bene così.
        Mentor: Il tuo obiettivo principale è aiutarli ad uscire dallo stallo in cui sono, il resto viene dopo.
            ->->
/* ---------------------------------

   Aiuto con le storie

 ----------------------------------*/
=== consigli_storie ===
{
    - firstStory == Active:
        -> consigli_storia_uno
    - secondStory == Active:
        -> consigli_storia_due
    - thirdStory == Active:
        -> consigli_storia_tre
    - fourthCharacterState == Active:
        -> consigli_storia_quattro
    - fifthStory == Active:
        -> consigli_storia_cinque
    - sixthStory == Active:
        -> consigli_storia_sei
    - seventhStory == Active:
        -> consigli_storia_sette 
}

=== consigli_storia_uno
{~ Consiglio storia uno|Consiglio storia uno|Consiglio storia uno}
    ->speaking_with_mentor

=== consigli_storia_due
Consiglio storia due
    ->speaking_with_mentor

=== consigli_storia_tre
Consiglio storia tre
    ->speaking_with_mentor

=== consigli_storia_quattro
Consiglio storia quattro
    ->speaking_with_mentor


=== consigli_storia_cinque
Consiglio storia cinque
    ->speaking_with_mentor


=== consigli_storia_sei
Consiglio storia sei
    ->speaking_with_mentor


=== consigli_storia_sette
Consiglio storia sette
    ->speaking_with_mentor



/* ---------------------------------

   Trigger Warning
       
//Variabili per tracciare i trigger warning
VAR alcoholism = false
VAR abuses = false
VAR mourning = false

 ----------------------------------*/
 
 === trigger_warning ===
    Mentor: Questi sono i principali temi delicati che potresti incontrare durante le tue chiacchierate.
    Mentor: Riuscirò per la maggior parte dei casi a fare in modo che tu non ne venga mai in contatto se li disabiliti, ma in alcune situazioni. come con gli spettri, le cose sono un po' complicate.
    Mentor: E sono consapevole che ne mancano diversi, ma qui è un lavoro complicato, sono l'unico mentore, ma sono sempre pronto ad accogliere ogni segnalazione.
    Mentor: Nel caso, prova ad evocare <i>dev</i>.

    - (top)
    Mentor: Cosa vorresti evitare?
    + {alcoholism == true}[Preferirei non leggere nulla che riguardi l'abuso di alcool.]
        Mentor: Capisco benissimo. Preferenza registrata.
        ~ alcoholism = false
            -> top
    + {alcoholism == false}[Ho cambiato idea: introducimi pure storie che parlano di abuso d'alcool.]
        Mentor: Ottimo. Preferenza registrata.
        ~ alcoholism = true
            -> top
        
  
    + {abuses == true}[Non voglio leggere storie su relazioni abusanti.]
        Mentor: Hai il mio appoggio. Preferenza registrata.
        ~ abuses = false
            -> top
    + {abuses == false}[Sai, forse mi va bene di affrontare storie che parlano di abuses relazionali.]
        Mentor: Perfetto. Preferenza registrata.
        ~ abuses = true
            -> top


    + {mourning == true} [Non me la sento di parlare di mourning.]
        Mentor: Sentiti a casa. Preferenza registrata.
        ~ mourning = false
            -> top
    + {mourning == false} [Ho cambiato idea: me la sento di parlare di mourning.]
        Mentor: Grandioso. Preferenza registrata.
        ~ mourning = true
            -> top
        
    + {loneliness == true} [Preferirei evitare storie di loneliness e abbandono.]
        Mentor: Preferenza registrata. E se butta male, sono qui.
        ~ loneliness = false
            -> top
    + {loneliness == false} [Sono {pronouns has him: pronto|{pronouns has her: pronta|prontə}} ad ascoltare storie di loneliness e abbandono.]
        Mentor: Preferenza registrata. E se butta male, puoi sempre cambiare idea.
        ~ loneliness = true
            -> top
            
    + [Sono a posto così.]
        ->->
    -  
 -> main