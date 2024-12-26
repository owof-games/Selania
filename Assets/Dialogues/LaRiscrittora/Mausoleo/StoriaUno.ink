=== lapide_uno ===
    //opzione se non hai mai esplorato questa storia, e se non ci sono storie attive
    + {contenutoMausoleo has PG && not (storiaUno == InCorso or storiaUno == Conclusa) and not (storiaDue == InCorso or storiaTre == InCorso)}[LapideUno]
        Qui giace {traduttoreSpettri(effettivoStatoSpettroUno)}
        -> intro_storia_uno
    
    //opzione se c'è un'altra storia attiva
    + {contenutoMausoleo has PG && storiaUno == Conclusa} [LapideUno]
        La prima lapide appartiene a {traduttoreSpettri(effettivoStatoSpettroUno)}
        -> main
    
    //opzione se questa storia è attiva
    + {contenutoMausoleo has PG && storiaUno == InCorso} [LapideUno]
    Lo spettro del vuoto ondeggia inquieto accanto alla sua lapide.
        -> doni_storia_uno
    
    + ->
    
    -> main

=== intro_storia_uno ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione
    //In questo primo step quello che succede è che verifichiamo se ci sono trigger problematici per la giocatrice. Le permettiamo di scegliere se andare o meno avanti, e poi abbiamo la presentazione della storia.
    ~ storiaUno = InCorso
    {
    - alcolismo == false:
        -> trigger_alcolismo

    }
    Vuoi ascoltare la sua storia?
        + [Sì]
            -> main
        + [No]
            -> main
    ->->

        = trigger_alcolismo
            Hai segnalato che l'alcool per te è un problema, ed è uno dei temi della storia.
            Puoi decidere se affrontarla comunque, o saltarla.
                * Affronto
                    -> intro
                * Salto
                    -> scelta_nome_uno
                -
                ->->

        = intro  
            Può essere una festa. Un compleanno. Un giorno di giochi. Un festival. Capodanno.
            Possono esserci amici, persone care, persone amate.
            L’unica certezza è che a un certo punto il vuoto mi raggiungerà.
            Dita di ghiaccio nello stomaco, pensieri come cemento, i rumori che si fanno ovattati.
            Solo. Sono solo. Sono inutile, sostituibile, dimenticabile. Bisognoso, instabile. Ferito, e quindi difettoso.
            Dimenticato anche in questa moltitudine.
            Può essere che resti in silenzio, sparendo pian piano, dimenticato.
            Può essere che chieda aiuto, per non venire ascoltato.
            Può essere che la rabbia esploda, e a quel punto verrò allontanato.
            Sono destinato a fingere, ridere, cazzeggiare.
            Ma fingere è faticoso, e quindi comunque a un certo punto il freddo tornerà, e l’unica cosa certa è che presto o tardi rimarrò solo.
            * E qual è il tuo rimpianto?
            -
            Non è ovvio? L’unica soluzione era giocare d’anticipo.

            -> main


=== doni_storia_uno ===
//Qui è la fase di check per i doni, se donarne, quali, o non farlo.
    Il Vuoto: Frase concisa che riassume quanto già detto.
    + {doniTrovati != ()} Forse con un dono adeguato, lo spettro sarà disponibile a parlarti.
        -> gestione_inventario
    + [Ti allontani] -> main
    -
    -> main

    
