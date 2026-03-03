=== common_storylets
    {
        
        //Gestione dei tutorial di Carla
            - tutorial_ActivateTutorial == true && are_two_entities_together(Carla, PG) && not tutorialChoices:
                -> tutorial_choicesStorylet

            - tutorial_ActivateTutorial == true && player_accessiblePlaces has Greenhouse && not tutorial_greenhouseStorylet:
                    ~ move_entity(Carla, Greenhouse)
                -> tutorial_greenhouseStorylet

            - tutorial_ActivateTutorial == true && player_accessiblePlaces has Kitchen && not tutorial_kitchenStorylet:
                    ~ move_entity(Carla, Kitchen)
                -> tutorial_kitchenStorylet

            - tutorial_ActivateTutorial == true && player_accessiblePlaces has Nest && not tutorial_nestStorylet:
                    ~ move_entity(Carla, Nest)
                -> tutorial_nestStorylet


        //Mentore e Riccio parlano dopo il litigio. Parte fintanto che riccio non ha cucinato da solo.
            - are_two_entities_together(Mentor, PG) && are_two_entities_together(SecondCharacter, PG) && addressing_violence && (not about_violence_and_peace):
                -> about_violence_and_peace
        
        //Discorso sbloccato da rana            
            - are_two_entities_together(Mentor, PG) && are_two_entities_together(SecondCharacter, PG) && frog_currentMission has specialMissionOne && (not special_mission_one_dialogue):
                -> special_mission_one_dialogue
        
        //Riccio ha cucinato, e vediamo la scena del dono
            - are_two_entities_together(SecondCharacter, PG) && are_two_entities_together(Mentor, PG) && second_char_cooking_tracker && kitchen_secondCharIsCooking == false && about_violence_and_peace && (not food_gift_second_char):
                -> food_gift_second_char
        
        //Chiacchiere tra Riccio e Chitarra
            - are_two_entities_together(FirstCharacter, PG) && are_two_entities_together(SecondCharacter, PG) && not first_second_chit_chat && firstChar_pauseTalking == 0 && secondChar_pauseTalking == 0:
                -> first_second_chit_chat
                    
        //Chiacchiere tra Chitarra e Mentore
            - are_two_entities_together(FirstCharacter, PG) && are_two_entities_together(Mentor, PG) && not first_mentor_chit_chat && first_char_main_storylets.one && firstChar_pauseTalking == 0:
                -> first_mentor_chit_chat
        
        //Chiacchiere tra Rana  e Mentore
            - are_two_entities_together(Mentor, PG) && welcome.your_name && are_two_entities_together (Franco, PG) && not frog_and_mentor_chit_chat:
                -> frog_and_mentor_chit_chat

        //Feedback da parte di Mentore su pensieri strega se le abbiamo detto che abbiamo parlato con la pianta
            - are_two_entities_together(Mentor, PG) && are_two_entities_together(TheWitch, PG) && little_storylets.talkingWitch && not the_witch_and_the_mentor:
                -> the_witch_and_the_mentor
        
        //Chiacchiera tra Chitarra e Rana                
            - are_two_entities_together(FirstCharacter, PG) && are_two_entities_together(Franco, PG) && not frog_and_first_char_chit_chat:
                -> frog_and_first_char_chit_chat

        //Chiacchiera tra Riccio e rana
            - are_two_entities_together(SecondCharacter, PG) && are_two_entities_together(Franco, PG) && not frog_and_second_char_chit_chat:
                -> frog_and_second_char_chit_chat

            - else:
                //Andiamo a vedere se ci sono storylets speciali di un singolo personaggio
                -> special_automatic_storylets
    }

