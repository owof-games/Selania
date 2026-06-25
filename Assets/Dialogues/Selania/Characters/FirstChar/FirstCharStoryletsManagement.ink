=== knowing_first_character
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    //Qui man mano faccio avanzare i temi toccati dalla personaggia
        
    //Storylets principali 
        {

            - grimoire_firstChar hasnt grimFirstCharOne:
                -> first_char_main_storylets.one
        
            - grimoire_firstChar hasnt grimFirstCharTwo:
                -> first_char_main_storylets.two
                
            - grimoire_firstChar hasnt grimFirstCharThree:
                -> first_char_main_storylets.three
                
            - grimoire_firstChar hasnt grimFirstCharFour:
                -> first_char_main_storylets.four
                
            - grimoire_firstChar hasnt grimFirstCharFive:
                -> first_char_main_storylets.five
                
            - grimoire_firstChar hasnt grimFirstCharSix:
                -> first_char_main_storylets.six
                
            - grimoire_firstChar hasnt grimFirstCharSeven:
                -> first_char_main_storylets.seven
                
            - grimoire_firstChar hasnt grimFirstCharEight:
                -> first_char_main_storylets.eight
                
            - grimoire_firstChar hasnt grimFirstCharNine:
                -> first_char_main_storylets.nine
                
            - grimoire_firstChar hasnt grimFirstCharTen:
                -> first_char_main_storylets.ten
                
            - grimoire_firstChar hasnt grimFirstCharEleven:
                -> first_char_main_storylets.eleven
                
            - grimoire_firstChar hasnt grimFirstCharTwelve:
                -> first_char_main_storylets.twelve
                
            - else:
                -> first_character_opinions
        }
