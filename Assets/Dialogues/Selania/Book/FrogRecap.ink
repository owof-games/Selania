=== frog_character_recap
+ (check){are_two_entities_together(FrogRecap, PG)} [FrogRecap]
    ~ enableBigDialogue()
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
C'è una rana bluastra dalle parti dello stagno, e sembra propensa a darmi una mano. <>
    
    {activeMissions:
        - missionOne:
            Mi ha invitato a leggere questo libro, e poi tornare da lei.
            
        - missionTwo:
            Mi ha chiesto di coltivare almeno tre piante alla serra prima di tornare da lei. Ad ora ne ho coltivate: {14 - LIST_COUNT(backupCultivable)}.
            //Nota: questa cosa potrebbe generare errori se viene levata una pianta per via del trigger warning.
            
        - missionThree:
            Mi ha chiesto di chiedere dei consigli a {charNameFive} su come star bene, e poi tornare da lei.
            
        - missionFour:
            Mi ha chiesto di raccontare a {charNameFive} le cose strane che mi sono accadute da quando sono qui, e poi tornare da lei.
            
        - missionFive:
            Mi ha chiesto di vedere cosa succede se {charNameOne} e {charNameTwo} sono assieme, e poi tornare da lei.
            
        - missionSix:
            Mi ha chiesto di parlare a quell'albero al centro della foresta, e poi tornare da lei.
            
        - missionSeven:
            Mi ha chiesto di leggere la lettera che mi è arrivata, e che si trova sulla bacheca della fermata del treno, e poi tornare da lei.
            
        - missionEight:
            Mi ha chiesto di leggermi qualcosa in biblioteca, e poi tornare da lei.
            
        - specialMissionOne:
            Mi ha detto che c'è della tensione tra {charNameTwo} e {charNameFive}, e per questo di vedere cosa sta accadendo, e poi tornare da lei.
            
        - specialMissionTwo:
            Mi ha chiesto di cucinare qualcosa da {player_pronouns has him:solo|{player_pronouns has her:sola|solə}}, e poi tornare da lei.
            
        - else: Per ora non ci sono missioni attive.
    }



-> rewriter_book_with_flow
