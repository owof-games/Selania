=== personaggia_tre ===

        + {are_two_entities_together(PersonaggiaTre, PG) && storiaTre == InCorso} [PersonaggiaTre]
                -> storia_tre
        
        //opzione se questa storia è attiva
        + {are_two_entities_together(PersonaggiaTre, PG) && storiaTre == Conclusa} [PersonaggiaTre]
                -> personaggia_tre_storia_conclusa
        
        + ->
        
        -> DONE
    

=== storia_tre ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione

        <i>Vuoi ascoltare la sua storia?</i>
        + [Sì]
            ~ storiaTre = InCorso
            -> aiuto_storia_tre
        + [No]
            -> main
    ->-> 



=== aiuto_storia_tre ===
    + {doniTrovati != ()} Offro un dono allo spettro
        -> gestione_inventario -> capitolo_uno
        + ->
    {doniTrovati == (): Non parlo senza un dono adeguato! ->main}
    
    
    = capitolo_uno
        Dopo il tuo dono, la quantità di inchiostro a disposizione è {statoInchiostroPersonaggiaTre}.
             -> azioniInchiostro ->
        //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco
             + Ho risolto la terza storia dando allo spettro lo stato tre
                ~ storiaTre = Conclusa
                ~ effettivoStatoPersonaggiaTre = NuovoStatoTreTre
             + Non ho risolto la storia
             -
        -> main
        
=== personaggia_tre_storia_conclusa        
        + opzione
        + opzione
        + opzione
        -
    -> main        