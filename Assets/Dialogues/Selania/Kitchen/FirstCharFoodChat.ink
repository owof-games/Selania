/* ---------------------------------

   Cucina con Chitarra

 ----------------------------------*/

=== cooking_with_first_char
    -> storage_colors(FirstCharacter)->
    
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
            + (SostantivoA)[Sostantivo A]
                ~ recipeNoun = "Sostantivo A"
               
            + (SostantivoB)[Sostantivo B]
                ~ recipeNoun = "Sostantivo B"
             
            + (SostantivoC)[Sostantivo C]
               ~ recipeNoun = "Sostantivo C"
        
            + (SostantivoD)[Sostantivo D]
                ~ recipeNoun = "Sostantivo D"
    
            + (SostantivoE)[Sostantivo E]
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
            Vengono dette cose.
                -> recipe_name_creator ->
                -> at_table_with_first_char



=== at_table_with_first_char
    Passo alla scena al tavolo con Chitarra
    Buono questo {tempRecipeName}!
    //Commento ricetta
    Quando prima hai aggiunto {recipeNoun} mi hai ricordato una cosa.
    E con {recipeAdjective} un'altra, e con {recipeComplement} un'altra ancora.
            {
                - recipePP != "":
                    -> extra_ing_feedback
            }
        
    Comunque, ottimo piatto!
        -> relationship_feedback
    
        
        
        = extra_ing_feedback
        // Qui verranno fatti commenti diversi a seconda che l'ingrediente sarà apprezzato o meno.
            {
                - recipePP == "AAA" or recipePP == "YYY":
                    -> good_feedback
                
                - recipePP == "XXX" or recipePP == "CCC":
                    -> bad_feedback
                
                - else:
                    -> meh_feedback
            }
        
        
                = good_feedback
                Questo mi piace, questo lo odio.
                Paragoni tra cibo e desiderio suo.
                
                    -> relationship_feedback
                
                = bad_feedback
                Tentativo coraggioso, non rifarlo mai più!
                Paragoni tra cibo e desiderio suo.
                
                    -> relationship_feedback
            
                
                = meh_feedback
                Discutibile, {name}!
                Paragoni tra cibo e desiderio suo.
                
                    -> relationship_feedback
            
    
        
    = relationship_feedback
    Qui abbiamo un feedback sulla relazione. Per sopravvivenza personale, ignorerei il dono, e ci concentriamo sulla comunicazione.
        -> firstAffinityCalc ->
    {
        - firstCharStateRelationship == 0: Non ci stiamo pigliando 
        - firstCharStateRelationship == 1: Ci piacciamo
        - firstCharStateRelationship == 2: Ci piacciamo tantissimo

    
    }
    
    
    
    
        -> ending_cooking_with_first_char
            
        
=== ending_cooking_with_first_char
Passo alla chiusura del pasto con Chitarra


   ~ move_entity(FirstCharacter, Pond)
    -> update_colors(FirstCharacter) ->
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