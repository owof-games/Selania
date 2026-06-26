=== grimoire_firstCharacter
@grimoireCharacter #character:FirstCharacter #characterName:{grimoire_characterName(FirstCharacter)} #characterDescription:{grimoire_characterDescription(FirstCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    {
        - frog_first_char_object_gift != () && firstChar_giftedObject == ():
            Regalale <b>{ingredientTranslator(frog_first_char_object_gift)}</b>.

        - firstChar_giftedObject != ():
            Le hai regalato <b>{ingredientTranslator(firstChar_giftedObject)}</b>.
    }
    
    {
        - frog_first_char_object_ingredient != () && kitchen_firstCharExtraIngredient == ():
            In cucina aggiungi <b>{ingredientTranslator(frog_first_char_object_ingredient)}</b>.

        - kitchen_firstCharExtraIngredient != ():
            In cucina hai aggiunto <b>{ingredientTranslator(kitchen_firstCharExtraIngredient)}</b>.    
    }
    
    {
        - frog_first_novel != "" && grimoire_firstChar hasnt grimFirstCharNovel:
            Il suo racconto preferito è {frog_first_novel}.

        -  grimoire_firstChar has grimFirstCharNovel:
            Il suo racconto preferito è <b>Luna vergine</b> di Aza.
    }
    


    + {grimoire_firstChar != ()}[Conversation]
            -> grimoire_first_character_conversation

    + {firstChar_giftedObject != ()}[Present]
            -> grimoire_first_character_present

    + {grimoire_firstChar has grimFirstCharKitchenEnded}[Kitchen]
            -> grimoire_first_character_kitchen

    + {grimoire_firstChar has grimFirstCharProposal}[Rewrite]
            -> grimoire_first_character_rewrite

    + {grimoire_firstChar has grimFirstCharLetterOne}[Letters]
            -> grimoire_first_character_letters    
            
    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_firstCharacter


=== grimoire_secondCharacter
@grimoireCharacter #character:SecondCharacter #characterName:{grimoire_characterName(SecondCharacter)} #characterDescription:{grimoire_characterDescription(SecondCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    {
        - frog_second_char_object_gift != () && secondChar_giftedObject == ():
            Regalagli <b>{ingredientTranslator(frog_second_char_object_gift)}</b>.

        - secondChar_giftedObject != ():
            Gli hai regalato <b>{ingredientTranslator(secondChar_giftedObject)}</b>.
    }
    
    {
        - frog_second_char_object_ingredient != () && kitchen_secondCharExtraIngredient == ():
            In cucina aggiungi <b>{ingredientTranslator(frog_second_char_object_ingredient)}</b>.

        - kitchen_secondCharExtraIngredient != ():
            In cucina hai aggiunto <b>{ingredientTranslator(kitchen_secondCharExtraIngredient)}</b>.    
    }
    
    {
        - frog_second_novel != "" && grimoire_secondChar hasnt grimSecondCharNovel:
            Il suo racconto preferito è {frog_second_novel}.

        -  grimoire_secondChar has grimSecondCharNovel:
            Il suo racconto preferito è <b>Il sassolino</b> di Lamia
    }
    


    + {grimoire_secondChar != ()}[Conversation]
            -> grimoire_second_character_conversation

    + {secondChar_giftedObject != ()}[Present]
            -> grimoire_second_character_present

    + {grimoire_secondChar has grimSecondCharKitchenEnded}[Kitchen]
            -> grimoire_second_character_kitchen

    + {grimoire_secondChar has grimSecondCharProposal}[Rewrite]
            -> grimoire_second_character_rewrite

    + {grimoire_secondChar has grimSecondCharLetterOne}[Letters]
            -> grimoire_second_character_letters    
            
    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_secondCharacter



=== grimoire_thirdCharacter
@grimoireCharacter #character:ThirdCharacter #characterName:{grimoire_characterName(ThirdCharacter)} #characterDescription:{grimoire_characterDescription(ThirdCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    {
        - frog_third_char_object_gift != () && thirdChar_giftedObject == ():
            Regalagli <b>{ingredientTranslator(frog_third_char_object_gift)}</b>.

        - thirdChar_giftedObject != ():
            Gli hai regalato <b>{ingredientTranslator(thirdChar_giftedObject)}</b>.
    }
    
    {
        - frog_third_char_object_ingredient != () && kitchen_thirdCharExtraIngredient == ():
            In cucina aggiungi <b>{ingredientTranslator(frog_third_char_object_ingredient)}</b>.

        - kitchen_thirdCharExtraIngredient != ():
            In cucina hai aggiunto <b>{ingredientTranslator(kitchen_thirdCharExtraIngredient)}</b>.    
    }
    
    {
        - frog_third_novel != "" && grimoire_thirdChar hasnt grimThirdCharNovel:
            Il suo racconto preferito è {frog_third_novel}.

        -  grimoire_thirdChar has grimThirdCharNovel:
            Il suo racconto preferito è <b>Polvere</b> di Maura.
    }
    


    + {grimoire_thirdChar != ()}[Conversation]
            -> grimoire_third_character_conversation

    + {thirdChar_giftedObject != ()}[Present]
            -> grimoire_third_character_present

    + {grimoire_thirdChar has grimThirdCharKitchenEnded}[Kitchen]
            -> grimoire_third_character_kitchen

    + {grimoire_thirdChar has grimThirdCharFirstProposal}[Rewrite]
            -> grimoire_third_character_rewrite

    + {grimoire_thirdChar has grimThirdCharLetterOne}[Letters]
            -> grimoire_third_character_letters    
            
    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_thirdCharacter


