=== first_character ===
    //SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
            //Chiacchiera normale
            + {are_two_entities_together(FirstCharacter, PG) && firstChar_storyStatus == story_storyStarted && entity_location(PG) != Kitchen} [FirstCharacter]
                -> talk_with_first_character

            //Chiacchierata in cucina
            + {are_two_entities_together(FirstCharacter, PG) && firstChar_storyStatus == story_storyStarted && entity_location(PG)  == Kitchen} [FirstCharacter]
                -> kitchen_storylets_dispatcher


            // //Chiacchiera a fine storia
            // + {are_two_entities_together(FirstCharacter, PG) && firstChar_storyStatus == story_storyEnded} [FirstCharacter]
            //     -> first_char_story_ended
            // + ->
            //     -> DONE




=== talk_with_first_character
    ~ temp charNameOne = translator(firstChar_ActualName)
        {

            - firstChar_pauseTalking == 0:
                -> knowing_first_character
            
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
        - grimoire_firstChar has firstChar_minStoryletsForRewriting && not rewriting_proposal_first_character && not tutorial_mentorInkAndRewriting:
                -> ask
        
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylets, e ho fatto il tutorial su come funziona                    
        - grimoire_firstChar has firstChar_minStoryletsForRewriting && grimoire_firstChar hasnt grimFirstCharProposal && tutorial_mentorInkAndRewriting:
                -> ask
        
        //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo         
        - grimoire_firstChar has grimFirstCharProposal:
                -> ask
        
        //Vogliamo offrire un dono            
        - firstChar_giftedObject == () && backpack_findedGifts != ():
                -> ask
        
        //Vogliamo cucinare assieme          
        - player_accessiblePlaces has Kitchen && grimoire_firstChar hasnt grimFirstCharKitchenEnded && kitchen_firstCharIsCooking==false:
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

                    - Ti dicono che se sei la migliore il mondo ti si aprirà davanti, ma poi puoi laurearti in modo grandioso, e finire comunque a fare la cameriera.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad

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
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    //Se arrivo a options da un dialogo, non mostro commenti da parte della PNG, altrimenti sì.
        {
            - grimoire_firstChar has grimFirstCharOne:
                C'è qualcosa che vuoi chiedermi ama?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 

            - else:
                Serve qualcosa? #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed   


        }

        ~ firstChar_justTalked = false
        

    //Azioni legate alla riscrittura
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, ma non ho fatto il tutorial su come funziona
            + {grimoire_firstChar has firstChar_minStoryletsForRewriting && not rewriting_proposal_first_character && not tutorial_mentorInkAndRewriting} Vorrei aiutarti a leggere la tua storia diversamente.
                
                Ama, mi sa che conviene che tu parli con la nostra fiorellona qui in giro, così ti dice giusto due cose due importanti.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                Tanto non scappo.
                        -> main
        
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona                    
            + {grimoire_firstChar has firstChar_minStoryletsForRewriting && grimoire_firstChar hasnt grimFirstCharProposal && tutorial_mentorInkAndRewriting} Ti va di riscrivere la tua storia con me?
                
                //Incremento le variazioni del libro della Riscrittora           
                    -> rewriting_proposal_first_character
    
        //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo          
            + {grimoire_firstChar has grimFirstCharProposal} Iniziamo la riscrittura?
                    -> rewriting_proposal_first_character
            
        
    //Azioni legate alla costruzione della relazione
    
        //Offrire un dono
            + {firstChar_giftedObject == () && backpack_findedGifts != ()} Ti vorrei dare questa cosa.
                -> first_story_gift
            
        
        //Cucinare assieme    
            + {player_accessiblePlaces has Kitchen && grimoire_firstChar hasnt grimFirstCharKitchenEnded && kitchen_firstCharIsCooking==false}Ti va di cucinare qualcosa assieme?
            
                {
                
                    - kitchen_secondCharIsCooking:
                        Uh, mi sa che la cucina è occupata da {charNameTwo}, sta cucinando qualcosa di strano.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                            ->main

                    - kitchen_thirdCharIsCooking:
                        Mi farebbe piacere ama, ma c'è {charNameThree} a fare non so cosa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                            ->main        

                    - contentsKitchen has Franco:
                        C'è già una certa ranocchia che sta aspettando di cucinare con te. #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 
                            ->main
                            
                    - kitchen_secondCharCookingTogetherInvite:
                        Credo che {charNameTwo} ti stia già aspettando, sai?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                            ->main

                    - kitchen_thirdCharCookingTogetherInvite:
                        Credo che {charNameThree} ti stia già aspettando, sai?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                            ->main

                    - kitchen_kitchenOccupied == true:
                        Accetterei volentieri, ma credo che ora sia occupata, {player_name}. #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 
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
                            ~ kitchen_kitchenOccupied = true
                                ->main
                        
                    - else:
                        Volentieri! Ci vediamo in cucina!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                            ~ kitchen_firstCharCookingTogetherInvite = true
                            ~ kitchen_firstCharCookingTogetherNumberInvite ++
                            ~ move_entity(FirstCharacter, Kitchen)
                            ~ kitchen_kitchenOccupied = true
                                ->main
                
                }
    
    //Uscita dalla conversazione
        + <i>Lascio il dialogo.</i>
                -> main
        -
            -> talk_with_first_character




    

