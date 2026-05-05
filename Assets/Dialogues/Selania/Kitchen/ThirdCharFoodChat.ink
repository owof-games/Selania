/* ---------------------------------

   Cucina con Chitarra

 ----------------------------------*/
=== pre_start_cooking_with_third_char
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)

    
{charTag(ThirdCharacter, "neutral")}:       Cuciniamo?
        
        + \ {charTag(PG, "neutral")}:         Sono pront{player_pronouns has him:o|{player_pronouns has her:a|ə}}!
            -> cooking_with_third_char
        
        + \ {charTag(PG, "neutral")}:         Vorrei pensarci un attimo {charNameOne}.
            -> main
 

=== cooking_with_third_char
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)

    
    
    {charTag(PG, "neutral")}:      Sai {charNameOne}, mentre cuciniamo potremmo parlare un po'.
    
    - (top)
    {charTag(PG, "neutral")}:      In particolare, ripensando alle nostre conversazioni, mi farebbe piacere parlare di più...
        {
            - grimoire_thirdChar hasnt grimThirdCharNine:
                {charTag(TheWitch, witch_state())}:   <i>{charNameTwo} ha ancora spunti di conversazione da offrire a {player_name}, se {player_name} deciderà di parlarle ancora un po'.
        }
        
        + \ {charTag(PG, "neutral")}:         Dei rapporti che hai con le persone che ti sono care.
                ~ cooking_animations_on()
                -> storage_glyphs(ThirdCharacter)->
                -> third_theme
                
        + {grimoire_thirdChar has grimThirdCharFive}\ {charTag(PG, "neutral")}:        Del bisogno di fare qualcosa che salvi il mondo.
                ~ cooking_animations_on()
                -> storage_glyphs(ThirdCharacter)->
                -> second_theme
  
        + {grimoire_thirdChar has grimThirdCharNine}\ {charTag(PG, "neutral")}:         Della tua creatività.
                ~ cooking_animations_on()
                -> storage_glyphs(ThirdCharacter)->
                -> third_theme
       
            
        + \ {charTag(PG, "neutral")}:         Sai, forse preferirei cucinare più tardi.
            {charTag(ThirdCharacter, "neutral")}:       Nessun problema, prenditi i tuoi tempi {player_name}.
                ~ kitchen_thirdCharCookingTogetherInvite = false
                ~ kitchen_thirdCharCookingTogetherWaiting = 0
                ~ move_entity(ThirdCharacter, Pond)
            ->->


    
    = first_theme
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


       
        {charTag(ThirdCharacter, "neutral")}:       Frase
        
            + \ {charTag(PG, "neutral")}:         Aria
                -> glyph_choice_manager(false, airC)->

               
            + \ {charTag(PG, "neutral")}:         Terra
                -> glyph_choice_manager(false, earthC)->

            + \ {charTag(PG, "neutral")}:         Fuoco
                -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Acqua
                -> glyph_choice_manager(false, waterC)->
                Mi suona molto, ama.
    
            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_choice_manager(false, aetherC)->
            -    
        {charTag(ThirdCharacter, "neutral")}:       Frase
            
            -> kitchen_moon_feedback -> 
        

            + (earth1)\ {charTag(PG, "neutral")}:         <i>Ingrediente terra</i>
                ~ kitchen_recipeNoun = "Zuppa di grano"
                -> glyph_choice_manager(true, earthC)->


            + (water1)\ {charTag(PG, "neutral")}:         <i>Ingrediente acqua</i>
                ~ kitchen_recipeNoun = "Grigliata di seitan"
                -> glyph_choice_manager(true, waterC)->
                
            + (fire1)\ {charTag(PG, "neutral")}:         <i>Ingrediente fire</i>
               ~ kitchen_recipeNoun = "Fagiolata"
               -> glyph_choice_manager(true, fireC)->

        
            + (aether1)\ {charTag(PG, "neutral")}:         <i>Ingrediente spirito</i>
                ~ kitchen_recipeNoun = "Cimetta di broccolo"
                -> glyph_choice_manager(true, aetherC)->

    
            + (air1)\ {charTag(PG, "neutral")}:         <i>Ingrediente aria</i>
                ~ kitchen_recipeNoun = "Crema d'aglio"
                -> glyph_choice_manager(true, airC)->
            -  
        
        {charTag(ThirdCharacter, "neutral")}:       Frase
    
            + \ {charTag(PG, "neutral")}:        Fuoco
                -> glyph_choice_manager(false, fireC)->
  
            
            + \ {charTag(PG, "neutral")}:         Aria
                -> glyph_choice_manager(false, airC)->
 
            + \ {charTag(PG, "neutral")}:         Acqua
                -> glyph_choice_manager(false, waterC)->
   
       
            + \ {charTag(PG, "neutral")}:         Terra
                -> glyph_choice_manager(false, earthC)->

             
            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_choice_manager(false, aetherC)->
    
            -
        
        {charTag(ThirdCharacter, "neutral")}:       Frase
        
            + (earth2)\ {charTag(PG, "neutral")}:         <i>Ingrediente terra</i>
                ~ kitchen_recipeAdjective = "onesta"
                -> glyph_choice_manager(true, earthC)->
    
               
            + (air2)\ {charTag(PG, "neutral")}:         <i>Ingrediente aria</i>
                ~ kitchen_recipeAdjective = "allegra"
                -> glyph_choice_manager(true, airC)->
  
             
            + (water2)\ {charTag(PG, "neutral")}:         <i>Ingrediente acqua</i>
               ~ kitchen_recipeAdjective = "empatica"
               -> glyph_choice_manager(true, waterC)->

        
            + (aether2)\ {charTag(PG, "neutral")}:         <i>Ingrediente spirito</i>
                ~ kitchen_recipeAdjective = "incondizionata"
                -> glyph_choice_manager(true, aetherC)->

    
            + (fire2)\ {charTag(PG, "neutral")}:         <i>Ingrediente fire</i>
                ~ kitchen_recipeAdjective = "leale"
                -> glyph_choice_manager(true, fireC)->
            -      
        
        {charTag(ThirdCharacter, "neutral")}:       Frase

            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_choice_manager(false, aetherC)->
            
            + \ {charTag(PG, "neutral")}:         Fuoco
                -> glyph_choice_manager(false, fireC)->

            
            + \ {charTag(PG, "neutral")}:          Terra
                -> glyph_choice_manager(false, earthC)->
             
            + \ {charTag(PG, "neutral")}:         Aria
                -> glyph_choice_manager(false, airC)->
                   
            + \ {charTag(PG, "neutral")}:         Acqua
                -> glyph_choice_manager(false, waterC)->
            -
        {
            - contentsKitchen has Bat:
                {charTag(ThirdCharacter, "neutral")}:       Questo pipistrello mi sta spaventando.

            - else:
                {charTag(ThirdCharacter, "neutral")}:       Carini gli insetti ma vorrei non finissero nel nostro veganissimo piatto.
        }

        {charTag(ThirdCharacter, "neutral")}:       Frase
        
            + (water3)\ {charTag(PG, "neutral")}:         <i>Ingrediente acqua</i>
                ~ kitchen_recipeComplement = "con brodo del terrore"
                -> glyph_choice_manager(true, waterC)->
               
            + (earth3)\ {charTag(PG, "neutral")}:         <i>Ingrediente terra</i>
                ~ kitchen_recipeComplement = "con noce euforica"
                -> glyph_choice_manager(true, earthC)->
             
            + (air3)\ {charTag(PG, "neutral")}:         <i>Ingrediente aria</i>
               ~ kitchen_recipeComplement = "con semi dell'<i>io? no, no è possibile!</i>"
               -> glyph_choice_manager(true, airC)->
        
            + (aether3)\ {charTag(PG, "neutral")}:         <i>Ingrediente spirito</i>
                ~ kitchen_recipeComplement = "con olio delle lusinghe"
                -> glyph_choice_manager(true, aetherC)->
    
            + (fire3)\ {charTag(PG, "neutral")}:         <i>Ingrediente fire</i>
                ~ kitchen_recipeComplement = "con peperoncini arrapati"
                -> glyph_choice_manager(true, fireC)->
            -
            -> fourth_ingredient_dispatcher
            
    
    = second_theme
        ~ temp charNameOne = translator(thirdChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
    
        {charTag(ThirdCharacter, "neutral")}:       Frase
        
            + \ {charTag(PG, "neutral")}:         Aria
                -> glyph_choice_manager(false, airC)->

               
            + \ {charTag(PG, "neutral")}:         Terra
                -> glyph_choice_manager(false, earthC)->

            + \ {charTag(PG, "neutral")}:         Fuoco
                -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Acqua
                -> glyph_choice_manager(false, waterC)->
                Mi suona molto, ama.
    
            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_choice_manager(false, aetherC)->
            -    
        {charTag(ThirdCharacter, "neutral")}:       Frase
            
            -> kitchen_moon_feedback -> 
        

            + (earth1)\ {charTag(PG, "neutral")}:         <i>Ingrediente terra</i>
                ~ kitchen_recipeNoun = "Zuppa di grano"
                -> glyph_choice_manager(true, earthC)->


            + (water1)\ {charTag(PG, "neutral")}:         <i>Ingrediente acqua</i>
                ~ kitchen_recipeNoun = "Grigliata di seitan"
                -> glyph_choice_manager(true, waterC)->
                
            + (fire1)\ {charTag(PG, "neutral")}:         <i>Ingrediente fire</i>
               ~ kitchen_recipeNoun = "Fagiolata"
               -> glyph_choice_manager(true, fireC)->

        
            + (aether1)\ {charTag(PG, "neutral")}:         <i>Ingrediente spirito</i>
                ~ kitchen_recipeNoun = "Cimetta di broccolo"
                -> glyph_choice_manager(true, aetherC)->

    
            + (air1)\ {charTag(PG, "neutral")}:         <i>Ingrediente aria</i>
                ~ kitchen_recipeNoun = "Crema d'aglio"
                -> glyph_choice_manager(true, airC)->
            -  
        
        {charTag(ThirdCharacter, "neutral")}:       Frase
    
            + \ {charTag(PG, "neutral")}:        Fuoco
                -> glyph_choice_manager(false, fireC)->
  
            
            + \ {charTag(PG, "neutral")}:         Aria
                -> glyph_choice_manager(false, airC)->
 
            + \ {charTag(PG, "neutral")}:         Acqua
                -> glyph_choice_manager(false, waterC)->
   
       
            + \ {charTag(PG, "neutral")}:         Terra
                -> glyph_choice_manager(false, earthC)->

             
            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_choice_manager(false, aetherC)->
    
            -
        
        {charTag(ThirdCharacter, "neutral")}:       Frase
        
            + (earth2)\ {charTag(PG, "neutral")}:         <i>Ingrediente terra</i>
                ~ kitchen_recipeAdjective = "onesta"
                -> glyph_choice_manager(true, earthC)->
    
               
            + (air2)\ {charTag(PG, "neutral")}:         <i>Ingrediente aria</i>
                ~ kitchen_recipeAdjective = "allegra"
                -> glyph_choice_manager(true, airC)->
  
             
            + (water2)\ {charTag(PG, "neutral")}:         <i>Ingrediente acqua</i>
               ~ kitchen_recipeAdjective = "empatica"
               -> glyph_choice_manager(true, waterC)->

        
            + (aether2)\ {charTag(PG, "neutral")}:         <i>Ingrediente spirito</i>
                ~ kitchen_recipeAdjective = "incondizionata"
                -> glyph_choice_manager(true, aetherC)->

    
            + (fire2)\ {charTag(PG, "neutral")}:         <i>Ingrediente fire</i>
                ~ kitchen_recipeAdjective = "leale"
                -> glyph_choice_manager(true, fireC)->
            -      
        
        {charTag(ThirdCharacter, "neutral")}:       Frase

            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_choice_manager(false, aetherC)->
            
            + \ {charTag(PG, "neutral")}:         Fuoco
                -> glyph_choice_manager(false, fireC)->

            
            + \ {charTag(PG, "neutral")}:          Terra
                -> glyph_choice_manager(false, earthC)->
             
            + \ {charTag(PG, "neutral")}:         Aria
                -> glyph_choice_manager(false, airC)->
                   
            + \ {charTag(PG, "neutral")}:         Acqua
                -> glyph_choice_manager(false, waterC)->
            -
        {
            - contentsKitchen has Bat:
                {charTag(ThirdCharacter, "neutral")}:       Questo pipistrello mi sta spaventando.

            - else:
                {charTag(ThirdCharacter, "neutral")}:       Carini gli insetti ma vorrei non finissero nel nostro veganissimo piatto.
        }

        {charTag(ThirdCharacter, "neutral")}:       Frase
        
            + (water3)\ {charTag(PG, "neutral")}:         <i>Ingrediente acqua</i>
                ~ kitchen_recipeComplement = "con brodo del terrore"
                -> glyph_choice_manager(true, waterC)->
               
            + (earth3)\ {charTag(PG, "neutral")}:         <i>Ingrediente terra</i>
                ~ kitchen_recipeComplement = "con noce euforica"
                -> glyph_choice_manager(true, earthC)->
             
            + (air3)\ {charTag(PG, "neutral")}:         <i>Ingrediente aria</i>
               ~ kitchen_recipeComplement = "con semi dell'<i>io? no, no è possibile!</i>"
               -> glyph_choice_manager(true, airC)->
        
            + (aether3)\ {charTag(PG, "neutral")}:         <i>Ingrediente spirito</i>
                ~ kitchen_recipeComplement = "con olio delle lusinghe"
                -> glyph_choice_manager(true, aetherC)->
    
            + (fire3)\ {charTag(PG, "neutral")}:         <i>Ingrediente fire</i>
                ~ kitchen_recipeComplement = "con peperoncini arrapati"
                -> glyph_choice_manager(true, fireC)->
            -
            -> fourth_ingredient_dispatcher
            
                
    
    = third_theme
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)


                {charTag(ThirdCharacter, "neutral")}:       Frase
        
            + \ {charTag(PG, "neutral")}:         Aria
                -> glyph_choice_manager(false, airC)->

               
            + \ {charTag(PG, "neutral")}:         Terra
                -> glyph_choice_manager(false, earthC)->

            + \ {charTag(PG, "neutral")}:         Fuoco
                -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Acqua
                -> glyph_choice_manager(false, waterC)->
                Mi suona molto, ama.
    
            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_choice_manager(false, aetherC)->
            -    
        {charTag(ThirdCharacter, "neutral")}:       Frase
            
            -> kitchen_moon_feedback -> 
        

            + (earth1)\ {charTag(PG, "neutral")}:         <i>Ingrediente terra</i>
                ~ kitchen_recipeNoun = "Zuppa di grano"
                -> glyph_choice_manager(true, earthC)->


            + (water1)\ {charTag(PG, "neutral")}:         <i>Ingrediente acqua</i>
                ~ kitchen_recipeNoun = "Grigliata di seitan"
                -> glyph_choice_manager(true, waterC)->
                
            + (fire1)\ {charTag(PG, "neutral")}:         <i>Ingrediente fire</i>
               ~ kitchen_recipeNoun = "Fagiolata"
               -> glyph_choice_manager(true, fireC)->

        
            + (aether1)\ {charTag(PG, "neutral")}:         <i>Ingrediente spirito</i>
                ~ kitchen_recipeNoun = "Cimetta di broccolo"
                -> glyph_choice_manager(true, aetherC)->

    
            + (air1)\ {charTag(PG, "neutral")}:         <i>Ingrediente aria</i>
                ~ kitchen_recipeNoun = "Crema d'aglio"
                -> glyph_choice_manager(true, airC)->
            -  
        
        {charTag(ThirdCharacter, "neutral")}:       Frase
    
            + \ {charTag(PG, "neutral")}:        Fuoco
                -> glyph_choice_manager(false, fireC)->
  
            
            + \ {charTag(PG, "neutral")}:         Aria
                -> glyph_choice_manager(false, airC)->
 
            + \ {charTag(PG, "neutral")}:         Acqua
                -> glyph_choice_manager(false, waterC)->
   
       
            + \ {charTag(PG, "neutral")}:         Terra
                -> glyph_choice_manager(false, earthC)->

             
            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_choice_manager(false, aetherC)->
    
            -
        
        {charTag(ThirdCharacter, "neutral")}:       Frase
        
            + (earth2)\ {charTag(PG, "neutral")}:         <i>Ingrediente terra</i>
                ~ kitchen_recipeAdjective = "onesta"
                -> glyph_choice_manager(true, earthC)->
    
               
            + (air2)\ {charTag(PG, "neutral")}:         <i>Ingrediente aria</i>
                ~ kitchen_recipeAdjective = "allegra"
                -> glyph_choice_manager(true, airC)->
  
             
            + (water2)\ {charTag(PG, "neutral")}:         <i>Ingrediente acqua</i>
               ~ kitchen_recipeAdjective = "empatica"
               -> glyph_choice_manager(true, waterC)->

        
            + (aether2)\ {charTag(PG, "neutral")}:         <i>Ingrediente spirito</i>
                ~ kitchen_recipeAdjective = "incondizionata"
                -> glyph_choice_manager(true, aetherC)->

    
            + (fire2)\ {charTag(PG, "neutral")}:         <i>Ingrediente fire</i>
                ~ kitchen_recipeAdjective = "leale"
                -> glyph_choice_manager(true, fireC)->
            -      
        
        {charTag(ThirdCharacter, "neutral")}:       Frase

            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_choice_manager(false, aetherC)->
            
            + \ {charTag(PG, "neutral")}:         Fuoco
                -> glyph_choice_manager(false, fireC)->

            
            + \ {charTag(PG, "neutral")}:          Terra
                -> glyph_choice_manager(false, earthC)->
             
            + \ {charTag(PG, "neutral")}:         Aria
                -> glyph_choice_manager(false, airC)->
                   
            + \ {charTag(PG, "neutral")}:         Acqua
                -> glyph_choice_manager(false, waterC)->
            -
        {
            - contentsKitchen has Bat:
                {charTag(ThirdCharacter, "neutral")}:       Questo pipistrello mi sta spaventando.

            - else:
                {charTag(ThirdCharacter, "neutral")}:       Carini gli insetti ma vorrei non finissero nel nostro veganissimo piatto.
        }

        {charTag(ThirdCharacter, "neutral")}:       Frase
        
            + (water3)\ {charTag(PG, "neutral")}:         <i>Ingrediente acqua</i>
                ~ kitchen_recipeComplement = "con brodo del terrore"
                -> glyph_choice_manager(true, waterC)->
               
            + (earth3)\ {charTag(PG, "neutral")}:         <i>Ingrediente terra</i>
                ~ kitchen_recipeComplement = "con noce euforica"
                -> glyph_choice_manager(true, earthC)->
             
            + (air3)\ {charTag(PG, "neutral")}:         <i>Ingrediente aria</i>
               ~ kitchen_recipeComplement = "con semi dell'<i>io? no, no è possibile!</i>"
               -> glyph_choice_manager(true, airC)->
        
            + (aether3)\ {charTag(PG, "neutral")}:         <i>Ingrediente spirito</i>
                ~ kitchen_recipeComplement = "con olio delle lusinghe"
                -> glyph_choice_manager(true, aetherC)->
    
            + (fire3)\ {charTag(PG, "neutral")}:         <i>Ingrediente fire</i>
                ~ kitchen_recipeComplement = "con peperoncini arrapati"
                -> glyph_choice_manager(true, fireC)->
            -
            -> fourth_ingredient_dispatcher
            
    
    
    //La chiusura è comune, sempre per ridurre il rischio di errori
    = fourth_ingredient_dispatcher
    {charTag(ThirdCharacter, "neutral")}:       Ma {player_name}, qui a me sembra tutto pronto, non trovi?
    
        {
            - backpack_findedGifts == (): 
                {charTag(TheWitch, witch_state())}:   <i>{player_name} non possiede alcun ingrediente speciale.</i>
                    -> at_table_with_third_char
                
            - else:
                -> add_ingredient
        
        }
    
        = add_ingredient
        ~ temp charNameOne = translator(thirdChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
    
        
            {charTag(TheWitch, witch_state())}:     <i>Il giusto ingrediente renderà la ricetta di {player_name} e {charNameOne} musicale.
                                                    <i>E {player_name} potrebbe capire un po' meglio {charNameOne}.
       
                + \ {charTag(PG, "neutral")}:         <i>Aggiunto un ingrediente speciale.
                        -> grimoire_greenhouse_gifts_and_ingredient ->

                        //Dopo di che associo la scelta fatta alla PNG
                        ~ kitchen_thirdCharExtraIngredient = grimoire_chosenPlant
                        //E svuoto la variabile del grimorio
                        ~ grimoire_chosenPlant = ()
                        //E poi chiamo la funzione per aggiornare i valori
                        ~ object_value_for_PNG(kitchen_thirdCharExtraIngredient, Kitchen, ThirdCharacter)
                        //E il nome dell'ingrediente
                        ~ extra_ingredient_name(kitchen_thirdCharExtraIngredient)
                    
                + \ {charTag(PG, "neutral")}:         <i>Non aggiungo altro.
                -
                
            {charTag(ThirdCharacter, "neutral")}:       Andiamo a mangiare, ama!

                -> at_table_with_third_char



=== at_table_with_third_char
    -> grimoire_storylets_updater -> 

    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive= translator(fifthChar_ActualName)

    ~ move_entity(CookingWithThirdCharOBJ, Kitchen)
    ~ move_entity(EatingWithThirdCharOBJ, Kitchen)
    ~ temp piatto = kitchen_tempRecipeName
    ~ recipe_name_creator()
    ~ recipe_name_storage(ThirdCharacter)

    {charTag(ThirdCharacter, "neutral")}:       È stato divertente cucinare assieme, {player_name}.

        {
            -cooking_with_third_char.third_theme:
                {charTag(ThirdCharacter, "neutral")}:       E non mi facevo certe domande da molto.

            -cooking_with_third_char.second_theme:
                {charTag(ThirdCharacter, "neutral")}:       E non avevo mai pensato fino in fondo al discorso del salvare il mondo etc etc.
            
            -cooking_with_third_char.third_theme:
                {charTag(ThirdCharacter, "neutral")}:       E discutere di creatività.

        }
    {charTag(ThirdCharacter, "neutral")}:       E poi questo {piatto}!
    {charTag(ThirdCharacter, "neutral")}:       Spacca, non trovi?
    
        {
            - kitchen_thirdCharExtraIngredientReaction != notReaction:
                -> extra_ing_feedback
            
            - else:
                E ho la pancia strapiena ora.
                -> relationship_feedback
                
        }
        
        
    
        
        
        = extra_ing_feedback
        
        // Qui verranno fatti commenti diversi a seconda che l'ingrediente sarà apprezzato o meno.
            {
                - kitchen_thirdCharExtraIngredientReaction == goodReaction:
                    -> good_reaction
                
                - kitchen_thirdCharExtraIngredientReaction == badReaction:
                    -> bad_reaction
                
                - kitchen_thirdCharExtraIngredientReaction == mehReaction:
                    -> meh_reaction
                
                - else:
                    ERROR: non abbiamo un valore valido di kitchen_thirdCharExtraIngredientReaction, che è uguale a {kitchen_thirdCharExtraIngredientReaction}.
            }

        
                = good_reaction
                ~ temp charNameOne = translator(thirdChar_ActualName)
                ~ temp charNameTwo = translator(secondChar_ActualName)
                ~ temp charNameThree = translator(thirdChar_ActualName)
                ~ temp charNameFour= translator(fourthChar_ActualName)
            
                        
                        -> kitchen_moon_feedback -> 

                    {charTag(ThirdCharacter, "neutral")}:       Aggiungere {ingredientTranslator(kitchen_thirdCharExtraIngredient)} è stato un tocco geniale.
                    {
                        - kitchen_firstCharExtraIngredient == universalIngredient:
                            {charTag(ThirdCharacter, "neutral")}:       AGGIUNGI RICORDO IMPORTANTE DI BOCCALE.
                    }
                        @animation:RewriterBook

                        -> relationship_feedback
                
                = bad_reaction
                ~ temp charNameOne = translator(thirdChar_ActualName)
                ~ temp charNameTwo = translator(secondChar_ActualName)
                ~ temp charNameThree = translator(thirdChar_ActualName)
                ~ temp charNameFour= translator(fourthChar_ActualName)
              

                        -> kitchen_moon_feedback -> 

                    {charTag(ThirdCharacter, "neutral")}:       Aggiungere {ingredientTranslator(kitchen_thirdCharExtraIngredient)} è stata una scelta.
        
                        -> relationship_feedback
            
                
                = meh_reaction
                ~ temp charNameOne = translator(thirdChar_ActualName)
                ~ temp charNameTwo = translator(secondChar_ActualName)
                ~ temp charNameThree = translator(thirdChar_ActualName)
                ~ temp charNameFour= translator(fourthChar_ActualName)
            
                        
                        -> kitchen_moon_feedback -> 

                    {charTag(ThirdCharacter, "neutral")}:       L'aggiunta di {ingredientTranslator(kitchen_thirdCharExtraIngredient)} mi ha confusa.
          
                        -> relationship_feedback
            
    
        
    = relationship_feedback
        -> achievements_onGame_statusUpdate_GM ->
        {charTag(ThirdCharacter, "neutral")}:       Comunque {player_name}, stavo pensando alla nostra conversazione qui, assieme.
        
        //Prima di tutto chiamo la funzione per il calcolo dello stato della relazione
        ~ affinity_calc(ThirdCharacter)
        //Così poi posso dare il feedback

        {
            - thirdChar_relationshipStatus == negative:
                {charTag(ThirdCharacter, "neutral")}:       Credo che la risposta sia no.

                    ~ grimoire_thirdChar += grimThirdCharKitchenNegativeReaction

            - thirdChar_relationshipStatus == neutral:
                {charTag(ThirdCharacter, "neutral")}:       Credo che la risposta sia "{player_pronouns has him:rimandato|{player_pronouns has her:rimandata|rimandatə}} a settembre".

                    ~ grimoire_thirdChar += grimThirdCharKitchenNeutralReaction

            - thirdChar_relationshipStatus == positive:
                {charTag(ThirdCharacter, "neutral")}:       La risposta è sicuramente "sì".

                    ~ grimoire_thirdChar += grimThirdCharKitchenPositiveReaction

        }    
        
            
            
            -> ending_cooking_with_third_char
            
        
=== ending_cooking_with_third_char
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)

    
    {charTag(ThirdCharacter, "neutral")}:       Frase
    

                ~ move_entity(ThirdCharacter, Pond)
                ~ cooking_animations_off()
                ~ kitchen_thirdCharCookingTogetherInvite = false
                ~ kitchen_allChefs += ThirdCharacter
                ~ kitchen_kitchenOccupied = false
            ~ update_glyphs(ThirdCharacter)
            -> achievements_onGame_statusUpdate_GM ->
            -> third_char_closing_storylet ->
            -> main




