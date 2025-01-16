=== personaggia_sette ===
         //opzione se questa storia è attiva
        + {are_two_entities_together(PersonaggiaSette, PG) && storiaSette == InCorso} [PersonaggiaSette]
                -> storia_sei
        
        //opzione se c'è un'altra storia attiva
        + {are_two_entities_together(PersonaggiaSette, PG) && storiaSette == Conclusa}[PersonaggiaSette]
                -> personaggia_sette_storia_conclusa
                
        + ->
    
        -> DONE
    
    = not_yet
        + {are_two_entities_together(LapideSette, PG)} [LapideSette]
        Sulla lapide è incisa una sola parola: {traduttoreSpettri(effettivoStatoPersonaggiaSette)}
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
        Dopo il tuo dono, la quantità di inchiostro a disposizione è {statoInchiostroPersonaggiaSette}.
             -> azioniInchiostro ->
        //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco
             + Ho risolto la settima storia dando al settimo spettro un nuovo stato
                ~ storiaSette = Conclusa
                ~ effettivoStatoPersonaggiaSette = NuovoStatoUnoSette
             + Non ho risolto la storia
             -
        -> main
        
=== personaggia_sette_storia_conclusa        
        + opzione
        + opzione
        + opzione
        -
    -> main           