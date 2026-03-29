=== function strings_francoMissions()
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)


    {frog_currentMission:
        - missionOne:
            ~ return
                "Franco ha invitato {player_name} <b>a leggere altre pagine di questo libro, e poi tornare da lui."
            
        - missionTwo:
            ~ return
                "Franco ha chiesto a {player_name} <b>di coltivare almeno tre piante alla serra prima di tornare da lui."

        - missionThree:
            ~ return
                "Franco ha chiesto a {player_name} <b>di ricevere dei consigli a {mentorName} su come star bene, e poi tornare da lui."
            
        - missionFour:
            ~ return
                "Franco ha chiesto a {player_name} <b>di raccontare a {mentorName} le cose strane che {player_pronouns has him:gli|{player_pronouns has her:le|lə}} sono accadute da quando è qui, e poi tornare da lui."
            
        - missionFive:
            ~ return
                "Franco ha chiesto a {player_name} <b>di vedere cosa succede se {charNameOne} e {charNameTwo} sono assieme, e poi tornare da lui."
            
        - missionSix:
            ~ return
                "Franco ha chiesto a {player_name} <b>di parlare all'albero al centro della foresta, e poi tornare da lui."
            
        - missionSeven:
            ~ return
                "Franco ha chiesto a {player_name} <b>di leggere la lettera che {player_pronouns has him:gli|{player_pronouns has her:le|lə}} è arrivata in stazione, e poi tornare da lui."
            
        - missionEight:
            ~ return
                "Franco ha chiesto a {player_name} <b>di leggere qualcosa in biblioteca, e poi tornare da lui."
        
        - specialMissionOne:
            ~ return
                "Franco ha detto a {player_name} di raggiungerlo al Nido."
            
        - specialMissionTwo:
                "Franco ha chiesto a {player_name} <b>di raggiungerlo in cucina."

    }



=== function print_francoMissions()
    ~ temp testoDaStampare = strings_francoMissions()
    {testoDaStampare}