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

        {
                - thirdChar_recordedPlayerPronoun == ():
                {charTag(ThirdCharacter, "neutral")}:       Immagino che si debba partire con le presentazioni, giusto? Chi sei?
                        -> name_choice.top2 ->
                        -> gender.top ->
                        ~ thirdChar_recordedPlayerPronoun += player_pronoun     
        }

        {
                - player_pronoun == him:
                {charTag(PG, "neutral")}:               Prima ho sentito che ti chiami {player_name} e che sei un ragazzo!
                                                        Detto tra noi, meno male, perché tra {charNameOne} e {charNameFive} serve un po' di testosterone a compensare!

                - player_pronoun == her:
                {charTag(PG, "neutral")}:               Prima ho sentito che ti chiami {player_name} e che sei una ragazza.
                                                        Immagino che tra la presenza di {charNameOne} e quella di {charNameFive}, tu sia felice di trovare un po' di varietà.
                - player_pronoun == they:
                {charTag(PG, "neutral")}:               Prima ho sentito che ti chiami {player_name} e che sei una persona non binaria.
                                                        Spero di non sbagliare cose tipo pronomi o così via, giuro che ci provo!

        }   

        {charTag(PG, "neutral")}:                       Comunque io sono {charNameThree}.
                                                        Cioè, non sono davvero {charNameThree}.
                                                        Ma è da quando sono arrivato che se penso a me stesso mi sento questo nome in testa.
                                                        Non ho ancora avuto il coraggio di guardare che aspetto ho.

        
        {charTag(ThirdCharacter, "neutral")}:       Frase
            
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
                
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
                
        -    
        {charTag(ThirdCharacter, "neutral")}:       Ma lui mica ci può venire qui.
        

            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:          Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
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

        
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->

            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
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
  

            
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->    
                          
            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
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
            
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->

            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
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
        
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
        
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
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
       
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->

                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->

            + \ {charTag(PG, "neutral")}:        Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
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

            
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                        
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->

            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
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

            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:          Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
                
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->

            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
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

            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
   
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
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
 
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
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
   
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                        
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
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

            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
        - 

            -> third_char_closing_storylet ->
            -> options_third_character   