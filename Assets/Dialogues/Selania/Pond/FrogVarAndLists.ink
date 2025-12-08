                                    /* ---------------------------------
                                    
                                                Gestione missioni 
                                    
                                     ----------------------------------*/

    //Lista di tutto ciò che può generare una missione
    LIST frog_missionAboutChar = missionCharOne, missionCharTwo, missionCharThree, missionCharFour, missionCharFive, missionObjects, specialDelivery
    
    //Lista di tutte le missioni che la rana può offrire, e quelle completate. Nota: missionOne etc son nomi temporanei, che verranno aggiornati man mano che le creo
    LIST frog_allMissions = missionOne, missionTwo, missionThree, missionFour, missionFive, missionSix, missionSeven, missionEight, specialMissionOne, specialMissionTwo, specialMissionThree, specialMissionFour
        //Separo la lista totale da quelle disponibili anche per un discorso di TW
    VAR frog_availableCommonMissions = (missionOne, missionTwo, missionThree, missionFour, missionFive, missionSix, missionSeven, missionEight)
        //Nota: per ora sono solo due missioni speciali, poi vediamo.
    VAR frog_availableSpecialMissions = (specialMissionTwo)
    
    VAR frog_aboutGiftRequest = ()
    VAR frog_currentMission = ()
    
    VAR frog_witch_notification = false

    VAR frog_randomMissionDice = 0
    VAR frog_maxValueRandomMissionDice = ()

        //Pausa tra una missione speciale e l'altra
    VAR frog_pauseSpecialMission = 0
    VAR frog_pauseSpecialMissionMax = 1

    //Altro
    VAR frog_nameDiscovered = false


                                    /* ---------------------------------
                                    
                                                Gestione doni 
                                    
                                     ----------------------------------*/

//Lista di tutto ciò che posso "donare" per ogni personaggia
    LIST frog_firstCharAllPossibleGifts = charOneCultivable, charOneCooking, charOneEmotionalWord, charOneLibrary
    LIST frog_secondCharAllPossibleGifts = charTwoCultivable, charTwoCooking, charTwoEmotionalWord, charTwoLibrary
    LIST frog_universalGifts = universalIngredient
    
    //Devo poi tracciare la quantità di cose che rana mi può dare su una persona, e che sono per lo più legate a nodi, perché sono il dono giusto, le scelte giuste da dire, al max una formula utile per parlare con quella persona.
    VAR frog_firstCharObtainedGifts = ()
    VAR frog_secondCharObtainedGifts = ()
        
        //Questa lista traccia i coltivabili che sono stati utilizzati in giro per il gioco. La rana pescherà i disponibili da qui.
    VAR frog_recoverableCultivables = ()
    VAR frog_recoveredCultivables = ()
    
        //Serve o serviva per tracciare il coltivabile "prenotato" dalla giocatrice prima di concludere la missione.
    VAR frog_cultivableRequested = ()
    
    
                                    /* ---------------------------------
                                    
                                                Gestione riposo rana 
                                    
                                     ----------------------------------*/
                                     
    VAR frog_tiredValue = 0
    VAR frog_maxTiredValue = 3