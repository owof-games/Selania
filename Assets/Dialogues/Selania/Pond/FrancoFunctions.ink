=== function franco_missionsStateUpdater()
//La logica qui è quella di avere un unico canale per vedere se le condizioni per una missione sono state raggiunte o meno.
    {  
        //Prima missione: leggere.
        - first_character_recap.check && second_character_recap.check && greenhouse_recap.check && frog_allMissionsCompleted hasnt missionOne:
            ~ frog_updatedMissions += missionOne
    }

    {
        //Seconda missione: coltivare.
        - LIST_COUNT(greenhouse_findedCultivables) == 3 && frog_allMissionsCompleted hasnt missionTwo:
            ~ frog_updatedMissions += missionTwo
    }

    {
        //Terza missione: parlare di mindfulness con Mentore.
        - mindfulness && frog_allMissionsCompleted hasnt missionThree:
            ~ frog_updatedMissions += missionThree

    }

    {
        //Quarta missione: parlare di cose strane con Mentore.
        - little_storylets && frog_allMissionsCompleted hasnt missionFour:
            ~ frog_updatedMissions += missionFour

    }

    {
        //Quinta missione: assistere a una conversazione a due.
        - grimoire_firstChar has grimFirstSecondChar && frog_allMissionsCompleted hasnt missionFive:
            ~ frog_updatedMissions += missionFive

    }

    {
        //Sesta missione: conoscere la strega.
        - grimoire_witch has grimWitchIntro && frog_allMissionsCompleted hasnt missionSix:
            ~ frog_updatedMissions += missionSix

    }

    {
        //Settima missione: leggere una lettera.
        - (grimoire_firstChar has grimFirstCharLetterOne or grimoire_secondChar has grimSecondCharLetterOne or grimoire_thirdChar has grimThirdCharLetterOne) && frog_allMissionsCompleted hasnt missionSeven:
            ~ frog_updatedMissions += missionSeven

    }

    {
        //Ottava missione: leggere un racconto.
        - library_readStories != () && frog_allMissionsCompleted hasnt missionEight:
            ~ frog_updatedMissions += missionEight

    }


=== function franco_giftsStateUpdater()
//Prima di tutto aggiorno lo stato delle azioni che la giocatrice può aver fatto senza Franco.
    {
        //Ho già fatto il dono (ed è il primo check)
        - firstChar_giftedObject != () && frog_firstCharAchievableGifts has cultivableGift:
                ~ frog_firstCharAchievableGifts -= cultivableGift

        //Ho già cucinato (ed è il primo check). Traccio il nodo più vicino alla fine per prevenire problemi con eventuali crush del gioco
        - grimoire_firstChar has grimFirstCharKitchenEnded && frog_firstCharAchievableGifts has ingredientGift:
                ~ frog_firstCharAchievableGifts -= ingredientGift
    }
    
    
    {
        //Ho già fatto il dono (ed è il primo check)
        - secondChar_giftedObject != () && frog_secondCharAchievableGifts has cultivableGift:
                ~ frog_secondCharAchievableGifts -= cultivableGift
                
        //Ho già cucinato (ed è il primo check). Traccio il nodo più vicino alla fine per prevenire problemi con eventuali crush del gioco
        - grimoire_secondChar has grimSecondCharKitchenEnded && frog_secondCharAchievableGifts has ingredientGift:
                ~ frog_secondCharAchievableGifts -= ingredientGift
    
    }

    {
        //Ho già fatto il dono (ed è il primo check)
        - thirdChar_giftedObject != () && frog_thirdCharAchievableGifts has cultivableGift:
                ~ frog_thirdCharAchievableGifts -= cultivableGift
                
        //Ho già cucinato (ed è il primo check). Traccio il nodo più vicino alla fine per prevenire problemi con eventuali crush del gioco
        - grimoire_thirdChar has grimThirdCharKitchenEnded && frog_thirdCharAchievableGifts has ingredientGift:
                ~ frog_thirdCharAchievableGifts -= ingredientGift
    
    }

