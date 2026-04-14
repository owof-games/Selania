=== franco_giftsManagement ===
{debug_frog: passo da franco_giftsManagement.}
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    //Facciamo un passaggio di aggiornamento degli achievements subito dopo la chiusura di una commissione
    -> achievements_onGame_statusUpdate_GM ->

    {charTag(Franco, "{portrait_Franco()}")}:       Bene girino, direi che è il momento che Franco ti dia una zampa!
    
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

        + {frog_firstCharGiftable == true}Mi servirebbe un consiglio su {charNameOne}.
            -> franco_giftsFirstChar
        + {frog_secondCharGiftable == true}Vorrei una mano con {charNameTwo}.
            -> franco_giftsSecondChar
        + {frog_thirdCharGiftable == true}Cosa potresti offrirmi per {charNameThree}?
            -> franco_giftsThirdChar
        + {frog_fourthCharGiftable == true}Apprezzerei un aiuto con {charNameFour}.
            -> franco_giftsFourthChar
        + {frog_fifthCharGiftable == true}Qualche dritta su {charNameFive}?
            -> franco_giftsFifthChar
        + {(frog_recoverableCultivables != ()) && (frog_recoveredCultivables == ())} Puoi aiutarmi a recuperare una pianta che ho già utilizzato?
                {charTag(Franco, "{portrait_Franco()}")}:       Certo che craack!
                                                                Ma.
                                                                Lo posso fare solo una volta.
                                                                    + + Ok, voglio usare ora questa occasione!
                                                                        -> cultivable_recovery
                                                                    + + Mmm, ci ragiono su.
                                                                        -> top

        + {frog_recoveredSigil == () && glyph_usedSigils != ()} Puoi aiutarmi a recuperare un sigillo che ho già utilizzato?
                {charTag(Franco, "{portrait_Franco()}")}:       Certo che craack!
                                                                Ma.
                                                                Lo posso fare solo una volta.
                                                                E dandotene uno a caso.
                                                                I sigilli sono più strani delle capre, e non so fare di meglio.
                                                                    + + Ok, voglio usare ora questa occasione!
                                                                        //Chiamo direttamente la funzione, non ci sono scelte da compiere in questo caso.
                                                                        ~ sigil_recovery ()
                                                                        //E poi esco
                                                                        -> closed_exchange

                                                                    + + Mmm, ci ragiono su.
                                                                        -> top

        + Vorrei pensarci ancora un po'.
            {charTag(Franco, "{portrait_Franco()}")}:       Mi trovi qui girino.
            {shuffle:
                                                        -   Continuo a contare tutte le onde!
                                                        -   Intanto sonnecchio sulla ninfea.
                                                        -   Nel mentre scrivo a Babbo Navale.
                                                        -   Continuo a leggere "Lezioni di nuoto per girini".
                                                        -   Devo decidere cosa cucinare per il compleanno dei gemelli.
            }

                                                            
                                                                ~ frog_suspended_gift = true
                                                            -> main
        -
->->

=== franco_giftsFirstChar ===
{debug_frog: passo da franco_giftsFirstChar.}
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
        - {charTag(Franco, "{portrait_Franco()}")}:     Uh, mi piace {charNameOne}, è sempre così gentile con me!
        - {charTag(Franco, "{portrait_Franco()}")}:     {charNameOne} ha una bella testolina.
                                                        Piena di girini che corrono alla svelta.
        - {charTag(Franco, "{portrait_Franco()}")}:     {charNameOne} andrebbe molto d'accordo con Tullio.
                                                        Anche lui è un artista.
        - {charTag(Franco, "{portrait_Franco()}")}:     Ottimamente!                             
    }
    
    + {frog_firstCharAchievableGifts has cultivableGift} Cosa potrei regalarle?
        -> franco_giftsPlants(FirstCharacter, Pond)
    + {frog_firstCharAchievableGifts has ingredientGift && player_accessiblePlaces has Kitchen} Quale ingrediente potrei usare in cucina con lei?
        -> franco_giftsPlants(FirstCharacter, Kitchen)
    + {frog_firstCharAchievableGifts has bookGift && player_accessiblePlaces has Library} Di quale racconto vorrebbe parlare?
        -> book
    + Ora che ci penso, potresti aiutarmi in modo diverso?
        -> franco_giftsManagement.top

        = book
            ~ temp charNameOne = translator(firstChar_ActualName)
            ~ temp charNameTwo = translator(secondChar_ActualName)
            ~ temp charNameThree = translator(thirdChar_ActualName)
            ~ temp charNameFour = translator(fourthChar_ActualName)
            ~ temp charNameFive = translator(fifthChar_ActualName)
            ~ temp mentorName = translator(mentor_ActualName)

        {
            - library_readStories has Aza:
                {charTag(Franco, "{portrait_Franco()}")}:       Franco vede, vede vede...
                                                                Uh, devo aprire gli occhi.
                                                                Ma mi dicevano i topi della biblioteca che prima hai letto <b>Luna vergine</b> di Aza.
                    {
                        - grimoire_firstChar has grimFirstCharNovel:
                            {charTag(Franco, "{portrait_Franco()}")}:       E che ne hai già parlato con {charNameOne}!
                                                                            Perché non scegli un altro dono?
                                ~ frog_first_novel = "<b>Luna vergine</b> di Aza"
                                -> franco_giftsManagement.top
                    
                        - else:
                            {charTag(Franco, "{portrait_Franco()}")}:       Prova a parlare con {charNameOne} e vedrai che avrà sicuramente qualcosa da dirti.
                                                                            Anche perché so che ha già letto <b>Luna vergine</b> di Aza.
                                                                            Le persone parlano tanto delle cose che leggono.
                                                                            O vedono.
                                                                            O ascoltano.
                                                                            Per fortuna io parlo poco.
                                ~ frog_first_novel = "<b>Luna vergine</b> di Aza"
                                -> closed_exchange
                    
                    }

            - else:
                {charTag(Franco, "{portrait_Franco()}")}:       C'è una lettera dei topi della biblioteca.
                                                                "Parola chiave: trasformazione".
                                                                Ah, e dietro c'è scritto: "Lunga".
                                                                Forse vogliono diventare zucche?
                                                                Ma magari tu ci capisci qualcosa e allora trovi il racconto che ti serve!
                    ~ frog_first_novel = "una storia lunga che parli di trasformazione"
                    -> closed_exchange
            }
 
        -> closed_exchange           


