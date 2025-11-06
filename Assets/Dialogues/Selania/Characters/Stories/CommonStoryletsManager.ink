=== common_storylets
    {
        //Storylets per aperture luoghi
            //Apertura cucina
            - are_two_entities_together(FirstCharacter, PG) && (knowing_first_character.three or knowing_second_character.one) and not open_the_kitchen:
                   {
                       - pondContents has PG:
                           -> open_the_kitchen
                        
                        - else:
                            Ehi {name}! Vediamoci allo stagno. Ho una cosa da mostrarti!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_curious
                                ~ move_entity(FirstCharacter, Pond)
                                ~ changeLocationTimer = 0
                                    -> main    
                    }
            
            //Apertura biblioteca
             - are_two_entities_together(SecondCharacter, PG) && (knowing_first_character.five or knowing_second_character.three) && kitchenContents hasnt PG && not open_the_library:
                   {
                       - forestContents has PG:
                            -> open_the_library
                        
                        - else:
                            Ehi {name}! Troviamoci alla foresta. Ho una cosa da mostrarti!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:thirdPNG_neutral
                                ~ move_entity(SecondCharacter, Forest)
                                ~ changeLocationTimer = 0
                                    -> main    
                   } 
                   
            //Apertura nido
            - are_two_entities_together(SecondCharacter, PG) && (knowing_first_character.six or knowing_second_character.six) && kitchenContents hasnt PG && not open_nest:
                    {
                       - libraryContents has PG:
                            -> open_nest
                        
                        - else:
                            Ehi {name}! Vediamoci in biblioteca. Ho una cosa da mostrarti!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:riccio_neutral
                                ~ move_entity(SecondCharacter, Library)
                                ~ changeLocationTimer = 0
                                    -> main    
                  }  
        
        //Storylets legati alla cucina
            //Chitarra
                
                
                //Chitarra sta cucinando ed entriamo in cucina
                - are_two_entities_together(FirstCharacter, PG) && entity_location(PG) == Kitchen && firstIsCooking == true:
                        -> first_char_cooking_alone
            
                //Chitarra ha cucinato, e vediamo la scena del dono (a sé stessa)
                - are_two_entities_together(FirstCharacter, PG) && first_char_cooking_tracker && firstIsCooking == false && not food_gift_first_char:
                        -> food_gift_first_char
                
                //Chitarra cucina con noi
                -  are_two_entities_together(FirstCharacter, PG) && entity_location(PG) == Kitchen && not cooking_with_first_char && firstIsCooking == false:
                        -> cooking_with_first_char
            
            
            //Riccio

                //Riccio sta cucinando ed entriamo in cucina
                - are_two_entities_together(SecondCharacter, PG) && entity_location(PG) == Kitchen && secondIsCooking == true:
                        -> second_char_cooking_alone
            
                //Riccio ha cucinato, e vediamo la scena del dono
                - are_two_entities_together(SecondCharacter, PG) && are_two_entities_together(Mentor, PG) && second_char_cooking_tracker && secondIsCooking == false && not food_gift_second_char:
                        -> food_gift_second_char
                
                //Riccio cucina con noi
                -  are_two_entities_together(SecondCharacter, PG) && entity_location(PG) == Kitchen && not cooking_with_second_char && secondIsCooking == false:
                        -> cooking_with_second_char        
    
        
        //Storylets gestiti anche dalla rana
            //Lettura Chitarra
                - are_two_entities_together(FirstCharacter, PG) && readStories has Salvo:
                    -> a_story_of_transformation
        
        
        
        //Storylets vari
            //Chiacchiere tra Riccio e Chitarra
            - are_two_entities_together(FirstCharacter, PG) && are_two_entities_together(SecondCharacter, PG) && not first_second_chit_chat:
                -> first_second_chit_chat
                
            //Chitarra dona il libro a PG
            - not foundLibro && (knowing_first_character ==true) && firstPauseTalking == 0 && not take_this_book:
                -> take_this_book
            
            //Mentore e Riccio parlano dopo il litigio
            - are_two_entities_together(Mentor, PG) && are_two_entities_together(SecondCharacter, PG) && addressing_violence && not about_violence_and_peace:
                -> about_violence_and_peace
            
            //Discussione Mentore e Riccio legata a Rana
            - are_two_entities_together(Mentor, PG) && activeMissions has specialMissionOne && not special_mission_one_dialogue:
                -> special_mission_one_dialogue
            
            //Mentore esplode
            - are_two_entities_together(Mentor, PG) && thirdStory == StoryEnded and not mentor_rage:
                -> mentor_rage
                
            
            - else:
                ->->
    }
->->
