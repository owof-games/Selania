=== special_automatic_storylets
        //Storylets speciali First Character
        {   
            //Apertura cucina
                - are_two_entities_together(FirstCharacter, PG) && (first_char_main_storylets.four or second_char_main_storylets.two) and not open_the_kitchen && contentsPond hasnt PG:
                       {
                           - entity_location(PG) == Pond:
                               -> open_the_kitchen
                            
                            - else:
                                {stopping:
                                    - Ehi {player_name}! Vediamoci allo stagno. Ho una cosa da mostrarti!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                                    - Scusa, prima c'erano cose più importanti da fare, ma ritroviamoci allo stagno, è importante!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                                    - La terza sarà la volta buona, spero. Ti aspetto allo stagno, preparati perché è una cosa fighissima!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                                    - Bene, vediamo se è l'ultima volta. Vediamoci allo stagno {player_name}, così ti mostro quello che ho combinato!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                                }
                                    ~ move_entity(FirstCharacter, Pond)
                                    ~ movements_randomizable_characters -= FirstCharacter
                                        ->->   
                        }

            //Chitarra sta cucinando ed entriamo in cucina
                - are_two_entities_together(FirstCharacter, PG) && entity_location(PG) == Kitchen && kitchen_firstCharIsCooking == true:
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



->->        