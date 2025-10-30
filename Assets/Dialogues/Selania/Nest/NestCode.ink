=== emotional_words_creator
//Qui è dove la giocatrice compie delle scelte e genera nuove parole
{nestDebug: passo per emotional_words_creator.}
        -> first_note

        = first_note
        Primo giro di scelte
            + [Nota Rosso]
                ~ firstKeyColour = redKey
            + [Nota Giallo]
                ~ firstKeyColour = yellowKey
            + [Nota Blu]
                ~ firstKeyColour = blueKey
            + [Nota Verde]
                ~ firstKeyColour = greenKey
            + [Nota Viola]
                ~ firstKeyColour = purpleKey
            -
            + [Continuo Sì]
                -> second_note
            + [Continuo No]
                -> emotional_words_dispatcher
    
        = second_note
        Secondo giro di scelte
            + [Nota Rosso]
                ~ secondKeyColour = redKey
            + [Nota Giallo]
                ~ secondKeyColour = yellowKey
            + [Nota Blu]
                ~ secondKeyColour = blueKey
            + [Nota Verde]
                ~ secondKeyColour = greenKey
            + [Nota Viola]
                ~ secondKeyColour = purpleKey
            -
            + [Continuo Sì]
                -> third_note
            + [Continuo No]
                -> emotional_words_dispatcher

        = third_note
        Terzo giro di scelte
            + [Nota Rosso]
                ~ thirdKeyColour = redKey
            + [Nota Giallo]
                ~ thirdKeyColour = yellowKey
            + [Nota Blu]
                ~ thirdKeyColour = blueKey
            + [Nota Verde]
                ~ thirdKeyColour = greenKey
            + [Nota Viola]
                ~ thirdKeyColour = purpleKey
            -
            + [Risultato]
                -> emotional_words_dispatcher


=== emotional_words_feedback
{nestDebug: passo per emotional_words_feedback.}
//Passo da qui dopo aver creato la parola, per vedere se l'ho già scoperta o meno. Nel secondo caso aggiorno il libro della riscrittora e passo a emotional_inventory_management
    {
    
        - discoveredEmotionalWords has newlyDiscoveredEmotionalWord:
            {nestDebug: discoveredEmotionalWords ha già {newlyDiscoveredEmotionalWord}.}
            -> not_a_new_word
            
        - else:
            -> emotional_inventory_management
    
    }


    = not_a_new_word
    {name} ha trovato {newlyDiscoveredEmotionalWord}, che già conosceva. Cosa vorrebbe fare? #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        
        + [Voglio cercare una nuova parola.]
            ~ newlyDiscoveredEmotionalWord = ()
                {nestDebug: svuoto il valore di discoveredEmotionalWords che ora è {newlyDiscoveredEmotionalWord}.}
            -> emotional_words_creator
            
        + [Mi fermo.]
            ~ newlyDiscoveredEmotionalWord = ()
                {nestDebug: svuoto il valore di discoveredEmotionalWords che ora è {newlyDiscoveredEmotionalWord}.}
            -> main



=== emotional_inventory_management
{nestDebug: passo per emotional_inventory.}
//Ogni volta che scopriamo una nuova parola, possiamo ignorarla, aggiungerla all'inventario, sostituire una parola dell'inventario con questa
//Qui è dove aggiungiamo, togliamo, limitiamo l'uso delle parole emozionali. Avremo:

    {
        //Se vengo dal generatore di parole, la prima cosa che faccio è aggiungere la parola appena scoperta alla lista delle parole scoperte
        - newlyDiscoveredEmotionalWord != ():
            ~  discoveredEmotionalWords += newlyDiscoveredEmotionalWord
                {nestDebug: aggiungo {newlyDiscoveredEmotionalWord} alla lista discoveredEmotionalWords che ora contiene {discoveredEmotionalWords}.}
            //segnalo che c'è un aggiornametno    
            @animation:RewriterBook    
    }    


- (top)

    {
        - newlyDiscoveredEmotionalWord != ():
                {name} ha appena scoperto {newlyDiscoveredEmotionalWord}: cosa vorrebbe fare?#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        - else:
                Cosa desidera fare {name}?#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
    }


    //Se ho appena scoperto una nuova parola e voglio aggiungerla:
    + {newlyDiscoveredEmotionalWord != ()}[Aggiungo {newlyDiscoveredEmotionalWord} all'inventario.]
        
        {
            - takenEmotionalWords < maximumEmotionalWordsForRun: 
                {newlyDiscoveredEmotionalWord} è stata aggiunta all'inventario.
                    ~  ownedEmotionalWords += newlyDiscoveredEmotionalWord
                {nestDebug: aggiungo {newlyDiscoveredEmotionalWord} alla lista ownedEmotionalWords che ora contiene {ownedEmotionalWords}.}
                
                    ~ newlyDiscoveredEmotionalWord = ()
                {nestDebug: svuoto il valore di discoveredEmotionalWords che ora è {newlyDiscoveredEmotionalWord}.}  
                
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


=== emotional_words_translator
//Da fare quando son sicura del tutto


->->
