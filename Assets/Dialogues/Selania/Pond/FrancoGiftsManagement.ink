=== franco_giftsManagement ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    //Facciamo un passaggio di aggiornamento degli achievements subito dopo la chiusura di una missione
    -> achievements_onGame_statusUpdate_GM ->

    Bene girino, direi che è il momento che Franco ti dia una zampa!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    
    {
        - firstChar_storyStatus == story_storyStarted && frog_firstCharAchievableGifts != () && frog_firstCharGiftable == false:
            Ti dico che per ora non ho consigli utili su {charNameOne}, ma mi sto attivando per aiutarti, parola di Franco! 
    }

    {
        - secondChar_storyStatus == story_storyStarted && frog_secondCharAchievableGifts != () && frog_secondCharGiftable == false:
            Non ho dritte su {charNameTwo}, solo rovesci, ma se torni più avanti sono sicuro che qualcosa di nuovo te lo posso dare.
    }

    {
        - thirdChar_storyStatus == story_storyStarted && frog_thirdCharAchievableGifts != () && frog_thirdCharGiftable == false:
            Ci sono cose di {charNameThree} che per ora mi sono un mistero misterioso, ma se torni più tardi te le posso smisterare.
            O smistare?
    }

    - (top)
    Come vuoi che ti aiuti?

        + {frog_firstCharGiftable == true}{charNameOne}.
        + {frog_secondCharGiftable == true}{charNameTwo}.
        + {frog_thirdCharGiftable == true}{charNameThree}.
        + {frog_fourthCharGiftable == true}{charNameFour}.
        + {frog_fifthCharGiftable == true}{charNameFive}.

        + {frog_recoverableCultivables!= () && frog_recoveredCultivables == ()} Puoi aiutarmi a recuperare una pianta che ho già utilizzato?
            Certo che craack!
            Ma.
            Lo posso fare solo una volta.
                + + Ok, voglio usare ora questa occasione!
                    -> cultivable_recovery
                + + Mmm, ci ragiono su.
                    -> top
        + {glyph_usedSigils != ()} Puoi aiutarmi a recuperare un sigillo che ho già consumato?
            TODO: da creare gestione recupero sigilli. Potrebbe anche essere troppo incasinata come cosa.
        + Vorrei pensarci ancora un po'.
            Mi trovi qui girino.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            Voglio contare tutte le onde!
                ~ frog_suspended_gift = true
            -> main
        -
->->

