=== personaggio_cinque ===
    //Questa struttura per ora è così per il prototipo, poi in fase definitiva ragionerà secondo i tier riportati nella lista appunti
    {
    - storiaDue == Conclusa && storiaTre == Conclusa && storiaQuattro == Conclusa:
    -> opzioni
    - else:
    ->not_yet
    }
    
    = opzioni
        //opzione se non hai mai esplorato questa storia, e se non ci sono storie attive
        + {are_two_entities_together(LapideCinque, PG) && not (storiaCinque == InCorso or storiaCinque == Conclusa) and not (storiaSei == InCorso or storiaSette == InCorso)} [LapideCinque]
            Potresti conoscere la storia della quinta lapide, {traduttoreSpettri(effettivoStatoSpettroCinque)}
            -> storia_cinque
        
        //opzione se c'è un'altra storia attiva
        + {are_two_entities_together(LapideCinque, PG) && storiaSei == InCorso or storiaSette == InCorso or storiaCinque == Conclusa}[LapideCinque]
        La quinta lapide appartiene a {traduttoreSpettri(effettivoStatoSpettroCinque)}
        -> main
        
        //opzione se questa storia è attiva
        + {are_two_entities_together(SpettroCinque, PG) && storiaCinque == InCorso} [SpettroCinque]
        {traduttoreSpettri(effettivoStatoSpettroCinque)} ti attende
        -> aiuto_storia_cinque
        
        + ->
    
        -> DONE
    
    = not_yet
        + {are_two_entities_together(LapideCinque, PG)}  [LapideCinque]
        Sulla lapide è incisa una sola parola: {traduttoreSpettri(effettivoStatoSpettroCinque)}
            -> main



=== storia_cinque ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione

        <i>Vuoi ascoltare la sua storia?</i>
        + [Sì]
            ~ storiaCinque = InCorso        
            -> aiuto_storia_cinque
        + [No]
            -> main
    ->-> 


=== aiuto_storia_cinque ===
    + {doniTrovati != ()} Offro un dono allo spettro
    -> gestione_inventario -> capitolo_uno
    + ->
    {doniTrovati == (): Non parlo senza un dono adeguato! ->main}
    
    
    
    = capitolo_uno    
        Dopo il tuo dono, la quantità di inchiostro a disposizione è {statoInchiostroSpettroCinque}.
             -> azioniInchiostro ->
        //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco
             + Ho risolto la quinta storia dando al quinto spettro un nuovo stato
                ~ storiaCinque = Conclusa
                ~ effettivoStatoSpettroCinque = NuovoStatoUnoCinque
             + Non ho risolto la storia
             -
        -> main