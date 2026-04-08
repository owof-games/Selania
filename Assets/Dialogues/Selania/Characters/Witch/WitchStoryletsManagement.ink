=== witch_storylets_management
    {    
        

        //Check per intro
        - not witch_intro:
            -> witch_intro

        //Feedback post riscrittura
        - witch_intro && LIST_COUNT(story_endedStories) > 0 && not witch_first_debrief:
            -> witch_first_debrief

        - witch_intro && LIST_COUNT(story_endedStories) > 1 && not witch_second_debrief:
            -> witch_second_debrief

        - witch_intro && LIST_COUNT(story_endedStories) > 2 && not witch_third_debrief:
            -> witch_third_debrief

        - witch_intro && LIST_COUNT(story_endedStories) > 3 && not witch_fourth_debrief:
            -> witch_fourth_debrief

        - witch_intro && LIST_COUNT(story_endedStories) > 4 && not witch_fifth_debrief:
            -> witch_fifth_debrief    

        //Dialogo su Franco
        - witch_intro && grimoire_franco != () && not the_witch_and_the_frog:
            -> the_witch_and_the_frog
        
        //Apertura di tutti i sigilli
        - firstChar_storyStatus == story_storyEnded && secondChar_storyStatus == story_storyEnded && thirdChar_storyStatus == story_storyEnded && fourthChar_storyStatus == story_storyEnded && fifthChar_storyStatus == story_storyEnded && not witch_allSigils_opening: 
            -> witch_allSigils_opening

        //Pezzi della sua storia. Compaiono linearmente, in base a quante storie ho fatto fino in fondo.
        - LIST_COUNT(listDumpGraphics) > 0 && grimoire_witch hasnt grimWitchMainOne:
            -> witch_first_confession

        - LIST_COUNT(listDumpGraphics) > 1 && grimoire_witch hasnt grimWitchMainTwo:
            -> witch_second_confession

        - LIST_COUNT(listDumpGraphics) > 2 && grimoire_witch hasnt grimWitchMainThree:
            -> witch_third_confession

        - LIST_COUNT(listDumpGraphics) > 3 && grimoire_witch hasnt grimWitchMainFour:
            -> witch_fourth_confession

        - LIST_COUNT(listDumpGraphics) > 4 && grimoire_witch hasnt grimWitchMainFive:
            -> witch_fifth_confession    
        
        //Commento sul libro
        - witch_intro && tutorial_mentorTalkingChoiceRelationship && not about_the_book:
            -> about_the_book
        
        
        - else:
            -> descriptions

    }

