~ temp charName = traduttoreSpettriArticoloMaiuscolo(effettivoStatoPersonaggiaUno)

=== personaggia_uno ===
    //Opzione di dialogo
    + {are_two_entities_together(PersonaggiaUno, PG) && storiaUno == InCorso}[PersonaggiaUno]
        <i>Qui attende {traduttoreSpettri(effettivoStatoPersonaggiaUno)}.</i>
            -> intro_storia_uno

    //Dialoghi ed elementi che possono comparire dopo la chiusura dell'arco.
    + {are_two_entities_together(PersonaggiaUno, PG) && storiaUno == Conclusa} [PersonaggiaUno]
        <i>Qui riposa {traduttoreSpettri(effettivoStatoPersonaggiaUno)}.</i>
            -> personaggia_uno_storia_conclusa

TODO: questa diventa una opzione di dialogo.
    //opzione se questa storia è attiva e non ho fatto un dono
    + {are_two_entities_together(PersonaggiaUno, PG) && storiaUno == InCorso && not storia_uno.capitolo_uno} [PersonaggiaUno]
    <i>{charName} ondeggia inquieto accanto alla sua lapide.</i>
        -> doni_storia_uno

TODO: qui e sotto dipende da come settiamo il tutorial.
      //opzione se questa storia è attiva e ho fatto un dono ma non ho fatto lo step Mentore "domande e obiettivo"
    + {are_two_entities_together(PersonaggiaUno, PG) && storiaUno == InCorso && storia_uno.capitolo_uno && not domande_e_obiettivo} [PersonaggiaUno]
    {charName}: Mi sa che il mentore vuole dirti qualcosa prima che continuiamo.
        -> main
    
    //Ho finito tutti e tre i pezzi di tutorial (intr, dono_e_inchiostro, domande_e_obbiettivo) e posso finalmente aiutare lo spettro
    + {are_two_entities_together(PersonaggiaUno, PG) && storiaUno == InCorso && storia_uno.capitolo_uno && domande_e_obiettivo} [PersonaggiaUno]
        -> storia_uno.primo_blocco   

    + ->

    -> main

=== dialogo_personaggia_uno
-> END
=== intro_storia_uno ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione
    //In questo primo step quello che succede è che verifichiamo se ci sono trigger problematici per la giocatrice. Le permettiamo di scegliere se andare o meno avanti, e poi abbiamo la presentazione della storia.
    {
    - presentazioni == 0:
        {charName}: Non penso tu voglia parlare davvero con me.
        {charName}: Ma anche fosse, prima parla col mentore.
        {charName}: Lo riconosci perché assomiglia a una lampada.
        {charName}: Sicuro ha qualcosa da dire a una persona appena arrivata.
            -> main
    }
    
    
    {
    - solitudine == false:
        -> trigger_solitudine

    }
    <i>{charName} ti osserva malinconico.</i>
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
            {charName}: Vigilia di Natale.
            {charName}: Per la prima volta da mesi ho tempo libero: non sto lavorando, non sto correndo da nessuna parte.
            {charName}: Cammino lentamente col cane, andando a una cena con amici.
            {charName}: Eppure, non riesco a liberarmi di questo enorme senso di vuoto.
            {charName}: Mi prende la pancia con dita lunghe e fredde, mi fa pensare cose che non voglio pensare, più fredde della brina che già ricopre le strade.
            {charName}: Ho bisogno di parlare con qualcuno: non sento mamma da settimane, e poi ci sono messaggi, audio, meme che attendono risposte da tempi imbarazzanti.
            {charName}: Mentre aspetto il bus provo a pensare con chi potrei confidarmi.
            {charName}: Mando un audio a Lele, che mi risponde raccontandomi i suoi drammi.
            {charName}: Ascolto un vocale di Cate, ma man mano che la sua voce dal passato mi consola per le rotture di lavoro mi passa il coraggio di condividere qualcosa di più pesante.
            {charName}: Cazzo quanto sono pesante. Rispondo con delle cazzate.
            {charName}: Provo a scrivere a Sandro, ma poi il testo cambia perché messe a parole quelle cose non sono esattamente così, non hanno la voce giusta.
            {charName}: L’unica cosa che vorrei fare è gridare, gridare, gridare.
            {charName}: E poi dai, ognuno c’ha i suoi cazzi.
            {charName}: Continuo a pensare alla cena in arrivo, al dover far finta che tutto vada bene.
            {charName}: Ridere alle battute, dire cose come "Ma dai!" e "Non ci credo!".
            {charName}: L’autobus arriva, lo lascio passare.
            {charName}: Il vuoto mi trascina in giro per il paese, il suo gelo mi schiaccia lo stomaco, mi fa esplodere il cuore.
            {charName}: Il cellulare inizia a vibrare. Non ce la posso fare, non ce la posso fare.
            {charName}: Torno a casa, disattivo il telefono, e mi rimetto a lavorare.
                -> main


