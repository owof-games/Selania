=== witch_storylets_management
    {    
        

        //Check per intro
        - not witch_intro:
            -> witch_intro


        //Dialogo su Franco
        - witch_intro && closed_mission_verify && not the_witch_and_the_frog:
            -> the_witch_and_the_frog
        
        
        - firstChar_storyStatus == story_storyEnded && secondChar_storyStatus == story_storyEnded && thirdChar_storyStatus == story_storyEnded && fourthChar_storyStatus == story_storyEnded && fifthChar_storyStatus == story_storyEnded && not witch_allSigils_opening: 
            -> witch_allSigils_opening

        //Pezzi della sua storia
        - listDumpGraphics has firstStateDump && not witch_first_confession:
            -> witch_first_confession

        - listDumpGraphics has secondStateDump && not witch_second_confession:
            -> witch_second_confession

        - listDumpGraphics has thirdStateDump && not witch_third_confession:
            -> witch_third_confession

        - listDumpGraphics has fourthStateDump && not witch_fourth_confession:
            -> witch_fourth_confession

        - listDumpGraphics has fifthStateDump && not witch_fifth_confession:
            -> witch_fifth_confession    

        //Commento sui glifi
        - not about_glyph_choices:
            -> about_glyph_choices

        //Commento sul libro
        - witch_intro && welcome && not about_the_book:
            -> about_the_book
        
        

        - else:
            -> witch_feedback

    }

