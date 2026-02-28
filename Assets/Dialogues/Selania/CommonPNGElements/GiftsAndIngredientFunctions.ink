
                    /* ---------------------------------
                                    
                Funzione di gestione di doni e ingredienti, accorpata
                                    
                    ----------------------------------*/
                    
=== object_value_for_PNG(object, comingFrom, PNG)
{debug: passo per object_value_for_PNG. Il valore di object è {object}, di comingFrom è {comingFrom}, di PNG {PNG}.}
~ disableNestDialogue()
{
    - PNG == FirstCharacter:
        {
            - comingFrom == Kitchen:
                {debug: passo dai valori di Kitchen.}
                ~ kitchen_firstCharExtraIngredient = object
                //Levo dalla lista di cose che può donarci la rana
                ~ frog_firstCharObtainedGifts += charOneCooking
                
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
                ->->
            
            - comingFrom == Backpack:
                {debug: passo dai valori dello zaino.}
                ~ firstChar_giftedObject += object
                //Levo dalla lista di cose che può donarci la rana
                ~ frog_firstCharObtainedGifts += charOneCultivable
                
                {   
                    
                    - firstChar_favouritesGifts has object:
                    <i>{~{translator(firstChar_ActualName)} abbraccia {player_name} entusiasta.|Sulle guance di {translator(firstChar_ActualName)} compare una lacrima.|{translator(firstChar_ActualName)} è un concentrato di gioia.}#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                            ~ firstChar_InkLevel ++
                            ~ firstChar_InkLevel ++
         
                    //Presupponiamo che un po' ma non troppo le piaccia l'ingrediente universale
                    - firstChar_goodGifts has object or object == universalIngredient:
                        <i>{~{translator(firstChar_ActualName)} si passa il dono tra le mani.|{translator(firstChar_ActualName)} sorride.|{translator(firstChar_ActualName)} ringrazia {player_name}.}#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                            ~ firstChar_InkLevel ++
                    
                    - else:
                        <i>{~{translator(firstChar_ActualName)} ignora il dono.|{translator(firstChar_ActualName)} ringrazia {player_name} e si distrae rapidamente.}#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                }
                
            
            ~ gift_currentReceiver = ()
            -> first_story_gift.ink_outcome    
        
        }
        
        
    - PNG == SecondCharacter:
        {
            - comingFrom == Kitchen:
                {debug: passo dai valori di Kitchen.}
                ~ kitchen_secondCharExtraIngredient = object
                //Levo dalla lista di cose che può donarci la rana
                ~ frog_secondCharObtainedGifts += charTwoCooking
                
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
                ->->
            
            - comingFrom == Backpack:
                {debug: passo dai valori dello zaino.}
                ~ secondChar_giftedObject += object
                //Levo dalla lista di cose che può donarci la rana
                ~ frog_secondCharObtainedGifts += charTwoCultivable
                
                {   
                    
                    - secondChar_favouritesGifts has object:
                       <i>{~{translator(secondChar_ActualName)} abbraccia {player_name}, entusiasta.|Sulle guance di {translator(secondChar_ActualName)} compare una lacrima.|{translator(secondChar_ActualName)} è un concentrato di gioia.}#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                        ~ secondChar_InkLevel ++
                        ~ secondChar_InkLevel ++
         
                    //Presupponiamo che un po' ma non troppo le piaccia l'ingrediente universale
                    - secondChar_goodGifts has object or object == universalIngredient:
                        <i>{~{translator(secondChar_ActualName)} prova ad assaggiare il dono, divertito.|Sulle guance di {translator(secondChar_ActualName)} compare un grande sorriso.|{translator(secondChar_ActualName)} saltella.}#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                        ~ secondChar_InkLevel ++
                    
                    - else:
                        <i>{~{translator(secondChar_ActualName)} insegue una lucertola con lo sguardo.|{translator(secondChar_ActualName)} lascia scivolare il dono a terra.}#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                }
            
            ~ gift_currentReceiver = ()
            -> second_story_gift.ink_outcome    
        
        }    

    - else: 
        ERRORE: valore di PNG non supportato {PNG}.


}

->->
