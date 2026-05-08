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
        - frog_firstCharAchievableGifts != () && grimoire_firstChar has grimFirstCharOne:
            {
                - frog_firstCharAchievableGifts == ingredientGift && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_firstCharGiftable = false

                - frog_firstCharAchievableGifts == bookGift && player_accessiblePlaces hasnt Library:
                    ~ frog_firstCharGiftable = false

                - frog_firstCharAchievableGifts == (bookGift,ingredientGift) && player_accessiblePlaces hasnt Library && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_firstCharGiftable = false

                - else:
                    ~ frog_firstCharGiftable = true
            }

        - frog_firstCharAchievableGifts == ():
                ~ frog_firstCharGiftable = false
    }

    {
        - frog_secondCharAchievableGifts != () && grimoire_secondChar has grimSecondCharOne:
            {
                - frog_secondCharAchievableGifts == ingredientGift && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_secondCharGiftable = false

                - frog_secondCharAchievableGifts == bookGift && player_accessiblePlaces hasnt Library:
                    ~ frog_secondCharGiftable = false

                - frog_secondCharAchievableGifts == (bookGift,ingredientGift) && player_accessiblePlaces hasnt Library && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_secondCharGiftable = false    

                - else:
                    ~ frog_secondCharGiftable = true
            }

        - frog_secondCharAchievableGifts == ():
                ~ frog_secondCharGiftable = false    
    }

    {        
        - frog_thirdCharAchievableGifts != () && grimoire_thirdChar has grimThirdCharOne:
            {
                - frog_thirdCharAchievableGifts == ingredientGift && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_thirdCharGiftable = false

                - frog_thirdCharAchievableGifts == bookGift && player_accessiblePlaces hasnt Library:
                    ~ frog_thirdCharGiftable = false

                - frog_thirdCharAchievableGifts == (bookGift,ingredientGift) && player_accessiblePlaces hasnt Library && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_thirdCharGiftable = false     

                - else:
                    ~ frog_thirdCharGiftable = true
            }

        - frog_thirdCharAchievableGifts == ():
                ~ frog_thirdCharGiftable = false      
    }

    {
        - frog_fourthCharAchievableGifts != () && grimoire_fourthChar has grimFourthCharOne:
            {
                - frog_fourthCharAchievableGifts == ingredientGift && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_fourthCharGiftable = false
                    //Se la cucina non è aperta ora, non si aprirà più.
                    ~ frog_fourthCharAchievableGifts -= ingredientGift

                - frog_fourthCharAchievableGifts == bookGift && player_accessiblePlaces hasnt Library:
                    ~ frog_fourthCharGiftable = false
                    //Se la biblioteca non è aperta ora, non si aprirà più
                    ~ frog_fourthCharAchievableGifts -= bookGift
                
                - frog_fourthCharAchievableGifts == (bookGift,ingredientGift) && player_accessiblePlaces hasnt Library && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_fourthCharGiftable = false

                - else:
                    ~ frog_fourthCharGiftable = true
            }

        - frog_fourthCharAchievableGifts == ():
                ~ frog_fourthCharGiftable = false      
    }

    {

        - frog_fifthCharAchievableGifts != () && grimoire_fifthChar has grimFifthCharOne:
            {
                - frog_fifthCharAchievableGifts == ingredientGift && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_fifthCharGiftable = false
                    //Se la cucina non è aperta ora, non si aprirà più.
                    ~ frog_fifthCharAchievableGifts -= ingredientGift

                - frog_fifthCharAchievableGifts == bookGift && player_accessiblePlaces hasnt Library:
                    ~ frog_fifthCharGiftable = false
                    //Se la biblioteca non è aperta ora, non si aprirà più
                    ~ frog_fifthCharAchievableGifts -= bookGift

                - frog_fifthCharAchievableGifts == (bookGift,ingredientGift) && player_accessiblePlaces hasnt Library && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_fifthCharGiftable = false    

                - else:
                    ~ frog_fifthCharGiftable = true
            }
        
        - frog_fifthCharAchievableGifts == ():
                ~ frog_fifthCharGiftable = false      
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

            {charTag(Franco, "party")}:                                                             Girino!
            {stopping:
                                                        -                                           Tu c'hai i superportieri!
                                                                                                    Come zia Graaak, che sa sempre quando sto per respirare.
                                                            {charTag(Franco, "neutral")}:           La pianta che ti serve sta già crescendo in serra.

                                                        -                                           Quello che ti serve sta crescendo proprio ora in serra!
                                                                                                    Sento l'odore fino a qui.
                                                            {charTag(Franco, "question")}:          O forse è solo zia Graaak che non si è ancora lavata.
                                                        
                                                        -                                           Non so come fai, ma di nuovo quello che ti serve sta crescendo in serra.
                                                            {charTag(Franco, "question")}:          Forse sai parlare con le formiche?
                                                                                                    Nel caso chiedi loro di restituirmi il giroscopio?
                                                            {charTag(Franco, "neutral")}:           Mi serve per girare i girini quando sono a pancia all'aria.
                                                        
                                                        -                                           Ma che te lo dico a fare: quello che ti serve sta crescendo in serra.
                                                            {charTag(Franco, "neutral")}:           Di nuovo.
                                                                                                    Povero Franco.
                                                                                                    Ormai non serve più nemmeno a piantare le piante.
                                                            {charTag(Franco, "party")}:             Forse potrei fiorare i fiori?

            }    
                ~ frog_temp_char_gift = "sta crescendo ora in serra!"
                ~ frog_temp_temp_growing_gift = true

        //Caso due: il dono è nello zaino
        - backpack_findedGifts ^ tempChar_favouritesGifts != ():
            ~ temp findedFavourite = backpack_findedGifts ^ tempChar_favouritesGifts
            ~ temp findedFavouriteNotUsed = findedFavourite - usedGift
            ~ temp backGift = LIST_RANDOM(findedFavouriteNotUsed)
            {debug_frog: il dono è nello zaino ed è {backGift}.}

            {charTag(Franco, "party")}:                     Girino!
                                                            Sai che hai già la pianta giusta?
            {charTag(Franco, "neutral")}:                   Ti do un indizio.

                {backGift:
                    - BaccaDellaAddolorata:
                        Pensa alla difficoltà di fare il primo passo, di accogliere il cambiamento. Quale pianta racconta questa cosa?
                            ~ frog_temp_char_ingredient = "qualcosa che parli del fare il primo passo, di accogliere il cambiamento" 

                    - BarbaDellInciampo:
                        C'è una pianta che parla di colpa e responsabilità. Quella è la pianta che ti serve!
                            ~ frog_temp_char_ingredient = "qualcosa che parla di colpa e responsabilità"

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
                        C'è una pianta che prima è spinosa e rigida, ma poi morbida e vulnerabile. Ti serve quella.
                             ~ frog_temp_char_ingredient = "qualcosa che prima è spinoso e rigido, poi morbido e vulnerabile." 

                    - EderaDelleAmanti:
                        Uh, la mia preferita! Parla di piacere e cibo e amore. Quella è perfetta.
                             ~ frog_temp_char_ingredient = "qualcosa che parli di piacere, cibo e amore."

                    - ErbaLiccia:
                        C'è una pianta che collega passato, presente e futuro per aiutarci a formare la nostra identità. Lei è quella giusta.
                             ~ frog_temp_char_ingredient = "qualcosa che colleghi passato, presente e futuro."

                    - FalsaPalude:
                        Pensa a una situazione in cui non ci sono capi, in cui il cambiamento è collettivo. Quale pianta racconta questa cosa?
                             ~ frog_temp_char_ingredient = "qualcosa legato alla collettività, al cambiamento senza capi."        

                    - LanaNotturna:
                        Questa pianta cresce dove non c'è spazio per la vita. Ci ricorda che quando tutto sembra perduto, qualcosa sta sempre cambiando.
                             ~ frog_temp_char_ingredient = "qualcosa legato al vedere la vita anche quando tutto sembra perduto." 

                    - LicheneDegliAbissi:
                        Ci sono relazioni che non sono sane. E c'è una pianta che le racconta. Quale?
                            ~ frog_temp_char_ingredient = "ci sono relazioni che non sono sane. E c'è una pianta che le racconta. Quale?"

                    - NonTiScordarDiTe: 
                        Una pianta tenera, che parla di chi fa parte di noi, delle nostre radici, di come la nostra storia sia anche la storia di chi incontriamo.
                             ~ frog_temp_char_ingredient = "qualcosa che parli di chi fa parte di noi, delle nostre radici."        

                    - Olobino: 
                        C'è una pianta che ha tantissimi nomi, difficile da spiegare, e che chiede di essere provata. Quella è la pianta giusta.
                             ~ frog_temp_char_ingredient = "qualcosa che ha tantissimi nomi e che è difficile da spiegare."

                    - LaSpazzata: 
                        Quella pianta che cresce quando hai tanti pensieri che ti sommergono e feriscono. Quella.
                             ~ frog_temp_char_ingredient = "qualcosa che cresce quando hai tanti pensieri che ti sommergono e ti fanno male."           

                }
                {debug_frog: frog_temp_char_ingredient è {frog_temp_char_ingredient}.}


        //Caso tre: non abbiamo mai trovato il dono
        - tempChar_favouritesGifts ^ greenhouse_findedCultivables == ():

            {charTag(Franco, "party")}:                     Girino!
                                                            
            {stopping:                                                
                                                        -   {charTag(Franco, "neutral")}:   Scusa se ho spiato tra le tue cose ma no, non hai niente di utile.
                                                                                            Ma ora ci penso io.
                                                                                            "Care formiche."
                                                            {charTag(Franco, "party")}:     "Come avrete visto, ora sono vegetariano."
                                                            {charTag(Franco, "neutral")}:"  E in onore di questa nostra nuova amicizia vi chiederei un favore: potreste coltivare qualcosa di utile per {player_name}?"
                                                                                            "Grazie mille."
                                                            {charTag(Franco, "party")}:     "PS.: Vi allego un po' del miele di Dora."
                                                            {charTag(Franco, "neutral")}:   Ottimo.
                                                                                            La prossima volta che coltivi qualcosa in serra vedrai che sarà la pianta giusta!

                                                        -   {charTag(Franco, "neutral")}:   Di nuovo non hai niente di utile tra le tue cose.
                                                                                            Mando una lettera alle amiche formiche.
                                                                                            "Care formiche, qui è sempre Franco che vi scrive."
                                                                                            "Mi diceva Dora che avete passato un periodo difficile."
                                                                                            "Vi mando quindi un po' di terriccio per il nido e l'ultimo libro di zio Gracco."
                                                            {charTag(Franco, "party")}:     "Così magari il passato vi sembra migliore."
                                                            {charTag(Franco, "question")}:  "Non è che potreste inoltre aiutare {player_name}, e coltivare qualcosa che {translator(speaker)} possa apprezzare?"
                                                            {charTag(Franco, "neutral")}:    "Cordialmente."
                                                                                            "Franco La Rana (non Franco Il Rospo, quello non si vede da mesi)."
                                                                                            Perfetto: la prossima volta che coltiverai qualcosa, ti arriverà la pianta perfetta.        

                                                        -   {charTag(Franco, "neutral")}:   Mi sa che devi coltivare più piante, sennò le formiche poi si arrabbiano con me.
                                                                                            Perché ancora non hai nulla di utile.
                                                                                            "Care formiche, sono qui a chiedervi di nuovo di aiutare {player_name}."
                                                                                            "In cambio a questo giro vi invito alla serata karaoke di cugina Sputt."
                                                            {charTag(Franco, "question")}:   "Ma vi chiedo di non portare di nuovo "<i>Tintarella di muta</i>", che poi attirate tutti i serpenti."
                                                                                            "E nemmeno "<i>È l'uovo per me</i>", che poi i girini si spaventano."
                                                            {charTag(Franco, "party")}:     "Però mi piacerebbe sentire "<i>La canzone di Raganella</i>", se vi va."
                                                            {charTag(Franco, "neutral")}    "Grazie mille."
                                                                                            "Franco."
                                                                                            Bene: la prossima volta che coltivi qualcosa, ti arriverà la pianta giusta per {translator(speaker)}.

                                                        -   {charTag(Franco, "neutral")}    Di nuovo senza la pianta giusta.
                                                                                            "Care formiche, la solita richiesta."
                                                                                            "Una pianta che aiuti {player_name} con {translator(speaker)}."
                                                                                            "Ho finito le cose che vi posso offrire, ma spero avrete pazienza con me."
                                                                                            Sai già come funziona, girino.
                                                            {charTag(Franco, "question")}:  Ma come fai ad essere sempre senza piante?    

            }                                                

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

                - greenhouse_frog_nextCultivableFour == () && greenhouse_frog_nextCultivableThree != ():
                    ~ greenhouse_frog_nextCultivableFour = perfectGift
                    ~ frog_temp_char_ingredient = "{ingredientTranslator(perfectGift)}"

                - greenhouse_frog_nextCultivableFive == () && greenhouse_frog_nextCultivableFour != ():
                    ~ greenhouse_frog_nextCultivableFive = perfectGift
                    ~ frog_temp_char_ingredient = "{ingredientTranslator(perfectGift)}"
                
                - greenhouse_frog_nextCultivableSix == () && greenhouse_frog_nextCultivableFive != ():
                    ~ greenhouse_frog_nextCultivableSix = perfectGift
                    ~ frog_temp_char_ingredient = "{ingredientTranslator(perfectGift)}"
            
            
            }
        //Caso quattro: abbiamo trovato tutti i doni, ma li abbiamo già consumati.
        - else:

            ~ temp perfectGiftTwo = LIST_RANDOM(tempChar_favouritesGifts)

            {charTag(Franco, "party")}:                     Girino!
                                                            Credo tu abbia fatto l'impossibile: c'erano un sacchissimo di piante a disposizione, ma le hai già consumate tutte in altre situazioni.
            {
                - frog_recoverableCultivables!= () && frog_recoveredCultivables == ():
                {charTag(Franco, "neutral")}:               Però non mi hai ancora chiesto di recuperarne una tra quelle che hai già utilizzato.
                                                            Ti consiglio di recuperare {ingredientTranslator(perfectGiftTwo)}.
                {charTag(Franco, "question")}:              Ricorda però che posso fare un solo recupero!
                                                                -> cultivable_recovery

                - else:
                {charTag(Franco, "neutral")}:              Hai già anche utilizzato il mio superpotere del recupero.
                {charTag(Franco, "party")}:                Però posso dirti una cosa: ho fiducia in te, davvero.
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
{charTag(PG, "neutral")}:      Vorrei recuperare...

    + {frog_recoverableCultivables has BaccaDellaAddolorata}  \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(BaccaDellaAddolorata)}.
            ~  frog_recoveredCultivables += BaccaDellaAddolorata
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has BarbaDellInciampo}  \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(BarbaDellInciampo)}.
            ~  frog_recoveredCultivables += BarbaDellInciampo
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has BastoneDellOzioso}  \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(BastoneDellOzioso)}.
            ~  frog_recoveredCultivables += BastoneDellOzioso
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has BrinaDellImpossibile}  \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(BrinaDellImpossibile)}.
            ~  frog_recoveredCultivables += BrinaDellImpossibile
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has CantoDelleCompagne}   \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(CantoDelleCompagne)}.
            ~  frog_recoveredCultivables += CantoDelleCompagne
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has CardoAspinato}  \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(CardoAspinato)}.
            ~  frog_recoveredCultivables += CardoAspinato
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has EderaDelleAmanti}  \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(EderaDelleAmanti)}.
            ~  frog_recoveredCultivables += EderaDelleAmanti
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has ErbaLiccia}  \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(ErbaLiccia)}.
            ~  frog_recoveredCultivables += ErbaLiccia
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has FalsaPalude}  \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(FalsaPalude)}.
            ~  frog_recoveredCultivables += FalsaPalude
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has LanaNotturna}  \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(LanaNotturna)}.
            ~  frog_recoveredCultivables += LanaNotturna
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has LicheneDegliAbissi}  \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(LicheneDegliAbissi)}.
            ~  frog_recoveredCultivables += LicheneDegliAbissi
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has NonTiScordarDiTe}  \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(NonTiScordarDiTe)}.
            ~  frog_recoveredCultivables += NonTiScordarDiTe
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has Olobino}  \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(Olobino)}.
            ~  frog_recoveredCultivables += Olobino
            -> franco_afterRecovery
            
    + {frog_recoverableCultivables has LaSpazzata}  \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(LaSpazzata)}.
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
    
    {charTag(Franco, "party")}:                     E allora girino, eccoti di nuovo a disposizione {sigils_translator(sigil)}!
                                                    Fanne buon uso!





=== franco_afterRecovery
    //Oggetti
    {debug_frog: passo mission_objects.}
        
    ~ temp recoveredCultivable = LIST_RANDOM(frog_recoveredCultivables)

        {charTag(Franco, "party")}:                     Signori e signore e signor3, ecco quanto richiesto dal girino: {ingredientTranslator(recoveredCultivable)}!
                                                        Direttamente nella collezione di {player_name}!

            ~ backpack_findedGifts += recoveredCultivable
            
            //Levo la possibilità di recuperare il coltivabile
            ~ frog_otherGifts -= cultivableRecovery
        
    -> closed_exchange