=== doni_storia_uno ===
//Qui è la fase di check per i doni, se donarne, quali, o non farlo.
{
    - not dono_e_inchiostro: {charName}: Credo che il Mentore prima voglia parlarti.
        -> main
    - else:
        -> internal_inventario
}

= internal_inventario
    {charName}: Tutto sommato è una cosa così banale, così banale. Eppure questo freddo non se ne vuole andare.
        + {doniTrovati != ()} [Ho un dono per te, <i>{traduttoreSpettri(effettivoStatoPersonaggiaUno)}</i>.]
            -> gestione_inventario
        + [Vorrei riascoltare la tua storia, <i>{traduttoreSpettri(effettivoStatoPersonaggiaUno)}</i>.]
            -> intro_storia_uno.intro
        + [Mi allontano.]
            -> main
        -
            -> main


=== storia_uno
//Una volta che abbiamo fatto il dono, parte la vera e propria storia.
    = capitolo_uno
        //Informativa sullo stato dell'inchiostro.
        <i>Dopo il tuo dono, la quantità di inchiostro a disposizione è {statoInchiostroPersonaggiaUno}.</i>
//Faccio il dono, ho un feedback, esco così da parlare con il Mentore.
            -> azioniInchiostro -> main
            //-> primo_blocco


    = primo_blocco
        {charName}: Sei {pronomi has maschili: tornato|{pronomi has femminili: tornata|tornatə}}, non me l'aspettavo.
        {nome}: C'è qualcosa che vorrei chiederti:
            * (vuoto) [Ti è capitato di sentire altre volte questo vuoto?]
                {charName}: Forse.
                {charName}: <b>Ricordo</b>...
                {charName}: Mi manca l'aria, scusa.
                ~ terrore ++

            * (lavoro) [Il tuo lavoro ti fa stare bene?]
                {charName}: Sì.
                {charName}: Il problema è che non conosco mai il limite.
                {charName}: E c'è questa sensazione, questa preoccupazione di essere sempre in ritardo su qualcosa.
                {charName}: È davvero difficile riposarsi, sai? Staccare un po'.
                {charName}: E intanto il piacere sparisce, e rimaneva solo il <b>dovere</b>.
                ~ rabbia ++

            * (amici) [I tuoi amici ti raccontano i loro problemi?]
                {charName}: A volte.
                {charName}: Ma ultimamente sempre meno.
                {charName}: Non so se perché le cose gli vanno meglio.
                {charName}: Se perché sono troppo assente.
                {charName}: O solo perché alla fin fine sono sempre le solite cose noiose che accadono <b>a tutti.</b>
                ~ abbandono ++
            -
            -> secondo_blocco

    = secondo_blocco
            * Prima hai detto che ci sono cose a cui non volevi pensare.
                    {charName}: Sì.

                * * (racconto)[E ti andrebbe di raccontarmele?]
                    {charName}: No.
                    {charName}: Non perché non mi fidi di te.
                    {charName}: Ma perché fintanto che le cose non escono dalla testa, allora non sono vere, no?
                    {charName}: E io non voglio che divengano vere.
                        ~ terrore ++

                * * (capita)[Capita anche a me, sai?]
                    {charName}: Vedi, è come con Lele.
                    {charName}: Queste cose mi ricordano che quello che provo è comune.
                    {charName}: Banale.
                    {charName}: Stupido io che lascio che mi facciano così male.
                    ~ abbandono ++

                * * (testa) [A volte la nostra testa sembra volerci fare del male.]
                    {charName}: Già.
                    {charName}: È come avere un nemico in testa.
                    {charName}: Qualcosa che non puoi schiacciare.
                    {charName}: Che ti comanda e non ti lascia respirare.
                    {charName}: E che mi fa incazzare.
                    {charName}: È terribilmente frustrante.
                    ~ rabbia ++

            * (vuoto2) {vuoto} [Non ti scusare. Però forse questo ricordo è importante.]
                {charName}: Il vuoto, questo gelo.
                {charName}: Credo che in realtà ci sia da sempre.
                {charName}: Compariva quando ero piccolo, quando i miei litigavano.
                {charName}: A scuola, se rimanevo da solo.
                {charName}: Alle cene di lavoro, quando non avevo niente da raccontare.
                {charName}: Ci sono un po' di modi per disturbarlo, sfiancarlo, ma come mi rilasso, è pronto a bussare.
                {charName}: Mi insegue nei sogni, non mi lascia respirare.
                ~ terrore ++

            * (lavoro2) {lavoro} [Quando il lavoro diventa un dovere non prendi una pausa?]
                {charName}: Pensi non ci abbia provato?!?
                {charName}: Scusa.
                {charName}: Ma non hai idea della frustrazione.
                {charName}: Ci ho messo una vita per vivere di ciò che amavo fare.
                {charName}: E quando questo è successo, non avevo più uno spazio di sfogo.
                {charName}: Un posto dove respirare.
                {charName}: A volte finisco per litigare solo per il piacere di litigare.
                {charName}: Per gridare.
                {charName}: Per far sì che accada qualcosa.
                ~ rabbia ++


            * (amici2) {amici} [Anche se accadono a tutti, sono importanti per te.]
                {charName}: Ma il punto non è quello.
                {charName}: È che poi le persone si annoiano.
                {charName}: Con tutti i casini, chi ha davvero voglia di ascoltare le para di qualcun altro.
                {charName}: E poi, alle persone non piace la fragilità.
                {charName}: La fragilità è sorella del bisogno, e le persone bisognose...
                {charName}: Lascia fare.
                ~ abbandono ++



            * Quando hai deciso di non andare alla cena...
                * * (verità) [Perché non hai detto la verità ai tuoi amici?]
                    {charName}: Perché qualcuno avrebbe voluto aiutare.
                    {charName}: Chiamare.
                    {charName}: Salire a casa e fare qualcosa, risolvere qualcosa assieme.
                    {charName}: Ma io non so come fare, non ho idea di come reagire a queste cose.
                    {charName}: E il Vuoto allora mi dice che sono in debito.
                    {charName}: Che devo essere riconoscente.
                    {charName}: Ma per esserlo devo ascoltare, devo prestare davvero attenzione.
                    {charName}: Fare meno cose, quando l'unica certezza che ho è che il Vuoto è silenzioso solo se continuo a lavorare.
                    ~ terrore ++

                * * (sentimenti) [Non hai pensato ai loro sentimenti?]
                    {charName}: Beh, gli ho fatto un favore.
                    {charName}: Già sanno che sono inaffidabile, che non rispondo alle chiamate, che arrivo dopo settimane a scrivere un messaggio.
                    {charName}: Almeno così hanno avuto la conferma che sono dimenticabile.
                    {charName}: Ignorabile.
                    {charName}: E la prossima volta faranno senza di me.
                    ~ abbandono ++

                * * (male) [Non ti sei fatto solo del male da solo?]
                    {charName}: Probabile.
                    {charName}: Ma meglio così che rovinare la festa a tutti, no?
                    {charName}: Chi ha voglia di starsene a tavola con un fantasma piagnone?
                    {charName}: Con un fallimento sociale?
                    {charName}: Io no.
                    {charName}: Non ho nemmeno voglia di restare con me.
                    {charName}: Non capisco perché ci stia tu, quì.
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
                    {charName}: Perché ora l'unica cosa che rimane è la <b>rabbia</b>, la furia.
                    {charName}: E non so, non ricordo se l'ho mai rivolta contro qualcuno a cui tengo.
                    {charName}: Perché a volte questo vuoto fa così male, che vorrei distruggere tutto.

                - abbandono > rabbia && abbandono > terrore:
                    {charName}: Perché mi sono sentito così vuoto, così solo, così dimenticato.
                    {charName}: E quel vuoto è come un buco nero.
                    {charName}: E non conta cosa è accaduto prima, cosa è venuto dopo.
                    {charName}: So solo che presto o tardi verrò <b>abbandonato</b>.

                - terrore > rabbia && terrore > abbandono:
                    {charName}: Perché avrei voluto parlare del vuoto.
                    {charName}: Ma il vuoto è come un vortice che prende e travolge tutto.
                    {charName}: E l'unica cosa che rimane è il <b>terrore</b> di cosa possa esserci dopo il vuoto.

                - else:
                    {charName}: Perché racconta qualcosa di chi ero.
                    {charName}: Di chi sono stato.
                    {charName}: E di chi poi sono diventato.
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
                        {check_statusVsInchiostro(rabbia, statoInchiostroPersonaggiaUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top1
                        }
                        {storia_uno.secondo_blocco.lavoro2: {nome}: Hai detto che il piacere è sparito, che a volte vorresti litigare solo perché qualcosa possa cambiare.}                        
                        {storia_uno.secondo_blocco.testa: {nome}: Ti manca il respiro, ti arrabbi, e non sai come affrontare questa cosa.}
                        {storia_uno.secondo_blocco.male: {nome}: Non ti perdoni. Ti descrivi come un fallimento sociale.}
                        {nome}: Il vuoto è una ferita che continua a farti male, ma che non sai come riparare.
                        {charName}: Dimmi qualcosa che non so.
                            ~ statoInchiostroPersonaggiaUno --
                            ~ ferito ++
                
                * {abbandono > 0} [È il tuo bisogno di relazioni.]
                        {check_statusVsInchiostro(abbandono,statoInchiostroPersonaggiaUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta</i>
                                -> top1
                        }
                        {storia_uno.secondo_blocco.amici2: {nome}: Ascoltare e condividere le "para" sono cose di cui abbiamo tutte bisogno.}                        
                        {storia_uno.secondo_blocco.capita: {nome}: È vero che molte delle cose che proviamo sono comuni, ed è questo il bello: rende più facile la comprensione.}
                        {storia_uno.secondo_blocco.sentimenti: {nome}: Hai detto che sei ignorabile, dimenticabile. Ma non hai mai detto di star meglio senza le altre persone.}
                        {nome}: Il vuoto è la tua fame di socialità, la tua voglia di connetterti, di unirti alle altre persone.
                        {charName}: No, questa cosa mi farebbe solo del male.
                        {charName}: Perché presto o tardi tutti se ne andranno.
                        {charName}: Ma continua.
                            ~ statoInchiostroPersonaggiaUno --
                            ~ socievole ++
                
                * {terrore > 0} [Ti sta indicando le cose che ti fanno paura.]
                        {check_statusVsInchiostro(terrore,statoInchiostroPersonaggiaUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top1
                        }
                        {storia_uno.secondo_blocco.racconto: {nome}: Non è vero che se racconti ciò che hai in testa, diventa vero.}
                        {storia_uno.secondo_blocco.vuoto2: {nome}: A scuola, coi genitori, a lavoro: sono situazioni che possono diventare davvero pesanti.}
                        {storia_uno.secondo_blocco.verità: {nome}: Nel mondo in cui viviamo, fatto di numeri e bilanci, è normale pensare che se qualcuno ci aiuta, allora siamo in debito.}
                        {nome}: Il vuoto è un segnale, non è un problema da risolvere.
                        {charName}: ...
                            ~ statoInchiostroPersonaggiaUno --
                            ~ consapevole ++
                
                * {rabbia == 0}[È il riflesso della tua rabbia.]
                        {charName}: Tutto qui?
                        {charName}: Come se esistesse un motivo per non essere incazzati col mondo.                                            
                
                * {abbandono == 0}[È l'isolamento che vai cercando.]
                        {charName}: Vedi?                
                        {charName}: Alla fine me lo merito.
                        {charName}: Merito di restare da solo.

                * {terrore == 0}[È la tua paura.]
                        {charName}: Quindi sono persino un codardo?
                        {charName}: Beh, dirlo ad alta voce un po' mi consola.
                        {charName}: Almeno so chi sono.


                -
        {nome}: E per questo...
            - (top2)
                *  {rabbia > 0} [Quello di cui hai bisogno è un momento di sosta.]
                        {check_statusVsInchiostro(rabbia, statoInchiostroPersonaggiaUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top2
                        }
                        {storia_uno.secondo_blocco.lavoro2: {nome}: Iniziare a riscoprire il piacere.}                        
                        {storia_uno.secondo_blocco.testa: {nome}: Smetterla di trattare il vuoto come un nemico.}
                        {storia_uno.secondo_blocco.male: {nome}: Concerderti di essere un lamentone, un frignone.}
                        {nome}: Se non ti fermi e non capisci cosa provi, non ha senso avanzare.
                        {nome}: Non ha senso lavorare.
                        {nome}: E prima o poi il vuoto, la rabbia, troveranno modi per farsi notare.
                        {charName}: Io... Io...
                        {charName}: Uhm.                       
                            ~ statoInchiostroPersonaggiaUno --
                            ~ ferito ++
                
                *  {abbandono > 0} [Guarda i rapporti che già hai, e parti da lì.]
                        {check_statusVsInchiostro(abbandono, statoInchiostroPersonaggiaUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top2
                        }
                        {storia_uno.secondo_blocco.amici2: {nome}: Dici di essere assente: è un modo per difenderti dalla paura, ma è anche il modo migliore per far sì che davvero prima o poi le persone si allontanino.}               
                        {storia_uno.secondo_blocco.capita: {nome}: Tutte veniamo ferite da cose "banali", ma che non lo sono davvero: ci feriscono per il nostro passato, per la nostra storia.}
                        {storia_uno.secondo_blocco.sentimenti: {nome}: Mettersi nella posizione di essere "dimenticabile" non cancella il dolore che possono provare loro, nella tua assenza.}
                        {nome}: È come quella cosa, quella roba della profezia che si autoavvera.
                        {nome}: Cerchi così tanto di non venire abbandonato, che alla fine fai di tutto perché le altre persone se ne vadano.
                        {charName}: Eppure tu sei ancora qui.
                        Già: eppure sono ancora qui.
                        E ti conosco solo da qualche minuto.
                            ~ statoInchiostroPersonaggiaUno --
                            ~ socievole ++
                
                *  {terrore > 0} [Anche se fa paura, aprirsi è la soluzione.]
                        {check_statusVsInchiostro(terrore, statoInchiostroPersonaggiaUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top2
                        }
                        {storia_uno.secondo_blocco.racconto: {nome}: Raccontare ciò che hai in testa, condividerlo, ti permette di smontarlo.}
                        {storia_uno.secondo_blocco.vuoto2: {nome}: Quando sei in compagnia e la situazione è difficile, può essere utile avere una persona alleata al tuo fianco.}
                        {storia_uno.secondo_blocco.verità: {nome}: È importante ricordarti che le persone che ti vogliono bene ti aiutano perché gli va, non perché devono.}
                        {nome}: Non siamo fatti per affrontare il mondo da soli, e va bene così.
                        {charName}: ...
                            ~ statoInchiostroPersonaggiaUno --
                            ~ consapevole ++
                
                *  {rabbia == 0}[Hai bisogno di esplodere.]
                        {nome}: Gridare al mondo quello che non va.
                        {nome}: Bruciare tutto.
                        {nome}: Solo quando tutto è cancellato, allora possiamo ricominciare.

                *  {abbandono == 0}[Devi cercare di stare bene da solo.]
                        {nome}: Gli altri ci saranno, comunque.
                        {nome}: Ma se non trovi la chiave per amare te stesso, c'è poco da trovare soddisfazione nelle relazioni.

                *  {terrore == 0}[Il vuoto forse è qualcosa da accogliere.]
                        {charName}: Trasformarmi nel vuoto.
                        {charName}: Sparire.
                        {charName}: L'eco di una persona.                                                            
                -
        
        {nome}: La tua storia...
            - (top3)
                *  {rabbia > 0} [È quella di una persona che riscopre le sue ferite.]
                        {check_statusVsInchiostro(rabbia, statoInchiostroPersonaggiaUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top3
                        }
                        {nome}: Che vede nella rabbia, nella frustrazione non un nemico, ma un indicatore: qui è stato superato un confine.
                        {nome}: E allora si siede, e si ascolta.
                        {nome}: Lascia che la sua ferita gli dica di cosa ha bisogno, di cosa prendersi cura.
                        {nome}: Affinché pian piano possa chiudersi e guarire.
                            ~ statoInchiostroPersonaggiaUno --
                            ~ ferito ++

                *  {abbandono > 0} [È quella di una persona che ama la compagnia.]
                        {check_statusVsInchiostro(abbandono, statoInchiostroPersonaggiaUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top3
                        }
                        {nome}: E che non cerca di essere qualcuno che non è.
                        {nome}: Che è incasinato dal lavoro, dalla vita, eppure alla fine torna sempre.
                        {nome}: Che si preoccupa per Lele, che cerca di non stressare Cate.
                        {nome}: E che ora imparerà ad essere indulgente con sé stesso, a smetterla di nascondersi lasciandosi un po' coccolare.
                        {nome}: Condividendo le sue fragilità.
                            ~ statoInchiostroPersonaggiaUno --
                            ~ socievole ++

                *  {terrore > 0} [È quella di qualcuno che accoglie le sue paure.]
                        {check_statusVsInchiostro(terrore, statoInchiostroPersonaggiaUno):
                            - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
                                -> top3
                        }
                        {nome}: Che vede il mondo, i rapporti, e ne comprende le complessità.
                        {nome}: Una vedetta consapevole.
                        {nome}: Sola, la vedetta è spaventata, terrorizzata.
                        {nome}: Ma assieme alle altre persone diventa parte di una rete, di una conversazione capace di trasformare ciò che non va.
                            ~ statoInchiostroPersonaggiaUno --
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

        {charName}: Ora ricordo.
        {charName}: Ricordo che questa cosa è successa molto tempo fa.
        {charName}: Che sono bloccato qui non so nemmeno da quanto.
        {charName}: Ma vedo le cose con chiarezza.
        {charName}: Non sono {charName}.
        {charName}: Io sono <>
        {
            - rabbia > abbandono:
            {
                - rabbia > terrore:
                {
                    - rabbia > ferito: l'Arrabbiato.
                        ~ effettivoStatoPersonaggiaUno = LArrabbiato
                    - else:  il Guarente.
                         ~ effettivoStatoPersonaggiaUno = IlGuarente
                }
                - else:
                {
                    - terrore > consapevole: il Terrorizzato.
                         ~ effettivoStatoPersonaggiaUno = IlTerrorizzato
                    - else: il Consapevole.
                         ~ effettivoStatoPersonaggiaUno = IlConsapevole
                }
            }
            - abbandono > terrore:
                {
                    - terrore > consapevole: il Terrorizzato.
                         ~ effettivoStatoPersonaggiaUno = IlTerrorizzato
                    - else: il Consapevole.
                         ~ effettivoStatoPersonaggiaUno = IlConsapevole
                }
            - else:
                {
                    - abbandono > socievole: l'abbandonato.
                         ~ effettivoStatoPersonaggiaUno = LAbbandonato
                    - else: il Socievole.
                         ~ effettivoStatoPersonaggiaUno = IlSocievole
                }                    
        }

        {effettivoStatoPersonaggiaUno:
            - IlSocievole: {charName}: Ora so che sto bene quando sono con altre persone, e che posso smetterla di tenerle lontane.
            - IlConsapevole: {charName}: Vedo i dolori del mondo e capisco che sono prodotti di quel sistema. Unendomi alle altre persone, posso cambiare un po' di cose.
            - IlGuarente: {charName}: La mia rabbia è una guida: ora so dove si trovano le mie ferite, e come affrontarle.
            - IlTerrorizzato: {charName}: Quello che ho dentro è mostruoso, deve rimanere nascosto dagli altri, a qualunque costo.
            - LAbbandonato: {charName}: Sono abituato a fare tutto da solo, così saprò come sopravvivere quando gli altri inevitabilmente se ne andranno.
            - LArrabbiato: {charName}: Il mondo è sempre pronto a mordere, e io lo morderò sempre prima che lui possa ferirmi.
        }
        -
        {
            - eventoSpecialePersonaggiaUno == true:
                -> evento_speciale
            - else:
                {charName}: E ora posso andarmene in pace.
                ~ storiaUno = Conclusa
                ~ counterSpostamenti = 0
                    -> main
        }

    = evento_speciale
        {charName}: Prima di andarmene, vorrei dirti una cosa.
        {charName}: Mi hai dato un dono speciale, e vorrei ringraziarti in qualche modo.
        {charName}: E quindi: presta attenzione al mentore.
        {charName}: Perché potrebbe essere qualcuno che già conosci.
        {charName}: Fuori da qui.
        {charName}: Dal mondo da cui provieni.
        {charName}: Addio.                              
            ~ storiaUno = Conclusa
                -> main

=== scelta_nome_uno
    * Il Socievole.
         ~ effettivoStatoPersonaggiaUno = IlSocievole
    * Il Consapevole.
         ~ effettivoStatoPersonaggiaUno = IlConsapevole
    * Il Ferito.
         ~ effettivoStatoPersonaggiaUno = IlGuarente
    -
        ~ counterSpostamenti = 0
        ~ storiaUno = Conclusa
        -> main
        
=== personaggia_uno_storia_conclusa
    {charName}: Dico cose.
        + Opzione
        + Opzione
        + Opzione
        -
-> main        