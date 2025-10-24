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
            + Non voglio aggiungere un ingrediente extra.
                ~ recipePP = "semplice"
                -> close 
            + Voglio aggiungere un ingrediente extra.
                -> extra_ingredient_management->
                -> close 
            
    
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
            + Non voglio aggiungere un ingrediente extra.
                ~ recipePP = "semplice"
                -> close 
            + Voglio aggiungere un ingrediente extra.
                -> extra_ingredient_management->
                -> close 
    
    
    
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
            + Non voglio aggiungere un ingrediente extra.
                ~ recipePP = "semplice"
                -> close 
            + Voglio aggiungere un ingrediente extra.
                -> extra_ingredient_management->
                -> close 
    

    
            //La chiusura è comune, sempre per ridurre il rischio di errori
            = close
                //Per riccio devo aumentare il valore di tre, perché ho compiuto tre scelte, e mi serve per il calcolo dell'affinità
                    ~ secondStoryQuestCount ++
                    ~ secondStoryQuestCount ++
                    ~ secondStoryQuestCount ++
                -> recipe_name_creator ->
                -> at_table_with_second_char


== at_table_with_second_char
Passo alla scena al tavolo con Riccio


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