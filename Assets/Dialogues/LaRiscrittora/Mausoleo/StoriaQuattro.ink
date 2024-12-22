=== lapide_quattro ===
    //Questa struttura per ora è così per il prototipo, poi in fase definitiva ragionerà secondo i tier riportati nella lista appunti
    {
    - storiaUno == Conclusa: -> opzioni
    - else: ->not_yet
    }
    
    = opzioni
        //opzione se non hai mai esplorato questa storia, e se non ci sono storie attive
        + {not (storiaQuattro == InCorso or storiaQuattro == Conclusa) and not (storiaDue == InCorso or storiaTre == InCorso)} Potresti conoscere la storia della quarta lapide, {effettivoStatoSpettroQuattro}
            -> storia_quattro
        
        //opzione se c'è un'altra storia attiva
        + {storiaTre == InCorso or storiaDue == InCorso or storiaQuattro == Conclusa} La quarta lapide appartiene a {effettivoStatoSpettroQuattro} -> main
        
        //opzione se questa storia è attiva
        + {storiaQuattro == InCorso} Il fantasma della quarta storia ti attende -> aiuto_storia_quattro
        
        + ->
    
        -> DONE
    
    = not_yet
        + Sulla lapide è incisa una sola parola: {effettivoStatoSpettroQuattro}
            -> lapidi



=== storia_quattro ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione
    ~ storiaQuattro = InCorso
    Ascolti la quarta storia
    -> main



=== aiuto_storia_quattro ===
    + {doniTrovati != ()} Offro un dono allo spettro
    -> gestione_inventario -> capitolo_uno
    + ->
    {doniTrovati == (): Non parlo senza un dono adeguato! ->hub_mausoleo}
    
    
    
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