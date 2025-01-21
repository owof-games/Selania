~ temp charNameQuattro = traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaQuattro)

=== personaggia_quattro ===
        //opzione se c'è un'altra storia attiva
        + {are_two_entities_together(FourthCharacter, PG) && storiaQuattro == InCorso} [FourthCharacter]
            -> storia_quattro
        
        //opzione se questa storia è attiva
        + {are_two_entities_together(FourthCharacter, PG) && storiaQuattro == Conclusa} [FourthCharacter]
            -> personaggia_quattro_storia_conclusa
        
        + ->
    
        -> DONE



=== storia_quattro ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione

        <i>Vuoi ascoltare la sua storia?</i>
        + [Sì]
        ~ storiaQuattro = InCorso            
            -> aiuto_storia_quattro
        + [No]
            -> main
    ->-> 



=== aiuto_storia_quattro ===
    + {doniTrovati != ()} Offro un dono.
    -> gestione_inventario -> capitolo_uno
    + ->
    {doniTrovati == (): Non parlo senza un dono adeguato! ->main}
    
    
    
    = capitolo_uno    
        Dopo il tuo dono, la quantità di inchiostro a disposizione è {statoInchiostroPersonaggiaQuattro}.
             -> azioniInchiostro ->
        //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco
             + Ho risolto la quarta storia dando al quarto spettro un nuovo stato
                ~ storiaQuattro = Conclusa
                ~ effettivoStatoPersonaggiaQuattro = NuovoStatoUnoQuattro
             + Non ho risolto la storia
             -
        -> main

=== personaggia_quattro_storia_conclusa        
        + opzione
        + opzione
        + opzione
        -
    -> main            