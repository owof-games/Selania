/* ---------------------------------

   Ordine priorità storylets:
   * Con/su Riccio
   * Con/su Chitarra
   * Tutorial
   * Personali
 ----------------------------------*/
=== mentor_and_second_char_storylets ===
{debug: passo da mentor_and_second_char_storylets}
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    {
                    
        //Dopo le presentazioni con due, scena in cui hanno litigato:
        - secondChar_storyStatus == story_storyStarted && (not that_little_liar_storylet):
                -> that_little_liar_storylet
        
        - not second_character_feedback && secondChar_storyStatus == story_storyEnded:
                -> second_character_feedback            
            
        - else:
                -> mentor_and_first_char_storylets
    }

=== mentor_and_first_char_storylets ===
{debug: passo da mentor_and_first_char_storylets}
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
{    
            
    //Feedback
        - not first_character_feedback:
            {
                - firstChar_storyStatus == story_storyEnded && mentor_pauseTalking == 0:
                    -> first_character_feedback
                
                - else:
                    -> mentor_tutorial_storylets  
            }
        
        - else:
            -> mentor_tutorial_storylets
    
 }  
    
=== mentor_tutorial_storylets
{debug: passo da mentor_tutorial_storylets}
{debug: valore di welcome == {welcome}}
{debug: valore di questions == {questions}}
~ temp charNameOne = translator(firstChar_ActualName)
//Ogni volta che parlo con Mentore, il primo check è sulla presenza o meno di tutorial. Se ci sono elementi di tutorial da condividere e le condizioni sono rispettate, a questo punto scattano per primi, ma senza darmi feedback, che verranno dati solo se non ci sono storylets di altro tipo da condividere.
    {
        //Presentazione generale
        - not welcome:
            -> welcome
        
        //Relazioni e inchiostro
        - not about_ink_usage && mentor_tutorialPauses == false:
            -> about_ink_usage
        
        //Sulla riscrittura    
        - not questions && mentor_tutorialPauses == false:
            -> questions
            
        //Sulla funzione della serra
        - player_accessiblePlaces has Greenhouse && not about_greenhouse && mentor_tutorialPauses == false:
            -> about_greenhouse
            
        //Sulla funzione della cucina
        - player_accessiblePlaces has Kitchen &&not about_kitchen && mentor_tutorialPauses == false:
            -> about_kitchen
        
        //Sulla funzione del nido    
        - player_accessiblePlaces has Nest && not about_nest && mentor_tutorialPauses == false:
            -> about_nest    
        
        //Invito a leggere la posta nuova    
        - trainStopContents has FirstCharacterNotes && not first_character_notes && not first_char_new_mail && mentor_tutorialPauses == false:
            -> first_char_new_mail
        
        //Info sulla non obbligatorietà dei minigames
        - player_accessiblePlaces has Library or player_accessiblePlaces has Kitchen and not about_not_mandatory_work && mentor_tutorialPauses == false:
            -> about_not_mandatory_work
            
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
    //Feedback
        - not ending_demo && secondChar_storyStatus == story_storyEnded && firstChar_storyStatus == story_storyEnded:
                -> ending_demo
            
     
     //Commenti a situazioni, eventi o altro.
        - witch_feedback.first_story_ended_check && not growing_witch_storylet && mentor_pauseTalking == 0:
            -> growing_witch_storylet
            
        
        //Commento sul cane    
        - first_character_notes.one or second_character_notes.one && not dog_mentor:
            -> dog_mentor
        
        
        {
            //Mentore esplode
            - are_two_entities_together(Mentor, PG) && thirdChar_storyStatus == story_storyEnded and not mentor_rage:
                -> mentor_rage
        }
    
    
    //Lettura Mentore
            - are_two_entities_together(Mentor, PG) && library_readStories has Salvo && not a_story_of_transformation:
                -> a_story_of_transformation    
        
        {
            - not knowing_mentor_character.one && mentor_tutorialPauses == false:
                -> knowing_mentor_character.one
            - not knowing_mentor_character.two && firstChar_storyStatus == story_storyEnded && mentor_tutorialPauses == false:
                -> knowing_mentor_character.two
            - not knowing_mentor_character.three && firstChar_storyStatus == story_storyEnded && mentor_tutorialPauses == false:
                -> knowing_mentor_character.three
            - not knowing_mentor_character.four && secondChar_storyStatus == story_storyEnded && mentor_tutorialPauses == false:
                -> knowing_mentor_character.four
            - not knowing_mentor_character.five && secondChar_storyStatus == story_storyEnded && mentor_tutorialPauses == false:
                -> knowing_mentor_character.five
            //Forse solo una di queste, perché con la terza storia avremo degli storylets ad hoc.    
            - not knowing_mentor_character.six && thirdChar_storyStatus == story_storyStarted && mentor_tutorialPauses == false:
                -> knowing_mentor_character.six
            //Questo è lo storylet dove Mentore sbrocca, e che poi trasformo in quinta personaggia    
            - not knowing_mentor_character.seven && thirdChar_storyStatus == story_storyEnded && mentor_tutorialPauses == false:
                -> knowing_mentor_character.seven
            - not knowing_mentor_character.eight && fifthChar_storyStatus == story_storyStarted && mentor_tutorialPauses == false:
                -> knowing_mentor_character.eight
            - not knowing_mentor_character.nine && fifthChar_storyStatus == story_storyStarted && mentor_tutorialPauses == false:
                -> knowing_mentor_character.nine
            - not knowing_mentor_character.ten && fifthChar_storyStatus == story_storyStarted && mentor_tutorialPauses == false:
                -> knowing_mentor_character.ten
            - not knowing_mentor_character.eleven && fifthChar_storyStatus == story_storyStarted && mentor_tutorialPauses == false:
                -> knowing_mentor_character.eleven
            - not knowing_mentor_character.twelve && fifthChar_storyStatus == story_storyStarted && mentor_tutorialPauses == false:
                -> knowing_mentor_character.twelve

        }    
            
        - else:
            -> helping_mentor
    
    }



