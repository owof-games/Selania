=== lapide_uno ===
    //opzione se non hai mai esplorato questa storia e se non ci sono storie attive
    + {are_two_entities_together(LapideUno, PG) && not (storiaUno == InCorso or storiaUno == Conclusa) and not (storiaDue == InCorso or storiaTre == InCorso)}[LapideUno]
        <i>Qui attende {traduttoreSpettri(effettivoStatoSpettroUno)}.</i>
            -> intro_storia_uno

    //opzione se ho finito la storia dello spettro uno
    + {are_two_entities_together(LapideUno, PG) && storiaUno == Conclusa} [LapideUno]
        <i>Qui riposa {traduttoreSpettri(effettivoStatoSpettroUno)}.</i>
            -> main

    //opzione se questa storia è attiva e non ho fatto un dono
    + {are_two_entities_together(SpettroUno, PG) && storiaUno == InCorso && not storia_uno.capitolo_uno} [SpettroUno]
    <i>{traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)} ondeggia inquieto accanto alla sua lapide.</i>
        -> doni_storia_uno

      //opzione se questa storia è attiva e ho fatto un dono ma non ho fatto lo step Mentore "domande e obiettivo"
    + {are_two_entities_together(SpettroUno, PG) && storiaUno == InCorso && storia_uno.capitolo_uno && not domande_e_obiettivo} [SpettroUno]
    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Mi sa che il mentore vuole dirti qualcosa prima che continuiamo.
        -> main
    
    //Ho finito tutti e tre i pezzi di tutorial (intr, dono_e_inchiostro, domande_e_obbiettivo) e posso finalmente aiutare lo spettro
    + {are_two_entities_together(SpettroUno, PG) && storiaUno == InCorso && storia_uno.capitolo_uno && domande_e_obiettivo} [SpettroUno]
        -> storia_uno.primo_blocco   

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
    
    
    {
    - solitudine == false:
        -> trigger_solitudine

    }
    <i>{traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)} ti osserva malinconico.</i>
        + [Raccontami la tua storia.]
            -> intro
        + [Torno tra poco.]
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
            ~ storiaUno = InCorso
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
{
    - not dono_e_inchiostro: {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Credo che il Mentore prima voglia parlarti.
        -> main
    - else:
        -> internal_inventario
}

= internal_inventario
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
//Faccio il dono, ho un feedback, esco così da parlare con il Mentore.
            -> azioniInchiostro -> main
            //-> primo_blocco


    = primo_blocco
        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Sei {pronomi has maschili: tornato|{pronomi has femminili: tornata|tornatə}}, non me l'aspettavo.
        {nome}: C'è qualcosa che vorrei chiederti:
            * (vuoto) [Ti è capitato di sentire altre volte questo vuoto?]
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Forse.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: <b>Ricordo</b>...
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Mi manca l'aria, scusa.
                ~ terrore ++

            * (lavoro) [Il tuo lavoro ti fa stare bene?]
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Sì.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Il problema è che non conosco mai il limite.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E c'era questa sensazione, questa preoccupazione di essere sempre in ritardo su qualcosa.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: È davvero difficile riposarsi, sai? Staccare un po'.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E intanto il piacere sparisce, e rimaneva solo il <b>dovere</b>.
                ~ rabbia ++

            * (amici) [I tuoi amici ti raccontano i loro problemi?]
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: A volte.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ma ultimamente sempre meno.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Non so se perché le cose gli vanno meglio.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Se perché sono troppo assente.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: O solo perché alla fin fine sono sempre le solite cose noiose che accadono <b>a tutti.</b>
                ~ abbandono ++
            -
            -> secondo_blocco

    = secondo_blocco
            * Prima hai detto che ci sono cose a cui non volevi pensare.
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

                * * (testa) [A volte la nostra testa sembra volerci fare del male.]
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Già.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: È come avere un nemico in testa.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Qualcosa che non puoi schiacciare.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Che ti comanda e non ti lascia respirare.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E che mi fa incazzare.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: È terribilmente frustrante.
                    ~ rabbia ++

            * (vuoto2) {vuoto} [Non ti scusare. Però forse questo ricordo è importante.]
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Il vuoto, questo gelo.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Credo che in realtà ci sia da sempre.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Compariva quando ero piccolo, quando i miei litigavano.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: A scuola, se rimanevo da solo.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Alle cene di lavoro, quando non avevo niente da raccontare.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ci sono un po' di modi per disturbarlo, sfiancarlo, ma come mi rilasso, è pronto a bussare.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Mi insegue nei sogni, non mi lascia respirare.
                ~ terrore ++

            * (lavoro2) {lavoro} [Quando il lavoro diventa un dovere non prendi una pausa?]
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Pensi non ci abbia provato?!?
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Scusa.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ma non hai idea della frustrazione.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ci ho messo una vita per vivere di ciò che amavo fare.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E quando questo è successo, non avevo più uno spazio di sfogo.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Un posto dove respirare.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: A volte finisco per litigare solo per il piacere di litigare.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Per gridare.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Per far sì che accada qualcosa.
                ~ rabbia ++


            * (amici2) {amici} [Anche se accadono a tutti, sono importanti per te.]
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ma il punto non è quello.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: È che poi le persone si annoiano.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Con tutti i casini, chi ha davvero voglia di ascoltare le para di qualcun altro.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E poi, alle persone non piace la fragilità.
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: La fragilità è sorella del bisogno, e le persone bisognose...
                {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Lascia fare.
                ~ abbandono ++



            * Quando hai deciso di non andare alla cena...
                * * (verità) [Perché non hai detto la verità ai tuoi amici?]
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Perché qualcuno avrebbe voluto aiutare.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Chiamare.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Salire a casa e fare qualcosa, risolvere qualcosa assieme.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ma io non so come fare, non ho idea di come reagire a queste cose.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E il Vuoto allora mi dice che sono in debito.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Che devo essere riconoscente.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ma per esserlo devo ascoltare, devo prestare davvero attenzione.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Fare meno cose, quando l'unica certezza che ho è che il Vuoto è silenzioso solo se continuo a lavorare.
                    ~ terrore ++

                * * (sentimenti) [Non hai pensato ai loro sentimenti?]
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Beh, gli ho fatto un favore.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Già sanno che sono inaffidabile, che non rispondo alle chiamate, che arrivo dopo settimane a scrivere un messaggio.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Almeno così hanno avuto la conferma che sono dimenticabile.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ignorabile.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E la prossima volta faranno senza di me.
                    ~ abbandono ++

                * * (male) [Non ti sei fatto solo del male da solo?]
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Probabile.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ma meglio così che rovinare la festa a tutti, no?
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Chi ha voglia di starsene a tavola con un fantasma piagnone?
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Con un fallimento sociale?
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Io no.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Non ho nemmeno voglia di restare con me.
                    {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Non capisco perché ci stia tu, quì.
                    ~ rabbia ++
            -

                    -> terzo_blocco

    = terzo_blocco
        {nome}: C'è una cosa ancora che vorrei chiederti, che vorrei capire.
        //Questa cosa ci permette di capire qual è lo stato d'animo emergente.

            * [Perché proprio questo ricordo?]
                {nome}: Perché è questa la cosa che continua a bloccarti qui?
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
        {nome}: Sai, io sono qui per aiutarti a rileggere la tua storia.
        {nome}: E forse ci sono dei modi diversi di guardare a quello che ti è accaduto.

        //Più abbiamo preso un certo topic di petto, più veniamo premiate? E quindi un punteggio alto in realtà favorisce una certa lettura di sè?
        //Ma se non abbiamo toccato un sentimento, una paura, non abbiamo modo di rileggere quella cosa in quel modo, e allora possiamo solo confermare lo status quo.
        //Arrivo qui con un massimo di 3 punti su un elemento
        {nome}: Il vuoto...
        //Mettere qualcosa per far riconoscere che una scelta usa inchiostro e l'altra no.
            - (top1)
                
                * {rabbia > 0} [Esplode per la tua frustrazione.]
                        {check_statusVsInchiostro(rabbia, statoInchiostroSpettroUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top1
                        }
                        {storia_uno.secondo_blocco.lavoro2: {nome}: Hai detto che il piacere è sparito, che a volte vorresti litigare solo perché qualcosa possa cambiare.}                        
                        {storia_uno.secondo_blocco.testa: {nome}: Ti manca il respiro, ti arrabbi, e non sai come affrontare questa cosa.}
                        {storia_uno.secondo_blocco.male: {nome}: Non ti perdoni. Ti descrivi come un fallimento sociale.}
                        {nome}: Il vuoto è una ferita che continua a farti male, ma che non sai come riparare.
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Dimmi qualcosa che non so.
                            ~ statoInchiostroSpettroUno --
                            ~ ferito ++
                
                * {abbandono > 0} [È il tuo bisogno di relazioni.]
                        {check_statusVsInchiostro(abbandono,statoInchiostroSpettroUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta</i>
                                -> top1
                        }
                        {storia_uno.secondo_blocco.amici2: {nome}: Ascoltare e condividere le "para" sono cose di cui abbiamo tutte bisogno.}                        
                        {storia_uno.secondo_blocco.capita: {nome}: È vero che molte delle cose che proviamo sono comuni, ed è questo il bello: rende più facile la comprensione.}
                        {storia_uno.secondo_blocco.sentimenti: {nome}: Hai detto che sei ignorabile, dimenticabile. Ma non hai mai detto di star meglio senza le altre persone.}
                        {nome}: Il vuoto è la tua fame di socialità, la tua voglia di connetterti, di unirti alle altre persone.
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: No, questa cosa mi farebbe solo del male.
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Perché presto o tardi tutti se ne andranno.
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ma continua.
                            ~ statoInchiostroSpettroUno --
                            ~ socievole ++
                
                * {terrore > 0} [Ti sta indicando le cose che ti fanno paura.]
                        {check_statusVsInchiostro(terrore,statoInchiostroSpettroUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top1
                        }
                        {storia_uno.secondo_blocco.racconto: {nome}: Non è vero che se racconti ciò che hai in testa, diventa vero.}
                        {storia_uno.secondo_blocco.vuoto2: {nome}: A scuola, coi genitori, a lavoro: sono situazioni che possono diventare davvero pesanti.}
                        {storia_uno.secondo_blocco.verità: {nome}: Nel mondo in cui viviamo, fatto di numeri e bilanci, è normale pensare che se qualcuno ci aiuta, allora siamo in debito.}
                        {nome}: Il vuoto è un segnale, non è un problema da risolvere.
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: ...
                            ~ statoInchiostroSpettroUno --
                            ~ consapevole ++
                
                * {rabbia == 0}[È il riflesso della tua rabbia.]
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Tutto qui?
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Come se esistesse un motivo per non essere incazzati col mondo.                                            
                
                * {abbandono == 0}[È l'isolamento che vai cercando.]
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Vedi?                
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Alla fine me lo merito.
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Merito di restare da solo.

                * {terrore == 0}[È la tua paura.]
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Quindi sono persino un codardo?
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Beh, dirlo ad alta voce un po' mi consola.
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Almeno so chi sono.


                -
        {nome}: E per questo...
            - (top2)
                *  {rabbia > 0} [Quello di cui hai bisogno è un momento di sosta.]
                        {check_statusVsInchiostro(rabbia, statoInchiostroSpettroUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top2
                        }
                        {storia_uno.secondo_blocco.lavoro2: {nome}: Iniziare a riscoprire il piacere.}                        
                        {storia_uno.secondo_blocco.testa: {nome}: Smetterla di trattare il vuoto come un nemico.}
                        {storia_uno.secondo_blocco.male: {nome}: Concerderti di essere un lamentone, un frignone.}
                        {nome}: Se non ti fermi e non capisci cosa provi, non ha senso avanzare.
                        {nome}: Non ha senso lavorare.
                        {nome}: E prima o poi il vuoto, la rabbia, troveranno modi per farsi notare.
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Io... Io...
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Uhm.                       
                            ~ statoInchiostroSpettroUno --
                            ~ ferito ++
                
                *  {abbandono > 0} [Guarda i rapporti che già hai, e parti da lì.]
                        {check_statusVsInchiostro(abbandono, statoInchiostroSpettroUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top2
                        }
                        {storia_uno.secondo_blocco.amici2: {nome}: Dici di essere assente: è un modo per difenderti dalla paura, ma è anche il modo migliore per far sì che davvero prima o poi le persone si allontanino.}               
                        {storia_uno.secondo_blocco.capita: {nome}: Tutte veniamo ferite da cose "banali", ma che non lo sono davvero: ci feriscono per il nostro passato, per la nostra storia.}
                        {storia_uno.secondo_blocco.sentimenti: {nome}: Mettersi nella posizione di essere "dimenticabile" non cancella il dolore che possono provare loro, nella tua assenza.}
                        {nome}: È come quella cosa, quella roba della profezia che si autoavvera.
                        {nome}: Cerchi così tanto di non venire abbandonato, che alla fine fai di tutto perché le altre persone se ne vadano.
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Eppure tu sei ancora qui.
                        Già: eppure sono ancora qui.
                        E ti conosco solo da qualche minuto.
                            ~ statoInchiostroSpettroUno --
                            ~ socievole ++
                
                *  {terrore > 0} [Anche se fa paura, aprirsi è la soluzione.]
                        {check_statusVsInchiostro(terrore, statoInchiostroSpettroUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top2
                        }
                        {storia_uno.secondo_blocco.racconto: {nome}: Raccontare ciò che hai in testa, condividerlo, ti permette di smontarlo.}
                        {storia_uno.secondo_blocco.vuoto2: {nome}: Quando sei in compagnia e la situazione è difficile, può essere utile avere una persona alleata al tuo fianco.}
                        {storia_uno.secondo_blocco.verità: {nome}: È importante ricordarti che le persone che ti vogliono bene ti aiutano perché gli va, non perché devono.}
                        {nome}: Non siamo fatti per affrontare il mondo da soli, e va bene così.
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: ...
                            ~ statoInchiostroSpettroUno --
                            ~ consapevole ++
                
                *  {rabbia == 0}[Hai bisogno di esplodere.]
                        {nome}: Gridare al mondo quello che non va.
                        {nome}: Bruciare tutto.
                        {nome}: Solo quando tutto è cancellato, allora possiamo ricominciare.

                *  {abbandono == 0}[Devi cercare di stare bene da solo.]
                        {nome}: Gli altri ci saranno, comunque.
                        {nome}: Ma se non trovi la chiave per amare te stesso, c'è poco da trovare soddisfazione nelle relazioni.

                *  {terrore == 0}[Il vuoto forse è qualcosa da accogliere.]
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Trasformarmi nel vuoto.
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Sparire.
                        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: L'eco di una persona.                                                            
                -
        
        {nome}: La tua storia...
            - (top3)
                *  {rabbia > 0} [È quella di una persona che riscopre le sue ferite.]
                        {check_statusVsInchiostro(rabbia, statoInchiostroSpettroUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top3
                        }
                        {nome}: Che vede nella rabbia, nella frustrazione non un nemico, ma un indicatore: qui è stato superato un confine.
                        {nome}: E allora si siede, e si ascolta.
                        {nome}: Lascia che la sua ferita gli dica di cosa ha bisogno, di cosa prendersi cura.
                        {nome}: Affinché pian piano possa chiudersi e guarire.
                            ~ statoInchiostroSpettroUno --
                            ~ ferito ++

                *  {abbandono > 0} [È quella di una persona che ama la compagnia.]
                        {check_statusVsInchiostro(abbandono, statoInchiostroSpettroUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top3
                        }
                        {nome}: E che non cerca di essere qualcuno che non è.
                        {nome}: Che è incasinato dal lavoro, dalla vita, eppure alla fine torna sempre.
                        {nome}: Che si preoccupa per Lele, che cerca di non stressare Cate.
                        {nome}: E che ora imparerà ad essere indulgente con sé stesso, a smetterla di nascondersi lasciandosi un po' coccolare.
                        {nome}: Condividendo le sue fragilità.
                            ~ statoInchiostroSpettroUno --
                            ~ socievole ++

                *  {terrore > 0} [È quella di qualcuno che accoglie le sue paure.]
                        {check_statusVsInchiostro(terrore, statoInchiostroSpettroUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top3
                        }
                        {nome}: Che vede il mondo, i rapporti, e ne comprende le complessità.
                        {nome}: Una vedetta consapevole.
                        {nome}: Sola, la vedetta è spaventata, terrorizzata.
                        {nome}: Ma assieme alle altre persone diventa parte di una rete, di una conversazione capace di trasformare ciò che non va.
                            ~ statoInchiostroSpettroUno --
                            ~ consapevole ++
                
                *  {rabbia == 0} [È un inno alla rabbia.]
                        {nome}: Sei fuoco.
                        {nome}: Ti alimenti della tua frustrazione.
                        {nome}: Quello che è da capire è cosa distruggerà la tua esplosione: le persone care?
                        {nome}: Te stesso?
                        {nome}: O ciò che non funziona?

                *  {abbandono == 0} [È il viaggio solitario dell'eroe.]
                        {nome}: Che avanza di giorno in giorno affrondando da solo i suoi drammi, la spada sporca di sangue.
                        {nome}: Che cambia città, regione, stato ogni volta, lasciandosi il vuoto alle spalle.
                        {nome}: Ma quando la notte sale e il fuoco crepita, si chiede: ne è valsa davvero la pena?
                        {nome}: Non potrei forse fermarmi in un'osteria per qualche notte?
                        {nome}: Un po' di vino, buone chiacchiere.
                        {nome}: E forse una faccia amica con cui riprendere a camminare?
                
                *  {terrore == 0} [È una storia di paura.]
                        {nome}: E la paura non è una colpa.
                        {nome}: Il mondo è un gran casino, ci sta sentirsi costantemente in allarme.
                -
                    -> chi_sono_storia_uno

=== chi_sono_storia_uno

        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ora ricordo.
        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ricordo che questa cosa è successa molto tempo fa.
        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Che sono bloccato qui non so nemmeno da quanto.
        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ma vedo le cose con chiarezza.
        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Non sono {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}.
        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Io sono <>
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
            - IlSocievole: {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Ora so che sto bene quando sono con altre persone, e che posso smetterla di tenerle lontane.
            - IlConsapevole: {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Vedo i dolori del mondo e capisco che sono prodotti di quel sistema. Unendomi alle altre persone, posso cambiare un po' di cose.
            - IlGuarente: {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: La mia rabbia è una guida: ora so dove si trovano le mie ferite, e come affrontarle.
            - IlTerrorizzato: {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Quello che ho dentro è mostruoso, deve rimanere nascosto dagli altri, a qualunque costo.
            - LAbbandonato: {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Sono abituato a fare tutto da solo, così saprò come sopravvivere quando gli altri inevitabilmente se ne andranno.
            - LArrabbiato: {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Il mondo è sempre pronto a mordere, e io lo morderò sempre prima che lui possa ferirmi.
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
        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Prima di andarmene, vorrei dirti una cosa.
        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Mi hai dato un dono speciale, e vorrei ringraziarti in qualche modo.
        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: E quindi: presta attenzione al mentore.
        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Perché potrebbe essere qualcuno che già conosci.
        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Fuori da qui.
        {traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettroUno)}: Dal mondo da cui provieni.
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