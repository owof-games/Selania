=== function franco_giftsStateUpdater()
{debug_frog: franco_giftsStateUpdater.}
//Prima di tutto aggiorno lo stato delle azioni che la giocatrice può aver fatto senza Franco.
    {
        //Ho già fatto il dono (ed è il primo check)
        - firstChar_giftedObject != () && frog_firstCharAchievableGifts has cultivableGift:
                ~ frog_firstCharAchievableGifts -= cultivableGift
                {debug_frog: rimuovo cultivableGift da frog_firstCharAchievableGifts.}

        //Ho già cucinato (ed è il primo check). Traccio il nodo più vicino alla fine per prevenire problemi con eventuali crush del gioco
        - grimoire_firstChar has grimFirstCharKitchenEnded && frog_firstCharAchievableGifts has ingredientGift:
                ~ frog_firstCharAchievableGifts -= ingredientGift
                {debug_frog: rimuovo ingredientGift da frog_firstCharAchievableGifts.}
    }
    
    
    {
        //Ho già fatto il dono (ed è il primo check)
        - secondChar_giftedObject != () && frog_secondCharAchievableGifts has cultivableGift:
                ~ frog_secondCharAchievableGifts -= cultivableGift
                {debug_frog: rimuovo cultivableGift da frog_secondCharAchievableGifts.}

        //Ho già cucinato (ed è il primo check). Traccio il nodo più vicino alla fine per prevenire problemi con eventuali crush del gioco
        - grimoire_secondChar has grimSecondCharKitchenEnded && frog_secondCharAchievableGifts has ingredientGift:
                ~ frog_secondCharAchievableGifts -= ingredientGift
                {debug_frog: rimuovo ingredientGift da frog_secondCharAchievableGifts.}
    
    }

    {
        //Ho già fatto il dono (ed è il primo check)
        - thirdChar_giftedObject != () && frog_thirdCharAchievableGifts has cultivableGift:
                ~ frog_thirdCharAchievableGifts -= cultivableGift
                {debug_frog: rimuovo cultivableGift da frog_thirdCharAchievableGifts.}

        //Ho già cucinato (ed è il primo check). Traccio il nodo più vicino alla fine per prevenire problemi con eventuali crush del gioco
        - grimoire_thirdChar has grimThirdCharKitchenEnded && frog_thirdCharAchievableGifts has ingredientGift:
                ~ frog_thirdCharAchievableGifts -= ingredientGift
                {debug_frog: rimuovo ingredientGift da frog_thirdCharAchievableGifts.}
    
    }

