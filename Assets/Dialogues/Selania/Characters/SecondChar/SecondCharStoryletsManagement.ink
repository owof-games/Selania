=== knowing_second_character
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
        //Qui man mano faccio avanzare i temi toccati dalla personaggia
        {
            - not second_char_main_storylets.one:
                -> second_char_main_storylets.one
                
            - not second_char_main_storylets.two:
                {
                    - entity_location(PG) == Pond:
                        {charTag(SecondCharacter, "energy")}:       C'è una cosa che voglio dirti, ma te la dico quando non sarò allo stagno.
                            ~ move_entity(SecondCharacter, Forest)
                                -> main
                    
                    - else: 
                        -> second_char_main_storylets.two
                }   

            - not second_char_main_storylets.three:
                        -> second_char_main_storylets.three
                
            - not second_char_main_storylets.four:
                {   //Se passo dallo storylet dedicato della mentore
                    - that_little_liar_storylet:
                        -> second_char_main_storylets.four
                    
                    //Altrimenti    
                    - else:
                        -> not_talk
                }
                
            - not second_char_main_storylets.five:
                -> second_char_main_storylets.five
        
            - not second_char_main_storylets.six:
                -> second_char_main_storylets.six
                
            - not second_char_main_storylets.seven:
                -> second_char_main_storylets.seven
                
            - not second_char_main_storylets.eight:
                -> second_char_main_storylets.eight
                
            - not second_char_main_storylets.nine:
                -> second_char_main_storylets.nine
                
            - not second_char_main_storylets.ten:
                -> second_char_main_storylets.ten
                
            - not second_char_main_storylets.eleven:
                -> second_char_main_storylets.eleven
                
            - not second_char_main_storylets.twelve:
                -> second_char_main_storylets.twelve
                
            - else:
                -> second_character_opinions
        }

           
            


