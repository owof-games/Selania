=== knowing_third_character

    //Qui man mano faccio avanzare i temi toccati dalla personaggia
    {           

        -       are_two_entities_together(ThirdCharacter, PG) && entity_location(PG) == Nest && grimoire_thirdChar hasnt grimThirdOpenNest:
                        -> open_the_nest 

        -       grimoire_thirdChar hasnt grimThirdCharOne:
                        -> third_char_main_storylets.one
            
        -       grimoire_thirdChar hasnt grimThirdCharTwo:
                        -> third_char_main_storylets.two
            
        -       grimoire_thirdChar hasnt grimThirdCharThree:
                        -> third_char_main_storylets.three
            
        -       grimoire_thirdChar hasnt grimThirdCharFour:
                        -> third_char_main_storylets.four
                
        -       grimoire_thirdChar hasnt grimThirdCharFive:
                        -> third_char_main_storylets.five
    
        -       grimoire_thirdChar hasnt grimThirdCharSix:
                        -> third_char_main_storylets.six
            
        -       else:
                        -> third_character_opinions
    }

        
            


