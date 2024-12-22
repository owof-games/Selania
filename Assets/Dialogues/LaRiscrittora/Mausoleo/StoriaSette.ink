=== lapide_sette ===
    //Questa struttura per ora è così per il prototipo, poi in fase definitiva ragionerà secondo i tier riportati nella lista appunti
    {
    - storiaDue == Conclusa && storiaTre == Conclusa && storiaQuattro == Conclusa: -> opzioni
    - else: ->not_yet
    }
    
    = opzioni
        //opzione se non hai mai esplorato questa storia, e se non ci sono storie attive
        + {not (storiaSette == InCorso or storiaSette == Conclusa) and not (storiaUno == InCorso or storiaTre == InCorso)} Potresti conoscere la storia della settima lapide, {effettivoStatoSpettroSette}
            -> storia_sette
        
        //opzione se c'è un'altra storia attiva
        + {storiaSei == InCorso or storiaCinque == InCorso or storiaSette == Conclusa} La settima lapide appartiene a {effettivoStatoSpettroSette} -> main
        
        //opzione se questa storia è attiva
        + {storiaSette == InCorso} Il fantasma della settima storia ti attende -> aiuto_storia_sette
        
        + ->
    
        -> DONE
    
    = not_yet
        + Sulla lapide è incisa una sola parola: {effettivoStatoSpettroSette}
            -> lapidi



=== storia_sette ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione
    ~ storiaSette = InCorso
    Ascolti la settima storia
    -> main



=== aiuto_storia_sette ===
    + {doniTrovati != ()} Offro un dono allo spettro
    -> gestione_inventario -> capitolo_uno
    + ->
    {doniTrovati == (): Non parlo senza un dono adeguato! ->hub_mausoleo}
    
    
    
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