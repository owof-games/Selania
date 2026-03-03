=== knowing_third_character
~ temp charNameTwo = translator(thirdChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)

        //Qui man mano faccio avanzare i temi toccati dalla personaggia
        {
            - not third_char_main_storylets.one:
                -> third_char_main_storylets.one
                
            - not third_char_main_storylets.two:
                {
                    - entity_location(PG) == Pond:
                        C'è una cosa che voglio dirti, ma te la dico quando non sarò allo stagno. #speaker:{thirdChar_tag()}#inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_energy
                            ~ move_entity(ThirdCharacter, Forest)
                                -> main
                    
                    - else: 
                        -> third_char_main_storylets.two
                }   

            - not third_char_main_storylets.three:
                        -> third_char_main_storylets.three
                
            - not third_char_main_storylets.four:
                {   //Se passo dallo storylet dedicato della mentore
                    - that_little_liar_storylet:
                        -> third_char_main_storylets.four
                    
                    //Altrimenti    
                    - else:
                        -> not_talk
                }
                
            - not third_char_main_storylets.five:
                -> third_char_main_storylets.five
        
            - not third_char_main_storylets.six:
                -> third_char_main_storylets.six
                
            - not third_char_main_storylets.seven:
                -> third_char_main_storylets.seven
                
            - not third_char_main_storylets.eight:
                -> third_char_main_storylets.eight
                
            - not third_char_main_storylets.nine:
                -> third_char_main_storylets.nine
                
            - not third_char_main_storylets.ten:
                -> third_char_main_storylets.ten
                
            - not third_char_main_storylets.eleven:
                -> third_char_main_storylets.eleven
                
            - not third_char_main_storylets.twelve:
                -> third_char_main_storylets.twelve
                
            - else:
                -> third_character_opinions
        }

           
            