//Poi voglio vedere in generale in questo momento posso dare dei doni alla giocatrice
    {
        - frog_firstCharAchievableGifts != () && firstChar_storyStatus == story_storyStarted:
            {
                - frog_firstCharAchievableGifts == ingredientGift && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_firstCharGiftable = false

                - frog_firstCharAchievableGifts == bookGift && player_accessiblePlaces hasnt Library:
                    ~ frog_firstCharGiftable = false

                - else:
                    ~ frog_firstCharGiftable = true
            }
    }

    {
        - frog_secondCharAchievableGifts != () && secondChar_storyStatus == story_storyStarted:
            {
                - frog_secondCharAchievableGifts == ingredientGift && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_secondCharGiftable = false

                - frog_secondCharAchievableGifts == bookGift && player_accessiblePlaces hasnt Library:
                    ~ frog_secondCharGiftable = false

                - else:
                    ~ frog_secondCharGiftable = true
            }
    }

    {        
        - frog_thirdCharAchievableGifts != () && thirdChar_storyStatus == story_storyStarted:
            {
                - frog_thirdCharAchievableGifts == ingredientGift && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_thirdCharGiftable = false

                - frog_thirdCharAchievableGifts == bookGift && player_accessiblePlaces hasnt Library:
                    ~ frog_thirdCharGiftable = false  

                - else:
                    ~ frog_thirdCharGiftable = true
            }
    }

    {
        - frog_fourthCharAchievableGifts != () && fourthChar_storyStatus == story_storyStarted:
            {
                - frog_fourthCharAchievableGifts == ingredientGift && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_fourthCharGiftable = false
                    //Se la cucina non è aperta ora, non si aprirà più.
                    ~ frog_fourthCharAchievableGifts -= ingredientGift

                - frog_fourthCharAchievableGifts == bookGift && player_accessiblePlaces hasnt Library:
                    ~ frog_fourthCharGiftable = false
                    //Se la biblioteca non è aperta ora, non si aprirà più
                    ~ frog_fourthCharAchievableGifts -= bookGift

                - else:
                    ~ frog_fourthCharGiftable = true
            }
    }

    {

        - frog_fifthCharAchievableGifts != () && fifthChar_storyStatus == story_storyStarted:
            {
                - frog_fifthCharAchievableGifts == ingredientGift && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_fifthCharGiftable = false
                    //Se la cucina non è aperta ora, non si aprirà più.
                    ~ frog_fifthCharAchievableGifts -= ingredientGift

                - frog_fifthCharAchievableGifts == bookGift && player_accessiblePlaces hasnt Library:
                    ~ frog_fifthCharGiftable = false
                    //Se la biblioteca non è aperta ora, non si aprirà più
                    ~ frog_fifthCharAchievableGifts -= bookGift

                - else:
                    ~ frog_fifthCharGiftable = true
            } 
    }

    {
        - (frog_recoverableCultivables != ()) && (frog_recoveredCultivables == ()):
            ~ frog_cultivableGiftable = true

        - else:
            ~ frog_cultivableGiftable = false 
    }

    {
        - frog_recoveredSigil == () && glyph_usedSigils != ():
            ~ frog_sigilGiftable = true

        - else:
            ~ frog_sigilGiftable = false 
    }


    {
        - (frog_firstCharGiftable == true) or (frog_secondCharGiftable == true) or (frog_thirdCharGiftable == true) or (frog_fourthCharGiftable == true) or (frog_fifthCharGiftable == true) or (frog_sigilGiftable == true) or (frog_cultivableGiftable == true):
            ~ frog_giftability = true

        - else:
            ~ frog_giftability = false    
    }

    {debug_frog: dopo franco_giftsStateUpdater frog_giftability è {frog_giftability}. frog_firstCharGiftable è {frog_firstCharGiftable}, frog_secondCharGiftable è {frog_secondCharGiftable}, frog_thirdCharGiftable è {frog_thirdCharGiftable}, frog_fourthCharGiftable è {frog_fourthCharGiftable}, frog_fifthCharGiftable è {frog_fifthCharGiftable}.}
    
