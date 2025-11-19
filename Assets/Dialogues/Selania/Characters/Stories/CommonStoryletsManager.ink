=== common_storylets
    {
        //Storylet dopo lo scambio con Riccio e il fatto che l'ha afferrato
            - are_two_entities_together(Mentor, PG) && second_char_main_storylets.two && (not addressing_violence):
                    -> addressing_violence
    
        //Mentore e Riccio parlano dopo il litigio. Parte fintanto che riccio non ha cucinato da solo.
            - are_two_entities_together(Mentor, PG) && are_two_entities_together(SecondCharacter, PG) && addressing_violence && not about_violence_and_peace && not second_char_cooking_tracker:
                    -> about_violence_and_peace
        
        //Discorso sbloccato da rana            
            - are_two_entities_together(Mentor, PG) && are_two_entities_together(SecondCharacter, PG) && frog_currentMission has specialMissionOne && not special_mission_one_dialogue:
                    -> special_mission_one_dialogue
        
        //Riccio ha cucinato, e vediamo la scena del dono
            - are_two_entities_together(SecondCharacter, PG) && are_two_entities_together(Mentor, PG) && second_char_cooking_tracker && kitchen_secondCharIsCooking == false && not food_gift_second_char:
                    -> food_gift_second_char
        
        //Chiacchiere tra Riccio e Chitarra
            - are_two_entities_together(FirstCharacter, PG) && are_two_entities_together(SecondCharacter, PG) && not first_second_chit_chat && firstChar_pauseTalking == 0 && secondChar_pauseTalking == 0:
                    -> first_second_chit_chat

            - else:
                {
                    - actual_speaker == Mentor:
                        ~ actual_speaker = ()
                         -> mentor_and_second_char_storylets
                    
                    - actual_speaker == FirstCharacter:
                        ~ actual_speaker = ()
                         -> talk_with_first_character.top
                         
                    - actual_speaker == SecondCharacter:
                        ~ actual_speaker = ()
                         -> talk_with_second_character.top  
                         
                    - else:
                        ->->
                
                }

    }
->->
