=== nest ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
//Qui Oven avrà solo una funzione di animazione, non serve che ci interagiamo

    {debug: <i>La lista degli oggetti nella stanza è: {contentsNest}.}
    {debug: <i>La lista degli oggetti nel deposito è: {contentsSafekeeping}.}
    
        {
            - contentsBook hasnt NestRecap:
            ~ move_entity(NestRecap, BookPlace)
        }

    {nest == 1:Frase sul nido.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
            -> witch_frog_mission_notifier ->
    
    ~ book_arrivingFromTracking = Nest
    -> main









=== emotional_backpack_management
//Ogni volta che scopriamo una nuova parola, possiamo ignorarla, aggiungerla all'inventario, sostituire una parola dell'inventario con questa
//Qui è dove aggiungiamo, togliamo, limitiamo l'uso delle parole emozionali. Avremo:
    Cosa desidera fare {player_name}?#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
    
    //Se ho almeno una parola
    + {nest_ownedEmotionalWords != ()} Cosa ho nell'inventario?
            Hai con te {generic_list_with_commas(nest_ownedEmotionalWords, -> emotional_words_translator)}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> emotional_backpack_management

    //Se ho appena scoperto una nuova parola e voglio aggiungerla:
    + {nest_newlyDiscoveredEmotionalWord != ()} Aggiungo {nest_newlyDiscoveredEmotionalWord} all'inventario
        
        {
            - nest_takenEmotionalWords < nest_maximumEmotionalWordsForRun: 
                {nest_newlyDiscoveredEmotionalWord} è stata aggiunta all'inventario.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                    ~  nest_ownedEmotionalWords += nest_newlyDiscoveredEmotionalWord
                {debug_nest: aggiungo {nest_newlyDiscoveredEmotionalWord} alla lista nest_ownedEmotionalWords che ora contiene {nest_ownedEmotionalWords}.}
                
                    ~ nest_newlyDiscoveredEmotionalWord = ()
                {debug_nest: svuoto il valore di nest_discoveredEmotionalWords che ora è {nest_newlyDiscoveredEmotionalWord}.}  
                
                    ~ nest_takenEmotionalWords ++
                {debug_nest: aumento il valore di nest_takenEmotionalWords che ora è {nest_takenEmotionalWords}.}
                
                -> emotional_backpack_management
            
            - else:
                Hai raggiunto il massimo delle parole disponibili in questa partita, devi prima rimuovere un'altra parola.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                -> emotional_backpack_management
        }
    

    //Se ho appena scoperto una nuova parola ma voglio ignorarla:        
    + {nest_newlyDiscoveredEmotionalWord != ()} Non aggiungo questa parola all'inventario.
        Ricordati che non potrai più aggiungerla!#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        
        + + Sì, ignoriamola
                ~ nest_newlyDiscoveredEmotionalWord = ()
            {debug_nest: svuoto il valore di nest_discoveredEmotionalWords che ora è {nest_discoveredEmotionalWords}.} 
                -> emotional_backpack_management
            
        + + Ci ho ripensato
            -> emotional_backpack_management
   
   
    //Se voglio rimuovere una parola dall'inventario (opzione sempre disponibile)
    + {nest_ownedEmotionalWords != ()} Rimuovo una parola dall'inventario
            -> emotional_words_management(Delete) ->
   
    //Se non ho nuove parole da aggiornare o attive, posso attivarne
    + {nest_ownedEmotionalWords != () && (nest_newlyDiscoveredEmotionalWord == ()) && (nest_activeEmotionalWord == ())} Attivo una parola dell'inventario
            -> emotional_words_management(Activate) ->
    
    + {nest_newlyDiscoveredEmotionalWord == ()} Voglio scoprire una nuova parola
    
        {
            //Se una parola è già attiva
            - nest_activeEmotionalWord != ():
                Hai attiva una parola, torna quando si sarà esaurita.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                    -> main
            
            //Se non è attiva
            - else:
                     {
                        //Ma ho esaurito tutte le parola da trovare
                        - (LIST_COUNT(nest_discoveredEmotionalWords) - 155) == 0:
                            Ma non hai più parole da scoprire!
                                -> main
                        
                        //Se ho altre parole da trovare
                        - else:
                            Ti mando al sistema per scoprire nuove parole.
                            -> emotional_words_creator
                    
                    }
        
        }        
    
    + {nest_newlyDiscoveredEmotionalWord == ()} Mi guardo in giro
        -> main
    
    -

-> emotional_backpack_management
