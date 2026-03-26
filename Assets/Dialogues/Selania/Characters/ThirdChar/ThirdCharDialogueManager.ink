=== third_character ===
~ temp charNameTwo = translator(thirdChar_ActualName)

//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(ThirdCharacter, PG) && thirdChar_storyStatus == story_storyStarted} [ThirdCharacter]
            -> talk_with_third_character

        //Chiacchiera a fine storia
        + {are_two_entities_together(ThirdCharacter, PG) && thirdChar_storyStatus == story_storyEnded} [ThirdCharacter]
            -> third_char_story_ended

        + ->

        -> DONE


=== talk_with_third_character ===
~ temp charNameTwo = translator(thirdChar_ActualName)
        {

            - thirdChar_pauseTalking == 0:
                -> knowing_third_character

            //Riccio sta cucinando ed entriamo in cucina
            - are_two_entities_together(ThirdCharacter, PG) && entity_location(PG) == Kitchen && kitchen_thirdCharIsCooking == true:
                -> third_char_cooking_alone

            - else:
                -> options_third_character
        }

=== options_third_character
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
{
    //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, ma non ho fatto il tutorial su come funziona
        - thirdChar_storyletsForRewritingCount >= thirdChar_minStoryletsForRewriting && about_violence_and_peace && not rewriting_proposal_third_character && not tutorial_mentorInkAndRewriting:
                -> ask

    //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona
        - thirdChar_storyletsForRewritingCount >= thirdChar_minStoryletsForRewriting && about_violence_and_peace && not rewriting_proposal_third_character && tutorial_mentorInkAndRewriting:
                -> ask

    //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo
        - thirdChar_storyletsForRewritingCount >= thirdChar_minStoryletsForRewriting && about_violence_and_peace && rewriting_proposal_third_character:
                -> ask

    //Vogliamo offrire un dono
        - not third_story_gift.ink_outcome && backpack_findedGifts != ():
                -> ask

    //Vogliamo cucinare assieme (dopo almeno uno storylet assieme)
        - third_char_main_storylets.four && open_the_kitchen && not ending_cooking_with_third_char && kitchen_thirdCharIsCooking==false:
                -> ask

    - else:
        {
            - thirdChar_justTalked == false:
            {
                - not third_char_main_storylets.eight:
                    {shuffle:
                        - Una volta ho salvato un bambino da un incendio e la sua mamma mi ha fatto una torta gigante.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental

                        - Sai che so volare? Ma solo quando non mi vede nessuno. E quindi non mi credono.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental

                    }
                    -> main

                - else:
                    {shuffle:
                        - Non prendermi in giro, ma le tartarughe mi fanno paura.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental

                        - Franco è convinto che {mentorName} non sia di questo posto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
                            {
                                - are_two_entities_together(Mentor, PG):
                                    Franco è anche convinto che {charNameOne} abbia un nido sugli alberi.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                                    Sì no boh.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                                    Hai ragione.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic

                            }
                    }
                    -> main
            }

            - else:
                ~ thirdChar_justTalked = false
                -> main
        }


}

    = ask
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        Vuoi chiedermi qualcosa {player_name}?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental

        ~ thirdChar_justTalked = false

        //Azioni legate alla riscrittura
            //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, ma non ho fatto il tutorial su come funziona
            + {(thirdChar_storyletsForRewritingCount >= thirdChar_minStoryletsForRewriting) && not rewriting_proposal_third_character && not tutorial_mentorInkAndRewriting} Ehi {charNameTwo}, ti va di rileggere assieme le cose in modo diverso?
                    Mi sa che {mentorName} vuole dirti qualcosa prima.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
                        {
                            - are_two_entities_together(Mentor,PG):
                            Sì {player_name}, parliamo un attimo!#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
                        }
                            ~ thirdChar_tutorial = true
                                -> main

        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona
            + {(thirdChar_storyletsForRewritingCount >= thirdChar_minStoryletsForRewriting) && not rewriting_proposal_third_character && tutorial_mentorInkAndRewriting} Ehi {charNameTwo}, ti va di rileggere assieme le cose in modo diverso?
                    //Incremento le variazioni del libro della Riscrittora
                        ~ book_BGVariations ++
                            -> rewriting_proposal_third_character

        //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo
                + {thirdChar_storyletsForRewritingCount >= thirdChar_minStoryletsForRewriting && rewriting_proposal_third_character} Iniziamo la riscrittura?
                        -> rewriting_proposal_third_character


        //Azioni legate alla costruzione della relazione

            //Offrire un dono
                + {not third_story_gift.ink_outcome && backpack_findedGifts != ()} Ti voglio dare questa cosa.
                            -> third_story_gift



            //Cucinare assieme
            + {third_char_main_storylets.two && open_the_kitchen && not ending_cooking_with_third_char && kitchen_thirdCharIsCooking==false}Ti va di cucinare qualcosa assieme?

                {
                    - kitchen_firstCharIsCooking:
                        C'è già {charNameOne} che cucina qualcosa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
                            ->main

                    - kitchen_firstCharCookingTogetherInvite:
                        C'è già {charNameOne} che ti sta aspettando.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
                            ->main

                    - contentsKitchen has Franco:
                        Ma la mia amica rana ti sta aspettando lì!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
                            ->main

                    - kitchen_thirdCharCookingTogetherNumberInvite > 0:
                        {stopping:
                            - Prima ti ho aspettato TANTISSIMO! Vado.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental

                            - Ancora? E poi non ti vedo? Vado.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental

                            - Non mi piace quando mi trattano così, {player_name}. Ti aspetto per la penultima volta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental

                            - Mmm. Vado.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
                        }
                            ~ kitchen_thirdCharCookingTogetherInvite = true
                            ~ kitchen_thirdCharCookingTogetherNumberInvite ++
                            ~ move_entity(ThirdCharacter, Kitchen)
                            ~ kitchen_kitchenOccupied = true
                                ->main

                    - else:
                        Yeah! Ci vediamo in cucina!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
                            ~ move_entity(ThirdCharacter, Kitchen)
                            ~ kitchen_thirdCharCookingTogetherInvite = true
                            ~ kitchen_thirdCharCookingTogetherNumberInvite ++
                                ->main
                }

        //Uscita dalla conversazione
            + <i>Lascio il dialogo.
                -> main
            -
                -> talk_with_third_character




