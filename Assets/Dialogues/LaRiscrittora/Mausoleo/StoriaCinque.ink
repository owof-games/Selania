=== lapide_cinque ===
    //Questa struttura per ora è così per il prototipo, poi in fase definitiva ragionerà secondo i tier riportati nella lista appunti
    {
    - storiaDue == Conclusa && storiaTre == Conclusa && storiaQuattro == Conclusa: -> opzioni
    - else: ->not_yet
    }
    
    = opzioni
        //opzione se non hai mai esplorato questa storia, e se non ci sono storie attive
        + {not (storiaCinque == InCorso or storiaCinque == Conclusa) and not (storiaSei == InCorso or storiaSette == InCorso)} Potresti conoscere la storia della quinta lapide, {effettivoStatoSpettroCinque}
            -> storia_cinque
        
        //opzione se c'è un'altra storia attiva
        + {storiaSei == InCorso or storiaSette == InCorso or storiaCinque == Conclusa} La quinta lapide appartiene a {effettivoStatoSpettroCinque} -> main
        
        //opzione se questa storia è attiva
        + {storiaCinque == InCorso} Il fantasma della quinta storia ti attende -> aiuto_storia_cinque
        
        + ->
    
        -> DONE
    
    = not_yet
        + Sulla lapide è incisa una sola parola: {effettivoStatoSpettroCinque}
            -> lapidi



=== storia_cinque ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione
    ~ storiaCinque = InCorso
    Ascolti la quinta storia
    -> main



=== aiuto_storia_cinque ===
    + {doniTrovati != ()} Offro un dono allo spettro
    -> gestione_inventario -> capitolo_uno
    + ->
    {doniTrovati == (): Non parlo senza un dono adeguato! ->hub_mausoleo}
    
    
    
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