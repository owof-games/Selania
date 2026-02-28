=== nest ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}

{debug: <i>La lista degli oggetti nella stanza è: {contentsNest}.}

{
    - contentsBook hasnt NestRecap:
    ~ move_entity(NestRecap, BookPlace)
}

{
    - nest == 1:
        Vecchie piogge e onde come monito.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        {
            - nest_foundedGlyphs has fireGlyph:
                E un glifo rosso già attende {player_name}, dono di una persona amica dopo la sua riscrittura.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        }
}
    
//Per prima cosa passiamo dalla funzione di attivazione/disattivazione dei tasti glyph_activator_function 
    -> glyph_activator_function -> main
    


=== nest_fireGlyph_button ===
    + {are_two_entities_together(PG,fireGlyph) && nest_firstFireButton}[fireGlyph]
            ~ firstChoice = glyph_firstFire
            ~ nest_secondFireButton = false
            ~ nest_thirdFireButton = false
        -> second_choice



=== nest_airGlyph_button ===
+ {are_two_entities_together(PG,airGlyph) && nest_firstAirButton}[airGlyph]
        ~ firstChoice = glyph_firstAir
        ~ nest_secondAirButton = false
        ~ nest_thirdAirButton = false
    -> second_choice            
            

=== nest_earthGlyph_button ===
+ {are_two_entities_together(PG,earthGlyph) && nest_firstEarthButton}[earthGlyph]
        ~ firstChoice = glyph_firstEarth
        ~ nest_secondEarthButton = false
        ~ nest_thirdEarthButton = false
    -> second_choice            
            



=== nest_waterGlyph_button ===
+ {are_two_entities_together(PG,waterGlyph) && nest_firstWaterButton}[waterGlyph]
        ~ firstChoice = glyph_firstWater
        ~ nest_secondWaterButton = false
        ~ nest_thirdWaterButton = false
    -> second_choice           
            


=== nest_aetherGlyph_button ===
+ {are_two_entities_together(PG,aetherGlyph) && nest_firstAetherButton}[aetherGlyph]
        ~ firstChoice = glyph_firstAether
        ~ nest_secondAetherButton = false
        ~ nest_thirdAetherButton = false
    -> second_choice



=== second_choice
//Ovvero: se ho cliccato almeno un tasto, si disattiva l'uscita fino a quando non sono a tre
    {debug_nest: stato bottoni: nest_secondFireButton {nest_secondFireButton}, nest_secondEarthButton {nest_secondEarthButton}, nest_secondAirButton {nest_secondAirButton}, nest_secondWaterButton {nest_secondWaterButton}, nest_secondAetherButton {nest_secondAetherButton}}
    
            + {are_two_entities_together(PG,fireGlyph) && nest_secondFireButton && (firstChoice ^ glyph_secondFire != ())}[fireGlyph]
                ~ secondChoice = glyph_secondFire
                ~ nest_thirdFireButton = false
            
            + {are_two_entities_together(PG,earthGlyph) && nest_secondEarthButton && (firstChoice ^ glyph_secondEarth != ())}[earthGlyph]
                ~ secondChoice = glyph_secondEarth
                ~ nest_thirdEarthButton = false
            
            + {are_two_entities_together(PG,airGlyph) && nest_secondAirButton && (firstChoice ^ glyph_secondAir!= ())}[airGlyph]
                ~ secondChoice = glyph_secondAir
                ~ nest_thirdAirButton = false
            
            + {are_two_entities_together(PG,waterGlyph) && nest_secondWaterButton && (firstChoice ^ glyph_secondWater != ())}[waterGlyph]
                ~ secondChoice = glyph_secondWater
                ~ nest_thirdWaterButton = false
            
            + {are_two_entities_together(PG,aetherGlyph) && nest_secondAetherButton && (firstChoice ^ glyph_secondAether != ())}[aetherGlyph]
                ~ secondChoice = glyph_secondAether
                ~ nest_thirdAetherButton = false
            -

    {debug_nest: stato bottoni: nest_thirdFireButton {nest_thirdFireButton}, nest_thirdEarthButton {nest_thirdEarthButton}, nest_thirdAirButton {nest_thirdAirButton}, nest_thirdWaterButton {nest_thirdWaterButton}, nest_thirdAetherButton {nest_thirdAetherButton}}
            + {are_two_entities_together(PG,fireGlyph) && nest_thirdFireButton && (secondChoice ^ glyph_thirdFire != ())}[fireGlyph]
                ~ thirdChoice = glyph_thirdFire
            
            + {are_two_entities_together(PG,earthGlyph) && nest_thirdEarthButton && (secondChoice ^ glyph_thirdEarth != ())}[earthGlyph]
                ~ thirdChoice = glyph_thirdEarth
            
            + {are_two_entities_together(PG,airGlyph) && nest_thirdAirButton && (secondChoice ^ glyph_thirdAir != ())}[airGlyph]
                ~ thirdChoice = glyph_thirdAir
            
            + {are_two_entities_together(PG,waterGlyph) && nest_thirdWaterButton && (secondChoice ^ glyph_thirdWater != ())}[waterGlyph]
                ~ thirdChoice = glyph_thirdWater
            
            + {are_two_entities_together(PG,aetherGlyph) && nest_thirdAetherButton && (secondChoice ^ glyph_thirdAether != ())}[aetherGlyph]
                ~ thirdChoice = glyph_thirdAether
            -  
    //Fatte le scelte, andiamo a vedere cosa abbiamo generato
-> sigil_founder_function

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