//Poi voglio vedere in generale in questo momento posso dare dei doni alla giocatrice
    {
        - frog_firstCharAchievableGifts != () && firstChar_storyStatus == story_storyStarted:
            {
                - frog_firstCharAchievableGifts == ingredientGift && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_giftability = false
                    ~ frog_firstCharGiftable = false

                - frog_firstCharAchievableGifts == bookGift && player_accessiblePlaces hasnt Library:
                    ~ frog_giftability = false
                    ~ frog_firstCharGiftable = false

                - else:
                    ~ frog_giftability = true
                    ~ frog_firstCharGiftable = true
            }

        - frog_secondCharAchievableGifts != () && secondChar_storyStatus == story_storyStarted:
            {
                - frog_secondCharAchievableGifts == ingredientGift && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_giftability = false
                    ~ frog_secondCharGiftable = false

                - frog_secondCharAchievableGifts == bookGift && player_accessiblePlaces hasnt Library:
                    ~ frog_giftability = false
                    ~ frog_secondCharGiftable = false

                - else:
                    ~ frog_giftability = true
                    ~ frog_secondCharGiftable = true
            }

        - frog_thirdCharAchievableGifts != () && thirdChar_storyStatus == story_storyStarted:
            {
                - frog_thirdCharAchievableGifts == ingredientGift && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_giftability = false
                    ~ frog_thirdCharGiftable = false

                - frog_thirdCharAchievableGifts == bookGift && player_accessiblePlaces hasnt Library:
                    ~ frog_giftability = false
                    ~ frog_thirdCharGiftable = false  

                - else:
                    ~ frog_giftability = true
                    ~ frog_thirdCharGiftable = true
            }

        - frog_fourthCharAchievableGifts != () && fourthChar_storyStatus == story_storyStarted:
            {
                - frog_fourthCharAchievableGifts == ingredientGift && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_giftability = false
                    ~ frog_fourthCharGiftable = false
                    //Se la cucina non è aperta ora, non si aprirà più.
                    ~ frog_fourthCharAchievableGifts -= ingredientGift

                - frog_fourthCharAchievableGifts == bookGift && player_accessiblePlaces hasnt Library:
                    ~ frog_giftability = false
                    ~ frog_fourthCharGiftable = false
                    //Se la biblioteca non è aperta ora, non si aprirà più
                    ~ frog_fourthCharAchievableGifts -= bookGift

                - else:
                    ~ frog_giftability = true
                    ~ frog_fourthCharGiftable = true
            }

        - frog_fifthCharAchievableGifts != () && fifthChar_storyStatus == story_storyStarted:
            {
                - frog_fifthCharAchievableGifts == ingredientGift && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_giftability = false
                    ~ frog_fifthCharGiftable = false
                    //Se la cucina non è aperta ora, non si aprirà più.
                    ~ frog_fifthCharAchievableGifts -= ingredientGift

                - frog_fifthCharAchievableGifts == bookGift && player_accessiblePlaces hasnt Library:
                    ~ frog_giftability = false
                    ~ frog_fifthCharGiftable = false
                    //Se la biblioteca non è aperta ora, non si aprirà più
                    ~ frog_fifthCharAchievableGifts -= bookGift

                - else:
                    ~ frog_giftability = true
                    ~ frog_fifthCharGiftable = true
            } 
        
        - else:                    
            ~ frog_giftability = false
    }



=== franco_missionsDispatcher
//Primo step: verifico se ci sono missioni da togliere dalla lista perché non sono state raggiunte le condizioni per attivarle.

    //Missione sei richiede invito strega a parlarle
    {
        - frog_allMissionsCompleted hasnt missionSix && player_accessiblePlaces has Dump:
            ~ frog_availableCommonMissions += missionSix

        - else:
            ~ frog_availableCommonMissions -= missionSix        
    }


    //Missione sette richiede la presenza di Ursula alla stazione
    {
        - frog_allMissionsCompleted hasnt missionSeven && (contentsTrainStop has DoggoFirstLetters) or (contentsTrainStop has DoggoSecondLetters) or (contentsTrainStop has DoggoThirdLetters):
            ~ frog_availableCommonMissions += missionSeven

        - else:
            ~ frog_availableCommonMissions -= missionSeven        
    }

    //Missione otto richiede che la biblioteca sia aperta
    {
        - frog_allMissionsCompleted hasnt missionEight && player_accessiblePlaces has Library:
            ~ frog_availableCommonMissions += missionEight

        - else:
            ~ frog_availableCommonMissions -= missionEight        
    }

    //Missione speciale uno richiede l'apertura del nido e che sia stato creato almeno un sigillo. Strega all'inizio ce ne dona tre, per cui il conto è >3.
    {
        - frog_allMissionsCompleted hasnt specialMissionOne && player_accessiblePlaces has Nest && LIST_COUNT(glyph_discoveredSigils) > 3:
            ~ frog_availableSpecialMissions += specialMissionOne

        - else:
            ~ frog_availableSpecialMissions -= specialMissionOne        
    }

    //Missione speciale due richiede l'apertura della cucina e che sia vuota.
    {
        - frog_allMissionsCompleted hasnt specialMissionTwo && player_accessiblePlaces has Kitchen:
            ~ frog_availableSpecialMissions += specialMissionTwo

        - else:
            ~ frog_availableSpecialMissions -= specialMissionTwo        
    }


