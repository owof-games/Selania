/* ---------------------------------

   Cucina con Chitarra

 ----------------------------------*/
=== pre_start_cooking_with_first_char
Quindi {player_name}, iniziamo a cucinare assieme? #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        + [Ci sto!]
            -> cooking_with_first_char
        + [Ci penso un attimo.]
            -> main
 

=== cooking_with_first_char
    -> storage_colors(FirstCharacter)->
    -> cooking_animations_on ->
Iniziamo proponendo a Chitarra di parlare di un tema.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
Ci saranno massimo tre temi a disposizione, e saranno accessibili solo se le condizioni saranno valide (sostanzialmente: se almeno una volta abbiamo parlato di quel tema).#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral

    + {knowing_first_character.one}[Tema Uno]
        -> first_theme
    + {knowing_first_character.two}[Tema Due]
        -> second_theme
    + {knowing_first_character.three}[Tema Tre]
        -> third_theme
    -
    -> main

    
    = first_theme
        Il tema scelto è il numero uno.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Chitarra parla.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Possiamo fare una di queste cinque scelte.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -    
        A questo punto è chitarra a chiedere a noi qualcosa sul tema a, e noi e rispondiamo con un ingrediente.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Step uno: sostantivi (es: Patate, bellezza, calcestruzzo).#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            + [Sostantivo A]
                ~ kitchen_recipeNoun = "Sostantivo A"
               
            + [Sostantivo B]
                ~ kitchen_recipeNoun = "Sostantivo B"
             
            + [Sostantivo C]
               ~ kitchen_recipeNoun = "Sostantivo C"
        
            + [Sostantivo D]
                ~ kitchen_recipeNoun = "Sostantivo D"
    
            + [Sostantivo E]
                ~ kitchen_recipeNoun = "Sostantivo E"
            -  
        Chitarra commenta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Chitarra dice un'altra cosa sul tema che stiamo esplorando.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Noi rispondiamo una di queste cinque cose.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -
        Chitarra allora ci chiede qualcosa di personale sempre sul tema, e noi rispondiamo con il secondo ingrediente.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Step due: aggettivi (es: saporito, triste, colorato).#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            + [Aggettivo A]
                ~ kitchen_recipeAdjective = "Aggettivo A"
               
            + [Aggettivo B]
                ~ kitchen_recipeAdjective = "Aggettivo B"
             
            + [Aggettivo C]
               ~ kitchen_recipeAdjective = "Aggettivo C"
        
            + [Aggettivo D]
                ~ kitchen_recipeAdjective = "Aggettivo D"
    
            + [Aggettivo E]
                ~ kitchen_recipeAdjective = "Aggettivo E"
            -      
    
        Chitarra commenta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Chitarra condivide per la terza e ultima volta qualcosa sul tema che stiamo affrontando.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Noi diciamo per la terza volta qualcosa legato a quel tema.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -
        
        Chitarra ci chiede per la terza e ultima volta qualcosa di personale sul tema, e aggiungiamo il terzo ingrediente.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Step tre: complementi (es: del campo, per rimbecco, di coriandolo).#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            + [Complemento A]
                ~ kitchen_recipeComplement = "Complemento A"
               
            + [Complemento B]
                ~ kitchen_recipeComplement = "Complemento B"
             
            + [Complemento C]
               ~ kitchen_recipeComplement = "Complemento C"
        
            + [Complemento D]
                ~ kitchen_recipeComplement = "Complemento D"
    
            + [Complemento E]
                ~ kitchen_recipeComplement = "Complemento E"
            -  
        Chitarra lascia un ultimo commento, e poi ci dice che il piatto è pronto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            -> fourth_ingredient_dispatcher
            
    
    = second_theme
        Il tema scelto è il numero due.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Chitarra parla.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Possiamo fare una di queste cinque scelte.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -    
        A questo punto è chitarra a chiedere a noi qualcosa sul tema a, e noi e rispondiamo con un ingrediente.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Step uno: sostantivi (es: Patate, bellezza, calcestruzzo).#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            + [Sostantivo A]
                ~ kitchen_recipeNoun = "Sostantivo A"
               
            + [Sostantivo B]
                ~ kitchen_recipeNoun = "Sostantivo B"
             
            + [Sostantivo C]
               ~ kitchen_recipeNoun = "Sostantivo C"
        
            + [Sostantivo D]
                ~ kitchen_recipeNoun = "Sostantivo D"
    
            + [Sostantivo E]
                ~ kitchen_recipeNoun = "Sostantivo E"
            -  
        Chitarra commenta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Chitarra dice un'altra cosa sul tema che stiamo esplorando.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Noi rispondiamo una di queste cinque cose.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -
        Chitarra allora ci chiede qualcosa di personale sempre sul tema, e noi rispondiamo con il secondo ingrediente.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Step due: aggettivi (es: saporito, triste, colorato).#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            + [Aggettivo A]
                ~ kitchen_recipeAdjective = "Aggettivo A"
               
            + [Aggettivo B]
                ~ kitchen_recipeAdjective = "Aggettivo B"
             
            + [Aggettivo C]
               ~ kitchen_recipeAdjective = "Aggettivo C"
        
            + [Aggettivo D]
                ~ kitchen_recipeAdjective = "Aggettivo D"
    
            + [Aggettivo E]
                ~ kitchen_recipeAdjective = "Aggettivo E"
            -      
    
        Chitarra commenta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Chitarra condivide per la terza e ultima volta qualcosa sul tema che stiamo affrontando.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Noi diciamo per la terza volta qualcosa legato a quel tema.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -
        
        Chitarra ci chiede per la terza e ultima volta qualcosa di personale sul tema, e aggiungiamo il terzo ingrediente.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Step tre: complementi (es: del campo, per rimbecco, di coriandolo)#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            + [Complemento A]
                ~ kitchen_recipeComplement = "Complemento A"
               
            + [Complemento B]
                ~ kitchen_recipeComplement = "Complemento B"
             
            + [Complemento C]
               ~ kitchen_recipeComplement = "Complemento C"
        
            + [Complemento D]
                ~ kitchen_recipeComplement = "Complemento D"
    
            + [Complemento E]
                ~ kitchen_recipeComplement = "Complemento E"
            -  
        Chitarra lascia un ultimo commento, e poi ci dice che il piatto è pronto#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            -> fourth_ingredient_dispatcher
                
                
    
    = third_theme
        Il tema scelto è il numero tre.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Chitarra parla.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Possiamo fare una di queste cinque scelte.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -    
        A questo punto è chitarra a chiedere a noi qualcosa sul tema a, e noi e rispondiamo con un ingrediente.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Step uno: sostantivi (es: Patate, bellezza, calcestruzzo).#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            + [Sostantivo A]
                ~ kitchen_recipeNoun = "Sostantivo A"
               
            + [Sostantivo B]
                ~ kitchen_recipeNoun = "Sostantivo B"
             
            + [Sostantivo C]
               ~ kitchen_recipeNoun = "Sostantivo C"
        
            + [Sostantivo D]
                ~ kitchen_recipeNoun = "Sostantivo D"
    
            + [Sostantivo E]
                ~ kitchen_recipeNoun = "Sostantivo E"
            -  
        Chitarra commenta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Chitarra dice un'altra cosa sul tema che stiamo esplorando.
        Noi rispondiamo una di queste cinque cose.
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -
        Chitarra allora ci chiede qualcosa di personale sempre sul tema, e noi rispondiamo con il secondo ingrediente.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Step due: aggettivi (es: saporito, triste, colorato).
            + [Aggettivo A]
                ~ kitchen_recipeAdjective = "Aggettivo A"
               
            + [Aggettivo B]
                ~ kitchen_recipeAdjective = "Aggettivo B"
             
            + [Aggettivo C]
               ~ kitchen_recipeAdjective = "Aggettivo C"
        
            + [Aggettivo D]
                ~ kitchen_recipeAdjective = "Aggettivo D"
    
            + [Aggettivo E]
                ~ kitchen_recipeAdjective = "Aggettivo E"
            -      
    
        Chitarra commenta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Chitarra condivide per la terza e ultima volta qualcosa sul tema che stiamo affrontando.
        Noi diciamo per la terza volta qualcosa legato a quel tema.
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -
        
        Chitarra ci chiede per la terza e ultima volta qualcosa di personale sul tema, e aggiungiamo il terzo ingrediente.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Step tre: complementi (es: del campo, per rimbecco, di coriandolo)
            + [Complemento A]
                ~ kitchen_recipeComplement = "Complemento A"
               
            + [Complemento B]
                ~ kitchen_recipeComplement = "Complemento B"
             
            + [Complemento C]
               ~ kitchen_recipeComplement = "Complemento C"
        
            + [Complemento D]
                ~ kitchen_recipeComplement = "Complemento D"
    
            + [Complemento E]
                ~ kitchen_recipeComplement = "Complemento E"
            -  
        Chitarra lascia un ultimo commento, e poi ci dice che il piatto è pronto#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            -> fourth_ingredient_dispatcher
    
    
            //La chiusura è comune, sempre per ridurre il rischio di errori
            = fourth_ingredient_dispatcher
                {
                    - backpack_findedGifts == (): Il tuo inventario è vuoto, e quindi non puoi aggiungere un ingrediente extra.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                        -> recipe_name_creator ->
                        -> at_table_with_first_char
                        
                    - else:
                        -> add_ingredient
                
                }
            
                = add_ingredient
                    Dato che il nostro inventario contiene degli oggetti, possiamo inserirne uno nel piatto.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                        
                        + Voglio aggiungere un ingrediente extra.
                            -> extra_ingredient_management(FirstCharacter)->
                            ~ disableNestDialogue()
                            
                        + [Ho cambiato idea.]
                            ~ kitchen_recipePP = "semplice"
                        
                        -
                        
                    Chitarra ci dice che possiamo mangiare.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                        -> recipe_name_creator ->
                        -> at_table_with_first_char



