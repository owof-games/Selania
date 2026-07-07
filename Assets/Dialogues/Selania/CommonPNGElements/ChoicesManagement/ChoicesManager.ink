//Questa lista serve per evitare le reazioni alle scelte (senza sigillo) di chi sta parlando, e non creare confusione.
VAR list_currentActors = ()
VAR glyph_itIsRewriting = false
VAR glyph_rewritingMultiplier = 3


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

//Se sigillo non attivo
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

//Se siamo in riscrittura, moltiplichiamo per il valore previsto
{glyph_itIsRewriting:

    ~ variationFire = variationFire  * glyph_rewritingMultiplier
    ~ variationAir = variationAir * glyph_rewritingMultiplier
    ~ variationWater = variationWater  * glyph_rewritingMultiplier
    ~ variationAether = variationAether * glyph_rewritingMultiplier
    ~ variationEarth = variationEarth * glyph_rewritingMultiplier

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
    //Svuotiamo list_currentActors
    ->->
}


=== updatePNGCounters(currentCharacter, GlyphC, variationAir, variationWater, variationAether, variationFire, variationEarth)
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
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

//Animazione utilizzo sigillo
{
    - glyph_actualActiveSigil != ():
        @sigilInfluence
}

// Genero reazione
{currentCharacter:
    - FirstCharacter:
        {reaction:
            - neutral:
                {
                - glyph_actualActiveSigil == () && list_currentActors hasnt FirstCharacter:
                    {shuffle:
                        - {charTag(FirstCharacter, "neutral")}:         Già.
                        - {charTag(FirstCharacter, "neutral")}:         Chiaro.
                        - {charTag(FirstCharacter, "neutral")}:         Mhm.
                    }
                - glyph_actualActiveSigil != ():
                    {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il canto di {sigils_translator(glyph_actualActiveSigil)} lascia {charNameOne} indifferente.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Gli accordi di {sigils_translator(glyph_actualActiveSigil)} non suscitano l'interesse di {charNameOne}.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il fraseggio di {sigils_translator(glyph_actualActiveSigil)} viene ignorato da {charNameOne}.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il timbro di {sigils_translator(glyph_actualActiveSigil)} scivola su {charNameOne} senza lasciare tracce.</i>
                    }
                }     

            //Per la parte positiva o negativa se c'è sigillo attivo scrivo anche un commento.
            - positive:
                {
                - glyph_actualActiveSigil == () && list_currentActors hasnt FirstCharacter:
                    {shuffle:
                    - {charTag(FirstCharacter, "affectionate")}:        Woah!
                    - {charTag(FirstCharacter, "affectionate")}:        Totale!
                    - {charTag(FirstCharacter, "curious")}:             Adoro!
                    - {charTag(FirstCharacter, "curious")}:             Amo!
                    }

                - glyph_actualActiveSigil != ():
                    {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>L'energia di {sigils_translator(glyph_actualActiveSigil)} risuona piacevolmente in {charNameOne}.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>La presenza di {sigils_translator(glyph_actualActiveSigil)} rasserena {charNameOne}.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Le vibrazioni di {sigils_translator(glyph_actualActiveSigil)} si accordano a quelle di {charNameOne}.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il ritmo di {sigils_translator(glyph_actualActiveSigil)} e quello di {charNameOne} vibrano in armonia.</i>
                    }
                }    

            - negative:
                {
                - glyph_actualActiveSigil == () && list_currentActors hasnt FirstCharacter:
                    {shuffle:
                    - {charTag(FirstCharacter, "sad")}:                 Bah.
                    - {charTag(FirstCharacter, "annoyed")}:             Vabbè.
                    - {charTag(FirstCharacter, "annoyed")}:             Meh...
                    }
                - glyph_actualActiveSigil != ():
                    {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>La melodia di {sigils_translator(glyph_actualActiveSigil)} infastidisce {charNameOne}.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>{sigils_translator(glyph_actualActiveSigil)} è un fastidioso graffio per le orecchie di {charNameOne}.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>{sigils_translator(glyph_actualActiveSigil)} e {charNameOne} non riescono a risuonare tra loro.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>La metrica di {sigils_translator(glyph_actualActiveSigil)} urta i nervi di {charNameOne}.</i>
                    }
                }      
        }

    - SecondCharacter:
        {reaction:
            - neutral:
                {
                - glyph_actualActiveSigil == () && list_currentActors hasnt SecondCharacter:
                    {shuffle:
                    - {charTag(SecondCharacter, "neutral")}:            Ok.
                    - {charTag(SecondCharacter, "neutral")}:            Certo.
                    - {charTag(SecondCharacter, "neutral")}:            Mhm.
                    }
                - glyph_actualActiveSigil != ():
                    {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>{sigils_translator(glyph_actualActiveSigil)} non riesce a distrarre {charNameTwo} dalla voglia di toccare le libellule.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>{sigils_translator(glyph_actualActiveSigil)} viene ignorato da{charNameTwo}, che pensa soltanto alle caramelle.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>{sigils_translator(glyph_actualActiveSigil)} vfa venire a {charNameTwo} voglia di dormire.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il suono di {sigils_translator(glyph_actualActiveSigil)} passa su {charNameTwo} senza destare la sua attenzione.</i>
                    }
                }    

            //Per la parte positiva o negativa se c'è sigillo attivo scrivo anche un commento.
            - positive:
                {
                - glyph_actualActiveSigil == () && list_currentActors hasnt SecondCharacter:
                    {shuffle:
                    - {charTag(SecondCharacter, "emotional")}:          Uuuuh!
                    - {charTag(SecondCharacter, "emotional")}:          Oooh!
                    - {charTag(SecondCharacter, "energy")}:             Wow!
                    - {charTag(SecondCharacter, "energy")}:             Siii!
                    }
                - glyph_actualActiveSigil != ():
                    {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il profumo di {sigils_translator(glyph_actualActiveSigil)} per {charNameTwo} è come una stanza piena di caramelle.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Davanti ai colori di {sigils_translator(glyph_actualActiveSigil)}, {charNameTwo} pensa a un pomeriggio di gioco con suo fratello.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>La consistenza di {sigils_translator(glyph_actualActiveSigil)} ricorda a {charNameTwo} il prociorso.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>{sigils_translator(glyph_actualActiveSigil)} lascia nella bocca di {charNameTwo} un sapore di cioccolato.</i>
                    }
                }        

            - negative:
                {
                - glyph_actualActiveSigil == () && list_currentActors hasnt SecondCharacter:
                    {shuffle:
                    - {charTag(SecondCharacter, "angry")}:              No?
                    - {charTag(SecondCharacter, "angry")}:              ???
                    - {charTag(SecondCharacter, "melanchonic")}:        Ah.
                    - {charTag(SecondCharacter, "melanchonic")}:        Uff.
                    }
                - glyph_actualActiveSigil != ():
                    {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>{sigils_translator(glyph_actualActiveSigil)} ricorda a {charNameTwo} le ore di ginnastica.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>{charNameTwo} reagisce a {sigils_translator(glyph_actualActiveSigil)} come se fosse un castigo.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>{sigils_translator(glyph_actualActiveSigil)} fa pensare a {charNameTwo} a un cane bellissimo che non può coccolare.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>{sigils_translator(glyph_actualActiveSigil)} per {charNameTwo} sa di broccolo.</i>
                    }
                }       
        }

    - ThirdCharacter:
    //Blocco le reazioni di PNG3 durante le lettere
    {ThirdCharacterLetters == false:

        {reaction:
            - neutral:
                {
                - glyph_actualActiveSigil == () && list_currentActors hasnt ThirdCharacter:
                    {shuffle:
                    - {charTag(ThirdCharacter, "neutral")}:             Ok.
                    - {charTag(ThirdCharacter, "neutral")}:             Certo.
                    - {charTag(ThirdCharacter, "neutral")}:             Mhm.
                    }
                - glyph_actualActiveSigil != ():
                    {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>{sigils_translator(glyph_actualActiveSigil)} è una mediocre serata al Baretto per {charNameThree}.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il dribbling di {sigils_translator(glyph_actualActiveSigil)} è per {charNameThree} come un gol durante un'amichevole.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>{sigils_translator(glyph_actualActiveSigil)} entusiasma {charNameThree} tanto quanto un silenzioso cliente abituale.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>{sigils_translator(glyph_actualActiveSigil)} è per {charNameThree} come una partita da zero a zero.</i>
                    }
                }    

            //Per la parte positiva o negativa se c'è sigillo attivo scrivo anche un commento.
            - positive:
                {
                - glyph_actualActiveSigil == () && list_currentActors hasnt ThirdCharacter:
                    {shuffle:
                    - {charTag(ThirdCharacter, "neutral")}:             Uuuuh!
                    - {charTag(ThirdCharacter, "neutral")}:             Oooh!
                    - {charTag(ThirdCharacter, "neutral")}:             Wow!
                    - {charTag(ThirdCharacter, "neutral")}:             Siii!
                    }
                - glyph_actualActiveSigil != ():
                    {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>{sigils_translator(glyph_actualActiveSigil)} è come birra fresca nella gola di {charNameThree}.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>{sigils_translator(glyph_actualActiveSigil)} ricorda a {charNameThree} i Mondiali del 2006.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>{sigils_translator(glyph_actualActiveSigil)} fa sentire {charNameThree} come un vero bomber.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Nel cuore di {charNameThree} {sigils_translator(glyph_actualActiveSigil)} segna una doppietta.</i>
                    }
                }        

            - negative:
                {
                - glyph_actualActiveSigil == () && list_currentActors hasnt ThirdCharacter:
                    {shuffle:
                    - {charTag(ThirdCharacter, "neutral")}:             Uuuuh!
                    - {charTag(ThirdCharacter, "neutral")}:             Oooh!
                    - {charTag(ThirdCharacter, "neutral")}:             Wow!
                    - {charTag(ThirdCharacter, "neutral")}:             Siii!
                    }
                - glyph_actualActiveSigil != ():
                    {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>{sigils_translator(glyph_actualActiveSigil)} ricorda a {charNameThree} una sciapa birra calda.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>{sigils_translator(glyph_actualActiveSigil)} lascia in bocca a {charNameThree} il sapore della birra analcolica.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>{sigils_translator(glyph_actualActiveSigil)} innervosisce {charNameThree}, che pensa all'autogol di Škriniar.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>{sigils_translator(glyph_actualActiveSigil)} per {charNameThree} è una partita persa a tavolino.</i>
                    }
                }     
        }

    }

    - FourthCharacter:
        {reaction:
            - neutral:
                {
                - glyph_actualActiveSigil == () && list_currentActors hasnt FourthCharacter:
                    {shuffle:
                        - Reazione neutra al sigillo.
                        - Altra reazione neutra al sigillo.
                        - Un'altra ancora reazione neutra al sigillo.
                    }
                - glyph_actualActiveSigil != ():
                    {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il canto di {sigils_translator(glyph_actualActiveSigil)} lascia {charNameOne} indifferente.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Gli accordi di {sigils_translator(glyph_actualActiveSigil)} non suscitano l'interesse di {charNameOne}.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il fraseggio di {sigils_translator(glyph_actualActiveSigil)} viene ignorato da {charNameOne}.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il timbro di {sigils_translator(glyph_actualActiveSigil)} scivola su {charNameOne} senza lasciare tracce.</i>
                    }
                }
            //Per la parte positiva o negativa se c'è sigillo attivo scrivo anche un commento.
            - positive:
                {
                - glyph_actualActiveSigil == () && list_currentActors hasnt FourthCharacter:
                    {shuffle:
                    - Reazione positiva al sigillo.
                    - Altra reazione positiva al sigillo.
                    - Un'altra ancora reazione positiva al sigillo.
                    }
                - glyph_actualActiveSigil != ():
                    {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il canto di {sigils_translator(glyph_actualActiveSigil)} lascia {charNameOne} indifferente.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Gli accordi di {sigils_translator(glyph_actualActiveSigil)} non suscitano l'interesse di {charNameOne}.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il fraseggio di {sigils_translator(glyph_actualActiveSigil)} viene ignorato da {charNameOne}.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il timbro di {sigils_translator(glyph_actualActiveSigil)} scivola su {charNameOne} senza lasciare tracce.</i>
                    }
                }    

            - negative:
                {
                - glyph_actualActiveSigil == () && list_currentActors hasnt FourthCharacter:
                    {shuffle:
                    - Reazione negativa al sigillo.
                    - Altra reazione negativa al sigillo.
                    - Un'altra ancora negativa positiva al sigillo.
                    }
                - glyph_actualActiveSigil != ():
                    {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il canto di {sigils_translator(glyph_actualActiveSigil)} lascia {charNameOne} indifferente.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Gli accordi di {sigils_translator(glyph_actualActiveSigil)} non suscitano l'interesse di {charNameOne}.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il fraseggio di {sigils_translator(glyph_actualActiveSigil)} viene ignorato da {charNameOne}.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il timbro di {sigils_translator(glyph_actualActiveSigil)} scivola su {charNameOne} senza lasciare tracce.</i>
                    }
                }   
        }     

    - FifthCharacter:
        {reaction:
            - neutral:
                {
                - glyph_actualActiveSigil == () && list_currentActors hasnt FifthCharacter:
                    {shuffle:
                        - Reazione neutra al sigillo.
                        - Altra reazione neutra al sigillo.
                        - Un'altra ancora reazione neutra al sigillo.
                    }
                - glyph_actualActiveSigil != ():
                    {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il canto di {sigils_translator(glyph_actualActiveSigil)} lascia {charNameOne} indifferente.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Gli accordi di {sigils_translator(glyph_actualActiveSigil)} non suscitano l'interesse di {charNameOne}.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il fraseggio di {sigils_translator(glyph_actualActiveSigil)} viene ignorato da {charNameOne}.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il timbro di {sigils_translator(glyph_actualActiveSigil)} scivola su {charNameOne} senza lasciare tracce.</i>
                    }
                }
            //Per la parte positiva o negativa se c'è sigillo attivo scrivo anche un commento.
            - positive:
                {
                - glyph_actualActiveSigil == () && list_currentActors hasnt FifthCharacter:
                    {shuffle:
                    - Reazione positiva al sigillo.
                    - Altra reazione positiva al sigillo.
                    - Un'altra ancora reazione positiva al sigillo.
                    }
                - glyph_actualActiveSigil != ():
                    {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il canto di {sigils_translator(glyph_actualActiveSigil)} lascia {charNameOne} indifferente.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Gli accordi di {sigils_translator(glyph_actualActiveSigil)} non suscitano l'interesse di {charNameOne}.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il fraseggio di {sigils_translator(glyph_actualActiveSigil)} viene ignorato da {charNameOne}.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il timbro di {sigils_translator(glyph_actualActiveSigil)} scivola su {charNameOne} senza lasciare tracce.</i>
                    }
                }    

            - negative:
                {
                - glyph_actualActiveSigil == () && list_currentActors hasnt FifthCharacter:
                    {shuffle:
                    - Reazione negativa al sigillo.
                    - Altra reazione negativa al sigillo.
                    - Un'altra ancora negativa positiva al sigillo.
                    }
                - glyph_actualActiveSigil != ():
                    {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il canto di {sigils_translator(glyph_actualActiveSigil)} lascia {charNameOne} indifferente.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Gli accordi di {sigils_translator(glyph_actualActiveSigil)} non suscitano l'interesse di {charNameOne}.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il fraseggio di {sigils_translator(glyph_actualActiveSigil)} viene ignorato da {charNameOne}.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:           <i>Il timbro di {sigils_translator(glyph_actualActiveSigil)} scivola su {charNameOne} senza lasciare tracce.</i>
                    }
                }   
        }     

    - Mentor:
        {list_currentActors hasnt FifthCharacter:
            {shuffle:
            - {charTag(FifthCharacter, "neutral")}:                             Sì sì.
            - {charTag(FifthCharacter, "neutral")}:                             Ok.
            - {charTag(FifthCharacter, "neutral")}:                             Eh.
            - {charTag(FifthCharacter, "neutral")}:                             Mhm.
            - {charTag(FifthCharacter, "neutral")}:                             Chiaro.
            - {charTag(FifthCharacter, "neutral")}:                             Già.
            } 
        }    
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

    ~ temp max = MAX(secondChar_aether, MAX(secondChar_earth, MAX(secondChar_air, MAX(secondChar_water, secondChar_fire))))
    ~ temp min = MIN(secondChar_aether, MIN(secondChar_earth, MIN(secondChar_air, MIN(secondChar_water, secondChar_fire))))
    ~ temp sum = secondChar_aether + secondChar_earth + secondChar_air + secondChar_water + secondChar_fire

    // calcola il risultato
    ~ temp result = 2 * (max - min) - sum

    // limitalo tra -9 e +9
    {
        - result < relationship_indicator_minValue:
            ~ result = relationship_indicator_minValue
        - result > relationship_indicator_maxValue:
            ~ result = relationship_indicator_maxValue
    }

    // ritorna il risultato
    ~ secondChar_relationshipIndicator  = result


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
        //Se siamo nella seconda fase sono considerate positive le scelte acqua e spirito:
        - thirdChar_storyStatus == story_storyRemote:
            ~ thirdChar_relationshipIndicator = thirdChar_water + thirdChar_aether - thirdChar_earth - thirdChar_fire - thirdChar_air

    }


=== function updateFourthCharacterRelation()
// DA CREARE
~ secondChar_relationshipIndicator = secondChar_aether + secondChar_water - secondChar_air

=== function updateFifthCharacterRelation()
// DA CREARE
~ secondChar_relationshipIndicator = secondChar_aether + secondChar_water - secondChar_air




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

