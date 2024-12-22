=== lapide_tre ===
    //Questa struttura per ora è così per il prototipo, poi in fase definitiva ragionerà secondo i tier riportati nella lista appunti
    {
    - storiaUno == Conclusa: -> opzioni
    - else: ->not_yet
    }

    = opzioni
        //opzione se non hai mai esplorato questa storia, e se non ci sono storie attive
        + {not (storiaTre == InCorso or storiaTre == Conclusa) and not (storiaDue == InCorso or storiaQuattro == InCorso)} Potresti conoscere la storia della terza lapide, {effettivoStatoSpettroTre}
            -> storia_tre
        
        //opzione se c'è un'altra storia attiva
        + {storiaDue == InCorso or storiaQuattro == InCorso or storiaTre == Conclusa} La terza lapide, appartenente a {effettivoStatoSpettroTre} -> main
        
        //opzione se questa storia è attiva
        + {storiaTre == InCorso} Il fantasma della terza storia ti attende -> aiuto_storia_tre
        
        + ->
        
        -> DONE
    
    = not_yet
        + Sulla lapide è incisa una sola parola: {effettivoStatoSpettroTre}
            -> lapidi
        
        
=== storia_tre ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione
    ~ storiaTre = InCorso
    Ascolti la terza storia
    -> main



=== aiuto_storia_tre ===
    + {doniTrovati != ()} Offro un dono allo spettro
        -> gestione_inventario -> capitolo_uno
        + ->
    {doniTrovati == (): Non parlo senza un dono adeguato! ->hub_mausoleo}
    
    
    = capitolo_uno
        Dopo il tuo dono, la quantità di inchiostro a disposizione è {statoInchiostroSpettroTre}.
             -> azioniInchiostro ->
        //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco
             + Ho risolto la terza storia dando allo spettro lo stato tre
                ~ storiaTre = Conclusa
                ~ effettivoStatoSpettroTre = NuovoStatoTreTre
             + Non ho risolto la storia
             -
        -> main