=== third_character ===
~ temp charNameTwo = translator(secondChar_ActualName)

//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(ThirdCharacter, PG) && thirdChar_storyStatus == story_storyStarted} [ThirdCharacter]
            -> talk_with_third_character

        //Chiacchierata in cucina
        + {are_two_entities_together(ThirdCharacter, PG) && thirdChar_storyStatus == story_storyStarted && entity_location(PG)  == Kitchen} [ThirdCharacter]
            -> kitchen_storylets_dispatcher  

        // //Chiacchiera a fine storia
        // + {are_two_entities_together(ThirdCharacter, PG) && thirdChar_storyStatus == story_storyEnded} [ThirdCharacter]
        //     -> third_char_story_ended

        // + ->

        // -> DONE


=== talk_with_third_character ===
~ temp charNameTwo = translator(secondChar_ActualName)
        {

            - thirdChar_pauseTalking == 0:
                -> knowing_third_character

            - else:
                -> options_third_character
        }

=== options_third_character
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
{
    //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, ma non ho fatto il tutorial su come funziona
        - grimoire_thirdChar has thirdChar_minStoryletsForRewriting && not rewriting_proposal_third_character && grimoire_appendices hasnt grimRewritingMentor:
                -> ask

    //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona
        - grimoire_thirdChar has thirdChar_minStoryletsForRewriting && grimoire_thirdChar hasnt grimThirdCharProposal && grimoire_appendices has grimRewritingMentor:
                -> ask

    //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo
        - grimoire_thirdChar has grimThirdCharProposal:
                -> ask

    //Vogliamo offrire un dono
        - thirdChar_giftedObject == () && backpack_findedGifts != ():
                -> ask

    //Vogliamo cucinare assieme (dopo almeno uno storylet assieme)
        - player_accessiblePlaces has Kitchen && grimoire_thirdChar has grimThirdCharOne && grimoire_thirdChar hasnt grimThirdCharKitchenEnded && kitchen_thirdCharIsCooking==false:
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
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        {
            - grimoire_thirdChar has grimThirdCharOne:
                Vuoi chiedermi qualcosa {player_name}? #speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental

            - else:
                Sì? #speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
        }

        ~ thirdChar_justTalked = false

        //Azioni legate alla riscrittura
            //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, ma non ho fatto il tutorial su come funziona
            + {(grimoire_thirdChar has thirdChar_minStoryletsForRewriting) && not rewriting_proposal_third_character && grimoire_appendices hasnt grimRewritingMentor} Ehi {charNameTwo}, ti va di rileggere assieme le cose in modo diverso?
                    Mi sa che {mentorName} vuole dirti qualcosa prima.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
                        {
                            - are_two_entities_together(Mentor,PG):
                            Sì {player_name}, parliamo un attimo!#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
                        }
                            ~ thirdChar_tutorial = true
                                -> main

        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona
            + {grimoire_thirdChar has thirdChar_minStoryletsForRewriting && grimoire_thirdChar hasnt grimThirdCharProposal && grimoire_appendices has grimRewritingMentor} Ehi {charNameTwo}, ti va di rileggere assieme le cose in modo diverso?
                    //Incremento le variazioni del libro della Riscrittora

                            -> rewriting_proposal_third_character

        //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo
                + {grimoire_thirdChar has grimThirdCharProposal} Iniziamo la riscrittura?
                        -> rewriting_proposal_third_character


        //Azioni legate alla costruzione della relazione

            //Offrire un dono
                + {thirdChar_giftedObject == () && backpack_findedGifts != ()} Ti voglio dare questa cosa.
                            -> third_story_gift



            //Cucinare assieme
            + {player_accessiblePlaces has Kitchen && grimoire_thirdChar has grimThirdCharOne && grimoire_thirdChar hasnt grimThirdCharKitchenEnded && kitchen_thirdCharIsCooking==false}Ti va di cucinare qualcosa assieme?

                {
                    - kitchen_firstCharIsCooking:
                        C'è già {charNameOne} che cucina qualcosa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
                            ->main

                    - kitchen_firstCharCookingTogetherInvite:
                        C'è già {charNameOne} che ti sta aspettando.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
                            ->main

                    - kitchen_secondCharIsCooking:
                        C'è già {charNameTwo} che cucina qualcosa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
                            ->main

                    - kitchen_secondCharCookingTogetherInvite:
                        C'è già {charNameTwo} che ti sta aspettando.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
                            ->main        

                    - contentsKitchen has Franco:
                        Ma la mia amica rana ti sta aspettando lì!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
                            ->main


                    - kitchen_kitchenOccupied == true:
                        Sai che ho visto il fumo salire prima? Per cui di sicuro c'è qualcuno!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
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
                            ~ kitchen_kitchenOccupied = true
                                ->main
                }

        //Uscita dalla conversazione
            + <i>Lascio il dialogo.
                -> main
            -
                -> talk_with_third_character