=== franco_giftsSecondChar ===
{debug_frog: passo da franco_giftsSecondChar.}
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
        - {charTag(Franco, "{portrait_Franco()}")}:     Mi piace {charNameTwo}! Mi ha insegnato tantissime cose!
        - {charTag(Franco, "{portrait_Franco()}")}:     Sì! Voglio chiedere a {charNameTwo} se facciamo lezioni di nuoto assieme!
        - {charTag(Franco, "{portrait_Franco()}")}:     {charNameTwo} mi sta tanto simpatico.
                                                        Anche se non ho ancora capito quella cosa della elettricità.
        - {charTag(Franco, "{portrait_Franco()}")}:     Ottimamente!                                   
    }
    
    + {frog_secondCharAchievableGifts has cultivableGift} Cosa potrei regalarle?
        -> franco_giftsPlants(SecondCharacter, Pond)
    + {frog_secondCharAchievableGifts has ingredientGift && player_accessiblePlaces has Kitchen} Quale ingrediente potrei usare in cucina con lei?
        -> franco_giftsPlants(SecondCharacter, Kitchen)
    + {frog_secondCharAchievableGifts has bookGift && player_accessiblePlaces has Library} Di quale racconto vorrebbe parlare?
        -> book
    + Ora che ci penso, potresti aiutarmi in modo diverso?
        -> franco_giftsManagement.top
    

        = book
            ~ temp charNameOne = translator(firstChar_ActualName)
            ~ temp charNameTwo = translator(secondChar_ActualName)
            ~ temp charNameThree = translator(thirdChar_ActualName)
            ~ temp charNameFour = translator(fourthChar_ActualName)
            ~ temp charNameFive = translator(fifthChar_ActualName)
            ~ temp mentorName = translator(mentor_ActualName)

                
        {
            - library_readStories has Lamia:
                {charTag(Franco, "{portrait_Franco()}")}:       Prima Gliberia, una delle topoline della biblioteca, ha visto che stavi leggendo <b>Il sassolino</b>.
                    {
                        - grimoire_secondChar has grimSecondCharNovel:
                                                                E che ne avete già parlato con {charNameTwo}.
                                                                Perché non scegli un altro dono?
                                ~ frog_second_novel = "<b>Il sassolino</b> di Lamia"
                                    -> franco_giftsManagement.top
                    
                        - else:
                                                                Prova a parlare con lui e vedrai che avrà sicuramente qualcosa da dirti.
                                                                Anche perché è certissimamerrimo che ha già letto <b>Il sassolino</b>!
                                                                A {charNameTwo} piace parlare.
                                                                Ora mi sta insegnando come non annegare!
                                ~ frog_second_novel = "<b>Il sassolino</b> di Lamia"
                                -> closed_exchange
                    }

            - else:
                {charTag(Franco, "{portrait_Franco()}")}:       Secondo il manuale della biblioteca, {charNameTwo} è uno da fenotipo "ribellione" combinato con "veloce".
                                                                E tu dirai "Franco la rana, cos'è un fenotipo?"
                                                                E io ti dirò "Un tipo a cui piace tanto il fieno!"
                                                                E poi aggiungerò "Che è un po' diverso dal topognomastico, che è un topo che mastica gli gnomi."
                                                                E so che sono tante informazioni anche per una bella testolina come la tua, girino.
                                                                Per cui vai pure a cercare questa ribellione in biblioteca e vedrai che farai felice {charNameTwo}!
                    ~ frog_second_novel = "qualcosa di veloce che parli di ribellione"
                        -> closed_exchange
        }

        -> closed_exchange           