/* ---------------------------------

   Altri storylets legati alla cucina 

 ----------------------------------*/


=== third_char_cooking_tracker
//Lo lascio come knot e non come variabile perché potrebbe essermi utile (es: per attivare un suono che faccia sapere che c'è qualcunə in cucina)
    {debug: passo per third_char_cooking_tracker.}
    
    ->->


=== third_char_cooking_alone
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)

    {debug: passo per third_char_cooking_alone.}
    
        ~ cooking_animations_on()
        
    {kitchen_thirdCharCookingTime:

        - 0:
            {charTag(ThirdCharacter, "neutral")}:       {Voglio preparare il piatto preferito di mio padre.|Scusami {player_name}, ma sto cucinando.}

        - 1:
            {charTag(ThirdCharacter, "neutral")}:       {Voglio preparare il piatto preferito di mio padre.|Scusami {player_name}, ma sto cucinando.}
            
        - 2:
            {charTag(ThirdCharacter, "neutral")}:       {Potrei sostituire l'aneto con, uh, no, non una buona idea.|Perdonami {player_name}, ma sto cercando qualcosa che non mi avveleni.}
        
        - 3:
            {charTag(ThirdCharacter, "neutral")}:       {Ricordati ragazza che cucinare non è una scusa per bere. Ma che gioia aver trovato del vinello. |Torna dopo {player_name}, devo, ehm, riflettere.}
            
        - 4:
            {charTag(ThirdCharacter, "neutral")}:       {Quante possibilità ci sono che se caccio la mano nell'alveare della serra riesco a recuperare del miele?|{player_name}, ho un'idea stupida, torna dopo.}
        
        - 5:
            {charTag(ThirdCharacter, "neutral")}:       {Uh, questo sughino spacca. Mamma ne sarebbe orgogliosa.|{player_name}, ho bisogno di concentrazione, a dopo.}
    
        - 6:
            {charTag(ThirdCharacter, "neutral")}:       {Sarà una buona idea avere tutti questi coltelli accessibili con il bimbo in giro in giro? Merda, stavo per tagliarmi. Forse sono io il problema, non lui.|{player_name}, faccio danni già da sola, torna tra un po'.}
        
        - 7:
            {charTag(ThirdCharacter, "neutral")}:       {Tocco finale, la crema di funghi. E ora lasciamo cuocere un po'. E ci beviamo un altro goccino.|{player_name}, resisti che ho quasi finito!}
        
        - else:
            {charTag(ThirdCharacter, "neutral")}:       {Direi che ci siamo. Giusto la fiammata per restringere il brodo, ed è perfetta!|{player_name}, un attimo e ti lascio i fornelli, promesso.}
    }
    
    -> third_char_closing_storylet ->
    -> main




=== food_gift_third_char
{debug: passo per food_gift_third_char.}
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)

    
    {charTag(ThirdCharacter, "neutral")}:       Frase
   
            + \ {charTag(PG, "neutral")}:         Scelta acqua
                    -> glyph_choice_manager(false, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:         Scelta spirito
                    -> glyph_choice_manager(false, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:         Scelta terra
                    -> glyph_choice_manager(false, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:         Scelta aria
                    -> glyph_choice_manager(false, airC)->
                
            
            + \ {charTag(PG, "neutral")}:              Scelta fuoco
                    -> glyph_choice_manager(false, fireC)-> 
                
            -
    
    -> third_char_closing_storylet ->
    ->->