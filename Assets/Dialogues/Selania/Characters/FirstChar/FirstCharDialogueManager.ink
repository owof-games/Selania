=== first_character ===
    //SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
            //Chiacchiera normale
            + {are_two_entities_together(FirstCharacter, PG) && firstChar_storyStatus == story_storyStarted}[FirstCharacter]
                ~ actual_speaker = FirstCharacter
                -> common_storylets

            //Chiacchiera a fine storia
            + {are_two_entities_together(FirstCharacter, PG) && firstChar_storyStatus == story_storyEnded} [FirstCharacter]
                    -> first_char_story_ended
            + ->
                -> DONE




=== talk_with_first_character
    ~ temp charNameOne = translator(firstChar_ActualName)
        {

            - firstChar_pauseTalking == 0:
                -> knowing_first_character
            
            //Chitarra sta cucinando ed entriamo in cucina
            - are_two_entities_together(FirstCharacter, PG) && entity_location(PG) == Kitchen && kitchen_firstCharIsCooking == true:
                -> first_char_cooking_alone
            
            - else:
                -> options_first_character
        }

                    
=== options_first_character
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {   
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylets, ma non ho fatto il tutorial su come funziona
        - firstChar_storyletsForRewritingCount >= firstChar_minStoryletsForRewriting && not rewriting_proposal_first_character && not ink_and_rewriting:
                -> ask
        
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylets, e ho fatto il tutorial su come funziona                    
        - firstChar_storyletsForRewritingCount >= firstChar_minStoryletsForRewriting && not rewriting_proposal_first_character && ink_and_rewriting:
                -> ask
        
        //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo         
        - firstChar_storyletsForRewritingCount >= firstChar_minStoryletsForRewriting && rewriting_proposal_first_character:
                -> ask
        
        //Vogliamo offrire un dono            
        - not first_story_gift.ink_outcome && backpack_findedGifts != ():
                -> ask
        
        //Vogliamo cucinare assieme          
        - open_the_kitchen && not ending_cooking_with_first_char && kitchen_firstCharIsCooking==false:
                -> ask
        
        -else:
            {
            //Stiamo parlando con la PNG, ma non dopo uno storylet, per cui mettiamo del testo
            - firstChar_justTalked == false:   
                {shuffle:
                    - Le farfalle qui giocano per ore!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 

                    - No dai, ma hai visto quanto sono carini gli scoiattoli?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 

                    - Con il rumore dell'acqua dello stagno ci posso fare una base niente male.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 

                    - Il Conservatorio è un posto terrificante, {player_name}, ipercompetitivo. Ho ancora gli incubi a volte.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 

                    - Quando avrò un gatto lo chiamerò Bach, e poi metterò su IG le foto del su Bach-ano. Ok, è terribile, ed è di mio padre.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 

                    - Forse è la fame, ma prima ho sentito odore di lasagna, giuro!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 

                    - Ho voglia di leggere qualcosa. Sono secoli che non leggo per mezz'ora di fila in santa pace.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 

                    - Non so perché ma ti ci vedo a suonare la viola. Hai una faccia da viola.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 

                    - Se questa cosa mi fosse successa alle elementari, sarei già stata avvelenata dai funghi dello stagno.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 

                    - Prima ho provato a capire come raggiungere la montagna dietro alla stazione ma zero, non c'è un sentiero che uno.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 

                    - Chissà cosa starà facendo Ennio in questo momento.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 

                    - Valeria avrà dato da mangiare al gatto dei vicini? Ce lo hanno affidato durante le vacanze.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 

                    - Forse avrei dovuto rispondere alla cartolina di Talco. Non pensavo avrei avuto paura di una cartolina.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 

                    - Prima nello stagno non ho visto il mio riflesso ma quello di una Chitarra e non.voglio.farmi.domande! Né avere risposte.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 

                    - Lavorare è sopravvalutato.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 
                    
                    - Quando esco da qui dovrei dire a Thomas che non lo odio. Spero che non pensi che lo odio, cazzo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious

                    - Eppure più ci penso più sono sicura che {mentorName} sia arrivata qui con me.#inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                        {
                            - are_two_entities_together(Mentor, PG):
                                Impossibile, è una vita che sto qui.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_bored
                                Sicuramente mi confondo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                        }
                }
                    -> main
            //Stiamo parlando con la PNG ma dopo uno storylet, per cui non mettiamo del testo        
            - else:
                ~ firstChar_justTalked = false
                    -> main
            }
    }
    
    = ask
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    //Se arrivo a options da un dialogo, non mostro commenti da parte della PNG, altrimenti sì.
        C'è qualcosa che vuoi chiedermi ama?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 
                ~ firstChar_justTalked = false
        

    //Azioni legate alla riscrittura
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, ma non ho fatto il tutorial su come funziona
            + {firstChar_storyletsForRewritingCount >= firstChar_minStoryletsForRewriting && not rewriting_proposal_first_character && not ink_and_rewriting} [Vorrei aiutarti a leggere le cose in modo diverso.]
                
                Ama, mi sa che conviene che tu parli con la nostra fiorellona qui in giro, così ti dice giusto due cose due importanti.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                Tanto non scappo.
                    ~ mentor_tutorialPauses = false
                        -> main
        
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona                    
            + {firstChar_storyletsForRewritingCount >= firstChar_minStoryletsForRewriting && not rewriting_proposal_first_character && ink_and_rewriting} [Ti va di riscrivere la tua storia con me?]
                
                //Incremento le variazioni del libro della Riscrittora           
                ~ book_BGVariations ++
                    -> rewriting_proposal_first_character
    
        //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo          
            + {firstChar_storyletsForRewritingCount >= firstChar_minStoryletsForRewriting && rewriting_proposal_first_character} [Iniziamo la riscrittura?]
                    -> rewriting_proposal_first_character
            
        
    //Azioni legate alla costruzione della relazione
    
        //Offrire un dono
            + {not first_story_gift.ink_outcome && backpack_findedGifts != ()} [Ti vorrei dare questa cosa.]
                        -> first_story_gift
            
        
        //Cucinare assieme    
            + {open_the_kitchen && not ending_cooking_with_first_char && kitchen_firstCharIsCooking==false}[Ti va di cucinare qualcosa assieme?]
            
                {
                
                    - kitchen_secondCharIsCooking:
                        Uh, mi sa che la cucina è occupata da {charNameTwo}, sta cucinando qualcosa di strano.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                            ->main

                    - contentsKitchen has TheKitchenFrog:
                        C'è già una certa ranocchia che sta aspettando di cucinare con te. #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 
                            ->main
                            
                    - kitchen_secondCharCookingTogetherInvite:
                        Credo che {charNameTwo} ti stia già aspettando, sai?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                            ->main

                    - kitchen_firstCharCookingTogetherNumberInvite > 0 :
                        {stopping:
                            - Ma non farmi aspettare ore come prima, ama.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed

                            - Siamo a due volte che me lo chiedi e non ti presenti, sai?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed

                            - E mi darai buca una terza volta? Vabbè, ci vediamo lì.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed

                            - Oook, riproviamoci di nuovo. Mi diverto così tanto ad aspettarti in cucina!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                        } 
                            ~ kitchen_firstCharCookingTogetherInvite = true
                            ~ kitchen_firstCharCookingTogetherNumberInvite ++
                            ~ move_entity(FirstCharacter, Kitchen)
                                ->main
                        
                    - else:
                        Volentieri! Ci vediamo in cucina!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                            ~ kitchen_firstCharCookingTogetherInvite = true
                            ~ kitchen_firstCharCookingTogetherNumberInvite ++
                            ~ move_entity(FirstCharacter, Kitchen)
                                ->main
                
                }
    
    //Uscita dalla conversazione
        + [<i>Lascio il dialogo.]
                -> main
        -
            -> talk_with_first_character




    

