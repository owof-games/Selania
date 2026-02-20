=== emotional_words_creator
//Qui è dove la giocatrice compie delle scelte e genera nuove parole
{debug_nest: passo per emotional_words_creator.}
        -> first_key

        = first_key
        Suona la prima nota.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        
            + {are_two_entities_together(PG, fireGlyph)}[fireGlyph]
            
                @animation:RedShell
                ~ nest_firstKeyColour = redKey
            
            + {are_two_entities_together(PG, earthGlyph)}[earthGlyph]
            
                @animation:YellowShell
                ~ nest_firstKeyColour = yellowKey
            
            + {are_two_entities_together(PG, airGlyph)}[airGlyph]
            
                @animation:BlueShell
                ~ nest_firstKeyColour = blueKey
            
            + {are_two_entities_together(PG, waterGlyph)}[waterGlyph]
            
                @animation:GreenShell
                ~ nest_firstKeyColour = greenKey
            
            + {are_two_entities_together(PG, aetherGlyph)}[aetherGlyph]
                
                @animation:PurpleShell
                ~ nest_firstKeyColour = purpleKey
            
            -
        Vuoi suonare un'altra conchiglia?#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}  
            + [Sì]
                -> second_key
            + [No]
                -> emotional_words_dispatcher
    
        = second_key
        Suona la seconda nota. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            + {are_two_entities_together(PG, fireGlyph)}[fireGlyph]
            
                @animation:RedShell
                ~ nest_secondKeyColour = redKey
            + {are_two_entities_together(PG, earthGlyph)}[earthGlyph]
            
                @animation:YellowShell
                ~ nest_secondKeyColour = yellowKey
            + {are_two_entities_together(PG, airGlyph)}[airGlyph]
            
                @animation:BlueShell
                ~ nest_secondKeyColour = blueKey
            + {are_two_entities_together(PG, waterGlyph)}[waterGlyph]
            
                @animation:GreenShell
                ~ nest_secondKeyColour = greenKey
            + {are_two_entities_together(PG, aetherGlyph)}[aetherGlyph]
            
                @animation:PurpleShell
                ~ nest_secondKeyColour = purpleKey
            -
        Vuoi suonare un'altra conchiglia?#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}   
            + [Sì]
                -> third_key
            + [No]
                -> emotional_words_dispatcher

        = third_key
        Suona l'ultima nota.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            + {are_two_entities_together(PG, fireGlyph)}[fireGlyph]
            
                @animation:RedShell
                ~ nest_thirdKeyColour = redKey
            + {are_two_entities_together(PG, earthGlyph)}[earthGlyph]
            
                @animation:YellowShell
                ~ nest_thirdKeyColour = yellowKey
            + {are_two_entities_together(PG, airGlyph)}[airGlyph]
            
                @animation:BlueShell
                ~ nest_thirdKeyColour = blueKey
            + {are_two_entities_together(PG, waterGlyph)}[waterGlyph]
            
                @animation:GreenShell
                ~ nest_thirdKeyColour = greenKey
            + {are_two_entities_together(PG, aetherGlyph)}[aetherGlyph]
            
                @animation:PurpleShell
                ~ nest_thirdKeyColour = purpleKey
            -
                -> emotional_words_dispatcher


=== emotional_words_feedback
{debug_nest: passo per emotional_words_feedback.}
//Passo da qui dopo aver creato la parola, per vedere se l'ho già scoperta o meno. Nel secondo caso aggiorno il libro della riscrittora e passo a emotional_backpack_management
//Per prima cosa, resetto i valori delle scelte durante la creazione della parola
    ~ nest_firstKeyColour = ()
    ~ nest_secondKeyColour = ()
    ~ nest_thirdKeyColour = ()
    {debug_nest: dopo il reset, i valori delle tre key sono {nest_firstKeyColour} {nest_secondKeyColour} {nest_thirdKeyColour}.}

    {
    
        - nest_discoveredEmotionalWords has nest_newlyDiscoveredEmotionalWord:
            {debug_nest: nest_discoveredEmotionalWords ha già {nest_newlyDiscoveredEmotionalWord}.}
            -> not_a_new_word
            
        - else:
            {
                - nest_newlyDiscoveredEmotionalWord != ():
                    ~  nest_discoveredEmotionalWords += nest_newlyDiscoveredEmotionalWord
                        {debug_nest: aggiungo {nest_newlyDiscoveredEmotionalWord} alla lista nest_discoveredEmotionalWords che ora contiene {nest_discoveredEmotionalWords}.}
                    //segnalo che c'è un aggiornamento
                    {player_name} ha scoperto una nuova parola: {nest_newlyDiscoveredEmotionalWord}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                    Il Libro è stato aggiornato.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                     @animation:RewriterBook
            }    
            
            -> emotional_backpack_management.
    
    }


    = not_a_new_word
    {player_name} ha trovato {nest_newlyDiscoveredEmotionalWord}, che già conosceva. Cosa vorrebbe fare? #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        
        + [Voglio cercare una nuova parola.]
            ~ nest_newlyDiscoveredEmotionalWord = ()
                {debug_nest: svuoto il valore di nest_newlyDiscoveredEmotionalWord che ora è {nest_newlyDiscoveredEmotionalWord}.}
            -> emotional_words_creator
            
        + [Mi fermo.]
            ~ nest_newlyDiscoveredEmotionalWord = ()
                {debug_nest: svuoto il valore di nest_newlyDiscoveredEmotionalWord che ora è {nest_newlyDiscoveredEmotionalWord}.}
            -> main


=== used_emotional_words_updater
{debug_nest: passo per used_emotional_words_updater.}
{debug_nest: il valore della parola attiva è {nest_activeEmotionalWord}.}
{debug_nest: prima di intervenire, nest_usedEmotionaWords contiene {nest_usedEmotionaWords}.}
    {
        //Dato che posso passare da questo nodo anche per cancellare una parola ne ho una attiva, faccio questo check per evitare che venga aggiunta due volte (non dovrebbe, but)
        - nest_activeEmotionalWord !=() && (nest_usedEmotionaWords hasnt nest_activeEmotionalWord):
            ~ nest_usedEmotionaWords += nest_activeEmotionalWord
    
    }

{debug_nest: dopo l'aggiornamento, nest_usedEmotionaWords contiene {nest_usedEmotionaWords}.}
->->



