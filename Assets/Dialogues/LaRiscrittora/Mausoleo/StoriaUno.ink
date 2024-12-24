=== lapide_uno ===
    //opzione se non hai mai esplorato questa storia, e se non ci sono storie attive
    + {contenutoMausoleo has PG && not (storiaUno == InCorso or storiaUno == Conclusa) and not (storiaDue == InCorso or storiaTre == InCorso)}[LapideUno]
        Qui giace {effettivoStatoSpettroUno}
        -> storia_uno
    
    //opzione se c'è un'altra storia attiva
    + {contenutoMausoleo has PG && storiaUno == Conclusa} [LapideUno]
        La prima lapide appartiene a {effettivoStatoSpettroUno}
        -> main
    
    //opzione se questa storia è attiva
    + {contenutoMausoleo has PG && storiaUno == InCorso} [LapideUno]
    Lo spettro del vuoto ondeggia inquieto accanto alla sua lapide.
        -> aiuto_storia_uno
    
    + ->
    
    -> main

=== storia_uno ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione
    ~ storiaUno = InCorso
    {
    - alcolismo == false:
        -> trigger_alcolismo

    }
    Vuoi ascoltare la sua storia?
        + [Sì]
            -> top
        + [No]
            -> main
            
- (top)    
    Ho freddo, ho tanto freddo.
    Un freddo che non sta fermo.
    Un freddo che è pronto ad esplodere.
    Forse sono io?
    Forse sto per rovinare tutto, di nuovo?
    O forse è il vuoto?
    Lasciami solo.
    Lasciami solo.
    Lasciami solo.
    -> main


= trigger_alcolismo
    Hai segnalato che l'alcool per te è un problema, ed è uno dei temi della storia.
    Puoi decidere se affrontarla comunque, o saltarla.
        * Affronto
            -> top
        * Salto
            -> scelta_nome_uno
        -
->->

=== aiuto_storia_uno ===
    + {doniTrovati != ()} Forse con un dono adeguato, lo spettro sarà disponibile a parlarti.
        -> gestione_inventario
    + [Ti allontani] -> main
    -
    -> main

    //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco
    = capitolo_uno
    <i>Dopo il tuo dono, la quantità di inchiostro a disposizione è {statoInchiostroSpettroUno}.</i>
             -> azioniInchiostro ->
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
    
        -> primo_blocco_domande 


    = primo_blocco_domande         
            * In che senso giocare d’anticipo? (il riccio)
            {statoInchiostroSpettroUno == Vuoto: Non hai abbastanza inchiostro per fare questa domanda. -> primo_blocco_domande}
                ~ statoInchiostroSpettroUno --
                Lo spettro si sente preso in contropiede.    
                Lo stato dell'inchiostro è ora a {statoInchiostroSpettroUno}
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
                Lo stato dell'inchiostro è ora a {statoInchiostroSpettroUno}
                Il Vuoto: cose 
                * * Scelta uno: aumenta riccio
                    ~ riccio ++
                * * Scelta due: aumenta guardiano
                    ~ guardiano ++
            
            * All’essere insicuro, difettoso.
                {statoInchiostroSpettroUno == Vuoto: Non hai abbastanza inchiostro per fare questa domanda. -> secondo_blocco_domande}
                ~ statoInchiostroSpettroUno --
                Lo spettro si sente preso in contropiede.    
                Lo stato dell'inchiostro è ora a {statoInchiostroSpettroUno}
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
                Lo stato dell'inchiostro è ora a {statoInchiostroSpettroUno}
                Il Vuoto: cose 
                * * Scelta uno: aumenta riccio
                    ~ riccio ++
                * * Scelta uno: aumenta accentratore
                    ~ accentratore ++
            
            * La rabbia… rabbia per nascondere la ferita. (il guardiano)
                {statoInchiostroSpettroUno == Vuoto: Non hai abbastanza inchiostro per fare questa domanda. -> terzo_blocco_domande}
                ~ statoInchiostroSpettroUno --
                Lo spettro si sente preso in contropiede.    
                Lo stato dell'inchiostro è ora a {statoInchiostroSpettroUno}
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
         -> chi_sono
    /*
    VAR riccio = 0
    VAR guardiano = 0
    VAR accentratore = 0 
*/ 
     
     = chi_sono
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
                * * * {statoInchiostroSpettroUno == Scarso or statoInchiostroSpettroUno == Normale or statoInchiostroSpettroUno == Medio or statoInchiostroSpettroUno ==  Altissimo} Credo tu sia un riccio.
                    ~ effettivoStatoSpettroUno = IlRiccio
                    -> finale_uno
                
                * * * Credo tu sia un accentratore.
                    ~ effettivoStatoSpettroUno = LAccentratore
                    -> finale_uno
                
                * * * Ripensandoci, forse hai ragione.
                    -> finale_uno
            
            * * {effettivoStatoSpettroUno == IlRiccio}
                Non credo tu sia un riccio.
                
                * * * {statoInchiostroSpettroUno == Scarso or statoInchiostroSpettroUno == Normale or statoInchiostroSpettroUno == Medio or statoInchiostroSpettroUno ==  Altissimo} Credo tu sia un guardiano.
                    ~ effettivoStatoSpettroUno = IlGuardiano
                    -> finale_uno
                
                * * * Credo tu sia un accentratore.
                    ~ effettivoStatoSpettroUno = LAccentratore
                    -> finale_uno
                
                * * * Ripensandoci, forse hai ragione.
                    -> finale_uno
            
            * * {effettivoStatoSpettroUno == LAccentratore}
                Non credo tu sia un accentratore.
                
                * * * {statoInchiostroSpettroUno == Scarso or statoInchiostroSpettroUno == Normale or statoInchiostroSpettroUno == Medio or statoInchiostroSpettroUno ==  Altissimo} Credo tu sia un riccio.
                    ~ effettivoStatoSpettroUno = IlRiccio
                    -> finale_uno
                
                * * * {statoInchiostroSpettroUno == Normale or statoInchiostroSpettroUno == Medio or statoInchiostroSpettroUno ==  Altissimo}Credo tu sia un guardiano.
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