=== at_table_with_first_char
    ~ move_entity(CookingWithFirstCharOBJ, Kitchen)
    ~ move_entity(EatingWithFirstCharOBJ, Kitchen)
    ~ temp piatto = kitchen_tempRecipeName
    Passiamo alla scena al tavolo con Chitarra#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
    Buono questo {piatto}!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
    
    //Commento ricetta
    Quando prima hai aggiunto {kitchen_recipeNoun} mi hai ricordato una cosa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
    E con {kitchen_recipeAdjective} un'altra, e con {kitchen_recipeComplement} un'altra ancora.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            {
                - kitchen_firstCharExtraIngredientReaction != notReaction:
                    -> extra_ing_feedback
            }
    
    Non abbiamo aggiunto un ingrediente extra, per cui Chitarra ci dice: "Comunque, ottimo piatto!"#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        -> relationship_feedback
    
        
        
        = extra_ing_feedback
        // Qui verranno fatti commenti diversi a seconda che l'ingrediente sarà apprezzato o meno.
            {
                - kitchen_firstCharExtraIngredientReaction == goodReaction:
                    -> good_reaction
                
                - kitchen_firstCharExtraIngredientReaction == badReaction:
                    -> bad_reaction
                
                - kitchen_firstCharExtraIngredientReaction == mehReaction:
                    -> meh_reaction
                
                - else:
                    ERROR: non abbiamo un valore valido di kitchen_firstCharExtraIngredientReaction, che è uguale a {kitchen_firstCharExtraIngredientReaction}.
            }
        
        
                = good_reaction
                Abbiamo aggiunto un ingrediente extra apprezzato da Chitarra, per cui lei commenta:#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Aggiungere {ingredientTranslator(kitchen_firstCharExtraIngredient)} è stata una scelta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                E poi ci dà un'informazione utile per capire come gestire le conversazioni in futuro:#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Non prendermi per terrapiattista o che, ma non sono una grande fan delle conversazioni eccessivamente razionali. Mi tarpano la creatività, il piacere.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                
                    -> relationship_feedback
                
                = bad_reaction
                Abbiamo aggiunto un ingrediente extra detestato da Chitarra, per cui lei commenta:#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Aggiungere {ingredientTranslator(kitchen_firstCharExtraIngredient)} è stata una scelta terrificante, non farlo mai più!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                E poiché ha odiato l'ingrediente, non ci dirà niente di utile su come gestire le conversazioni future.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
               
                    -> relationship_feedback
            
                
                = meh_reaction
                Abbiamo aggiunto un ingrediente extra che Chitarra percepisce come neutro, né buono né cattivo, per cui lei commenta:#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Aggiungere {ingredientTranslator(kitchen_firstCharExtraIngredient)} è stata una scelta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                E poi ci dà un'informazione enigmatica per capire come gestire le conversazioni in futuro:#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Informazione enigmatica per dire che non le piacciono le conversazioni razionali.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                
                    -> relationship_feedback
            
    
        
    = relationship_feedback
        A prescindere che sia stato aggiunto o meno il quarto ingrediente, Chitarra ci dirà anche finalmente dove sta andando la relazione con lei.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Il feedback fa riferimento a come è andata la conversazione in cucina, e non in generale.
            -> firstAffinityCalc ->
            {
                - firstAffinityCalc == 1:
                    {
                        - firstChar_relationshipStatus == 0: Non ci stiamo pigliando.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                        - firstChar_relationshipStatus == 1: Ci piacciamo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                    }
                    
                - firstAffinityCalc == 2:
                    {
                        - firstChar_relationshipStatus == 0: Mi stai sul culo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                        - firstChar_relationshipStatus == 1: Non male ma potrebbe migliorare.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                        - firstChar_relationshipStatus == 2: Ci piacciamo tantissimo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                    }    
        
            }
            
            -> ending_cooking_with_first_char
            
        
