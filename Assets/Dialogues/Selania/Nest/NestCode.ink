=== emotional_words_creator
//Qui è dove la giocatrice compie delle scelte e genera nuove parole
{nestDebug: passo per emotional_words_creator.}
        -> first_note

        = first_note
        Primo giro di scelte
            + {are_two_entities_together(PG, redShell)}[redShell]
                ~ firstKeyColour = redKey
            + {are_two_entities_together(PG, yellowShell)}[yellowShell]
                ~ firstKeyColour = yellowKey
            + {are_two_entities_together(PG, blueShell)}[blueShell]
                ~ firstKeyColour = blueKey
            + {are_two_entities_together(PG, greenShell)}[greenShell]
                ~ firstKeyColour = greenKey
            + {are_two_entities_together(PG, purpleShell)}[purpleShell]
                ~ firstKeyColour = purpleKey
            -
            + [Continuo Sì]
                -> second_note
            + [Continuo No]
                -> emotional_words_dispatcher
    
        = second_note
        Secondo giro di scelte
            + {are_two_entities_together(PG, redShell)}[redShell]
                ~ secondKeyColour = redKey
            + {are_two_entities_together(PG, yellowShell)}[yellowShell]
                ~ secondKeyColour = yellowKey
            + {are_two_entities_together(PG, blueShell)}[blueShell]
                ~ secondKeyColour = blueKey
            + {are_two_entities_together(PG, greenShell)}[greenShell]
                ~ secondKeyColour = greenKey
            + {are_two_entities_together(PG, purpleShell)}[purpleShell]
                ~ secondKeyColour = purpleKey
            -
            + [Continuo Sì]
                -> third_note
            + [Continuo No]
                -> emotional_words_dispatcher

        = third_note
        Terzo giro di scelte
            + {are_two_entities_together(PG, redShell)}[redShell]
                ~ thirdKeyColour = redKey
            + {are_two_entities_together(PG, yellowShell)}[yellowShell]
                ~ thirdKeyColour = yellowKey
            + {are_two_entities_together(PG, blueShell)}[blueShell]
                ~ thirdKeyColour = blueKey
            + {are_two_entities_together(PG, greenShell)}[greenShell]
                ~ thirdKeyColour = greenKey
            + {are_two_entities_together(PG, purpleShell)}[purpleShell]
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
{nestDebug: emotional_words_translator.}

->->
