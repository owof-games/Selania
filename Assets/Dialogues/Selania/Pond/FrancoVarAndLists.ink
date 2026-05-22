                                    /* ---------------------------------
                                    
                                                Gestione commissioni 
                                    
                                     ----------------------------------*/

    //Lista di tutte le commissioni che la rana può offrire, e quelle completate.
    LIST frog_allMissions = missionOne, missionTwo, missionThree, missionFour, missionFive, missionSix, missionSeven, missionEight, missionNine, missionTen, specialMissionOne, specialMissionTwo
        //Separo la lista totale da quelle disponibili anche per un discorso di TW
    VAR frog_availableCommonMissions = (missionOne, missionTwo, missionThree, missionFour, missionSix, missionSeven, missionEight, missionNine, missionTen)
    VAR frog_availableSpecialMissions = (specialMissionOne, missionFive, specialMissionTwo)

        //Lista a inizio gioco di tutte le commissioni di Franco.
    VAR frog_allAvailableMissions = ()
        //Lista delle commissioni completate
    VAR frog_allMissionsCompleted = ()
        //Lista delle commissioni completate ma non riscattate
    VAR frog_updatedMissions = ()
        //E la commissione corrente
    VAR frog_currentMission = ()

        //Infine, pauso le commissioni speciali
    VAR frog_pauseSpecialMission = 0
    VAR frog_pauseSpecialMissionMax = 4


                                    /* ---------------------------------
                                    
                                                Gestione doni 
                                    
                                     ----------------------------------*/

//Lista di tutto ciò che posso "donare" per ogni personaggia
    LIST frog_allCharactersGifts = (cultivableGift), (ingredientGift), (bookGift)
    LIST frog_uniqueGifts = (universalIngredient), (cultivableRecovery), (sigilRecovery)
    

    //Devo poi tracciare la quantità di cose che rana mi può dare su una persona, e che sono per lo più legate a nodi, perché sono il dono giusto, le scelte giuste da dire, al max una formula utile per parlare con quella persona.
    VAR frog_firstCharAchievableGifts = ()
        VAR frog_firstCharGiftable = false
    VAR frog_secondCharAchievableGifts = ()
        VAR frog_secondCharGiftable = false
    VAR frog_thirdCharAchievableGifts = ()
        VAR frog_thirdCharGiftable = false
    VAR frog_fourthCharAchievableGifts = ()
        VAR frog_fourthCharGiftable = false
    VAR frog_fifthCharAchievableGifts = ()
        VAR frog_fifthCharGiftable = false
    VAR frog_otherGifts = ()
 
        
    //Questa lista traccia i coltivabili che sono stati utilizzati in giro per il gioco. La rana pescherà i disponibili da qui.
    VAR frog_recoverableCultivables = ()
    VAR frog_recoveredCultivables = ()
    VAR frog_cultivableGiftable = false

    //Questa lista si segna quale sigillo abbiamo riabilitato e se è possibile o meno recuperarne uno.
    VAR frog_recoveredSigil = ()
    VAR frog_sigilGiftable = false
    

    //Dono in sospeso
    VAR frog_suspended_gift = false

    //Stato donabilità
    VAR frog_giftability = true
        
    
    
                                    /* ---------------------------------
                                    
                                            Gestione Franco
                                    
                                     ----------------------------------*/
                                     
    VAR frog_tiredValue = 0
    VAR frog_maxTiredValue = 3

    VAR frog_justPaused = false
    
    VAR frog_nameDiscovered = false

    //pausa dialoghi tra PNG e Franco, così da non farli arrivare tutti assieme
    VAR frog_commonStoryletsPause = 0
    VAR frog_commonStoryletsPauseMaxValue = 8