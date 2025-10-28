/* ---------------------------------

   Cucina con Riccio

 ----------------------------------*/
 
=== cooking_with_second_char
    -> storage_colors(SecondCharacter)->
    
Ehi Riccio, che ne dici se mentre cuciniamo parliamo di 

    + {knowing_second_character.one}[Tema Uno]
        -> first_theme
    + {knowing_second_character.two}[Tema Due]
        -> second_theme
    + {knowing_second_character.three}[Tema Tre]
        -> third_theme
    -
    -> main

    
    = first_theme
        Riccio parla.
        Io dico una di queste cinque cose.
            + [Scelta blu]
                ~ secondBlue ++
               
            + [Scelta gialla]
                ~ secondYellow ++
             
            + [Scelta rossa]
                ~ secondRed ++
        
            + [Scelta verde]
                ~ secondGreen ++
    
            + [Scelta viola]
                ~ secondPurple ++
            -    
        Riccio mi chiede una cosa, e rispondo con un ingrediente.
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
        Riccio commenta.
        Riccio dice un'altra cosa sul suo tema.
        Io dico una di queste cinque cose.
            + [Scelta blu]
                ~ secondBlue ++
               
            + [Scelta gialla]
                ~ secondYellow ++
             
            + [Scelta rossa]
                ~ secondRed ++
        
            + [Scelta verde]
                ~ secondGreen ++
    
            + [Scelta viola]
                ~ secondPurple ++
            -
        
        Riccio mi chiede un'altra cosa, e rispondo con un ingrediente.
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
    
        Riccio commenta.
        Riccio dice un'altra cosa sul suo tema.
        Io dico una di queste cinque cose.
            + [Scelta blu]
                ~ secondBlue ++
               
            + [Scelta gialla]
                ~ secondYellow ++
             
            + [Scelta rossa]
                ~ secondRed ++
        
            + [Scelta verde]
                ~ secondGreen ++
    
            + [Scelta viola]
                ~ secondPurple ++
            -
        
        Riccio mi chiede un'altra cosa, e rispondo con un ingrediente.
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
        Riccio commenta.
        Riccio mi dice se il piatto è pronto.
            -> fourth_ingredient_dispatcher
    
    = second_theme
        Riccio parla.
        Io dico una di queste cinque cose.
            + [Scelta blu]
                ~ secondBlue ++
               
            + [Scelta gialla]
                ~ secondYellow ++
             
            + [Scelta rossa]
                ~ secondRed ++
        
            + [Scelta verde]
                ~ secondGreen ++
    
            + [Scelta viola]
                ~ secondPurple ++
            -    
        Riccio mi chiede una cosa, e rispondo con un ingrediente.
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
        Riccio commenta.
        Riccio dice un'altra cosa sul suo tema.
        Io dico una di queste cinque cose.
            + [Scelta blu]
                ~ secondBlue ++
               
            + [Scelta gialla]
                ~ secondYellow ++
             
            + [Scelta rossa]
                ~ secondRed ++
        
            + [Scelta verde]
                ~ secondGreen ++
    
            + [Scelta viola]
                ~ secondPurple ++
            -
        
        Riccio mi chiede un'altra cosa, e rispondo con un ingrediente.
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
    
        Riccio commenta.
        Riccio dice un'altra cosa sul suo tema.
        Io dico una di queste cinque cose.
            + [Scelta blu]
                ~ secondBlue ++
               
            + [Scelta gialla]
                ~ secondYellow ++
             
            + [Scelta rossa]
                ~ secondRed ++
        
            + [Scelta verde]
                ~ secondGreen ++
    
            + [Scelta viola]
                ~ secondPurple ++
            -
        
        Riccio mi chiede un'altra cosa, e rispondo con un ingrediente.
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
        Riccio commenta.
        Riccio mi dice se il piatto è pronto.
            -> fourth_ingredient_dispatcher
    
    
    = third_theme
        Riccio parla.
        Io dico una di queste cinque cose.
            + [Scelta blu]
                ~ secondBlue ++
               
            + [Scelta gialla]
                ~ secondYellow ++
             
            + [Scelta rossa]
                ~ secondRed ++
        
            + [Scelta verde]
                ~ secondGreen ++
    
            + [Scelta viola]
                ~ secondPurple ++
            -    
        Riccio mi chiede una cosa, e rispondo con un ingrediente.
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
        Riccio commenta.
        Riccio dice un'altra cosa sul suo tema.
        Io dico una di queste cinque cose.
            + [Scelta blu]
                ~ secondBlue ++
               
            + [Scelta gialla]
                ~ secondYellow ++
             
            + [Scelta rossa]
                ~ secondRed ++
        
            + [Scelta verde]
                ~ secondGreen ++
    
            + [Scelta viola]
                ~ secondPurple ++
            -
        
        Riccio mi chiede un'altra cosa, e rispondo con un ingrediente.
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
    
        Riccio commenta.
        Riccio dice un'altra cosa sul suo tema.
        Io dico una di queste cinque cose.
            + [Scelta blu]
                ~ secondBlue ++
               
            + [Scelta gialla]
                ~ secondYellow ++
             
            + [Scelta rossa]
                ~ secondRed ++
        
            + [Scelta verde]
                ~ secondGreen ++
    
            + [Scelta viola]
                ~ secondPurple ++
            -
        
        Riccio mi chiede un'altra cosa, e rispondo con un ingrediente.
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
        Riccio commenta.
        Riccio mi dice se il piatto è pronto.
            -> fourth_ingredient_dispatcher
    


    
                //La chiusura è comune, sempre per ridurre il rischio di errori
            = fourth_ingredient_dispatcher
                {
                    - findedGifts == (): Il tuo inventario è vuoto, e quindi non puoi aggiungere un ingrediente extra.
                        -> at_table_with_second_char
                    
                    - else:
                        -> add_ingredient
                
                }
            
                = add_ingredient
                Vuoi aggiungere un ingrediente extra?
                
                    + Non voglio aggiungere un ingrediente extra.
                        ~ recipePP = "semplice"
                        
                    + Voglio aggiungere un ingrediente extra.
                        -> extra_ingredient_management(SecondCharacter)->
                    -
            
                //Per riccio devo aumentare il valore di tre, perché ho compiuto tre scelte, e mi serve per il calcolo dell'affinità
                    ~ secondStoryQuestCount ++
                    ~ secondStoryQuestCount ++
                    ~ secondStoryQuestCount ++
                    
                Riccio ci dice di andare a tavola
                    -> recipe_name_creator ->
                    -> at_table_with_second_char
    


