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
        - secondChar_storyletsForRewritingCount >= secondChar_minStoryletsForRewriting && about_violence_and_peace && not rewriting_proposal_second_character && not questions:
                -> ask
            
    //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona
        - secondChar_storyletsForRewritingCount >= secondChar_minStoryletsForRewriting && about_violence_and_peace && not rewriting_proposal_second_character && questions:
                -> ask
    
    //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo         
        - secondChar_storyletsForRewritingCount >= secondChar_minStoryletsForRewriting && about_violence_and_peace && rewriting_proposal_second_character:
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
                - not second_char_main_storylets.eight:
                    {shuffle:
                        - Una volta ho salvato un bambino da un incendio e la sua mamma mi ha fatto una torta gigante.
                        - Sai che so volare? Ma solo quando non mi vede nessuno. E quindi non mi credono.
                        - Una volta ho trovato un sasso maledetto e ora i grandi mi danno la colpa anche di tutto ma io non faccio mai niente!
                        - I grandi non lo sanno ma tutti gli scivoli sono elefanti che dormono.
                        - Mio papà è via sempre perché è un agente segreto, ma non dirlo a nessuno.
                        - Una volta ho sollevato un camion solo perché mi andava.
                        - So andare in macchina. Ho anche fatto le gare del mondo per adulti.
                        - Io non ho paura di nulla.
                        - Ho letto tutti i libri della scuola e la maestra ora mi usa al posto del computer.
                        - Percy Jackson racconta la mia storia. Ma papà non vuole farlo sapere e quindi fingo di essere un bambino normale.
                        - So già fare le equazioni, sono più bravo della maestra.
                        - A scuola una volta ho fatto un salto altissimo e sono arrivato sul tetto.
                        - Una volta ho trovato un dinosauro scavando nel parco giochi, ma poi i cani si sono rubati gli ossi!
                        - Mamma non ci crede ma una volta ho mangiato dieci gelati e non sono stato male ma non me li dà comunque, uffa!
                        - Ho fatto un tema così bello che la maestra l'ha mandato a tutte le mamme per far vedere che sono il bambino più bravo della scuola!
                    }
                
                - else:
                    {shuffle:
                        - Non prendermi in giro, ma le tartarughe mi fanno paura.
                        - So che l'amico di mio fratello è un fidanzato, ma papà si arrabbia quando lo dico.
                        - Papà fa anche cose gentili. E quando è felice mi porta a vedere le partite. Ma mi annoio.
                        - Nonna mi portava al Bingo, diceva che le porto fortuna.
                        - Sapevi che ci sono delle formiche che coltivano un fungo e se lo mangiano? Non è fighissimo?!?
                        - Sai che i ghepardi sono così timidi che alcuni zoo gli danno dei cani da supporto?
                        - Un giorno voglio vedere dal vivo il pinguino blu.
                        - A volte vorrei solo fare il bambino.
                        - Mi piacerebbe trovare un opossum qui in giro, sono così buffi!
                        - Ai topi piace un sacco il solletico alla pancia, ma io mi arrabbio se me lo fanno.
                        - Una cosa fastidiosa dei grandi è che ti toccano sempre se sei piccolo, e si arrabbiano se ti arrabbi, ma non mi piace essere toccato!
                        - Le mucche imparano un sacco di cose e sono anche felici quando lo fanno.
                        - A volte leggo così tanto che mi dimentico del mondo e mi piace tanto tanto.
                        - C'è una lumaca che può dormire tre anni di fila. Pensa che noia!
                        - L'ippopotamo è super aggressivo. E ha la faccia stupida, vero?
                    }    
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
    
        Vuoi chiedermi qualcosa {player_name}? #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_energy
        
        ~ secondChar_justTalked = false

    
    
        //Azioni legate alla riscrittura
            //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, ma non ho fatto il tutorial su come funziona
                + {secondChar_storyletsForRewritingCount >= secondChar_minStoryletsForRewriting && not rewriting_proposal_second_character && not questions} [{charNameTwo}, ti va di guardare assieme le cose in modo diverso?]
                        Mi sa che {mentorName} vuole dirti qualcosa prima.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                            {
                                - are_two_entities_together(Mentor,PG): Sì {player_name}, parliamo un attimo!
                            }
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


                        
  
        