//Secondo step, assegno una missione a caso, passando prima da quelle prioritarie, e poi dalle altre.
    ~ temp newMission = ()
    {
        - frog_availableSpecialMissions != ():
            ~ newMission = LIST_RANDOM(frog_availableSpecialMissions)
            ~ frog_currentMission += newMission
            ~ frog_availableSpecialMissions -= newMission

        - frog_availableCommonMissions != ():
            ~ newMission = LIST_RANDOM(frog_availableCommonMissions)
            ~ frog_currentMission += newMission
            ~ frog_availableCommonMissions -= newMission

        - else:
            {
                - LIST_COUNT(frog_allMissionsCompleted) < LIST_COUNT(frog_allAvailableMissions):
                    Girino! #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Per ora non ho missioni da offrirti, ma non ti preoccupare, qualcosa poi me lo invento!
                    Torna più tardi.
                    E fatti anche tu un pisolino!
                        -> main

                - else:
                    Girino! #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Ma sai che hai fatto tuuuuuuutto quello che posso offrirti?
                    Però possiamo rilassarci assieme!
                        -> main

            }    

    }

//Terzo step: faccio il dispatch effettivo delle missioni.
    {newMission:
        
        - missionOne:
            -> mission_one

        - missionTwo:
            -> mission_two

        - missionThree:
            -> mission_three

        - missionFour:
            -> mission_four

        - missionFive:
            -> mission_five

        - missionSix:
            -> mission_six

        - missionSeven:
            -> mission_seven

        - missionEight:
            -> mission_eight

        - specialMissionOne:
            -> special_mission_one

        - specialMissionTwo:
            -> special_mission_two
    }

->->


