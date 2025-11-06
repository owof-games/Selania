=== nest ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
//Qui Oven avrà solo una funzione di animazione, non serve che ci interagiamo

    {debug: <i>La lista degli oggetti nella stanza è: {nestContents}.}
    {debug: <i>La lista degli oggetti nel deposito è: {safekeepingContents}.}
    
        {
            - bookContents hasnt NestRecap:
            ~ move_entity(NestRecap, BookPlace)
        }

    {nest == 1:Frase sul nido.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}

    ~ arrivingFrom = Nest
    -> main




=== nest_object
{nestDebug: passo per emotional_inventory_management.}
    + {are_two_entities_together(ELManagement, PG)}[ELManagement]
    -> emotional_inventory_management




=== emotional_inventory_management
//Ogni volta che scopriamo una nuova parola, possiamo ignorarla, aggiungerla all'inventario, sostituire una parola dell'inventario con questa
//Qui è dove aggiungiamo, togliamo, limitiamo l'uso delle parole emozionali. Avremo:
    Cosa desidera fare {name}?#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
    
    //Se ho almeno una parola
    + {ownedEmotionalWords != ()} [Cosa ho nell'inventario?]
            Hai con te {generic_list_with_commas(ownedEmotionalWords, -> emotional_words_translator)}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> emotional_inventory_management

    //Se ho appena scoperto una nuova parola e voglio aggiungerla:
    + {newlyDiscoveredEmotionalWord != ()} [Aggiungo {newlyDiscoveredEmotionalWord} all'inventario.]
        
        {
            - takenEmotionalWords < maximumEmotionalWordsForRun: 
                {newlyDiscoveredEmotionalWord} è stata aggiunta all'inventario.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                    ~  ownedEmotionalWords += newlyDiscoveredEmotionalWord
                {nestDebug: aggiungo {newlyDiscoveredEmotionalWord} alla lista ownedEmotionalWords che ora contiene {ownedEmotionalWords}.}
                
                    ~ newlyDiscoveredEmotionalWord = ()
                {nestDebug: svuoto il valore di discoveredEmotionalWords che ora è {newlyDiscoveredEmotionalWord}.}  
                
                    ~ takenEmotionalWords ++
                {nestDebug: aumento il valore di takenEmotionalWords che ora è {takenEmotionalWords}.}
                
                -> emotional_inventory_management
            
            - else:
                Hai raggiunto il massimo delle parole disponibili in questa partita, devi prima rimuovere un'altra parola.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                -> emotional_inventory_management
        }
    

    //Se ho appena scoperto una nuova parola ma voglio ignorarla:        
    + {newlyDiscoveredEmotionalWord != ()} [Non aggiungo questa parola all'inventario]
        Ricordati che non potrai più aggiungerla!#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        
        + + [Sì, ignoriamola.]
                ~ newlyDiscoveredEmotionalWord = ()
            {nestDebug: svuoto il valore di discoveredEmotionalWords che ora è {discoveredEmotionalWords}.} 
                -> emotional_inventory_management
            
        + + [Ci ho ripensato.]
            -> emotional_inventory_management
   
   
    //Se voglio rimuovere una parola dall'inventario (opzione sempre disponibile)
    + {ownedEmotionalWords != ()} [Rimuovo una parola dall'inventario.]
            -> emotional_words_management(Delete) ->
   
    //Se non ho nuove parole da aggiornare o attive, posso attivarne
    + {ownedEmotionalWords != () && (newlyDiscoveredEmotionalWord == ()) && (activeEmotionalWord == ())} [Attivo una parola dell'inventario.]
            -> emotional_words_management(Activate) ->
    
    + {newlyDiscoveredEmotionalWord == ()} [Voglio scoprire una nuova parola.]
    
        {
            //Se una parola è già attiva
            - activeEmotionalWord != ():
                Hai attiva una parola, torna quando si sarà esaurita.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                    -> main
            
            //Se non è attiva
            - else:
                     {
                        //Ma ho esaurito tutte le parola da trovare
                        - (LIST_COUNT(discoveredEmotionalWords) - 155) == 0:
                            Ma non hai più parole da scoprire!
                                -> main
                        
                        //Se ho altre parole da trovare
                        - else:
                            Ti mando al sistema per scoprire nuove parole.
                            -> emotional_words_creator
                    
                    }
        
        }        
    
    + {newlyDiscoveredEmotionalWord == ()} [Mi guardo in giro.]
        -> main
    
    -

-> emotional_inventory_management
