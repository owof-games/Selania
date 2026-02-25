=== witch_storylets
    {    
    
        //Dono del libro
        - not foundLibro && not take_this_book:
            -> foundLibro
        
        //Commento sul libro
        - witch_intro && not about_the_book:
            -> about_the_book
            
        //Spiegazione del nido
        - witch_intro && about_nest && not trully_about_nest:
            -> trully_about_nest
        
        //Dialogo su Franco
        - witch_intro && closed_mission_verify && not the_witch_and_the_frog:
            -> the_witch_and_the_frog
        
        
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

        
        
        
        
        
        - else:
            -> witch_feedback

    }

