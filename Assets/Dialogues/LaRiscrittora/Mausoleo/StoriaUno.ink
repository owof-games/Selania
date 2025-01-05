=== lapide_uno ===
    //opzione se non hai mai esplorato questa storia, e se non ci sono storie attive
    + {are_two_entities_together(LapideUno, PG) && not (storiaUno == InCorso or storiaUno == Conclusa) and not (storiaDue == InCorso or storiaTre == InCorso)}[LapideUno]
        <i>Qui attende {traduttoreSpettri(effettivoStatoSpettroUno)}.</i>
            -> intro_storia_uno

    //opzione se c'è un'altra storia attiva
    + {are_two_entities_together(LapideUno, PG) && storiaUno == Conclusa} [LapideUno]
        <i>Qui riposa {traduttoreSpettri(effettivoStatoSpettroUno)}.</i>
            -> main

    //opzione se questa storia è attiva
    + {are_two_entities_together(SpettroUno, PG) && storiaUno == InCorso} [SpettroUno]
    <i>{traduttoreSpettri(effettivoStatoSpettroUno)} ondeggia inquieto accanto alla sua lapide.</i>
        -> doni_storia_uno

    + ->

    -> main

=== intro_storia_uno ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione
    //In questo primo step quello che succede è che verifichiamo se ci sono trigger problematici per la giocatrice. Le permettiamo di scegliere se andare o meno avanti, e poi abbiamo la presentazione della storia.
    {
    - presentazioni == 0:
        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Non penso tu voglia parlare davvero con me.
        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ma anche fosse, prima parla col mentore.
        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Lo riconosci perché assomiglia a una lampada.
        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Sicuro ha qualcosa da dire a una persona appena arrivata.
            -> main
    }
    
    
    ~ storiaUno = InCorso
    {
    - solitudine == false:
        -> trigger_solitudine

    }
    <i>Vuoi ascoltare la sua storia?</i>
        + [Sì.]
            -> intro
        + [No.]
            -> main
    ->->

        = trigger_solitudine
            <i>Hai segnalato che preferiresti non sentire storie riguardanti la <b>solitudine</b>, che è uno dei temi di questo spettro.
            <i>Puoi decidere se continuare comunque, o saltare la sua storia.</i>
            <i>Nel secondo caso, potrai (in modo un po' arbitrario) aiutarlo a riscrivere il suo nome.</i>
                * [Voglio comunque ascoltare la sua storia.]
                    -> intro
                * [Salto.]
                    -> scelta_nome_uno
                -
                ->->

        = intro
            {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Vigilia di Natale.
            {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Per la prima volta da mesi ho tempo libero: non sto lavorando, non sto correndo da nessuna parte.
            {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Cammino lentamente col cane, andando a una cena con amici.
            {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Eppure, non riesco a liberarmi di questo enorme senso di vuoto.
            {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Mi prende la pancia con dita lunghe e fredde, mi fa pensare cose che non voglio pensare, più fredde della brina che già ricopre le strade.
            {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ho bisogno di parlare con qualcuno: non sento mamma da settimane, e poi ci sono messaggi, audio, meme che attendono risposte da tempi imbarazzanti.
            {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Mentre aspetto il bus provo a pensare con chi potrei confidarmi.
            {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Mando un audio a Lele, che mi risponde raccontandomi i suoi drammi.
            {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ascolto un vocale di Cate, ma man mano che la sua voce dal passato mi consola per le rotture di lavoro mi passa il coraggio di condividere qualcosa di più pesante.
            {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Cazzo quanto sono pesante. Rispondo con delle cazzate.
            {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Provo a scrivere a Sandro, ma poi il testo cambia perché messe a parole quelle cose non sono esattamente così, non hanno la voce giusta.
            {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: L’unica cosa che vorrei fare è gridare, gridare, gridare.
            {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E poi dai, ognuno c’ha i suoi cazzi.
            {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Continuo a pensare alla cena in arrivo, al dover far finta che tutto vada bene.
            {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ridere alle battute, dire cose come "Ma dai!" e "Non ci credo!".
            {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: L’autobus arriva, lo lascio passare.
            {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Il vuoto mi trascina in giro per il paese, il suo gelo mi schiaccia lo stomaco, mi fa esplodere il cuore.
            {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Il cellulare inizia a vibrare. Non ce la posso fare, non ce la posso fare.
            {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Torno a casa, disattivo il telefono, e mi rimetto a lavorare.
                ~ move_entity(SpettroUno, Mausoleo)
                ~ move_entity(LapideUno, CasettaAnime)
                -> main


=== doni_storia_uno ===
//Qui è la fase di check per i doni, se donarne, quali, o non farlo.
    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Tutto sommato è una cosa così banale, così banale. Eppure questo freddo non se ne vuole andare.
        + {doniTrovati != ()} [Ho un dono per lo spettro.]
            -> gestione_inventario
        + [Mi allontano.]
            -> main
        -
            -> main


=== storia_uno
//Una volta che abbiamo fatto il dono, parte la vera e propria storia.
    = capitolo_uno
        //Informativa sullo stato dell'inchiostro.
        <i>Dopo il tuo dono, la quantità di inchiostro a disposizione è {statoInchiostroSpettroUno}.</i>
            -> azioniInchiostro ->
            -> primo_blocco


    = primo_blocco
        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Sei {pronomi has maschili: tornato|{pronomi has femminili: tornata|tornatə}}, non me l'aspettavo.
        C'è qualcosa che vorrei chiederti:
            * (vuoto) [Ti è capitato di sentire altre volte questo vuoto?]
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Forse.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: <b>Ricordo</b>...
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Mi manca l'aria, scusa.
                ~ terrore ++

            * (lavoro) [Il tuo lavoro ti faceva stare bene?]
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Sì.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Il problema è che non conoscevo mai il limite.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E c'era questa sensazione, questa preoccupazione di essere sempre in ritardo su qualcosa.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Era davvero difficile riposarsi, sai? Staccare un po'.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E a quel punto il piacere spariva, e rimaneva solo il <b>dovere</b>.
                ~ rabbia ++

            * (amici) [I tuoi amici ti raccontano i loro problemi?]
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: A volte.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ma ultimamente sempre meno.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Non so se perché le cose andavano meglio.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Se perché ero troppo assente.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: O solo perché alla fin fine sono sempre le solite cose noiose che accadono <b>a tutti.</b>
                ~ abbandono ++
            -
            -> secondo_blocco

    = secondo_blocco
            * [Prima hai detto che ci sono cose a cui non volevi pensare.]
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Sì.

                * * (racconto)[E ti andrebbe di raccontarmele?]
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: No.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Non perché non mi fidi di te.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ma perché fintanto che le cose non escono dalla testa, allora non sono vere, no?
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E io non voglio che divengano vere.
                        ~ terrore ++

                * * (capita)[Capita anche a me, sai?]
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Vedi, è come con Lele.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Queste cose mi ricordano che quello che provo è comune.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Banale.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Stupido io che lascio che mi facciano così male.
                    ~ abbandono ++

                * * (testa) [A volte la nostra testa sembra volerci fare solo del male.]
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Già.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: È come avere un nemico in testa.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Qualcosa che non puoi schiacciare.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Che ti comanda e non ti lascia respirare.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E che mi fa incazzare.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: È terribilmente frustrante.
                    ~ rabbia ++

            * (vuoto2) {vuoto} [Non ti scusare. Però forse questo ricordo è importante.]
                ~ terrore ++
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Il vuoto, questo gelo.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Credo che in realtà ci sia sempre.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Compariva quando ero piccolo, quando i miei litigavano.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: A scuola, se rimanevo da solo.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Alle cene di lavoro, quando non avevo niente da raccontare.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ci sono un po' di modi per disturbarlo, sfiancarlo, ma come mi rilasso, è pronto a bussare.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Mi insegue nei sogni, non mi lascia respirare.

            * (lavoro2) {lavoro} [Perché quando il lavoro diventa un dovere, non prendi una pausa?]
                ~ rabbia ++
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Pensi non ci abbia provato?!?
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Scusa.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ma non hai idea della frustrazione.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ci ho messo una vita per vivere di ciò che amavo fare.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E quando questo è successo, non avevo più uno spazio di sfogo.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Un posto dove respirare.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: A volte finisco per litigare solo per il piacere di litigare.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Per gridare.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Per far sì che accada qualcosa.


            * (amici2) {amici} [Anche se accadono a tutti, non è che non sono importanti per te.]
                ~ abbandono ++
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ma il punto non è quello.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: È che poi le persone si annoiano.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Con tutti i casini, chi ha davvero voglia di ascoltare le para di qualcun altro.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E poi, alle persone non piace la fragilità.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: La fragilità è sorella del bisogno, e le persone bisognose...
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Lascia fare.



            * [Quando hai deciso di non andare alla cena...]
                * * (verità) [Perché non hai detto la verità ai tuoi amici?]
                    ~ terrore ++
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Perché qualcuno avrebbe voluto aiutare.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Chiamare.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Salire a casa e fare qualcosa, risolvere qualcosa assieme.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ma io non so come fare, non ho idea di come reagire a queste cose.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E il Vuoto allora mi dice che sono in debito.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Che devo essere riconoscente.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ma per esserlo devo ascoltare, devo prestare davvero attenzione.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Fare meno cose, quando l'unica certezza che ho è che il Vuoto è silenzioso solo se continuo a lavorare.

                * * [Non hai pensato ai loro sentimenti?]
                    ~ abbandono ++
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Beh, gli ho fatto un favore.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Già sanno che sono inaffidabile, che non rispondo alle chiamate, che arrivo dopo settimane a scrivere un messaggio.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Almeno così hanno avuto la conferma che sono dimenticabile.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ignorabile.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E la prossima volta faranno senza di me.


                * * [Non ti sei fatto solo del male da solo?]
                    ~ rabbia ++
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Probabile.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ma meglio così che rovinare la festa a tutti, no?
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Chi ha voglia di starsene a tavola con un fantasma piagnone?
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Con un fallimento sociale?
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Io no.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Non ho nemmeno voglia di restare con me.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Non capisco perché ci stia tu, quì.

            -

                    -> terzo_blocco

    = terzo_blocco
        C'è una cosa ancora che vorrei chiederti, che vorrei capire.
        //Questa cosa ci permette di capire qual è lo stato d'animo emergente.

            * [Perché proprio questo ricordo?]
                Perché è questa la cosa che continua a bloccarti qui?
                {
                - rabbia > abbandono && rabbia > terrore:
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Perché ora l'unica cosa che rimane è la <b>rabbia</b>, la furia.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E non so, non ricordo se l'ho mai rivolta contro qualcuno a cui tengo.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Perché a volte questo vuoto fa così male, che vorrei distruggere tutto.

                - abbandono > rabbia && abbandono > terrore:
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Perché mi sono sentito così vuoto, così solo, così dimenticato.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E quel vuoto è come un buco nero.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E non conta cosa è accaduto prima, cosa è venuto dopo.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: So solo che presto o tardi verrò <b>abbandonato</b>.

                - terrore > rabbia && terrore > abbandono:
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Perché avrei voluto parlare del vuoto.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ma il vuoto è come un vortice che prende e travolge tutto.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E l'unica cosa che rimane è il <b>terrore</b> di cosa possa esserci dopo il vuoto.

                - else:
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Perché racconta qualcosa di chi ero.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Di chi sono stato.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E di chi poi sono diventato.
                }
                    -> riscrittora_storia_uno


=== riscrittora_storia_uno
        Sai, io sono qui per aiutarti a rileggere la tua storia.
        E forse ci sono dei modi diversi di guardare a quello che ti è accaduto.

        //Più abbiamo preso un certo topic di petto, più veniamo premiate? E quindi un punteggio alto in realtà favorisce una certa lettura di sè?
        //Ma se non abbiamo toccato un sentimento, una paura, non abbiamo modo di rileggere quella cosa in quel modo, e allora possiamo solo confermare lo status quo.
        //Arrivo qui con un massimo di 3 punti su un elemento
        Il vuoto...
        //Mettere qualcosa per far riconoscere che una scelta usa inchiostro e l'altra no.
            - (top1)
                * {rabbia > 0} [La tua rabbia..]
                        {check_statusVsInchiostro(rabbia, statoInchiostroSpettroUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top1
                        }
                        Dici cose sulla rabbia.
                            ~ statoInchiostroSpettroUno --
                            ~ ferito ++
                * {abbandono > 0} [rilettura abbandono]
                        {check_statusVsInchiostro(abbandono,statoInchiostroSpettroUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta</i>
                                -> top1
                        }
                        Dici cose sull'abbandono.
                            ~ statoInchiostroSpettroUno --
                            ~ socievole ++
                * {terrore > 0} [Ti sta indicando le cose che ti fanno paura.]
                        {check_statusVsInchiostro(terrore,statoInchiostroSpettroUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top1
                        }
                        {storia_uno.secondo_blocco.racconto: Non è vero che se racconti ciò che hai in testa, diventa vero.}
                        {storia_uno.secondo_blocco.vuoto2: A scuola, coi genitori, a lavoro: sono situazioni che possono diventare davvero pesanti.}
                        {storia_uno.secondo_blocco.verità: Nel mondo in cui viviamo, fatto di numeri e bilanci, è normale pensare che se qualcuno ci aiuta, allora siamo in debito.}
                        Il vuoto è un segnale, non è un problema da risolvere.
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: ...
                            ~ statoInchiostroSpettroUno --
                            ~ consapevole ++
                * {rabbia == 0}[conferma rabbia]
                * {abbandono == 0}[conferma abbandono]
                * {terrore == 0}[È la tua paura.]
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Quindi sono persino un codardo?
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Beh, dirlo ad alta voce un po' mi consola.
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Almeno so chi sono.


                -
        E per questo...
            - (top2)
                *  {rabbia > 0} [La tua rabbia]
                        {check_statusVsInchiostro(rabbia, statoInchiostroSpettroUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top2
                        }
                        Dici cose sulla rabbia.
                            ~ statoInchiostroSpettroUno --
                            ~ ferito ++
                *  {abbandono > 0} [rilettura abbandono]
                        {check_statusVsInchiostro(abbandono, statoInchiostroSpettroUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top2
                        }
                        Dici cose sull'abbandono.
                            ~ statoInchiostroSpettroUno --
                            ~ socievole ++
                *  {terrore > 0} [Anche se fa paura, aprirsi è la soluzione.]
                        {check_statusVsInchiostro(terrore, statoInchiostroSpettroUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top2
                        }
                        {storia_uno.secondo_blocco.racconto: Raccontare ciò che hai in testa, condividerlo, ti permette di smontarlo.}
                        {storia_uno.secondo_blocco.vuoto2: Quando sei in compagnia e la situazione è difficile, può essere utile avere una persona alleata al tuo fianco.}
                        {storia_uno.secondo_blocco.verità: È importante ricordarti che le persone che ti vogliono bene ti aiutano perché gli va, non perché devono.}
                        Non siamo fatti per affrontare il mondo da soli, e va bene così.
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: ...
                            ~ statoInchiostroSpettroUno --
                            ~ consapevole ++
                *  {rabbia == 0}[conferma rabbia]
                *  {abbandono == 0}[conferma abbandono]
                *  {terrore == 0}[Il vuoto forse è qualcosa da accogliere.]
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Trasformarmi nel vuoto.
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Sparire.
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: L'eco di una persona.                                                            
                -
        
        La tua storia...
            - (top3)
                *  {rabbia > 0} [La tua rabbia]
                        {check_statusVsInchiostro(rabbia, statoInchiostroSpettroUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top3
                        }
                        Dici cose sulla rabbia.
                            ~ statoInchiostroSpettroUno --
                            ~ ferito ++
                *  {abbandono > 0} [rilettura abbandono]
                        {check_statusVsInchiostro(abbandono, statoInchiostroSpettroUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top3
                        }
                        Dici cose sull'abbandono.
                            ~ statoInchiostroSpettroUno --
                            ~ socievole ++
                *  {terrore > 0} [È quella di qualcuno che accoglie le sue paure.]
                        {check_statusVsInchiostro(terrore, statoInchiostroSpettroUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top3
                        }
                        Che vede il mondo, i rapporti, e ne comprende le complessità.
                        Una vedetta consapevole.
                        Sola, la vedetta è spaventata, terrorizzata.
                        Ma assieme alle altre persone diventa parte di una rete, di una conversazione capace di trasformare ciò che non va.
                            ~ statoInchiostroSpettroUno --
                            ~ consapevole ++
                *  {rabbia == 0} [conferma rabbia]
                *  {abbandono == 0} [conferma abbandono]
                *  {terrore == 0} [È una storia di paura.]
                        E la paura non è una colpa.
                        Il mondo è un gran casino, ci sta sentirsi costantemente in allarme.
                -
                    -> chi_sono_storia_uno

=== chi_sono_storia_uno

        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: quindi io sono <>
        {
            - rabbia > abbandono:
            {
                - rabbia > terrore:
                {
                    - rabbia > ferito: l'Arrabbiato.
                        ~ effettivoStatoSpettroUno = LArrabbiato
                    - else:  il Guarente.
                         ~ effettivoStatoSpettroUno = IlGuarente
                }
                - else:
                {
                    - terrore > consapevole: il Terrorizzato.
                         ~ effettivoStatoSpettroUno = IlTerrorizzato
                    - else: il Consapevole.
                         ~ effettivoStatoSpettroUno = IlConsapevole
                }
            }
            - abbandono > terrore:
                {
                    - terrore > consapevole: il Terrorizzato.
                         ~ effettivoStatoSpettroUno = IlTerrorizzato
                    - else: il Consapevole.
                         ~ effettivoStatoSpettroUno = IlConsapevole
                }
            - else:
                {
                    - abbandono > socievole: l'abbandonato.
                         ~ effettivoStatoSpettroUno = LAbbandonato
                    - else: il Socievole.
                         ~ effettivoStatoSpettroUno = IlSocievole
                }                    
        }

        {effettivoStatoSpettroUno:
            - IlSocievole: {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ora so che ho bisogno delle altre persone, anche quando la cosa mi fa paura.
            - IlConsapevole: {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Vedo i dolori del mondo e capisco che sono prodotti di quel sistema. Unendomi alle altre persone, posso cambiare un po' di cose.
            - IlGuarente: {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}:La mia rabbia mi ha aiutato a capire dove si trovano le mie ferite, e ora so cosa affrontare.
            - IlTerrorizzato: {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}:Quello che ho dentro è mostruoso, deve rimanere nascosto dagli altri, a qualunque costo.
            - LAbbandonato: {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}:Le mie debolezze allontaneranno sempre gli altri. L'unica soluzione è giocare d'anticipo, e far tutto da solo.
            - LArrabbiato: {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}:Se questo mondo mi fa male, è mio diritto far male a questo mondo, mordere prima che lui mi morda.
        }
        -
        {
            - eventoSpecialeSpettroUno == true:
                -> evento_speciale
            - else:
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E ora posso andarmene in pace.
                ~ storiaUno = Conclusa
                ~ move_entity(SpettroUno, CasettaAnime)
                ~ move_entity(LapideUno, Mausoleo)
                    -> main
        }

    = evento_speciale
        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ma visto che mi hai fatto un dono speciale, voglio condividere con te una cosa che ho imparato.
        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E ora, me ne vado.
        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Addio.
            ~ storiaUno = Conclusa
            ~ move_entity(SpettroUno, CasettaAnime)
            ~ move_entity(LapideUno, Mausoleo)
                -> main

=== scelta_nome_uno
    * Il Socievole.
         ~ effettivoStatoSpettroUno = IlSocievole
    * Il Consapevole.
         ~ effettivoStatoSpettroUno = IlConsapevole
    * Il Ferito.
         ~ effettivoStatoSpettroUno = IlGuarente
    -
    ~ storiaUno = Conclusa
    -> main