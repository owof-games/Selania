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
                    }
            
            //Apertura biblioteca
             - are_two_entities_together(SecondCharacter, PG) && (knowing_first_character.five or knowing_second_character.three) && not open_the_library:
                   {
                       - forestContents has PG:
                            -> open_the_library
                        
                        - else:
                            Ehi {name}! Troviamoci alla foresta. Ho una cosa da mostrarti!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:thirdPNG_neutral
                                
                                ~ move_entity(SecondCharacter, Pond)
                                ~ changeLocationTimer = 0
                   } 
                   
            //Apertura nido
            - are_two_entities_together(SecondCharacter, PG) && (knowing_first_character.six or knowing_second_character.six) and not open_nest:
                    {
                       - libraryContents has PG:
                            -> open_nest
                        
                        - else:
                            Ehi {name}! Vediamoci in biblioteca. Ho una cosa da mostrarti!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:riccio_neutral
                                
                                ~ move_entity(SecondCharacter, Library)
                                ~ changeLocationTimer = 0
                  }  
        
        //Storylets legati alla cucina
            //Chitarra sta cucinando ed entriamo in cucina
            
            
            //Riccio inizia a cucinare. Accade dopo aver fatto pace con Mentore. NOTA: non attiva uno storylet, ma solo uno stato. Lo metto qui per tenere tutto nello stesso punto.
            - about_violence_and_peace && not second_char_cooking_tracker:
                ~ secondIsCooking = true
                ~ move_entity(SecondCharacter, Kitchen)
                    -> second_char_cooking_tracker
            
            //Riccio sta cucinando ed entriamo in cucina
            - are_two_entities_together(SecondCharacter, PG) && entity_location(PG) == Kitchen && not second_char_cooking_alone && secondIsCooking == true:
                    -> second_char_cooking_alone
        
            //Riccio ha cucinato, e vediamo la scena del dono
            - are_two_entities_together(SecondCharacter, PG) && are_two_entities_together(Mentor, PG) && second_char_cooking_tracker && secondIsCooking == false && not food_gift_second_char:
                    -> food_gift_second_char
    
    
        //Storylets vari
            //Chiacchiere tra Riccio e Chitarra
            - are_two_entities_together(FirstCharacter, PG) && are_two_entities_together(SecondCharacter, PG) && not first_second_chit_chat:
                -> first_second_chit_chat
                
            //Chitarra dona il libro a PG
            - not foundLibro && (knowing_first_character ==true) && firstPauseTalking == 0 && not take_this_book:
                -> take_this_book
            
            //Mentore e Riccio parlano dopo il litigio
            - are_two_entities_together(Mentor, PG) && are_two_entities_together(SecondCharacter, PG) && addressing_violence:
                -> about_violence_and_peace
            
            //Mentore esplode
            - are_two_entities_together(Mentor, PG) && thirdStory == StoryEnded and not mentor_rage:
                -> mentor_rage
                
            
            - else:
                ->->
    }
->->
