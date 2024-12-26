=== lapide_sei ===
    //Questa struttura per ora è così per il prototipo, poi in fase definitiva ragionerà secondo i tier riportati nella lista appunti
    {
    - storiaDue == Conclusa && storiaTre == Conclusa && storiaQuattro == Conclusa:
    -> opzioni
    - else:
    ->not_yet
    }
    
    = opzioni
        //opzione se non hai mai esplorato questa storia, e se non ci sono storie attive
        + {contenutoMausoleo has PG && not (storiaSei == InCorso or storiaSei == Conclusa) and not (storiaSette == InCorso or storiaCinque == InCorso)} [LapideSei]
        Potresti conoscere la storia della sesta lapide, {traduttoreSpettri(effettivoStatoSpettroSei)}
            -> storia_sei
        
        //opzione se c'è un'altra storia attiva
        + {contenutoMausoleo has PG && storiaCinque == InCorso or storiaSette == InCorso or storiaSei == Conclusa} [LapideSei]
        La sesta lapide appartiene a {traduttoreSpettri(effettivoStatoSpettroSei)}
        -> main
        
        //opzione se questa storia è attiva
        + {contenutoMausoleo has PG && storiaSei== InCorso} [LapideSei]
        {traduttoreSpettri(effettivoStatoSpettroSei)} ti attende
        -> aiuto_storia_sei
        
        + ->
    
        -> DONE
    
    = not_yet
        + {contenutoMausoleo has PG} [LapideSei]
        Sulla lapide è incisa una sola parola: {traduttoreSpettri(effettivoStatoSpettroSei)}
            -> main



=== storia_sei ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione

        <i>Vuoi ascoltare la sua storia?</i>
        + [Sì]
        ~ storiaSei = InCorso        
            -> aiuto_storia_sei
        + [No]
            -> main
    ->-> 



=== aiuto_storia_sei ===
    + {doniTrovati != ()} Offro un dono allo spettro
    -> gestione_inventario -> capitolo_uno
    + ->
    {doniTrovati == (): Non parlo senza un dono adeguato! ->main}
    
    
    
    = capitolo_uno    
        Dopo il tuo dono, la quantità di inchiostro a disposizione è {statoInchiostroSpettroSei}.
             -> azioniInchiostro ->
        //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco
             + Ho risolto la sesta storia dando al sesto spettro un nuovo stato
                ~ storiaSei = Conclusa
                ~ effettivoStatoSpettroSei = NuovoStatoUnoSei
             + Non ho risolto la storia
             -
        -> main