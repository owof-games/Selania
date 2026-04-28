=== grimoire_fifth_character_conversation
    @grimoireText #style:character #icon:{translator(fifthChar_ActualName)} #title:{translator(fifthChar_ActualName)} #description:{grimoire_characterDescription(FifthCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    //Main story come Mentore
    {
        - grimoire_fifthChar has grimMentorOne:
            Blah blah blah

    }

    {
        - grimoire_fifthChar has grimMentorTwo:

    }

    {
        - grimoire_fifthChar has grimMentorThree:

    }

    {
        - grimoire_fifthChar has grimMentorFour:

    } 

    {
        - grimoire_fifthChar has grimMentorFive:

    } 

    {
        - grimoire_fifthChar has grimMentorSix:

    }

    {
        - grimoire_fifthChar has grimMentorSeven:
 
    } 

    {
        - grimoire_fifthChar has grimMentorEight:

    }

    {
        - grimoire_fifthChar has grimMentorNine:
 
    }

    {
        - grimoire_fifthChar has grimMentorTen:

    }

    {
        - grimoire_fifthChar has grimMentorEleven:

    }
    
    {
        - grimoire_fifthChar has grimMentorTwelve:

    }

    //Storylets speciali come Mentor
    {
        - grimoire_fifthChar has grimMentorLiar:
 
    } 

    {
        - grimoire_fifthChar has grimMentorViolence:

    }

    {
        - grimoire_fifthChar has grimMentorOlobinoUno:
 
    }

    {
        - grimoire_fifthChar has grimMentorOlobinoDue:

    }

    {
        - grimoire_fifthChar has grimMentorRage:

    }

    //Secret endings delle personagge
    
    {
        - grimoire_fifthChar has grimMentorFirstSecretEnding:

    }

    {
        - grimoire_fifthChar has grimMentorSecondSecretEnding:

    }


    {
        - grimoire_fifthChar has grimMentorThirdSecretEnding:

    }


    {
        - grimoire_fifthChar has grimMentorFourthSecretEnding:

    }

    {
        - grimoire_fifthChar has grimMentorFifthSecretEnding:

    }


    //Main story come Mostro
    {
        - grimoire_fifthChar has grimFifthCharOne:
            Blah blah blah

    }

    {
        - grimoire_fifthChar has grimFifthCharTwo:

    }

    {
        - grimoire_fifthChar has grimFifthCharThree:

    }

    {
        - grimoire_fifthChar has grimFifthCharFour:

    } 

    {
        - grimoire_fifthChar has grimFifthCharFive:

    } 

    {
        - grimoire_fifthChar has grimFifthCharSix:

    }

    {
        - grimoire_fifthChar has grimFifthCharSeven:
 
    } 

    {
        - grimoire_fifthChar has grimFifthCharEight:

    }

    {
        - grimoire_fifthChar has grimFifthCharNine:
 
    }

    {
        - grimoire_fifthChar has grimFifthCharTen:

    }

    {
        - grimoire_fifthChar has grimFifthCharEleven:

    }
    
    {
        - grimoire_fifthChar has grimFifthCharTwelve:

    }
    
    //Storylets speciali
    {
        - grimoire_fifthChar has grimFifthCharNovel:

    }

    {
        - grimoire_fifthChar has grimFifthCharFranco:

    }

    // {
    //     - grimoire_fifthChar has grimFifthOpenNest:

    // }

    {
        - grimoire_fifthChar has grimFifthCharKitchenAlone:


    }

    //Storylets condivisi DA INSERIRE


    
    + [Index #bookmark:index]
        -> grimoire
    + {fifthChar_storyStatus != story_storyNotStarted}[{translator(fifthChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_fifthCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_fifth_character_conversation
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_fifth_character_conversation

->->



=== grimoire_fifth_character_present
@grimoireText #style:character #icon:{translator(fifthChar_ActualName)} #title:{translator(fifthChar_ActualName)} #description:{grimoire_characterDescription(FifthCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)


    // {
    //     - frog_fifth_char_gift != "":
    //         Franco ha consigliato a {player_name} di regalare a {charNameThree} <b>{ingredientTranslator(frog_fifth_char_gift)}</b>.

    // }


    {
        - fifthChar_favouritesGifts has fifthChar_giftedObject:
            {player_name} le ha donato <b><i>{ingredientTranslator(fifthChar_giftedObject)}</b></i> ed era entusiasta!
        
        - fifthChar_goodGifts has fifthChar_giftedObject:
            {player_name} le ha donato <b><i>{ingredientTranslator(fifthChar_giftedObject)}</b></i> ed ha abbastanza apprezzato.
        
        - else:
            {player_name} le ha donato <b><i>{ingredientTranslator(fifthChar_giftedObject)}</b></i> e non ha apprezzato per nulla.
    
    }
        

    + [Index #bookmark:index]
        -> grimoire
    + [{translator(fifthChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_fifthCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_fifth_character_present
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_fifth_character_present
->->


=== grimoire_fifth_character_kitchen
@grimoireText #style:character #icon:{translator(fifthChar_ActualName)} #title:{translator(fifthChar_ActualName)} #description:{grimoire_characterDescription(FifthCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    //INSERIRE LOGICA RICETTA


    //Recap cose dette
    {
        - grimoire_fifthChar has grimFifthCharKitchenOne:
 
    }
    {
        - grimoire_fifthChar has grimFifthCharKitchenTwo:
  
    }
    {
        - grimoire_fifthChar has grimFifthCharKitchenThree:

    }

    //Feedback ingrediente extra
    {
        - kitchen_fifthCharExtraIngredient == universalIngredient:
            AGGIUNGI RICORDO IMPORTANTE.

    }
    {
        - fifthChar_favouritesGifts has kitchen_fifthCharExtraIngredient:

   
        - fifthChar_goodGifts has kitchen_fifthCharExtraIngredient:


        - kitchen_fifthCharExtraIngredient != ():

        
        - else:
            Cucinando con {charNameFive}, {player_name} ha deciso di non aggiungere alcun ingrediente aggiuntivo.

    }

    //Recap commento a tavola
    {
        - grimoire_fifthChar has grimFifthCharKitchenPositiveReaction:
            Dopo aver cucinato assieme, {charNameFive} ha detto a {player_name} che.

        - grimoire_fifthChar has grimFifthCharKitchenNegativeReaction:
            Dopo aver cucinato assieme, {charNameFive} ha detto a {player_name} che.

        - grimoire_fifthChar has grimFifthCharKitchenNeutralReaction:
            Dopo aver cucinato assieme, {charNameFive} ha detto a {player_name} che.

    }
    

    + [Index #bookmark:index]
        -> grimoire
    + [{translator(fifthChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_fifthCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_fifth_character_kitchen
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_fifth_character_kitchen
->->




=== grimoire_fifth_character_rewrite
@grimoireText #style:character #icon:{translator(fifthChar_ActualName)} #title:{translator(fifthChar_ActualName)} #description:{grimoire_characterDescription(FifthCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {
        - grimoire_fifthChar has grimFifthCharProposal:
            Prima della riscrittura, {charNameFive} ha detto a {player_name} di.
    } 

    // {
    //     - fifthAffinityFeedback:
    //         Il valore di inchiostro che {player_name} ha raggiunto con {charNameFive} prima della riscrittura è stato: <b>{fromInkToNumbers(FifthCharacter)}</b>.<>
    // }

    {
        - grimoire_fifthChar has grimFifthCharNewName:
            Dopo la riscrittura, ha scelto un nuovo nome: <b><i>{translator(fifthChar_ActualName)}.</b></i>
    }
    {
        - fifthChar_ActualName has Triangolo:
            
        
        - fifthChar_ActualName has RagazzaOrchestra:
.
                
        - fifthChar_ActualName has FlautoDolce:

    
        - fifthChar_ActualName has Ocarina:
    

        - fifthChar_ActualName has Violino:

    }

    {
        - grimoire_fifthChar has grimFifthCharMentorFeedback:
            {mentorName} ha detto a {player_name} che <>

            {
                - fifthChar_ActualName has Triangolo:
                    
                - fifthChar_ActualName has RagazzaOrchestra:

                - fifthChar_ActualName has FlautoDolce: 
                                
                - fifthChar_ActualName has Ocarina:

                - fifthChar_ActualName has Violino:
            
            }
    }


    + [Index #bookmark:index]
        -> grimoire
    + [{translator(fifthChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_fifthCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_fifth_character_rewrite
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_fifth_character_rewrite
->->


=== grimoire_fifth_character_letters
@grimoireText #style:character #icon:{translator(fifthChar_ActualName)} #title:{translator(fifthChar_ActualName)} #description:{grimoire_characterDescription(FifthCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {
        - grimoire_fifthChar has grimFifthCharLetterOne:
            ~ letters_fifthCharLetters_first()
    }
    
    {
        - grimoire_fifthChar has grimFifthCharLetterTwo:
            ~ letters_fifthCharLetters_second()
    }

    {
        - grimoire_fifthChar has grimFifthCharLetterThree:
             ~ letters_fifthCharLetters_third()
    }

    {
        - grimoire_fifthChar has grimFifthCharLetterFour:
            ~ letters_fifthCharLetters_fourth()
    }
    

    + [Index #bookmark:index]
        -> grimoire
    + [{translator(fifthChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_fifthCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_fifth_character_letters
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_fifth_character_letters
->->