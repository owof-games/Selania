/* ---------------------------------

   Cucina  Chitarra

 ----------------------------------*/
=== pre_start_cooking_with_fifth_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)

    
{charTag(FifthCharacter, "neutral")}:       Cuciniamo?
        
        + \ {charTag(PG, "neutral")}:         Sono pront{player_pronoun has him:o|{player_pronoun has her:a|ə}}!
            -> cooking_with_fifth_char
        
        + \ {charTag(PG, "neutral")}:         Vorrei pensarci un attimo {charNameOne}.
            -> main
 

=== cooking_with_fifth_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)

    
    
    {charTag(PG, "neutral")}:      Sai {charNameOne}, mentre cuciniamo potremmo parlare un po'.
    
    - (top)
    {charTag(PG, "neutral")}:      In particolare, ripensando alle nostre conversazioni, mi farebbe piacere parlare di più...
        {
            - grimoire_fifthChar hasnt grimFifthCharNine:
                {charTag(TheWitch, witch_state())}:   <i>{charNameTwo} ha ancora spunti di conversazione da offrire a {player_name}, se {player_name} deciderà di parlarle ancora un po'.
        }
        
        + \ {charTag(PG, "neutral")}:         Dei rapporti che hai  le persone che ti sono care.
                ~ cooking_animations_on()
                ~ storage_glyphs(FifthCharacter)
                -> kitchen_moon_feedback -> 
                -> first_theme
                
        + {grimoire_fifthChar has grimFifthCharFive}\ {charTag(PG, "neutral")}:        Del bisogno di fare qualcosa che salvi il mondo.
                ~ cooking_animations_on()
                ~ storage_glyphs(FifthCharacter)
                -> kitchen_moon_feedback -> 
                -> second_theme
  
        + {grimoire_fifthChar has grimFifthCharNine}\ {charTag(PG, "neutral")}:         Della tua creatività.
                ~ cooking_animations_on()
                ~ storage_glyphs(FifthCharacter)
                -> kitchen_moon_feedback -> 
                -> third_theme
       
            
        + \ {charTag(PG, "neutral")}:         Sai, forse preferirei cucinare più tardi.
            {charTag(FifthCharacter, "neutral")}:       Nessun problema, prenditi i tuoi tempi {player_name}.
                ~ kitchen_fifthCharCookingTogetherInvite = false
                ~ kitchen_fifthCharCookingTogetherWaiting = 0
                ~ move_entity(FifthCharacter, Pond)
                ~ move_entity(FifthCharacterCucina, Safekeeping)
            -> main


    
    = first_theme
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


       
        {charTag(FifthCharacter, "neutral")}:       Frase
        
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
                
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero ("davvero" è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
            -    
        {charTag(FifthCharacter, "neutral")}:       Frase
            
        
            + (earth1)\ {charTag(PG, "neutral")}:         <i>Ingrediente terra</i>
                ~ kitchen_recipeNoun = "Zuppa di grano"
                -> glyph_choice_manager(true, earthC)->
                ~ player_updateKitchenPersonalChoices(earthC)  


            + (water1)\ {charTag(PG, "neutral")}:         <i>Ingrediente acqua</i>
                ~ kitchen_recipeNoun = "Grigliata di seitan"
                -> glyph_choice_manager(true, waterC)->
                ~ player_updateKitchenPersonalChoices(waterC)  
                
            + (fire1)\ {charTag(PG, "neutral")}:         <i>Ingrediente fire</i>
               ~ kitchen_recipeNoun = "Fagiolata"
               -> glyph_choice_manager(true, fireC)->
               ~ player_updateKitchenPersonalChoices(fireC)  

        
            + (aether1)\ {charTag(PG, "neutral")}:         <i>Ingrediente spirito</i>
                ~ kitchen_recipeNoun = "Cimetta di broccolo"
                -> glyph_choice_manager(true, aetherC)->
                ~ player_updateKitchenPersonalChoices(aetherC)  

    
            + (air1)\ {charTag(PG, "neutral")}:         <i>Ingrediente aria</i>
                ~ kitchen_recipeNoun = "Crema d'aglio"
                -> glyph_choice_manager(true, airC)->
                ~ player_updateKitchenPersonalChoices(airC)  
            -  
        
        {charTag(FifthCharacter, "neutral")}:       Frase
    
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
                
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero ("davvero" è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
    
            -
        
        {charTag(FifthCharacter, "neutral")}:       Frase
        
            + (earth2)\ {charTag(PG, "neutral")}:         <i>Ingrediente terra</i>
                ~ kitchen_recipeAdjective = "onesta"
                -> glyph_choice_manager(true, earthC)->
                ~ player_updateKitchenPersonalChoices(earthC)  
    
               
            + (air2)\ {charTag(PG, "neutral")}:         <i>Ingrediente aria</i>
                ~ kitchen_recipeAdjective = "allegra"
                -> glyph_choice_manager(true, airC)->
                ~ player_updateKitchenPersonalChoices(airC)  
  
             
            + (water2)\ {charTag(PG, "neutral")}:         <i>Ingrediente acqua</i>
               ~ kitchen_recipeAdjective = "empatica"
               -> glyph_choice_manager(true, waterC)->
               ~ player_updateKitchenPersonalChoices(waterC)  

        
            + (aether2)\ {charTag(PG, "neutral")}:         <i>Ingrediente spirito</i>
                ~ kitchen_recipeAdjective = "incondizionata"
                -> glyph_choice_manager(true, aetherC)->
                ~ player_updateKitchenPersonalChoices(aetherC)  

    
            + (fire2)\ {charTag(PG, "neutral")}:         <i>Ingrediente fire</i>
                ~ kitchen_recipeAdjective = "leale"
                -> glyph_choice_manager(true, fireC)->
                ~ player_updateKitchenPersonalChoices(fireC)  
            -      
        
        {charTag(FifthCharacter, "neutral")}:       Frase

            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
                
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero ("davvero" è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
            -
        {
            - contentsKitchen has SecondCharCookingAloneOBJ:
                {charTag(FifthCharacter, "neutral")}:       Questo pipistrello mi sta spaventando.

            - else:
                {charTag(FifthCharacter, "neutral")}:       Carini gli insetti ma vorrei non finissero nel nostro veganissimo piatto.
        }

        {charTag(FifthCharacter, "neutral")}:       Frase
        
            + (water3)\ {charTag(PG, "neutral")}:         <i>Ingrediente acqua</i>
                ~ kitchen_recipeComplement = " brodo del terrore"
                -> glyph_choice_manager(true, waterC)->
                ~ player_updateKitchenPersonalChoices(waterC)  
               
            + (earth3)\ {charTag(PG, "neutral")}:         <i>Ingrediente terra</i>
                ~ kitchen_recipeComplement = " noce euforica"
                -> glyph_choice_manager(true, earthC)->
                ~ player_updateKitchenPersonalChoices(earthC)  
             
            + (air3)\ {charTag(PG, "neutral")}:         <i>Ingrediente aria</i>
               ~ kitchen_recipeComplement = " semi dell'<i>io? no, no è possibile!</i>"
               -> glyph_choice_manager(true, airC)->
               ~ player_updateKitchenPersonalChoices(airC)  
        
            + (aether3)\ {charTag(PG, "neutral")}:         <i>Ingrediente spirito</i>
                ~ kitchen_recipeComplement = " olio delle lusinghe"
                -> glyph_choice_manager(true, aetherC)->
                ~ player_updateKitchenPersonalChoices(aetherC)  
    
            + (fire3)\ {charTag(PG, "neutral")}:         <i>Ingrediente fire</i>
                ~ kitchen_recipeComplement = " peperoncini arrapati"
                -> glyph_choice_manager(true, fireC)->
                ~ player_updateKitchenPersonalChoices(fireC)  
            -
            -> fourth_ingredient_dispatcher
            
    
    = second_theme
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
    
        {charTag(FifthCharacter, "neutral")}:       Frase
        
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
                
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero ("davvero" è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
            -    
        {charTag(FifthCharacter, "neutral")}:       Frase
            

        

            + (earth1)\ {charTag(PG, "neutral")}:         <i>Ingrediente terra</i>
                ~ kitchen_recipeNoun = "Zuppa di grano"
                -> glyph_choice_manager(true, earthC)->
                ~ player_updateKitchenPersonalChoices(earthC)  


            + (water1)\ {charTag(PG, "neutral")}:         <i>Ingrediente acqua</i>
                ~ kitchen_recipeNoun = "Grigliata di seitan"
                -> glyph_choice_manager(true, waterC)->
                ~ player_updateKitchenPersonalChoices(waterC)  
                
            + (fire1)\ {charTag(PG, "neutral")}:         <i>Ingrediente fire</i>
               ~ kitchen_recipeNoun = "Fagiolata"
               -> glyph_choice_manager(true, fireC)->
               ~ player_updateKitchenPersonalChoices(fireC)  

        
            + (aether1)\ {charTag(PG, "neutral")}:         <i>Ingrediente spirito</i>
                ~ kitchen_recipeNoun = "Cimetta di broccolo"
                -> glyph_choice_manager(true, aetherC)->
                ~ player_updateKitchenPersonalChoices(aetherC)  

    
            + (air1)\ {charTag(PG, "neutral")}:         <i>Ingrediente aria</i>
                ~ kitchen_recipeNoun = "Crema d'aglio"
                -> glyph_choice_manager(true, airC)->
                ~ player_updateKitchenPersonalChoices(airC)  
            -  
        
        {charTag(FifthCharacter, "neutral")}:       Frase
    
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
                
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero ("davvero" è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
    
            -
        
        {charTag(FifthCharacter, "neutral")}:       Frase
        
            + (earth2)\ {charTag(PG, "neutral")}:         <i>Ingrediente terra</i>
                ~ kitchen_recipeAdjective = "onesta"
                -> glyph_choice_manager(true, earthC)->
                ~ player_updateKitchenPersonalChoices(earthC)  
    
               
            + (air2)\ {charTag(PG, "neutral")}:         <i>Ingrediente aria</i>
                ~ kitchen_recipeAdjective = "allegra"
                -> glyph_choice_manager(true, airC)->
                ~ player_updateKitchenPersonalChoices(airC)  
  
             
            + (water2)\ {charTag(PG, "neutral")}:         <i>Ingrediente acqua</i>
               ~ kitchen_recipeAdjective = "empatica"
               -> glyph_choice_manager(true, waterC)->
               ~ player_updateKitchenPersonalChoices(waterC)  

        
            + (aether2)\ {charTag(PG, "neutral")}:         <i>Ingrediente spirito</i>
                ~ kitchen_recipeAdjective = "incondizionata"
                -> glyph_choice_manager(true, aetherC)->
                ~ player_updateKitchenPersonalChoices(aetherC)  

    
            + (fire2)\ {charTag(PG, "neutral")}:         <i>Ingrediente fire</i>
                ~ kitchen_recipeAdjective = "leale"
                -> glyph_choice_manager(true, fireC)->
                ~ player_updateKitchenPersonalChoices(fireC)  
            -      
        
        {charTag(FifthCharacter, "neutral")}:       Frase

            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
                
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero ("davvero" è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
            -
        {
            - contentsKitchen has SecondCharCookingAloneOBJ:
                {charTag(FifthCharacter, "neutral")}:       Questo pipistrello mi sta spaventando.

            - else:
                {charTag(FifthCharacter, "neutral")}:       Carini gli insetti ma vorrei non finissero nel nostro veganissimo piatto.
        }

        {charTag(FifthCharacter, "neutral")}:       Frase
        
            + (water3)\ {charTag(PG, "neutral")}:         <i>Ingrediente acqua</i>
                ~ kitchen_recipeComplement = " brodo del terrore"
                -> glyph_choice_manager(true, waterC)->
                ~ player_updateKitchenPersonalChoices(waterC)  
               
            + (earth3)\ {charTag(PG, "neutral")}:         <i>Ingrediente terra</i>
                ~ kitchen_recipeComplement = " noce euforica"
                -> glyph_choice_manager(true, earthC)->
                ~ player_updateKitchenPersonalChoices(earthC)  
             
            + (air3)\ {charTag(PG, "neutral")}:         <i>Ingrediente aria</i>
               ~ kitchen_recipeComplement = " semi dell'<i>io? no, no è possibile!</i>"
               -> glyph_choice_manager(true, airC)->
               ~ player_updateKitchenPersonalChoices(airC)  
        
            + (aether3)\ {charTag(PG, "neutral")}:         <i>Ingrediente spirito</i>
                ~ kitchen_recipeComplement = " olio delle lusinghe"
                -> glyph_choice_manager(true, aetherC)->
                ~ player_updateKitchenPersonalChoices(aetherC)  
    
            + (fire3)\ {charTag(PG, "neutral")}:         <i>Ingrediente fire</i>
                ~ kitchen_recipeComplement = " peperoncini arrapati"
                -> glyph_choice_manager(true, fireC)->
                ~ player_updateKitchenPersonalChoices(fireC)  
            -
            -> fourth_ingredient_dispatcher
            
                
    
    = third_theme
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)


                {charTag(FifthCharacter, "neutral")}:       Frase
        
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
                
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero ("davvero" è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
            -    
        {charTag(FifthCharacter, "neutral")}:       Frase
            

        

            + (earth1)\ {charTag(PG, "neutral")}:         <i>Ingrediente terra</i>
                ~ kitchen_recipeNoun = "Zuppa di grano"
                -> glyph_choice_manager(true, earthC)->
                ~ player_updateKitchenPersonalChoices(earthC)  


            + (water1)\ {charTag(PG, "neutral")}:         <i>Ingrediente acqua</i>
                ~ kitchen_recipeNoun = "Grigliata di seitan"
                -> glyph_choice_manager(true, waterC)->
                ~ player_updateKitchenPersonalChoices(waterC)  
                
            + (fire1)\ {charTag(PG, "neutral")}:         <i>Ingrediente fire</i>
               ~ kitchen_recipeNoun = "Fagiolata"
               -> glyph_choice_manager(true, fireC)->
               ~ player_updateKitchenPersonalChoices(fireC)  

        
            + (aether1)\ {charTag(PG, "neutral")}:         <i>Ingrediente spirito</i>
                ~ kitchen_recipeNoun = "Cimetta di broccolo"
                -> glyph_choice_manager(true, aetherC)->
                ~ player_updateKitchenPersonalChoices(aetherC)  

    
            + (air1)\ {charTag(PG, "neutral")}:         <i>Ingrediente aria</i>
                ~ kitchen_recipeNoun = "Crema d'aglio"
                -> glyph_choice_manager(true, airC)->
                ~ player_updateKitchenPersonalChoices(airC)  
            -  
        
        {charTag(FifthCharacter, "neutral")}:       Frase
    
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
                
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero ("davvero" è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
            -
        
        {charTag(FifthCharacter, "neutral")}:       Frase
        
            + (earth2)\ {charTag(PG, "neutral")}:         <i>Ingrediente terra</i>
                ~ kitchen_recipeAdjective = "onesta"
                -> glyph_choice_manager(true, earthC)->
                ~ player_updateKitchenPersonalChoices(earthC)  
    
               
            + (air2)\ {charTag(PG, "neutral")}:         <i>Ingrediente aria</i>
                ~ kitchen_recipeAdjective = "allegra"
                -> glyph_choice_manager(true, airC)->
                ~ player_updateKitchenPersonalChoices(airC)  
  
             
            + (water2)\ {charTag(PG, "neutral")}:         <i>Ingrediente acqua</i>
               ~ kitchen_recipeAdjective = "empatica"
               -> glyph_choice_manager(true, waterC)->
               ~ player_updateKitchenPersonalChoices(waterC)  

        
            + (aether2)\ {charTag(PG, "neutral")}:         <i>Ingrediente spirito</i>
                ~ kitchen_recipeAdjective = "incondizionata"
                -> glyph_choice_manager(true, aetherC)->
                ~ player_updateKitchenPersonalChoices(aetherC)  

    
            + (fire2)\ {charTag(PG, "neutral")}:         <i>Ingrediente fire</i>
                ~ kitchen_recipeAdjective = "leale"
                -> glyph_choice_manager(true, fireC)->
                ~ player_updateKitchenPersonalChoices(fireC)  
            -      
        
        {charTag(FifthCharacter, "neutral")}:       Frase

            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
                
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero ("davvero" è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
        {
            - contentsKitchen has SecondCharCookingAloneOBJ:
                {charTag(FifthCharacter, "neutral")}:       Questo pipistrello mi sta spaventando.

            - else:
                {charTag(FifthCharacter, "neutral")}:       Carini gli insetti ma vorrei non finissero nel nostro veganissimo piatto.
        }

        {charTag(FifthCharacter, "neutral")}:       Frase
        
            + (water3)\ {charTag(PG, "neutral")}:         <i>Ingrediente acqua</i>
                ~ kitchen_recipeComplement = " brodo del terrore"
                -> glyph_choice_manager(true, waterC)->
                ~ player_updateKitchenPersonalChoices(waterC)  
               
            + (earth3)\ {charTag(PG, "neutral")}:         <i>Ingrediente terra</i>
                ~ kitchen_recipeComplement = " noce euforica"
                -> glyph_choice_manager(true, earthC)->
                ~ player_updateKitchenPersonalChoices(earthC)  
             
            + (air3)\ {charTag(PG, "neutral")}:         <i>Ingrediente aria</i>
               ~ kitchen_recipeComplement = " semi dell'<i>io? no, no è possibile!</i>"
               -> glyph_choice_manager(true, airC)->
               ~ player_updateKitchenPersonalChoices(airC)  
        
            + (aether3)\ {charTag(PG, "neutral")}:         <i>Ingrediente spirito</i>
                ~ kitchen_recipeComplement = " olio delle lusinghe"
                -> glyph_choice_manager(true, aetherC)->
                ~ player_updateKitchenPersonalChoices(aetherC)  
    
            + (fire3)\ {charTag(PG, "neutral")}:         <i>Ingrediente fire</i>
                ~ kitchen_recipeComplement = " peperoncini arrapati"
                -> glyph_choice_manager(true, fireC)->
                ~ player_updateKitchenPersonalChoices(fireC)  
            -
            -> fourth_ingredient_dispatcher
            
    
    
    //La chiusura è comune, sempre per ridurre il rischio di errori
    = fourth_ingredient_dispatcher
    {charTag(FifthCharacter, "neutral")}:       Ma {player_name}, qui a me sembra tutto pronto, non trovi?
    
        {
            - backpack_findedGifts == (): 
                {charTag(TheWitch, witch_state())}:   <i>{player_name} non possiede alcun ingrediente speciale.</i>
                    -> at_table_with_fifth_char
                
            - else:
                -> add_ingredient
        
        }
    
        = add_ingredient
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
    
        
            {charTag(TheWitch, witch_state())}:     <i>Il giusto ingrediente renderà la ricetta di {player_name} e {charNameOne} musicale.
                                                    <i>E {player_name} potrebbe capire un po' meglio {charNameOne}.
       
                + \ {charTag(PG, "neutral")}:         <i>Aggiunto un ingrediente speciale.
                        -> grimoire_greenhouse_gifts_and_ingredient ->

                        //Dopo di che associo la scelta fatta alla PNG
                        ~ kitchen_fifthCharExtraIngredient = grimoire_chosenPlant
                        //E svuoto la variabile del grimorio
                        ~ grimoire_chosenPlant = ()
                        //E poi chiamo la funzione per aggiornare i valori
                        ~ object_value_for_PNG(kitchen_fifthCharExtraIngredient, Kitchen, FifthCharacter)
                        //E il nome dell'ingrediente
                        ~ extra_ingredient_name(kitchen_fifthCharExtraIngredient)
                    
                + \ {charTag(PG, "neutral")}:         <i>Non aggiungo altro.
                -
                
            {charTag(FifthCharacter, "neutral")}:       Andiamo a mangiare, ama!

                -> at_table_with_fifth_char



=== at_table_with_fifth_char
    -> grimoire_storylets_updater -> 

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive= translator(fifthChar_ActualName)

    ~ move_entity(CookingWithFifthCharOBJ, Kitchen)
    ~ move_entity(EatingWithFifthCharOBJ, Kitchen)
    ~ temp piatto = kitchen_tempRecipeName
    ~ recipe_name_creator()
    ~ recipe_name_storage(FifthCharacter)

    {charTag(FifthCharacter, "neutral")}:       È stato divertente cucinare assieme, {player_name}.

        {
            -cooking_with_fifth_char.first_theme:
                {charTag(FifthCharacter, "neutral")}:       E non mi facevo certe domande da molto.

            -cooking_with_fifth_char.second_theme:
                {charTag(FifthCharacter, "neutral")}:       E non avevo mai pensato fino in fondo al discorso del salvare il mondo etc etc.
            
            -cooking_with_fifth_char.third_theme:
                {charTag(FifthCharacter, "neutral")}:       E discutere di creatività.

        }
    {charTag(FifthCharacter, "neutral")}:       E poi questo {piatto}!
    {charTag(FifthCharacter, "neutral")}:       Spacca, non trovi?
    
        {
            - kitchen_fifthCharExtraIngredientReaction != notReaction:
                -> extra_ing_feedback
            
            - else:
                E ho la pancia strapiena ora.
                -> relationship_feedback
                
        }
        
        
    
        
        
        = extra_ing_feedback
        
        // Qui verranno fatti commenti diversi a seconda che l'ingrediente sarà apprezzato o meno.
            {
                - kitchen_fifthCharExtraIngredientReaction == goodReaction:
                    -> good_reaction
                
                - kitchen_fifthCharExtraIngredientReaction == badReaction:
                    -> bad_reaction
                
                - kitchen_fifthCharExtraIngredientReaction == mehReaction:
                    -> meh_reaction
                
                - else:
                    ERROR: non abbiamo un valore valido di kitchen_fifthCharExtraIngredientReaction, che è uguale a {kitchen_fifthCharExtraIngredientReaction}.
            }

        
                = good_reaction
                ~ temp charNameOne = translator(firstChar_ActualName)
                ~ temp charNameTwo = translator(secondChar_ActualName)
                ~ temp charNameThree = translator(thirdChar_ActualName)
                ~ temp charNameFour= translator(fourthChar_ActualName)
            
                        
            

                    {charTag(FifthCharacter, "neutral")}:       Aggiungere {ingredientTranslator(kitchen_fifthCharExtraIngredient)} è stato un tocco geniale.
                    {
                        - kitchen_firstCharExtraIngredient == universalIngredient:
                            {charTag(FifthCharacter, "neutral")}:       AGGIUNGI RICORDO IMPORTANTE DI BOCCALE.
                    }
                        //@animation:RewriterBook

                        -> relationship_feedback
                
                = bad_reaction
                ~ temp charNameOne = translator(firstChar_ActualName)
                ~ temp charNameTwo = translator(secondChar_ActualName)
                ~ temp charNameThree = translator(thirdChar_ActualName)
                ~ temp charNameFour= translator(fourthChar_ActualName)
              

            

                    {charTag(FifthCharacter, "neutral")}:       Aggiungere {ingredientTranslator(kitchen_fifthCharExtraIngredient)} è stata una scelta.
        
                        -> relationship_feedback
            
                
                = meh_reaction
                ~ temp charNameOne = translator(firstChar_ActualName)
                ~ temp charNameTwo = translator(secondChar_ActualName)
                ~ temp charNameThree = translator(thirdChar_ActualName)
                ~ temp charNameFour= translator(fourthChar_ActualName)
            
                        
            

                    {charTag(FifthCharacter, "neutral")}:       L'aggiunta di {ingredientTranslator(kitchen_fifthCharExtraIngredient)} mi ha confusa.
          
                        -> relationship_feedback
            
    
        
    = relationship_feedback
        -> achievements_onGame_statusUpdate_GM ->
        {charTag(FifthCharacter, "neutral")}:       Comunque {player_name}, stavo pensando alla nostra conversazione qui, assieme.
        
        //Prima di tutto chiamo la funzione per il calcolo dello stato della relazione
        ~ affinity_calc(FifthCharacter)
        //Così poi posso dare il feedback

        {
            - fifthChar_relationshipStatus == negative:
                {charTag(FifthCharacter, "neutral")}:       Credo che la risposta sia no.

                    ~ grimoire_fifthChar += grimFifthCharKitchenNegativeReaction

            - fifthChar_relationshipStatus == neutral:
                {charTag(FifthCharacter, "neutral")}:       Credo che la risposta sia "{player_pronoun has him:rimandato|{player_pronoun has her:rimandata|rimandatə}} a settembre".

                    ~ grimoire_fifthChar += grimFifthCharKitchenNeutralReaction

            - fifthChar_relationshipStatus == positive:
                {charTag(FifthCharacter, "neutral")}:       La risposta è sicuramente "sì".

                    ~ grimoire_fifthChar += grimFifthCharKitchenPositiveReaction

        }    
        
            
            
            -> ending_cooking_with_fifth_char
            
        
=== ending_cooking_with_fifth_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)

    
    {charTag(FourthCharacter, "neutral")}:       Frase
    

                ~ move_entity(FifthCharacter, Pond)
                ~ move_entity(FifthCharacterCucina, Safekeeping)
                ~ cooking_animations_off()
                ~ kitchen_fifthCharCookingTogetherInvite = false
                ~ kitchen_allChefs += FifthCharacter
                ~ kitchen_kitchenOccupied = false
                //Cucinare assieme aumenta anche il valore massimo di fifth_char_restart_value
                ~ fifth_char_restart_value ++

            ~ update_glyphs(FifthCharacter)
            -> achievements_onGame_statusUpdate_GM ->
            -> fifth_char_closing_storylet ->
            -> main




/* ---------------------------------

   Altri storylets legati alla cucina 

 ----------------------------------*/


=== fifth_char_cooking_tracker
//Lo lascio come knot e non come variabile perché potrebbe essermi utile (es: per attivare un suono che faccia sapere che c'è qualcunə in cucina)
    {debug: passo per fifth_char_cooking_tracker.}
    
    ->->


=== fifth_char_cooking_alone
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)

    {debug: passo per fifth_char_cooking_alone.}
    
        ~ cooking_animations_on()
        
    {kitchen_fifthCharCookingTime:

        - 0:
            {charTag(FifthCharacter, "neutral")}:       {Voglio preparare il piatto preferito di mio padre.|Scusami {player_name}, ma sto cucinando.}

        - 1:
            {charTag(FifthCharacter, "neutral")}:       {Voglio preparare il piatto preferito di mio padre.|Scusami {player_name}, ma sto cucinando.}
            
        - 2:
            {charTag(FifthCharacter, "neutral")}:       {Potrei sostituire l'aneto , uh, no, non una buona idea.|Perdonami {player_name}, ma sto cercando qualcosa che non mi avveleni.}
        
        - 3:
            {charTag(FifthCharacter, "neutral")}:       {Ricordati ragazza che cucinare non è una scusa per bere. Ma che gioia aver trovato del vinello. |Torna dopo {player_name}, devo, ehm, riflettere.}
            
        - 4:
            {charTag(FifthCharacter, "neutral")}:       {Quante possibilità ci sono che se caccio la mano nell'alveare della serra riesco a recuperare del miele?|{player_name}, ho un'idea stupida, torna dopo.}
        
        - 5:
            {charTag(FifthCharacter, "neutral")}:       {Uh, questo sughino spacca. Mamma ne sarebbe orgogliosa.|{player_name}, ho bisogno di concentrazione, a dopo.}
    
        - 6:
            {charTag(FifthCharacter, "neutral")}:       {Sarà una buona idea avere tutti questi coltelli accessibili  il bimbo in giro in giro? Merda, stavo per tagliarmi. Forse sono io il problema, non lui.|{player_name}, faccio danni già da sola, torna tra un po'.}
        
        - 7:
            {charTag(FifthCharacter, "neutral")}:       {Tocco finale, la crema di funghi. E ora lasciamo cuocere un po'. E ci beviamo un altro goccino.|{player_name}, resisti che ho quasi finito!}
        
        - else:
            {charTag(FifthCharacter, "neutral")}:       {Direi che ci siamo. Giusto la fiammata per restringere il brodo, ed è perfetta!|{player_name}, un attimo e ti lascio i fornelli, promesso.}
    }
    
    -> fifth_char_closing_storylet ->
    -> main




=== food_gift_fifth_char
{debug: passo per food_gift_third_char.}
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)

    
    {charTag(FifthCharacter, "neutral")}:       Frase
   
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
                
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero ("davvero" è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
                
            -
    
    -> fifth_char_closing_storylet ->
    ->->