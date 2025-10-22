/* ---------------------------------

   Cucina con Chitarra

 ----------------------------------*/

=== cooking_with_first_char
Ehi Chitarra, che ne dici se mentre cuciniamo parliamo di 

    + {knowing_first_character.one}[Tema Uno]
        -> first_theme
    + {knowing_first_character.two}[Tema Due]
        -> second_theme
    + {knowing_first_character.three}[Tema Tre]
        -> third_theme
    -
    -> main

    


    = first_theme
        Chitarra parla.
        Io dico una di queste cinque cose.
            + [Scelta blu]
                ~ firstBlue ++
               
            + [Scelta gialla]
                ~ firstYellow ++
             
            + [Scelta rossa]
                ~ firstRed ++
        
            + [Scelta verde]
                ~ firstGreen ++
    
            + [Scelta viola]
                ~ firstPurple ++
            -    
        Chitarra mi chiede una cosa, e rispondo con un ingrediente.
        Qui per ora ragiono solo per la parte cucina, non per la parte libro
        Step uno: sostantivi
            + [Sostantivo A]
                ~ recipeNoun = "Sostantivo A"
               
            + [Sostantivo B]
                ~ recipeNoun = "Sostantivo B"
             
            + [Sostantivo C]
               ~ recipeNoun = "Sostantivo C"
        
            + [Sostantivo D]
                ~ recipeNoun = "Sostantivo D"
    
            + [Sostantivo E]
                ~ recipeNoun = "Sostantivo E"
            -  
        Chitarra commenta.
        Chitarra dice un'altra cosa sul suo tema.
        Io dico una di queste cinque cose.
            + [Scelta blu]
                ~ firstBlue ++
               
            + [Scelta gialla]
                ~ firstYellow ++
             
            + [Scelta rossa]
                ~ firstRed ++
        
            + [Scelta verde]
                ~ firstGreen ++
    
            + [Scelta viola]
                ~ firstPurple ++
            -
        
        Chitarra mi chiede un'altra cosa, e rispondo con un ingrediente.
        Step due: aggettivi
            + [Aggettivo A]
                ~ recipeAdjective = "Aggettivo A"
               
            + [Aggettivo B]
                ~ recipeAdjective = "Aggettivo B"
             
            + [Aggettivo C]
               ~ recipeAdjective = "Aggettivo C"
        
            + [Aggettivo D]
                ~ recipeAdjective = "Aggettivo D"
    
            + [Aggettivo E]
                ~ recipeAdjective = "Aggettivo E"
            -      
    
        Chitarra commenta.
        Chitarra dice un'altra cosa sul suo tema.
        Io dico una di queste cinque cose.
            + [Scelta blu]
                ~ firstBlue ++
               
            + [Scelta gialla]
                ~ firstYellow ++
             
            + [Scelta rossa]
                ~ firstRed ++
        
            + [Scelta verde]
                ~ firstGreen ++
    
            + [Scelta viola]
                ~ firstPurple ++
            -
        
        Chitarra mi chiede un'altra cosa, e rispondo con un ingrediente.
        Step tre: complementi
            + [Complemento A]
                ~ recipeComplement = "Complemento A"
               
            + [Complemento B]
                ~ recipeComplement = "Complemento B"
             
            + [Complemento C]
               ~ recipeComplement = "Complemento C"
        
            + [Complemento D]
                ~ recipeComplement = "Complemento D"
    
            + [Complemento E]
                ~ recipeComplement = "Complemento E"
            -  
        Chitarra commenta.
        Chitarra mi dice se il piatto è pronto.
            + Non voglio aggiungere un ingrediente extra.
                ~ recipePP = "semplice"
                -> close 
            + Voglio aggiungere un ingrediente extra.
                -> extra_ingredient_management->
                -> close 
            
    
    = second_theme
            Chitarra parla.
        Io dico una di queste cinque cose.
            + [Scelta blu]
                ~ firstBlue ++
               
            + [Scelta gialla]
                ~ firstYellow ++
             
            + [Scelta rossa]
                ~ firstRed ++
        
            + [Scelta verde]
                ~ firstGreen ++
    
            + [Scelta viola]
                ~ firstPurple ++
            -    
        Chitarra mi chiede una cosa, e rispondo con un ingrediente.
        Qui per ora ragiono solo per la parte cucina, non per la parte libro
        Step uno: sostantivi
            + [Sostantivo A]
                ~ recipeNoun = "Sostantivo A"
               
            + [Sostantivo B]
                ~ recipeNoun = "Sostantivo B"
             
            + [Sostantivo C]
               ~ recipeNoun = "Sostantivo C"
        
            + [Sostantivo D]
                ~ recipeNoun = "Sostantivo D"
    
            + [Sostantivo E]
                ~ recipeNoun = "Sostantivo E"
            -  
        Chitarra commenta.
        Chitarra dice un'altra cosa sul suo tema.
        Io dico una di queste cinque cose.
            + [Scelta blu]
                ~ firstBlue ++
               
            + [Scelta gialla]
                ~ firstYellow ++
             
            + [Scelta rossa]
                ~ firstRed ++
        
            + [Scelta verde]
                ~ firstGreen ++
    
            + [Scelta viola]
                ~ firstPurple ++
            -
        
        Chitarra mi chiede un'altra cosa, e rispondo con un ingrediente.
        Step due: aggettivi
            + [Aggettivo A]
                ~ recipeAdjective = "Aggettivo A"
               
            + [Aggettivo B]
                ~ recipeAdjective = "Aggettivo B"
             
            + [Aggettivo C]
               ~ recipeAdjective = "Aggettivo C"
        
            + [Aggettivo D]
                ~ recipeAdjective = "Aggettivo D"
    
            + [Aggettivo E]
                ~ recipeAdjective = "Aggettivo E"
            -      
    
        Chitarra commenta.
        Chitarra dice un'altra cosa sul suo tema.
        Io dico una di queste cinque cose.
            + [Scelta blu]
                ~ firstBlue ++
               
            + [Scelta gialla]
                ~ firstYellow ++
             
            + [Scelta rossa]
                ~ firstRed ++
        
            + [Scelta verde]
                ~ firstGreen ++
    
            + [Scelta viola]
                ~ firstPurple ++
            -
        
        Chitarra mi chiede un'altra cosa, e rispondo con un ingrediente.
        Step tre: complementi
            + [Complemento A]
                ~ recipeComplement = "Complemento A"
               
            + [Complemento B]
                ~ recipeComplement = "Complemento B"
             
            + [Complemento C]
               ~ recipeComplement = "Complemento C"
        
            + [Complemento D]
                ~ recipeComplement = "Complemento D"
    
            + [Complemento E]
                ~ recipeComplement = "Complemento E"
            -  
        Chitarra commenta.
        Chitarra mi dice se il piatto è pronto.
            + Non voglio aggiungere un ingrediente extra.
                ~ recipePP = "semplice"
                -> close 
            + Voglio aggiungere un ingrediente extra.
                -> extra_ingredient_management->
                -> close 
    
    
    

    
    = third_theme
            Chitarra parla.
        Io dico una di queste cinque cose.
            + [Scelta blu]
                ~ firstBlue ++
               
            + [Scelta gialla]
                ~ firstYellow ++
             
            + [Scelta rossa]
                ~ firstRed ++
        
            + [Scelta verde]
                ~ firstGreen ++
    
            + [Scelta viola]
                ~ firstPurple ++
            -    
        Chitarra mi chiede una cosa, e rispondo con un ingrediente.
        Qui per ora ragiono solo per la parte cucina, non per la parte libro
        Step uno: sostantivi
            + [Sostantivo A]
                ~ recipeNoun = "Sostantivo A"
               
            + [Sostantivo B]
                ~ recipeNoun = "Sostantivo B"
             
            + [Sostantivo C]
               ~ recipeNoun = "Sostantivo C"
        
            + [Sostantivo D]
                ~ recipeNoun = "Sostantivo D"
    
            + [Sostantivo E]
                ~ recipeNoun = "Sostantivo E"
            -  
        Chitarra commenta.
        Chitarra dice un'altra cosa sul suo tema.
        Io dico una di queste cinque cose.
            + [Scelta blu]
                ~ firstBlue ++
               
            + [Scelta gialla]
                ~ firstYellow ++
             
            + [Scelta rossa]
                ~ firstRed ++
        
            + [Scelta verde]
                ~ firstGreen ++
    
            + [Scelta viola]
                ~ firstPurple ++
            -
        
        Chitarra mi chiede un'altra cosa, e rispondo con un ingrediente.
        Step due: aggettivi
            + [Aggettivo A]
                ~ recipeAdjective = "Aggettivo A"
               
            + [Aggettivo B]
                ~ recipeAdjective = "Aggettivo B"
             
            + [Aggettivo C]
               ~ recipeAdjective = "Aggettivo C"
        
            + [Aggettivo D]
                ~ recipeAdjective = "Aggettivo D"
    
            + [Aggettivo E]
                ~ recipeAdjective = "Aggettivo E"
            -      
    
        Chitarra commenta.
        Chitarra dice un'altra cosa sul suo tema.
        Io dico una di queste cinque cose.
            + [Scelta blu]
                ~ firstBlue ++
               
            + [Scelta gialla]
                ~ firstYellow ++
             
            + [Scelta rossa]
                ~ firstRed ++
        
            + [Scelta verde]
                ~ firstGreen ++
    
            + [Scelta viola]
                ~ firstPurple ++
            -
        
        Chitarra mi chiede un'altra cosa, e rispondo con un ingrediente.
        Step tre: complementi
            + [Complemento A]
                ~ recipeComplement = "Complemento A"
               
            + [Complemento B]
                ~ recipeComplement = "Complemento B"
             
            + [Complemento C]
               ~ recipeComplement = "Complemento C"
        
            + [Complemento D]
                ~ recipeComplement = "Complemento D"
    
            + [Complemento E]
                ~ recipeComplement = "Complemento E"
            -  
        Chitarra commenta.
        Chitarra mi dice se il piatto è pronto.
            + Non voglio aggiungere un ingrediente extra.
                ~ recipePP = "semplice"
                -> close 
            + Voglio aggiungere un ingrediente extra.
                -> extra_ingredient_management->
                -> close 
    

    
    
            //La chiusura è comune, sempre per ridurre il rischio di errori
            = close   
                -> recipe_name_creator ->
                -> at_table_with_first_char



== at_table_with_first_char
Passo alla scena al tavolo con Chitarra


-> ending_cooking_with_first_char



=== ending_cooking_with_first_char
Passo alla chiusura del pasto con Chitarra


   ~ move_entity(FirstCharacter, Pond)
    -> check_kitchen_recap -> 

-> main




/* ---------------------------------

   Altri storylets legati alla cucina 

 ----------------------------------*/


=== first_char_cooking_tracker
//Lo lascio come knot e non come variabile perché potrebbe essermi utile (es: per attivare un suono che faccia sapere che c'è qualcunx in cucina)
    {debug: passo per first_char_cooking_tracker. }
    
    ->->


=== first_char_cooking_alone
chitarra cucina da sola




-> main




=== food_gift_first_char
chitarra attiva il suo storylet dopo aver cucinato





-> main