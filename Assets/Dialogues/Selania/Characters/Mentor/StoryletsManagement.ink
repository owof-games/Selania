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

//Testi prioritari per la storia principale o le relazioni con lə PNG
    {
       //Presentazione generale
        - grimoire_fifthChar hasnt grimMentorIntro:
            -> fifth_char_intro
    }

    //Third Char
    {   
        //Feedback
        - grimoire_thirdChar hasnt grimThirdCharMentorFeedback  && thirdChar_storyStatus == story_storyPostal:
            -> third_character_feedback           
    }

    //Second char
    {    

        //Dopo le presentazioni con due, scena in cui hanno litigato:
        - (grimoire_secondChar has grimSecondCharThreeHim or grimoire_secondChar has grimSecondCharThreeHer or grimoire_secondChar has grimSecondCharThreeThey) && grimoire_fifthChar hasnt grimMentorLiar:
            -> that_little_liar_storylet

        //Storylet dopo lo scambio con Riccio e il fatto che l'ha afferrato
        - grimoire_secondChar has grimSecondCharFour && grimoire_fifthChar hasnt grimMentorViolence:
            -> addressing_violence    

        //Feedback
        - grimoire_secondChar hasnt grimSecondCharMentorFeedback && secondChar_storyStatus == story_storyPostal:
            -> second_character_feedback

    }

//Testi di relazione con lə png

    //First Char
    {   
        //Feedback
        - grimoire_firstChar hasnt grimFirstCharMentorFeedback && firstChar_storyStatus == story_storyPostal:
            -> first_character_feedback           
    }

    //Fourth Char
    {   
        //Feedback
        - grimoire_fourthChar hasnt grimFourthCharMentorFeedback  && fourthChar_storyStatus == story_storyPostal:
            -> fourth_character_feedback           
    }

    //Fifth Char
    {   
        //Feedback
        - grimoire_fifthChar hasnt grimFifthCharMentorFeedback  && fifthChar_storyStatus == story_storyPostal:
            -> fifth_character_feedback           
    }


//Tutorial secondari (più consigli che altro)
    {
        //Questi sono i tutorial che non devono partire in automatico, ma solo se le parliamo
        //Info sulla non obbligatorietà dei minigames
        - player_accessiblePlaces has Library or player_accessiblePlaces has Kitchen and grimoire_fifthChar hasnt grimMentorNotMandatory:
            -> about_not_mandatory_work    
            
        //Invito a leggere la posta nuova    
        - contentsTrainStop has DoggoFirstLetters or contentsTrainStop has DoggoSecondLetters or contentsTrainStop has DoggoThirdLetters && (grimoire_firstChar hasnt grimFirstCharLetterOne && grimoire_secondChar hasnt grimSecondCharLetterOne && grimoire_thirdChar hasnt grimThirdCharLetterOne):
            {
                - contentsTrainStop has DoggoFirstLetters && grimoire_firstChar hasnt grimFirstCharLetterOne && grimoire_fifthChar hasnt grimMentorNewMail:
                    -> first_char_new_mail

                - contentsTrainStop has DoggoSecondLetters && grimoire_secondChar hasnt grimSecondCharLetterOne && grimoire_fifthChar hasnt grimMentorNewMail:
                    -> second_char_new_mail

                - contentsTrainStop has DoggoThirdLetters && grimoire_thirdChar hasnt grimThirdCharLetterOne && grimoire_fifthChar hasnt grimMentorNewMail:
                    -> third_char_new_mail    

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
    
    
    {
    //Fine demo
        - not ending_demo && LIST_COUNT(story_endedStories) == 2 && grimoire_thirdChar has grimThirdCharLetterEight:
                -> ending_demo
            
    //Commenti sui luoghi aperti

        //Sulla funzione della serra, disponibile solo se tutorial mentore == true
        - player_accessiblePlaces has Greenhouse && grimoire_appendices hasnt grimGreenhouseMentor && tutorial_MentorTutorial == true:
                -> about_greenhouse
            
        //Sulla funzione della cucina
        - player_accessiblePlaces has Kitchen && grimoire_fifthChar hasnt grimKitchenMentor:
                -> about_kitchen
        
        //Sulla funzione del nido    
        - player_accessiblePlaces has Nest && grimoire_appendices hasnt grimSigilsMentor:
                -> about_nest    

     //Commenti a situazioni, eventi o altro.
        //Commento sul cane    
        - grimoire_firstChar has grimFirstCharLetterOne && grimoire_secondChar has grimSecondCharLetterOne && grimoire_thirdChar has grimThirdCharLetterOne && grimoire_fifthChar hasnt grimMentorDog:
                -> dog_mentor
        
        //Lettura Mentore
        - are_two_entities_together(Mentor, PG) && library_readStories has Salvo && grimoire_fifthChar hasnt grimMentorNovel:
                -> a_story_of_transformation      

    //Scene speciali
        //Crescita olobino
        - contentsPond has FromPondToGreenhouseBlooming && are_two_entities_together(Mentor, PG) && grimoire_fifthChar hasnt grimMentorOlobinoUno:
                -> about_olobino

        - about_olobino && are_two_entities_together(Mentor, PG) && grimoire_fifthChar hasnt grimMentorOlobinoDue:
                -> again_about_olobino 

        //Mentore esplode
        // - are_two_entities_together(Mentor, PG) && LIST_COUNT(story_endedStories) == 3 and grimoire_fifthChar hasnt grimMentorRage:
        //     -> mentor_rage


    //Storylets principali
        // - grimoire_fifthChar hasnt grimMentorOne:
        //     -> knowing_mentor_character.one

        // - grimoire_fifthChar hasnt grimMentorTwo && firstChar_storyStatus == story_storyPostal:
        //     -> knowing_mentor_character.two

        // - grimoire_fifthChar hasnt grimMentorThree && LIST_COUNT(story_endedStories) > 0:
        //     -> knowing_mentor_character.three

        // - grimoire_fifthChar hasnt grimMentorFour && secondChar_storyStatus == story_storyPostal:
        //     -> knowing_mentor_character.four

        // - grimoire_fifthChar hasnt grimMentorFive && secondChar_storyStatus == story_storyPostal:
        //     -> knowing_mentor_character.five

        // //Forse solo una di queste, perché con la terza storia avremo degli storylets ad hoc.    
        // - not knowing_mentor_character.six && thirdChar_storyStatus == story_storyStarted && mentor_tutorialPauses == false:
        //     -> knowing_mentor_character.six


        // - not knowing_mentor_character.seven && thirdChar_storyStatus == story_storyPostal && mentor_tutorialPauses == false:
        //     -> knowing_mentor_character.seven

        // - not knowing_mentor_character.eight && fifthChar_storyStatus == story_storyPostal && mentor_tutorialPauses == false:
        //     -> knowing_mentor_character.eight

        // - not knowing_mentor_character.nine && fifthChar_storyStatus == story_storyStarted && mentor_tutorialPauses == false:
        //     -> knowing_mentor_character.nine

        // - not knowing_mentor_character.ten && fifthChar_storyStatus == story_storyStarted && mentor_tutorialPauses == false:
        //     -> knowing_mentor_character.ten

        // - not knowing_mentor_character.eleven && fifthChar_storyStatus == story_storyStarted && mentor_tutorialPauses == false:
        //     -> knowing_mentor_character.eleven

        // - not knowing_mentor_character.twelve && fifthChar_storyStatus == story_storyStarted && mentor_tutorialPauses == false:
        //     -> knowing_mentor_character.twelve


    //Niente da attivare:
        - else:
            -> helping_mentor
    }

