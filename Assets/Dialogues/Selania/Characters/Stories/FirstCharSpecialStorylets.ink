=== take_this_book
//Se non abbiamo raccolto il libro della riscrittora autonomamente
    Ehi, {player_name}!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
    Prima ai piedi di quel vecchio tronco ho trovato questo libro.
    E ha il tuo nome.
    Hai unə ammiratorə segretə?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
        {
            - are_two_entities_together(SecondCharacter, PG):Bleah!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        } 
    Comunque ho pensato fosse il caso di dartelo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        ~ move_entity(WitchRecap, BookPlace)
        ~ move_entity(miniBook, Bedroom)
        ~ move_entity(nightTable, Bedroom)
        @animation:RewriterBook
        ~ player_somethingStrange ++
            {
                - forestContents has PG:
                    ~ move_entity(RewriterBook, Forest)
                - trainStopContents has PG:
                    ~ move_entity(RewriterBook, TrainStop)
                - pondContents has PG:
                    ~ move_entity(RewriterBook, Pond)        
            }
            
-> main


=== open_the_kitchen
//Ci apre la cucina
    Dialogo allo stagno.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        + [Scelta blu.]
             -> color_variation_management(FirstCharacter, blueC)->
    
        + [Scelta rossa.]
            -> color_variation_management(FirstCharacter, redC)->
     
        + [Scelta viola.]
                -> color_variation_management(FirstCharacter, purpleC)->
    
        + [Scelta gialla.]
            -> color_variation_management(FirstCharacter, yellowC)->
            
        + [Scelta verde.]
            -> color_variation_management(FirstCharacter, greenC)->
        -    
    Chitarra ci apre la cucina.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
    Ricordati di invitare una persona, se vuoi cucinarci assieme!
        ~ firstChar_pauseTalking = firstChar_pauseDuration
        ~ firstChar_justTalked = true
        -> opening_places ->
        -> main
        
=== a_story_of_transformation
Qui Chitarra ci dice che ha letto <b>Il cancello</b> e ci chiede cosa ne pensiamo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        
        + [Scelta blu.]
             -> color_variation_management(FirstCharacter, blueC)->
    
        + [Scelta rossa.]
            -> color_variation_management(FirstCharacter, redC)->
     
        + [Scelta viola.]
                -> color_variation_management(FirstCharacter, purpleC)->
    
        + [Scelta gialla.]
            -> color_variation_management(FirstCharacter, yellowC)->
            
        + [Scelta verde.]
            -> color_variation_management(FirstCharacter, greenC)->
        -    
        ~ firstChar_pauseTalking = firstChar_pauseDuration
        ~ firstChar_justTalked = true
-> main        