=== franco_giftsPlants(PNG, Location)
{debug_frog: passo per franco_giftsPlants}
~ temp frog_temp_char_gift = ""
~ temp frog_temp_temp_growing_gift = false
~ temp tempChar_favouritesGifts = ()
~ temp speaker = ()
~ temp frog_temp_char_ingredient = ""
//questo mi traccia se ho già donato qualcosa in cucina, o direttamente 
~ temp usedGift = ()

    //Check preliminare    
    {
        - PNG == FirstCharacter:
            ~ tempChar_favouritesGifts = firstChar_favouritesGifts
            ~ speaker = FirstCharacter
            ~ usedGift += kitchen_firstCharExtraIngredient
            ~ usedGift += firstChar_giftedObject

        - PNG == SecondCharacter:
            ~ tempChar_favouritesGifts = secondChar_favouritesGifts
            ~ speaker = SecondCharacter
            ~ usedGift += kitchen_secondCharExtraIngredient
            ~ usedGift += secondChar_giftedObject

        - PNG == ThirdCharacter:
            ~ tempChar_favouritesGifts = thirdChar_favouritesGifts
            ~ speaker = ThirdCharacter
            ~ usedGift += kitchen_thirdCharExtraIngredient
            ~ usedGift += thirdChar_giftedObject

        - PNG == FourthCharacter:
            ~ tempChar_favouritesGifts = fourthChar_favouritesGifts
            ~ speaker = FourthCharacter
            ~ usedGift += kitchen_fourthCharExtraIngredient
            ~ usedGift += fourthChar_giftedObject

            
        - PNG == FifthCharacter:
            ~ tempChar_favouritesGifts = fifthChar_favouritesGifts
            ~ speaker = FifthCharacter
            ~ usedGift += kitchen_fifthCharExtraIngredient
            ~ usedGift += fifthChar_giftedObject
              
    }



   {
        //Caso uno: il dono è in crescita:
        - tempChar_favouritesGifts has greenhouse_chosenCultivable:

            {charTag(Franco, "{portrait_Franco()}")}:       Girino!
                                                            Quello che ti serve sta crescendo proprio ora in serra!
                                                            Sento l'odore fino a qui.
                                                            O forse è solo zia Graaak che non si è ancora lavata.
                
                ~ frog_temp_char_gift = "sta crescendo proprio ora in serra!"
                ~ frog_temp_temp_growing_gift = true

        //Caso due: il dono è nello zaino
        - backpack_findedGifts ^ tempChar_favouritesGifts != ():
            ~ temp findedFavourite = backpack_findedGifts ^ tempChar_favouritesGifts
            ~ temp findedFavouriteNotUsed = findedFavourite - usedGift
            ~ temp backGift = LIST_RANDOM(findedFavouriteNotUsed)
            {debug_frog: il dono è nello zaino ed è {backGift}.}

                {backGift:
                    - BaccaDellaAddolorata:
                        Pensa alla difficoltà di fare il primo passo, di accogliere il cambiamento. Quale pianta racconta questa cosa?
                            ~ frog_temp_char_ingredient = "qualcosa che parli del fare il primo passo, di accogliere il cambiamento" 

                    - BastoneDellOzioso:
                        Pensa al piacere di viversi le cose per il piacere di farle. Quale pianta racconta questa storia?
                            ~ frog_temp_char_ingredient = "qualcosa che parli del viversi le cose per il piacere di farle"

                    - BrinaDellImpossibile: 
                        Pensa al bisogno di comprendere che le ferite non ci bloccano nel passato. Quale pianta può aiutarlo?
                            ~ frog_temp_char_ingredient = "qualcosa che aiuti a comprendere le ferite che bloccano nel passato"

                    - CantoDelleCompagne:
                        Pensa al piacere di stare con persone amiche, e chiediti cosa ricordi una festa.
                             ~ frog_temp_char_ingredient = "qualcosa che parli del piacere dello stare con persone amiche"    

                    - CardoAspinato:
                        Pensa al pene.
                             ~ frog_temp_char_ingredient = "pene." 

                    - LicheneDegliAbissi:
                        Ci sono relazioni che non sono sane. E c'è una pianta che le racconta. Quale?
                            ~ frog_temp_char_ingredient = "ci sono relazioni che non sono sane. E c'è una pianta che le racconta. Quale?"

                    - NonTiScordarDiTe: 
                        Qualcosa che parli di chi fa parte di noi, delle nostre radici.
                             ~ frog_temp_char_ingredient = "qualcosa che parli di chi fa parte di noi, delle nostre radici."        


                }
                {debug_frog: frog_temp_char_ingredient è {frog_temp_char_ingredient}.}


        //Caso tre: non abbiamo mai trovato il dono
        - tempChar_favouritesGifts ^ greenhouse_findedCultivables == ():

            {charTag(Franco, "{portrait_Franco()}")}:       Allora?
                                                            Scusa se ho spiato tra le tue cose ma no, non hai niente di utile.
                                                            Ma ora ci penso io.
                                                            "Care formiche."
                                                            "Come avrete visto, ora sono vegetariano."
                                                            "E in onore di questa nostra nuova amicizia vi chiederei un favore: potreste coltivare qualcosa di utile per {player_name}?"
                                                            "Grazie mille."
                                                            "PS.: Vi allego un po' del miele di Dora."
                                                            Ottimo.
                                                            La prossima volta che coltivi qualcosa in serra vedrai che sarà il dono giusto!

                ~ temp perfectGift = LIST_RANDOM(tempChar_favouritesGifts)
            {debug_frog: il dono è stato messo in serra ed è {ingredientTranslator(perfectGift)}. La lista tempChar_favouritesGifts contiene {tempChar_favouritesGifts}.}

                {
                    - greenhouse_frog_nextCultivableOne == ():
                        ~ greenhouse_frog_nextCultivableOne = perfectGift
                        ~ frog_temp_char_ingredient = "{ingredientTranslator(perfectGift)}"
    
                    - greenhouse_frog_nextCultivableTwo == () && greenhouse_frog_nextCultivableOne != ():
                        ~ greenhouse_frog_nextCultivableTwo = perfectGift
                        ~ frog_temp_char_ingredient = "{ingredientTranslator(perfectGift)}"
                        
                    - greenhouse_frog_nextCultivableThree == () && greenhouse_frog_nextCultivableTwo != ():
                        ~ greenhouse_frog_nextCultivableThree = perfectGift
                        ~ frog_temp_char_ingredient = "{ingredientTranslator(perfectGift)}"
    
                }
        //Caso quattro: abbiamo trovato tutti i doni, ma li abbiamo già consumati.
        - else:

            ~ temp perfectGiftTwo = LIST_RANDOM(tempChar_favouritesGifts)

            {charTag(Franco, "{portrait_Franco()}")}:       Girino!
                                                            Credo tu abbia fatto l'impossibile: c'erano un sacchissimo di doni a disposizione, ma li hai già consumati tutti in altre situazioni.
            {
                - frog_recoverableCultivables!= () && frog_recoveredCultivables == ():
                                                            Però non mi hai ancora chiesto di recuperare una delle piante che hai già utilizzato.
                                                            Ti consiglio di recuperare {ingredientTranslator(perfectGiftTwo)}.
                                                            Ricorda però che posso fare un solo recupero!
                                                                -> cultivable_recovery

                - else:
                                                            Hai già anche utilizzato il mio superpotere del recupero.
                                                            Però posso dirti una cosa: ho fiducia in te, davvero.
                                                            E so già che riuscirai a trovare altri modi per dimostrare quanto tieni a {translator(speaker)}.      

            }

} 