== at_table_with_second_char
    Passo alla scena al tavolo con Riccio
    Buono questo {tempRecipeName}!
    //Commento ricetta
    Quando prima hai aggiunto {recipeNoun} mi hai ricordato una cosa.
    E con {recipeAdjective} un'altra, e con {recipeComplement} un'altra ancora.
            {
                - fourthIngredientReactionSecondCharacter != notReaction:
                    -> extra_ing_feedback
            }
        
    Comunque, ottimo piatto!
        -> relationship_feedback
    
        
        
        = extra_ing_feedback
        // Qui verranno fatti commenti diversi a seconda che l'ingrediente sarà apprezzato o meno.
            {
                - fourthIngredientReactionSecondCharacter == goodReaction:
                    -> good_reaction
                
                - fourthIngredientReactionSecondCharacter == badReaction:
                    -> bad_reaction
                
                - fourthIngredientReactionSecondCharacter == mehReaction:
                    -> meh_reaction
                
                - else:
                    ERROR: non abbiamo un valore valido di fourthIngredientReactionSecondCharacter, che è uguale a {fourthIngredientReactionSecondCharacter}.
            }
        
        
                = good_reaction
                Visto che hai aggiunto {ingredientTranslator(fourthIngredientNameSecondCharacter)} è stata una scelta.
                Questo mi piace, questo lo odio.
                Paragoni tra cibo e desiderio suo.
                
                    -> relationship_feedback
                
                = bad_reaction
                Visto che hai aggiunto {ingredientTranslator(fourthIngredientNameSecondCharacter)} è stata una scelta.
                Tentativo coraggioso, non rifarlo mai più!
                Paragoni tra cibo e desiderio suo.
                
                    -> relationship_feedback
            
                
                = meh_reaction
                Visto che hai aggiunto {ingredientTranslator(fourthIngredientNameSecondCharacter)} è stata una scelta.
                Discutibile, {name}!
                Paragoni tra cibo e desiderio suo.
                meh non negativa comunque, magari meno puntuale di good
                
                    -> relationship_feedback
            
    
        
    = relationship_feedback
        Qui abbiamo un feedback sulla relazione. Per sopravvivenza personale, ignorerei il dono, e ci concentriamo sulla comunicazione.
            -> secondAffinityCalc ->
            {
                - secondAffinityCalc == 1:
                    {
                        - secondCharStateRelationship == 0: Non ci stiamo pigliando 
                        - secondCharStateRelationship == 1: Ci piacciamo
                    }
                    
                - secondAffinityCalc == 2:
                    {
                        - secondCharStateRelationship == 0: Mi stai sul culo
                        - secondCharStateRelationship == 1: Non male but
                        - secondCharStateRelationship == 2: Ci piacciamo tantissimo
                    }    
        
            }
            
            
    -> ending_cooking_with_second_char



=== ending_cooking_with_second_char
Passo alla chiusura del pasto con Riccio


   ~ move_entity(SecondCharacter, Pond)
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
Riccio cucina da solo.




-> main




=== food_gift_second_char
Riccio attiva il suo storylet dopo aver cucinato.



-> main