=== franco_giftsFirstChar ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {
        - are_two_entities_together(FirstCharacter, PG):
            Se resto mi sembra di barare.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            Anche se non ha senso, visto che lo stai facendo tu, {player_name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
            ~ move_entity(FirstCharacter, Forest)
    }

    {shuffle once:
        - Uh, mi piace {charNameOne}, è sempre così gentile con me!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        - {charNameOne} ha una bella testolina.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            Piena di girini che corrono alla svelta.
        - {charNameOne} andrebbe molto d'accordo con Tullio.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            Anche lui è un artista.
        - Ottimamente! #inkD:offState #portrait:frog_neutral                                       
    }
    
    + {frog_firstCharAchievableGifts has cultivableGift} Cosa potrei regalarle?
        -> franco_giftsPlants(FirstCharacter)
    + {frog_firstCharAchievableGifts has ingredientGift && player_accessiblePlaces has Kitchen} Quale ingrediente potrei usare in cucina con lei?
        -> ingredient
    + {frog_firstCharAchievableGifts has bookGift && player_accessiblePlaces has Library} Di quale racconto vorrebbe parlare?
        -> book
    + Ora che ci penso, potresti aiutarmi in modo diverso?
        -> franco_giftsManagement.top


        = gift
            ~ temp charNameOne = translator(firstChar_ActualName)
            ~ temp charNameTwo = translator(secondChar_ActualName)
            ~ temp charNameThree = translator(thirdChar_ActualName)
            ~ temp charNameFour = translator(fourthChar_ActualName)
            ~ temp charNameFive = translator(fifthChar_ActualName)
            ~ temp mentorName = translator(mentor_ActualName)

        -> closed_exchange

        = ingredient
            ~ temp charNameOne = translator(firstChar_ActualName)
            ~ temp charNameTwo = translator(secondChar_ActualName)
            ~ temp charNameThree = translator(thirdChar_ActualName)
            ~ temp charNameFour = translator(fourthChar_ActualName)
            ~ temp charNameFive = translator(fifthChar_ActualName)
            ~ temp mentorName = translator(mentor_ActualName)

        -> closed_exchange 

        = book
            ~ temp charNameOne = translator(firstChar_ActualName)
            ~ temp charNameTwo = translator(secondChar_ActualName)
            ~ temp charNameThree = translator(thirdChar_ActualName)
            ~ temp charNameFour = translator(fourthChar_ActualName)
            ~ temp charNameFive = translator(fifthChar_ActualName)
            ~ temp mentorName = translator(mentor_ActualName)

        -> closed_exchange           


=== franco_giftsSecondChar ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {
        - are_two_entities_together(SecondCharacter, PG):
            Uh, Franco sa tantissime cose di me!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            Sicuro che ti aiuta be-nis-si-mo!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
            Ma io vado a fare qualcos'altro.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                ~ move_entity(SecondCharacter, Forest)
    }

    {shuffle once:
        - Mi piace {charNameTwo}! Mi ha insegnato tantissime cose!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        - Sì! Voglio chiedere a {charNameTwo} se facciamo lezioni di nuoto assieme!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        - {charNameTwo} mi sta tanto simpatico.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            Anche se non ho ancora capito quella cosa della elettricità.
        - Ottimamente! #inkD:offState #portrait:frog_neutral                                       
    }
    
    + {frog_secondCharAchievableGifts has cultivableGift} Cosa potrei regalarle?
        -> franco_giftsPlants(SecondCharacter)
    + {frog_secondCharAchievableGifts has ingredientGift && player_accessiblePlaces has Kitchen} Quale ingrediente potrei usare in cucina con lei?
        -> ingredient
    + {frog_secondCharAchievableGifts has bookGift && player_accessiblePlaces has Library} Di quale racconto vorrebbe parlare?
        -> book
    + Ora che ci penso, potresti aiutarmi in modo diverso?
        -> franco_giftsManagement.top
    

        = gift
            ~ temp charNameOne = translator(firstChar_ActualName)
            ~ temp charNameTwo = translator(secondChar_ActualName)
            ~ temp charNameThree = translator(thirdChar_ActualName)
            ~ temp charNameFour = translator(fourthChar_ActualName)
            ~ temp charNameFive = translator(fifthChar_ActualName)
            ~ temp mentorName = translator(mentor_ActualName)

        -> closed_exchange

        = ingredient
            ~ temp charNameOne = translator(firstChar_ActualName)
            ~ temp charNameTwo = translator(secondChar_ActualName)
            ~ temp charNameThree = translator(thirdChar_ActualName)
            ~ temp charNameFour = translator(fourthChar_ActualName)
            ~ temp charNameFive = translator(fifthChar_ActualName)
            ~ temp mentorName = translator(mentor_ActualName)

        -> closed_exchange 

        = book
            ~ temp charNameOne = translator(firstChar_ActualName)
            ~ temp charNameTwo = translator(secondChar_ActualName)
            ~ temp charNameThree = translator(thirdChar_ActualName)
            ~ temp charNameFour = translator(fourthChar_ActualName)
            ~ temp charNameFive = translator(fifthChar_ActualName)
            ~ temp mentorName = translator(mentor_ActualName)

        -> closed_exchange           


=== franco_giftsThirdChar ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {
        - are_two_entities_together(ThirdCharacter, PG):
            Uh, Franco sa tantissime cose di me!
                ~ move_entity(ThirdCharacter, Forest)
    }

    {shuffle once:
        - Mi piace {charNameTwo}! Mi ha insegnato tantissime cose!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        - Sì! Voglio chiedere a {charNameTwo} se facciamo lezioni di nuoto assieme!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        - {charNameTwo} mi sta tanto simpatico.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            Anche se non ho ancora capito quella cosa della elettricità.
        - Ottimamente! #inkD:offState #portrait:frog_neutral                                       
    }
    
    + {frog_thirdCharAchievableGifts has cultivableGift} Cosa potrei regalarle?
        -> franco_giftsPlants(ThirdCharacter)
    + {frog_thirdCharAchievableGifts has ingredientGift && player_accessiblePlaces has Kitchen} Quale ingrediente potrei usare in cucina con lei?
        -> ingredient
    + {frog_thirdCharAchievableGifts has bookGift && player_accessiblePlaces has Library} Di quale racconto vorrebbe parlare?
        -> book
    + Ora che ci penso, potresti aiutarmi in modo diverso?
        -> franco_giftsManagement.top
    

        = gift
            ~ temp charNameOne = translator(firstChar_ActualName)
            ~ temp charNameTwo = translator(secondChar_ActualName)
            ~ temp charNameThree = translator(thirdChar_ActualName)
            ~ temp charNameFour = translator(fourthChar_ActualName)
            ~ temp charNameFive = translator(fifthChar_ActualName)
            ~ temp mentorName = translator(mentor_ActualName)

        -> closed_exchange

        = ingredient
            ~ temp charNameOne = translator(firstChar_ActualName)
            ~ temp charNameTwo = translator(secondChar_ActualName)
            ~ temp charNameThree = translator(thirdChar_ActualName)
            ~ temp charNameFour = translator(fourthChar_ActualName)
            ~ temp charNameFive = translator(fifthChar_ActualName)
            ~ temp mentorName = translator(mentor_ActualName)

        -> closed_exchange 

        = book
            ~ temp charNameOne = translator(firstChar_ActualName)
            ~ temp charNameTwo = translator(secondChar_ActualName)
            ~ temp charNameThree = translator(thirdChar_ActualName)
            ~ temp charNameFour = translator(fourthChar_ActualName)
            ~ temp charNameFive = translator(fifthChar_ActualName)
            ~ temp mentorName = translator(mentor_ActualName)

        -> closed_exchange 


=== franco_giftsFourthChar ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {
        - are_two_entities_together(FourthCharacter, PG):
            Uh, Franco sa tantissime cose di me!
                ~ move_entity(FourthCharacter, Forest)
    }

    {shuffle once:
        - Mi piace {charNameTwo}! Mi ha insegnato tantissime cose!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        - Sì! Voglio chiedere a {charNameTwo} se facciamo lezioni di nuoto assieme!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        - {charNameTwo} mi sta tanto simpatico.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            Anche se non ho ancora capito quella cosa della elettricità.
        - Ottimamente! #inkD:offState #portrait:frog_neutral                                       
    }
    
    + {frog_fourthCharAchievableGifts has cultivableGift} Cosa potrei regalarle?
        -> franco_giftsPlants(FourthCharacter)
    + {frog_fourthCharAchievableGifts has ingredientGift && player_accessiblePlaces has Kitchen} Quale ingrediente potrei usare in cucina con lei?
        -> ingredient
    + {frog_fourthCharAchievableGifts has bookGift && player_accessiblePlaces has Library} Di quale racconto vorrebbe parlare?
        -> book
    + Ora che ci penso, potresti aiutarmi in modo diverso?
        -> franco_giftsManagement.top
    

        = gift
            ~ temp charNameOne = translator(firstChar_ActualName)
            ~ temp charNameTwo = translator(secondChar_ActualName)
            ~ temp charNameThree = translator(thirdChar_ActualName)
            ~ temp charNameFour = translator(fourthChar_ActualName)
            ~ temp charNameFive = translator(fifthChar_ActualName)
            ~ temp mentorName = translator(mentor_ActualName)

        -> closed_exchange

        = ingredient
            ~ temp charNameOne = translator(firstChar_ActualName)
            ~ temp charNameTwo = translator(secondChar_ActualName)
            ~ temp charNameThree = translator(thirdChar_ActualName)
            ~ temp charNameFour = translator(fourthChar_ActualName)
            ~ temp charNameFive = translator(fifthChar_ActualName)
            ~ temp mentorName = translator(mentor_ActualName)

        -> closed_exchange 

        = book
            ~ temp charNameOne = translator(firstChar_ActualName)
            ~ temp charNameTwo = translator(secondChar_ActualName)
            ~ temp charNameThree = translator(thirdChar_ActualName)
            ~ temp charNameFour = translator(fourthChar_ActualName)
            ~ temp charNameFive = translator(fifthChar_ActualName)
            ~ temp mentorName = translator(mentor_ActualName)

        -> closed_exchange    


=== franco_giftsFifthChar ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {
        - are_two_entities_together(FifthCharacter, PG):
            Uh, Franco sa tantissime cose di me!
                ~ move_entity(FifthCharacter, Forest)
    }

    {shuffle once:
        - Mi piace {charNameTwo}! Mi ha insegnato tantissime cose!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        - Sì! Voglio chiedere a {charNameTwo} se facciamo lezioni di nuoto assieme!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        - {charNameTwo} mi sta tanto simpatico.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            Anche se non ho ancora capito quella cosa della elettricità.
        - Ottimamente! #inkD:offState #portrait:frog_neutral                                       
    }
    
    + {frog_fifthCharAchievableGifts has cultivableGift} Cosa potrei regalarle?
        -> franco_giftsPlants(FifthCharacter)
    + {frog_fifthCharAchievableGifts has ingredientGift && player_accessiblePlaces has Kitchen} Quale ingrediente potrei usare in cucina con lei?
        -> ingredient
    + {frog_fifthCharAchievableGifts has bookGift && player_accessiblePlaces has Library} Di quale racconto vorrebbe parlare?
        -> book
    + Ora che ci penso, potresti aiutarmi in modo diverso?
        -> franco_giftsManagement.top
    

        = gift
            ~ temp charNameOne = translator(firstChar_ActualName)
            ~ temp charNameTwo = translator(secondChar_ActualName)
            ~ temp charNameThree = translator(thirdChar_ActualName)
            ~ temp charNameFour = translator(fourthChar_ActualName)
            ~ temp charNameFive = translator(fifthChar_ActualName)
            ~ temp mentorName = translator(mentor_ActualName)

        -> closed_exchange

        = ingredient
            ~ temp charNameOne = translator(firstChar_ActualName)
            ~ temp charNameTwo = translator(secondChar_ActualName)
            ~ temp charNameThree = translator(thirdChar_ActualName)
            ~ temp charNameFour = translator(fourthChar_ActualName)
            ~ temp charNameFive = translator(fifthChar_ActualName)
            ~ temp mentorName = translator(mentor_ActualName)

        -> closed_exchange 

        = book
            ~ temp charNameOne = translator(firstChar_ActualName)
            ~ temp charNameTwo = translator(secondChar_ActualName)
            ~ temp charNameThree = translator(thirdChar_ActualName)
            ~ temp charNameFour = translator(fourthChar_ActualName)
            ~ temp charNameFive = translator(fifthChar_ActualName)
            ~ temp mentorName = translator(mentor_ActualName)

        -> closed_exchange    