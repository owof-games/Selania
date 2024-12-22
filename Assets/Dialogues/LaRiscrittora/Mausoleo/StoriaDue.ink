=== lapide_due ===
    //Questa struttura per ora è così per il prototipo, poi in fase definitiva ragionerà secondo i tier riportati nella lista appunti
    {
    - storiaUno == Conclusa: -> opzioni
    - else: ->not_yet
    }
    
    = opzioni
        //opzione se non hai mai esplorato questa storia, e se non ci sono storie attive
        + {not (storiaDue == InCorso or storiaDue == Conclusa) and not (storiaQuattro == InCorso or storiaTre == InCorso)} Potresti conoscere la storia della seconda lapide, {effettivoStatoSpettroDue}
            -> storia_due
        
        //opzione se c'è un'altra storia attiva
        + {storiaTre == InCorso or storiaQuattro == InCorso or storiaDue == Conclusa} La seconda lapide appartiene a {effettivoStatoSpettroDue} -> main
        
        //opzione se questa storia è attiva
        + {storiaDue == InCorso} Il fantasma della seconda storia ti attende -> aiuto_storia_due
        
        + ->
    
        -> DONE
    
    = not_yet
        + Sulla lapide è incisa una sola parola: {effettivoStatoSpettroDue}
            -> lapidi



=== storia_due ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione
    ~ storiaDue = InCorso
    Ascolti la seconda storia
    -> main



=== aiuto_storia_due ===
    + {doniTrovati != ()} Offro un dono allo spettro
    -> gestione_inventario -> capitolo_uno
    + ->
    {doniTrovati == (): Non parlo senza un dono adeguato! ->hub_mausoleo}
    
    
    
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