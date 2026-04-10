/* ---------------------------------

   Ordine priorità storylets:
   * Con/su Riccio
   * Con/su Chitarra
   * Tutorial
   * Personali
 ----------------------------------*/
=== mentor_check_dialogue
//Questo mi serve per capire se il mentore mi ha appena dato o meno uno storylet
{
    - mentor_pauseTalking == 0:
        -> mentor_and_chars_related_storylets
    
    - else:
        -> helping_mentor
}


=== mentor_and_chars_related_storylets ===

    //Second char
    {    

        //Dopo le presentazioni con due, scena in cui hanno litigato:
        - second_char_main_storylets.three && (not that_little_liar_storylet):
            -> that_little_liar_storylet

        //Storylet dopo lo scambio con Riccio e il fatto che l'ha afferrato
        - second_char_main_storylets.four && (not addressing_violence):
            -> addressing_violence    

        //Feedback
        - not second_character_feedback && secondChar_storyStatus == story_storyEnded:
            -> second_character_feedback

    }

    //First Char
    {   
        //Feedback
        - not first_character_feedback && firstChar_storyStatus == story_storyEnded:
            -> first_character_feedback           
    }

    //Third Char
    {   
        //Feedback
        - not third_character_feedback && thirdChar_storyStatus == story_storyEnded:
            -> third_character_feedback           
    }

    //Fourth Char
    {   
        //Feedback
        - not fourth_character_feedback && fourthChar_storyStatus == story_storyEnded:
            -> fourth_character_feedback           
    }


    //Tutorial
    {
        //Questi sono i tutorial che non devono partire in automatico, ma solo se le parliamo
        //Presentazione generale
        - not tutorial_mentorTalkingChoiceRelationship:
            -> tutorial_mentorTalkingChoiceRelationship
        
        //Info sulla non obbligatorietà dei minigames
        - player_accessiblePlaces has Library or player_accessiblePlaces has Kitchen and not about_not_mandatory_work:
            -> about_not_mandatory_work    
            
        //Invito a leggere la posta nuova    
        - contentsTrainStop has DoggoFirstLetters or contentsTrainStop has DoggoSecondLetters && not first_character_notes && not second_character_notes:
            {
                - contentsTrainStop has DoggoFirstLetters && not first_character_notes && not first_char_new_mail:
                    -> first_char_new_mail

                - contentsTrainStop has DoggoSecondLetters && not second_character_notes && not second_char_new_mail:
                    -> second_char_new_mail

                - else:
                    -> personal_mentor_storylets    
            }
            
        - else:
            -> personal_mentor_storylets
    }


=== personal_mentor_storylets ===
{debug: passo da personal_mentor_storylets}
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    {
    //Fine demo
        - not ending_demo && secondChar_storyStatus == story_storyEnded && firstChar_storyStatus == story_storyEnded:
            -> ending_demo
            

    //Storylets principali
        - not knowing_mentor_character.one:
            -> knowing_mentor_character.one

        - not knowing_mentor_character.two && firstChar_storyStatus == story_storyEnded:
            -> knowing_mentor_character.two

        - not knowing_mentor_character.three && (firstChar_storyStatus == story_storyEnded or secondChar_storyStatus == story_storyEnded ):
            -> knowing_mentor_character.three

        - not knowing_mentor_character.four && secondChar_storyStatus == story_storyEnded:
            -> knowing_mentor_character.four

        - not knowing_mentor_character.five && secondChar_storyStatus == story_storyEnded:
            -> knowing_mentor_character.five

        // //Forse solo una di queste, perché con la terza storia avremo degli storylets ad hoc.    
        // - not knowing_mentor_character.six && thirdChar_storyStatus == story_storyStarted && mentor_tutorialPauses == false:
        //     -> knowing_mentor_character.six


        // - not knowing_mentor_character.seven && thirdChar_storyStatus == story_storyEnded && mentor_tutorialPauses == false:
        //     -> knowing_mentor_character.seven

        // - not knowing_mentor_character.eight && fifthChar_storyStatus == story_storyStarted && mentor_tutorialPauses == false:
        //     -> knowing_mentor_character.eight

        // - not knowing_mentor_character.nine && fifthChar_storyStatus == story_storyStarted && mentor_tutorialPauses == false:
        //     -> knowing_mentor_character.nine

        // - not knowing_mentor_character.ten && fifthChar_storyStatus == story_storyStarted && mentor_tutorialPauses == false:
        //     -> knowing_mentor_character.ten

        // - not knowing_mentor_character.eleven && fifthChar_storyStatus == story_storyStarted && mentor_tutorialPauses == false:
        //     -> knowing_mentor_character.eleven

        // - not knowing_mentor_character.twelve && fifthChar_storyStatus == story_storyStarted && mentor_tutorialPauses == false:
        //     -> knowing_mentor_character.twelve
 

    //Commenti sui luoghi aperti

        //Sulla funzione della serra
        - player_accessiblePlaces has Greenhouse && not about_greenhouse:
            -> about_greenhouse
            
        //Sulla funzione della cucina
        - player_accessiblePlaces has Kitchen && not about_kitchen:
            -> about_kitchen
        
        //Sulla funzione del nido    
        - player_accessiblePlaces has Nest && not about_nest:
            -> about_nest    

     //Commenti a situazioni, eventi o altro.
        //Crescita strega.
        - player_accessiblePlaces has Dump && not witch_intro && not growing_witch_storylet:
            -> growing_witch_storylet

        //Commento sul cane    
        - first_character_notes.one or second_character_notes.one && not dog_mentor:
            -> dog_mentor
        
        //Lettura Mentore
        - are_two_entities_together(Mentor, PG) && library_readStories has Salvo && not a_story_of_transformation:
            -> a_story_of_transformation      

    //Scene speciali
        //Crescita olobino
        - contentsPond has FromPondToGreenhouseBlooming && are_two_entities_together(Mentor, PG) && not about_olobino:
            -> about_olobino

        - about_olobino && are_two_entities_together(Mentor, PG) && not again_about_olobino:
            -> again_about_olobino 

        //Mentore esplode
        - are_two_entities_together(Mentor, PG) && thirdChar_storyStatus == story_storyEnded and not mentor_rage:
            -> mentor_rage


    //Niente da attivare:
        - else:
            -> helping_mentor
    }

