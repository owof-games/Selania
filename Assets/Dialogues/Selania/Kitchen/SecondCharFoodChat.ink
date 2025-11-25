/* ---------------------------------

   Cucina con Riccio

 ----------------------------------*/
=== pre_start_cooking_with_second_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
Quindi {player_name}, iniziamo a cucinare assieme? #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        + [Ci sto!]
            -> cooking_with_second_char
        
        + [Ci penso un attimo.]
            -> main
  
 
 
=== cooking_with_second_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    -> storage_colors(SecondCharacter)->
    -> cooking_animations_on ->
    
Iniziamo proponendo a Riccio di parlare di un tema.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
Ci saranno massimo tre temi a disposizione, e saranno accessibili solo se le condizioni saranno valide (sostanzialmente: se almeno una volta abbiamo parlato di quel tema).#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral

    - (top)
    + [Parliamo di relazioni.]
            {
                - second_char_main_storylets.three:
                    -> first_theme
                
                - else:
                    Preferirei raccontarti ancora di qualcosa di mio prima di farlo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    -> top
            }
        
        + [Parliamo di avere una vita con uno scopo.]
            {
                - second_char_main_storylets.five:
                    -> second_theme
                
                - else:
                    Preferirei raccontarti ancora di qualcosa di mio prima di farlo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    -> top
            }
        
        + [Parliamo di creatività.]
            {
            
                - second_char_main_storylets.seven:
                    -> third_theme
                
                - else:
                    Preferirei raccontarti ancora di qualcosa di mio prima di farlo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    -> top
            }
        
        + [Ho cambiato idea.]
            -> main

    
    = first_theme
        Il tema scelto è il numero uno.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Riccio parla.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Possiamo fare una di queste cinque scelte.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            + [Scelta blu]
                -> color_variation_management(SecondCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(SecondCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(SecondCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(SecondCharacter, greenC)->
    
            + [Scelta viola]
               -> color_variation_management(SecondCharacter, purpleC)->
            -    
        A questo punto è Riccio a chiedere a noi qualcosa sul tema a, e noi e rispondiamo con un ingrediente.
        Step uno: sostantivi (es: Patate, bellezza, calcestruzzo).#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
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
        Riccio commenta.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Riccio dice un'altra cosa sul tema che stiamo esplorando.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Noi rispondiamo una di queste cinque cose.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            + [Scelta blu]
                -> color_variation_management(SecondCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(SecondCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(SecondCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(SecondCharacter, greenC)->
    
            + [Scelta viola]
               -> color_variation_management(SecondCharacter, purpleC)->
            -
        Riccio allora ci chiede qualcosa di personale sempre sul tema, e noi rispondiamo con il secondo ingrediente.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Step due: aggettivi (es: saporito, triste, colorato).#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
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
    
        Riccio commenta.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Riccio condivide per la terza e ultima volta qualcosa sul tema che stiamo affrontando.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Noi diciamo per la terza volta qualcosa legato a quel tema.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            + [Scelta blu]
                -> color_variation_management(SecondCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(SecondCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(SecondCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(SecondCharacter, greenC)->
    
            + [Scelta viola]
               -> color_variation_management(SecondCharacter, purpleC)->
            -
        
        Riccio ci chiede per la terza e ultima volta qualcosa di personale sul tema, e aggiungiamo il terzo ingrediente.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Step tre: complementi (es: del campo, per rimbecco, di coriandolo)#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
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
        Riccio lascia un ultimo commento, e poi ci dice che il piatto è pronto#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            -> fourth_ingredient_dispatcher
    
    = second_theme
         Il tema scelto è il numero uno.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Riccio parla.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Possiamo fare una di queste cinque scelte.
            + [Scelta blu]#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                -> color_variation_management(SecondCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(SecondCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(SecondCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(SecondCharacter, greenC)->
    
            + [Scelta viola]
               -> color_variation_management(SecondCharacter, purpleC)->
            -    
        A questo punto è Riccio a chiedere a noi qualcosa sul tema a, e noi e rispondiamo con un ingrediente.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Step uno: sostantivi (es: Patate, bellezza, calcestruzzo).#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
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
        Riccio commenta.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Riccio dice un'altra cosa sul tema che stiamo esplorando.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Noi rispondiamo una di queste cinque cose.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            + [Scelta blu]
                -> color_variation_management(SecondCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(SecondCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(SecondCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(SecondCharacter, greenC)->
    
            + [Scelta viola]
               -> color_variation_management(SecondCharacter, purpleC)->
            -
        Riccio allora ci chiede qualcosa di personale sempre sul tema, e noi rispondiamo con il secondo ingrediente.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Step due: aggettivi (es: saporito, triste, colorato).#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
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
    
        Riccio commenta.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Riccio condivide per la terza e ultima volta qualcosa sul tema che stiamo affrontando.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Noi diciamo per la terza volta qualcosa legato a quel tema.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            + [Scelta blu]
                -> color_variation_management(SecondCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(SecondCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(SecondCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(SecondCharacter, greenC)->
    
            + [Scelta viola]
               -> color_variation_management(SecondCharacter, purpleC)->
            -
        
        Riccio ci chiede per la terza e ultima volta qualcosa di personale sul tema, e aggiungiamo il terzo ingrediente.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Step tre: complementi (es: del campo, per rimbecco, di coriandolo)#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
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
        Riccio lascia un ultimo commento, e poi ci dice che il piatto è pronto.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            -> fourth_ingredient_dispatcher
    
    
    = third_theme
         Il tema scelto è il numero uno.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Riccio parla.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Possiamo fare una di queste cinque scelte.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            + [Scelta blu]
                -> color_variation_management(SecondCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(SecondCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(SecondCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(SecondCharacter, greenC)->
    
            + [Scelta viola]
               -> color_variation_management(SecondCharacter, purpleC)->
            -    
        A questo punto è Riccio a chiedere a noi qualcosa sul tema a, e noi e rispondiamo con un ingrediente.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Step uno: sostantivi (es: Patate, bellezza, calcestruzzo).#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
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
        Riccio commenta.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Riccio dice un'altra cosa sul tema che stiamo esplorando.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Noi rispondiamo una di queste cinque cose.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            + [Scelta blu]
                -> color_variation_management(SecondCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(SecondCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(SecondCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(SecondCharacter, greenC)->
    
            + [Scelta viola]
               -> color_variation_management(SecondCharacter, purpleC)->
            -
        Riccio allora ci chiede qualcosa di personale sempre sul tema, e noi rispondiamo con il secondo ingrediente.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Step due: aggettivi (es: saporito, triste, colorato).#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
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
    
        Riccio commenta.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Riccio condivide per la terza e ultima volta qualcosa sul tema che stiamo affrontando.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Noi diciamo per la terza volta qualcosa legato a quel tema.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            + [Scelta blu]
                -> color_variation_management(SecondCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(SecondCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(SecondCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(SecondCharacter, greenC)->
    
            + [Scelta viola]
               -> color_variation_management(SecondCharacter, purpleC)->
            -
        
        Riccio ci chiede per la terza e ultima volta qualcosa di personale sul tema, e aggiungiamo il terzo ingrediente.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Step tre: complementi (es: del campo, per rimbecco, di coriandolo).#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
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
        Riccio lascia un ultimo commento, e poi ci dice che il piatto è pronto.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            -> fourth_ingredient_dispatcher
    


    
                //La chiusura è comune, sempre per ridurre il rischio di errori
            = fourth_ingredient_dispatcher
                {
                    - backpack_findedGifts == (): Il tuo inventario è vuoto, e quindi non puoi aggiungere un ingrediente extra.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                        -> recipe_name_creator ->
                        -> at_table_with_second_char
                    
                    - else:
                        -> add_ingredient
                
                }
            
                = add_ingredient
                Dato che il nostro inventario contiene degli oggetti, possiamo inserirne uno nel piatto.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                
                    + Voglio aggiungere un ingrediente extra.
                        -> extra_ingredient_management(SecondCharacter)->
                        ~ disableNestDialogue()
                    
                    + [Ho cambiato idea.]
                        ~ kitchen_recipePP = "semplice"
                    -
        
                    
                Riccio ci dice di andare a tavola
                    -> recipe_name_creator ->
                    -> at_table_with_second_char
    


=== at_table_with_second_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    ~ move_entity(CookingWithSecondCharOBJ, Kitchen)
    ~ temp piatto = kitchen_tempRecipeName
    
    Passiamo alla scena al tavolo con Riccio.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
    ~ move_entity(EatingWithSecondCharOBJ, Kitchen)
    Buono questo {piatto}!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
    
    
    //Commento ricetta
    Quando prima hai aggiunto {kitchen_recipeNoun} mi hai ricordato una cosa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
    E con {kitchen_recipeAdjective} un'altra, e con {kitchen_recipeComplement} un'altra ancora.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            {
                - kitchen_secondCharExtraIngredientReaction != notReaction:
                    -> extra_ing_feedback
            }
        
    Non abbiamo aggiunto un ingrediente extra, per cui Riccio ci dice: "Comunque, ottimo piatto!"#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        -> relationship_feedback
    
        
        
        = extra_ing_feedback
        // Qui verranno fatti commenti diversi a seconda che l'ingrediente sarà apprezzato o meno.
            {
                - kitchen_secondCharExtraIngredientReaction == goodReaction:
                    -> good_reaction
                
                - kitchen_secondCharExtraIngredientReaction == badReaction:
                    -> bad_reaction
                
                - kitchen_secondCharExtraIngredientReaction == mehReaction:
                    -> meh_reaction
                
                - else:
                    ERROR: non abbiamo un valore valido di kitchen_secondCharExtraIngredientReaction, che è uguale a {kitchen_secondCharExtraIngredientReaction}.
            }
        
        
                = good_reaction
                Abbiamo aggiunto un ingrediente extra apprezzato da Riccio, per cui lui commenta:#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Aggiungere {ingredientTranslator(kitchen_secondCharExtraIngredient)} è stata una scelta.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                E poi ci dà un'informazione utile per capire come gestire le conversazioni in futuro:#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Non mi piace quando gli adulti non sono coerenti, quando mi dicono le cose secondo quello che gli serve..#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                
                    -> relationship_feedback
                
                = bad_reaction
                Abbiamo aggiunto un ingrediente extra detestato da Riccio, per cui lui commenta:#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Aggiungere {ingredientTranslator(kitchen_secondCharExtraIngredient)} è stata una scelta terrificante, non farlo mai più!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)} #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                E poiché ha odiato l'ingrediente, non ci dirà niente di utile su come gestire le conversazioni future.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
               
                    -> relationship_feedback
            
                
                = meh_reaction
                Abbiamo aggiunto un ingrediente extra che Riccio percepisce come neutro, né buono né cattivo, per cui lui commenta:#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Aggiungere {ingredientTranslator(kitchen_secondCharExtraIngredient)} è stata una scelta.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                E poi ci dà un'informazione enigmatica per capire come gestire le conversazioni in futuro:#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Informazione enigmatica per dire che non gli piacciono le conversazioni incoerenti.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                
                    -> relationship_feedback
            
    
        
    = relationship_feedback
        A prescindere che sia stato aggiunto o meno il quarto ingrediente, Riccio ci dirà anche finalmente dove sta andando la relazione con lui.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Il feedback fa riferimento a come è andata la conversazione in cucina, e non in generale.
            -> secondAffinityCalc ->
            {
                - secondAffinityCalc == 1:
                    {
                        - secondChar_relationshipStatus == 0: Non ci stiamo pigliando #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                        - secondChar_relationshipStatus == 1: Ci piacciamo#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    }
                    
                - secondAffinityCalc == 2:
                    {
                        - secondChar_relationshipStatus == 0: Mi stai sul culo#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                        - secondChar_relationshipStatus == 1: Non male ma potrebbe migliorare.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                        - secondChar_relationshipStatus == 2: Ci piacciamo tantissimo#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    }    
        
            }
            
            
    -> ending_cooking_with_second_char



=== ending_cooking_with_second_char
~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
E poi ci saluta e se ne va allo stagno.

    -> cooking_animations_off ->
   ~ move_entity(SecondCharacter, Pond)
   ~ kitchen_secondCharCookingTogetherInvite = false
    -> update_colors(SecondCharacter) ->
    -> check_kitchen_recap ->

-> main


/* ---------------------------------

   Altri storylets legati alla cucina 

 ----------------------------------*/


=== second_char_cooking_tracker
//Lo lascio come knot e non come variabile perché potrebbe essermi utile (es: per attivare un suono che faccia sapere che c'è qualcunx in cucina)
    {debug: passo per second_char_cooking_tracker. }
    
    ->->


=== second_char_cooking_alone
{debug: passo per second_char_cooking_alone.}
    ~ move_entity(BatHouseFront, Kitchen)
    ~ move_entity(BatHouseRetro, Kitchen)
    ~ move_entity(Bat, Kitchen)
-> cooking_animations_on ->
Riccio cucina da solo e ci chiede di lasciarlo da solo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral




-> main




=== food_gift_second_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
{debug: passo per food_gift_second_char.}
Riccio attiva il suo storylet speciale dopo aver cucinato da solo e ci impezza sui pipistrelli per un po.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral

{
    - about_violence_and_peace:
        Commento se abbiamo visitato lo storylet about_violence_and_peace
    - else:
        Commento se non abbiamo visitato lo storylet about_violence_and_peace

}
            + [Scelta blu]
                -> color_variation_management(SecondCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(SecondCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(SecondCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(SecondCharacter, greenC)->
    
            + [Scelta viola]
               -> color_variation_management(SecondCharacter, purpleC)->
            -
    
    
    ~ secondChar_pauseTalking = secondChar_pauseDuration
    ~ secondChar_justTalked = true


-> main