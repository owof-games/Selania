
                    /* ---------------------------------
                                    
                Funzione di gestione di doni e ingredienti, accorpata
                                    
                    ----------------------------------*/
                    
=== function object_value_for_PNG(object, comingFrom, PNG)
{debug: passo per object_value_for_PNG. Il valore di object è {object}, di comingFrom è {comingFrom}, di PNG {PNG}.}
{
    - PNG == FirstCharacter:
        {
            - comingFrom == Kitchen:
                {debug: passo dai valori di Kitchen.}
                ~ kitchen_firstCharExtraIngredient = object
                
                {   
                    - object == universalIngredient:
                        {debug: oggetto è universalIngredient.}
                            ~ kitchen_firstCharExtraIngredientReaction = goodReaction

                    - firstChar_favouritesGifts has object:
                        {debug: l'oggetto è in firstChar_favouritesGifts.}
                            ~ kitchen_firstCharExtraIngredientReaction = goodReaction

                    - firstChar_goodGifts has object:
                        {debug: l'oggetto è in firstChar_goodGifts.}
                            ~ kitchen_firstCharExtraIngredientReaction = mehReaction
                            
                    - else:
                        {debug: a Chitarra l'oggetto non interessa.}
                            ~ kitchen_firstCharExtraIngredientReaction = badReaction
                            
                }
            
            - comingFrom == Backpack:
                {debug: passo dai valori dello zaino.}
                ~ firstChar_giftedObject += object
                
                {   
                    
                    - firstChar_favouritesGifts has object:
                    {charTag(TheWitch, "{witch_state()}")}:   <i>{~{translator(firstChar_ActualName)} abbraccia {player_name} entusiasta.|Sulle guance di {translator(firstChar_ActualName)} compare una lacrima.|{translator(firstChar_ActualName)} è un concentrato di gioia.}</i>
                            ~ firstChar_InkLevel ++
                            ~ firstChar_InkLevel ++
         
                    //Presupponiamo che un po' ma non troppo le piaccia l'ingrediente universale
                    - firstChar_goodGifts has object or object == universalIngredient:
                        {charTag(TheWitch, "{witch_state()}")}:   <i>{~{translator(firstChar_ActualName)} si passa il dono tra le mani.|{translator(firstChar_ActualName)} sorride.|{translator(firstChar_ActualName)} ringrazia {player_name}.}</i>
                            ~ firstChar_InkLevel ++
                    
                    - else:
                        {charTag(TheWitch, "{witch_state()}")}:   <i>{~{translator(firstChar_ActualName)} ignora il dono.|{translator(firstChar_ActualName)} ringrazia {player_name} e si distrae rapidamente.}</i>
                }
                
        
        }
        
        
    - PNG == SecondCharacter:
        {
            - comingFrom == Kitchen:
                {debug: passo dai valori di Kitchen.}
                ~ kitchen_secondCharExtraIngredient = object

                
                {   
                    - object == universalIngredient:
                        {debug: oggetto è universalIngredient.}
                            ~ kitchen_secondCharExtraIngredientReaction = goodReaction

                    - secondChar_favouritesGifts has object:
                        {debug: l'oggetto è in secondChar_favouritesGifts.}
                            ~ kitchen_secondCharExtraIngredientReaction = goodReaction

                    - secondChar_goodGifts has object:
                        {debug: l'oggetto è in secondChar_goodGifts.}
                            ~ kitchen_secondCharExtraIngredientReaction = mehReaction
                            
                    - else:
                         {debug: a Riccio l'oggetto non interessa.}
                            ~ kitchen_secondCharExtraIngredientReaction = badReaction
                            
                }
            
            - comingFrom == Backpack:
                {debug: passo dai valori dello zaino.}
                ~ secondChar_giftedObject += object
                
                {   
                    
                    - secondChar_favouritesGifts has object:
                       {charTag(TheWitch, "{witch_state()}")}:   <i>{~{translator(secondChar_ActualName)} abbraccia {player_name}, entusiasta.|Sulle guance di {translator(secondChar_ActualName)} compare una lacrima.|{translator(secondChar_ActualName)} è un concentrato di gioia.}</i>
                        ~ secondChar_InkLevel ++
                        ~ secondChar_InkLevel ++
         
                    //Presupponiamo che un po' ma non troppo le piaccia l'ingrediente universale
                    - secondChar_goodGifts has object or object == universalIngredient:
                        {charTag(TheWitch, "{witch_state()}")}:   <i>{~{translator(secondChar_ActualName)} prova ad assaggiare il dono, divertito.|Sulle guance di {translator(secondChar_ActualName)} compare un grande sorriso.|{translator(secondChar_ActualName)} saltella.}</i>
                        ~ secondChar_InkLevel ++
                    
                    - else:
                        {charTag(TheWitch, "{witch_state()}")}:   <i>{~{translator(secondChar_ActualName)} insegue una lucertola con lo sguardo.|{translator(secondChar_ActualName)} lascia scivolare il dono a terra.}</i>
                }
            
        }  

    - PNG == ThirdCharacter:
        {
            - comingFrom == Kitchen:
                {debug: passo dai valori di Kitchen.}
                ~ kitchen_thirdCharExtraIngredient = object

                
                {   
                    - object == universalIngredient:
                        {debug: oggetto è universalIngredient.}
                            ~ kitchen_thirdCharExtraIngredientReaction = goodReaction

                    - thirdChar_favouritesGifts has object:
                        {debug: l'oggetto è in thirdChar_favouritesGifts.}
                            ~ kitchen_thirdCharExtraIngredientReaction = goodReaction

                    - thirdChar_goodGifts has object:
                        {debug: l'oggetto è in thirdChar_goodGifts.}
                            ~ kitchen_thirdCharExtraIngredientReaction = mehReaction
                            
                    - else:
                         {debug: a Riccio l'oggetto non interessa.}
                            ~ kitchen_thirdCharExtraIngredientReaction = badReaction
                            
                }
            
            - comingFrom == Backpack:
                {debug: passo dai valori dello zaino.}
                ~ thirdChar_giftedObject += object
                
                {   
                    
                    - thirdChar_favouritesGifts has object:
                       {charTag(TheWitch, "{witch_state()}")}:   <i>{~{translator(thirdChar_ActualName)} abbraccia {player_name}, entusiasta.|Sulle guance di {translator(thirdChar_ActualName)} compare una lacrima.|{translator(thirdChar_ActualName)} è un concentrato di gioia.}</i>
                        ~ thirdChar_InkLevel ++
                        ~ thirdChar_InkLevel ++
         
                    //Presupponiamo che un po' ma non troppo le piaccia l'ingrediente universale
                    - thirdChar_goodGifts has object or object == universalIngredient:
                        {charTag(TheWitch, "{witch_state()}")}:   <i>{~{translator(thirdChar_ActualName)} prova ad assaggiare il dono, divertito.|Sulle guance di {translator(thirdChar_ActualName)} compare un grande sorriso.|{translator(thirdChar_ActualName)} saltella.}</i>
                        ~ thirdChar_InkLevel ++
                    
                    - else:
                        {charTag(TheWitch, "{witch_state()}")}:   <i>{~{translator(thirdChar_ActualName)} insegue una lucertola con lo sguardo.|{translator(thirdChar_ActualName)} lascia scivolare il dono a terra.}</i>
                }
            
        }      

    - else: 
        ERRORE: valore di PNG non supportato {PNG}.


}

