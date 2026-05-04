=== fourth_read_story_library
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

    {charTag(FourthCharacter, "neutral")}:       Racconto letto in biblioteca.
    A racconto scelto, cambia anche logica in Special Storylets
    Potrebbe aver senso il racconti di Maura, visto che lo percepirebbe come ostile (misandrico?)
    - 
            + \ {charTag(PG, "neutral")}:               Scelta acqua
                    -> glyph_choice_manager(false, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:               Scelta spirito
                    -> glyph_choice_manager(false, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:               Scelta terra
                    -> glyph_choice_manager(false, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:               Scelta aria
                    -> glyph_choice_manager(false, airC)->
                
            
            + \ {charTag(PG, "neutral")}:               Scelta fuoco
                    -> glyph_choice_manager(false, fireC)-> 
                
            -
        -> fourth_char_closing_storylet ->
        ->->


=== dog_fourth_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
   
   {charTag(FourthCharacter, "neutral")}:       {charNameFour} ci parla di Ursula.

    -> fourth_char_closing_storylet ->
    ->->        