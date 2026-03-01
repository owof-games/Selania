=== glyph_modifier(partner, number)
//funzione utile per modificare botte di GlyphCi
{debug: passo per glyph_modifier. Il valore di partner è {partner}, quello di number è {number}.}

    {
        - partner == FirstCharacter:
            ~ firstChar_aether = firstChar_aether * number
            ~ firstChar_earth = firstChar_earth * number
            ~ firstChar_air = firstChar_air * number
            ~ firstChar_water = firstChar_water * number
            ~ firstChar_fire= firstChar_fire* number
            
    
        - partner == SecondCharacter:
            ~ secondChar_aether = secondChar_aether * number
            ~ secondChar_earth = secondChar_earth * number
            ~ secondChar_air = secondChar_air * number
            ~ secondChar_water = secondChar_water * number
            ~ secondChar_fire = secondChar_fire * number

    }
->->
  
//Funzione di dispatch comune (sigillo attivo o meno)

=== glyph_modifier_variation_management(PNG, GlyphC, VARPG)
{debug_nest: passo per glyph_modifier_variation_management. Il valore di PNG è {PNG}, il valore di GlyphCe è {GlyphC}. Lo stato della parola attiva è {glyph_actualActiveSigil}.}
    
    //Primo step: capiamo di chi si parla.

        {
            - PNG == FirstCharacter:
                    ~ glyph_currentTalker = FirstCharacter
                    {debug_nest: dopo l'operazione il parlante attuale {glyph_currentTalker}.} 
            
            - PNG == SecondCharacter:
                    ~ glyph_currentTalker = SecondCharacter
                    {debug_nest: dopo l'operazione il parlante attuale {glyph_currentTalker}.} 
            
            - PNG == Mentor:
                    ~ glyph_currentTalker = Mentor
                    {debug_nest: dopo l'operazione il parlante attuale {glyph_currentTalker}.}
                    
            - PNG == PG:
            //Nel caso dellx PG, non attivo mai le parole magiche.
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

        //Secondo step: aggiorniamo glifi PG se stato positivo
        //Nota: per ora sono tutti i varPGYes, da valutare lato design che farne
        {VARPG == varPGYes:
            {debug_nest: cambio il GlyphCe della PG, perché è la prima volta per questa scelta.}
            
            {
                - PNG == FirstCharacter:
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
                    
                - PNG == Mentor:
                    {GlyphC:
                            -fireC:
                                ~ player_fire_mentor ++
                        
                            -earthC:
                                ~ player_earth_mentor ++
                            
                            -airC:
                                ~ player_air_mentor ++
                            
                            -waterC:
                                ~ player_water_mentor ++   
                            
                            -aetherC:
                                ~ player_aether_mentor ++
                    }

            }
        }    


    //Terzo step: valuto se c'è o meno un sigillo attivo, altrimenti proseguiamo regolarmente.
    {
        //Se sigillo attivo, andiamo a formula ad hoc
        - glyph_actualActiveSigil != ():
            {debug_nest: è attiva la parola magica {glyph_actualActiveSigil}, per cui mi sposto al settore dedicato.}
                -> sigil_glyph_updater
        
        
        //Altrimenti aumentiamo di uno come sempre

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
            //E poi aggiorniamo i dettagli
                    -> update_PNG_glyph_values
        
    }


    = sigil_glyph_updater
    //Terzo step: calcolo la variazione di GlyphCe generata dal sigillo.
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


    ->->

    = sigil_PNG_comment

    //Qui inseriamo il commento progressivo, es.
    {glyph_actualActiveSigil:
        
        - FireAirWater:
            {stopping:
                - Prima frase.
                - Seconda frase.
                - Terza frase.
            }

        - FireAirEarth:
            {stopping:
                - Prima frase.
                - Seconda frase.
                - Terza frase.
            }    
        
    }


    -> sigil_PNG_reactions

    = sigil_PNG_reactions
    //Qui invece abbiamo le reazioni dellx PNG
    {
        - glyph_currentTalker == FirstCharacter:
            -> sigil_FirstCharacter_reactions
        
        - glyph_currentTalker == SecondCharacter:
            -> sigil_SecondCharacter_reactions

        - glyph_currentTalker == Mentor:
            -> sigil_Mentor_reactions

    }


    = sigil_FirstCharacter_reactions
    //Qui settiamo le reazioni ad hoc. Per esempio FirstChar avrà le sue reazioni in base alle variazioni di Air, Water, Aether.


    -> update_PNG_glyph_values
    
    
    = sigil_SecondCharacter_reactions

    
    
    -> update_PNG_glyph_values
    
    = sigil_Mentor_reactions



    -> update_PNG_glyph_values



= update_PNG_glyph_values
    {debug_nest: entro in update_PNG_glyph_values.}
    {debug_nest: prima dell'operazione il parlante attuale è {glyph_currentTalker}.}
    //Prima aggiorniamo i dati a seconda dei parlanti
    {
        - glyph_currentTalker == FirstCharacter:
            ~ firstChar_fire+= glyph_temporaryFire 
            ~ firstChar_earth += glyph_temporaryEarth
            ~ firstChar_air += glyph_temporaryAir
            ~ firstChar_water += glyph_temporaryWater
            ~ firstChar_aether += glyph_temporaryAether
        
        - glyph_currentTalker == SecondCharacter:
            ~ secondChar_fire += glyph_temporaryFire 
            ~ secondChar_earth += glyph_temporaryEarth
            ~ secondChar_air += glyph_temporaryAir
            ~ secondChar_water += glyph_temporaryWater
            ~ secondChar_aether += glyph_temporaryAether
        
        - glyph_currentTalker == Mentor:
            ~ mentor_fire += glyph_temporaryFire 
            ~ mentor_earth += glyph_temporaryEarth
            ~ mentor_air += glyph_temporaryAir
            ~ mentor_water += glyph_temporaryWater
            ~ mentor_aether += glyph_temporaryAether
    }

    //Poi azzeriamo i valori temporanei
        ~ glyph_currentTalker = ()
        ~ glyph_temporaryFire  = 0
        ~ glyph_temporaryEarth = 0
        ~ glyph_temporaryAir= 0
        ~ glyph_temporaryWater= 0
        ~ glyph_temporaryAether = 0
    {debug_nest: dopo l'operazione il parlante attuale {glyph_currentTalker}.}

->update_sigil_value


= update_sigil_value
//Qui infine aggiorniamo l'utilizzo del sigillo.
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















