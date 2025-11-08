=== open_nest
    //Apertura del nido
    Dialogo in biblioteca.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        + [Scelta blu.]
             -> color_variation_management(SecondCharacter, blueC)->
    
        + [Scelta rossa.]
            -> color_variation_management(SecondCharacter, redC)->
     
        + [Scelta viola.]
                -> color_variation_management(SecondCharacter, purpleC)->
    
        + [Scelta gialla.]
            -> color_variation_management(SecondCharacter, yellowC)->
            
        + [Scelta verde.]
            -> color_variation_management(SecondCharacter, greenC)->
        -    
    Ci viene aperto il nido.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        ~ secondPauseTalking = secondCharPauseDuration
        ~ justTalkedSecondChar = true
        -> opening_places ->
        -> main