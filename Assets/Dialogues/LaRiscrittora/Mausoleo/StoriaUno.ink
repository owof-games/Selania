=== lapide_uno ===
    //opzione se non hai mai esplorato questa storia, e se non ci sono storie attive
    + {contenutoMausoleo has PG && not (storiaUno == InCorso or storiaUno == Conclusa) and not (storiaDue == InCorso or storiaTre == InCorso)}[LapideUno]
        <i>Qui giace {traduttoreSpettri(effettivoStatoSpettroUno)}</i>
        -> intro_storia_uno

    //opzione se c'è un'altra storia attiva
    + {contenutoMausoleo has PG && storiaUno == Conclusa} [LapideUno]
        <i>La prima lapide appartiene a {traduttoreSpettri(effettivoStatoSpettroUno)}</i>
        -> main

    //opzione se questa storia è attiva
    + {contenutoMausoleo has PG && storiaUno == InCorso} [LapideUno]
    <i>Lo spettro del vuoto ondeggia inquieto accanto alla sua lapide.</i>
        -> doni_storia_uno

    + ->

    -> main

=== intro_storia_uno ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione
    //In questo primo step quello che succede è che verifichiamo se ci sono trigger problematici per la giocatrice. Le permettiamo di scegliere se andare o meno avanti, e poi abbiamo la presentazione della storia.
    ~ storiaUno = InCorso
    {
    - solitudine == false:
        -> trigger_solitudine

    }
    <i>Vuoi ascoltare la sua storia?</i>
        + [Sì]
            -> intro
        + [No]
            -> main
    ->->

        = trigger_solitudine
            Hai segnalato che preferiresti non sentire storie riguardanti la solitudine, che è uno dei temi di questo spettro.
            Puoi decidere se continuare comunque, o saltare la sua storia.
            Nel secondo caso, potrai (in modo un po' arbitrario) aiutarlo a riscrivere il suo nome.
                * Affronto
                    -> intro
                * Salto
                    -> scelta_nome_uno
                -
                ->->

        = intro
            Vigilia di Natale.
            Per la prima volta da mesi ho tempo libero: non sto lavorando, non sto correndo da nessuna parte.
            Cammino lentamente col cane, sto andando a una cena con amici; eppure, c’è questo enorme senso di vuoto.
            Mi prende la pancia con dita lunghe e fredde, mi fa pensare cose che non voglio pensare, più fredde della brina che rimane sulle strade.
            Ho bisogno di parlare con qualcuno: non sento mamma da settimane, e poi ci sono messaggi, audio, meme che attendono risposte da tempi imbarazzanti.
            Mentre aspetto il bus provo a pensare con chi potrei confidarmi.
            Mando un audio a Lele, che mi risponde raccontandomi i suoi drammi.
            Ascolto un vocale di Cate, ma man mano che mi consola per le rotture di lavoro mi passa il coraggio di condividere qualcosa di più pesante, cazzo quanto sono pesante, e rispondo con delle cazzate.
            Provo a scrivere a Sandro, ma poi il testo cambia perché messe a parole quelle cose non sono esattamente così, non hanno la voce giusta.
            L’unica cosa che potrei fare è provare a gridare, gridare, gridare.
            E poi, insomma, ognuno c’ha i suoi cazzi.
            Penso alla cena in arrivo, al dover far finta che tutto vada bene.
            L’autobus arriva, lo lascio passare.
            Il cane inizia a tirare.
            Il vuoto mi trascina in giro per il paese, il suo gelo mi schiaccia lo stomaco, mi fa esplodere il cuore.
            Il cellulare inizia a vibrare. Non ce la posso fare, non ce la posso fare.
            Torno a casa, disattivo internet, disattivo il cellulare, e mi rimetto a lavorare.
            -> main


=== doni_storia_uno ===
//Qui è la fase di check per i doni, se donarne, quali, o non farlo.
    Tutto sommato è una cosa così banale, così banale. Eppure questo freddo non se ne vuole andare.
    + {doniTrovati != ()} Forse con un dono adeguato, lo spettro sarà disponibile a parlarti.
        -> gestione_inventario
    + [Ti allontani]
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
        Spettro: Sei {pronomi has maschili: tornato|{pronomi has femminili: tornata|tornatə}}, non me l'aspettavo.
        C'è qualcosa che vorrei chiederti:
            * (vuoto) Ti è capitato di sentire altre volte questo vuoto?
                Spettro: Forse.
                Spettro: <b>Ricordo</b>...
                Spettro: Mi manca l'aria, scusa.
                ~ terrore ++

            * (lavoro) Il tuo lavoro ti faceva stare bene?
                Spettro: Sì.
                Spettro: Il problema è che non conoscevo mai il limite.
                Spettro: E c'era questa sensazione, questa preoccupazione di essere sempre in ritardo su qualcosa.
                Spettro: Era davvero difficile riposarsi, sai? Staccare un po'.
                Spettro: E a quel punto il piacere spariva, e rimaneva solo il <b>dovere</b>.
                ~ rabbia ++

            * (amici) I tuoi amici ti raccontano i loro problemi?
                Spettro: A volte.
                Spettro: Ma ultimamente sempre meno.
                Spettro: Non so se perché le cose andavano meglio.
                Spettro: Se perché ero troppo assente.
                Spettro: O solo perché alla fin fine sono sempre le solite cose noiose che accadono <b>a tutti.</b>
                ~ abbandono ++
            -
            -> secondo_blocco

    = secondo_blocco
            * Prima hai detto che ci sono cose a cui non volevi pensare...
                Spettro: Sì.

                * * E ti andrebbe di raccontarmele?
                    ~ terrore ++
                    Spettro: No.
                    Spettro: Non perché non mi fidi di te.
                    Spettro: Ma perché fintanto che le cose non escono dalla testa, allora non sono vere, no?
                    Spettro: E io non voglio che divengano vere.

                * * Capita anche a me, sai?
                    Spettro: Vedi, è come con Lele.
                    Spettro: Queste cose mi ricordano che quello che provo è comune.
                    Spettro: Banale.
                    Spettro: Stupido io che lascio che mi facciano così male.
                    ~ abbandono ++

                * * A volte la nostra testa sembra volerci fare solo del male.
                    Spettro: Già.
                    Spettro: È come avere un nemico in testa.
                    Spettro: Qualcosa che non puoi schiacciare.
                    Spettro: Che ti comanda e non ti lascia respirare.
                    Spettro: E che mi fa incazzare.
                    Spettro: È terribilmente frustrante.
                    ~ rabbia ++

            * (vuoto2) {vuoto} Non ti scusare. Però forse questo ricordo è importante.
                ~ terrore ++
                Spettro: Il vuoto, questo gelo.
                Spettro: Credo che in realtà ci sia sempre.
                Spettro: Compariva quando ero piccolo, quando i miei litigavano.
                Spettro: A scuola, se rimanevo da solo.
                Spettro: Alle cene di lavoro, quando non avevo niente da raccontare.
                Spettro: Ci sono un po' di modi per disturbarlo, sfiancarlo, ma come mi rilasso, è pronto a bussare.
                Spettro: Mi insegue nei sogni, non mi lascia respirare.

            * (lavoro2) {lavoro} Perché quando il lavoro diventa un dovere, non prendi una pausa?
                ~ rabbia ++
                Spettro: Pensi non ci abbia provato?!?
                Spettro: Scusa.
                Spettro: Ma non hai idea della frustrazione.
                Spettro: Ci ho messo una vita per vivere di ciò che amavo fare.
                Spettro: E quando questo è successo, non avevo più uno spazio di sfogo.
                Spettro: Un posto dove respirare.
                Spettro: A volte finisco per litigare solo per il piacere di litigare.
                Spettro: Per gridare.
                Spettro: Per far sì che accada qualcosa.


            * (amici2) {amici} Anche se accadono a tutti, non è che non sono importanti per te.
                ~ abbandono ++
                Spettro: Ma il punto non è quello.
                Spettro: È che poi le persone si annoiano.
                Spettro: Con tutti i casini, chi ha davvero voglia di ascoltare le para di qualcun altro.
                Spettro: E poi, alle persone non piace la fragilità.
                Spettro: La fragilità è sorella del bisogno, e le persone bisognose...
                Spettro: Lascia fare.



            * Quando hai deciso di non andare alla cena...
                * * Perché non hai detto la verità ai tuoi amici?
                    ~ terrore ++
                    Spettro: Perché qualcuno avrebbe voluto aiutare.
                    Spettro: Chiamare.
                    Spettro: Salire a casa e fare qualcosa, risolvere qualcosa assieme.
                    Spettro: Ma io non so come fare, non ho idea di come reagire a queste cose.
                    Spettro: E il Vuoto allora mi dice che sono in debito.
                    Spettro: Che devo essere riconoscente.
                    Spettro: Ma per esserlo devo ascoltare, devo prestare davvero attenzione.
                    Spettro: Fare meno cose, quando l'unica certezza che ho è che il Vuoto è silenzioso solo se continuo a lavorare.

                * * Non hai pensato ai loro sentimenti?
                    ~ abbandono ++
                    Spettro: Beh, gli ho fatto un favore.
                    Spettro: Già sanno che sono inaffidabile, che non rispondo alle chiamate, che arrivo dopo settimane a scrivere un messaggio.
                    Spettro: Almeno così hanno avuto la conferma che sono dimenticabile.
                    Spettro: Ignorabile.
                    Spettro: E la prossima volta faranno senza di me.


                * * Non ti sei fatto solo del male da solo?
                    ~ rabbia ++
                    Spettro: Probabile.
                    Spettro: Ma meglio così che rovinare la festa a tutti, no?
                    Spettro: Chi ha voglia di starsene a tavola con un fantasma piagnone?
                    Spettro: Con un fallimento sociale?
                    Spettro: Io no.
                    Spettro: Non ho nemmeno voglia di restare con me.
                    Spettro: Non capisco perché ci stia tu, quì.

            -

            -> terzo_blocco

    = terzo_blocco
        C'è una cosa ancora che vorrei chiederti, che vorrei capire.
        //Questa cosa ci permette di capire qual è lo stato d'animo emergente.

            * Perché proprio questo ricordo?
                Perché è questa la cosa che continua a bloccarti qui?
                {
                - rabbia > abbandono && rabbia > terrore:
                    Spettro: Perché ora l'unica cosa che rimane è la <b>rabbia</b>, la furia.
                    Spettro: E non so, non ricordo se l'ho mai rivolta contro qualcuno a cui tengo.
                    Spettro: Perché a volte questo vuoto fa così male, che vorrei distruggere tutto.

                - abbandono > rabbia && abbandono > terrore:
                    Spettro: Perché mi sono sentito così vuoto, così solo, così dimenticato.
                    Spettro: E quel vuoto è come un buco nero.
                    Spettro: E non conta cosa è accaduto prima, cosa è venuto dopo.
                    Spettro: So solo che presto o tardi verrò <b>abbandonato</b>.

                - terrore > rabbia && terrore > abbandono:
                    Spettro: Perché avrei voluto parlare del vuoto.
                    Spettro: Ma il vuoto è come un vortice che prende e travolge tutto.
                    Spettro: E l'unica cosa che rimane è il <b>terrore</b> di cosa possa esserci dopo il vuoto.

                - else:
                    Spettro: Perché racconta qualcosa di chi ero.
                    Spettro: Di chi sono stato.
                    Spettro: E di chi poi sono diventato.
                }
            -> riscrittora_storia_uno


=== riscrittora_storia_uno
        Sai, io sono qui per aiutarti a rileggere la tua storia.
        E forse ci sono dei modi diversi di guardare a quello che ti è accaduto.

        //Più abbiamo preso un certo topic di petto, più veniamo premiate? E quindi un punteggio alto in realtà favorisce una certa lettura di sè?
        //Ma se non abbiamo toccato un sentimento, una paura, non abbiamo modo di rileggere quella cosa in quel modo, e allora possiamo solo confermare lo status quo.
        //Arrivo qui con un massimo di 3 punti su un elemento
        Il vuoto ti ha inseguito perché...
        //Mettere qualcosa per far riconoscere che una scelta usa inchiostro e l'altra no.
            - (top1)
                + {rabbia > 0} La tua rabbia:
                  {check_statusVsInchiostro(rabbia, statoInchiostroSpettroUno):
                    - false: Non hai abbastanza inchiostro per questa scelta:
                    -> top1
                  }
                  Dico cose sulla rabbia.
                  ~ statoInchiostroSpettroUno --
                  ~ ferito ++
                + {abbandono > 0} rilettura abbandono:
                    {check_statusVsInchiostro(abbandono,statoInchiostroSpettroUno):
                    - false: Non hai abbastanza inchiostro per questa scelta:
                    -> top1
                  }
                    Dico cose sull'abbandono.
                    ~ statoInchiostroSpettroUno --
                    ~ socievole ++
                + {terrore > 0} rilettura terrore:
                    {check_statusVsInchiostro(terrore,statoInchiostroSpettroUno):
                    - false: Non hai abbastanza inchiostro per questa scelta:
                    -> top1
                  }
                    Dico cose sul terrore.
                    ~ statoInchiostroSpettroUno --
                    ~ consapevole ++
                + {rabbia == 0}conferma rabbia:
                + {abbandono == 0}conferma abbandono:
                + {terrore == 0}conferma terrore:
                + Risposta "neutra", sempre presente.
                -
        E per questo...
            - (top2)
                + {rabbia > 0} La tua rabbia:
                  {check_statusVsInchiostro(rabbia, statoInchiostroSpettroUno):
                    - false: Non hai abbastanza inchiostro per questa scelta:
                    -> top2
                  }
                  Dico cose sulla rabbia.
                  ~ statoInchiostroSpettroUno --
                  ~ ferito ++
                + {abbandono > 0} rilettura abbandono:
                    {check_statusVsInchiostro(abbandono, statoInchiostroSpettroUno):
                    - false: Non hai abbastanza inchiostro per questa scelta:
                    -> top2
                  }
                    Dico cose sull'abbandono.
                    ~ statoInchiostroSpettroUno --
                    ~ socievole ++
                + {terrore > 0} rilettura terrore:
                    {check_statusVsInchiostro(terrore, statoInchiostroSpettroUno):
                    - false: Non hai abbastanza inchiostro per questa scelta:
                    -> top2
                  }
                    Dico cose sul terrore.
                    ~ statoInchiostroSpettroUno --
                    ~ consapevole ++
                + {rabbia == 0}conferma rabbia:
                + {abbandono == 0}conferma abbandono:
                + {terrore == 0}conferma terrore:
                + Risposta "neutra", sempre presente.
                -
        Altra opzione
            - (top3)
                + {rabbia > 0} La tua rabbia:
                  {check_statusVsInchiostro(rabbia, statoInchiostroSpettroUno):
                    - false: Non hai abbastanza inchiostro per questa scelta:
                    -> top3
                  }
                  Dico cose sulla rabbia.
                  ~ statoInchiostroSpettroUno --
                  ~ ferito ++
                + {abbandono > 0} rilettura abbandono:
                    {check_statusVsInchiostro(abbandono, statoInchiostroSpettroUno):
                    - false: Non hai abbastanza inchiostro per questa scelta:
                    -> top3
                  }
                    Dico cose sull'abbandono.
                    ~ statoInchiostroSpettroUno --
                    ~ socievole ++
                + {terrore > 0} rilettura terrore:
                    {check_statusVsInchiostro(terrore, statoInchiostroSpettroUno):
                    - false: Non hai abbastanza inchiostro per questa scelta:
                    -> top3
                  }
                    Dico cose sul terrore.
                    ~ statoInchiostroSpettroUno --
                    ~ consapevole ++
                + {rabbia == 0}conferma rabbia:
                + {abbandono == 0}conferma abbandono:
                + {terrore == 0}conferma terrore:
                + Risposta "neutra", sempre presente.
                -
            -> chi_sono_storia_uno

=== chi_sono_storia_uno

        Spettro: quindi io sono <>
        {
            - rabbia > abbandono:
            {
                - rabbia > terrore:
                {
                    - rabbia > ferito: Spettro: l'Arrabbiato.
                        ~ effettivoStatoSpettroUno = LArrabbiato
                    - else: Spettro: Il Ferito.
                         ~ effettivoStatoSpettroUno = ilFerito
                }
                - else:
                {
                    - terrore > consapevole: Spettro: il Terrorizzato.
                         ~ effettivoStatoSpettroUno = ilTerrorizzato
                    - else: Spettro: Il Consapevole.
                         ~ effettivoStatoSpettroUno = ilConsapevole
                }
            }
            - abbandono > terrore:
                {
                    - terrore > consapevole: Spettro: il Terrorizzato.
                         ~ effettivoStatoSpettroUno = ilTerrorizzato
                    - else: Spettro: il Consapevole.
                         ~ effettivoStatoSpettroUno = ilConsapevole
                }
            - else:
                {
                    - abbandono > socievole: Spettro: l'abbandonato.
                         ~ effettivoStatoSpettroUno = LAbbandonato
                    - else: il Socievole.
                         ~ effettivoStatoSpettroUno = IlSocievole
                }                    
        }

        {effettivoStatoSpettroUno:
            - IlSocievole: Spettro: Ora so che ho bisogno delle altre persone, anche quando la cosa mi fa paura.
            - IlConsapevole: Spettro: Vedo i limiti del mondo che ci circonda, e capisco che queste paure sono figlie di quel sistema.
            - IlFerito: La mia rabbia mi ha aiutato a capire dove si trovano le mie ferite, e ora so cosa affrontare.
            - IlTerrorizzato: Quello che ho dentro è mostruoso, deve rimanere nascosto dagli altri, a qualunque costo.
            - LAbbandonato: Le mie debolezze allontaneranno sempre gli altri. L'unica soluzione è giocare d'anticipo, e far tutto da solo.
            - LArrabbiato: Se questo mondo mi fa male, è mio diritto far male a questo mondo, mordere prima che lui mi morda.
        }
        -
        {
            - eventoSpecialeSpettroUno == true:
                -> evento_speciale
            - else:
                Spettro: E ora posso andarmene in pace.
                ~ storiaUno = Conclusa
                -> main
        }

    = evento_speciale
        Ma visto che mi hai fatto un dono speciale, voglio condividere con te una cosa che ho imparato.
        E ora, me ne vado. Addio.
        ~ storiaUno = Conclusa
        -> main

=== scelta_nome_uno
    + Il Socievole
         ~ effettivoStatoSpettroUno = IlSocievole
    + Il Consapevole
         ~ effettivoStatoSpettroUno = IlConsapevole
    + Il Ferito
         ~ effettivoStatoSpettroUno = IlFerito
    -
~ storiaUno = Conclusa
-> main