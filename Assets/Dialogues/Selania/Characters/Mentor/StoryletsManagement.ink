=== mentor_tutorial_storylets
{debug: passo da mentor_tutorial_storylets}
{debug: valore di welcome == {welcome}}
{debug: valore di questions == {questions}}
~ temp charNameOne = translator(firstCharacterState)
//Ogni volta che parlo con Mentore, il primo check è sulla presenza o meno di tutorial. Se ci sono elementi di tutorial da condividere e le condizioni sono rispettate, a questo punto scattano per primi, ma senza darmi feedback, che verranno dati solo se non ci sono storylets di altro tipo da condividere.
    {
        //Presentazione generale
        - not welcome:
            -> welcome
        
        //Relazioni e inchiostro
        - not about_ink_usage && tutorialPauses == false:
            -> about_ink_usage
        
        //Sulla riscrittura    
        - not questions && tutorialPauses == false:
            -> questions
            
        //Sulla funzione della serra
        - playerAccessiblePlaces has Greenhouse && not about_greenhouse && tutorialPauses == false:
            -> about_greenhouse
            
        //Sulla funzione della cucina
        - playerAccessiblePlaces has Kitchen &&not about_kitchen && tutorialPauses == false:
            -> about_kitchen
        
        //Sulla funzione del nido    
        - playerAccessiblePlaces has Nest && not about_nest && tutorialPauses == false:
            -> about_nest    
            
            
        - else:
            -> mentor_and_first_char_storylets    
    
    }


=== mentor_and_first_char_storylets ===
{debug: passo da mentor_and_first_char_storylets}
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
{    
            
    //Feedback
        - not first_character_feedback:
            {
                - firstStory == StoryEnded:
                    -> first_character_feedback
                - else:
                    -> mentor_and_second_char_storylets     
            }
        
        - else:
            -> mentor_and_second_char_storylets 
    
 }  
    

=== mentor_and_second_char_storylets ===
{debug: passo da mentor_and_second_char_storylets}
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    {

        //Dopo le presentazioni con due, scena in cui hanno litigato:
        - knowing_second_character.one && (not that_little_liar_storylet) :
            -> that_little_liar_storylet
        
        //Storylet dopo lo scambio con Riccio e il fatto che l'ha afferrato
        - knowing_second_character.two && (not addressing_violence):
            -> addressing_violence
        

        - not second_character_feedback && secondStory == StoryEnded:
            -> second_character_feedback            
            
        - else:
            -> fifth_character_storylets
    }


=== fifth_character_storylets ===
{debug: passo da fifth_character_storylets}
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    {
    //Feedback
        - not ending_demo && secondStory == StoryEnded && firstStory == StoryEnded:
            -> ending_demo
        // - not third_character_feedback && thirdStory == StoryEnded:
        //     -> third_character_feedback        
    
        // - not fourth_character_feedback && fourthStory == StoryEnded:
        //     -> fourth_character_feedback        
    
        // - not fifth_character_feedback && fifthStory == StoryEnded:
        //     -> fifth_character_feedback        
        
     
     //Commenti a situazioni, eventi o altro.
        - talking_witch.first_story_ended_check && not growing_witch_storylet:
            -> growing_witch_storylet
            
        - else:
            -> knowing_fifth_character
    
    }



