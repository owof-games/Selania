=== personaggia_due ===

        //Chiacchiera normale
        + {are_two_entities_together(PersonaggiaDue, PG) && storiaDue == InCorso}[PersonaggiaDue]
        -> storia_due
        
        //Chiacchiera a fine storia
        + {are_two_entities_together(PersonaggiaDue, PG)&& storiaDue == Conclusa} [PersonaggiaDue]
        -> personaggia_due_storia_conclusa
        + ->
    
        -> DONE
    


=== storia_due ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione
        <i>Vuoi ascoltare la sua storia?</i>
        + [Sì]
            ~ storiaDue = InCorso
            -> aiuto_storia_due
        + [No]
            -> main
    ->-> 



=== aiuto_storia_due ===
    + {doniTrovati != ()} Offro un dono allo spettro
    -> gestione_inventario -> capitolo_uno
    + ->
    {doniTrovati == (): Non parlo senza un dono adeguato! ->main}
    
    
    
    = capitolo_uno    
        Dopo il tuo dono, la quantità di inchiostro a disposizione è {statoInchiostroPersonaggiaDue}.
             -> azioniInchiostro ->
        //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco
             + Ho risolto la seconda storia dando al secondo spettro il secondo stato
                ~ storiaDue = Conclusa
                ~ effettivoStatoPersonaggiaDue = NuovoStatoUnoDue
             + Non ho risolto la storia
             -
        -> main
        
=== personaggia_due_storia_conclusa        
        + opzione
        + opzione
        + opzione
        -
    -> main