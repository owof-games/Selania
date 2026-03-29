=== function strings_francoMissions()
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)


    {frog_currentMission:
        - missionOne:
            ~ return
                "Franco ha invitato {player_name} a leggere altre pagine di questo libro."
            
        - missionTwo:
            ~ return
                "Franco ha chiesto a {player_name} di coltivare almeno tre piante alla serra."

        - missionThree:
            ~ return
                "Franco ha chiesto a {player_name} di ricevere dei consigli a {mentorName} su come star bene."
            
        - missionFour:
            ~ return
                "Franco ha chiesto a {player_name} di raccontare a {mentorName} le cose strane che {player_pronouns has him:gli|{player_pronouns has her:le|lə}} sono accadute da quando è qui."
            
        - missionFive:
            ~ return
                "Franco ha chiesto a {player_name} di vedere cosa succede se {charNameOne} e {charNameTwo} sono assieme."
            
        - missionSix:
            ~ return
                "Franco ha chiesto a {player_name} di parlare all'albero al centro della foresta."
            
        - missionSeven:
            ~ return
                "Franco ha chiesto a {player_name} di leggere la lettera che è arrivata in stazione."
            
        - missionEight:
            ~ return
                "Franco ha chiesto a {player_name} di leggere qualcosa in biblioteca."
        
        - specialMissionOne:
            ~ return
                "Franco ha detto a {player_name} di raggiungerlo al Nido."
            
        - specialMissionTwo:
                "Franco ha chiesto a {player_name} di raggiungerlo in cucina."

    }



=== function print_francoMissions()
    ~ temp testoDaStampare = strings_francoMissions()
    {testoDaStampare}