=== second_character ===
~ temp charNameTwo = translator(secondChar_ActualName)

//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(SecondCharacter, PG) && secondChar_storyStatus == story_storyStarted} [SecondCharacter]
            -> talk_with_second_character

        // //Chiacchiera a fine storia
        // + {are_two_entities_together(SecondCharacter, PG) && secondChar_storyStatus == story_storyEnded} [SecondCharacter]
        //     -> second_char_story_ended

        // + ->

        // -> DONE


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
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
{
    //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylets, ma non ho fatto il tutorial su come funziona
        - grimoire_secondChar has secondChar_minStoryletsForRewriting && grimoire_appendices hasnt grimRewritingMentor:
                -> ask
        
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylets, e ho fatto il tutorial su come funziona                    
        - grimoire_secondChar has secondChar_minStoryletsForRewriting && grimoire_secondChar hasnt grimSecondCharProposal && grimoire_appendices has grimRewritingMentor:
                -> ask
        
        //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo         
        - grimoire_secondChar has grimSecondCharProposal:
                -> ask
        
        //Vogliamo offrire un dono            
        - secondChar_giftedObject == () && backpack_findedGifts != ():
                -> ask
        
        //Vogliamo cucinare assieme(dopo almeno uno storylet main)
        - player_accessiblePlaces has Kitchen && grimoire_secondChar has grimSecondCharOne && grimoire_secondChar hasnt grimSecondCharKitchenEnded && kitchen_secondCharIsCooking==false:
                -> ask

    - else:
        {
            - secondChar_justTalked == false:
            {
                - not second_char_main_storylets.eight:
                    {shuffle:
                        - Una volta ho salvato un bambino da un incendio e la sua mamma mi ha fatto una torta gigante.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - Sai che so volare? Ma solo quando non mi vede nessuno. E quindi non mi credono.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - Una volta ho trovato un sasso maledetto e ora i grandi mi danno la colpa anche di tutto ma io non faccio mai niente!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - I grandi non lo sanno ma tutti gli scivoli sono elefanti che dormono.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - Mio papà è via sempre perché è un agente segreto, ma non dirlo a nessuno.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - Una volta ho sollevato un camion solo perché mi andava.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - So andare in macchina. Ho anche fatto le gare del mondo per adulti.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - Io non ho paura di nulla.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - Ho letto tutti i libri della scuola e la maestra ora mi usa al posto del computer.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - Percy Jackson racconta la mia storia. Ma papà non vuole farlo sapere e quindi fingo di essere un bambino normale.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - So già fare le equazioni, sono più bravo della maestra.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - A scuola una volta ho fatto un salto altissimo e sono arrivato sul tetto.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - Una volta ho trovato un dinosauro scavando nel parco giochi, ma poi i cani si sono rubati gli ossi!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - Mamma non ci crede ma una volta ho mangiato dieci gelati e non sono stato male ma non me li dà comunque, uffa!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - Ho fatto un tema così bello che la maestra l'ha mandato a tutte le mamme per far vedere che sono il bambino più bravo della scuola!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
                    }
                    -> main

                - else:
                    {shuffle:
                        - Non prendermi in giro, ma le tartarughe mi fanno paura.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - So che l'amico di mio fratello è un fidanzato, ma papà si arrabbia quando lo dico.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - Papà fa anche cose gentili. E quando è felice mi porta a vedere le partite. Ma mi annoio.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - Nonna mi portava al Bingo, diceva che le porto fortuna.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - Sapevi che ci sono delle formiche che coltivano un fungo e se lo mangiano? Non è fighissimo?!?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - Sai che i ghepardi sono così timidi che alcuni zoo gli danno dei cani da supporto?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - Un giorno voglio vedere dal vivo il pinguino blu.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - A volte vorrei solo fare il bambino.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - Mi piacerebbe trovare un opossum qui in giro, sono così buffi!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - Ai topi piace un sacco il solletico alla pancia, ma io mi arrabbio se me lo fanno.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - Una cosa fastidiosa dei grandi è che ti toccano sempre se sei piccolo, e si arrabbiano se ti arrabbi, ma non mi piace essere toccato!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - Le mucche imparano un sacco di cose e sono anche felici quando lo fanno.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - A volte leggo così tanto che mi dimentico del mondo e mi piace tanto tanto.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - C'è una lumaca che può dormire tre anni di fila. Pensa che noia!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral

                        - L'ippopotamo è super aggressivo. E ha la faccia stupida, vero?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral

                        - Franco è convinto che {mentorName} non sia di questo posto.
                            {
                                - are_two_entities_together(Mentor, PG):
                                    Franco è anche convinto che {charNameOne} abbia un nido sugli alberi.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                                    Sì no boh.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                                    Hai ragione.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic

                            }
                    }
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
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        {
            - grimoire_secondChar has grimSecondCharOne:
                Vuoi chiedermi qualcosa {player_name}? #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_energy

            - else:
                Sì? #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral  
        }

        ~ secondChar_justTalked = false

        //Azioni legate alla riscrittura
            //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, ma non ho fatto il tutorial su come funziona
            + {grimoire_secondChar has secondChar_minStoryletsForRewriting && grimoire_appendices hasnt grimRewritingMentor} Ehi {charNameTwo}, ti va di rileggere assieme le cose in modo diverso?
                    Mi sa che {mentorName} vuole dirti qualcosa prima.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
                        {
                            - are_two_entities_together(Mentor,PG):
                            Sì {player_name}, parliamo un attimo!#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
                        }
                            ~ secondChar_tutorial = true
                                -> main

        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona
            + {grimoire_secondChar has secondChar_minStoryletsForRewriting && grimoire_secondChar hasnt grimSecondCharProposal && grimoire_appendices has grimRewritingMentor} Ehi {charNameTwo}, ti va di rileggere assieme le cose in modo diverso?
                    //Incremento le variazioni del libro della Riscrittora
                        ~ book_BGVariations ++
                            -> rewriting_proposal_second_character

        //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo
                + {grimoire_secondChar has grimSecondCharProposal} Iniziamo la riscrittura?
                        -> rewriting_proposal_second_character


        //Azioni legate alla costruzione della relazione

            //Offrire un dono
                + {secondChar_giftedObject == () && backpack_findedGifts != ()} Ti voglio dare questa cosa.
                            -> second_story_gift



            //Cucinare assieme
            + {player_accessiblePlaces has Kitchen && grimoire_secondChar has grimSecondCharOne && grimoire_secondChar hasnt grimSecondCharKitchenEnded && kitchen_secondCharIsCooking==false}Ti va di cucinare qualcosa assieme?

                {
                    - kitchen_firstCharIsCooking:
                        C'è già {charNameOne} che cucina qualcosa. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:riccio_energy
                            ->main

                    - kitchen_firstCharCookingTogetherInvite:
                        C'è già {charNameOne} che ti sta aspettando. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:riccio_neutral
                            ->main

                    - kitchen_thirdCharIsCooking:
                        C'è già {charNameThree} che cucina qualcosa. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:riccio_energy
                            ->main

                    - kitchen_thirdCharCookingTogetherInvite:
                        C'è già {charNameThree} che ti sta aspettando. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:riccio_neutral
                            ->main       

                    - contentsKitchen has Franco:
                        Ma la mia amica rana ti sta aspettando lì! #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_energy
                            ->main

                    - kitchen_kitchenOccupied == true:
                        Sai che ho visto il fumo salire prima? Per cui di sicuro c'è qualcuno!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:riccio_melanchonic
                            ->main 

                    - kitchen_secondCharCookingTogetherNumberInvite > 0:
                        {stopping:
                            - Prima ti ho aspettato TANTISSIMO! Vado.  #speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:riccio_neutral

                            - Ancora? E poi non ti vedo? Vado. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:riccio_angry

                            - Non mi piace quando mi trattano così, {player_name}. Ti aspetto per la penultima volta.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:riccio_angry

                            - Mmm. Vado. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:riccio_angry
                        }
                            ~ kitchen_secondCharCookingTogetherInvite = true
                            ~ kitchen_secondCharCookingTogetherNumberInvite ++
                            ~ move_entity(SecondCharacter, Kitchen)
                            ~ kitchen_kitchenOccupied = true
                                ->main

                    - else:
                        Yeah! Ci vediamo in cucina! #speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:riccio_emotional
                            ~ move_entity(SecondCharacter, Kitchen)
                            ~ kitchen_secondCharCookingTogetherInvite = true
                            ~ kitchen_secondCharCookingTogetherNumberInvite ++
                                ->main
                }

        //Uscita dalla conversazione
            + <i>Lascio il dialogo.
                -> main
            -
                -> talk_with_second_character




