                                    /* ---------------------------------
                                    
                                                Gestione missioni 
                                    
                                     ----------------------------------*/

    //Lista di tutto ciò che può generare una missione
    LIST missionAboutChar = missionCharOne, missionCharTwo, missionCharThree, missionCharFour, missionCharFive, missionObjects, specialDelivery
    
    //Lista di tutte le missioni che la rana può offrire, e quelle completate. Nota: missionOne etc son nomi temporanei, che verranno aggiornati man mano che le creo
    LIST allMissions = missionOne, missionTwo, missionThree, missionFour, missionFive, missionSix, missionSeven, missionEight, specialMissionOne, specialMissionTwo, specialMissionThree, specialMissionFour
        //Separo la lista totale da quelle disponibili anche per un discorso di TW
    VAR availableMissions = (missionOne, missionTwo, missionThree, missionFour, missionFive, missionSix, missionSeven, missionEight)
        //Nota: per ora sono solo due missioni speciali, poi vediamo.
    VAR availableSpecialMissions = (specialMissionOne, specialMissionTwo)
    
    VAR currentMissionAboutChar = ()
    VAR activeMissions = ()
    
    VAR witchNotification = false

    VAR diceFrog = 0
    VAR maxValueDice = ()
    VAR maxSpecialValueDice = ()
        
        //Pausa tra una missione speciale e l'altra
    VAR pauseSpecialMission = 0
    VAR pauseSpecialMissionMax = 1



                                    /* ---------------------------------
                                    
                                                Gestione doni 
                                    
                                     ----------------------------------*/

//Lista di tutto ciò che posso "donare" per ogni personaggia
    LIST allCharOneGifts = charOneCultivable, charOneCooking, charOneEmotionalWord, charOneLibrary
    LIST allCharTwoGifts = charTwoCultivable, charTwoCooking, charTwoEmotionalWord, charTwoLibrary
    LIST universalGifts = universalIngredient
    
    //Devo poi tracciare la quantità di cose che rana mi può dare su una persona, e che sono per lo più legate a nodi, perché sono il dono giusto, le scelte giuste da dire, al max una formula utile per parlare con quella persona.
    VAR charOneGifts = ()
    VAR charTwoGifts = ()
        
        //Questa lista traccia i coltivabili che sono stati utilizzati in giro per il gioco. La rana pescherà i disponibili da qui.
    VAR recoverableCultivables = ()
    
        //Serve o serviva per tracciare il coltivabile "prenotato" dalla giocatrice prima di concludere la missione.
    VAR searchedCultivableRecovery = ()
    
                                    /* ---------------------------------
                                    
                                                Gestione riposo rana 
                                    
                                     ----------------------------------*/
                                     
    VAR tiredFrog = 0
    VAR maxTiredFrog = 3