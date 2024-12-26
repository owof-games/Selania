=== lapide_due ===
    //Questa struttura per ora è così per il prototipo, poi in fase definitiva ragionerà secondo i tier riportati nella lista appunti
    {
    - storiaUno == Conclusa:
    -> opzioni
    - else:
    ->not_yet
    }
    
    = opzioni
        //opzione se non hai mai esplorato questa storia, e se non ci sono storie attive
        + {contenutoMausoleo has PG && not (storiaDue == InCorso or storiaDue == Conclusa) and not (storiaQuattro == InCorso or storiaTre == InCorso)} [LapideDue]
            Potresti conoscere la storia della seconda lapide, {traduttoreSpettri(effettivoStatoSpettroDue)}
            -> storia_due
        
        //opzione se c'è un'altra storia attiva
        + {contenutoMausoleo has PG && storiaTre == InCorso or storiaQuattro == InCorso or storiaDue == Conclusa}[LapideDue]
            La seconda lapide appartiene a {traduttoreSpettri(effettivoStatoSpettroDue)}
        -> main
        
        //opzione se questa storia è attiva
        + {contenutoMausoleo has PG && storiaDue == InCorso} [LapideDue]
            {traduttoreSpettri(effettivoStatoSpettroDue)} ti attende 
        -> aiuto_storia_due
        
        + ->
    
        -> DONE
    
    = not_yet
        + {contenutoMausoleo has PG} [LapideDue]
        Sulla lapide è incisa una sola parola: {traduttoreSpettri(effettivoStatoSpettroDue)}
            -> main



=== storia_due ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione
        <i>Vuoi ascoltare la sua storia?</i>
        + [Sì]
            ~ storiaDue = InCorso
            -> aiuto_storia_due
        + [No]
            -> main
    ->-> 



=== aiuto_storia_due ===
    + {doniTrovati != ()} Offro un dono allo spettro
    -> gestione_inventario -> capitolo_uno
    + ->
    {doniTrovati == (): Non parlo senza un dono adeguato! ->main}
    
    
    
    = capitolo_uno    
        Dopo il tuo dono, la quantità di inchiostro a disposizione è {statoInchiostroSpettroDue}.
             -> azioniInchiostro ->
        //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco
             + Ho risolto la seconda storia dando al secondo spettro il secondo stato
                ~ storiaDue = Conclusa
                ~ effettivoStatoSpettroDue = NuovoStatoUnoDue
             + Non ho risolto la storia
             -
        -> main