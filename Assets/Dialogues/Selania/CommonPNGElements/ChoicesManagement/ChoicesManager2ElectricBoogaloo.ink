VAR firstChar_lastRelationshipIndicator = 0
VAR secondChar_lastRelationshipIndicator = 0
VAR thirdChar_lastRelationshipIndicator = 0
VAR fourthChar_lastRelationshipIndicator = 0
VAR fifthChar_lastRelationshipIndicator = 0

=== glyph_modifier_variation_management2(isPG, GlyphC)
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
    // ...
}
// Salva contatore glifi in contatore glifi precedente
{currentCharacter:
    - FirstCharacter:
        ~ firstChar_last_aether = firstChar_aether
        ~ firstChar_last_earth = firstChar_earth
        ~ firstChar_last_air = firstChar_air
        ~ firstChar_last_water = firstChar_water
        ~ firstChar_last_fire = firstChar_fire
    // ...
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
    // ...
}
// Aggiorna contatore scelte
{currentCharacter:
    - FirstCharacter:
        ~ firstChar_totalChoices++
    // ...
}
// Aggiorna contatore glifi con valore sigillo
{currentCharacter:
    - FirstCharacter:
    OOOOOOOOOOOOOOOOO Aggiorna contatore glifi con valore sigilloOOOOOOOOOOOOOOOOO 
    variationFire è {variationFire}
        ~ firstChar_fire += variationFire 
        ~ firstChar_earth += variationEarth
        ~ firstChar_air += variationAir
        ~ firstChar_water += variationWater
        ~ firstChar_aether += variationAether
    // ...
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
    //
}
// Calcolo valore di reazione da relazione e relazione precedente
~ temp relationshipChange = 0
{currentCharacter:
    - FirstCharacter:
        ~ relationshipChange = firstChar_relationshipIndicator - firstChar_lastRelationshipIndicator
    // ...
}
~ temp reaction = positive
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
    // ...
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
// TODO
~ firstChar_relationshipIndicator = firstChar_aether + firstChar_water - firstChar_air


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