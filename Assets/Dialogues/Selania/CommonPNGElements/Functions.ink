=== endingPNGstory(PNG)
//Chiamiamo questa funzione a fine riscrittura, per fare tutti i passaggi previsti di quando finisce una storia.
{
    - PNG == FirstCharacter:
        
        ~ story_endedStories += story_firstCharStoryEnded
        ~ firstChar_storyStatus = story_storyEnded
        ~ state_ending_stories(FirstCharacter)
        ~ move_entity(FirstCharacter, Safekeeping)
        ~ firstChar_InkLevel = ink_empty
        ~ firstChar_mailPause = firstChar_mailPauseDuration
        ~ move_entity(firstCharPaint, Bedroom)
        ~ tree_advance_management(FirstCharacter)

    - PNG == SecondCharacter:
        
        ~ story_endedStories += story_secondCharStoryEnded
        ~ secondChar_storyStatus = story_storyEnded
        ~ state_ending_stories(SecondCharacter)
        ~ move_entity(SecondCharacter, Safekeeping)
        ~ secondChar_InkLevel = ink_empty
        ~ secondChar_mailPause = secondChar_mailPauseDuration
        ~ move_entity(secondCharPaint, Bedroom)
        ~ tree_advance_management(SecondCharacter)

    - PNG == ThirdCharacter:
        
        ~ story_endedStories += story_thirdCharStoryEnded
        ~ thirdChar_storyStatus = story_storyEnded
        ~ state_ending_stories(ThirdCharacter)
        ~ move_entity(ThirdCharacter, Safekeeping)
        ~ thirdChar_InkLevel = ink_empty
        ~ thirdChar_mailPause = thirdChar_mailPauseDuration
        //Il ritratto ha senso che compaia solo quando è stato davvero riscritto, praticamente quando lo vediamo a fine gioco
        ~ move_entity(thirdCharPaint, Bedroom)
        ~ tree_advance_management(ThirdCharacter)    

    - PNG == FourthCharacter:
        
        ~ story_endedStories += story_fourthCharStoryEnded
        ~ fourthChar_storyStatus = story_storyEnded
        ~ state_ending_stories(FourthCharacter)
        ~ move_entity(FourthCharacter, Safekeeping)
        ~ fourthChar_InkLevel = ink_empty
        ~ fourthChar_mailPause = fourthChar_mailPauseDuration
        ~ move_entity(fourthCharPaint, Bedroom)
        ~ tree_advance_management(FourthCharacter)

    - PNG == FifthCharacter:
        
        ~ story_endedStories += story_fifthCharStoryEnded
        ~ fifthChar_storyStatus = story_storyEnded
        ~ state_ending_stories(FifthCharacter)
        ~ move_entity(FifthCharacter, Safekeeping)
        ~ fifthChar_InkLevel = ink_empty
        ~ fifthChar_mailPause = fifthChar_mailPauseDuration
        ~ move_entity(fifthCharPaint, Bedroom)
        ~ tree_advance_management(FifthCharacter)    
        
}




//Elementi non dipendenti dallx PNG
~ temp currentPlace = entity_location(PG)
~ move_entity(TrainNoiseGoingAway, currentPlace)
~ numberQuestion = 0
@animation:RewriterBook




//Useremo questo spostamento poi per attivare l'animazione del treno.
            
            
        
-> main  
        
    
=== grimoire_common_storylets_updater

        {
            //First Char
            - first_second_chit_chat && grimoire_firstChar hasnt grimFirstSecondChar:
                ~ grimoire_firstChar += grimFirstSecondChar
                ~ grimoire_secondChar += grimFirstSecondChar

            - first_mentor_chit_chat && grimoire_firstChar hasnt grimFirstCharMentor:
                ~ grimoire_firstChar += grimFirstCharMentor
                ~ grimoire_fifthChar += grimFirstCharMentor

            - frog_and_first_char_chit_chat && grimoire_firstChar hasnt grimFirstCharFranco:
                ~ grimoire_firstChar += grimFirstCharFranco

            - third_first_chit_chat && grimoire_firstChar hasnt grimFirstThirdChar:
                ~ grimoire_firstChar += grimFirstThirdChar
                ~ grimoire_thirdChar += grimFirstThirdChar 

            //Second Char
            - about_violence_and_peace && grimoire_secondChar hasnt grimSecondCharMentorOne:
                ~ grimoire_secondChar += grimSecondCharMentorOne
                ~ grimoire_fifthChar += grimSecondCharMentorOne

            - frog_and_second_char_chit_chat && grimoire_secondChar hasnt grimSecondCharFranco:
                ~ grimoire_secondChar += grimSecondCharFranco

            - third_second_chit_chat && grimoire_secondChar hasnt grimSecondThirdChar:
                ~ grimoire_secondChar += grimSecondThirdChar
                ~ grimoire_thirdChar += grimSecondThirdChar

            //Third Char
            - third_mentor_chit_chat && grimoire_thirdChar hasnt grimThirdCharMentor:
                ~ grimoire_thirdChar += grimThirdCharMentor
                ~ grimoire_fifthChar += grimThirdCharMentor 

            - frog_and_third_char_chit_chat && grimoire_thirdChar hasnt grimThirdCharFranco:
                ~ grimoire_thirdChar += grimThirdCharFranco

            //Mentor
            - the_witch_and_the_mentor && grimoire_fifthChar hasnt grimMentorWitchOne:
                ~ grimoire_fifthChar += grimMentorWitchOne

            - frog_and_mentor_chit_chat && grimoire_fifthChar hasnt grimMentorFranco:
                ~ grimoire_fifthChar += grimMentorFranco              
        }
->->        