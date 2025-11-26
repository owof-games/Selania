=== knowing_first_character
    ~ temp charNameOne = translator(firstChar_ActualName)
    //Qui man mano faccio avanzare i temi toccati dalla personaggia
        
        //Storylets speciali
        
        {   
            //Apertura cucina
                - are_two_entities_together(FirstCharacter, PG) && (first_char_main_storylets.four or second_char_main_storylets.two) and not open_the_kitchen:
                       {
                           - pondContents has PG:
                               -> open_the_kitchen
                            
                            - else:
                                {stopping:
                                    - Ehi {player_name}! Vediamoci allo stagno. Ho una cosa da mostrarti!
                                    - Scusa, prima c'erano cose più importanti da fare, ma ritroviamoci allo stagno, è importante!
                                    - La terza sarà la volta buona, spero. Ti aspetto allo stagno, preparati perché è una cosa fighissima!
                                    - Bene, vediamo se è l'ultima volta. Vediamoci allo stagno {player_name}, così ti mostro quello che ho combinato!
                                }#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                                    ~ move_entity(FirstCharacter, Pond)
                                    ~ movements_changeLocationTimer = 0
                                        -> main    
                        }
            
            
            //Storylets legati alla cucina        
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
                    
                    
        }
        
        
    //Storylets principali 
        {
            - not first_char_main_storylets.one:
                -> first_char_main_storylets.one
        
            //Chitarra dona il libro a PG -> metto dopo per evitare che parta di nuovo prima delle presentazioni
            - not foundLibro && firstChar_pauseTalking == 0 && not take_this_book:
                -> take_this_book   
                
            - not first_char_main_storylets.two:
                -> first_char_main_storylets.two
                
            - not first_char_main_storylets.three:
                -> first_char_main_storylets.three
                
            - not first_char_main_storylets.four:
                -> first_char_main_storylets.four
                
            - not first_char_main_storylets.five:
                -> first_char_main_storylets.five
                
            - not first_char_main_storylets.six:
                -> first_char_main_storylets.six
                
            - not first_char_main_storylets.seven:
                -> first_char_main_storylets.seven
                
            - not first_char_main_storylets.eight:
                -> first_char_main_storylets.eight
                
            - not first_char_main_storylets.nine:
                -> first_char_main_storylets.nine
                
            - not first_char_main_storylets.ten:
                -> first_char_main_storylets.ten
                
            - not first_char_main_storylets.eleven:
                -> first_char_main_storylets.eleven
                
            - not first_char_main_storylets.twelve:
                -> first_char_main_storylets.twelve
                
            - else:
                -> first_character_opinions
        }