=== storia_uno
//Una volta che abbiamo fatto il dono, parte la vera e propria storia.
    = capitolo_uno
        //Informativa sullo stato dell'inchiostro.
        <i>Dopo il tuo dono, la quantità di inchiostro a disposizione è {statoInchiostroSpettroUno}.</i>
             -> azioniInchiostro ->
            -> primo_blocco_domande 


    = primo_blocco_domande
    
            * In che senso giocare d’anticipo? (il riccio)
            {statoInchiostroSpettroUno == Vuoto: Non hai abbastanza inchiostro per fare questa domanda. -> primo_blocco_domande}
                ~ statoInchiostroSpettroUno --
                Lo spettro si sente preso in contropiede.    
                <i>Lo stato dell'inchiostro è ora a {statoInchiostroSpettroUno}</i>
                Il Vuoto: cose 
                * * Scelta uno: aumenta riccio
                    ~ riccio ++
                * * Scelta due: aumenta guardiano
                    ~ guardiano ++
            
            * Al fingere: Dover essere qualcuno che non si è (il guardiano)
                Il Vuoto: cose 
                * * Scelta uno: aumenta accentratore
                    ~ accentratore ++
                * * Scelta due: aumenta guardiano
                    ~ guardiano ++
            
            * Per come l’hai messa, sembra tu sia stato circondato da persone egoiste. (l’accentratore)
                Il Vuoto: cose 
                * * Scelta uno: aumenta riccio
                    ~ riccio ++
                * * Scelta due: aumenta accentratore
                    ~ accentratore ++
            -
        -> secondo_blocco_domande
        
        
    = secondo_blocco_domande
        //da settare queste.
            * In merito alle richieste d’aiuto, non è forse tutta una richiesta d’aiuto? Sparire, arrabbiarsi. Questa conversazione?
            {statoInchiostroSpettroUno == Vuoto: Non hai abbastanza inchiostro per fare questa domanda. -> secondo_blocco_domande}
                ~ statoInchiostroSpettroUno --
                Lo spettro si sente preso in contropiede.    
                <i>Lo stato dell'inchiostro è ora a {statoInchiostroSpettroUno}</i>
                Il Vuoto: cose 
                * * Scelta uno: aumenta riccio
                    ~ riccio ++
                * * Scelta due: aumenta guardiano
                    ~ guardiano ++
            
            * All’essere insicuro, difettoso.
                {statoInchiostroSpettroUno == Vuoto: Non hai abbastanza inchiostro per fare questa domanda. -> secondo_blocco_domande}
                ~ statoInchiostroSpettroUno --
                Lo spettro si sente preso in contropiede.    
                <i>Lo stato dell'inchiostro è ora a {statoInchiostroSpettroUno}</i>
                Il Vuoto: cose 
                * * Scelta uno: aumenta accentratore
                    ~ accentratore ++
                * * Scelta due: aumenta guardiano
                    ~ guardiano ++
            
            * Domanda più scarica
                Il Vuoto: cose 
                * * Scelta uno: aumenta riccio
                    ~ riccio ++
                * * Scelta due: aumenta accentratore
                    ~ accentratore ++
            - 
        -> terzo_blocco_domande
        
    = terzo_blocco_domande 
            * In merito al vuoto… Voglia di morire (il riccio)
            {statoInchiostroSpettroUno == Vuoto: Non hai abbastanza inchiostro per fare questa domanda. -> terzo_blocco_domande}
                ~ statoInchiostroSpettroUno --
                Lo spettro si sente preso in contropiede.    
                <i>Lo stato dell'inchiostro è ora a {statoInchiostroSpettroUno}</i>
                Il Vuoto: cose 
                * * Scelta uno: aumenta riccio
                    ~ riccio ++
                * * Scelta uno: aumenta accentratore
                    ~ accentratore ++
            
            * La rabbia… rabbia per nascondere la ferita. (il guardiano)
                {statoInchiostroSpettroUno == Vuoto: Non hai abbastanza inchiostro per fare questa domanda. -> terzo_blocco_domande}
                ~ statoInchiostroSpettroUno --
                Lo spettro si sente preso in contropiede.    
                <i>Lo stato dell'inchiostro è ora a {statoInchiostroSpettroUno}</i>
                Il Vuoto: cose 
                * * Scelta uno: aumenta riccio
                    ~ riccio ++
                * * Scelta due: aumenta guardiano
                    ~ guardiano ++
            
            * Cosa succederebbe se davvero tutti ti dimenticassero? (l’accentratore)
                Il Vuoto: cose 
                * * Scelta due: aumenta guardiano
                    ~ guardiano ++
                * * Scelta due: aumenta accentratore
                    ~ accentratore ++
            -
         -> riscrittora_storia_uno


=== riscrittora_storia_uno
Qui, con una serie di condizioni che poi andremo a tracciare, possiamo riscrivere alcuni aspetti della storia dello spettro.
-> parte_uno
    = parte_uno

    -> parte_due

    = parte_due

    -> parte_tre

    = parte_tre

    -> chi_sono_storia_uno

