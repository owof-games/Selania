
//Check se ridurre o meno il valore del sigillo
LIST glyph_decreaseSigilsStatus = decreaseYes, decreaseNo

//Variabile per decidere se decrementare o meno il valore
VAR glyph_decreaseSigil = true

//Funzione di dispatch comune (sigillo attivo o meno)
=== glyph_modifier_variation_management(PNG, GlyphC, DecreaseS)
{debug_nest: passo per glyph_modifier_variation_management. Il valore di PNG è {PNG}, il valore di GlyphCe è {GlyphC}. Lo stato della parola attiva è {glyph_actualActiveSigil}.}
//PNG = Su chi ha effetto la scelta
//GlyphC = Su quale colore ha effetto    
//DecreaseS = Se diminuire o meno il contatore del sigillo

    //
    //Primo step: capiamo di chi si parla.
    //
        {
            - PNG == FirstCharacter:
                    ~ glyph_currentTalker = FirstCharacter
                    {debug_nest: dopo l'operazione il parlante attuale {glyph_currentTalker}.}
                    //Aggiorno i corrispettivi valori lato rapporto PNG/PG (ovvero: non cambio il valore dei dati dellx PNG)
                    {GlyphC:
                        -fireC:
                            ~ player_fire_first_char ++
                    
                        -earthC:
                            ~ player_earth_first_char ++
                        
                        -airC:
                            ~ player_air_first_char ++
                        
                        -waterC:
                            ~ player_water_first_char ++   
                        
                        -aetherC:
                            ~ player_aether_first_char ++
                    }
            
            - PNG == SecondCharacter:
                    ~ glyph_currentTalker = SecondCharacter
                    {debug_nest: dopo l'operazione il parlante attuale {glyph_currentTalker}.}
                    //Aggiorno i corrispettivi valori lato rapporto PNG/PG (ovvero: non cambio il valore dei dati dellx PNG)
                    {GlyphC:
                            -fireC:
                                ~ player_fire_second_char ++
                        
                            -earthC:
                                ~ player_earth_second_char ++
                            
                            -airC:
                                ~ player_air_second_char ++
                            
                            -waterC:
                                ~ player_water_second_char ++   
                            
                            -aetherC:
                                ~ player_aether_second_char ++
                        }
            
            - PNG == ThirdCharacter:
                    ~ glyph_currentTalker = ThirdCharacter
                    {debug_nest: dopo l'operazione il parlante attuale {glyph_currentTalker}.}
                    //Aggiorno i corrispettivi valori lato rapporto PNG/PG (ovvero: non cambio il valore dei dati dellx PNG)
                    {GlyphC:
                            -fireC:
                                ~ player_fire_third_char ++
                        
                            -earthC:
                                ~ player_earth_third_char ++
                            
                            -airC:
                                ~ player_air_third_char ++
                            
                            -waterC:
                                ~ player_water_third_char ++   
                            
                            -aetherC:
                                ~ player_aether_third_char ++
                    }  
            
            - PNG == Mentor:
                    ~ glyph_currentTalker = Mentor
                    {debug_nest: dopo l'operazione il parlante attuale {glyph_currentTalker}.}
                    //Nel caso di Mentore, non attivo mai le parole magiche, per cui esco direttamente dalla funzione
                    {GlyphC:
                            -fireC:
                                ~ player_fire_mentor ++
                                ~  mentor_fire ++
                        
                            -earthC:
                                ~ player_earth_mentor ++
                                ~  mentor_earth ++
                            
                            -airC:
                                ~ player_air_mentor ++
                                ~  mentor_air ++
                            
                            -waterC:
                                ~ player_water_mentor ++   
                                ~  mentor_water ++
                            
                            -aetherC:
                                ~ player_aether_mentor ++
                                ~  mentor_aether ++
                    }
                    ->->
                    
            - PNG == PG:
            //Nel caso dellx PG, non attivo mai le parole magiche, per cui esco direttamente dalla funzione
                    {GlyphC:
                        -fireC:
                            ~ player_fire ++
                    
                        -earthC:
                            ~ player_earth ++
                        
                        -airC:
                            ~ player_air ++
                        
                        -waterC:
                            ~ player_water ++   
                        
                        -aetherC:
                            ~ player_aether ++
                    }
                    ->->
                    
                
            - else: ERROR: sono in GlyphC_variation_management ma non trovo lx PNG indicatx
        }


    //
    //Secondo step: valuto se c'è o meno un sigillo attivo, altrimenti proseguiamo regolarmente.
    //
    {
        //Se sigillo attivo, andiamo a formula ad hoc
        - glyph_actualActiveSigil != ():
            {
                - DecreaseS == decreaseYes:
                {debug: il valore di DecreaseS è {DecreaseS} e quindi vado a mettere glyph_decreaseSigil su true.}
                    ~ glyph_decreaseSigil = true
                        -> sigil_glyph_updater
                
                - else:
                    ~ glyph_decreaseSigil = false 
                {debug: il valore di DecreaseS è {DecreaseS} e quindi vado a mettere glyph_decreaseSigil su false.}
                        -> sigil_glyph_updater   
            
            }

        
        //Altrimenti aumentiamo di uno come sempre il valore per lx PNG
        - else:
            {GlyphC:
                -fireC:
                    ~ glyph_temporaryFire  ++
        
                -earthC:
                    ~ glyph_temporaryEarth ++
                
                -airC:
                    ~ glyph_temporaryAir++
                
                -waterC:
                    ~ glyph_temporaryWater++   
                
                -aetherC:
                    ~ glyph_temporaryAether ++
            }
            {debug_nest: non è attivo alcun sigillo per cui mi aumento di uno i valori e basta.}
            //E poi aggiorniamo i dettagli, con una funzione comune ai glifi
                    -> update_PNG_glyph_values
        
    }


    = sigil_glyph_updater
    //Terzo step: calcolo la variazione di GlyphC generata dal sigillo.
    {
        //Calcolo del primo livello
        - glyph_firstFire has glyph_actualActiveSigil:
               ~ glyph_temporaryFire ++
               ~ glyph_temporaryFire ++

        - glyph_firstEarth has glyph_actualActiveSigil:
               ~ glyph_temporaryEarth ++
               ~ glyph_temporaryEarth ++

        - glyph_firstAir has glyph_actualActiveSigil:
               ~ glyph_temporaryAir ++
               ~ glyph_temporaryAir ++

        - glyph_firstWater has glyph_actualActiveSigil:
               ~ glyph_temporaryWater ++
               ~ glyph_temporaryWater ++

        - glyph_firstAether has glyph_actualActiveSigil:
               ~ glyph_temporaryAether ++
               ~ glyph_temporaryAether ++              

    }

    {
        //Calcolo del secondo livello
        - glyph_secondFire has glyph_actualActiveSigil:
               ~ glyph_temporaryFire ++

        - glyph_secondEarth has glyph_actualActiveSigil:
               ~ glyph_temporaryEarth ++

        - glyph_secondAir has glyph_actualActiveSigil:
               ~ glyph_temporaryAir ++

        - glyph_secondWater has glyph_actualActiveSigil:
               ~ glyph_temporaryWater ++

        - glyph_secondAether has glyph_actualActiveSigil:
               ~ glyph_temporaryAether ++            

    }

    {
        //Calcolo del terzo livello
        - glyph_thirdFire has glyph_actualActiveSigil:
               ~ glyph_temporaryFire --
               ~ glyph_temporaryFire --

        - glyph_thirdEarth has glyph_actualActiveSigil:
               ~ glyph_temporaryEarth --
               ~ glyph_temporaryEarth --

        - glyph_thirdAir has glyph_actualActiveSigil:
               ~ glyph_temporaryAir --
               ~ glyph_temporaryAir --

        - glyph_thirdWater has glyph_actualActiveSigil:
               ~ glyph_temporaryWater --
               ~ glyph_temporaryWater --

        - glyph_thirdAether has glyph_actualActiveSigil:
               ~ glyph_temporaryAether --
               ~ glyph_temporaryAether --             

    }

    -> update_PNG_glyph_values


//Quarto step: aggiorno i valori dei glifi dell3 PNG e lo stato della relazione
    = update_PNG_glyph_values
        {debug_nest: entro in update_PNG_glyph_values.}
        {debug_nest: prima dell'operazione il parlante attuale è {glyph_currentTalker}.}
        //Prima aggiorniamo i dati a seconda dei parlanti
        {
            - glyph_currentTalker == FirstCharacter:
                ~ firstChar_fire += glyph_temporaryFire 
                ~ firstChar_earth += glyph_temporaryEarth
                ~ firstChar_air += glyph_temporaryAir
                ~ firstChar_water += glyph_temporaryWater
                ~ firstChar_aether += glyph_temporaryAether
                ~ firstChar_relationship_variation()
            
            - glyph_currentTalker == SecondCharacter:
                ~ secondChar_fire += glyph_temporaryFire 
                ~ secondChar_earth += glyph_temporaryEarth
                ~ secondChar_air += glyph_temporaryAir
                ~ secondChar_water += glyph_temporaryWater
                ~ secondChar_aether += glyph_temporaryAether
                ~ secondChar_relationship_variation()

            - glyph_currentTalker == ThirdCharacter:
                ~ thirdChar_fire += glyph_temporaryFire 
                ~ thirdChar_earth += glyph_temporaryEarth
                ~ thirdChar_air += glyph_temporaryAir
                ~ thirdChar_water += glyph_temporaryWater
                ~ thirdChar_aether += glyph_temporaryAether
                ~ thirdChar_relationship_variation()
        }

    
    -> sigil_PNG_comment

    = sigil_PNG_comment

    //Qui inseriamo il commento progressivo, es.
    {glyph_actualActiveSigil:
        //Uso shuffle stopping con l'idea di poi associare a ogni frase una variabile stringa da mettere direttamente sul grimorio, in modo che si popoli tutto in automatico.
        - FireAirWater:
            {shuffle stopping:
                - Prima frase.
                - Seconda frase.
                - Terza frase.
            }

        - FireAirEarth:
            {shuffle stopping:
                - Prima frase.
                - Seconda frase.
                - Terza frase.
            }    
        //Se non ci sono sigilli attivi, skippa in automatico
    }
    -> sigil_PNG_reactions




    = sigil_PNG_reactions
    //Qui invece abbiamo le reazioni dellx PNG
    {
        - glyph_currentTalker == FirstCharacter && glyph_actualActiveSigil != ():
            -> sigil_FirstCharacter_reactions
        
        - glyph_currentTalker == SecondCharacter && glyph_actualActiveSigil != ():
            -> sigil_SecondCharacter_reactions

        - glyph_currentTalker == ThirdCharacter && glyph_actualActiveSigil != ():
            -> sigil_ThirdCharacter_reactions

        - else:
            -> closing_function    

    }


            = sigil_FirstCharacter_reactions
            //Qui settiamo le reazioni ad hoc, a seconda delle variazioni 
            {firstChar_relationshipReaction:

                - neutral:
                    {shuffle:
                        - Reazione neutra al sigillo.
                        - Altra reazione neutra al sigillo.
                        - Un'altra ancora reazione neutra al sigillo.
                    }

                - positive:
                    {shuffle:
                        - Reazione positiva al sigillo.
                        - Altra reazione positiva al sigillo.
                        - Un'altra ancora reazione positiva al sigillo.
                    }

                - negative:
                    {shuffle:
                        - Reazione negativa al sigillo.
                        - Altra reazione negativa al sigillo.
                        - Un'altra ancora reazione negativa al sigillo.
                    }

            }

                -> closing_function
            
            
            = sigil_SecondCharacter_reactions
            {secondChar_relationshipReaction:

                - neutral:
                    {shuffle:
                        - Reazione neutra al sigillo.
                        - Altra reazione neutra al sigillo.
                        - Un'altra ancora reazione neutra al sigillo.
                    }

                - positive:
                    {shuffle:
                        - Reazione positiva al sigillo.
                        - Altra reazione positiva al sigillo.
                        - Un'altra ancora reazione positiva al sigillo.
                    }

                - negative:
                    {shuffle:
                        - Reazione negativa al sigillo.
                        - Altra reazione negativa al sigillo.
                        - Un'altra ancora reazione negativa al sigillo.
                    }

            }
            
            
                -> closing_function

            
            = sigil_ThirdCharacter_reactions
            {thirdChar_relationshipReaction:

                - neutral:
                    {shuffle:
                        - Reazione neutra al sigillo.
                        - Altra reazione neutra al sigillo.
                        - Un'altra ancora reazione neutra al sigillo.
                    }

                - positive:
                    {shuffle:
                        - Reazione positiva al sigillo.
                        - Altra reazione positiva al sigillo.
                        - Un'altra ancora reazione positiva al sigillo.
                    }

                - negative:
                    {shuffle:
                        - Reazione negativa al sigillo.
                        - Altra reazione negativa al sigillo.
                        - Un'altra ancora reazione negativa al sigillo.
                    }

            }
            
            
                -> closing_function




    = closing_function
    //Azzeriamo i valori temporanei
        ~ glyph_currentTalker = ()
        ~ glyph_temporaryFire  = 0
        ~ glyph_temporaryEarth = 0
        ~ glyph_temporaryAir= 0
        ~ glyph_temporaryWater= 0
        ~ glyph_temporaryAether = 0
    {debug_nest: dopo l'operazione il parlante attuale {glyph_currentTalker}.}

    //Infine: se il valore di DecreaseS è su sì, diminuiamo il valore del sigillo, altrimenti no
    {
        - glyph_decreaseSigil == true && glyph_actualActiveSigil != ():
        {debug: il valore di glyph_decreaseSigil è {glyph_decreaseSigil} e quindi vado a ridurre il contatore del sigillo.}
            -> update_sigil_value
        - else: 
            ->->   
    }


    = update_sigil_value
    //Qui aggiorniamo l'utilizzo del sigillo.
    //Prima aumentiamo il valore
        ~ glyph_actualSigilUses ++

    //Se l'utilizzo è arrivato al massimo, a quel punto aggiungiamo il sigillo a quelli utilizzati e svuotiamo la variabile del sigillo attualmente attivo.
    {
        - glyph_actualSigilUses == glyph_maxSigilUses:
            L'effetto di {glyph_actualActiveSigil} si è esaurito.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            ~ glyph_usedSigils += glyph_actualActiveSigil
            ~ glyph_actualActiveSigil = ()
            
    }    
    //L'intersezione tra glyph_usedSigils e glyph_discoveredSigils indicherà la presenza di questo sigillo, che sarà quindi tracciato come utilizzato sul libro.

    ->->













//Funzioni per gestire la variazione della relazione, secondo le logiche dellx PNG
=== function firstChar_relationship_variation()
    ~ temp firstCharRelCalculator = 0
        {debug: passo per firstChar_relationship_variation. Il valore di firstCharRelCalculator è {firstCharRelCalculator}.}
            {glyph_temporaryAir:
                --2:
                    ~ firstCharRelCalculator ++
                    ~ firstCharRelCalculator ++
                - 1:
                    ~ firstCharRelCalculator --
                - 2:
                    ~ firstCharRelCalculator --
                    ~ firstCharRelCalculator --
            } 
            {glyph_temporaryWater:
                - -2:
                    ~ firstCharRelCalculator --
                    ~ firstCharRelCalculator --
                - 1:
                    ~ firstCharRelCalculator ++
                - 2:
                    ~ firstCharRelCalculator ++
                    ~ firstCharRelCalculator ++
            }   

            {glyph_temporaryAether:
                - -2:
                    ~ firstCharRelCalculator --
                    ~ firstCharRelCalculator --
                - 1:
                    ~ firstCharRelCalculator ++
                - 2:
                    ~ firstCharRelCalculator ++
                    ~ firstCharRelCalculator ++
            }   
        {debug: dopo i conti fatti, il valore di firstCharRelCalculator è {firstCharRelCalculator}.}
        
            {
                - firstCharRelCalculator > 0:
                    ~ firstChar_relationshipReaction = positive

                - firstCharRelCalculator < 0:
                    ~ firstChar_relationshipReaction = negative

                - firstCharRelCalculator == 0:
                    ~ firstChar_relationshipReaction = neutral
            }
            
            ~ firstChar_relationshipIndicator += firstCharRelCalculator

        {debug: dopo l'aggiornamento, il valore di firstChar_relationshipIndicator è {firstChar_relationshipIndicator}.} 
            
        ~ relationshipIndicator_Adjustments(FirstCharacter)


=== function secondChar_relationship_variation()
~ temp secondCharRelCalculator = 0
        {
            -secondCharRelCalculator > 0:
                ~ secondChar_relationshipReaction = positive

            - secondCharRelCalculator < 0:
                ~ secondChar_relationshipReaction = negative

            -secondCharRelCalculator == 0: 
                ~ secondChar_relationshipReaction = neutral
        }

    ~ secondChar_relationshipIndicator += secondCharRelCalculator    
    ~ relationshipIndicator_Adjustments(SecondCharacter)

=== function thirdChar_relationship_variation()
~ temp thirdCharRelCalculator = 0
        {
            - thirdCharRelCalculator > 0:
                ~ thirdChar_relationshipReaction = positive

            - thirdCharRelCalculator < 0:
                ~ thirdChar_relationshipReaction = negative

            - thirdCharRelCalculator == 0: 
                ~ thirdChar_relationshipReaction = neutral
        }

    ~ thirdChar_relationshipIndicator += thirdCharRelCalculator    
    ~ relationshipIndicator_Adjustments(ThirdCharacter)




//Questa funzione ci permette al volo di evitare che i valori dell'indicatore sforino i limiti previsti
=== function relationshipIndicator_Adjustments(PNG)

{
    - PNG == FirstCharacter:
        {
            - firstChar_relationshipIndicator < relationship_indicator_minValue:
               ~ firstChar_relationshipIndicator =  relationship_indicator_minValue

            - firstChar_relationshipIndicator > relationship_indicator_maxValue:
               ~ firstChar_relationshipIndicator =  relationship_indicator_maxValue
        }
    - PNG == SecondCharacter:
        {
        - secondChar_relationshipIndicator < relationship_indicator_minValue:
            ~ secondChar_relationshipIndicator =  relationship_indicator_minValue

        - secondChar_relationshipIndicator > relationship_indicator_maxValue:
            ~ secondChar_relationshipIndicator =  relationship_indicator_maxValue
        }   
    - PNG == ThirdCharacter:
        {
            - thirdChar_relationshipIndicator < relationship_indicator_minValue:
               ~ thirdChar_relationshipIndicator =  relationship_indicator_minValue

            - thirdChar_relationshipIndicator > relationship_indicator_maxValue:
               ~ thirdChar_relationshipIndicator =  relationship_indicator_maxValue
        }

    - else: ERROR, PNG non riscontrato.
        

}


