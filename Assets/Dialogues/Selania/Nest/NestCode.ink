=== emotional_inventory_management
{nestDebug: passo per emotional_inventory.}
//Ogni volta che scopriamo una nuova parola, possiamo ignorarla, aggiungerla all'inventario, sostituire una parola dell'inventario con questa
//Qui è dove aggiungiamo, togliamo, limitiamo l'uso delle parole emozionali. Avremo:

    {
        //Se vengo dal generatore di parole, la prima cosa che faccio è aggiungere la parola appena scoperta alla lista delle parole scoperte
        - newlyDiscoveredEmotionalWord != ():
            ~  discoveredEmotionalWords += newlyDiscoveredEmotionalWord
                {nestDebug: aggiungo {newlyDiscoveredEmotionalWord} alla lista discoveredEmotionalWords che ora contiene {discoveredEmotionalWords}.}
    }    


- (top)

    //Se ho appena scoperto una nuova parola e voglio aggiungerla:
    + {newlyDiscoveredEmotionalWord != ()}[Aggiungo {newlyDiscoveredEmotionalWord} all'inventario.]
        
        {
            - takenEmotionalWords < maximumEmotionalWordsForRun: 
                {newlyDiscoveredEmotionalWord} è stata aggiunta all'inventario.
                    ~  ownedEmotionalWords += newlyDiscoveredEmotionalWord
                {nestDebug: aggiungo {newlyDiscoveredEmotionalWord} alla lista ownedEmotionalWords che ora contiene {ownedEmotionalWords}.}
                
                    ~ discoveredEmotionalWords = ()
                {nestDebug: svuoto il valore di discoveredEmotionalWords che ora è {discoveredEmotionalWords}.}  
                    ~ takenEmotionalWords ++
                {nestDebug: aumento il valore di takenEmotionalWords che ora è {takenEmotionalWords}.}
                
                -> top
            
            - else:
                Hai raggiunto il massimo delle parole disponibili in questa partita, devi prima rimuovere un'altra parola.
                -> top
        }
    

    //Se ho appena scoperto una nuova parola ma voglio ignorarla:        
    + {newlyDiscoveredEmotionalWord != ()} [Non aggiungo questa parola all'inventario]
        Sicura? Non potrai più aggiungerla!
        
        + + [Sì, ignoriamola.]
                ~ discoveredEmotionalWords = ()
            {nestDebug: svuoto il valore di discoveredEmotionalWords che ora è {discoveredEmotionalWords}.} 
                -> top
            
        + + [Ci ho ripensato.]
            -> top
   
   
    //Se voglio rimuovere una parola dall'inventario (opzione sempre disponibile)
    + {ownedEmotionalWords != ()} [Rimuovo una parola dall'inventario.]
            -> emotional_words_management(Delete) ->
   
    //Se non ho nuove parole da aggiornare o attive, posso attivarne
    + {ownedEmotionalWords != () && (newlyDiscoveredEmotionalWord == ()) && (activeEmotionalWord == ())} [Attivo una parola dell'inventario.]
            -> emotional_words_management(Activate) ->
    
    + [Ho finito.]
        -> main
    
    -

-> top

