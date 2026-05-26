=== glyph_choice_manager(isPG, GlyphC)
{isPG:
    -> updatePGCounters(GlyphC)
- else:
    ~ temp variationAir = 0
    ~ temp variationWater = 0
    ~ temp variationAether = 0
    ~ temp variationFire = 0
    ~ temp variationEarth = 0
    ~ updateVariationVariables(GlyphC, variationAir, variationWater, variationAether, variationFire, variationEarth)
    ~ temp charactersInScene = getCharactersInScene()
    -> updatePNGInSceneCounters(charactersInScene, GlyphC, variationAir, variationWater, variationAether, variationFire, variationEarth)
}


=== function updateVariationVariables(GlyphC, ref variationAir, ref variationWater, ref variationAether, ref variationFire, ref variationEarth)
{glyph_actualActiveSigil:
    {
        //Calcolo del primo livello
        - glyph_firstFire has glyph_actualActiveSigil:
            ~ variationFire += 2

        - glyph_firstEarth has glyph_actualActiveSigil:
            ~ variationEarth += 2

        - glyph_firstAir has glyph_actualActiveSigil:
            ~ variationAir += 2

        - glyph_firstWater has glyph_actualActiveSigil:
            ~ variationWater += 2

        - glyph_firstAether has glyph_actualActiveSigil:
            ~ variationAether += 2
    }

    {
        //Calcolo del secondo livello
        - glyph_secondFire has glyph_actualActiveSigil:
            ~ variationFire += 1

        - glyph_secondEarth has glyph_actualActiveSigil:
            ~ variationEarth += 1

        - glyph_secondAir has glyph_actualActiveSigil:
            ~ variationAir += 1

        - glyph_secondWater has glyph_actualActiveSigil:
            ~ variationWater += 1

        - glyph_secondAether has glyph_actualActiveSigil:
            ~ variationAether += 1            
    }

    {
        //Calcolo del terzo livello
        - glyph_thirdFire has glyph_actualActiveSigil:
            ~ variationFire -= 2

        - glyph_thirdEarth has glyph_actualActiveSigil:
            ~ variationEarth -= 2

        - glyph_thirdAir has glyph_actualActiveSigil:
            ~ variationAir -= 2

        - glyph_thirdWater has glyph_actualActiveSigil:
            ~ variationWater -= 2

        - glyph_thirdAether has glyph_actualActiveSigil:
            ~ variationAether -= 2
    }
- else:
       {GlyphC:
        - fireC:
            ~ variationFire += 1
        - airC:
            ~ variationAir += 1
        - waterC:
            ~ variationWater += 1
        - aetherC:
            ~ variationAether += 1
        - earthC:
            ~ variationEarth += 1            

       } 
}


=== function getCharactersInScene()
~ temp characters = ()

{   //Se la funzione viene chiamata durante le lettere di PNG3, è l'unico PNG ad essere aggiornato.
    - ThirdCharacterLetters == true:
        ~ characters += ThirdCharacter

    - else:
    // calcola le personagge in scena in una variabile temporanea e la ritorna
        {
            - are_two_entities_together(PG, FirstCharacter):
                ~ characters += FirstCharacter
        }
        {
            - are_two_entities_together(PG, SecondCharacter):
                ~ characters += SecondCharacter
        }
        {
            - are_two_entities_together(PG, ThirdCharacter):
                ~ characters += ThirdCharacter
        }
        {
            - are_two_entities_together(PG, FourthCharacter):
                ~ characters += FourthCharacter
        }
        {
            - are_two_entities_together(PG, FifthCharacter):
                ~ characters += FifthCharacter
        }
        {
            - are_two_entities_together(PG, Mentor):
                ~ characters += Mentor                    
        }
}

~ return characters


=== updatePGCounters(GlyphC)
// aggiorna il contatore glifi di PG basandosi su GlyphC
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