=== cultivable_recovery
{debug_frog: passo da cultivable_recovery.}
Vorrei recuperare...#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral

    + {frog_recoverableCultivables has BaccaDellaAddolorata} ...{ingredientTranslator(BaccaDellaAddolorata)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = BaccaDellaAddolorata
            ~  frog_recoveredCultivables += BaccaDellaAddolorata
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has BarbaDellInciampo} ...{ingredientTranslator(BarbaDellInciampo)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = BarbaDellInciampo
            ~  frog_recoveredCultivables += BarbaDellInciampo
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has BastoneDellOzioso} ...{ingredientTranslator(BastoneDellOzioso)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = BastoneDellOzioso
            ~  frog_recoveredCultivables += BastoneDellOzioso
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has BrinaDellImpossibile} ...{ingredientTranslator(BrinaDellImpossibile)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = BrinaDellImpossibile
            ~  frog_recoveredCultivables += BrinaDellImpossibile
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has CantoDelleCompagne}  ...{ingredientTranslator(CantoDelleCompagne)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = CantoDelleCompagne
            ~  frog_recoveredCultivables += CantoDelleCompagne
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has CardoAspinato} ...{ingredientTranslator(CardoAspinato)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = CardoAspinato
            ~  frog_recoveredCultivables += CardoAspinato
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has EderaDelleAmanti} ...{ingredientTranslator(EderaDelleAmanti)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = EderaDelleAmanti
            ~  frog_recoveredCultivables += EderaDelleAmanti
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has ErbaLiccia} ...{ingredientTranslator(ErbaLiccia)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = ErbaLiccia
            ~  frog_recoveredCultivables += ErbaLiccia
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has FalsaPalude} ...{ingredientTranslator(FalsaPalude)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = FalsaPalude
            ~  frog_recoveredCultivables += FalsaPalude
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has LanaNotturna} ...{ingredientTranslator(LanaNotturna)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = LanaNotturna
            ~  frog_recoveredCultivables += LanaNotturna
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has LicheneDegliAbissi} ...{ingredientTranslator(LicheneDegliAbissi)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = LicheneDegliAbissi
            ~  frog_recoveredCultivables += LicheneDegliAbissi
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has NonTiScordarDiTe} ...{ingredientTranslator(NonTiScordarDiTe)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = NonTiScordarDiTe
            ~  frog_recoveredCultivables += NonTiScordarDiTe
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has Olobino} ...{ingredientTranslator(Olobino)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = Olobino
            ~  frog_recoveredCultivables += Olobino
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has LaSpazzata} ...{ingredientTranslator(LaSpazzata)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = LaSpazzata
            ~  frog_recoveredCultivables += LaSpazzata
            -> frog_gift_dispatcher
            
    
    + Ho cambiato idea
        -> franco_giftsManagement

  
=== tired_frog
{debug_frog: passo da tired_frog.}
 ~ temp dice = RANDOM(1,5)
 
{
    - frog_tiredValue > 0:
        -> top
        
    - dice == 5:
        ~ frog_tiredValue = frog_maxTiredValue
            -> top
    
}
    
- (top)

    Girino! #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Franco è stanchino ora.
    Torna più tardi e provo a darti una zampa.
    Basta che poi me la restituisci, sennò non so come grattare la schiena di zio Gracco.

-> main



=== franco_giftsPlants(PNG)
~ temp frog_temp_char_gift = ""
~ temp frog_temp_temp_growing_gift = false
~ temp tempChar_favouritesGifts = ()
~ temp speaker = ()
~ temp frog_temp_char_ingredient = ""

    //Check preliminare    
    {
        - PNG == FirstCharacter:
            ~ tempChar_favouritesGifts = firstChar_favouritesGifts
            ~ speaker = FirstCharacter

        - PNG == SecondCharacter:
            ~ tempChar_favouritesGifts = secondChar_favouritesGifts
            ~ speaker = SecondCharacter

        - PNG == ThirdCharacter:
            ~ tempChar_favouritesGifts = thirdChar_favouritesGifts
            ~ speaker = ThirdCharacter

        - PNG == FourthCharacter:
            ~ tempChar_favouritesGifts = fourthChar_favouritesGifts
            ~ speaker = FourthCharacter
            
        - PNG == FifthCharacter:
            ~ tempChar_favouritesGifts = fifthChar_favouritesGifts
            ~ speaker = FifthCharacter                
    }



   {
        //Caso uno: il dono è in crescita:
        - tempChar_favouritesGifts has greenhouse_chosenCultivable:
            Girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            Quello che ti serve sta crescendo proprio ora in serra!
            Sento l'odore fino a qui.
            O forse è solo zia Graaak che non si è ancora lavata.
                ~ frog_temp_char_gift = "sta crescendo proprio ora in serra!"
                ~ frog_temp_temp_growing_gift = true

        //Caso due: il dono è nello zaino
        - backpack_findedGifts ^ tempChar_favouritesGifts != ():
            ~ temp findedFavourite = backpack_findedGifts ^ tempChar_favouritesGifts
            ~ temp backGift = LIST_RANDOM(findedFavourite)
                
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
                    
                    - LicheneDegliAbissi:
                        Ci sono relazioni che non sono sane. E c'è una pianta che le racconta. Quale?
                            ~ frog_temp_char_ingredient = "ci sono relazioni che non sono sane. E c'è una pianta che le racconta. Quale?"

                    - NonTiScordarDiTe: 
                        Qualcosa che parli di chi fa parte di noi, delle nostre radici.
                             ~ frog_temp_char_ingredient = "qualcosa che parli di chi fa parte di noi, delle nostre radici"        


                }



        //Caso tre: non abbiamo mai trovato il dono
        - tempChar_favouritesGifts ^ greenhouse_findedCultivables == ():

            Allora?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            Scusa se ho spiato nello zaino ma no, non hai niente di utile.
            Ma ora ci penso io.
            "Care formiche."
            "Come avrete visto, ora sono vegetariano."
            "E in onore di questa nostra nuova amicizia vi chiederei un favore: potreste coltivare qualcosa di utile per {player_name}?"
            "Grazie mille."
            "PS.: Vi allego un po' del miele di Dora."
            Ottimo.
            La prossima volta che coltivi qualcosa in serra vedrai che sarà il dono giusto!

                ~ temp perfectGift = LIST_RANDOM(tempChar_favouritesGifts)

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

            Girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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

        - PNG == SecondCharacter:
            ~ frog_second_char_gift = frog_temp_char_gift
            ~ frog_second_temp_growing_gift = frog_temp_temp_growing_gift

        - PNG == ThirdCharacter:
            ~ frog_third_char_gift = frog_temp_char_gift
            ~ frog_third_temp_growing_gift = frog_temp_temp_growing_gift

        // - PNG == FourthCharacter:
        //     ~ frog_fourth_char_gift = frog_temp_char_gift
        //     ~ frog_fourth_temp_growing_gift = frog_temp_temp_growing_gift

        // - PNG == FifthCharacter:
        //     ~ frog_fifth_char_gift = frog_temp_char_gift
        //     ~ frog_fifth_temp_growing_gift = frog_temp_temp_growing_gift                

    }


->->











->->