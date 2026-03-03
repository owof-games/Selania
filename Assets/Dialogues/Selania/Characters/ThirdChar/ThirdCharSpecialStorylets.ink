//Questi storylets speciali non tornano sulle opzioni di dialogo, ma sul main        
    === open_the_nest
    //Apertura del nido
    Dialogo in biblioteca.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        + [Scelta blu.]
             -> glyph_modifier_variation_management(SecondCharacter, airC, varPGYes)->
    
        + [Scelta rossa.]
            -> glyph_modifier_variation_management(SecondCharacter, fireC, varPGYes)->
     
        + [Scelta viola.]
                -> glyph_modifier_variation_management(SecondCharacter, aetherC, varPGYes)->
    
        + [Scelta gialla.]
            -> glyph_modifier_variation_management(SecondCharacter, earthC, varPGYes)->
            
        + [Scelta verde.]
            -> glyph_modifier_variation_management(SecondCharacter, waterC, varPGYes)->
        -    
    Ci viene aperto il nido.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral

        -> third_char_closing_storylet ->
        -> opening_places ->
        -> main
        

=== third_read_story_library
~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(thirdChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Racconto letto in biblioteca.

    - (bookUpdate)
    
        -> third_char_closing_storylet ->
        -> main


=== dog_third_char
~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(thirdChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
   Tre ha visto un cane.

    -> third_char_closing_storylet ->
    -> main        