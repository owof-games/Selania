=== third_story_gift ===
    ~ temp charNameTwo = translator(thirdChar_ActualName)
    {charTag(TheWitch, "{witch_state()}")}:   <i>{player_name} sta per donare qualcosa a {charNameTwo}. 
            
            + {backpack_findedGifts != ()} Scelgo il dono.
                ~ gift_currentReceiver += ThirdCharacter
                -> backpack_management
            
            +->
                {charTag(TheWitch, "{witch_state()}")}:   <i>L{player_name} non ha nulla da donare.
                    ->main
            
        
            = ink_outcome
                {
                    - thirdChar_favouritesGifts has thirdChar_giftedObject:
                        Mi hai regalato una cosa STRA-TOS-FE-RI-CA!

                    - thirdChar_goodGifts has thirdChar_giftedObject:
                        Grazie.
                        
                    - else:
                        Sì. No. Boh.

                }

                {charTag(TheWitch, "{witch_state()}")}:   <i>Dopo il dono di {player_name} {inkTranslator(ThirdCharacter)}. 

                     -> main



=== third_character_opinions
~ temp charNameTwo = translator(thirdChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)
~ change_entity_place(Mentor)

    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {shuffle:
        - Cose.
    }
            ~ thirdChar_pauseTalking = thirdChar_pauseDuration
            ~ thirdChar_justTalked = true
                -> options_third_character 
    
    
// === third_char_story_ended
// ~ temp charNameTwo = translator(thirdChar_ActualName)
// //Con questa formula dopo un tot di scambi o di spostamenti la personaggia se ne va salutandoci.

//     {
//         - thirdChar_exitCounter < thirdChar_startingValueExitCounter:
//             -> top
//         - else:
//             -> goodbye
//     }
    
//         - (top)
//         {shuffle:
//                 - Magari da grande posso fare il riscrittore. Ma per gli animali. #speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral
//             }
//                 ~ thirdChar_exitCounter ++
//         -> main
        
//         = goodbye
//         ~ temp charNameTwo = translator(thirdChar_ActualName)
//         ~ move_entity(thirdCharPaint, Bedroom)
        
//             {player_name}, mi sa che torno a casa.
  
//                 ~ temp currentPlace = entity_location(PG)
//                 ~ tree_advance_management(ThirdCharacter)
//                 ~ move_entity(ThirdCharacter, Safekeeping)
//                 ~ thirdChar_mailPause = thirdChar_mailPauseDuration
//                 ~ move_entity(TrainNoiseGoingAway, currentPlace)
                
//                     -> main








    
