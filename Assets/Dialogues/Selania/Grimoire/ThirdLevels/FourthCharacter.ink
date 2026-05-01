=== grimoire_fourth_character_conversation
    @grimoireText #style:character #icon:{translator(fourthChar_ActualName)} #title:{translator(fourthChar_ActualName)} #description:{grimoire_characterDescription(FourthCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    //Main story
    {
        - grimoire_fourthChar has grimFourthCharOne:

    }

    {
        - grimoire_fourthChar has grimFourthCharTwo:

    }

    {
        - grimoire_fourthChar has grimFourthCharThree:

    }

    {
        - grimoire_fourthChar has grimFourthCharFour:

    } 

    {
        - grimoire_fourthChar has grimFourthCharFive:

    } 

    {
        - grimoire_fourthChar has grimFourthCharSix:

    }

    {
        - grimoire_fourthChar has grimFourthCharSeven:
 
    } 

    {
        - grimoire_fourthChar has grimFourthCharEight:

    }

    {
        - grimoire_fourthChar has grimFourthCharNine:
 
    }

    {
        - grimoire_fourthChar has grimFourthCharTen:

    }

    {
        - grimoire_fourthChar has grimFourthCharEleven:

    }
    
    {
        - grimoire_fourthChar has grimFourthCharTwelve:

    }
    
    //Storylets speciali
    {
        - grimoire_fourthChar has grimFourthCharNovel:

    }

    {
        - grimoire_fourthChar has grimFourthCharFranco:

    }

    // {
    //     - grimoire_fourthChar has grimFourthOpenNest:

    // }

    {
        - grimoire_fourthChar has grimFourthCharKitchenAlone:


    }

    //Storylets condivisi DA INSERIRE


    
    + [Index #bookmark:index]
        -> grimoire
    + [{translator(fourthChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_fourthCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_fourth_character_conversation
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_fourth_character_conversation

->->



=== grimoire_fourth_character_present
@grimoireText #style:character #icon:{translator(fourthChar_ActualName)} #title:{translator(fourthChar_ActualName)} #description:{grimoire_characterDescription(FourthCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)



    // {
    //     - frog_fourth_char_gift != "":
    //         Franco ha consigliato a {player_name} di regalare a {charNameThree} <b>{ingredientTranslator(frog_fourth_char_gift)}</b>.

    // }


    {
        - fourthChar_favouritesGifts has fourthChar_giftedObject:
            {player_name} le ha donato <b><i>{ingredientTranslator(fourthChar_giftedObject)}</b></i> ed era entusiasta!
        
        - fourthChar_goodGifts has fourthChar_giftedObject:
            {player_name} le ha donato <b><i>{ingredientTranslator(fourthChar_giftedObject)}</b></i> ed ha abbastanza apprezzato.
        
        - else:
            {player_name} le ha donato <b><i>{ingredientTranslator(fourthChar_giftedObject)}</b></i> e non ha apprezzato per nulla.
    
    }
        

    + [Index #bookmark:index]
        -> grimoire
    + [{translator(fourthChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_fourthCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_fourth_character_present
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_fourth_character_present
->->


=== grimoire_fourth_character_kitchen
@grimoireText #style:character #icon:{translator(fourthChar_ActualName)} #title:{translator(fourthChar_ActualName)} #description:{grimoire_characterDescription(FourthCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    <b>{kitchen_fourthCharRecipe}</b>
    Ranacronaca a cura di Franco Lo Chef.

    {kitchen_fourthCharRecipeNoun}: l'elemento centrale di questa ricetta. La preparazione richiede una buona dose di manualità, cosa non facile per {charNameOne}, che ha solo delle vibrisse. Il piatto tradizionalmente prevede anche l'aggiunta di olio invernale, ma {player_name} ha optato per della {kitchen_fourthCharRecipeAdjective}, rompendo gli schemi e il cuore di zio Gracco. Nel mentre {charNameOne} ha rovesciato una prima bottiglia di vino, cosa non prevista dalla ricetta, per poi riempirla con delle spighe raccolte dalla palude, cosa non prevista dai pesci della palude. Quando ormai il piatto ha iniziato ad addensarsi, il duo ha deciso di rafforzarne il sapore aggiungendo {kitchen_fourthCharRecipeComplement}, cosa che i più definirebbero coraggiosa, ma non {player_name}, che ha avuto la capacità di seguire la conversazione con {charNameOne}, e anche di preparare un piatto irripetibile (Tullio dice che è importante che sia irripetibile o a qualcuno viene il mal di pancia). <>
    {
        - kitchen_fourthCharExtraIngredient != ():
            Con classe e anche con palestra e presidenza, {player_name} ha infine aggiunto {ingredientTranslator(kitchen_fourthCharExtraIngredient)}, perché al girino piace rischiare. <>

        - else:
            Con austerità (che è una cosa che mi ha insegnato Euforbio e ha a che fare con l'Australia) {player_name} ha deciso di non aggiungere altro. <>
    }
    Entrambi i girini sono vivi, e consideriamo questa cosa un vero e proprio successo.


    //Recap cose dette
    {
        - grimoire_fourthChar has grimFourthCharKitchenOne:
 
    }
    {
        - grimoire_fourthChar has grimFourthCharKitchenTwo:
  
    }
    {
        - grimoire_fourthChar has grimFourthCharKitchenThree:

    }

    //Feedback ingrediente extra
    {
        - kitchen_fourthCharExtraIngredient == universalIngredient:
            AGGIUNGI RICORDO IMPORTANTE.

        - fourthChar_favouritesGifts has kitchen_fourthCharExtraIngredient:

   
        - fourthChar_goodGifts has kitchen_fourthCharExtraIngredient:


        - kitchen_fourthCharExtraIngredient != ():

        
        - else:
            Cucinando con {charNameFour}, {player_name} ha deciso di non aggiungere alcun ingrediente aggiuntivo.

    }

    //Recap commento a tavola
    {
        - grimoire_fourthChar has grimFourthCharKitchenPositiveReaction:
            Dopo aver cucinato assieme, {charNameFour} ha detto a {player_name} che.

        - grimoire_fourthChar has grimFourthCharKitchenNegativeReaction:
            Dopo aver cucinato assieme, {charNameFour} ha detto a {player_name} che.

        - grimoire_fourthChar has grimFourthCharKitchenNeutralReaction:
            Dopo aver cucinato assieme, {charNameFour} ha detto a {player_name} che.

    }
    

    + [Index #bookmark:index]
        -> grimoire
    + [{translator(fourthChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_fourthCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_fourth_character_kitchen
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_fourth_character_kitchen
->->




=== grimoire_fourth_character_rewrite
@grimoireText #style:character #icon:{translator(fourthChar_ActualName)} #title:{translator(fourthChar_ActualName)} #description:{grimoire_characterDescription(FourthCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    {
        - grimoire_fourthChar has grimFourthCharProposal:
            Prima della riscrittura, {charNameFour} ha detto a {player_name} di.
    } 

    // {
    //     - fourthAffinityFeedback:
    //         Il valore di inchiostro che {player_name} ha raggiunto con {charNameFour} prima della riscrittura è stato: <b>{fromInkToNumbers(FourthCharacter)}</b>.<>
    // }

    {
        - grimoire_fourthChar has grimFourthCharNewName:
            Dopo la riscrittura, ha scelto un nuovo nome: <b><i>{translator(fourthChar_ActualName)}.</b></i>
    }
    {
        - fourthChar_ActualName has Triangolo:
            
        
        - fourthChar_ActualName has Orchestra:
.
                
        - fourthChar_ActualName has FlautoDolce:

    
        - fourthChar_ActualName has Ocarina:
    

        - fourthChar_ActualName has Violino:

    }

    {
        - grimoire_fourthChar has grimFourthCharMentorFeedback:
            {charNameFive} ha detto a {player_name} che <>

            {
                - fourthChar_ActualName has Triangolo:
                    
                - fourthChar_ActualName has Orchestra:

                - fourthChar_ActualName has FlautoDolce: 
                                
                - fourthChar_ActualName has Ocarina:

                - fourthChar_ActualName has Violino:
            
            }
    }


    + [Index #bookmark:index]
        -> grimoire
    + [{translator(fourthChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_fourthCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_fourth_character_rewrite
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_fourth_character_rewrite
->->


=== grimoire_fourth_character_letters
@grimoireText #style:character #icon:{translator(fourthChar_ActualName)} #title:{translator(fourthChar_ActualName)} #description:{grimoire_characterDescription(FourthCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    {
        - grimoire_fourthChar has grimFourthCharLetterOne:
            ~ letters_fourthCharLetters_one()
    }
    
    {
        - grimoire_fourthChar has grimFourthCharLetterTwo:
            ~ letters_fourthCharLetters_two()
    }

    {
        - grimoire_fourthChar has grimFourthCharLetterThree:
            ~ letters_fourthCharLetters_three()
    }

    {
        - grimoire_fourthChar has grimFourthCharLetterFour:
            ~ letters_fourthCharLetters_four()
    }
    

    + [Index #bookmark:index]
        -> grimoire
    + [{translator(fourthChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_fourthCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_fourth_character_letters
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_fourth_character_letters
->->