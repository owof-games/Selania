=== open_the_library
    //Apertura della biblioteca
    Dialogo nella foresta.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
    
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
    Ci viene aperta la biblioteca.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        ~ secondChar_pauseTalking = secondChar_pauseDuration
        -> opening_places ->
        -> main
        

=== a_story_of_rebellion
Qui Riccio ci dice che ha letto <b>Il sassolino</b> e ci chiede cosa ne pensiamo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        
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
        ~ secondChar_pauseTalking = secondChar_pauseDuration

-> main
        