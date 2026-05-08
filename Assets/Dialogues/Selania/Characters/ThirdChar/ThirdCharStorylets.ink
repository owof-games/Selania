=== third_char_main_storylets

= one
    //Non mettere cose TW qui
    //Obiettivo: Presentare l’elemento delle bugie. Vengono dette cose sconfessate poi nella terza storia.
    //Contenuto: Compleanno, giochi
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
        
        {charTag(ThirdCharacter, "neutral")}:       Frase
            
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

                
            + \ {charTag(PG, "neutral")}:         Earth
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
                
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                    
            + \ {charTag(PG, "neutral")}:         Aether
                    -> glyph_choice_manager(false, aetherC)->
                
        -    
        {charTag(ThirdCharacter, "neutral")}:       Ma lui mica ci può venire qui.
        

            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:          Earth
                    -> glyph_choice_manager(false, earthC)->
    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                    
            + \ {charTag(PG, "neutral")}:         Aether
                    -> glyph_choice_manager(false, aetherC)->
            -

        -> third_char_closing_storylet ->
        -> options_third_character
   
    = two
    //Non mettere cose TW qui
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(ThirdCharacter, "neutral")}:      Frase

        
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Earth
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->

            + \ {charTag(PG, "neutral")}:         Aether
                -> glyph_choice_manager(false, aetherC)->
            - 
            -> third_char_closing_storylet ->
            -> options_third_character

    = three
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(ThirdCharacter, "neutral")}:       Frase
  

            
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->    
                          
            + \ {charTag(PG, "neutral")}:         Earth
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Aether
                    -> glyph_choice_manager(false, aetherC)->
            -
            
            -> third_char_closing_storylet ->
            -> options_third_character
            

    
    = four
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
        
        {charTag(ThirdCharacter, "neutral")}:       Frase
            
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                    
            + \ {charTag(PG, "neutral")}:         Earth
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->

            + \ {charTag(PG, "neutral")}:         Aether
                    -> glyph_choice_manager(false, aetherC)->
            -
        
        -> third_char_closing_storylet ->
        -> options_third_character

    = five
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
        

        {charTag(ThirdCharacter, "neutral")}:       Frase
        
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Earth
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
        
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                
            + \ {charTag(PG, "neutral")}:         Aether
                    -> glyph_choice_manager(false, aetherC)->
            -

            -> third_char_closing_storylet ->
            -> options_third_character
    

    = six
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(ThirdCharacter, "neutral")}:       Frase
       
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                    
            + \ {charTag(PG, "neutral")}:         Earth
                    -> glyph_choice_manager(false, earthC)->

                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->

            + \ {charTag(PG, "neutral")}:        Aether
                    -> glyph_choice_manager(false, aetherC)->
        - 

        -> third_char_closing_storylet ->            
        -> options_third_character
    

    = seven
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        
        {charTag(ThirdCharacter, "neutral")}:       Frase

            
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Earth
                    -> glyph_choice_manager(false, earthC)->
                        
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->

            + \ {charTag(PG, "neutral")}:         Aether
                    -> glyph_choice_manager(false, aetherC)->      
            -

        -> third_char_closing_storylet ->        
        -> options_third_character     
            
            
    = eight
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(ThirdCharacter, "neutral")}:       Frase

            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Earth
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:          Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
                
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->

            + \ {charTag(PG, "neutral")}:         Aether
                    -> glyph_choice_manager(false, aetherC)->
            -

                -> third_char_closing_storylet ->        
                -> options_third_character 
    
    
    = nine
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(ThirdCharacter, "neutral")}:       Frase

            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                    
            + \ {charTag(PG, "neutral")}:         Earth
                    -> glyph_choice_manager(false, earthC)->

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
   
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                    
            + \ {charTag(PG, "neutral")}:         Aether
                    -> glyph_choice_manager(false, aetherC)->
            -

            -> third_char_closing_storylet ->
            -> options_third_character
    
    = ten
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(ThirdCharacter, "neutral")}:       Frase
 
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Earth
                    -> glyph_choice_manager(false, earthC)->

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                    
            + \ {charTag(PG, "neutral")}:         Aether
                    -> glyph_choice_manager(false, aetherC)->
            -

            -> third_char_closing_storylet ->
            -> options_third_character 
    
    = eleven
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        
        {charTag(ThirdCharacter, "neutral")}:       Frase.
   
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Earth
                    -> glyph_choice_manager(false, earthC)->
                
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                        
            + \ {charTag(PG, "neutral")}:         Aether
                    -> glyph_choice_manager(false, aetherC)->
            -   
                -> third_char_closing_storylet ->
                -> options_third_character 
    
    = twelve
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(ThirdCharacter, "neutral")}:       Frase

            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                    
            + \ {charTag(PG, "neutral")}:         Earth
                    -> glyph_choice_manager(false, earthC)->

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                
            + \ {charTag(PG, "neutral")}:         Aether
                    -> glyph_choice_manager(false, aetherC)->
        - 

            -> third_char_closing_storylet ->
            -> options_third_character   