=== personaggio_sette ===
    //Questa struttura per ora è così per il prototipo, poi in fase definitiva ragionerà secondo i tier riportati nella lista appunti
    {
    - storiaDue == Conclusa && storiaTre == Conclusa && storiaQuattro == Conclusa:
    -> opzioni
    - else:
    ->not_yet
    }
    
    = opzioni
        //opzione se non hai mai esplorato questa storia, e se non ci sono storie attive
        + {are_two_entities_together(LapideSette, PG) && not (storiaSette == InCorso or storiaSette == Conclusa) and not (storiaUno == InCorso or storiaTre == InCorso)} [LapideSette]
        Potresti conoscere la storia della settima lapide, {traduttoreSpettri(effettivoStatoSpettroSette)}
            -> storia_sette
        
        //opzione se c'è un'altra storia attiva
        + {are_two_entities_together(LapideSette, PG) && storiaSei == InCorso or storiaCinque == InCorso or storiaSette == Conclusa} [LapideSette]
        La settima lapide appartiene a {traduttoreSpettri(effettivoStatoSpettroSette)}
        -> main
        
        //opzione se questa storia è attiva
        + {are_two_entities_together(SpettroSette, PG) && storiaSette == InCorso} [SpettroSette]
        {traduttoreSpettri(effettivoStatoSpettroSette)} ti attende
        -> aiuto_storia_sette
        
        + ->
    
        -> DONE
    
    = not_yet
        + {are_two_entities_together(LapideSette, PG)} [LapideSette]
        Sulla lapide è incisa una sola parola: {traduttoreSpettri(effettivoStatoSpettroSette)}
            -> main



=== storia_sette ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione

        <i>Vuoi ascoltare la sua storia?</i>
        + [Sì]
        ~ storiaSette = InCorso        
            -> aiuto_storia_sette
        + [No]
            -> main
    ->-> 



=== aiuto_storia_sette ===
    + {doniTrovati != ()} Offro un dono allo spettro
    -> gestione_inventario -> capitolo_uno
    + ->
    {doniTrovati == (): Non parlo senza un dono adeguato! ->main}
    
    
    
    = capitolo_uno    
        Dopo il tuo dono, la quantità di inchiostro a disposizione è {statoInchiostroSpettroSette}.
             -> azioniInchiostro ->
        //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco
             + Ho risolto la settima storia dando al settimo spettro un nuovo stato
                ~ storiaSette = Conclusa
                ~ effettivoStatoSpettroSette = NuovoStatoUnoSette
             + Non ho risolto la storia
             -
        -> main