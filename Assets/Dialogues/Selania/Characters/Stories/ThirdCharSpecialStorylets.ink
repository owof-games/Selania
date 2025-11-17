=== open_nest
    //Apertura del nido
    Dialogo in biblioteca.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
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
    Ci viene aperto il nido.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        ~ secondChar_pauseTalking = secondChar_pauseDuration
        ~ secondChar_justTalked = true
        -> opening_places ->
        -> main