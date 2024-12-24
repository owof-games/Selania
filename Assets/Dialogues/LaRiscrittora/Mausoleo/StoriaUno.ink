=== lapide_uno ===
    //opzione se non hai mai esplorato questa storia, e se non ci sono storie attive
    + {contenutoMausoleo has PG && not (storiaUno == InCorso or storiaUno == Conclusa) and not (storiaDue == InCorso or storiaTre == InCorso)}[LapideUno]
        Potresti conoscere la storia della prima lapide, {effettivoStatoSpettroUno}
        -> storia_uno
    
    //opzione se c'è un'altra storia attiva
    + {contenutoMausoleo has PG && storiaUno == Conclusa} [LapideUno]
        La prima lapide appartiene a {effettivoStatoSpettroUno}
        -> main
    
    //opzione se questa storia è attiva
    + {contenutoMausoleo has PG && storiaUno == InCorso} [LapideUno]
    Il fantasma della prima storia ti attende
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
- (top)    
    Ascolti la prima storia
    E ti presenti
    -> il_mio_nome ->
    -> assegnazione_genere ->
    -> main


= trigger_alcolismo
    Hai segnalato che l'alcool per te è un problema, ed è uno dei temi della storia.
    Puoi decidere se affrontarla comunque, o saltarla.
        + Affronto
            -> top
        + Salto
            -> scelta_nome_uno
        -
->->

=== aiuto_storia_uno ===
    + {doniTrovati != ()} Offri un dono allo spettro e inizi la sua storia
        -> gestione_inventario -> capitolo_uno
    + ->
    {doniTrovati == (): Non parlo senza un dono adeguato!->main}       


    //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco
    = capitolo_uno
        Dopo il tuo dono, la quantità di inchiostro a disposizione è {statoInchiostroSpettroUno}.
             -> azioniInchiostro ->
             
            + {statoInchiostroSpettroUno != Vuoto} Posso compiere una azione speciale, che mi costerà tot inchiostro
                ~ statoInchiostroSpettroUno --
                Lo stato dell'inchiostro è ora a {statoInchiostroSpettroUno}
            + {statoInchiostroSpettroUno == Vuoto} Non posso più compiere azioni speciali
            + Domanda generica, senza impegno di inchiostro
            -
            Dico cose varie
            + {statoInchiostroSpettroUno!= Vuoto} Posso compiere una azione speciale, che mi costerà tot inchiostro
                ~ statoInchiostroSpettroUno --
                Lo stato dell'inchiostro è ora a {statoInchiostroSpettroUno}
            + {statoInchiostroSpettroUno == Vuoto} Non posso più compiere azioni speciali
            + Domanda generica, senza impegno di inchiostro
            - 
            Dico altre cose varie
            + {statoInchiostroSpettroUno!= Vuoto} Posso compiere una azione speciale, che mi costerà tot inchiostro
                ~ statoInchiostroSpettroUno --
                Lo stato dell'inchiostro è ora a {statoInchiostroSpettroUno}
            + {statoInchiostroSpettroUno == Vuoto} Non posso più compiere azioni speciali
            + Domanda generica, senza impegno di inchiostro
            -
            Finisco coi finali (che saranno dettati dalle scelte, non opzioni come ora)
         -> finali
     
     = finali    
            + Ho risolto la prima storia e attribuito allo spettro il primo nuovo stato
                ~ storiaUno = Conclusa
                ~ effettivoStatoSpettroUno = IlRiccio
            + Ho risolto la prima storia e attribuito allo spettro il secondo nuovo stato
                ~ storiaUno = Conclusa
                ~ effettivoStatoSpettroUno = IlGuardiano
            + Ho risolto la prima storia e attribuito allo spettro il secondo nuovo stato
                ~ storiaUno = Conclusa
                ~ effettivoStatoSpettroUno = LAccentratore
            + {eventoSpecialeSpettroUno} Tastino perché hai sbloccato l'evento speciale
                -> evento_speciale
            + Non ho risolto la storia
            -
        -> main

TODO: creare un traduttore per gli stati degli spettri come quello dell'inventario (da IlRiccio a Il riccio).    
    = evento_speciale
        Sei finita nell'evento speciale
        ~ storiaUno = Conclusa
        -> main

=== scelta_nome_uno
    + Scelta nome uno
    + Scelta nome due
    + Scelta nome tre
    -
~ storiaUno = Conclusa
->hub_mausoleo