=== grimoire_fourthCharacter
@grimoireCharacter #character:FourthCharacter #characterName:{grimoire_characterName(FourthCharacter)} #characterDescription:{grimoire_characterDescription(FourthCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    {
        - frog_fourth_char_object_gift != () && fourthChar_giftedObject == ():
            Regalagli <b>{ingredientTranslator(frog_fourth_char_object_gift)}</b>.

        - fourthChar_giftedObject != ():
            Gli hai regalato <b>{ingredientTranslator(fourthChar_giftedObject)}</b>.
    }
    
    {
        - frog_fourth_char_object_ingredient != () && kitchen_fourthCharExtraIngredient == ():
            In cucina aggiungi <b>{ingredientTranslator(frog_fourth_char_object_ingredient)}</b>.

        - kitchen_fourthCharExtraIngredient != ():
            In cucina hai aggiunto <b>{ingredientTranslator(kitchen_fourthCharExtraIngredient)}</b>.    
    }
    
    {
        - frog_fourth_novel != "" && grimoire_fourthChar hasnt grimFourthCharNovel:
            Il suo racconto preferito è {frog_fourth_novel}.

        -  grimoire_fourthChar has grimFourthCharNovel:
            Il suo racconto preferito è <b>Polvere</b> di Maura.
    }
    


    + {grimoire_fourthChar != ()}[Conversation]
            -> grimoire_fourth_character_conversation

    + {fourthChar_giftedObject != ()}[Present]
            -> grimoire_fourth_character_present

    + {grimoire_fourthChar has grimFourthCharKitchenEnded}[Kitchen]
            -> grimoire_fourth_character_kitchen

    + {grimoire_fourthChar has grimFourthCharProposal}[Rewrite]
            -> grimoire_fourth_character_rewrite

    + {grimoire_fourthChar has grimFourthCharLetterOne}[Letters]
            -> grimoire_fourth_character_letters    
            
    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_fourthCharacter



=== grimoire_fifthCharacter
@grimoireCharacter #character:FifthCharacter #characterName:{grimoire_characterName(FifthCharacter)} #characterDescription:{grimoire_characterDescription(FifthCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    {
        - frog_fifth_char_object_gift != () && fifthChar_giftedObject == ():
            Regalagli <b>{ingredientTranslator(frog_fifth_char_object_gift)}</b>.

        - fifthChar_giftedObject != ():
            Gli hai regalato <b>{ingredientTranslator(fifthChar_giftedObject)}</b>.
    }
    
    {
        - frog_fifth_char_object_ingredient != () && kitchen_fifthCharExtraIngredient == ():
            In cucina aggiungi <b>{ingredientTranslator(frog_fifth_char_object_ingredient)}</b>.

        - kitchen_fifthCharExtraIngredient != ():
            In cucina hai aggiunto <b>{ingredientTranslator(kitchen_fifthCharExtraIngredient)}</b>.    
    }
    
    {
        - frog_fifth_novel != "" && grimoire_fifthChar hasnt grimFifthCharNovel:
            Il suo racconto preferito è {frog_fifth_novel}.

        -  grimoire_fifthChar has grimFifthCharNovel:
            Il suo racconto preferito è <b>Polvere</b> di Maura.
    }
    

    + {grimoire_fifthChar != ()}[Conversation]
            -> grimoire_fifth_character_conversation

    + {fifthChar_giftedObject != ()}[Present]
            -> grimoire_fifth_character_present

    + {grimoire_fifthChar has grimFifthCharKitchenEnded}[Kitchen]
            -> grimoire_fifth_character_kitchen

    + {grimoire_fifthChar has grimFifthCharProposal}[Rewrite]
            -> grimoire_fifth_character_rewrite

    + {grimoire_fifthChar has grimFifthCharLetterOne}[Letters]
            -> grimoire_fifth_character_letters    
            
    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_fifthCharacter

