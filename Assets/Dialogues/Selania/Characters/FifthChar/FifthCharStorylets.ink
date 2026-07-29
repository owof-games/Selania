=== fifth_char_main_storylets

= one
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
            //Aggiungiamo a lista list_currentActors
            ~ list_currentActors += FifthCharacter
    
        
        {charTag(FifthCharacter, "quiet")}:             Dissi che i fiori li avrei comprati io.
                                                        Luba aveva già il suo daffare, e poi era una mattina così fresca!
            
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

                
            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
                
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero ("davvero" è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
                
        -    
        {charTag(FifthCharacter, "quiet")}:       Ma lui mica ci può venire qui.
        

            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:          Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero ("davvero" è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
            -
        Forse avrei dovuto dire la verità sin da subito, ma a volte serve rispettare i propri tempi, vero?
        -> fifth_char_closing_storylet ->
        -> options_fifth_character
   
    = two
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
            //Aggiungiamo a lista list_currentActors
            ~ list_currentActors += FifthCharacter
    

        {charTag(FifthCharacter, "quiet")}:      Frase

        
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero ("davvero" è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->

            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                -> glyph_choice_manager(false, aetherC)->
            - 
            -> fifth_char_closing_storylet ->
            -> options_fifth_character

    = three
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
            //Aggiungiamo a lista list_currentActors
            ~ list_currentActors += FifthCharacter
    

        {charTag(FifthCharacter, "quiet")}:       Frase
  

            
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero ("davvero" è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->    
                          
            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
            -
            
            -> fifth_char_closing_storylet ->
            -> options_fifth_character
            

    
    = four
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
            //Aggiungiamo a lista list_currentActors
            ~ list_currentActors += FifthCharacter
    
        
        {charTag(FifthCharacter, "quiet")}:       Frase
            
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero ("davvero" è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->

            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
            -
        
        -> fifth_char_closing_storylet ->
        -> options_fifth_character

    = five
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
            //Aggiungiamo a lista list_currentActors
            ~ list_currentActors += FifthCharacter
    
        

        {charTag(FifthCharacter, "quiet")}:       Frase
        
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
        
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero ("davvero" è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
            -

            -> fifth_char_closing_storylet ->
            -> options_fifth_character
    

    = six
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
            //Aggiungiamo a lista list_currentActors
            ~ list_currentActors += FifthCharacter
    

        {charTag(FifthCharacter, "quiet")}:       Frase
       
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->

                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero ("davvero" è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->

            + \ {charTag(PG, "neutral")}:        Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
        - 

        -> fifth_char_closing_storylet ->            
        -> options_fifth_character
    