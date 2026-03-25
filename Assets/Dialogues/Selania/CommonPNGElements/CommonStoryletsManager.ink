=== common_storylets
    {

        //Gestione dei tutorial di Carla
            - tutorial_ActivateTutorial == true && entity_location(PG) == TrainStop && not tutorial_choicesRelationshipStorylet:
                -> tutorial_choicesRelationshipStorylet

        //Feedback da parte di Mentore su pensieri strega se le abbiamo detto che abbiamo parlato con la pianta
            - are_two_entities_together(Mentor, PG) && are_two_entities_together(TheWitch, PG) && little_storylets.talkingWitch && not the_witch_and_the_mentor:
                -> the_witch_and_the_mentor
        
        //Tra PNG
            //Chiacchiere tra Riccio e Chitarra
                - are_two_entities_together(FirstCharacter, PG) && are_two_entities_together(SecondCharacter, PG) && firstChar_pauseTalking == 0 && secondChar_pauseTalking == 0 && not first_second_chit_chat :
                    -> first_second_chit_chat

            //Chiacchiere tra Riccio e PNG3
                - are_two_entities_together(ThirdCharacter, PG) && are_two_entities_together(SecondCharacter, PG) && thirdChar_pauseTalking == 0 && secondChar_pauseTalking == 0  && not third_second_chit_chat:
                    -> third_second_chit_chat        

            //Chiacchiere tra Chitarra e PNG3
                - are_two_entities_together(ThirdCharacter, PG) && are_two_entities_together(FirstCharacter, PG)&& thirdChar_pauseTalking == 0 && firstChar_pauseTalking == 0 && not third_first_chit_chat:
                    -> third_first_chit_chat 

        
        //Con PNG e Mentore
            //Mentore e Riccio parlano dopo il litigio. Parte fintanto che riccio non ha cucinato da solo.
                - are_two_entities_together(Mentor, PG) && are_two_entities_together(SecondCharacter, PG) && mentor_pauseTalking == 0 && secondChar_pauseTalking == 0 && addressing_violence && (not about_violence_and_peace):
                    -> about_violence_and_peace
            
            //Riccio ha cucinato, e vediamo la scena del dono
                - are_two_entities_together(SecondCharacter, PG) && are_two_entities_together(Mentor, PG) && second_char_cooking_tracker && kitchen_secondCharIsCooking == false && about_violence_and_peace && mentor_pauseTalking == 0 && secondChar_pauseTalking == 0 && (not food_gift_second_char):
                    -> food_gift_second_char        
            
            //Chiacchiere tra Chitarra e Mentore
                - are_two_entities_together(FirstCharacter, PG) && are_two_entities_together(Mentor, PG)&& first_char_main_storylets.three && firstChar_pauseTalking == 0 && mentor_pauseTalking == 0 && not first_mentor_chit_chat:
                    -> first_mentor_chit_chat
            
            //Chiacchiere tra Franco e Mentore
                - are_two_entities_together(Mentor, PG) && welcome.your_name && are_two_entities_together (Franco, PG) && mentor_pauseTalking == 0 && not frog_and_mentor_chit_chat:
                    -> frog_and_mentor_chit_chat
            
            //Chiacchiera tra PNG3 e Mentore
                - are_two_entities_together(ThirdCharacter, PG) && are_two_entities_together(Mentor, PG) && mentor_pauseTalking == 0 && thirdChar_pauseTalking == 0  && third_char_main_storylets.one && not third_mentor_chit_chat:
                    -> third_mentor_chit_chat

        
        
        //Con PNG e Franco
            //Chiacchiera tra Chitarra e Franco                
                - are_two_entities_together(FirstCharacter, PG) && are_two_entities_together(Franco, PG) && firstChar_pauseTalking == 0 && not frog_and_first_char_chit_chat :
                    -> frog_and_first_char_chit_chat

            //Chiacchiera tra Riccio e Franco
                - are_two_entities_together(SecondCharacter, PG) && are_two_entities_together(Franco, PG) && secondChar_pauseTalking == 0 && not frog_and_second_char_chit_chat :
                    -> frog_and_second_char_chit_chat

            //Chiacchiera tra Tre e Franco
                - are_two_entities_together(ThirdCharacter, PG) && are_two_entities_together(Franco, PG) && thirdChar_pauseTalking == 0 && not frog_and_third_char_chit_chat :
                    -> frog_and_third_char_chit_chat
            
            //Discorso sbloccato da Franco            
                - are_two_entities_together(Mentor, PG) && are_two_entities_together(SecondCharacter, PG) && frog_currentMission has specialMissionOne  && mentor_pauseTalking == 0 && secondChar_pauseTalking == 0 && (not special_mission_one_dialogue):
                    -> special_mission_one_dialogue
        
        //Altre
            //Scambio tra Riccio e Carla
             - are_two_entities_together(SecondCharacter, PG) && are_two_entities_together(Carla, PG) && secondChar_pauseTalking == 0 && not carla_and_second_char_chit_chat:
                    -> carla_and_second_char_chit_chat
            //Primo commento di Franco quando entriamo nel nest con lui
            - are_two_entities_together(Franco, PG) && entity_location(PG) == Nest && nest_francoChosenSigil == () && not special_mission_one_contents:
                -> special_mission_one_contents
            //Missione speciale Franco chiusa
            - are_two_entities_together(Franco, PG) && entity_location(PG) == Nest && nest_francoChosenSigil != ():
                    -> special_mission_one_closed 

            - else:
                //Andiamo a vedere se ci sono storylets speciali di un singolo personaggio
                -> special_automatic_storylets
    }

