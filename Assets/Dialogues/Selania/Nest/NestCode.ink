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
            {
                - newlyDiscoveredEmotionalWord != ():
                    ~  discoveredEmotionalWords += newlyDiscoveredEmotionalWord
                        {nestDebug: aggiungo {newlyDiscoveredEmotionalWord} alla lista discoveredEmotionalWords che ora contiene {discoveredEmotionalWords}.}
                    //segnalo che c'è un aggiornamento
                    {name} ha scoperto una nuova parola: {newlyDiscoveredEmotionalWord}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                    Il Libro è stato aggiornato.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                     @animation:RewriterBook
            }    
            
            -> emotional_inventory_management.
    
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






=== emotional_words_translator
//Da fare quando son sicura del tutto


->->
