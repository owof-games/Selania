/* ---------------------------------

   Presentazioni

 ----------------------------------*/

=== presentazioni ===
    Che buffo, è da un po' che non incontravo una persona nuova.
    Immagino tu abbia un milione di domande, vero?
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
        * [Come me ne vado da qui?]
            {chiSei:Mentore|Sconosciuto}: Dipende.
            {chiSei:Mentore|Sconosciuto}: Se con "qui" intendi questa conversazione, di solito interrompere le chiacchierate è sempre possibile.
            {chiSei:Mentore|Sconosciuto}: Basta dire qualcosa tipo "me ne vado" o simili.
            {chiSei:Mentore|Sconosciuto}: Nei casi più estremi c'è chi dice "quit", che credo sia il verso di un uccellino.
            {chiSei:Mentore|Sconosciuto}: Spesso tornano comunque, e la cosa mi fa piacere.
            {chiSei:Mentore|Sconosciuto}: Per il resto: se sei qui è perché in qualche modo l'hai chiesto.
            {chiSei:Mentore|Sconosciuto}: Forse ancora non lo sapevi, ma non è un problema: Presto o tardi capirai il perché direi.
                -> top
        * [Naa, tutto chiaro] -> name
        * -> name
    
    = name    
        {chiSei:Mentore|Sconosciuto}:Ora tocca a me farti una domanda: come ti devo chiamare?
        {chiSei:Mentore|Sconosciuto}:Puoi usare qualsiasi nome: prendi questa occasione come un piccolo nuovo inizio.
            -> il_mio_nome ->
        {chiSei:Mentore|Sconosciuto}: E quali sono i pronomi in cui ti riconosci?
        {chiSei:Mentore|Sconosciuto}: Ti chiedo già scusa per la quantità ridotta di scelte.
        {chiSei:Mentore|Sconosciuto}: Da qualche parte un giorno ho trovato un testo firmato <i>dev</i> dove qualcuno piangeva nel cercare di "programmare scelte multiple attorno all'uso dei pronomi".
        {chiSei:Mentore|Sconosciuto}: Non ho ben compreso sinceramente, ma mai dire mai: magari in futuro qualche persona troverà una soluzione più efficace.
            -> assegnazione_genere ->
        {chiSei:Mentore|Sconosciuto}: piacere di conoscerti, {nome}.
        {chiSei:Mentore|Sconosciuto} E {pronomi has maschili: benvenuto|{pronomi has femminili: benvenuta|benvenutə}}. Spero ti troverai bene, qui.
        {not chiSei: Sconosciuto: Ah, che sbadato. Invece tu chiamami <b>Mentore</b>.|Mentore: Forse ne va un po' del mio orgoglio.}
        {not chiSei: Mentore: Forse un po' didascalica come scelta, ma ti assicuro che è molto comoda.|Mentore: Ma se qualcosa non va, non farti problemi a dirmelo.}
        Mentore: Ma che sbadato, non ti ho detto cosa devi fare qui!
            * [Devo?]
            * [Ok, hai la mia attenzione]
            * [Mmm, dimmelo dopo, capo]
                Mentore: Bene, abbiamo una persona intrapprendente qui!
                Mentore: Ricorda comunque che se ti senti {pronomi has maschili: confuso|{pronomi has femminili: confusa|confusə}} puoi sempre cercarmi e farmi tutte le domande che vuoi.
                    -> riscrittora            
            -
        Mentore: Te la faccio breve: nel <b>Mausoleo</b> incontrerai degli <b>spettri</b>.
        Mentore: Sono totalmente innocue, l'unico problema è che non hanno trovato una soluzione a questioni rimaste aperte quando erano in vita.
        Mentore: Spesso sono storie di rimpianto o rimorso, in alcuni causi di traumi, o sensi di colpa.
        Mentore: E a volte hanno avuto una vita così bella che non accettano davvero di morire.
        Mentore: In tutte queste situazioni arrivi tu, {nome}:
        Mentore: ascolti per bene quello che dicono,
        Mentore: fai loro un dono adeguato,
        Mentore: e poi aiuti questi spettri a rileggere un pezzo della loro storia, il pezzo che le blocca qui.
        Mentore: A darsi un nuovo nome.

            - (top2)
            * [Tipo gasligthing?]
                Mentore: No no no assolutamente no.
                Mentore: Anche perché uno spettro preso in giro è uno spettro che diventa davvero, davvero, davvero fastidiosa.
                    -> top2
            * [Così, senza conoscere questo spettro?]
                Mentore: A volte è più facile dare consigli a persone sconosciute.
                Mentore: E mentre riflettiamo sulle loro difficoltà, impariamo anche qualcosa su di noi.
                Mentore: E poi... no, questo te lo dirò tra qualche tempo.
                    -> top2
            * [Un dono?]
                Mentore: Esatto.
                Mentore: Gli spettri tendono ad essere un po' chiusi.
                Mentore: Ma se fai il giusto dono, se capisci di cosa possono aver bisogno quando ti raccontano la loro storia, puoi aprirti una strada verso il loro cuoricino.
                        {
                            - doniTrovati hasnt BrinaDellImpossibile: Mentore: E a proposito: eccoti un po' di Brina dell'Impossibile. Son sicuro che ti servirà a breve.
                                <i>Le linee della tua mano si fanno trasparenti. Il vento le attraversa, eppure le dita funzionano correttamente e non senti dolore</i>
                                ~ doniTrovati += BrinaDellImpossibile
                        }   
                Mentore: Molti doni li troverai man mano spostandoti tra questi luoghi.
                Mentore: E alcune delle piante della serra possono essere donate.
                Mentore: E poi ci sono decine di altre cose, ma te ne parlerò quando vorrai.
                    -> top2
            * [Ascolto. Dono. Risolvo. Chiaro]
                Mentore: Mi fido di te, {nome}.
                    -> riscrittora
            *-> riscrittora        
             
    
    = riscrittora
        Mentore: Giusto per chiarirci per bene sul perché sei qui.
        Mentore: Non so se ti capita che ti fissi su una cosa perché magari l'ansia o le insicurezze ti mandano nel pallone.
        Mentore: E quella cosa non è per nulla male, ma il tuo cervello proprio non lo vuole capire.
        Mentore: E poi arriva una persona amica, o un libro, una canzone, un videogioco, un film, e a un certo punto torni a vedere le cose da una prospettiva più serena.
        Mentore: Ecco, tu farai qualcosa del genere.
        Mentore: Qui chiamiamo il tuo ruolo quello {pronomi has maschili: del <b>Riscrittore</b>|{pronomi has femminili: della <b>Riscrittora</b>|dellə <b>Riscrittorə</b>}}, perché aiuterai queste persone a riscrivere e rileggere il loro passato.
        Mentore: Due cose importantissime: ci sono più strade per aiutare ogni spettro.
        Mentore: E non sempre puoi dare a tutti la risoluzione che spereresti, e va bene così.
        Mentore: Il tuo compito è aiutarli ad uscire dallo stallo in cui sono.
        Mentore: Il mio invece è di occuparmi anche del tuo benessere, e quindi devo dirti un'altra cosa.
            -> trigger


    = trigger    
        Mentore: Nel tuo soggiorno in questo luogo potrebbe accadere che incontrerai qualche situazione complessa.
        Mentore: Non posso prometterti di avere il controllo su tutto, perché in fondo sono il Mentore, non <i>dev</i>.
        Mentore: Ma se ti va puoi dirmi quali sono le cose che ti creano disagio, e farò del mio meglio per non fartele incontrare.
        Mentore: Ci sono temi che vuoi evitare?
            * [Sì]
                -> trigger_warning ->
            * [Ci penso un poco]
                Mentore: Per questa come per altre cose, puoi sempre farmi le domande che vuoi quando mi incontri in giro.
            -
        Mentore: Un'ultima cosa, prima di lasciarti andare.
        Mentore: Questo posto è più grande di quello che possa sembrare.
        Mentore: Vuoi che ti dia qualche informazione in merito?
        Mentore: O preferisci scoprire tutto da {pronomi has maschili: solo|{pronomi has femminili: sola|solə}}?
            * [Raccontami tutto, Mentore!]
                -> tutorial
            * [Naa, preferisco fare le cose di testa mia]
                Mentore: Ottimo direi.
                Mentore: Ricorda che puoi comunque farmi tutte le domande che vuoi in qualsiasi momento.
                Mentore: E quindi: buona riscrittura, {nome}!
            -
    -> main

/* ---------------------------------

   Tutorial

 ----------------------------------*/


=== tutorial
//Strutturare come wave sintetica?
    Mentore: Ecco i luoghi che puoi visitare in questo momento.
    Mentre: Su quali vorresti avere un po' di informazioni?

-(top)
    + [Sul mausoleo]
            Mentore: Il Mausoleo, ad est del Giardino, è il posto dove si trovano i vari spettri.
            Mentore: Non saranno tantissime, non ti preoccupare: ogni {pronomi has maschili: Riscrittore|{pronomi has femminili: Riscrittora|Riscrittorə}} si occupa di uno specifico mausoleo.
            Mentore: All'ingresso troverai diverse lapidi. Ognuna indica lo spettro che vi è contenuto e il nome che si è dato prima di morire.
            Mentore: Alcune richiedono un po' di esperienza prima di interagirci, altre ti chiederanno di ascoltare subito la loro storia.
            Mentore: Ricorda che non puoi mai iniziare una riscrittura senza un dono.
            Mentore: I doni li trovi in giro camminando, col tempo imparerai anche che alcuni luoghi hanno doni specifici.
            Mentore: O possono aiutarti a crearne tu, di nuovi, come le <b>Serre</b>.
                {
                - doniTrovati hasnt BrinaDellImpossibile: Mentore: E a proposito di doni: tieni questo pezzettino di Brina dell'Impossibile. Potrebbe tornarti utile.
                <i>Le linee della tua mano si fanno trasparenti. Il vento le attraversa, eppure le dita funzionano correttamente e non senti dolore</i>
                ~ doniTrovati += BrinaDellImpossibile
                }
            Mentore: Più il dono è vicino a quello che di cui ha bisogno lo spettro, più sarà facile convincerlo a riscrivere la sua versione di sé.
            Mentore: Dopo il dono ti verrà indicata la quantità di <b>inchiostro</b> (non fare domande, è roba stranda del <i>dev</i>): più è alto, più sarai capace di riscrivere la visione di sé che ha lo spettro.
            Mentore: E in alcuni casi, potresti scoprire qualcosa di speciale.
                -> top

    + [Sulle serre]
            Mentore: La serra è un piccolo posto di meditazione.
            Mentore: Tu vai lì, ti guardi in giro.
            Mentore: E se non cresce nulla puoi provare a raccontare qualcosa e lasciare che poi cresca la pianta giusta.
            Mentore: Ci cresce di tutto: funghi, pianti, muschi e cose che non credo abbiano una vera classificazione fuori di qui.
                {
                - doniTrovati hasnt BrinaDellImpossibile: Mentore: Tipo questo pezzettino di Brina dell'Impossibile, che potrebbe piacere a qualche spettro.
                    <i>Le linee della tua mano si fanno trasparenti. Il vento le attraversa, eppure le dita funzionano correttamente e non senti dolore</i>    
                ~ doniTrovati += BrinaDellImpossibile
                }
            Mentore: Le cose crescono col loro tempo, nelle serre.
            Mentore: E a volte svanisco, se non ci presti attenzione.
            Mentore: Merita andarci ogni tanto.
            -> top

    + [Sul giardino]
            Mentore: Quello è un po' il nostro posto di passaggio.
            Mentore: Prima era un bosco, ma a forza di camminare è rimasta solo l'erbetta.
            Mentore: E una bella panchina su cui rilassarsi quando il mondo va troppo di fretta.
            -> top

    + {storiaUno == Conclusa}[Sulle falene]
        Informazioni
            -> top
    + {storiaUno == Conclusa}[Sul labirinto]
        Informazioni
            -> top
    + {storiaDue == Conclusa}[Sulle tisane]
        Informazioni
            -> top
    + {storiaDue == Conclusa}[Sulle sirene]
        Informazioni
            -> top
    + {storiaDue == Conclusa}[Sulla biblioteca]
        Informazioni
            -> top
    + [Ho cambiato idea]
        -> parlareColMentore
    -

    -> parlareColMentore

=== compito
        Mentore: Te la faccio breve: nel <b>Mausoleo</b> incontrerai degli <b>spettri</b>.
        Mentore: Sono totalmente innocue, l'unico problema è che non hanno trovato una soluzione a questioni rimaste aperte quando erano in vita.
        Mentore: Spesso sono storie di rimpianto o rimorso, in alcuni causi di traumi, o sensi di colpa.
        Mentore: E a volte hanno avuto una vita così bella che non accettano davvero di morire.
        Mentore: In tutte queste situazioni arrivi tu, {nome}:
        Mentore: ascolti per bene quello che dicono,
        Mentore: fai loro un dono adeguato,
        Mentore: e poi aiuti questi spettri a rileggere un pezzo della loro storia, il pezzo che le blocca qui.
        Mentore: A darsi un nuovo nome.
        Mentore: Giusto per chiarirci per bene sul perché sei qui.
        Mentore: Non so se ti capita che ti fissi su una cosa perché magari l'ansia o le insicurezze ti mandano nel pallone.
        Mentore: E quella cosa non è per nulla male, ma il tuo cervello proprio non lo vuole capire.
        Mentore: E poi arriva una persona amica, o un libro, una canzone, un videogioco, un film, e a un certo punto torni a vedere le cose da una prospettiva più serena.
        Mentore: Ecco, tu farai qualcosa del genere.
        Mentore: Qui chiamiamo il tuo ruolo quello {pronomi has maschili: del <b>Riscrittore</b>|{pronomi has femminili: della <b>Riscrittora</b>|dellə <b>Riscrittorə</b>}}, perché aiuterai queste persone a riscrivere e rileggere il loro passato.
        Mentore: Due cose importantissime: ci sono più strade per aiutare ogni spettro.
        Mentore: E non sempre puoi dare a tutti la risoluzione che spereresti, e va bene così.
        Mentore: Il tuo compito è aiutarli ad uscire dallo stallo in cui sono.    
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
    Mentore: Qui sono i principali temi delicati che potresti incontrare durante il tuo lavoro.
    Mentore: Riuscirò per la maggior parte dei casi a fare in modo che tu non ne venga mai in contatto se li disabiliti, ma in alcune situazioni (vedi spettri) le cose sono un po' complicate.
    Mentore: E sono consapevole che ne mancano diversi, ma qui è un lavoro complicato, come unico mentore, ma sono pronto ad accogliere ogni segnalazione.
    Mentore: Nel caso, prova ad evocare <i>dev</i>.

    - (top)
    + [Preferirei non leggere nulla che riguardi l'abuso di alcool]
        Mentore: Capisco benissimo. Preferenza registrata.
        ~ alcolismo = false
         + + [C'è altro che vorrei evitare]
            -> top
         + + [Sono a posto così]
            -> parlareColMentore
         - -   
    + [Non voglio leggere storie su relazioni abusanti]
        Mentore: Hai il mio appoggio. Preferenza registrata.
        ~ abusi = false
         + + [C'è altro che vorrei evitare]
            -> top
         + + [Sono a posto così]
            -> parlareColMentore
         - -  
    + [Non me la sento di parlare di lutto]
        Mentore: Sentiti a casa. Preferenza registrata.
        ~ lutto = false
         + + [C'è altro che vorrei evitare]
            -> top
         + + [Sono a posto così]
            -> parlareColMentore
         - -          
    + [Preferirei evitare storie di solitudine e abbandono]
        Mentore: Preferenza registrata. E se butta male, sono qui.
        ~ solitudine = false
         + + [C'è altro che vorrei evitare]
            -> top
         + + [Sono a posto così]
            -> parlareColMentore
         - -          
    + [Sono a posto così]
    ->parlareColMentore
    -  
 -> main