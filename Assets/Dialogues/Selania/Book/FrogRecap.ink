=== frog_character_recap
+ (check){are_two_entities_together(FrogRecap, PG)} [FrogRecap]
    ~ enableBigDialogue()
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
Franco la rana vuole aiutare {player_name} nel suo percorso. <>
    
    <b>{frog_currentMission:
        - missionOne:
            Franco ha invitato {player_name}a leggere altre pagine di questo libro, e poi tornare da lui.<>
            
        - missionTwo:
            Franco ha chiesto a {player_name} di coltivare almeno tre piante alla serra prima di tornare da lui. Ad ora {player_name} ne ha coltivate: {14 - LIST_COUNT(greenhouse_backupCultivable)}.
  
        - missionThree:
            Franco ha chiesto a {player_name} di ricevere dei consigli a {mentorName} su come star bene, e poi tornare da lui.<>
            
        - missionFour:
            Franco ha chiesto a {player_name} di raccontare a {mentorName} le cose strane che {player_pronouns has him:gli|{player_pronouns has her:le|lə}} sono accadute da quando è qui, e poi tornare da lui.<>
            
        - missionFive:
            Franco ha chiesto a {player_name} di vedere cosa succede se {charNameOne} e {charNameTwo} sono assieme, e poi tornare da lui.<>
            
        - missionSix:
            Franco ha chiesto a {player_name} di parlare all'albero al centro della foresta, e poi tornare da lui.<>
            
        - missionSeven:
            Franco ha chiesto a {player_name} di leggere la lettera che {player_pronouns has him:gli|{player_pronouns has her:le|lə}} è arrivata in stazione, e poi tornare da lui.<>
            
        - missionEight:
            Franco ha chiesto a {player_name} di leggere qualcosa in biblioteca, e poi tornare da lui.<>
        
        - specialMissionOne:
            Franco ha detto a {player_name} che c'è della tensione tra {charNameTwo} e {mentorName}, e per questo deve vedere cosa sta accadendo, e poi tornare da lui.<>
            
        - specialMissionTwo:
            Franco ha chiesto a {player_name} di cucinare qualcosa da {player_pronouns has him:solo|{player_pronouns has her:sola|solə}}, e poi tornare da lui.<>
            
        - else: Franco per ora non ha proposto missioni a {player_name}.<>
    }</b>

{
    - cooking_with_frog:
        Quando {player_name} e Franco hanno cucinato assieme, hanno preparato un piatto di {kitchen_PGCharRecipe}.
}


-> rewriter_book_with_flow
