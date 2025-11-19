=== second_character ===
~ temp charNameTwo = translator(secondChar_ActualName)

//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(SecondCharacter, PG) && secondChar_storyStatus == story_storyStarted}[SecondCharacter]
            -> talk_with_second_character
        
        //Chiacchiera a fine storia
        + {are_two_entities_together(SecondCharacter, PG) && secondChar_storyStatus == story_storyEnded} [SecondCharacter]
            -> second_char_story_ended
        + ->
    
        -> DONE
    

=== talk_with_second_character ===
~ temp charNameTwo = translator(secondChar_ActualName)
~ actual_speaker = SecondCharacter
        -> common_storylets
    //Se ho storylets disponibili di Riccio e non sono in pausa, passo a quelli.
    - (top)
        {

            - secondChar_pauseTalking == 0:
                -> knowing_second_character

            - else:
                -> options_second_character
        }

=== options_second_character
~ temp charNameTwo = translator(secondChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)
{  
    //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, ma non ho fatto il tutorial su come funziona
        - secondChar_storyletsForRewritingCount > secondChar_minStoryletsForRewriting && not rewriting_proposal_second_character && not questions:
                -> ask
            
    //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona
        - secondChar_storyletsForRewritingCount > secondChar_minStoryletsForRewriting && not rewriting_proposal_second_character && questions:
                -> ask
    
    //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo         
        - secondChar_storyletsForRewritingCount > secondChar_minStoryletsForRewriting && rewriting_proposal_second_character:
                -> ask

    //Vogliamo offrire un dono            
        - not second_story_gift.ink_outcome && backpack_findedGifts != ():
                -> ask
    
    //Vogliamo cucinare assieme (dopo almeno uno storylet assieme)      
        - second_char_main_storylets.one && open_the_kitchen && not cooking_with_second_char && kitchen_secondCharIsCooking==false:
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

        {
            - secondChar_justTalked == false:   
                  {
                        - second_story_gift.ink_outcome:{~Mi sento triste, ti spiace tornare dopo?|Scusa {player_name} ma voglio stare solo.|In questo momento sono giù.}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                        
                        - else: {~Torna dopo.|Ora ho voglia di stare da solo.|Lasciami in pace.|Non ho voglia di parlare.}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
                    }
                        
            - else:
                Vorresti chiedermi qualcosa? #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_energy
                
                ~ secondChar_justTalked = false
        }


    //Azioni legate alla riscrittura
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, ma non ho fatto il tutorial su come funziona
            + {secondChar_storyletsForRewritingCount > secondChar_minStoryletsForRewriting && not rewriting_proposal_second_character && not questions} [{charNameTwo}, ti va di guardare assieme le cose in modo diverso?]
                            Parla prima con {mentorName}, che già mi brontola tantissimo!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                                    ~ secondChar_tutorial = true
                                -> main
        
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona
            + {secondChar_storyletsForRewritingCount > secondChar_minStoryletsForRewriting && not rewriting_proposal_second_character && questions} [{charNameTwo}, ti va di guardare assieme le cose in modo diverso?]
                            -> rewriting_proposal_second_character
                            
        //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo             
            + {secondChar_storyletsForRewritingCount > secondChar_minStoryletsForRewriting && rewriting_proposal_second_character}[Iniziamo la riscrittura?]
                    -> rewriting_proposal_second_character
    
    
    //Azioni legate alla costruzione della relazione
            
        //Offrire un dono
            + {not second_story_gift.ink_outcome && backpack_findedGifts != ()} [Ti vorrei donare questa cosa.]
                        -> second_story_gift

    
        
        //Cucinare assieme
        + {second_char_main_storylets.one && open_the_kitchen && not cooking_with_second_char && kitchen_secondCharIsCooking==false}[Ti va di cucinare qualcosa assieme?]
                ~ movements_changeLocationTimer = 0
                
            {
                - kitchenContents has FirstCharacter: Uh, mi sa che la cucina è occupata da {charNameOne}, sta cucinando qualcosa di strano.
                            ->main
                
                - kitchen_secondCharCookingTogetherInvite: {Spero non mi farai aspettare come prima! Ho atteso un sacco!|Siamo a due volte che me lo chiedi e non ti presenti, sai?|E mi darai buca una terza volta? Vabbè.} #speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:riccio_neutral
                        ~ move_entity(SecondCharacter, Kitchen)
                            ->main
                
                - else: Volentieri! Ci vediamo in cucina! #speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:riccio_neutral
                        ~ move_entity(SecondCharacter, Kitchen)
                        ~ kitchen_secondCharCookingTogetherInvite = true
                            ->main    
            }
                
    //Uscita dalla conversazione        
        + [<i>Lascio il dialogo.]
            -> main
        -
            -> talk_with_second_character


=== knowing_second_character
~ temp charNameTwo = translator(secondChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)

    //Storylets speciali
        {
        //Apertura biblioteca
         - are_two_entities_together(SecondCharacter, PG) && (first_char_main_storylets.five or second_char_main_storylets.three) && kitchenContents hasnt PG && not open_the_library:
               {
                   - forestContents has PG:
                        -> open_the_library
                    
                    - else:
                        Ehi {player_name}! Troviamoci alla foresta. Ho una cosa da mostrarti!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                            ~ move_entity(SecondCharacter, Forest)
                            ~ movements_changeLocationTimer = 0
                                -> main    
               } 
               
        //Apertura nido
        - are_two_entities_together(SecondCharacter, PG) && (first_char_main_storylets.six or second_char_main_storylets.six) && kitchenContents hasnt PG && not open_nest:
                {
                   - libraryContents has PG:
                        -> open_nest
                    
                    - else:
                        Ehi {player_name}! Vediamoci in biblioteca. Ho una cosa da mostrarti!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                            ~ move_entity(SecondCharacter, Library)
                            ~ movements_changeLocationTimer = 0
                                -> main    
              }
                    
        //Cucina
            //Riccio sta cucinando ed entriamo in cucina
            - are_two_entities_together(SecondCharacter, PG) && entity_location(PG) == Kitchen && kitchen_secondCharIsCooking == true:
                    -> second_char_cooking_alone
        
            
            //Riccio cucina con noi
            -  are_two_entities_together(SecondCharacter, PG) && entity_location(PG) == Kitchen && not cooking_with_second_char && kitchen_secondCharIsCooking == false:
                    -> cooking_with_second_char        

            //Lettura Riccio
                - are_two_entities_together(SecondCharacter, PG) && library_readStories has Lamia && not a_story_of_rebellion:
                    -> a_story_of_rebellion

        }
            

    //Qui man mano faccio avanzare i temi toccati dalla personaggia
        {
            - not second_char_main_storylets.one:
                -> second_char_main_storylets.one
            - not second_char_main_storylets.two:
                {   //Se passo dallo storylet dedicato della mentore
                    - that_little_liar_storylet:
                        -> second_char_main_storylets.two
                    //Altrimenti    
                    - else:
                        -> not_talk
                }
                
            - not second_char_main_storylets.three:
                {
                    - entity_location(PG) == Pond:
                        C'è una cosa che voglio dirti, ma te la dico quando non sarò allo stagno. #speaker:{secondChar_tag()}#inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                            ~ move_entity(SecondCharacter, TrainStop)
                                -> main
                    
                    - else: 
                        -> second_char_main_storylets.three
                }   

                
            - not second_char_main_storylets.four:
                -> second_char_main_storylets.four
                
            - not second_char_main_storylets.five:
                -> second_char_main_storylets.five
        
            - not second_char_main_storylets.six:
                -> second_char_main_storylets.six
                
            - not second_char_main_storylets.seven:
                -> second_char_main_storylets.seven
                
            - not second_char_main_storylets.eight:
                -> second_char_main_storylets.eight
                
            - not second_char_main_storylets.nine:
                -> second_char_main_storylets.nine
                
            - not second_char_main_storylets.ten:
                -> second_char_main_storylets.ten
                
            - not second_char_main_storylets.eleven:
                -> second_char_main_storylets.eleven
                
            - not second_char_main_storylets.twelve:
                -> second_char_main_storylets.twelve
                
            - else:
                -> second_character_opinions
        }

           
            


//Questi storylets speciali non tornano sulle opzioni di dialogo, ma sul main        
    = not_talk
        ~ temp mentorName = translator(mentor_ActualName)
        
        {not_talk: 
        
            - 1: Io ODIO {not welcome:quella strega coi petali| {mentorName}}!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                E non ci parlerò
                mai
                MAI
                PIU'!
                Mi ha fatto male!
            - else: {~ Non ci parlo con chi è in combutta con quella!|Hai risolto le cose con quella?|Mi ha fatto male, e tu sei qui a non fare nulla?}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry      
        }
             {
                - are_two_entities_together(Mentor, PG) && (not that_little_liar_storylet):
                    ~ riccioMentoreViciniColpo = true
                    -> that_little_liar_storylet       
                
            }
                -> main
                        
  
        
=== second_story_gift ===
    ~ temp charNameTwo = translator(secondChar_ActualName)
    Stai per donare qualcosa a {charNameTwo}. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + {backpack_findedGifts != ()} [Scelgo il dono.]
                ~ gift_currentReceiver += SecondCharacter
                -> backpack_management
            + {backpack_findedGifts == ()} Il tuo inventario è vuoto. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                ->main
            
        
            = ink_outcome
                Dopo il tuo dono {inkTranslator(secondChar_InkLevel)}. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                    
                     -> main

    
    
=== second_char_story_ended
~ temp charNameTwo = translator(secondChar_ActualName)
//Con questa formula dopo un tot di scambi la personaggia se ne va salutandoci.
//In alcune situazioni questa cosa non c'è, in altre c'è solo se ho determinati status (es: socievole). In altri non c'è la possibilità che la personaggia se ne vada senza averci salutate (e quindi non c'è l'opzione in story_start)

    {
        - secondChar_exitCounter < secondChar_startingValueExitCounter:
            -> top
        - else:
            -> goodbye
    }
    
        - (top)
        {~ Stavo pensando che se divento grande posso andare via di casa.|Magari da grande posso anche portare nonna via dalla casa dei vecchi.|Quando torno a casa chiedo a mio fratello se mi prende un cane.|Mi piace l'idea di tornare a casa ora, ma non di non potere mica tornare qui.|Se vieni a trovarmi ti faccio vedere tutte le statue di mio fratello.|Sarà difficile spiegare questa cosa a papà.}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
                ~ secondChar_exitCounter ++
        -> main
        
        = goodbye
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ move_entity(secondCharPaint, Bedroom)
        ~ saturationVar ++
        
        {player_name}, mi sa che torno a casa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        {
            -secondChar_possibleStates hasnt Riccio:Sì no boh.
                Sai che mi è piaciuta alla fine tutta questa cosa?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                Mi hai regalato il migliore compleanno del mondo.
                Anche se non era mica davvero il mio compleanno.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Vieni a trovarmi una volta.
                Mi mancherai.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            - else: Spero papà non sarà arrabbiato.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic     
        }
            ~ move_entity(SecondCharacter, Safekeeping)
            ~ secondChar_mailPause = secondChar_mailPauseDuration
                -> main


=== second_character_opinions
~ temp charNameTwo = translator(secondChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)
~ change_entity_place(Mentor)

    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {~ Nonna dice che non si scappa dalla periferia. Che papà ce l'ha dentro e se l'è portata anche quando siamo andati a vivere in centro.|Non mi piacciono i cartoni per quelli della mia età. Dicono tutte cose che so già.|Se ci pensi bene dire una bugia o scrivere una storia sono la stessa cosa.|Ogni persona ha un animale dentro secondo me. Prendi {mentorName}: sembra un gufo. Anzi anzi: un avvoltoio! No, dai. Un fagiano, quelli femmina, tutti grigi grigi.|Mio fratello dice che devo fidarmi di più degli adulti, ma secondo me lo dice perché è adulto.|Per me il veterinario è come il druido dei videogiochi, solo non deve tirare dei dadi per salvare gli animali.|Un po' mi piacerebbe dormire e basta, senza pensieri.|Forse non mi dispiace mica che sei qui.|Se vado via di qui vorrei tanto portare la rana con me.}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
            ~ secondChar_pauseTalking = secondChar_pauseDuration
            ~ secondChar_justTalked = true
                -> options_second_character 






    
