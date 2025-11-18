/* ---------------------------------

   Ordine priorità storylets:
   * Con/su Riccio
   * Tutorial
   * Con/su Chitarra
   * Personali
 ----------------------------------*/
=== mentor_and_second_char_storylets ===
{debug: passo da mentor_and_second_char_storylets}
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    {
                    
        //Dopo le presentazioni con due, scena in cui hanno litigato:
        - knowing_second_character.one && (not that_little_liar_storylet) :
                -> that_little_liar_storylet
        
        - not second_character_feedback && secondChar_storyStatus == story_storyEnded:
                -> second_character_feedback            
            
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
            
            
        - else:
            -> mentor_and_first_char_storylets    
    
    }


=== mentor_and_first_char_storylets ===
{debug: passo da mentor_and_first_char_storylets}
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
{    
            
    //Feedback
        - not first_character_feedback:
            {
                - firstChar_storyStatus == story_storyEnded:
                    -> first_character_feedback
                - else:
                    -> fifth_character_storylets    
            }
        
        - else:
            -> fifth_character_storylets
    
 }  
    

=== fifth_character_storylets ===
{debug: passo da fifth_character_storylets}
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    {
    //Feedback
        - not ending_demo && secondChar_storyStatus == story_storyEnded && firstChar_storyStatus == story_storyEnded:
                -> ending_demo
            
        // - not third_character_feedback && thirdChar_storyStatus == story_storyEnded:
        //     -> third_character_feedback        
    
        // - not fourth_character_feedback && fourthfourthChar_storyStatusStory == story_storyEnded:
        //     -> fourth_character_feedback        
    
        // - not fifth_character_feedback && fifthChar_storyStatus == story_storyEnded:
        //     -> fifth_character_feedback        
        
     
     //Commenti a situazioni, eventi o altro.
        - talking_witch.first_story_ended_check && not growing_witch_storylet:
            -> growing_witch_storylet
            
        - else:
            -> knowing_fifth_character
    
    }



