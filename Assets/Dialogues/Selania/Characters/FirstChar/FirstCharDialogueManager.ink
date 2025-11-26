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
    {   
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, ma non ho fatto il tutorial su come funziona
        - firstChar_storyletsForRewritingCount >= firstChar_minStoryletsForRewriting && not rewriting_proposal_first_character && not questions:
                -> ask
        
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona                    
        - firstChar_storyletsForRewritingCount >= firstChar_minStoryletsForRewriting && not rewriting_proposal_first_character && questions:
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
                    - Le farfalle qui giocano per ore!
                    - No dai, ma hai visto quanto sono carini gli scoiattoli?
                    - Con il rumore dell'acqua dello stagno ci posso fare una base niente male.
                    - Il Conservatorio è un posto terrificante, {player_name}, ipercompetitivo. Ho ancora gli incubi a volte.
                    - Quando avrò un gatto lo chiamerò Bach, e poi metterò su IG le foto del su Bach-ano. Ok, è terribile, ed è di mio padre.
                    - Forse è la fame, ma prima ho sentito odore di lasagna, giuro!
                    - Ho voglia di leggere qualcosa. Sono secoli che non leggo per mezz'ora di fila in santa pace.
                    - Non so perché ma ti ci vedo a suonare la viola. Hai una faccia da viola.
                    - Se questa cosa mi fosse successa alle elementari, sarei già stata avvelenata dai funghi dello stagno.
                    - Prima ho provato a capire come raggiungere la montagna dietro alla stazione ma zero, non c'è un sentiero che uno.
                    - Chissà cosa starà facendo Ennio in questo momento.
                    - Valeria avrà dato da mangiare al gatto dei vicini? Ce lo hanno affidato durante le vacanze.
                    - Forse avrei dovuto rispondere alla cartolina di Talco. Non pensavo avrei avuto paura di una cartolina.
                    - Prima nello stagno non ho visto il mio riflesso ma quello di una Chitarra e non.voglio.farmi.domande! Né avere risposte.
                    - Lavorare è sopravvalutato.
                }#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 
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
        Vorresti chiedermi qualcosa? #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 
                ~ firstChar_justTalked = false
        

    //Azioni legate alla riscrittura
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, ma non ho fatto il tutorial su come funziona
            + {firstChar_storyletsForRewritingCount >= firstChar_minStoryletsForRewriting && not rewriting_proposal_first_character && not questions} [Vorrei aiutarti a guardare le cose in modo diverso.]
                Ama, parla prima con la mentore così ti dice cosa fare e non le prende una sincope se facciamo casini.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                    ~ mentor_tutorialPauses = false
                        -> main
        
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona                    
            + {firstChar_storyletsForRewritingCount >= firstChar_minStoryletsForRewriting && not rewriting_proposal_first_character && questions} [Ti va di riscrivere la tua storia con me?]
                
                //Incremento le variazioni del libro della Riscrittora           
                ~ book_BGVariations ++
                    -> rewriting_proposal_first_character
    
        //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo          
            + {firstChar_storyletsForRewritingCount >= firstChar_minStoryletsForRewriting && rewriting_proposal_first_character} [Iniziamo la riscrittura?]
                    -> rewriting_proposal_first_character
            
        
    //Azioni legate alla costruzione della relazione
    
        //Offrire un dono
            + {not first_story_gift.ink_outcome && backpack_findedGifts != ()} [Ti vorrei donare questa cosa.]
                        -> first_story_gift
            
        
        //Cucinare assieme    
            + {open_the_kitchen && not ending_cooking_with_first_char && kitchen_firstCharIsCooking==false}[Ti va di cucinare qualcosa assieme?]
                ~ movements_changeLocationTimer = 0
                
                {
                
                    - kitchen_secondCharIsCooking: Uh, mi sa che la cucina è occupata da {charNameTwo}, sta cucinando qualcosa di strano.
                            ->main

                    - kitchen_secondCharCookingTogetherInvite: Credo che {charNameTwo} ti stia già aspettando, sai?
                            ->main

                    - kitchen_firstCharCookingTogetherNumberInvite > 0: {Spero non mi farai aspettare come prima! Ho atteso un sacco!|Siamo a due volte che me lo chiedi e non ti presenti, sai?|E mi darai buca una terza volta? Vabbè.} #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
                        ~ kitchen_firstCharCookingTogetherInvite = true
                        ~ move_entity(FirstCharacter, Kitchen)
                            ->main
                        
                    - else: Volentieri! Ci vediamo in cucina! #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
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




    