=== ending_cooking_with_first_char
E poi ci saluta e se ne va allo stagno.

    -> cooking_animations_off ->
   ~ move_entity(FirstCharacter, Pond)
    -> update_colors(FirstCharacter) ->
    -> check_kitchen_recap -> 

-> main




/* ---------------------------------

   Altri storylets legati alla cucina 

 ----------------------------------*/


=== first_char_cooking_tracker
~ move_entity(FirstCharCookingAloneOBJ, Kitchen)
//Lo lascio come knot e non come variabile perché potrebbe essermi utile (es: per attivare un suono che faccia sapere che c'è qualcunx in cucina)
    {debug: passo per first_char_cooking_tracker.}
    
    ->->


=== first_char_cooking_alone
{debug: passo per first_char_cooking_alone.}
-> cooking_animations_on ->
Chitarra sta cucinando da sola e ci chiede di lasciarla in pace fino a quando non ha finito.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral




-> main




=== food_gift_first_char
{debug: passo per food_gift_first_char.}
Chitarra attiva il suo storylet speciale dopo aver cucinato da sola  e ci dice che ha trovato delle lucine in giro e qualcosa sul Natale e le ame o il fidanzato.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral

            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -
            
    ~ firstChar_pauseTalking = firstChar_pauseDuration
        ~ firstChar_justTalked = true



-> main