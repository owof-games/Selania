=== grimoire_second_character_conversation
    @grimoireText #style:character #icon:{translator(secondChar_ActualName)} #title:{translator(secondChar_ActualName)} #description:{grimoire_characterDescription(SecondCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    //Main story
    {
        - grimoire_secondChar has grimSecondCharOne:

    }

    {
        - grimoire_secondChar has grimSecondCharTwo:

    }

    {
        - grimoire_secondChar has grimSecondCharThreeHim:


        - grimoire_secondChar has grimSecondCharThreeHer:


        - grimoire_secondChar has grimSecondCharThreeThey:

    }

    {
        - grimoire_secondChar has grimSecondCharFour:

    } 

    {
        - grimoire_secondChar has grimSecondCharFive:

    } 

    {
        - grimoire_secondChar has grimSecondCharSix:

    }

    {
        - grimoire_secondChar has grimSecondCharSeven:
 .
    } 

    {
        - grimoire_secondChar has grimSecondCharEight:

    }

    {
        - grimoire_secondChar has grimSecondCharNine:
 
    }

    {
        - grimoire_secondChar has grimSecondCharTen:

    }

    {
        - grimoire_secondChar has grimSecondCharEleven:

    }
    
    {
        - grimoire_secondChar has grimSecondCharTwelve:

    }
    
    //Storylets speciali
    {
        - grimoire_secondChar has grimSecondCharNovel:
.
    }

    {
        - grimoire_secondChar has grimSecondCharFranco:

    }

    {
        - grimoire_secondChar has grimSecondOpenLibrary:

    }

    {
        - grimoire_secondChar has grimSecondCharKitchenAlone:


    }

    //Storylets condivisi DA INSERIRE


    
    + [Index #bookmark:index]
        -> grimoire
    + [{translator(secondChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_secondCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_second_character_conversation
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_second_character_conversation

->->



=== grimoire_second_character_present
@grimoireText #style:character #icon:{translator(secondChar_ActualName)} #title:{translator(secondChar_ActualName)} #description:{grimoire_characterDescription(SecondCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)


    {
        - frog_second_char_gift != "":
            Franco ha consigliato a {player_name} di regalare a {charNameTwo} <b>{ingredientTranslator(frog_second_char_gift)}</b>.

    }


    {
        - secondChar_favouritesGifts has secondChar_giftedObject:
            {player_name} le ha donato <b><i>{ingredientTranslator(secondChar_giftedObject)}</b></i> ed era entusiasta!
        
        - secondChar_goodGifts has secondChar_giftedObject:
            {player_name} le ha donato <b><i>{ingredientTranslator(secondChar_giftedObject)}</b></i> ed ha abbastanza apprezzato.
        
        - else:
            {player_name} le ha donato <b><i>{ingredientTranslator(secondChar_giftedObject)}</b></i> e non ha apprezzato per nulla.
    
    }
        

    + [Index #bookmark:index]
        -> grimoire
    + [{translator(secondChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_secondCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_second_character_present
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_second_character_present
->->


=== grimoire_second_character_kitchen
@grimoireText #style:character #icon:{translator(secondChar_ActualName)} #title:{translator(secondChar_ActualName)} #description:{grimoire_characterDescription(SecondCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    //INSERIRE LOGICA RICETTA


    //Recap cose dette
    {
        - grimoire_secondChar has grimSecondCharKitchenOne:
 
    }
    {
        - grimoire_secondChar has grimSecondCharKitchenTwo:
  
    }
    {
        - grimoire_secondChar has grimSecondCharKitchenThree:

    }

    //Feedback ingrediente extra
    {
        - kitchen_secondCharExtraIngredient == universalIngredient:
            AGGIUNGI RICORDO IMPORTANTE.

    }
    {
        - secondChar_favouritesGifts has kitchen_secondCharExtraIngredient:

   
        - secondChar_goodGifts has kitchen_secondCharExtraIngredient:


        - kitchen_secondCharExtraIngredient != ():

        
        - else:
            Cucinando con {charNameThree}, {player_name} ha deciso di non aggiungere alcun ingrediente aggiuntivo.

    }

    //Recap commento a tavola
    {
        - grimoire_secondChar has grimSecondCharKitchenPositiveReaction:
            Dopo aver cucinato assieme, {charNameTwo} ha detto a {player_name} che.

        - grimoire_secondChar has grimSecondCharKitchenNegativeReaction:
            Dopo aver cucinato assieme, {charNameTwo} ha detto a {player_name} che.

        - grimoire_secondChar has grimSecondCharKitchenNeutralReaction:
            Dopo aver cucinato assieme, {charNameThree} ha detto a {player_name} che.

    }
    

    + [Index #bookmark:index]
        -> grimoire
    + [{translator(secondChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_secondCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_second_character_kitchen
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_second_character_kitchen
->->




=== grimoire_second_character_rewrite
@grimoireText #style:character #icon:{translator(secondChar_ActualName)} #title:{translator(secondChar_ActualName)} #description:{grimoire_characterDescription(SecondCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {
        - grimoire_secondChar has grimSecondCharProposal:
            Prima della riscrittura, {charNameTwo} ha detto a {player_name} di.
    } 
    {
        - secondAffinityFeedback:
            Il valore di inchiostro che {player_name} ha raggiunto con {charNameThree} prima della riscrittura è stato: <b>{fromInkToNumbers(SecondCharacter)}</b>.<>
    }

    {
        - grimoire_secondChar has grimSecondCharNewName:
            Dopo la riscrittura, ha scelto un nuovo nome: <b><i>{translator(secondChar_ActualName)}.</b></i>
    }
    {
        - secondChar_ActualName has Triangolo:
            
        
        - secondChar_ActualName has RagazzaOrchestra:
.
                
        - secondChar_ActualName has FlautoDolce:

    
        - secondChar_ActualName has Ocarina:
    

        - secondChar_ActualName has Violino:

    }

    {
        - grimoire_secondChar has grimSecondCharMentorFeedback:
            {mentorName} ha detto a {player_name} che <>

            {
                - secondChar_ActualName has Triangolo:
                    
                - secondChar_ActualName has RagazzaOrchestra:

                - secondChar_ActualName has FlautoDolce: 
                                
                - secondChar_ActualName has Ocarina:

                - secondChar_ActualName has Violino:
            
            }
    }


    + [Index #bookmark:index]
        -> grimoire
    + [{translator(secondChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_secondCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_second_character_rewrite
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_second_character_rewrite
->->


=== grimoire_second_character_letters
@grimoireText #style:character #icon:{translator(secondChar_ActualName)} #title:{translator(secondChar_ActualName)} #description:{grimoire_characterDescription(SecondCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {
        - grimoire_secondChar has grimSecondCharLetterOne:
            -> letters_secondCharLetters.one ->
    }
    
    {
        - grimoire_secondChar has grimSecondCharLetterTwo:
            -> letters_secondCharLetters.two ->
    }

    {
        - grimoire_secondChar has grimSecondCharLetterThree:
            -> letters_secondCharLetters.three ->
    }

    {
        - grimoire_secondChar has grimSecondCharLetterFour:
            -> letters_secondCharLetters.four ->
    }
    

    + [Index #bookmark:index]
        -> grimoire
    + [{translator(secondChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_secondCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_second_character_letters
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_second_character_letters
->->