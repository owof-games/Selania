=== common_storylets
    {
        //Storylet dopo lo scambio con Riccio e il fatto che l'ha afferrato
            - are_two_entities_together(Mentor, PG) && actual_speaker == Mentor && second_char_main_storylets.four && (not addressing_violence):
                    -> addressing_violence
    
        //Mentore e Riccio parlano dopo il litigio. Parte fintanto che riccio non ha cucinato da solo.
            - are_two_entities_together(Mentor, PG) && are_two_entities_together(SecondCharacter, PG) && (actual_speaker == Mentor or actual_speaker == SecondCharacter) && addressing_violence && (not about_violence_and_peace):
                    -> about_violence_and_peace
        
        //Discorso sbloccato da rana            
            - are_two_entities_together(Mentor, PG) && are_two_entities_together(SecondCharacter, PG) && (actual_speaker == Mentor or actual_speaker == SecondCharacter) && frog_currentMission has specialMissionOne && (not special_mission_one_dialogue):
                    -> special_mission_one_dialogue
        
        //Riccio ha cucinato, e vediamo la scena del dono
            - are_two_entities_together(SecondCharacter, PG) && are_two_entities_together(Mentor, PG) && (actual_speaker == Mentor or actual_speaker == SecondCharacter) && second_char_cooking_tracker && kitchen_secondCharIsCooking == false && about_violence_and_peace && (not food_gift_second_char):
                    -> food_gift_second_char
        
        //Chiacchiere tra Riccio e Chitarra
            - are_two_entities_together(FirstCharacter, PG) && are_two_entities_together(SecondCharacter, PG) && (actual_speaker == FirstCharacter or actual_speaker == SecondCharacter) && not first_second_chit_chat && firstChar_pauseTalking == 0 && secondChar_pauseTalking == 0:
                    -> first_second_chit_chat
                    
        //Chiacchiere tra Chitarra e Mentore
            - are_two_entities_together(FirstCharacter, PG) && are_two_entities_together(Mentor, PG) && (actual_speaker == FirstCharacter or actual_speaker == Mentor) && not first_mentor_chit_chat && first_char_main_storylets.one && firstChar_pauseTalking == 0:
                    -> first_mentor_chit_chat
        
        //Chiacchiere tra Riccio e Mentore
            - are_two_entities_together(Mentor, PG) && are_two_entities_together (TheFrog, PG) && actual_speaker == Mentor && not frog_and_mentor_chit_chat:
                -> frog_and_mentor_chit_chat

        //Feedback da parte di Mentore su pensieri strega se le abbiamo detto che abbiamo parlato con la pianta
            - are_two_entities_together(Mentor, PG) && are_two_entities_together(TheWitch, PG) && actual_speaker == Mentor && little_storylets.talkingWitch && not the_witch_and_the_mentor:
                -> the_witch_and_the_mentor        

            - else:
                {
                    - actual_speaker == Mentor:
                        ~ actual_speaker = ()
                         -> mentor_and_second_char_storylets
                    
                    - actual_speaker == FirstCharacter:
                        ~ actual_speaker = ()
                        -> talk_with_first_character
                         
                    - actual_speaker == SecondCharacter:
                        ~ actual_speaker = ()
                         -> talk_with_second_character
                         
                    - else:
                        ->->
                
                }

    }
->->