=== updatePNGInSceneCounters(charactersInScene, GlyphC, variationAir, variationWater, variationAether, variationFire, variationEarth)
{
- charactersInScene:
    ~ temp currentCharacter = LIST_RANDOM(charactersInScene)
    ~ charactersInScene -= currentCharacter
    -> updatePNGCounters(currentCharacter, GlyphC, variationAir, variationWater, variationAether, variationFire, variationEarth) ->
    -> updatePNGInSceneCounters(charactersInScene, GlyphC, variationAir, variationWater, variationAether, variationFire, variationEarth)
- glyph_actualActiveSigil:
    -> sigilUpdates
- else:
    ->->
}


=== updatePNGCounters(currentCharacter, GlyphC, variationAir, variationWater, variationAether, variationFire, variationEarth)
// Salva valore di relazione in valore di relazione precedente
{currentCharacter:
    - FirstCharacter:
        ~ firstChar_lastRelationshipIndicator = firstChar_relationshipIndicator
    
    - SecondCharacter:
        ~ secondChar_lastRelationshipIndicator = secondChar_relationshipIndicator
    
    - ThirdCharacter:
        ~ thirdChar_lastRelationshipIndicator = thirdChar_relationshipIndicator
    
    - FourthCharacter:
        ~ fourthChar_lastRelationshipIndicator = fourthChar_relationshipIndicator
    
    - FifthCharacter:
        ~ fifthChar_lastRelationshipIndicator = fifthChar_relationshipIndicator
}
// Salva contatore glifi in contatore glifi precedente
{currentCharacter:
    - FirstCharacter:
        ~ firstChar_last_aether = firstChar_aether
        ~ firstChar_last_earth = firstChar_earth
        ~ firstChar_last_air = firstChar_air
        ~ firstChar_last_water = firstChar_water
        ~ firstChar_last_fire = firstChar_fire

    - SecondCharacter:
        ~ secondChar_last_aether = secondChar_aether
        ~ secondChar_last_earth = secondChar_earth
        ~ secondChar_last_air = secondChar_air
        ~ secondChar_last_water = secondChar_water
        ~ secondChar_last_fire = secondChar_fire    
    
    - ThirdCharacter:
        ~ thirdChar_last_aether = thirdChar_aether
        ~ thirdChar_last_earth = thirdChar_earth
        ~ thirdChar_last_air = thirdChar_air
        ~ thirdChar_last_water = thirdChar_water
        ~ thirdChar_last_fire = thirdChar_fire

    - FourthCharacter:
        ~ fourthChar_last_aether = fourthChar_aether
        ~ fourthChar_last_earth = fourthChar_earth
        ~ fourthChar_last_air = fourthChar_air
        ~ fourthChar_last_water = fourthChar_water
        ~ fourthChar_last_fire = fourthChar_fire

    - FifthCharacter:
        ~ fifthChar_last_aether = fifthChar_aether
        ~ fifthChar_last_earth = fifthChar_earth
        ~ fifthChar_last_air = fifthChar_air
        ~ fifthChar_last_water = fifthChar_water
        ~ fifthChar_last_fire = fifthChar_fire        
}
// Aggiorna contatore pulito
{currentCharacter:
    - FirstCharacter:
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

     - SecondCharacter:
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

    - ThirdCharacter:
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

    - FourthCharacter:
        {GlyphC:
            -fireC:
                ~ player_fire_fourth_char ++
            -earthC:
                ~ player_earth_fourth_char ++
            -airC:
                ~ player_air_fourth_char ++
            -waterC:
                ~ player_water_fourth_char ++   
            -aetherC:
                ~ player_aether_fourth_char ++
        }

    - FifthCharacter:
        {GlyphC:
            -fireC:
                ~ player_fire_fifth_char ++
            -earthC:
                ~ player_earth_fifth_char ++
            -airC:
                ~ player_air_fifth_char ++
            -waterC:
                ~ player_water_fifth_char ++   
            -aetherC:
                ~ player_aether_fifth_char ++
        }        
}
// Aggiorna contatore scelte
{currentCharacter:
    - FirstCharacter:
        ~ firstChar_totalChoices ++

    - SecondCharacter:
        ~ secondChar_totalChoices ++

    - ThirdCharacter:
        ~ thirdChar_totalChoices ++

   - FourthCharacter:
        ~ fourthChar_totalChoices ++

    - FifthCharacter:
        ~ fifthChar_totalChoices ++

    - Mentor:
        ~ mentor_totalChoices ++             
}
// Aggiorna contatore glifi con valore sigillo
{currentCharacter:
    - FirstCharacter:
        ~ firstChar_fire += variationFire 
        ~ firstChar_earth += variationEarth
        ~ firstChar_air += variationAir
        ~ firstChar_water += variationWater
        ~ firstChar_aether += variationAether
    
    - SecondCharacter:
        ~ secondChar_fire += variationFire 
        ~ secondChar_earth += variationEarth
        ~ secondChar_air += variationAir
        ~ secondChar_water += variationWater
        ~ secondChar_aether += variationAether
    
    - ThirdCharacter:
        ~ thirdChar_fire += variationFire 
        ~ thirdChar_earth += variationEarth
        ~ thirdChar_air += variationAir
        ~ thirdChar_water += variationWater
        ~ thirdChar_aether += variationAether

    - FourthCharacter:
        ~ fourthChar_fire += variationFire 
        ~ fourthChar_earth += variationEarth
        ~ fourthChar_air += variationAir
        ~ fourthChar_water += variationWater
        ~ fourthChar_aether += variationAether

    - FifthCharacter:
        ~ fifthChar_fire += variationFire 
        ~ fifthChar_earth += variationEarth
        ~ fifthChar_air += variationAir
        ~ fifthChar_water += variationWater
        ~ fifthChar_aether += variationAether

    - Mentor:
        ~ mentor_fire += variationFire 
        ~ mentor_earth += variationEarth
        ~ mentor_air += variationAir
        ~ mentor_water += variationWater
        ~ mentor_aether += variationAether            
}
// Aggiorna contatore sigilli
{glyph_actualActiveSigil:
    {currentCharacter:
        - FirstCharacter:
            ~ firstChar_usedSigil ++
        
        - SecondCharacter:
            ~ secondChar_usedSigil ++
        
        - ThirdCharacter:
            ~ thirdChar_usedSigil ++
        
        - FourthCharacter:
            ~ fourthChar_usedSigil ++
        
        - FifthCharacter:
            ~ fifthChar_usedSigil ++
    }
}
// Aggiorno valore di relazione
{currentCharacter:
    - FirstCharacter:
        ~ updateFirstCharacterRelation()
    
    - SecondCharacter:
        ~ updateSecondCharacterRelation()
    
    - ThirdCharacter:
        ~ updateThirdCharacterRelation()
    
    - FourthCharacter:
        ~ updateFourthCharacterRelation()
    
    - FifthCharacter:
        ~ updateFifthCharacterRelation()            
}
// Calcolo valore di reazione da relazione e relazione precedente
~ temp relationshipChange = 0
{currentCharacter:
    - FirstCharacter:
        ~ relationshipChange = firstChar_relationshipIndicator - firstChar_lastRelationshipIndicator
    
    - SecondCharacter:
        ~ relationshipChange = secondChar_relationshipIndicator - secondChar_lastRelationshipIndicator

    - ThirdCharacter:
        ~ relationshipChange = thirdChar_relationshipIndicator - thirdChar_lastRelationshipIndicator

    - FourthCharacter:
        ~ relationshipChange = fourthChar_relationshipIndicator - fourthChar_lastRelationshipIndicator

    - FifthCharacter:
        ~ relationshipChange = fifthChar_relationshipIndicator - fifthChar_lastRelationshipIndicator            
}
~ temp reaction = positive
// °°°°°° relationshipChange {relationshipChange}
{
    - relationshipChange > 0:
        ~ reaction = positive

    - relationshipChange < 0:
        ~ reaction = negative

    - relationshipChange == 0:
        ~ reaction = neutral
}
// Genero reazione
{currentCharacter:
    - FirstCharacter:
        {reaction:
            - neutral:
                {shuffle:
                    - {charTag(FirstCharacter, "neutral")}:         Già.
                    - {charTag(FirstCharacter, "neutral")}:         Chiaro.
                    - {charTag(FirstCharacter, "neutral")}:         Mhm.
                }

            - positive:
                {shuffle:
                    - {charTag(FirstCharacter, "affectionate")}:     Woah!
                    - {charTag(FirstCharacter, "affectionate")}:     Totale!
                    - {charTag(FirstCharacter, "curious")}:          Adoro!
                    - {charTag(FirstCharacter, "curious")}:          Amo!
                }

            - negative:
                {shuffle:
                    - {charTag(FirstCharacter, "sad")}:             Bah.
                    - {charTag(FirstCharacter, "annoyed")}:         Vabbè.
                    - {charTag(FirstCharacter, "annoyed")}:         Meh...
                }
        }

    - SecondCharacter:
        {reaction:

            - neutral:
                {shuffle:
                    - {charTag(SecondCharacter, "neutral")}:        Ok.
                    - {charTag(SecondCharacter, "neutral")}:        Certo.
                    - {charTag(SecondCharacter, "neutral")}:        Mhm.
                }

            - positive:
                {shuffle:
                    - {charTag(SecondCharacter, "emotional")}:          Uuuuh!
                    - {charTag(SecondCharacter, "emotional")}:          Oooh!
                    - {charTag(SecondCharacter, "energy")}:             Wow!
                    - {charTag(SecondCharacter, "energy")}:             Siii!
                }

            - negative:
                {shuffle:
                    - {charTag(SecondCharacter, "angry")}:              No?
                    - {charTag(SecondCharacter, "angry")}:              ???
                    - {charTag(SecondCharacter, "melanchonic")}:        Ah.
                    - {charTag(SecondCharacter, "melanchonic")}:        Uff.
                }

        }

    - ThirdCharacter:
        //Blocco le reazioni di PNG3 durante le lettere
        {ThirdCharacterLetters == false:

            {reaction:

                - neutral:
                    {shuffle:
                        - {charTag(ThirdCharacter, "neutral")}:        Ok.
                        - {charTag(ThirdCharacter, "neutral")}:        Certo.
                        - {charTag(ThirdCharacter, "neutral")}:        Mhm.
                    }

                - positive:
                    {shuffle:
                        - {charTag(ThirdCharacter, "neutral")}:          Uuuuh!
                        - {charTag(ThirdCharacter, "neutral")}:          Oooh!
                        - {charTag(ThirdCharacter, "neutral")}:          Wow!
                        - {charTag(ThirdCharacter, "neutral")}:          Siii!
                    }

                - negative:
                    {shuffle:
                        - {charTag(ThirdCharacter, "neutral")}:         No?
                        - {charTag(ThirdCharacter, "neutral")}:         ???
                        - {charTag(ThirdCharacter, "neutral")}:         Ah.
                        - {charTag(ThirdCharacter, "neutral")}:         Uff.
                    }

            }

        }

    - FourthCharacter:
        {reaction:

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

    - FifthCharacter:
        {reaction:

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

    - Mentor:
    {shuffle:
        - {charTag(FifthCharacter, "neutral")}:         Sì sì.
        - {charTag(FifthCharacter, "neutral")}:         Ok.
        - {charTag(FifthCharacter, "neutral")}:         Eh.
        - {charTag(FifthCharacter, "neutral")}:         Mhm.
        - {charTag(FifthCharacter, "neutral")}:         Chiaro.
        - {charTag(FifthCharacter, "neutral")}:         Già.
    }  
}

//Animazione utilizzo sigillo
{
    - glyph_actualActiveSigil != ():
        @animation: ActiveSigil
}
->->


=== sigilUpdates
// Aggiornare contatori utilizzo sigillo
~ glyph_actualSigilUses --
// Aggiornare descrizione grimorio sigillo a tre glifi
~ glyph_grimoireTripleSigilsUpdater()
// C'era un sigillo attivo e l'ho consumato completamente?
{glyph_actualSigilUses == 0:
    // Messaggio di Luna
    {charTag(TheWitch, witch_state())}:   L'effetto di {glyph_actualActiveSigil} si è esaurito.
    //poi aggiorno le informazioni sul sigillo principale
    ~ glyph_grimoireMainSigilsUpdater()
    //sposto il sigillo su quelli utilizzati
    ~ glyph_usedSigils += glyph_actualActiveSigil
    //e svuoto il sigillo attivo
    ~ glyph_actualActiveSigil = ()
}
->->


=== function updateFirstCharacterRelation()
~ firstChar_relationshipIndicator = firstChar_aether + firstChar_water - firstChar_air



=== function updateSecondCharacterRelation()
// DA CREARE
//Step uno: calcolo qual è il colore dominante.
    {
        - (secondChar_aether > secondChar_water) && (secondChar_aether > secondChar_fire) && (secondChar_aether > secondChar_air) && (secondChar_aether > secondChar_earth):
                ~ secondChar_relationshipActualDominantGlyphValue = secondChar_aether
                ~ secondChar_relationshipActualDominantGlyph  = aetherC
    
        - (secondChar_water > secondChar_aether) && (secondChar_water > secondChar_fire) && (secondChar_water > secondChar_air) && (secondChar_water > secondChar_earth):
                ~ secondChar_relationshipActualDominantGlyphValue = secondChar_water
                ~ secondChar_relationshipActualDominantGlyph  = waterC
           	
        
        - (secondChar_fire > secondChar_water) && (secondChar_fire > secondChar_aether) && (secondChar_fire > secondChar_air) && (secondChar_fire > secondChar_earth):
                ~ secondChar_relationshipActualDominantGlyphValue = secondChar_fire
                ~ secondChar_relationshipActualDominantGlyph  = fireC
         
        
        - (secondChar_earth > secondChar_water) && (secondChar_earth > secondChar_aether) && (secondChar_earth > secondChar_air) && (secondChar_earth > secondChar_fire):
                ~ secondChar_relationshipActualDominantGlyphValue = secondChar_earth
                ~ secondChar_relationshipActualDominantGlyph  = earthC
          
        
        - (secondChar_air > secondChar_water) && (secondChar_air > secondChar_aether) && (secondChar_air > secondChar_earth) && (secondChar_air > secondChar_fire):
                ~ secondChar_relationshipActualDominantGlyphValue = secondChar_air
                ~ secondChar_relationshipActualDominantGlyph  = airC

        - else:
            //In caso di pareggio, per ora la soluzione è che comunque vada a registrare l'ultimo dominante e il suo valore come quello attuale. L'idea è che il pareggio debba essere per forza temporaneo: nessuna scelta genera un valore di incremento o decremento uguale per due glifi diversi, e quindi la volta successiva comunque riemergerà la "rottura" dell'equilibro.
            //questa cosa crea due problemi: se faccio all'inizio cinque scelte diverse, se vado avanti a due colori dominanti.
            ~ secondChar_relationshipLastDominantGlyphValue = secondChar_relationshipActualDominantGlyphValue
                    ~ secondChar_relationshipLastDominantGlyph = secondChar_relationshipActualDominantGlyph
              
    }



//Step due: calcolo il risultato    
    {
        
        - secondChar_relationshipActualDominantGlyph == secondChar_relationshipLastDominantGlyph:
            {
                //Se non cambia glifo dominante ma aumenta il valore, cosa buona
                -secondChar_relationshipActualDominantGlyphValue >= secondChar_relationshipLastDominantGlyphValue:
                        ~ secondChar_relationshipIndicator ++
                
                //Se non cambia glifo dominante ma diminuisce il valore, cosa cattiva
                -secondChar_relationshipActualDominantGlyphValue < secondChar_relationshipLastDominantGlyphValue:
                        ~ secondChar_relationshipIndicator --        
            }
        
        //Eccezione con la prima scelta
        - secondChar_relationshipLastDominantGlyph == ():
            ~ secondChar_relationshipIndicator = 0
        
        //Se cambia glifo dominante, cosa brutta    
        - secondChar_relationshipActualDominantGlyph != secondChar_relationshipLastDominantGlyph:
            ~ secondChar_relationshipIndicator --
        
        //Il resto è neutro        

    }

    //Aggiorno i valori di tracciamento
    ~ secondChar_relationshipLastDominantGlyphValue = secondChar_relationshipActualDominantGlyphValue
    ~ secondChar_relationshipLastDominantGlyph = secondChar_relationshipActualDominantGlyph




=== function updateThirdCharacterRelation()
//Prima di tutto facciamo un check per vedere se thirdChar_recordedPlayerPronoun ha un valore assegnato. Questo perché Boccale ci leggerà in base alla prima interazione che ascolterà passivamente, nel caso in cui non abbiamo avuto lo storylet di presentazione con lui.
{
    - thirdChar_recordedPlayerPronoun == ():
        ~ thirdChar_recordedPlayerPronoun += player_pronoun
}

//Poi si fa il check legato al genere a seconda dello stato della storia.
{
    //Se siamo nella prima fase:
    - thirdChar_storyStatus == story_storyStarted:
        {
            - thirdChar_recordedPlayerPronoun == him:
                ~ thirdChar_relationshipIndicator = thirdChar_air + thirdChar_fire + thirdChar_earth - thirdChar_aether - thirdChar_water
            
            - thirdChar_recordedPlayerPronoun == her:
                ~ thirdChar_relationshipIndicator = thirdChar_water - thirdChar_fire - thirdChar_earth - thirdChar_aether - thirdChar_air

            - thirdChar_recordedPlayerPronoun == they:
                ~ thirdChar_relationshipIndicator = thirdChar_aether - thirdChar_fire - thirdChar_earth - thirdChar_water - thirdChar_air     

        }
    //Se siamo nella seconda fase:
    - thirdChar_storyStatus == story_storyRemote:
        ~ thirdChar_relationshipIndicator = thirdChar_water + thirdChar_aether - thirdChar_earth - thirdChar_fire - thirdChar_air

}


=== function updateFourthCharacterRelation()
// DA CREARE
~ secondChar_relationshipIndicator = secondChar_aether + secondChar_water - secondChar_air

=== function updateFifthCharacterRelation()
// DA CREARE
~ secondChar_relationshipIndicator = secondChar_aether + secondChar_water - secondChar_air



/*
=== function getCleanCharacterGlyphCounter(character, glyph)
{character:
    - FirstCharacter:
        {glyph:
            - fireC:
                ~ return player_fire_first_char
            // ...
        }
    // ...
}

=== function setCleanCharacterGlyphCounter(character, glyph, value)
{character:
    - FirstCharacter:
        {glyph:
            - fireC:
                ~ player_fire_first_char = value
            // ...
        }
    // ...
}
*/






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

    - PNG == FourthCharacter:
        {
            - fourthChar_relationshipIndicator < relationship_indicator_minValue:
               ~ fourthChar_relationshipIndicator =  relationship_indicator_minValue

            - fourthChar_relationshipIndicator > relationship_indicator_maxValue:
               ~ fourthChar_relationshipIndicator =  relationship_indicator_maxValue
        }
        
    - PNG == FifthCharacter:
        {
            - fifthChar_relationshipIndicator < relationship_indicator_minValue:
               ~ fifthChar_relationshipIndicator =  relationship_indicator_minValue

            - fifthChar_relationshipIndicator > relationship_indicator_maxValue:
               ~ fifthChar_relationshipIndicator =  relationship_indicator_maxValue
        }
}