=== chi_sono_storia_uno
//Qui vediamo se lasciarla con avanzi di inchiostro o meno.
    Il Vuoto: Credo di aver capito cosa intendi, ora.
        {
        
            - accentratore < riccio:
                {
                    - riccio < guardiano: Sono un guardiano. Il vuoto è sempre stato lì, ma tu hai cercato di tenerlo lontano dagli altri.
                        ~ effettivoStatoSpettroUno = IlGuardiano
                    - else: Sono un riccio. Ho avuto così paura di venir abbandonato da solo, che ho giocato d’anticipo.
                        ~ effettivoStatoSpettroUno = IlRiccio
                }
            - accentratore < guardiano: Sono un guardiano. Il vuoto è sempre stato lì, ma tu hai cercato di tenerlo lontano dagli altri.
                        ~ effettivoStatoSpettroUno = IlGuardiano
            - else: Sono un accentratore. Non c’è nulla da riscrivere. Sono stato così concentrato su di me da ignorare chi me circondava, perdendo quelle persone.
                         ~ effettivoStatoSpettroUno = LAccentratore
        
        }
        
        {
            - statoInchiostroSpettroUno == Vuoto: -> finale_uno
            - else: -> finale_due
        }
        

    = finale_due
        * Sì, credo tu abbia ragione.
            -> finale_uno
        * No! Le cose non stanno così!
            
            * * {effettivoStatoSpettroUno == IlGuardiano}
                Non credo tu sia un guardiano.
                * * * Credo tu sia un riccio.
                    {statoInchiostroSpettroUno == Scarso or statoInchiostroSpettroUno == Normale or statoInchiostroSpettroUno == Medio or statoInchiostroSpettroUno ==  Altissimo: Non hai abbastanza inchiostro per convincerlo. -> finale_due}
                    Il Vuoto: Uh, non ci avevo pensato!
                    ~ effettivoStatoSpettroUno = IlRiccio
                    -> finale_uno
                
                * * * Credo tu sia un accentratore.
                    ~ effettivoStatoSpettroUno = LAccentratore
                    -> finale_uno
                
                * * * Ripensandoci, forse hai ragione.
                    -> finale_uno
            
            * * {effettivoStatoSpettroUno == IlRiccio}
                Non credo tu sia un riccio.
                
                * * * Credo tu sia un guardiano.
                {statoInchiostroSpettroUno == Scarso or statoInchiostroSpettroUno == Normale or statoInchiostroSpettroUno == Medio or statoInchiostroSpettroUno ==  Altissimo: Non hai abbastanza inchiostro per convincerlo. -> finale_due}
                Il Vuoto: Uh, dici davvero?
                    ~ effettivoStatoSpettroUno = IlGuardiano
                    -> finale_uno
                
                * * * Credo tu sia un accentratore.
                    ~ effettivoStatoSpettroUno = LAccentratore
                    -> finale_uno
                
                * * * Ripensandoci, forse hai ragione.
                    -> finale_uno
            
            * * {effettivoStatoSpettroUno == LAccentratore}
                Non credo tu sia un accentratore.
                
                * * * Credo tu sia un riccio.
                {statoInchiostroSpettroUno == Scarso or statoInchiostroSpettroUno == Normale or statoInchiostroSpettroUno == Medio or statoInchiostroSpettroUno ==  Altissimo: Non hai abbastanza inchiostro per convincerlo: -> finale_due}
                    ~ effettivoStatoSpettroUno = IlRiccio
                    -> finale_uno
                
                * * *Credo tu sia un guardiano.
                {statoInchiostroSpettroUno == Normale or statoInchiostroSpettroUno == Medio or statoInchiostroSpettroUno ==  Altissimo: Non hai abbastanza inchiostro per convincerlo. -> finale_due}
                    ~ effettivoStatoSpettroUno = IlGuardiano
                    -> finale_uno
                
                * * * Ripensandoci, forse hai ragione.
                    -> finale_uno
            -   
        -> main
        
    = finale_uno
        Il Vuoto: Ora sono pronto ad andarmene.
        {eventoSpecialeSpettroUno: -> evento_speciale}
        Il Vuoto: Addio.
        ~ storiaUno = Conclusa
        -> main
        
TODO: creare un traduttore per gli stati degli spettri come quello dell'inventario (da IlRiccio a Il riccio).    
    = evento_speciale
        Ma visto che mi hai fatto un dono speciale, voglio condividere con te una cosa che ho imparato.
        E ora, me ne vado. Addio.
        ~ storiaUno = Conclusa
        -> main

=== scelta_nome_uno
    + Scelta nome uno
    + Scelta nome due
    + Scelta nome tre
    -
~ storiaUno = Conclusa
->hub_mausoleo