//Check in uscita    
    {
        - PNG == FirstCharacter:
            ~ frog_first_char_gift = frog_temp_char_gift
            ~ frog_first_temp_growing_gift = frog_temp_temp_growing_gift
            ~ frog_first_char_ingredient = frog_temp_char_ingredient
            {
                - Location == Kitchen:
                    ~ frog_firstCharAchievableGifts -= ingredientGift
                - else:
                    ~ frog_firstCharAchievableGifts -= cultivableGift
            }

        - PNG == SecondCharacter:
            ~ frog_second_char_gift = frog_temp_char_gift
            ~ frog_second_temp_growing_gift = frog_temp_temp_growing_gift
            {
                - Location == Kitchen:
                    ~ frog_secondCharAchievableGifts -= ingredientGift
                - else:
                    ~ frog_secondCharAchievableGifts -= cultivableGift
            }

        - PNG == ThirdCharacter:
            ~ frog_third_char_gift = frog_temp_char_gift
            ~ frog_third_temp_growing_gift = frog_temp_temp_growing_gift
            {
                - Location == Kitchen:
                    ~ frog_thirdCharAchievableGifts -= ingredientGift
                - else:
                    ~ frog_thirdCharAchievableGifts -= cultivableGift
            }
    

        // - PNG == FourthCharacter:
        //     ~ frog_fourth_char_gift = frog_temp_char_gift
        //     ~ frog_fourth_temp_growing_gift = frog_temp_temp_growing_gift
            // {
            //     - Location == Kitchen:
            //         ~ frog_fourthCharAchievableGifts -= ingredientGift
            //     - else:
            //         ~ frog_fourthCharAchievableGifts -= cultivableGift
            // }


        // - PNG == FifthCharacter:
        //     ~ frog_fifth_char_gift = frog_temp_char_gift
        //     ~ frog_fifth_temp_growing_gift = frog_temp_temp_growing_gift
            // {
            //     - Location == Kitchen:
            //         ~ frog_fifthCharAchievableGifts -= ingredientGift
            //     - else:
            //         ~ frog_fifthCharAchievableGifts -= cultivableGift
            // }
               

    }


