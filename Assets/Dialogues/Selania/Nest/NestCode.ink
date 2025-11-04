=== emotional_words_creator
//Qui è dove la giocatrice compie delle scelte e genera nuove parole
{nestDebug: passo per emotional_words_creator.}
        -> first_key

        = first_key
        Primo giro di scelte
        
            + {are_two_entities_together(PG, redShell)}[redShell]
            
                @animation:RedShell
                ~ firstKeyColour = redKey
            
            + {are_two_entities_together(PG, yellowShell)}[yellowShell]
            
                @animation:YellowShell
                ~ firstKeyColour = yellowKey
            
            + {are_two_entities_together(PG, blueShell)}[blueShell]
            
                @animation:BlueShell
                ~ firstKeyColour = blueKey
            
            + {are_two_entities_together(PG, greenShell)}[greenShell]
            
                @animation:GreenShell
                ~ firstKeyColour = greenKey
            
            + {are_two_entities_together(PG, purpleShell)}[purpleShell]
                
                @animation:PurpleShell
                ~ firstKeyColour = purpleKey
            
            -
        Vuoi suonare un'altra conchiglia?#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}  
            + [Sì]
                -> second_key
            + [No]
                -> emotional_words_dispatcher
    
        = second_key
        Secondo giro di scelte
            + {are_two_entities_together(PG, redShell)}[redShell]
            
                @animation:RedShell
                ~ secondKeyColour = redKey
            + {are_two_entities_together(PG, yellowShell)}[yellowShell]
            
                @animation:YellowShell
                ~ secondKeyColour = yellowKey
            + {are_two_entities_together(PG, blueShell)}[blueShell]
            
                @animation:BlueShell
                ~ secondKeyColour = blueKey
            + {are_two_entities_together(PG, greenShell)}[greenShell]
            
                @animation:GreenShell
                ~ secondKeyColour = greenKey
            + {are_two_entities_together(PG, purpleShell)}[purpleShell]
            
                @animation:PurpleShell
                ~ secondKeyColour = purpleKey
            -
        Vuoi suonare un'altra conchiglia?#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}   
            + [Sì]
                -> third_key
            + [No]
                -> emotional_words_dispatcher

        = third_key
        Terzo giro di scelte
            + {are_two_entities_together(PG, redShell)}[redShell]
            
                @animation:RedShell
                ~ thirdKeyColour = redKey
            + {are_two_entities_together(PG, yellowShell)}[yellowShell]
            
                @animation:YellowShell
                ~ thirdKeyColour = yellowKey
            + {are_two_entities_together(PG, blueShell)}[blueShell]
            
                @animation:BlueShell
                ~ thirdKeyColour = blueKey
            + {are_two_entities_together(PG, greenShell)}[greenShell]
            
                @animation:GreenShell
                ~ thirdKeyColour = greenKey
            + {are_two_entities_together(PG, purpleShell)}[purpleShell]
            
                @animation:PurpleShell
                ~ thirdKeyColour = purpleKey
            -
                -> emotional_words_dispatcher


=== emotional_words_feedback
{nestDebug: passo per emotional_words_feedback.}
//Passo da qui dopo aver creato la parola, per vedere se l'ho già scoperta o meno. Nel secondo caso aggiorno il libro della riscrittora e passo a emotional_inventory_management
//Per prima cosa, resetto i valori delle scelte durante la creazione della parola
    ~ firstKeyColour = ()
    ~ secondKeyColour = ()
    ~ thirdKeyColour = ()
    {nestDebug: dopo il reset, i valori delle tre key sono {firstKeyColour} {secondKeyColour} {thirdKeyColour}.}

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
                    {name} ha scoperto una nuova parola: {newlyDiscoveredEmotionalWord}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                    Il Libro è stato aggiornato.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                     @animation:RewriterBook
            }    
            
            -> emotional_inventory_management.
    
    }


    = not_a_new_word
    {name} ha trovato {newlyDiscoveredEmotionalWord}, che già conosceva. Cosa vorrebbe fare? #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        
        + [Voglio cercare una nuova parola.]
            ~ newlyDiscoveredEmotionalWord = ()
                {nestDebug: svuoto il valore di newlyDiscoveredEmotionalWord che ora è {newlyDiscoveredEmotionalWord}.}
            -> emotional_words_creator
            
        + [Mi fermo.]
            ~ newlyDiscoveredEmotionalWord = ()
                {nestDebug: svuoto il valore di newlyDiscoveredEmotionalWord che ora è {newlyDiscoveredEmotionalWord}.}
            -> main


=== used_emotional_words_updater
{nestDebug: passo per used_emotional_words_updater.}
{nestDebug: il valore della parola attiva è {activeEmotionalWord}.}
{nestDebug: prima di intervenire, usedEmotionaWords contiene {usedEmotionaWords}.}
    {
        //Dato che posso passare da questo nodo anche per cancellare una parola ne ho una attiva, faccio questo check per evitare che venga aggiunta due volte (non dovrebbe, but)
        - activeEmotionalWord !=() && (usedEmotionaWords hasnt activeEmotionalWord):
            ~ usedEmotionaWords += activeEmotionalWord
    
    }

{nestDebug: dopo l'aggiornamento, usedEmotionaWords contiene {usedEmotionaWords}.}
->->



