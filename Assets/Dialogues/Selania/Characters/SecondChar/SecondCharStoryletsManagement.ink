=== knowing_second_character
~ temp charNameTwo = translator(secondChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)

    //Storylets speciali
        {
        //Apertura biblioteca
         - are_two_entities_together(SecondCharacter, PG) && (first_char_main_storylets.five or second_char_main_storylets.three) && contentsKitchen hasnt PG && not open_the_library:
               {
                   - contentsForest has PG:
                        -> open_the_library
                    
                    - else:
                        {stopping:
                                    - Ehi {player_name}! Troviamoci alla foresta. Ho una cosa che devi vedere!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_energy
                                    - Uffa, prima c'era una cosa più importante ma ora dobbiamo assolutamente parlare alla foresta, vieni!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_energy
                                    - Vieni alla foresta, che ti dico quella cosa importante, che non c'è mica una quarta volta vero?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                                    - Mi arrendo. Vediamoci alla foresta, ho una cosa da farti vedere.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                                }
                            ~ move_entity(SecondCharacter, Forest)
                            ~ movements_changeLocationTimer = 0
                                -> main    
               } 
               
        //Apertura nido
        // - are_two_entities_together(SecondCharacter, PG) && (first_char_main_storylets.six or second_char_main_storylets.six) && contentsKitchen hasnt PG && not open_nest:
        //         {
        //            - contentsLibrary has PG:
        //                 -> open_nest
                    
        //             - else:
        //                 Ehi {player_name}! Vediamoci in biblioteca. Ho una cosa da mostrarti!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        //                     ~ move_entity(SecondCharacter, Library)
        //                     ~ movements_changeLocationTimer = 0
        //                         -> main    
        //       }
                    
        //Cucina
            //Riccio sta cucinando ed entriamo in cucina
            - are_two_entities_together(SecondCharacter, PG) && entity_location(PG) == Kitchen && kitchen_secondCharIsCooking == true:
                    -> second_char_cooking_alone
        
            
            //Riccio cucina con noi
            -  are_two_entities_together(SecondCharacter, PG) && entity_location(PG) == Kitchen && not ending_cooking_with_second_char && kitchen_secondCharIsCooking == false:
                    -> cooking_with_second_char        

            //Lettura Riccio
                - are_two_entities_together(SecondCharacter, PG) && library_readStories has Lamia && not a_story_of_rebellion:
                    -> a_story_of_rebellion
                    
        //Commento sul cane    
            - first_character_notes.one && not dog_second_char:
                -> dog_second_char           

        }
        
        //Qui man mano faccio avanzare i temi toccati dalla personaggia
        {
            - not second_char_main_storylets.one:
                -> second_char_main_storylets.one
                
            - not second_char_main_storylets.two:
                {
                    - entity_location(PG) == Pond:
                        C'è una cosa che voglio dirti, ma te la dico quando non sarò allo stagno. #speaker:{secondChar_tag()}#inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_energy
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

           
            


