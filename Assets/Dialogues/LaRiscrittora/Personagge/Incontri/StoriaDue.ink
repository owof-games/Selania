=== personaggia_due ===
//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(PersonaggiaDue, PG) && storiaDue == InCorso}[PersonaggiaDue]
            -> dialogo_personaggia_due
        
        //Chiacchiera a fine storia
        + {are_two_entities_together(PersonaggiaDue, PG)&& storiaDue == Conclusa} [PersonaggiaDue]
            -> personaggia_due_storia_conclusa
        + ->
    
        -> DONE
    

=== dialogo_personaggia_due ===
//QUI FINISCONO TUTTE LE POSSIBILI CONVERSAZIONI
- (top)
    + Dialogo
    + Dialogo
    + Dono
        -> dono_storia_due
    //QUESTA OPZIONE C'è SOLO DOPO CHE HO FATTO IL DONO
    + {dono_storia_due.esito_inchiostro} Ti va di affrontare quella cosa?
        ->storia_due_chech_trigger
    -
    -> top


//QUESTO è LO SPAZIO PER IL DONO
=== dono_storia_due ===
    + {doniTrovati != ()} Offro un dono allo spettro
    -> gestione_inventario -> esito_inchiostro 
    + ->
    {doniTrovati == (): <i> Il tuo inventario è vuoto </i> ->main}
    

    = esito_inchiostro    
        Dopo il tuo dono, la quantità di inchiostro a disposizione è {statoInchiostroPersonaggiaDue}.
             -> azioniInchiostro -> dialogo_personaggia_due.top
        //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco

=== storia_due_chech_trigger
    {
    - solitudine == false:
        -> trigger_solitudine

    }
    = trigger_solitudine
        * [Voglio comunque approfondire la storia di questa personaggia.]
            -> main_story_personaggia_due
        * [Salto.]
        //FUTURA SOLUZIONE A QUESTA SITUAZIONE
            -> main
    -
    -> END

=== main_story_personaggia_due
    Affronto la storia
-> main
        
=== personaggia_due_storia_conclusa        
        + opzione
        + opzione
        + opzione
        -
    -> main