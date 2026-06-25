=== knowing_second_character
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
        //Qui man mano faccio avanzare i temi toccati dalla personaggia
        {   
            - grimoire_secondChar hasnt grimSecondCharOne:
                -> second_char_main_storylets.one
                
            - grimoire_secondChar hasnt grimSecondCharTwo:
                {
                    - entity_location(PG) == Pond:
                        {charTag(SecondCharacter, "energy")}:       C'è una cosa che voglio dirti, ma te la dico quando non sarò allo stagno.
                            ~ move_entity(SecondCharacter, Forest)
                            ~ secondChar_frogPresentationPause = true
                                -> main
                    
                    - else: 
                        -> second_char_main_storylets.two
                }   

            - (grimoire_secondChar hasnt grimSecondCharThreeHer) && (grimoire_secondChar hasnt grimSecondCharThreeHim) && (grimoire_secondChar hasnt grimSecondCharThreeThey):
                        -> second_char_main_storylets.three
                
            - grimoire_secondChar hasnt grimSecondCharFour:
                {   //Se passo dallo storylet dedicato della mentore
                    - that_little_liar_storylet:
                        -> second_char_main_storylets.four
                    
                    //Altrimenti    
                    - else:
                        -> not_talk
                }
                
            - grimoire_secondChar hasnt grimSecondCharFive:
                -> second_char_main_storylets.five
        
            - grimoire_secondChar hasnt grimSecondCharSix:
                -> second_char_main_storylets.six
                
            - grimoire_secondChar hasnt grimSecondCharSeven:
                -> second_char_main_storylets.seven
                
            - grimoire_secondChar hasnt grimSecondCharEight:
                -> second_char_main_storylets.eight
                
            - grimoire_secondChar hasnt grimSecondCharNine:
                -> second_char_main_storylets.nine
                
            - grimoire_secondChar hasnt grimSecondCharTen:
                -> second_char_main_storylets.ten
                
            - grimoire_secondChar hasnt grimSecondCharEleven:
                -> second_char_main_storylets.eleven
                
            - grimoire_secondChar hasnt grimSecondCharTwelve:
                -> second_char_main_storylets.twelve
                
            - else:
                -> second_character_opinions
        }

           
            


