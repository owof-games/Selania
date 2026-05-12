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
            + \ {charTag(PG, "neutral")}:               Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:               Scelta spirito
                    -> glyph_choice_manager(false, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:               Cosa ti renderà più stabile? da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:               Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                
            
            + \ {charTag(PG, "neutral")}:               Cosa vuoi? Come puoi cambiare questa situazione?
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