=== franco_giftsThirdChar ===
{debug_frog: passo da franco_giftsThirdChar.}
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
        - {charTag(Franco, "{portrait_Franco()}")}:     Mi piace {charNameTwo}! Mi ha insegnato tantissime cose!
        - {charTag(Franco, "{portrait_Franco()}")}:     Sì! Voglio chiedere a {charNameTwo} se facciamo lezioni di nuoto assieme!
        - {charTag(Franco, "{portrait_Franco()}")}:     {charNameTwo} mi sta tanto simpatico.
                                                        Anche se non ho ancora capito quella cosa della elettricità.
        - {charTag(Franco, "{portrait_Franco()}")}:     Ottimamente!                                   
    }
    
    + {frog_thirdCharAchievableGifts has cultivableGift} Cosa potrei regalarle?
        -> franco_giftsPlants(ThirdCharacter, Pond)
    + {frog_thirdCharAchievableGifts has ingredientGift && player_accessiblePlaces has Kitchen} Quale ingrediente potrei usare in cucina con lei?
        -> franco_giftsPlants(ThirdCharacter, Kitchen)
    + {frog_thirdCharAchievableGifts has bookGift && player_accessiblePlaces has Library} Di quale racconto vorrebbe parlare?
        -> book
    + Ora che ci penso, potresti aiutarmi in modo diverso?
        -> franco_giftsManagement.top
    

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
        - {charTag(Franco, "{portrait_Franco()}")}:     Mi piace {charNameTwo}! Mi ha insegnato tantissime cose!
        - {charTag(Franco, "{portrait_Franco()}")}:     Sì! Voglio chiedere a {charNameTwo} se facciamo lezioni di nuoto assieme!
        - {charTag(Franco, "{portrait_Franco()}")}:     {charNameTwo} mi sta tanto simpatico.
                                                        Anche se non ho ancora capito quella cosa della elettricità.
        - {charTag(Franco, "{portrait_Franco()}")}:     Ottimamente!                                   
    }
    
    + {frog_fourthCharAchievableGifts has cultivableGift} Cosa potrei regalarle?
        -> franco_giftsPlants(FourthCharacter, Pond)
    + {frog_fourthCharAchievableGifts has ingredientGift && player_accessiblePlaces has Kitchen} Quale ingrediente potrei usare in cucina con lei?
        -> franco_giftsPlants(FourthCharacter, Kitchen)
    + {frog_fourthCharAchievableGifts has bookGift && player_accessiblePlaces has Library} Di quale racconto vorrebbe parlare?
        -> book
    + Ora che ci penso, potresti aiutarmi in modo diverso?
        -> franco_giftsManagement.top

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
        - {charTag(Franco, "{portrait_Franco()}")}:     Mi piace {charNameTwo}! Mi ha insegnato tantissime cose!
        - {charTag(Franco, "{portrait_Franco()}")}:     Sì! Voglio chiedere a {charNameTwo} se facciamo lezioni di nuoto assieme!
        - {charTag(Franco, "{portrait_Franco()}")}:     {charNameTwo} mi sta tanto simpatico.
                                                        Anche se non ho ancora capito quella cosa della elettricità.
        - {charTag(Franco, "{portrait_Franco()}")}:     Ottimamente!                                   
    }
    
    + {frog_fifthCharAchievableGifts has cultivableGift} Cosa potrei regalarle?
        -> franco_giftsPlants(FifthCharacter, Pond)
    + {frog_fifthCharAchievableGifts has ingredientGift && player_accessiblePlaces has Kitchen} Quale ingrediente potrei usare in cucina con lei?
        -> franco_giftsPlants(FifthCharacter, Kitchen)
    + {frog_fifthCharAchievableGifts has bookGift && player_accessiblePlaces has Library} Di quale racconto vorrebbe parlare?
        -> book
    + Ora che ci penso, potresti aiutarmi in modo diverso?
        -> franco_giftsManagement.top
    

        = book
            ~ temp charNameOne = translator(firstChar_ActualName)
            ~ temp charNameTwo = translator(secondChar_ActualName)
            ~ temp charNameThree = translator(thirdChar_ActualName)
            ~ temp charNameFour = translator(fourthChar_ActualName)
            ~ temp charNameFive = translator(fifthChar_ActualName)
            ~ temp mentorName = translator(mentor_ActualName)

        -> closed_exchange    