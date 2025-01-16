=== personaggia_due ===
//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(PersonaggiaDue, PG) && storiaDue == InCorso}[PersonaggiaDue]
            -> dialogo_personaggia_due
        
        //Chiacchiera a fine storia
        + {are_two_entities_together(PersonaggiaDue, PG) && storiaDue == Conclusa} [PersonaggiaDue]
            -> personaggia_due_storia_conclusa
        + ->
    
        -> DONE
    

=== dialogo_personaggia_due ===
//QUI FINISCONO TUTTE LE POSSIBILI CONVERSAZIONI
- (top)
    + Dialogo
        -> top
    + Dialogo
        -> top
    + Lasci il dialogo
        -> main
    //Faccio così per questione di ordine
    <- opzioni_dono_e_storia_pg_due
       + {not dono_storia_due.esito_inchiostro} Dono
        -> dono_storia_due
    
    //QUESTA OPZIONE C'è SOLO DOPO CHE HO FATTO IL DONO E NON HO ANCORA AVVIATO LA MAIN STORY
    + {dono_storia_due.esito_inchiostro && not main_story_personaggia_due} Ti va di affrontare quella cosa?
            -> storia_due_chech_trigger
    
    //SE ESCO DALLA MAIN STORY E VOGLIO TORNARCI CLICCO QUI. POI Lì DENTRO IN BASE AGLI STEP IN CUI SIAMO, MI MANDERà AL POSTO GIUSTO            
    + {dono_storia_due.esito_inchiostro && main_story_personaggia_due} Riprendiamo quella storia?     -> main_story_personaggia_due

    -
    -> top


    //QUESTO è LO SPAZIO PER IL DONO
    === dono_storia_due ===
        + {doniTrovati != ()} Offro un dono allo spettro
            -> gestione_inventario -> esito_inchiostro 
        + {doniTrovati == ()} <i> Il tuo inventario è vuoto </i>
            ->main
        
    
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
        Info
            * [Voglio comunque approfondire la storia di questa personaggia.]
                -> main_story_personaggia_due
            * [Salto.]
            //FUTURA SOLUZIONE A QUESTA SITUAZIONE
                -> main
        -
        -> END

=== main_story_personaggia_due
    /* ---------------------------------

   Qui avrò una funzione che mi manda sugli step utili in base a dove ho abbandonato l'ultima conversazione. Es
   {
   - not step_uno:
        -> step_uno
   - not step_due:
        -> step_due
        etc
   }
    
    E quindi poi avrò.
    = step_uno
        Affronto la storia
    = step_due
        Interventi
        etc
 ----------------------------------*/
Storia finita:
        ~ storiaDue = Conclusa
-> main
        


=== personaggia_due_storia_conclusa        
        + opzione
        + opzione
        + opzione
        -
    -> main
    


=== opzioni_dono_e_storia_pg_due
    //LE PROSSIME TRE OPZIONI SI DEVONO ESCLUDERE A VICENDA
    
    //QUESTA OPZIONE C'è FINO A QUANDO NON OFFRO UN DONO    
    + {not dono_storia_due.esito_inchiostro} Dono
        -> dono_storia_due
    
    //QUESTA OPZIONE C'è SOLO DOPO CHE HO FATTO IL DONO E NON HO ANCORA AVVIATO LA MAIN STORY
    + {dono_storia_due.esito_inchiostro && not main_story_personaggia_due} Ti va di affrontare quella cosa?
            -> storia_due_chech_trigger
    
    //SE ESCO DALLA MAIN STORY E VOGLIO TORNARCI CLICCO QUI. POI Lì DENTRO IN BASE AGLI STEP IN CUI SIAMO, MI MANDERà AL POSTO GIUSTO            
    + {dono_storia_due.esito_inchiostro && main_story_personaggia_due} Riprendiamo quella storia?     -> main_story_personaggia_due
