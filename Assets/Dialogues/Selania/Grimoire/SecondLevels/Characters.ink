=== grimoire_firstCharacter
@grimoireCharacter #character:FirstCharacter #characterName:{translator(firstChar_ActualName)} #characterDescription:{grimoire_characterDescription(FirstCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {
        - frog_first_char_gift != "" && firstChar_giftedObject == ():
            Regalale <b>{ingredientTranslator(frog_first_char_gift)}</b>.

        - firstChar_giftedObject != ():
            Le hai regalato <b>{ingredientTranslator(firstChar_giftedObject)}</b>.
    }
    
    {
        - frog_first_char_ingredient != "" && kitchen_firstCharExtraIngredient == ():
            In cucina aggiungi <b>{ingredientTranslator(frog_first_char_ingredient)}</b>.

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

    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_secondCharacter



=== grimoire_thirdCharacter

    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_thirdCharacter



=== grimoire_fourthCharacter

    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_fourthCharacter



=== grimoire_fifthCharacter

    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_fifthCharacter



=== grimoire_witchRecap

    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_witchRecap



=== grimoire_francoRecap

    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_francoRecap
