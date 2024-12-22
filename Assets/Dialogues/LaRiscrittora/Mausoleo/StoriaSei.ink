=== lapide_sei ===
    //Questa struttura per ora è così per il prototipo, poi in fase definitiva ragionerà secondo i tier riportati nella lista appunti
    {
    - storiaDue == Conclusa && storiaTre == Conclusa && storiaQuattro == Conclusa: -> opzioni
    - else: ->not_yet
    }
    
    = opzioni
        //opzione se non hai mai esplorato questa storia, e se non ci sono storie attive
        + {not (storiaSei == InCorso or storiaSei == Conclusa) and not (storiaSette == InCorso or storiaCinque == InCorso)} Potresti conoscere la storia della sesta lapide, {effettivoStatoSpettroSei}
            -> storia_sei
        
        //opzione se c'è un'altra storia attiva
        + {storiaCinque == InCorso or storiaSette == InCorso or storiaSei == Conclusa} La sesta lapide appartiene a {effettivoStatoSpettroSei} -> main
        
        //opzione se questa storia è attiva
        + {storiaSei== InCorso} Il fantasma della sesta storia ti attende -> aiuto_storia_sei
        
        + ->
    
        -> DONE
    
    = not_yet
        + Sulla lapide è incisa una sola parola: {effettivoStatoSpettroSei}
            -> lapidi



=== storia_sei ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione
    ~ storiaSei = InCorso
    Ascolti la sesta storia
    -> main



=== aiuto_storia_sei ===
    + {doniTrovati != ()} Offro un dono allo spettro
    -> gestione_inventario -> capitolo_uno
    + ->
    {doniTrovati == (): Non parlo senza un dono adeguato! ->hub_mausoleo}
    
    
    
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