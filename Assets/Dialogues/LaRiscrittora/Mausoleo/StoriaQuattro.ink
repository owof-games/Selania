=== lapide_quattro ===
    //Questa struttura per ora è così per il prototipo, poi in fase definitiva ragionerà secondo i tier riportati nella lista appunti
    {
    - storiaUno == Conclusa:
    -> opzioni
    - else:
    ->not_yet
    }
    
    = opzioni
        //opzione se non hai mai esplorato questa storia, e se non ci sono storie attive
        + {contenutoMausoleo has PG && not (storiaQuattro == InCorso or storiaQuattro == Conclusa) and not (storiaDue == InCorso or storiaTre == InCorso)} [LapideQuattro]
            Potresti conoscere la storia della quarta lapide, {traduttoreSpettri(effettivoStatoSpettroQuattro)}
            -> storia_quattro
        
        //opzione se c'è un'altra storia attiva
        + {contenutoMausoleo has PG && storiaTre == InCorso or storiaDue == InCorso or storiaQuattro == Conclusa} [LapideQuattro]
            La quarta lapide appartiene a {traduttoreSpettri(effettivoStatoSpettroQuattro)}
        -> main
        
        //opzione se questa storia è attiva
        + {contenutoMausoleo has PG && storiaQuattro == InCorso} [LapideQuattro]
        {traduttoreSpettri(effettivoStatoSpettroQuattro)} ti attende
        -> aiuto_storia_quattro
        
        + ->
    
        -> DONE
    
    = not_yet
        + {contenutoMausoleo has PG} [LapideQuattro]
        Sulla lapide è incisa una sola parola: {traduttoreSpettri(effettivoStatoSpettroQuattro)}
            -> main



=== storia_quattro ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione

        <i>Vuoi ascoltare la sua storia?</i>
        + [Sì]
        ~ storiaQuattro = InCorso            
            -> aiuto_storia_quattro
        + [No]
            -> main
    ->-> 



=== aiuto_storia_quattro ===
    + {doniTrovati != ()} Offro un dono allo spettro
    -> gestione_inventario -> capitolo_uno
    + ->
    {doniTrovati == (): Non parlo senza un dono adeguato! ->main}
    
    
    
    = capitolo_uno    
        Dopo il tuo dono, la quantità di inchiostro a disposizione è {statoInchiostroSpettroQuattro}.
             -> azioniInchiostro ->
        //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco
             + Ho risolto la quarta storia dando al quarto spettro un nuovo stato
                ~ storiaQuattro = Conclusa
                ~ effettivoStatoSpettroQuattro = NuovoStatoUnoQuattro
             + Non ho risolto la storia
             -
        -> main