-> closed_exchange


=== cultivable_recovery
{debug_frog: passo da cultivable_recovery.}
Vorrei recuperare...#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral

    + {frog_recoverableCultivables has BaccaDellaAddolorata} ...{ingredientTranslator(BaccaDellaAddolorata)}.
            ~  frog_recoveredCultivables += BaccaDellaAddolorata
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has BarbaDellInciampo} ...{ingredientTranslator(BarbaDellInciampo)}.
            ~  frog_recoveredCultivables += BarbaDellInciampo
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has BastoneDellOzioso} ...{ingredientTranslator(BastoneDellOzioso)}.
            ~  frog_recoveredCultivables += BastoneDellOzioso
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has BrinaDellImpossibile} ...{ingredientTranslator(BrinaDellImpossibile)}.
            ~  frog_recoveredCultivables += BrinaDellImpossibile
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has CantoDelleCompagne}  ...{ingredientTranslator(CantoDelleCompagne)}.
            ~  frog_recoveredCultivables += CantoDelleCompagne
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has CardoAspinato} ...{ingredientTranslator(CardoAspinato)}.
            ~  frog_recoveredCultivables += CardoAspinato
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has EderaDelleAmanti} ...{ingredientTranslator(EderaDelleAmanti)}.
            ~  frog_recoveredCultivables += EderaDelleAmanti
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has ErbaLiccia} ...{ingredientTranslator(ErbaLiccia)}.
            ~  frog_recoveredCultivables += ErbaLiccia
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has FalsaPalude} ...{ingredientTranslator(FalsaPalude)}.
            ~  frog_recoveredCultivables += FalsaPalude
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has LanaNotturna} ...{ingredientTranslator(LanaNotturna)}.
            ~  frog_recoveredCultivables += LanaNotturna
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has LicheneDegliAbissi} ...{ingredientTranslator(LicheneDegliAbissi)}.
            ~  frog_recoveredCultivables += LicheneDegliAbissi
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has NonTiScordarDiTe} ...{ingredientTranslator(NonTiScordarDiTe)}.
            ~  frog_recoveredCultivables += NonTiScordarDiTe
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has Olobino} ...{ingredientTranslator(Olobino)}.
            ~  frog_recoveredCultivables += Olobino
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has LaSpazzata} ...{ingredientTranslator(LaSpazzata)}.
            ~  frog_recoveredCultivables += LaSpazzata
            -> franco_afterRecovery
            
    
    + Ho cambiato idea
        -> franco_giftsManagement



=== function sigil_recovery()
    ~ temp sigil = LIST_RANDOM(glyph_usedSigils)
    ~ frog_recoveredSigil += sigil
    ~ glyph_usedSigils -= sigil

    //Levo la possibilità di recuperare il sigillo
        ~ frog_otherGifts -= sigilRecovery
    
    {charTag(Franco, "{portrait_Franco()}")}:       E allora girino, eccoti di nuovo a disposizione {sigils_translator(sigil)}!
                                                    Fanne buon uso!





=== franco_afterRecovery
    //Oggetti
    {debug_frog: passo mission_objects.}
        
    ~ temp recoveredCultivable = LIST_RANDOM(frog_recoveredCultivables)

        {charTag(Franco, "{portrait_Franco()}")}:       Signori e signore e signor3, ecco quanto richiesto dal girino: {ingredientTranslator(recoveredCultivable)}!
                                                        Direttamente nella collezione di {player_name}!

            ~ backpack_findedGifts += recoveredCultivable
            
            //Levo la possibilità di recuperare il coltivabile
            ~ frog_otherGifts -= cultivableRecovery
        
    -> closed_exchange
