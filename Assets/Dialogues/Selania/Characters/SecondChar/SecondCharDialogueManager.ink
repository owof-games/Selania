=== second_character ===
~ temp charNameTwo = translator(secondChar_ActualName)

//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(SecondCharacter, PG) && secondChar_storyStatus == story_storyStarted}[SecondCharacter]
            ~ actual_speaker = SecondCharacter
                -> common_storylets
        
        //Chiacchiera a fine storia
        + {are_two_entities_together(SecondCharacter, PG) && secondChar_storyStatus == story_storyEnded} [SecondCharacter]
            -> second_char_story_ended
        
        + ->
    
        -> DONE
    

=== talk_with_second_character ===
~ temp charNameTwo = translator(secondChar_ActualName)
        {

            - secondChar_pauseTalking == 0:
                -> knowing_second_character

            //Riccio sta cucinando ed entriamo in cucina
            - are_two_entities_together(SecondCharacter, PG) && entity_location(PG) == Kitchen && kitchen_secondCharIsCooking == true:
                -> second_char_cooking_alone    

            - else:
                -> options_second_character
        }

=== options_second_character
~ temp charNameTwo = translator(secondChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)
{  
    //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, ma non ho fatto il tutorial su come funziona
        - secondChar_storyletsForRewritingCount >= secondChar_minStoryletsForRewriting && not rewriting_proposal_second_character && not questions:
                -> ask
            
    //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona
        - secondChar_storyletsForRewritingCount >= secondChar_minStoryletsForRewriting && not rewriting_proposal_second_character && questions:
                -> ask
    
    //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo         
        - secondChar_storyletsForRewritingCount >= secondChar_minStoryletsForRewriting && rewriting_proposal_second_character:
                -> ask

    //Vogliamo offrire un dono            
        - not second_story_gift.ink_outcome && backpack_findedGifts != ():
                -> ask
    
    //Vogliamo cucinare assieme (dopo almeno uno storylet assieme)      
        - second_char_main_storylets.one && open_the_kitchen && not ending_cooking_with_second_char && kitchen_secondCharIsCooking==false:
                -> ask
    
    - else:
        {
            - secondChar_justTalked == false:   
                  {
                        - second_story_gift.ink_outcome:{~Mi sento triste, ti spiace tornare dopo?|Scusa {player_name} ma voglio stare solo.|In questo momento sono giù.}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                            -> main
                        
                        - else: {~Torna dopo.|Ora ho voglia di stare da solo.|Lasciami in pace.|Non ho voglia di parlare.}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
                            -> main
                    }
                        
            - else:
                ~ secondChar_justTalked = false
                -> main
        }

}


                
    = ask
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
        Vorresti chiedermi qualcosa? #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_energy
        
        ~ secondChar_justTalked = false

    
    
        //Azioni legate alla riscrittura
            //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, ma non ho fatto il tutorial su come funziona
                + {secondChar_storyletsForRewritingCount >= secondChar_minStoryletsForRewriting && not rewriting_proposal_second_character && not questions} [{charNameTwo}, ti va di guardare assieme le cose in modo diverso?]
                                Parla prima con {mentorName}, che già mi brontola tantissimo!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                                        ~ secondChar_tutorial = true
                                    -> main
            
            //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona
                + {secondChar_storyletsForRewritingCount >= secondChar_minStoryletsForRewriting && not rewriting_proposal_second_character && questions} [{charNameTwo}, ti va di guardare assieme le cose in modo diverso?]
                //Incremento le variazioni del libro della Riscrittora           
                    ~ book_BGVariations ++
                        -> rewriting_proposal_second_character
                                
            //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo             
                + {secondChar_storyletsForRewritingCount >= secondChar_minStoryletsForRewriting && rewriting_proposal_second_character}[Iniziamo la riscrittura?]
                        -> rewriting_proposal_second_character
        
        
        //Azioni legate alla costruzione della relazione
                
            //Offrire un dono
                + {not second_story_gift.ink_outcome && backpack_findedGifts != ()} [Ti vorrei donare questa cosa.]
                            -> second_story_gift
    
        
            
            //Cucinare assieme
            + {second_char_main_storylets.two && open_the_kitchen && not ending_cooking_with_second_char && kitchen_secondCharIsCooking==false}[Ti va di cucinare qualcosa assieme?]
                    ~ movements_changeLocationTimer = 0
                    
                {
                    - kitchen_firstCharIsCooking:
                        C'è già {charNameOne} che cucina qualcosa. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:riccio_neutral
                            ->main

                    - kitchen_firstCharCookingTogetherInvite:
                        C'è già {charNameOne} che ti sta aspettando. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:riccio_neutral
                            ->main
                    
                    - kitchen_secondCharCookingTogetherNumberInvite > 0: 
                        {stopping:
                            - Prima ti ho aspettato TANTISSIMO! Vado.  #speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:riccio_neutral
                            - Ancora? E poi non ti vedo? Vado. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:riccio_angry
                            - Non mi piace quando mi trattano così, {player_name}. Ti aspetto per la penultima volta.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:riccio_angry
                            - Mmm. Vado. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:riccio_angry
                        }
                            ~ kitchen_secondCharCookingTogetherInvite = true
                            ~ move_entity(SecondCharacter, Kitchen)
                                ->main
                    
                    - else:
                        Yeah! Ci vediamo in cucina! #speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:riccio_emotional
                            ~ move_entity(SecondCharacter, Kitchen)
                            ~ kitchen_secondCharCookingTogetherInvite = true
                                ->main    
                }
                    
        //Uscita dalla conversazione        
            + [<i>Lascio il dialogo.]
                -> main
            -
                -> talk_with_second_character


                        
  
        