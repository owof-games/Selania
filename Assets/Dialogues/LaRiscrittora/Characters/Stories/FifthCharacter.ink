~ temp charNameCinque= traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaCinque)

=== personaggia_cinque ===
        //opzione se questa storia è attiva
        + {are_two_entities_together(FifthCharacter, PG) && storiaCinque == InCorso} [FifthCharacter]
                -> storia_cinque
        
        //opzione se c'è un'altra storia attiva
        + {are_two_entities_together(FifthCharacter, PG) && storiaCinque == Conclusa}[FifthCharacter]
                -> personaggia_cinque_storia_conclusa
                
        + ->
    
        -> DONE


=== storia_cinque ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione

        <i>Vuoi ascoltare la sua storia?</i>
        + [Sì]
            ~ storiaCinque = InCorso        
            -> aiuto_storia_cinque
        + [No]
            -> main
    ->-> 


=== aiuto_storia_cinque ===
    + {doniTrovati != ()} Offro un dono.
    -> gestione_inventario -> capitolo_uno
    + ->
    {doniTrovati == (): Non parlo senza un dono adeguato! ->main}
    
    
    
    = capitolo_uno    
        Dopo il tuo dono, la quantità di inchiostro a disposizione è {statoInchiostroPersonaggiaCinque}.
             -> azioniInchiostro ->
        //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco
             + Ho risolto la quinta storia dando al quinto spettro un nuovo stato
                ~ storiaCinque = Conclusa
                ~ effettivoStatoPersonaggiaCinque = NuovoStatoUnoCinque
             + Non ho risolto la storia
             -
        -> main
        
=== personaggia_cinque_storia_conclusa        
        + opzione
        + opzione
        + opzione
        -
    -> main            