                                    /* ---------------------------------
                                    
                                                Gestione missioni 
                                    
                                     ----------------------------------*/

    //Lista di tutto ciò che può generare una missione
    LIST frog_missionAboutChar = missionCharOne, missionCharTwo, missionCharThree, missionCharFour, missionCharFive, missionObjects, specialDelivery
    
    //Lista di tutte le missioni che la rana può offrire, e quelle completate. Nota: missionOne etc son nomi temporanei, che verranno aggiornati man mano che le creo
    LIST frog_allMissions = missionOne, missionTwo, missionThree, missionFour, missionFive, missionSix, missionSeven, missionEight, specialMissionOne, specialMissionTwo
        //Separo la lista totale da quelle disponibili anche per un discorso di TW
    VAR frog_availableCommonMissions = (missionOne, missionTwo, missionThree, missionFour, missionSix, missionSeven, missionEight)
        //Nota: per ora sono solo due missioni speciali, poi vediamo.
    VAR frog_availableSpecialMissions = (missionFive, specialMissionOne, specialMissionTwo)

        //Lista a inizio gioco di tutte le missioni di Franco.
    VAR frog_allAvailableMissions = ()
        //Lista delle missioni completate
    VAR frog_allMissionsCompleted = ()
        //Lista delle missioni completate ma non riscattate
    VAR frog_updatedMissions = ()
        //E la missione corrente
    VAR frog_currentMission = ()
    //Pausa tra una missione speciale e l'altra
    VAR frog_pauseSpecialMission = 0
    VAR frog_pauseSpecialMissionMax = 1


                                    /* ---------------------------------
                                    
                                                Gestione doni 
                                    
                                     ----------------------------------*/

//Lista di tutto ciò che posso "donare" per ogni personaggia
    LIST frog_allCharactersGifts = (cultivableGift), (ingredientGift), (bookGift)
    LIST frog_uniqueGifts = (universalIngredient), (cultivableRecovery), (sigilRecovery)
    

    //Devo poi tracciare la quantità di cose che rana mi può dare su una persona, e che sono per lo più legate a nodi, perché sono il dono giusto, le scelte giuste da dire, al max una formula utile per parlare con quella persona.
    VAR frog_firstCharAchievableGifts = ()
    VAR frog_secondCharAchievableGifts = ()
    VAR frog_thirdCharAchievableGifts = ()
    VAR frog_fourthCharAchievableGifts = ()
    VAR frog_fifthCharAchievableGifts = ()
    VAR frog_otherGifts = ()
 
        
    //Questa lista traccia i coltivabili che sono stati utilizzati in giro per il gioco. La rana pescherà i disponibili da qui.
    VAR frog_recoverableCultivables = ()
    VAR frog_recoveredCultivables = ()
    
    //Serve o serviva per tracciare il coltivabile "prenotato" dalla giocatrice prima di concludere la missione.
    VAR frog_cultivableRequested = ()
    
    //Per chi abbiamo richiesto il dono
    VAR frog_aboutGiftRequest = ()

    //Dono in sospeso
    VAR frog_suspended_gift = false

    //Stato donabilità
    VAR frog_giftability = true
        
    
    
                                    /* ---------------------------------
                                    
                                            Gestione Franco
                                    
                                     ----------------------------------*/
                                     
    VAR frog_tiredValue = 0
    VAR frog_maxTiredValue = 3
    
    VAR frog_nameDiscovered = false