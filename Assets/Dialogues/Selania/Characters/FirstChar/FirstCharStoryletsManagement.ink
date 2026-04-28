=== knowing_first_character
        ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    //Qui man mano faccio avanzare i temi toccati dalla personaggia
        
    //Storylets principali 
        {
            - not first_char_main_storylets.one:
                -> first_char_main_storylets.one
        
            - not first_char_main_storylets.two:
                -> first_char_main_storylets.two
                
            - not first_char_main_storylets.three:
                -> first_char_main_storylets.three
                
            - not first_char_main_storylets.four:
                -> first_char_main_storylets.four
                
            - not first_char_main_storylets.five:
                -> first_char_main_storylets.five
                
            - not first_char_main_storylets.six:
                -> first_char_main_storylets.six
                
            - not first_char_main_storylets.seven:
                -> first_char_main_storylets.seven
                
            - not first_char_main_storylets.eight:
                -> first_char_main_storylets.eight
                
            - not first_char_main_storylets.nine:
                -> first_char_main_storylets.nine
                
            - not first_char_main_storylets.ten:
                -> first_char_main_storylets.ten
                
            - not first_char_main_storylets.eleven:
                -> first_char_main_storylets.eleven
                
            - not first_char_main_storylets.twelve:
                -> first_char_main_storylets.twelve
                
            - else:
                -> first_character_opinions
        }
