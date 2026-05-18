=== grimoire_third_character_conversation
    @grimoireText #style:character #icon:{translator(thirdChar_ActualName)} #title:{translator(thirdChar_ActualName)} #description:{grimoire_characterDescription(ThirdCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    //Main story
    {
        - grimoire_thirdChar has grimThirdCharOne:

    }

    {
        - grimoire_thirdChar has grimThirdCharTwo:

    }

    {
        - grimoire_thirdChar has grimThirdCharThree:

    }

    {
        - grimoire_thirdChar has grimThirdCharFour:

    } 

    {
        - grimoire_thirdChar has grimThirdCharFive:

    } 

    {
        - grimoire_thirdChar has grimThirdCharSix:

    }

    
    //Storylets speciali
    {
        - grimoire_thirdChar has grimThirdCharNovel:

    }

    {
        - grimoire_thirdChar has grimThirdCharFranco:

    }

    {
        - grimoire_thirdChar has grimThirdOpenNest:

    }

    {
        - grimoire_thirdChar has grimThirdCharKitchenAlone:


    }

    //Storylets condivisi DA INSERIRE


    
    + [Index #bookmark:index]
        -> grimoire
    + [{translator(thirdChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_thirdCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_third_character_conversation
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_third_character_conversation

->->



=== grimoire_third_character_present
@grimoireText #style:character #icon:{translator(thirdChar_ActualName)} #title:{translator(thirdChar_ActualName)} #description:{grimoire_characterDescription(ThirdCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)



    {
        - frog_third_char_gift != "":
            Franco ha consigliato a {player_name} di regalare a {charNameThree} <b>{ingredientTranslator(frog_third_char_gift)}</b>.

    }


    {
        - thirdChar_favouritesGifts has thirdChar_giftedObject:
            {player_name} le ha donato <b><i>{ingredientTranslator(thirdChar_giftedObject)}</b></i> ed era entusiasta!
        
        - thirdChar_goodGifts has thirdChar_giftedObject:
            {player_name} le ha donato <b><i>{ingredientTranslator(thirdChar_giftedObject)}</b></i> ed ha abbastanza apprezzato.
        
        - else:
            {player_name} le ha donato <b><i>{ingredientTranslator(thirdChar_giftedObject)}</b></i> e non ha apprezzato per nulla.
    
    }
        

    + [Index #bookmark:index]
        -> grimoire
    + [{translator(thirdChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_thirdCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_third_character_present
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_third_character_present
->->


=== grimoire_third_character_kitchen
@grimoireText #style:character #icon:{translator(thirdChar_ActualName)} #title:{translator(thirdChar_ActualName)} #description:{grimoire_characterDescription(ThirdCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    <b>{kitchen_thirdCharRecipe}.</b>
    <i>Ranacronaca a cura di Franco Lo Chef.</i>

    {kitchen_thirdCharRecipeNoun}: l'elemento centrale di questa ricetta. La preparazione richiede una buona dose di manualità, cosa non facile per {charNameOne}, che ha solo delle vibrisse. Il piatto tradizionalmente prevede anche l'aggiunta di olio invernale, ma {player_name} ha optato per della {kitchen_thirdCharRecipeAdjective}, rompendo gli schemi e il cuore di zio Gracco. Nel mentre {charNameOne} ha rovesciato una prima bottiglia di vino, cosa non prevista dalla ricetta, per poi riempirla con delle spighe raccolte dalla palude, cosa non prevista dai pesci della palude. Quando ormai il piatto ha iniziato ad addensarsi, il duo ha deciso di rafforzarne il sapore aggiungendo {kitchen_thirdCharRecipeComplement}, cosa che i più definirebbero coraggiosa, ma non {player_name}, che ha avuto la capacità di seguire la conversazione con {charNameOne}, e anche di preparare un piatto irripetibile (Tullio dice che è importante che sia irripetibile o a qualcuno viene il mal di pancia). <>
    {
        - kitchen_thirdCharExtraIngredient != ():
            Con classe e anche con palestra e presidenza, {player_name} ha infine aggiunto {ingredientTranslator(kitchen_thirdCharExtraIngredient)}, perché al girino piace rischiare. <>

        - else:
            Con austerità (che è una cosa che mi ha insegnato Euforbio e ha a che fare con l'Australia) {player_name} ha deciso di non aggiungere altro. <>
    }
    Entrambi i girini sono vivi, e consideriamo questa cosa un vero e proprio successo.


    //Recap cose dette
    {
        - grimoire_thirdChar has grimThirdCharKitchenOne:
 
    }
    {
        - grimoire_thirdChar has grimThirdCharKitchenTwo:
  
    }
    {
        - grimoire_thirdChar has grimThirdCharKitchenThree:

    }

    //Feedback ingrediente extra
    {
        - kitchen_thirdCharExtraIngredient == universalIngredient:
            AGGIUNGI RICORDO IMPORTANTE.

        - thirdChar_favouritesGifts has kitchen_thirdCharExtraIngredient:

   
        - thirdChar_goodGifts has kitchen_thirdCharExtraIngredient:


        - kitchen_thirdCharExtraIngredient != ():

        
        - else:
            Cucinando con {charNameThree}, {player_name} ha deciso di non aggiungere alcun ingrediente aggiuntivo.

    }

    //Recap commento a tavola
    {
        - grimoire_thirdChar has grimThirdCharKitchenPositiveReaction:
            Dopo aver cucinato assieme, {charNameThree} ha detto a {player_name} che.

        - grimoire_thirdChar has grimThirdCharKitchenNegativeReaction:
            Dopo aver cucinato assieme, {charNameThree} ha detto a {player_name} che.

        - grimoire_thirdChar has grimThirdCharKitchenNeutralReaction:
            Dopo aver cucinato assieme, {charNameThree} ha detto a {player_name} che.

    }
    

    + [Index #bookmark:index]
        -> grimoire
    + [{translator(thirdChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_thirdCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_third_character_kitchen
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_third_character_kitchen
->->




=== grimoire_third_character_rewrite
@grimoireText #style:character #icon:{translator(thirdChar_ActualName)} #title:{translator(thirdChar_ActualName)} #description:{grimoire_characterDescription(ThirdCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    {
        - grimoire_thirdChar has grimThirdCharProposal:
            Prima della riscrittura, {charNameThree} ha detto a {player_name} di.
    } 
    {
        - thirdAffinityFeedback:
            Il valore di inchiostro che {player_name} ha raggiunto con {charNameThree} prima della riscrittura è stato: <b>{fromInkToNumbers(ThirdCharacter)}</b>.<>
    }

    {
        - grimoire_thirdChar has grimThirdCharNewName:
            Dopo la riscrittura, ha scelto un nuovo nome: <b><i>{translator(thirdChar_ActualName)}.</b></i>
    }
    {
        - thirdChar_ActualName has Triangolo:
            
        
        - thirdChar_ActualName has Orchestra:
.
                
        - thirdChar_ActualName has FlautoDolce:

    
        - thirdChar_ActualName has Ocarina:
    

        - thirdChar_ActualName has Violino:

    }

    {
        - grimoire_thirdChar has grimThirdCharMentorFeedback:
            {charNameFive} ha detto a {player_name} che <>

            {
                - thirdChar_ActualName has Triangolo:
                    
                - thirdChar_ActualName has Orchestra:

                - thirdChar_ActualName has FlautoDolce: 
                                
                - thirdChar_ActualName has Ocarina:

                - thirdChar_ActualName has Violino:
            
            }
    }


    + [Index #bookmark:index]
        -> grimoire
    + [{translator(thirdChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_thirdCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_third_character_rewrite
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_third_character_rewrite
->->


=== grimoire_third_character_letters
@grimoireText #style:character #icon:{translator(thirdChar_ActualName)} #title:{translator(thirdChar_ActualName)} #description:{grimoire_characterDescription(ThirdCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    NOTA: a seconda che la sua sia la prima o seconda lettera, ricordarsi di mettere qui un commento alla parte di "rivalutazione del rapporto" (ovvero quando si passa dal valore relazione dal vivo a quello a remoto) perché se lo lascio nella lettera verrà riconteggiato ogni volta e non ha senso.

    {
        - grimoire_thirdChar has grimThirdCharLetterOne:
            <b>Prima lettera</b>
            Saluto. <>
                ~ letters_thirdCharLetters_one()
    }
    
    {
        - grimoire_thirdChar has grimThirdCharLetterTwo:
            <b>Seconda lettera</b>
            Saluto. <>
                ~ letters_thirdCharLetters_two()
    }

    {
        - grimoire_thirdChar has grimThirdCharLetterThree:
            <b>Terza lettera</b>
            Saluto. <>
                ~ letters_thirdCharLetters_three()
    }

    {
        - grimoire_thirdChar has grimThirdCharLetterFour:
            <b>Quarta lettera</b>
            Saluto. <>
                ~ letters_thirdCharLetters_four()
    }

    {
        - grimoire_thirdChar has grimThirdCharLetterFive:
            <b>Quinta lettera</b>
            Saluto. <>
                ~ letters_thirdCharLetters_five()
    }

    {
        - grimoire_thirdChar has grimThirdCharLetterSix:
            <b>Sesta lettera</b>
            Saluto. <>
                ~ letters_thirdCharLetters_six()
    }

    {
        - grimoire_thirdChar has grimThirdCharLetterSeven:
            <b>Settima lettera</b>
            Saluto. <>
                ~ letters_thirdCharLetters_seven()
    }
    

    + [Index #bookmark:index]
        -> grimoire
    + [{translator(thirdChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_thirdCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_third_character_letters
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_third_character_letters
->->