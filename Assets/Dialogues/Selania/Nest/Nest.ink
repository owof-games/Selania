=== nest ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
//Qui Oven avrà solo una funzione di animazione, non serve che ci interagiamo

    {debug: <i>La lista degli oggetti nella stanza è: {nestContents}.}
    {debug: <i>La lista degli oggetti nel deposito è: {safekeepingContents}.}

    {nest == 1:Frase sul nido.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}

    ~ arrivingFrom = Nest
    -> main








=== emotional_library_management
    + {are_two_entities_together(ELManagement, PG)}[ELManagement]
    -

    + [Voglio scoprire una nuova parola.]
    
        {
            //Se una parola è già attiva
            - activeEmotionalWord != ():
                Hai attiva una parola, torna quando si sarà esaurita.
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
                            -> main
                    
                    }
        
        }
    
    
   
    
    + {ownedEmotionalWords != ()} [Voglio gestire il mio vocabolario emozionale.]
            -> emotional_inventory_management
