=== mentor_and_first_char_storylets ===
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    {
        - welcome == 0:
            -> welcome
        
        - gifts_and_ink == 0:
            {
                - not talk_with_first_character:
                    Hai parlato con la nuova persona?#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                        -> mentor_and_second_char_storylets 
                
                - talk_with_first_character:
                    Sembra che {charNameOne} ti abbia raccontato qualcosa di sè!#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                    Ed è arrivato il momento di continuare con le spiegazioni!
                    -> gifts_and_ink
                
                - else:
                    -> mentor_and_second_char_storylets 
            }
                    
            
        - not questions:
            {
                - first_story_gift.ink_outcome:
                    -> questions
                - else:
                
                {
                    - firstStoryQuestCount >= minStoryQuesTCountFirstChar: Hai fatto il tuo dono a {charNameOne}?#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                            -> mentor_and_second_char_storylets 
                    - else:
                        
                        {
                            - firstStoryQuestCount < 2:
                                Hai bisogno di parlare ancora molto con  {charNameOne}, prima di poterle fare il dono.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                                    -> mentor_and_second_char_storylets 
                            
                            - firstStoryQuestCount < 5:
                                Secondo me sei circa a metà strada prima di poter convincere {charNameOne} a ricevere il tuo dono.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                                    -> mentor_and_second_char_storylets 
                            
                            - else:
                                Ormai ci sei: pochissimi scambi e sento che {charNameOne} sarà pronta ad aprirsi a te.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                                    -> mentor_and_second_char_storylets 
    
                        }
                }
            }
            
    //Feedback
        - not first_character_feedback:
            {
                - firstStory == Ended:
                    -> first_character_feedback
                
                - else:
                    Prenditi il tuo tempo, ma ricordati che presto o tardi dovrai aiutare {charNameOne} a trovare il suo nuovo nome.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                        -> mentor_and_second_char_storylets 
            }
        
        - else:
            -> mentor_and_second_char_storylets 
    
    }


=== mentor_and_second_char_storylets ===
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    {
    
        - not second_character_feedback && secondStory == Ended:
            -> second_character_feedback
            
    
        //Dopo le presentazioni con due:
        - knowing_second_character.one && (not that_little_liar_storylet) :
            -> that_little_liar_storylet
        
        //Se abbiamo visto che manca l'innaffiatoio e/o due ci ha detto che non parla con lei:
        - stolen_watering_can or knowing_second_character.she_hates_me && not watering_can_storylet:
            -> watering_can_storylet
            
            
        - else:
            -> fifth_character_storylets
    
    }


=== fifth_character_storylets ===
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    {
    //Feedback
        - not ending_demo && secondStory == Ended && firstStory == Ended:
            -> ending_demo
        // - not third_character_feedback && thirdStory == Ended:
        //     -> third_character_feedback        
    
        // - not fourth_character_feedback && fourthStory == Ended:
        //     -> fourth_character_feedback        
    
        // - not fifth_character_feedback && fifthStory == Ended:
        //     -> fifth_character_feedback        
        
     
     //Commentario random
        - talking_fungus.first_story_ended_check && not growing_fungus_storylet:
            -> growing_fungus_storylet
        
        
        - else:
            -> talk_with_mentor.talk
    
    }



