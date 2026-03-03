=== special_automatic_storylets
        //Storylets speciali First Character
        {   
            //Invito allo stagno per aprire la cucina
                - are_two_entities_together(FirstCharacter, PG) && (first_char_main_storylets.four or second_char_main_storylets.two) && contentsPond hasnt PG && player_accessiblePlaces hasnt Kitchen:
        
                        {stopping:
                            - Ehi {player_name}! Vediamoci allo stagno. Ho una cosa da mostrarti!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                            - Scusa, prima c'erano cose più importanti da fare, ma ritroviamoci allo stagno, è importante!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                            - La terza sarà la volta buona, spero. Ti aspetto allo stagno, preparati perché è una cosa fighissima!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                            - Bene, vediamo se è l'ultima volta. Vediamoci allo stagno {player_name}, così ti mostro quello che ho combinato!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                        }
                            ~ move_entity(FirstCharacter, Pond)
                            ~ movements_randomizable_characters -= FirstCharacter
                                ->->   
                        

            //Apertura cucina
                - are_two_entities_together(FirstCharacter, PG) && (first_char_main_storylets.four or second_char_main_storylets.two) && entity_location(PG) == Pond && player_accessiblePlaces hasnt Kitchen && firstChar_pauseTalking == 0:
                    -> open_the_kitchen

            //Chitarra sta cucinando ed entriamo in cucina
                - are_two_entities_together(FirstCharacter, PG) && entity_location(PG) == Kitchen && kitchen_firstCharIsCooking == true && firstChar_pauseTalking == 0:
                    -> first_char_cooking_alone
            
            //Chitarra ha cucinato, e vediamo la scena del dono (a sé stessa)
                - are_two_entities_together(FirstCharacter, PG) && first_char_cooking_tracker && kitchen_firstCharIsCooking == false && not food_gift_first_char:
                    -> food_gift_first_char
                
            //Chitarra cucina con noi
                -  are_two_entities_together(FirstCharacter, PG) && entity_location(PG) == Kitchen && not ending_cooking_with_first_char && kitchen_firstCharIsCooking == false:
                    -> cooking_with_first_char
                
            //Racconto di Aza letto
                - are_two_entities_together(FirstCharacter, PG) && library_readStories has Aza && not a_story_of_revenge:
                    -> a_story_of_revenge
            
            //Commento sul cane    
                - are_two_entities_together(FirstCharacter, PG) && second_character_notes.one && not dog_first_char:
                    -> dog_first_char      
                    
        }


    //Storylets speciali Second Char
        {
            //Invito alla foresta per aprire la biblioteca
            - are_two_entities_together(SecondCharacter, PG) && (first_char_main_storylets.five or second_char_main_storylets.three) && contentsForest hasnt PG && player_accessiblePlaces hasnt Library:
                
                    {stopping:
                        - Ehi {player_name}! Troviamoci alla foresta. Ho una cosa che devi vedere!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_energy
                        - Uffa, prima c'era una cosa più importante ma ora dobbiamo assolutamente parlare alla foresta, vieni!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_energy
                        - Vieni alla foresta, che ti dico quella cosa importante, che non c'è mica una quarta volta vero?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                        - Mi arrendo. Vediamoci alla foresta, ho una cosa da farti vedere.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    }
                        ~ move_entity(SecondCharacter, Forest)
                        ~ movements_randomizable_characters -= SecondCharacter
                        ->->   


            //Apertura biblioteca    
                - are_two_entities_together(SecondCharacter, PG) && (first_char_main_storylets.five or second_char_main_storylets.three) && entity_location(PG) == Forest && player_accessiblePlaces hasnt Library && firstChar_pauseTalking == 0:
                    -> open_the_library

            //Cucina
                //Riccio sta cucinando ed entriamo in cucina
                - are_two_entities_together(SecondCharacter, PG) && entity_location(PG) == Kitchen && kitchen_secondCharIsCooking == true  && secondChar_pauseTalking == 0:
                    -> second_char_cooking_alone
            
                //Riccio cucina con noi
                -  are_two_entities_together(SecondCharacter, PG) && entity_location(PG) == Kitchen && not ending_cooking_with_second_char && kitchen_secondCharIsCooking == false:
                    -> cooking_with_second_char        

                //Lettura Riccio
                - are_two_entities_together(SecondCharacter, PG) && library_readStories has Lamia && not a_story_of_rebellion:
                    -> a_story_of_rebellion
                        
            //Commento sul cane    
                - are_two_entities_together(SecondCharacter, PG) && first_character_notes.one && not dog_second_char:
                    -> dog_second_char

        }


        {
            //Invito in biblioteca per aprire il nido
            - are_two_entities_together(ThirdCharacter, PG) && (first_char_main_storylets.six or third_char_main_storylets.two) && contentsLibrary hasnt PG && player_accessiblePlaces hasnt Nest:
                
                    {stopping:
                        - Ehi {player_name}! Troviamoci in biblioteca. Ho una cosa che devi vedere!
                    }
                        ~ move_entity(ThirdCharacter, Library)
                        ~ movements_randomizable_characters -= ThirdCharacter
                        ->->   


            //Apertura biblioteca    
                - are_two_entities_together(ThirdCharacter, PG) && (first_char_main_storylets.six or third_char_main_storylets.two) && entity_location(PG) == Library && player_accessiblePlaces hasnt Nest && firstChar_pauseTalking == 0:
                    -> open_the_nest
        }            
    
->->        