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
                - else:
                    ~ frog_giftability = true
            }

        - frog_secondCharAchievableGifts != () && secondChar_storyStatus == story_storyStarted:
            {
                - frog_secondCharAchievableGifts == ingredientGift && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_giftability = false
                - else:
                    ~ frog_giftability = true
            }

        - frog_thirdCharAchievableGifts != () && thirdChar_storyStatus == story_storyStarted:
            {
                - frog_thirdCharAchievableGifts == ingredientGift && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_giftability = false
                - else:
                    ~ frog_giftability = true
            }

        - frog_fourthCharAchievableGifts != () && fourthChar_storyStatus == story_storyStarted:
            {
                - frog_fourthCharAchievableGifts == ingredientGift && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_giftability = false
                - else:
                    ~ frog_giftability = true
            }

        - frog_fifthCharAchievableGifts != () && fifthChar_storyStatus == story_storyStarted:
            {
                - frog_fifthCharAchievableGifts == ingredientGift && player_accessiblePlaces hasnt Kitchen:
                    ~ frog_giftability = false
                - else:
                    ~ frog_giftability = true
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
        -> frog_about_who_questions

  
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