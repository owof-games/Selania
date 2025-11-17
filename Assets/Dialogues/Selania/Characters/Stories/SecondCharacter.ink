=== second_character ===
~ temp charNameTwo = translator(secondCharacterState)

//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(SecondCharacter, PG) && secondStory == story_storyStarted}[SecondCharacter]
            -> talk_with_second_character
        
        //Chiacchiera a fine storia
        + {are_two_entities_together(SecondCharacter, PG) && secondStory == story_storyEnded} [SecondCharacter]
            -> second_char_story_ended
        + ->
    
        -> DONE
    

=== talk_with_second_character ===
~ temp charNameTwo = translator(secondCharacterState)
    -> common_storylets ->
    //Se ho storylets disponibili di Riccio e non sono in pausa, passo a quelli.
        {

            - secondPauseTalking == 0:
                -> knowing_second_character

            - else:
                -> options_second_character
        }

=== options_second_character
~ temp charNameTwo = translator(secondCharacterState)
~ temp charNameFive = translator(fifthCharacterState)
{  
    //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, ma non ho fatto il tutorial su come funziona
        - secondStoryQuestCount > minStoryQuesTCountSecondChar && not rewriting_proposal_second_character && not questions:
                -> ask
            
    //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona
        - secondStoryQuestCount > minStoryQuesTCountSecondChar && not rewriting_proposal_second_character && questions:
                -> ask
    
    //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo         
        - secondStoryQuestCount > minStoryQuesTCountSecondChar && rewriting_proposal_second_character:
                -> ask

    //Vogliamo offrire un dono            
        - not second_story_gift.ink_outcome && findedGifts != ():
                -> ask
    
    //Vogliamo cucinare assieme          
        - open_the_kitchen && not cooking_with_second_char && secondIsCooking==false:
                -> ask
    
    
    - else:
        {
            - justTalkedSecondChar == false:   
                  {
                        - second_story_gift.ink_outcome:{~Mi sento triste, ti spiace tornare dopo?|Scusa {player_name} ma voglio stare solo.|In questo momento sono giù.}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                            -> main
                        
                        - else: {~Torna dopo.|Ora ho voglia di stare da solo.|Lasciami in pace.|Non ho voglia di parlare.}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
                            -> main
                    }
                        
            - else:
                ~ justTalkedSecondChar = false
                -> main
        }

}


                
= ask
~ temp charNameOne = translator(firstCharacterState)
~ temp charNameTwo = translator(secondCharacterState)
~ temp charNameFive = translator(fifthCharacterState)

        {
            - justTalkedSecondChar == false:   
                  {
                        - second_story_gift.ink_outcome:{~Mi sento triste, ti spiace tornare dopo?|Scusa {player_name} ma voglio stare solo.|In questo momento sono giù.}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                        
                        - else: {~Torna dopo.|Ora ho voglia di stare da solo.|Lasciami in pace.|Non ho voglia di parlare.}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
                    }
                        
            - else:
                Vorresti chiedermi qualcosa? #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_energy
                
                ~ justTalkedSecondChar = false
        }


    //Azioni legate alla riscrittura
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, ma non ho fatto il tutorial su come funziona
            + {secondStoryQuestCount > minStoryQuesTCountSecondChar && not rewriting_proposal_second_character && not questions} [{charNameTwo}, ti va di guardare assieme le cose in modo diverso?]
                            Parla prima con {charNameFive}, che già mi brontola tantissimo!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                                    ~ secondTutorial = true
                                -> main
        
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona
            + {secondStoryQuestCount > minStoryQuesTCountSecondChar && not rewriting_proposal_second_character && questions} [{charNameTwo}, ti va di guardare assieme le cose in modo diverso?]
                            -> rewriting_proposal_second_character
                            
        //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo             
            + {secondStoryQuestCount > minStoryQuesTCountSecondChar && rewriting_proposal_second_character}[Iniziamo la riscrittura?]
                    -> rewriting_proposal_second_character
    
    
    //Azioni legate alla costruzione della relazione
            
        //Offrire un dono
            + {not second_story_gift.ink_outcome && findedGifts != ()} [Ti vorrei donare questa cosa.]
                        -> second_story_gift

    
        
        //Cucinare assieme
        + {open_the_kitchen && not cooking_with_second_char && secondIsCooking==false}[Ti va di cucinare qualcosa assieme?]
                ~ movements_changeLocationTimer = 0
                
            {
                - kitchenContents has FirstCharacter: Uh, mi sa che la cucina è occupata da {charNameOne}, sta cucinando qualcosa di strano.
                            ->main
                
                - SecondKitchenInvite: {Spero non mi farai aspettare come prima! Ho atteso un sacco!|Siamo a due volte che me lo chiedi e non ti presenti, sai?|E mi darai buca una terza volta? Vabbè.} #speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:riccio_neutral
                        ~ move_entity(SecondCharacter, Kitchen)
                            ->main
                
                - else: Volentieri! Ci vediamo in cucina! #speaker:{secondChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:riccio_neutral
                        ~ move_entity(SecondCharacter, Kitchen)
                        ~ SecondKitchenInvite = true
                            ->main    
            }
                
    //Uscita dalla conversazione        
        + [<i>Lascio il dialogo.]
            -> main
        -
            -> talk_with_second_character


=== knowing_second_character
~ temp charNameTwo = translator(secondCharacterState)
~ temp charNameFive = translator(fifthCharacterState)

    //Storylets speciali
        {
        //Apertura biblioteca
         - are_two_entities_together(SecondCharacter, PG) && (knowing_first_character.five or knowing_second_character.three) && kitchenContents hasnt PG && not open_the_library:
               {
                   - forestContents has PG:
                        -> open_the_library
                    
                    - else:
                        Ehi {player_name}! Troviamoci alla foresta. Ho una cosa da mostrarti!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                            ~ move_entity(SecondCharacter, Forest)
                            ~ movements_changeLocationTimer = 0
                                -> main    
               } 
               
        //Apertura nido
        - are_two_entities_together(SecondCharacter, PG) && (knowing_first_character.six or knowing_second_character.six) && kitchenContents hasnt PG && not open_nest:
                {
                   - libraryContents has PG:
                        -> open_nest
                    
                    - else:
                        Ehi {player_name}! Vediamoci in biblioteca. Ho una cosa da mostrarti!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                            ~ move_entity(SecondCharacter, Library)
                            ~ movements_changeLocationTimer = 0
                                -> main    
              }
                    
        //Cucina
            //Riccio sta cucinando ed entriamo in cucina
            - are_two_entities_together(SecondCharacter, PG) && entity_location(PG) == Kitchen && secondIsCooking == true:
                    -> second_char_cooking_alone
        
            
            //Riccio cucina con noi
            -  are_two_entities_together(SecondCharacter, PG) && entity_location(PG) == Kitchen && not cooking_with_second_char && secondIsCooking == false:
                    -> cooking_with_second_char        

            //Lettura Riccio
                - are_two_entities_together(SecondCharacter, PG) && readStories has Lamia && not a_story_of_rebellion:
                    -> a_story_of_rebellion

        }
            

    //Qui man mano faccio avanzare i temi toccati dalla personaggia
        {
            - not one:
                -> one
            - not two:
                {   //Se passo dallo storylet dedicato della mentore
                    - that_little_liar_storylet:
                        -> two
                    //Altrimenti    
                    - else:
                        -> not_talk
                }
                
            - not three:
                -> three
                
            - not four:
                {
                    - entity_location(PG) == Pond:
                        {~ C'è una cosa che voglio dirti, ma te la dico quando non sarò allo stagno.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral}
                        ~ move_entity(SecondCharacter, TrainStop)
                        -> main
                    - else: 
                        -> four
                }   

            - not five:
                -> five
        
            - not six:
                -> six
                
            - not seven:
                -> seven
                
            - not eight:
                -> eight
                
            - not nine:
                -> nine
                
            - not ten:
                -> ten
                
            - not eleven:
                -> eleven
                
            - not twelve:
                -> twelve
                
            - else:
                -> second_character_opinions
        }

    = one
    //Non mettere cose TW qui
    //Obiettivo: Presentare l’elemento delle bugie. Vengono dette cose sconfessate poi nella terza storia.
    //Contenuto: Compleanno, giochi
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        ~ secondStoryQuestCount ++
        
        Perché sei qui?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            
            + [Questo luogo è assurdo e voglio capirlo.]
                -> color_variation_management(SecondCharacter, blueC)->
                Anche a me mi piace capire le cose.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                I grandi si arrabbiano se faccio troppe domande. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Tipo: perché c'è la neve ma non fa freddo? #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Perché c'è una stazione ma non passa nessun treno?
                Perché c'è una porta vicino alla stazione ma non ci posso entrare?
                    
                
            + [Perché è pieno di cose buffe!]
                -> color_variation_management(SecondCharacter, yellowC)->
                Uh.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Per ora ho esplorato solo la stazione.
                Però il tabellone con le lettere è strano.
                Le lettere non si danno al postino?
                E il postino non le porta alle persone?
                Mica le appende così!
                    
                
            + [Perché <b><i>tu</b></i> sei qui?]
                -> color_variation_management(SecondCharacter, redC)->
                Boh, che ne so? #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Era solo una domanda!
                    

                
            + [Per aiutare chi è in difficoltà.]
                -> color_variation_management(SecondCharacter, greenC)->
                Come il veterinario?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                O come la maestra di ginnastica, che dice di aiutarmi.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Ma poi mi sgrida se sbaglio?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    
                
            + [Per capire meglio chi sono.]
                -> color_variation_management(SecondCharacter, purpleC)->
                Non sai chi sei?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                A me mi piacerebbe essere un'altra persona a volte.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                O un labrador, così se mi rotolo nel fango tutti ridono e non si arrabbiano.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Ma non un gatto: sapevi che i gatti non sentono mica il sapore dolce?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Che cosa triste!
            -    
        
        Io sono qui perché è il mio compleanno. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        Mamma mi ha promesso qualcosa di FIGHISSIMO!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
        L'anno scorso per Natale mi ha preso tutte le action figures dei miei videogiochi preferiti.
        Ma poi papà me le ha rubate tutte. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
            {
                - are_two_entities_together(Mentor, PG):Oh, povera anima!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
            }
        Ma lui mica ci può venire qui.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        Perché mamma ha detto che avrebbe dato solo a me qualcosa di bellissimo che papà non può rubare.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
        Ma dove trovo le caramelle?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        Mamma dice sempre che non c'è compleanno senza caramelle!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            {
                - are_two_entities_together(FirstCharacter, PG): O senza vinello.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_affectionate
            }

            + (twoBlue) [Il compleanno arriva a prescindere dalle caramelle.]
                -> color_variation_management(SecondCharacter, blueC)->
                Forse la data #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Quella sì.
                Ma il compleanno è un'altra cosa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                È un momento tutto tuo.
                E infatti lo puoi festeggiare in ritardo e comunque è il tuo compleanno!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_affectionate
                    
                
            + (twoYellow) [Niente caramelle, ma c'è uno stagno dove nuotare!]
                -> color_variation_management(SecondCharacter, yellowC)->
                FIGO!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Non ho mai visto uno stagno!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Però questa estate ho visto un mare gigantesco.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                Più grande anche del cielo!
                Quello qui non c'è di sicuro!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                    
                
            + (twoRed) [E come ti sei ripreso i giocattoli?]
                -> color_variation_management(SecondCharacter, redC)->
                Non sono mica giocattoli.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Sono AC-TION-FI-GU-RE-S!
                E non me le sono riprese.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Papà è buono, fino a quando non si arrabbia.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                E non voglio farlo arrabbiare.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                    

                
            + (twoGreen) [Vuoi molto bene alla tua mamma?]
                -> color_variation_management(SecondCharacter, greenC)->
                Sì sì sì. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                Lei è la mamma migliore del pianeta.
                Dell'universo.
                    
  
                
            + (twoPurple) [Quindi, rubandoti i giochi, tuo papà ti ha fatto un favore.]
                -> color_variation_management(SecondCharacter, purpleC)->
                Sì no boh.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Non ha senso quello che dici.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Papà non mi deve prendere mica le mie cose.
                Detesto quando fa così.
                    
            -
        Ma dove saranno i miei compagni di scuola?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        Devi assolutamente trovarli!
        
            {
                - are_two_entities_together(Mentor, PG):Vuol dire che c'è più di un bambino?!? Povera me!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
            }
           {
                - are_two_entities_together(FirstCharacter, PG):Ho bisogno di bere. Troppe energie. Troppe.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_annoyed
            }   
        A dopo!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                ~ secondPauseTalking = secondCharPauseDuration
                ~ move_entity(SecondRecap, BookPlace)
                         
        @animation:RewriterBook
        ~ justTalkedSecondChar = true
        -> options_second_character
   
    = two
    //Non mettere cose TW qui
    //Obiettivo: Messa in evidenza della rabbia, ma anche della sua curiosità (finale rosso o finale viola: vede la bellezza nelle cose brutte.)
    //Contenuto: Prima gioia per gli insetti, ecc, poi domande sulla sua violenza alla mentore.
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ temp charNameOne = translator(firstCharacterState)
    ~ secondStoryQuestCount ++
    
    {
        - not about_violence_and_peace:
        ~ change_entity_place(Mentor)
    }
      
        Mi sono ricordato ora che non ho invitato nessun amico.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Mamma vuole che la festa sia solo per me.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Ma non importa, perché questo posto è PIENO di animali!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        Ma ho lasciato a casa il tablet.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Come faccio a capire cosa fanno?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        Sapevi che gli uccelli vedono dieci colori?
        DIECI! Mica solo tre come noi!
        E che l'acso, atso, axotolot si fa ricrescere le braccia?
            + [Gli chiedo perché ha dato un calcio a {charNameFive}.]
                -> top
            + [Lo lascio continuare.]
            -
        E le capre hanno dei loro accenti!
        Non sono mica tutti dei beeeeeeeeee uguali!
        Solo i colibrì sanno volare all'indietro!
        Tu sai camminare indietro? Secondo me no.
        {
            - are_two_entities_together(FirstCharacter, PG):Voglio quello che ha preso questo bimbo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
        }
            + [Gli chiedo perché ha dato un calcio a {charNameFive}.]
                -> top
            + [Lo lascio continuare.]
            -
        I nasi dei cani sotto tutti diversi, non ci sono due cani con lo stesso naso.
        E...
        Ma mi sa che non mi stai mica ascoltando.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Come a scuola.
        A scuola mi prendono in giro perché parlo solo di animali.
        Ma sono comunque il più bravo!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            -> top
        
        //Opzioni, varianti sulla violenza alla mentore, risposte diverse?
     
    - (top)
        {charNameFive} dice che le hai dato un calcio.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
            
            + (twoBlue) [Credevo tu fossi disciplinato. Che delusione.]
                -> color_variation_management(SecondCharacter, blueC)->
                Ehi! Mica mi chiedi perché lo fatto!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Vi odio.
                Tu e lei.
                Mi ha tirato il braccio.
                E continuava a dire che i bambini qui
                non
                ci
                devono
                stare!
                Mi ha fatto arrabbiare.
                    
                
            + (twoYellow) [Perché non le hai fatto uno scherzo?]
                -> color_variation_management(SecondCharacter, yellowC)->
                Perché ero arrabbiato.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                E lei continuava a dire che i bambini qui non ci possono stare.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Che non potevo saltare nello stagno.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                E mi ha messo una mano sulla spalla.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                E a me#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                non
                piace
                quando
                i grandi
                mi toccano.
                    
                
            + (twoRed) [Picchiare una così è un po' da sfigati.]
                -> color_variation_management(SecondCharacter, redC)->
                Mi aveva preso il braccio!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                E continuava a dire che sono un bambino e che i bambini qui non ci devono stare.
                E che devo tornare a casa e io NON ci voglio tornare a casa.
                Non volevo picchiarla.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Volevo solo spingerla via.
                Ma mi sono arrabbiato troppo.
                    

                
            + (twoGreen) [C'è rimasta male, sai?]
                -> color_variation_management(SecondCharacter, greenC)->
                E a me che mi importa?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Mi ha sgridato perché saltavo nello stagno.
                E poi mi ha detto che i bambini qui non ci devono stare.
                E mi ha preso per la spalla.
                Non mi piace quando mi toccano.
                    
  
                
            + (twoPurple) [Hai ottenuto quello che volevi?]
                -> color_variation_management(SecondCharacter, purpleC)->
                Ha smesso di dirmi che non devo stare qui.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Che devo tornare a casa.
                E ha mollato la mia spalla.
                Non le volevo fare mica male.
                Ma non mi piace quando i grandi mi toccano.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    

            -
        Se {charNameFive} non mi lascia in pace chiamo mio fratello.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        Lui è superforte.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
        Ora lasciami in pace.
        {
            - are_two_entities_together(FirstCharacter, PG): Mi ero dimenticata quanto fosse schifoso essere bambini.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_sad
        }
            ~ secondPauseTalking = secondCharPauseDuration
            
            @animation:RewriterBook
            ~ justTalkedSecondChar = true
            -> options_second_character

    = three
    //Non mettere cose TW qui
    //Obiettivo: Mostrare che sta iniziando a non mentire.
    //Contenuto: Ci racconta della rana, possiamo decidere di non credergli o meno.
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        ~ secondStoryQuestCount ++
            {
                - not about_violence_and_peace:
                ~ change_entity_place(Mentor)
            }        
        
        Mica mi hai detto come ti chiami.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            
        - (top)
            * [Prima dimmi il tuo.]
                No, prima mi dici il tuo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    -> top
            + {name_choice} [Mi chiamo {player_name}.]
    	    + [Il mio nome è...]
    	        -> name_choice ->
    	    -
    	    E i miei pronomi sono: #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
    	        -> gender ->
    	    Utile.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral     
    	        
    	 {
    	    - player_pronouns has him:
    	        -> him_liar
    	    - player_pronouns has her:
    	        -> her_liar
    	    - player_pronouns has they:
    	        -> they_liar
    	 }       
    	        
    	        
        	  = him_liar
            	  ~ temp charNameTwo = translator(secondCharacterState)
            	  ~ temp charNameFive = translator(fifthCharacterState)
            	  
            	  Sono contento che sei un maschio.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
            	  {charNameFive} è così noiosa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            	  Vuole cacciarmi.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
            	  Ma io sto qui.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            	  Mamma si è dimenticata di nuovo il mio compleanno.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            	  E da qui non me ne vado!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
            	  Ma a te piacciono le action figures?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            	  Tutti i miei compagni di classe ne hanno, ma io no.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            	  Mamma fa sempre storie se le chiedo di comprarmi qualcosa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            	  Ne avevo una di Kratos.
            	  Ma mamma voleva buttarla perché dice che è troppo violento per un bambino.
            	  E che non devo diventare violento.
            	  E così l'ho regalata a mio fratello.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
            	  E quando vado a trovarlo posso vederla.
            	  E posso giocare con la Switch.
        	            -> three_continue
        	  
        	  = her_liar
        	  ~ temp charNameTwo = translator(secondCharacterState)
        	  ~ temp charNameOne = translator(firstCharacterState)
        	  
            	  Ah.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            	  Sei una ragazza quindi.
            	  Non ci parlo mica molto con le ragazze, siete strane.
                    {
                        - are_two_entities_together(FirstCharacter, PG):Disse quello che prima stava studiando le sue stesse caccole.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_annoyed
                            Tutto è scienza!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    }            	  
            	  
            	  Devo ancora capire se sei strana anche tu, {player_name}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            	  Anche mamma è strana.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            	  Ma le voglio bene.
            	  Anche se a volte si dimentica le cose.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            	  Però se lo faccio io si arrabbia.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
            	  Il mese scorso mi sono dimenticato dell'anniversario suo e di papà e non mi ha parlato tutto il giorno.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            	  Pensava che non le voglio bene.
            	  Ma poi lei oggi si è dimenticata il mio compleanno.
            	  Non so nemmeno se sa che sono qui.
        	            -> three_continue
        	  
        	  = they_liar
        	  ~ temp charNameTwo = translator(secondCharacterState)
        	        Mmm.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        	        Capito.
        	        Anche io vorrei un pronome strano.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
        	        Ma poi mamma lo dice male, sicuro.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        	        Già oggi si è dimenticata del mio compleanno.
        	        E anche l'anno scorso.
        	        Ma poi però mi ha regalato una action figure di Spiderman.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
        	        E mi ha chiesto scusa per due giorni.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        	        Ma preferisco le Tartarughe Ninja.
        	        Così poi vedo i coccodrilli delle fogne.
                    Non ho mai visto un coccodrillo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                    -> three_continue
       
       
        = three_continue 
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameOne = translator(firstCharacterState)
            //Definire meglio in base ai colori.
            
            + {him_liar} [Bugia: hai detto di esser pieno di action figures.]
                    -> color_variation_management(SecondCharacter, blueC)->
                "Pieno" è un modo di dire.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Come "Furbo come una volpe".#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                O "Simpatico come {player_name}".
            
            + {him_liar} [Prima hai detto che tutte le action te le ha rubate tuo padre.]
                    -> color_variation_management(SecondCharacter, redC)->
                No.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Ricordi male.
                Papà è bravo, non fa queste cose. 
               
            
            + {her_liar} [Tua mamma si arrabbia spesso?]
                    -> color_variation_management(SecondCharacter, redC)->
                Un po'.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Non è cattiva, è che sono cattivo io.
                E così perde la pazienza.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Ma è colpa mia.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            
            + {her_liar or they_liar} [Avevi detto che questo è il regalo di compleanno di tua mamma.]
                -> color_variation_management(SecondCharacter, blueC)->
                Sì no boh.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Anche.
                Uffi, che noia che fai!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    
            
                  
            + {they_liar} [Ma non era il suo regalo di compleanno questo?]
                    -> color_variation_management(SecondCharacter, redC)->
                Sì, certo che sì.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Si è dimenticata il compleanno, ma poi ha deciso di farmi questo.
                Per scusarsi.
                E poi mi prenderà un cane!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                   
                 
            + [Ci stai male, quando mamma dimentica il tuo compleanno?]
                -> color_variation_management(SecondCharacter, greenC)->    
                Un po'.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Ma solo perché fa tante promesse tutto l'anno.
                E poi non succede mai niente.
                Voglio festeggiarlo con mio fratello.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                Ma poi papà si arrabbia.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                E così non facciamo mai nulla.
                E allora vado a letto prestissimo e correggo tutta la giornata.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                          
            

            + [Però non mi hai detto il tuo nome. Sei una spia?]
                -> color_variation_management(SecondCharacter, yellowC)->
                Sì no boh.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Una spia non direbbe mai che è una spia.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Oppure ti confonde, così non capisci cosa è vero o cosa no.
                Però tu non puoi mica farlo!
                    
                
                
            + [Sembra che tua mamma sia piena di preoccupazioni.]
                -> color_variation_management(SecondCharacter, purpleC)->
                Mamma è sempre preoccupata di tutto.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Mio fratello prova ad aiutarla, ma a volte si arrabbia perché lei non vuole.
                Dice che ce la vuole fare da sola.
                E anche io ci provo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Lei dice che farsi aiutare è barare.
                Nonna dice che a volte bisogna barare per andare avanti.
                    
 
            -
            Forse dietro tutti quei fiori vicino allo stagno trovo qualche regalo!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            Devo solo capire come andarci.
            A dopo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                 ~ secondPauseTalking = secondCharPauseDuration
                 
                @animation:RewriterBook
                
        ~ justTalkedSecondChar = true
        -> options_second_character
        
        

    
    = four
    //Non mettere cose TW qui
    //Obiettivo: mostrare che ha mentito all'inizio
    //Contenuto: Ci chiede come ci chiamiamo, emerge una bugia diversa a seconda del genere -> Qui però scopriamo che ci mente, possiamo decidere di mettere in evidenza o meno questa bugia, solitudine.
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ temp charNameOne = translator(firstCharacterState)
    ~ secondStoryQuestCount ++
            {
                - not about_violence_and_peace:
                ~ change_entity_place(Mentor)
            }         
    
        Prima ho visto una rana allo stagno.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
        E so tutto sulle rane.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        Che mica chiudono gli occhi per dormire.
        E che alcune sono velenose.
        E velenoso e tossico non sono la stessa cosa.
        Nonna dice che se lo lecchi e stai male, è tossico.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Se lo tocchi e stai male, è velenoso.
        E se ti guarda e stai male, è mamma.
            {
                - are_two_entities_together(FirstCharacter, PG):Questa me la riciclo!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
            
            }
        E so altre cose sulle rane.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        Ma non ho mai visto una rana parlare.
        O fare dei regali.
        E quella dello stagno mi ha parlato.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
        Ma mi ha detto che il regalo è per te invece.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        
            + [Se qualcosa non è mai accaduta, non è per forza impossibile.]
                -> color_variation_management(SecondCharacter, blueC)->
                Quindi mi credi?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                Quindi tutto è possibile?
                Anche che salto e volo?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                O che la serra diventa di cioccolato?
                O che la mentore fa una battuta carina?
                    
                
            + [Speriamo sia il nuovo Super Wario!]
                -> color_variation_management(SecondCharacter, yellowC)->
                Posso giocarci anche io?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                Ma dove lo attacchiamo?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Qui non ci sono TV.
                Però lo stagno sbrilluccica.
                Forse la rana lo trasforma in uno schermo!
                    
                
            + [{charNameTwo}, se continui con le balle non mi fido più di te!]
                -> color_variation_management(SecondCharacter, redC)->
                Non sono balle!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Mi piacciono gli animali.
                Non mi serve inventare altri animali perché quelli che ci sono mi piacciono già.
                La rana c'è, vai a vedere!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    

                
            + [Sembra una rana molto gentile.]
                -> color_variation_management(SecondCharacter, greenC)->
                A me mi sta simpatica.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                E non credo sia tossica o velenosa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Però anche io vorrei un regalo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Se non ti piace mi dai quello che ti dà?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Spero tanto sia un cucciolo.
                O la Play!
                    
  
                
            + [E se lo senti e prudono le orecchie è una bugia.]
                -> color_variation_management(SecondCharacter, purpleC)->
                Non è una bugia!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Perché non mi credi?
                Non siamo amici?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Ti giuro che c'è una rana nello stagno!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    
 
            - (theFrog)
                         
            //Leviamo l'innaffiatoio
            Valla a vedere, ora!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            Che poi se scappa pensi che me lo sono inventato.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                    ~ secondPauseTalking = secondCharPauseDuration
                    
                @animation:RewriterBook
                    
        ~ justTalkedSecondChar = true
    
    
        -> options_second_character
        

    = five
    //Non mettere cose TW qui
    //Obiettivo: Far vedere che c'è qualcosa che non va a casa.
    //Contenuto: Momento di vulnerabilità, ci parla della nonna (ma non ci dice che è morta) e ci dice che è fuggito da casa.
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ temp charNameOne = translator(firstCharacterState)
            {
                - not about_violence_and_peace:
                ~ change_entity_place(Mentor)
            }     
    
    ~ secondStoryQuestCount ++

    
        Nonna non mi tratta mai come un bambino.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
        Mi ha anche insegnato come barare a carte.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        E come aprire il cassetto dei dolci di mamma.
        Quando mamma e papà ci lasciavano a casa da soli mangiavamo sempre cose buone.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        E guardavamo assieme la tele.
        E potevo scegliere cosa guardare.
        Quando papà è andato via nonna ha aiutato mamma a stare bene.
        Anche se a mamma mica piace la nonna.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        E quando papà è tornato ha ripreso a trattarla male.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        Che rabbia.
        Ma nonna dice che succede.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Che i grandi fanno cose cattive senza saperlo.
        Mi spiace essere scappato di casa.
            
            {
                - are_two_entities_together(FirstCharacter, PG):Se Talco fosse qui, ti avrebbe già adottato.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_affectionate
                    Se è grande magari vuole conoscere mio fratello!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    Una cosa non esclude l'altra.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                    Anche se più ne parli più voglio conoscerlo io.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_affectionate
            }        
        Vorrei nonna qui. Sicuro le piace tantissimo questo posto.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
        
        
            + [Non parli mai di tuo nonno. Non c'è più?]
                -> color_variation_management(SecondCharacter, blueC)->
                Se ne è andato quando papà era molto piccolo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Più di me.
                Ogni tanto scriveva delle lettere che facevano arrabbiare mamma.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Poi ha smesso.
                Mamma dice che spera sia anneggato in mare.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Papà invece ha ancora tutte le sue lettere nascoste nel garage.
                    
                
            + [Insegni a barare anche a me?]
                -> color_variation_management(SecondCharacter, yellowC)->
                Ho una idea!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Troviamo delle carte.
                Ti insegno come si bara.
                E poi stracciamo {charNameFive}.
                Così la smette di dirmi cosa non devo fare.
                    
                
            + [Tua nonna sembra una tipa forte!]
                -> color_variation_management(SecondCharacter, redC)->
                "Forte"?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Quanto sei {player_pronouns has him:vecchio|{player_pronouns has her:vecchia|vecchiə}}?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Però sì, lei spacca proprio.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                Una volta ha lanciato una ciabatta in faccia a papà perché l'ha chiamata strega.
                E poi gli ha sputato di nascosto nel caffé.
                E lui si è arrabbiato perché io ridevo mentre lo beveva.
                Abbiamo tantissimi segreti lei e io!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                    

                
            + [Ti manca casa? Vorresti tornare?]
                -> color_variation_management(SecondCharacter, greenC)->
                Sì no boh.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Voglio tornare.
                Ma se poi mamma si arrabbia?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                O papà?
                Voglio andare da mio fratello.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                Lì mi piace.
                Ma non piaccio al suo amico.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                    
  
                
            + [Quando i grandi hanno paura, fanno cose cattive.]
                -> color_variation_management(SecondCharacter, purpleC)->
                Papà dice che i grandi non hanno paura.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Ma non gli credo.
                Mio fratello a volte ha paura che l'amico lo lascia.
                Mamma delle bollette.
                Nonna però non ha paura di nulla.
                Però si arrabbia tanto quando gioca a briscola.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                    
 
            -
        Mi spiace, {player_name}. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Prima ho detto delle bugie.
        Non è vero che mamma mi ha mandato qui.
        Ma volevo così tanto avere un bel compleanno.
        Questo posto è pieno di animali!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
        E nessuno si arrabbia con me.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        A parte {charNameFive}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        Ti prometto che non dirò più bugie.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Ora però lasciami solo.
                ~ secondPauseTalking = secondCharPauseDuration
                
            @animation:RewriterBook
              ~ justTalkedSecondChar = true
              
        -> options_second_character
    

    = six
    //Non mettere cose TW qui
    //Obiettivo: Mostrare sempre il carattere complicato ma anche la posizione complicata socialmente. La scuola è un posto in cui non è al sicuro.
    //Contenuto: Lo accusiamo del furto, da lì emergono alcune cose sulla scuola. A seconda del rapporto, mente per evitare le punizioni, o è sincero. Il discorso dei compagni parte a prescindere.
  
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ temp charNameOne = translator(firstCharacterState)
            {
                - not about_violence_and_peace:
                ~ change_entity_place(Mentor)
            }     
    
    ~ secondStoryQuestCount ++
        
        Dalla serra è scomparso l'innaffiatoio. #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
        ...#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry

            + [Secondo {charNameFive} sei stato tu a prenderlo.]
                Perché lei mi odia.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry

            
            + [Secondo me sei stato tu a prenderlo.]
                Ti odio!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Perché date tutti sempre la colpa a me?
            
            + [Hai idea di dove sia?]
                Pensi che è colpa mia?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            -
     
        Anche a scuola danno sempre la colpa a me. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Non mi piace mica tanto la scuola.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        I ragazzi più grandi mi fanno male.
        Ma io non piango.
        Non sono una femmina.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        E sono più forte di loro.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Ma non coi pugni.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        E le ragazze della mia età sono strane.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        E mi dicono che.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        No, non te lo dico mica.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        E le maestre mi mettono sempre in castigo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        Se mi nascondo nell'armadio perché ho sonno.
        Se spingo gli altri per terra.
        Se mi distraggo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Una volta nonna, quando stava bene, è venuta e ha sgridato tutte le maestre.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
        Ora sono un po' più gentili.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Ma quella di matematica dice sempre che le dispiace per me.
        E non mi piace quando fa così.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        
            + [Anche i maschi piangono, e anche gli orsi e gli elefanti.]
                -> color_variation_management(SecondCharacter, blueC)->
                Gli orsi mi piacciono.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Sono forti.
                Ma comunque piangono.
                Questa è una cosa nuova.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                E mi piace.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Ma non so se mi piace piangere.
                    
                
            + [La scuola è un posto senza fantasia!]
                -> color_variation_management(SecondCharacter, yellowC)->
                Sì no boh.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                A me mi piace tanto raccontare le storie.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Inventare cose nuove.
                Fare gli esperimenti.
                Parlare di animali.
                Ma ogni cosa che faccio fa arrabbiare qualcuno.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Ma se non faccio cose mi annoio.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                E se mi annoio comunque finisco in castigo.
                    
                
            + [Stringi i denti, lotta, diventa più forte degli altri!]
                -> color_variation_management(SecondCharacter, redC)->
                Lo dice anche papà.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Ma a me non mi interessa mica tanto.
                Voglio solo studiare gli animali.
                E che mi lascino in pace.
                    

                
            + [A me spiace per te, sai?]
                -> color_variation_management(SecondCharacter, greenC)->
                Sì no boh.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Non dirlo.
                Non so cosa provo se lo dici.
                Mi viene da piangere.
                Ma non voglio piangere.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Quindi non dirlo più.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    
  
                
            + [I castighi sono inutili. Hai mai imparato qualcosa dai castighi?]
                -> color_variation_management(SecondCharacter, purpleC)->
                A non farmi scoprire.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                I castighi sono proprio brutti.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Sentire tutti che giocano e si divertono.
                E tu non puoi fare nulla.
                Ti viene solo più rabbia.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Sono ingiusti.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                    
 
            -
            //Se fiducia bassa.
            {
                - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 1):
                    Comunque l'innaffiatoio non l'ho mica visto.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    Ma.
                    Sono sicuro che se cerchi bene lo trovi dove l'avete lasciato.
                - else:
                    Non ho mai visto nessun innaffiacoso.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    Non bagno mica le piante, io.
                    Cerca bene e vedi che lo trovi.
            }
            
            //Se fiducia alta.
            Magari l'ha preso {charNameFive}, così poi ti arrabbiavi con me.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
            Che quella non mi vuole mica a me qui.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                    ~ move_entity(WateringCan, Greenhouse)
                    ~ secondPauseTalking = secondCharPauseDuration
                    
                @animation:RewriterBook
                
        ~ justTalkedSecondChar = true
        -> options_second_character
    

    = seven
    //Non mettere cose TW qui
    //Obiettivo: raccontare il suo rapporto con la fantasia e le tensioni in famiglia (finale verde e finale viola)
    //Contenuto: Parla della fantasia, e del fatto che la sera si riscrive la giornata, capiamo che la famiglia litiga spesso. Tensione in casa anche per la morte della nonna
    
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
            {
                - not about_violence_and_peace:
                ~ change_entity_place(Mentor)
            }     
        ~ secondStoryQuestCount ++
        
        La rana prima mi ha detto che tu scrivi storie.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        A me mi piacciono le storie.
        C'è una cosa che non dico mai a nessuno.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Mamma è felice perché vado a letto presto.
        Ma è perché mi piace stare al buio da solo.
        Così posso pensare alle cose che ho fatto durante il giorno.
        E correggere quelle che non mi piacciono.
        Quando uno di quinta mi ha picchiato, la sera ho corretto tutto e l'ho picchiato io.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        E i miei compagni poi erano miei amici così.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
        Una volta ho preso un brutto voto e papà e mamma hanno litigato perché si davano la colpa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Ma allora ho corretto tutto e io non prendevo un brutto voto.
        E andavamo a prendere un gelato.
        E la nonna non era nella casa dei vecchi.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
        E quando papà è tornato dopo essere andato via ed era arrabbiato, invece è tornato con un cane.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Non ho mai avuto un cane.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Sai che i cani sentono suoni fino a duecento metri?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        Se li chiami e non vengono è perché non vogliono.
        Anche io faccio così.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        
            + [Con questa fantasia potresti fare cose più pratiche.]
                -> color_variation_management(SecondCharacter, blueC)->
                Ma non mi servono le cose pratiche.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Mi serve immaginare cose più belle.
                Così le giornate sono più facili.
                    
                
            + [Hai mai corretto una giornata mettendoci vampiri o zombie?]
                -> color_variation_management(SecondCharacter, yellowC)->
                Sì!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Una volta siamo andati in gita a vedere i Camuni.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                E la guida diceva tutte queste cose noiose.
                E a casa ho corretto tutto perché ero un camuno.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                E i disegni sul muro li avevo fatti io.
                E lottavamo contro i cervombie.
                Cervi zombie.
                Ho riso tantissimo quella sera!
                        
                        
            + [Se i grandi ti picchiano, devi fare squadra con gli altri!]
                -> color_variation_management(SecondCharacter, redC)->
                Una volta ci ho provato.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Ma io non piaccio molto agli altri.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Mi dicono che sono scemo, per via degli animali.
                O mi dicono che sono strano.
                E che non gli piace quando mi arrabbio.
                    

                
            + [Grazie per avermi raccontato questa cosa.]
                -> color_variation_management(SecondCharacter, greenC)->
                Sì no boh.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Non è mica una cosa così grossa comunque.
                Però mi piace.
                Non è poi che lo faccio proprio sempre.
                Solo con le cose brutte.
                O quando non succede niente.
                A volte è peggio.
                Non mi piace annoiarmi.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                    
  
                
            + [Come mai se qualcuno ti chiama non rispondi?]
                -> color_variation_management(SecondCharacter, purpleC)->
                Perché se qualcuno mi chiama è arrabbiato con me.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                O mi chiede di fare qualcosa.
                Non succede mai che è per una bella sorpresa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                O per guardare i cartoni assieme.
                    
            -
            Da quando sono qui però non ho riscritto nulla.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            Però ho provato a leccare la rana, ma si è allontanata.
                ~ secondPauseTalking = secondCharPauseDuration
                
                @animation:RewriterBook
                
        ~ justTalkedSecondChar = true
        -> options_second_character     
            
            
    = eight
    //Non mettere cose TW qui
    //Obiettivo: presentare la relazione col fratello maggiore, che è una persona molto pragmatica (finale blu, finale giallo)
    //Contenuti: ci parla del fratello come mito, riferimento, modello. All'inizio mente, ma poi si ridimensiona da solo (sta iniziano a fidarsi).
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ temp charNameOne = translator(firstCharacterState)
            {
                - not about_violence_and_peace:
                ~ change_entity_place(Mentor)
            }     
    
    ~ secondStoryQuestCount ++
        
        Sai che mio fratello è campione di Karate?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        E ha una macchina enorme gialla che fa arrabbiare papà.
        E hai i muscoli che...
        Bugia.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Scusa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Non è proprio campione in realtà.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Però per me è bravissimo.
        E la macchina è di papà.
        Che si arrabbia perché prima era nera, e lui l'ha colorata di giallo.
        Mio fratello è super però.
        Lavora in una officina e nel tempo libero fa delle statue col saldatore e i pezzi rotti delle macchine.
        E vive in una casa piccola piccola assieme al suo amico.
        Viene a trovarci quando non c'è papà perché non si piacciono.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Ma se papà mi fa male allora lo cerca e gli urla addosso tantissime cose.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Mi ha promesso che mi porta a pescare una volta.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
        Senza dirlo a mamma perché lei ha paura perché non so nuotare.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Ma lui sa fare tutto.
        E il suo amico fa dei dolci buonissimi.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
        E anche lui non sa nuotare.
        Ma non mi sembra felice quando vado da loro e quindi ci vado poco.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            
            + [Non devi sapere nuotare per pescare.]
                -> color_variation_management(SecondCharacter, blueC)->
                Esatto!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Ma lei non lo vuole capire.
                "E se cadi in acqua?"
                "E se un'onda ti investe?"
                "E se tuo fratello si distrae?"
                Mamma è davvero pesante.
                    
                
            + [Le statue di tuo fratello si muovono?]
                -> color_variation_management(SecondCharacter, yellowC)->
                Forse quando non ci siamo?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Mio fratello è superdisordinato.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Quindi se si spostano non è che lo capisci con facilità.
                Però gli serve l'elettricità.
                Voglio costruirne una anche io.
                Forse in biblioteca c'è una guida!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                    
                
            + [{charNameTwo}, non devi sempre dare ragione agli adulti.]
                -> color_variation_management(SecondCharacter, redC)->
                Non è mica facile!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Papà se si arrabbia mi picchia.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                E se invece parli dell'amico di mio fratello...#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Credo che lui sia buono.
                Ma se poi si arrabbia con me e non mi vuole più lì?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Poi non ci posso più stare con mio fratello!
                    

                
            + [Hai chiesto all'amico di tuo fratello cosa pensa di te?]
                -> color_variation_management(SecondCharacter, greenC)->
                Scherzi?!?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Non sono mica <b><i>così</b></i> strano.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Però una volta l'ho chiesto a mio fratello.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                E mi ha detto che gli piaccio molto.
                Ma non ci credo.
                Anche perché a quello non gli piacciono i bambini proprio.
                Ed è una cosa che rende molto triste mio fratello.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                    
  
                
            + [Grazie per aver corretto le tue bugie.]
                -> color_variation_management(SecondCharacter, purpleC)->
                Sì no boh.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Non so ancora se mi piaci.
                Ma sei l'unica persona qui.
                A parte {charNameFive}, ma lei di sicuro non mi piace mica.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                {
                    - are_two_entities_together(FirstCharacter, PG):Ehi, ci sarei anche io!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_annoyed
                        Ma tu sei una ragazza! E non fai nemmeno la persona che riscrive cose!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                        Sicuro devo riscriverti come funziona il mondo, microbo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_annoyed
                    
                }
                Lecose qui sono belle.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                Le bugie sono meno interessanti.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    
 
            -
            Forse nello stagno posso imparare a nuotare.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            La rana sembra abbastanza forte da salvarmi nel caso.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                ~ book_BGVariations ++
                ~ secondPauseTalking = secondCharPauseDuration
                
            @animation:RewriterBook
            
        ~ justTalkedSecondChar = true
        -> options_second_character 
    
    
    = nine
    //Obiettivo: mostrare tra le righe la paura per il futuro, anche dimostrazione di rabbia verso di sè? (finale rosso sicuro, finale blu?
    //Contenuti: tutti sanno cosa diventare da grandi, io voglio fare il veterinaio ma?
     //Da qui, no problem con contenuti TW. Si mette lx PG che ci dice che, se non ce la sentiamo, ci dice qualcosa di diverso. Il rapporto non cambia., il counter non sale.
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        ~ temp charNameOne = translator(firstCharacterState)
            {
                - not about_violence_and_peace:
                ~ change_entity_place(Mentor)
            }     
        
        ~ secondStoryQuestCount ++
        
        Tu hai sempre voluto fare {player_pronouns has him: il riscrittore|{player_pronouns has her: la riscrittora|lə riscrittorə}} come lavoro?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        
            + [Fino a poco fa nemmeno sapevo esistesse questo posto.]
                -> color_variation_management(SecondCharacter, blueC)->
                Figo!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Quindi non sono l'unico.
                Se chiedo qualcosa a {charNameFive} mi fa sentire stupido.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                "Bimbo, te le spiego lentamente le cose ora, vieni."
                Non mi deve spiegare lentamente le cose.
                Io so fare le frazioni!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    
                
            + [Questo non è il mio lavoro. I lavori sono noiosi.]
                -> color_variation_management(SecondCharacter, yellowC)->
                Però ai grandi piace parlare di lavoro.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                E le maestre parlano sempre del futuro.
                E dicono che ci devo lavorare con le cose in cui sono bravo.
                Ma io voglio solo imparare cose nuove!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                    
                
            + [In realtà non l'ho scelto. Manco mi pagano.]
                -> color_variation_management(SecondCharacter, redC)->
                Che fregatura.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Nemmeno mamma mi paga per i lavoretti a casa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Dice che è una cosa che devono fare tutti, grandi e piccoli, maschi e femmine.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Forse {charNameFive} è come mia mamma.
                    
                
            + [Mi è sempre piaciuto far stare bene le persone.]
                -> color_variation_management(SecondCharacter, greenC)->
                Questa è una cosa bella.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                Ma difficile.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                I grandi pensano sempre di sapere cosa fare.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Cosa vogliono gli altri.
                Ma poi sbagliano.
                E se la prendono con la persona che volevano aiutare.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Per questo si fa prima a fare da soli.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Mica puoi litigare con te stesso, no?
                    
  
                
            + [Voglio portare un grande cambiamento partendo dal piccolo.]
                -> color_variation_management(SecondCharacter, purpleC)->
                E io sono piccolo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Mi sembra una cosa faticosa.
                Però la capisco.
                È come l'elettricità.
                È così piccola che non la vedi.
                Ma fa muovere le cose grandi!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                O bruciare i muri.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                    
 
            -
            
        I miei compagni fanno tantissime cose.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Calcio. Basket. Pallavolo.
        Suonano il pianoforte o la chitarra o la batteria.
        Oppure imparano il cinese e l'inglese.
        Sanno già cosa vogliono fare come lavoro.
        A me mi piacciono solo gli animali.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Ma so anche le cose brutte degli animali.
        Che molti stanno sparendo per colpa degli uomini.
        Che gli oceani sono sempre più vuoti.
        Che gli incendi uccidono un sacco di animali ogni anno.
        E che il futuro sarà sempre peggiore.
        E quindi non so cosa fare da grande.
        Non so se ci saranno ancora gli animali quando sarò grande.
        E questa cosa mi fa arrabbiare.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        Non voglio essere un bambino per sempre.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Ma non voglio essere grande.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            {
                - are_two_entities_together(FirstCharacter, PG):Se ti può consolare, siamo in due.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_annoyed
            }  
            
            + [Sai che crescerai anche se non lo vuoi, vero?]
                -> color_variation_management(SecondCharacter, blueC)->
                Sì no boh.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Non è detto.
                Magari resto qui e magari qui il tempo non passa mica.
                E magari riesco a fare venire qui anche mio fratello.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                E la nonna.
                Così siamo tutti felici.
                    
                
            + [E se invece rimanessi sia bambino che adulto?]
                -> color_variation_management(SecondCharacter, yellowC)->
                Nonna dice che è il problema di mamma.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Che non si prende le sue responsabilità.
                A me mica mi dispiacciono le responsabilità.
                Ma tutto il resto mi spaventa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Tutti i litigi.
                La rabbia.
                A me non mi piace la mia rabbia.
                    
                
            + [Puoi fare il ribelle e salvare gli animali!]
                -> color_variation_management(SecondCharacter, redC)->
                Tipo Greta!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                A mio fratello piace tanto.
                Però mio fratello dice che bisogna picchiare "quelli". Farli fuori.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Non ho capito chi sono "quelli".#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Magari posso programmare le statue di mio fratello.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                E ci pensano loro a far fuori "quelli".
                Non ho capito mica nemmeno cosa sia "fare fuori".
                    

                
            + [Non ti preoccupare: hai moltissimo tempo per decidere che fare.]
                -> color_variation_management(SecondCharacter, greenC)->
                Sarà.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Ma Lara sa già parlare due lingue.
                E Jin è appena entrato nella giovanile della Fiorentina.
                Tommaso legge così tanto che sicuro sicuro diventa un genio.
                Io l'unica cosa che so fare è dire cose stupide sugli animali.
                E trovare nascondigli in ogni posto.
                E dire bugie.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                    
  
                
            + [Potresti diventare uno storico degli animali.]
                -> color_variation_management(SecondCharacter, purpleC)->
                Sì sì sì!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                Qualcuno che racconta le loro storie?
                Come un gioco forse.
                E anche gli animali giocano.
                Anche gli insetti!
                Lo fanno perché gli va.
                E io vorrei sempre fare quello che mi va.
                Il resto è una rottura.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    
 
            -
        Ho tanto da pensare ora. Però una cosa è sicura.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Mi piacerebbe tanto fare il veterinario.
             ~ secondPauseTalking = secondCharPauseDuration
             
                @animation:RewriterBook
                
        ~ justTalkedSecondChar = true
        -> options_second_character
    
    = ten
    //Obiettivo: si fida di noi, mostriamo il suo rapporto con la violenza. Finale rosso, finale viola (aiutare gli altri).
    //Contenuti: capiamo che a scuola è un bullo, ma ci sono persone che protegge. 
    //Da qui, no problem con contenuti TW. Si mette lx PG che ci dice che, se non ce la sentiamo, ci dice qualcosa di diverso. Il rapporto non cambia., il counter non sale.
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
            {
                - not about_violence_and_peace:
                ~ change_entity_place(Mentor)
            }     
        
        ~ secondStoryQuestCount ++
        
        Stavo ripensando a un bambino.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Uno di seconda.
        L'ho picchiato perché mi andava.
        Ero DAVVERO arrabbiato quel giorno.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        E lui ha pianto e mi sono arrabbiato ancora di più.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        La maestra di matematica mi ha messo in castigo.
        Ora quando vedo il bambino mi sento in colpa.
        Ho provato a chiedergli scusa ma lui scappa.
        E sua sorella una volta mi ha lanciato una scarpa in faccia.
        Mio fratello dice che succede.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Che tra bambini ci si picchia.
        E anche tra grandi.
        Penso che i grandi facciano schifo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        Quando papà mi picchia dice che è colpa mia.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Ma a me non piace farmi picchiare.
        O picchiare.
        Ma se sono arrabbiato non so cosa fare.
            {
                - are_two_entities_together(FirstCharacter, PG):Mai provato a suonare la batteria?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_affectionate
                    Poi papà ha un altro motivo per arrabbiarsi.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
            }        

            + [Solo gli animali non sanno controllarsi.]
                -> color_variation_management(SecondCharacter, blueC)->
                Allora sono un lupo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Una giraffa.
                Un coccodrillo.
                Un serpente.
                Un riccio.
                E ora ti spino!
                    
                
            + [Immagina di picchiare i mostri invece dei compagni!]
                -> color_variation_management(SecondCharacter, yellowC)->
                I mostri mi piacciono.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                Ma anche i miei compagni.
                Però non faccio male a qualcosa che non esiste, no?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Ma anche questo posto non doveva esistere, credo.
                E invece è qui.
                Chi lo dice che non faccio male ai mostri?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                    
                
            + [Tuo padre ti picchia, e tu hai imparato da lui a picchiare.]
                -> color_variation_management(SecondCharacter, redC)->
                NO!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                No.
                Non lo so.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Mi sembra una cosa difficile.
                Ma voglio tanto che non mi picchi più.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Non mi piace avere paura di lui.
                    

            + [Nessuno merita di essere picchiato, né tu né quel bambino.]
                -> color_variation_management(SecondCharacter, greenC)->
                Però se papà mi picchia c'è un motivo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Mamma dice che papà non lascia mai nulla al caso.
                E per questo è il più bravo a lavoro.
                E quel bambino è davvero fastidioso.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    
  
            + [La rabbia della ragazzina ha protetto il fratello.]
                -> color_variation_management(SecondCharacter, purpleC)->
                Ma chi protegge me?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Uh, bugia, scusa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Qui sono stato io a fare il cattivo.
                Forse potrei chiedere a lei come fa?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Ma sarebbe stupido.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                    
 
            -
        Essere adulti è terribile.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic 
        Ma non è bello nemmeno essere bambini.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
             ~ secondPauseTalking = secondCharPauseDuration
                
                @animation:RewriterBook
                
        ~ justTalkedSecondChar = true
        -> options_second_character 
    
    = eleven
    //Obiettivo: curiosità, sperimentazione. finale giallo, finale viola
    //Contenuti: esperimenti in casa (microscopio, muro bruciato col Meccano //Da qui, no problem con contenuti TW. Si mette lx PG che ci dice che, se non ce la sentiamo, ci dice qualcosa di diverso. Il rapporto non cambia., il counter non sale.
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
            {
                - not about_violence_and_peace:
                ~ change_entity_place(Mentor)
            }     
        
        ~ secondStoryQuestCount ++
        
        Quando vado da mio fratello e non c'è il suo amico, mi lascia sperimentare con le sue cose.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        Il suo amico fa il pasticciere.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        E ha tantissime cose strane in cucina.
        Mi piace provare le cose, capire.
        Non mi piacciono le cose che non capisco.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        Ma a volte faccio dei casini.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Una volta ho mischiato le cose per pulire casa e ho vomitato tutto il pomeriggio.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        Un giorno ho riempito il letto di mamma di sabbia e si è grattata per una settimana.
        E poi ho provato ad attaccare un mio robot al frullatore dell'amico di mio fratello.
        E ha fatto una fiammata gigante e un pezzo di muro è diventato nero.
        Mio fratello si è spaventato tantissimo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Ma io ero contento perché non sapevo che ci sono dei fili nel muro.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        E ora so cosa è l'elettricità.
        Ma qui non c'è.
        Chissà se è la rana che fa accadere le cose.
        
            + [Hai la mente da scienziato, e vuoi verificare tutto.]
                -> color_variation_management(SecondCharacter, blueC)->
                Lo dice anche mio fratello.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Per questo mi lascia fare gli esperimenti.
                Ma senza elettricità, dopo l'incidente.
                Però posso usare le batterie.
                Voglio fargli un regalo con le cose della serra, sai?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                    
                
            + [Proviamo con la lampada della biblioteca!]
                -> color_variation_management(SecondCharacter, yellowC)->
                Sì!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Ci possiamo attaccare la stazione.
                Così le persone sanno come arrivare qui.
                Secondo me tantissime persone si perdono per venire qui.
                Oppure ci mettiamo un faro!
                Ma ci serve qualcosa di alto.
                Forse se prendo tutti i rami del bosco...
                    
                
            + [Sei tosto perché alla fine fai quello che ti va.]
                -> color_variation_management(SecondCharacter, redC)->
                Sì no boh.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Questa cosa agli adulti non piace molto.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Ma se non posso capire le cose, mi rimangono in testa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Mi danno davvero fastidio.
                A volte mi sveglio presto e faccio tutte le cose che non dovrei fare.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Come provare gli attrezzi di papà.
                O il vecchio respiratore di nonna.
                Solo per capire.
                Poi li rimetto a posto prima che si svegliano tutti.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    

            + [Promettimi che non mangerai nulla di strano, qui.]
                -> color_variation_management(SecondCharacter, greenC)->
                Non sei mia mamma.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                E poi è troppo tardi.
                Ho assaggiato un po' di cose della serra.
                Ma hanno tutte un sapore fastidioso.
                Però per un attimo una delle piante mi ha fatto vedere le cose con colori strani.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Ma è durato pochissimo e poi avevo solo tanta sete.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                        
  
                
            + [Tuo fratello ti lascia essere te stesso.]
                -> color_variation_management(SecondCharacter, purpleC)->
                Sì!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                Lui non mi sgrida mai.
                E se si arrabbia con me, mi spiega il perché.
                E se non sono d'accordo e glielo dico, mi ascolta.
                Per questo mi piace stare con lui.
                Non mi fa sentire stupido.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    
 
            -
        Questo posto è pieno di cose di cui non vi fate domande, voi.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Tocca a me trovare le risposte!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                ~ secondPauseTalking = secondCharPauseDuration
                
            @animation:RewriterBook
            
        ~ justTalkedSecondChar = true
        -> options_second_character 
    
    = twelve
    //Obiettivo: narrativamente, lasciarcelo con una immagine positiva. Far vedere il peso dei genitori. Finale verde, finale giallo.
    //Contenuti. Momento tenero. L'altra nonna, la casa al mare, momenti di pace. I genitori non ci sono in queste occasioni 
    //Da qui, no problem con contenuti TW. Si mette lx PG che ci dice che, se non ce la sentiamo, ci dice qualcosa di diverso. Il rapporto non cambia., il counter non sale.
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        ~ temp charNameOne = translator(firstCharacterState)
            {
                - not about_violence_and_peace:
                ~ change_entity_place(Mentor)
            }     
        
        ~ secondStoryQuestCount ++
        
        Mi piace molto passare il tempo in biblioteca.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
        Le biblioteche mi ricordano semore la casa della nonna.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        L'altra nonna, quella che sta al mare.
        Ci vado d'estate e mi diverto tantissimo e ci sono tantissimi libri.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
        Lei mi prepara tutte le cose buone.
        E io le insegno tutte le cose più strane sugli animali.
        Mamma e papà non vengono mai.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Ma mio fratello e il suo amico sì.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
        Una volta mi hanno portato a una festa sulla spiaggia.
        E mi hanno fatto cantare nel microfono.
        E hanno riso tutti quando ho ruttato fortissimo.
        Da nonna mi addormento subito.
        Non devo correggere le giornate.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        {
            - are_two_entities_together(FirstCharacter, PG):Vedi tu se mi devo commuovere per questo marmocchio, mannaggia a me!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_sad
        
        }
        Quando finiscono le vacanze però mi sento triste.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        E arrabbiato.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        Ora che nonna è nella casa dei vecchi, vorrei vivere sempre con l'altra nonna.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Tanto so studiare da solo.
        Magari studio come si curano i pesci.
        Anche se non ci puoi mica giocare con loro.
            
            + [I libri ti insegnano tante cose.]
                -> color_variation_management(SecondCharacter, blueC)->
                Sì no boh.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Anche guardare le cose.
                E toccarle.
                Ho imparato tantissime cose da quando sono qui.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Senza usare un libro.
                A parte quando ne ho impilati alcuni per raggiungere i vasi alti della serra.
                Non dirlo a {charNameFive}, ti prego!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                    
                
            + [Dobbiamo capire la lingua dei pesci così ci possiamo giocare.]
                -> color_variation_management(SecondCharacter, yellowC)->
                Magari è come con le pecore che fanno tanti "bee" diversi.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Magari hanno tutti i loro dialetti.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Per me la sogliola parla come i milanesi.
                Ma la carpa ha la faccia da toscana.
                E il pesce spada sicuro che è romano!
                Posso creare un traduttore pescese/umano!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                    
                
            + [Andiamo a ruttare da {charNameFive} e la facciamo arrabbiare?]
                -> color_variation_management(SecondCharacter, redC)->
                Ci sto!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Però mi serve della roba frizzante sennò non mi vengono bene.
                Che poi ora ho capito che {charNameFive} non ce l'ha mica con me.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Forse mi inizia anche a piacere.
                Ma sì, un rutto se lo merita.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                    

                
            + [Vorresti che venissero anche mamma e papà?]
                -> color_variation_management(SecondCharacter, greenC)->
                Sì no boh.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Sono cattivo se dico di no?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Mi piace un posto dove nessuno litiga.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                O si arrabbia con me.
                L'altra nonna, quella del mare, non si arrabbia mai con me.
                Nemmeno quando ho versato tutto il caffè sul divano.
                O quando le ho rubato la grappa.
                Che brutto essere ubriaco!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                    
  
                
            + [Ti piace insegnare le cose all'altra nonna.]
                -> color_variation_management(SecondCharacter, purpleC)->
                Mi aiuta a capirle meglio.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Tante cose ce le ho solo in testa e stanno assieme tutte contemporaneamente.
                E per me hanno senso.
                Ma quando dico le cose ad alta voce, allora devo metterle in ordine.
                Ed è difficile.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Anche per questo a volte dico bugie.
                Perché le parole sono sbagliate, ma il contenuto è quello che so o sento.
                Non so se mi sono spiegato.
                    
 
            -
            Da grande comunque avrò una biblioteca con tutti i libri, tutti.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            E poi mi verrai a trovare e leggeremo assieme!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                    ~ secondPauseTalking = secondCharPauseDuration
                    
                @animation:RewriterBook
                
        ~ justTalkedSecondChar = true
        -> options_second_character          
            


//Questi storylets speciali non tornano sulle opzioni di dialogo, ma sul main        
    = not_talk
        ~ temp charNameFive = translator(fifthCharacterState)
        
        {not_talk: 
        
            - 1: Io ODIO {not welcome:quella strega coi petali| {charNameFive}}!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                E non ci parlerò
                mai
                MAI
                PIU'!
                Mi ha fatto male!
            - else: {~ Non ci parlo con chi è in combutta con quella!|Hai risolto le cose con quella?|Mi ha fatto male, e tu sei qui a non fare nulla?}    
        }
             {
                - are_two_entities_together(Mentor, PG) && (not that_little_liar_storylet):
                    ~ riccioMentoreViciniColpo = true
                    -> that_little_liar_storylet       
                
            }
                -> main
                        
  
        
=== second_story_gift ===
    ~ temp charNameTwo = translator(secondCharacterState)
    Stai per donare qualcosa a {charNameTwo}. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + {findedGifts != ()} [Scelgo il dono.]
                ~ currentReceiver += SecondCharacter
                -> inventory_management
            + {findedGifts == ()} Il tuo inventario è vuoto. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                ->main
            
        
            = ink_outcome
                Dopo il tuo dono {inkTranslator(secondCharacterInkLevel)}. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                    ~ move_entity(secondCharPaint, Bedroom)
                    ~ saturationVar ++
                     -> main


=== rewriting_proposal_second_character
~ temp charNameTwo = translator(secondCharacterState)
//Così se decido di uscire dalla conversazione, posso riprendere da dove eravamo rimaste.
    {
        - not confession:
            -> confession
            
        - else:
            -> rewriting

    }
    
    = confession
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ temp charNameOne = translator(firstCharacterState)
    ~ change_entity_place(Mentor)
    
    //Parole chiave legate alla fiducia.
        Abbiamo parlato tantissimo!!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional

        Ma davvero TANTISSSSSSIMO!
        Sai cosa penso di te?
            {
                -   are_two_entities_together(FirstCharacter, PG): E questo è il momento per me di levarmi da qui e lasciarvi in pace. Anche se sono stracuriosa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                    Non ditemi che questo non è un atto d'amore!
                            ~ change_entity_place(FirstCharacter)
            }
            
            {
                -   are_two_entities_together(Mentor, PG): Vi lascio la vostra privacy.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:mentor_neutral
                    
                            ~ change_entity_place(Mentor)
            }
            
       
        {
        
            //Migliore outcome
            - secondCharacterInkLevel >= Medium:C'è una cosa che devo dire a qualcuno, e voglio dirla a te.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
    
            //Secondo migliore outcome
            - secondCharacterInkLevel >= Normal: C'è una cosa che devo dire a qualcuno, e voglio dirla a te.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
            
            //Outcome peggiore
            - secondCharacterInkLevel == Empty: C'è una cosa che devo dire a qualcuno.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                E posso dirla solo a te.
                Purtroppo.
            
            //Outcome neutro
            - else:C'è una cosa che devo dire a qualcuno.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                E posso dirla solo a te.
                Purtroppo.
        }
       
        Da quando nonna è nella casa dei vecchi fa tutto schifo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Papà è tornato ma litiga sempre con mamma.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        E quando papà non c'è mamma si arrabbia con me.
        E l'unica cosa che mi dice è che devo smetterla di piangere e fare il grande.
        Che anche se piango nonna non torna.
        E a scuola le maestre sono fastidiose.
        <b><i>Stronze</b></i>.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        Scusa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Mio fratello dice che il mondo è un posto orribile e che non si può più aggiustare.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Gli animali spariranno tutti ed è colpa nostra.
        Papà dice che devo crescere, non pensare agli animali perché ora sono grande.
        Ma i grandi fanno schifo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        E non voglio fare schifo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        E non voglio diventare grande.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        Per questo sono venuto qui.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Per stare con gli animali.
        Non è il mio compleanno.
        Scusa per la bugia.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            @animation:RewriterBook
        Ma se non mi invento un motivo per le cose nessuno mi ascolta.
       
        ~ growing ++
            
            + [<i>Voglio cominciare la riscrittura.]
                -> rewriting
            
            + [Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.]
                -> main


    = rewriting
    ~ temp charNameTwo = translator(secondCharacterState)

            //Avvio aggiornamento relazione + commento PNG + commento strega
                -> secondAffinityCalc ->
                
            //Vado a svuotare i contatori di colore, così son tranquilla.
                -> storage_colors(SecondCharacter) ->
            
            //E poi a seconda dello stato di inchiostro, mi sposto sulla domanda prevista      
                {
                    - secondCharacterInkLevel == Empty:
                        -> ending
                    - else: 
                        -> one
                } 


    = one
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameOne = translator(firstCharacterState)
    ~ change_entity_place(Mentor)
            {
                -   are_two_entities_together(FirstCharacter, PG):Qui le cose si fanno serie, e io me ne vado. Buona fortuna, {player_name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_affectionate
                        ~ change_entity_place(FirstCharacter)
            }        
      //Affrontiamo gli adulti in generale
    Hai detto che i grandi fanno schifo e che non ti fidi di loro.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral

        + [Però tua nonna e tuo fratello spaccano.]
            Tua nonna ti ha insegnato a barare!
            Tuo fratello crea cose e ti protegge.
            Anche loro sono adulti.
                   -> color_variation_management(SecondCharacter, redC)->

        
        + [I tuoi genitori sono infelici, essere adulti è difficile.]
            Tutti i litigi, la fuga di tuo padre.
            Diventiamo grandi, abbiamo un sacco di doveri, e non sappiamo cosa fare.
            Per questo i grandi fanno cose brutte.
            Ma questo non li rende schifosi.
                   -> color_variation_management(SecondCharacter, greenC)->
                   
        
        + [Il problema è che agli adulti non è permesso giocare.]
            Tua nonna gioca, bara, e infatti è super.
            I tuoi genitori lavorano e litigano e sono infelici.
            Tu puoi essere un grande che gioca.
            E che gioca con gli animali per vivere.
            Ed essere felice.
                   -> color_variation_management(SecondCharacter, yellowC)->
                            

            
        + [Però gli adulti hanno anche scoperto le cose che ti piacciono.]
            L'elettricità.
            Gli studi sugli animali.
            Le caramelle.
            Le action figures.
                   -> color_variation_management(SecondCharacter, blueC)->
 
        + [Hai ragione. Ma tu puoi essere un altro tipo di adulto.]
            Un adulto che sa correggere le giornate.
            Anche per le altre persone.
            Che può tornare a fidarsi delle altre persone.
                   -> color_variation_management(SecondCharacter, purpleC)->
            
        -
        ~ numberQuestion ++  
        Continua.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        
            {
                - firstStory!=story_storyEnded:{player_name} ha utilizzato la sua prima unità di inchiostro per compiere una riscrittura. L'inchiostro ora si è consumato.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }        

            {
            - secondCharacterInkLevel == Low:
                -> ending
            - else: 
                -> two
            }        
        
    
    = two
    ~ temp charNameTwo = translator(secondCharacterState)
    Hai paura che il mondo stia finendo e che spariranno tutti gli animali.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
  
        + [Non puoi prevedere il futuro. Goditi quello che c'è senza rimpianti.]
            Se le cose sono incerte, prenditi le certezze.
            E la cosa certa è che gli animali ci sono ancora.
            Che tuo fratello ti vuole bene.
            E le caramelle sono buone.
                   -> color_variation_management(SecondCharacter, yellowC)->
 
        + [Sei giovane ma sai già un sacco di cose. Studia e salvali.]
            Si ha paura solo se non si conosce una cosa.
            Impara a conoscere quello di cui hai paura.
            E a quel punto saprai anche come cambiare le cose.
                   -> color_variation_management(SecondCharacter, blueC)->

        + [E allora lotta. Unisciti ad altri e protesta!]
            Sei abituato a stare in castigo, di cosa hai paura?
            A scuola fai quello che vuoi.
            Fallo anche fuori.
            Per salvare il mondo.
                    -> color_variation_management(SecondCharacter, redC)->

        + [Inventa storie, bugie che creino compassione, che cambino le persone.]
            Un po' come la bugia del compleanno.
            Ma per far sì che ogni bosco abbia migliaia di compleanni.
            Usa il tuo dono per convincere le persone a cambiare.
                   -> color_variation_management(SecondCharacter, greenC)->
  
        + [La paura blocca, la paura è una scusa comoda.]
            La paura è un rifugio.
            Se hai paura, non agisci.
            Se agisci non cambi nulla.
            Davvero vuoi restare per sempre bloccato dalla paura?
                   -> color_variation_management(SecondCharacter, purpleC)->
                   
        -
        ~ numberQuestion ++  
        Mmm, posso pensarci.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        
            {
                - firstStory!=story_storyEnded:{player_name} ha utilizzato la sua seconda unità di inchiostro per procedere con la riscrittura. Il boccetto ora è vuoto.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }         
        
            {
            - secondCharacterInkLevel == Normal:
                -> ending
            - else: 
                -> three
            }
        
    = three
    ~ temp charNameTwo = translator(secondCharacterState)
    //Affrontiamo il mondo. Rabbia, bugie, fantasia, violenza etc.
    Tuo fratello dice che il mondo è orribile e che non si può più aggiustare.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
    
        + [Eppure crea arte.]
            E l'arte è respiro, futuro, è cambiamento.
            L'arte è credere che le cose possano migliorare.
            Definisce un presente, per lanciarci altrove.
            E rende il mondo un posto meno orribile.
                   -> color_variation_management(SecondCharacter, purpleC)->
   
        + [Eppure ama il suo ragazzo.]
            E ama te.
            E fa in modo che possiate passare tanto tempo assieme.
            Che tu possa avere uno spazio felice.
            E così rende il mondo un po' meno orribile.
                   -> color_variation_management(SecondCharacter, greenC)->
 
        + [Eppure lotta contro tuo padre perché tu stia meglio.]
            Si è creato una nuova casa.
            Non si è fatto mettere i piedi in testa da nessuno.
            E questo lo fai se pensi ci sia un futuro dove andare.
                    -> color_variation_management(SecondCharacter, redC)->
  
        + [Eppure gioca con te.]
            Si diverte, lascia che le cose belle accadano.
            In un mondo orribile, esisterebbe davvero il piacere?
                   -> color_variation_management(SecondCharacter, yellowC)->

        + [Eppure per lavoro aggiusta le cose.]
            Vede le cose rotte e le ripara.
            Quindi ci sono cose che si possono aggiustare.
            Serve solo un meccanico per le cose che lo spaventano.
                   -> color_variation_management(SecondCharacter, blueC)->
  
        -
        ~ numberQuestion ++  
        Ok...#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        
            {
                - firstStory!=story_storyEnded:{player_name} ha utilizzato la terza unità di inchiostro, proponendo una riscruttura.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }         
        
            {
            - secondCharacterInkLevel == Medium:
                -> ending
            - else: 
                -> four
            }
    
    = four
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)    
    
    //Commento più personale
    {charNameFive} ti ha chiamato {charNameTwo}.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
    
        + [Vuoi davvero dargliela vinta?]
            Non ti piace da quando sei arrivato qui.
            Ti ha fatto arrabbiare dal primo momento.
            Vuoi davvero che sia lei a decidere come ti chiami?
                    -> color_variation_management(SecondCharacter, redC)->
     
        + [I ricci resistono a tantissimi veleni.]
            Ogni animale ha la sua dote, il suo modo di superare le paure.
            Puoi studiare e diventare un superanimale.
            O divertirti a cambiare quando vuoi.
            E tornare riccio, quando le cose si fanno velenose.
                   -> color_variation_management(SecondCharacter, blueC)->
        
        + [A volte ci raggomitoliamo per superare il peggio.]
            Quello che conta è: cosa facciamo, dopo?
            Quando le cose sono superate?
            Restiamo ancora nel nostro posto sicuro?
            O decidiamo di guardare le cose da una prospettiva diversa, e cambiarle?
                   -> color_variation_management(SecondCharacter, purpleC)->

            
        + [Anche se la schiena ha le spine, la loro pancia è tenera e gentile.]
            E tu sei stato tenero molte volte da quando sei qui.
            Con me, con la rana.
            E con le cose che hai raccontato.
            Ti servono ancora quelle spine?
                   -> color_variation_management(SecondCharacter, greenC)->

        + [I ricci hanno un olfatto super, possono trovare tutte le caramelle del mondo.]
            E dopo che hai trovato le caramelle, cambia animale.
            Diventa qualcosa che vede fino alla luna, e insegui le stelle.
            Oppure impara a nuotare fino all'altra parte del mondo.
            Continua a cambiare.
                    -> color_variation_management(SecondCharacter, yellowC)->

        -
        ~ numberQuestion ++  
        ...#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        
        {
            - firstStory!=story_storyEnded:{player_name}ha utilizzato la quarta e ultima unità di inchiostro, compiendo il massimo di riscritture possibili.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        }  
        
            -> ending

    
    = ending
    ~ temp charNameTwo = translator(secondCharacterState)
    
    
    Per questo ti dico:#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
            {
                - firstStory != story_storyEnded:{player_name} sta per utilizzare il potere dell'<b><i>epilogo</b></i>.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }    
     
        + [Diventa il più forte, il più coraggioso.]
            Sei un testardo, bugiardo, dispettoso.
            Queste cose unite possono renderti indistruttibile.
            E di cosa avrà mai paura un ragazzo indistruttibile?
                    -> color_variation_management(SecondCharacter, redC)->
    
        + [Tutti abbiamo paura. Condividi questa paura con le altre persone.]
            Falle sentire meno sole.
            Meno sbagliate.
            A quel punto saranno pronte a fare il passo.
            A cambiare le cose a loro volta.
            Assieme.
                   -> color_variation_management(SecondCharacter, purpleC)->

        + [L'opposto della paura è la curiosità.]
            E tu sei il ritratto della curiosità.
            Guarda le cose che arriveranno chiedendoti "Chissà se..." o "E se invece..." o "Perché accade questo?".
            E a quel punto ogni paura diventerà solo un problema da risolvere.
                   -> color_variation_management(SecondCharacter, yellowC)->
                
        + [I tuoi genitori sono spaventati, aiutatevi a vicenda.]
            Nessuna persona può cambiare il mondo da sola.
            Ma possiamo partire dal cambiare le cose che ci circondano, un pezzo alla volta.
                   -> color_variation_management(SecondCharacter, greenC)->
      
        + [Con la tua intelligenza puoi rendere il mondo migliore.]
            Puoi aiutare gli adulti a essere meno tristi.
            E gli animali a non morire.
            E tua nonna a uscire dalla casa dei vecchi.
                   -> color_variation_management(SecondCharacter, blueC)->
    
        - 
            //Prima chiamo il moltiplicatore di colori, così che comunque le scelte fatte qui abbiano un impatto maggiore.
                -> color_modifier(SecondCharacter, SecondCharacterColorMultiplier) ->
            
            //Poi aggiorniamo i colori, così il valore complessivo conta per la scelta del nome
                -> update_colors(SecondCharacter) ->     
     
            //E infine genero il nome
                -> secondNaming ->naming
                
            = naming
            ~ temp charNameTwo = translator(secondCharacterState)
            

            
    Sì. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
    No.
    Boh.
    {player_name}.
    Tu mi dici queste cose e io mi dico che c'è un animale.
    Un animale che mi piace.
    Un animale che un po' è me.
    E lo voglio come mio nuovo nome.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy

        {

            - secondCharacterState has Grizzly:
                Il mio vero nome è <b><i>{charNameTwo}</b></i>.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Combatterò la mia paura e diventerò il più forte di tutti, imbattibile!
            
            - secondCharacterState has Lupo:
                Mi chiamerò <b><i>{charNameTwo}</b></i>.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                E proteggerò il mio branco.
                Mamma, papà, nonna e mio fratello.
                Nessuna delle persone a cui voglio bene deve più stare male.
              
            
            - secondCharacterState has Delfino:
                E il mio nome è <b><i>{charNameTwo}</b></i>.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Se lo guardi bene tutto è un gioco.
                La mia fantasia e le mie bugie aiuteranno le altre persone ad avere meno paura.
                               
            
            - secondCharacterState has Capibara:
                Mi chiamerò <b><i>{charNameTwo}</b></i>.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                E imparerò ad avere tantissimi amici.
                Ci sentiremo meno soli!
                E così avremo meno paura.
                    
            
            - secondCharacterState has Corvo:
                Io sono <b><i>{charNameTwo}</b></i>.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Sono sveglio e posso capire ciò che mi circonda!
                E posso cambiare le cose che mi fanno paura.
                Aiutare gli altri.
                    
        }
        
            ~ growing ++   
            ~ book_BGVariations ++
            
            {
            - secondCharacterSpecialEvent == true:
                -> secret_ending
            - else:
                -> exit
            }
    
    
    = secret_ending
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
        Voglio dirti una cosa {player_name}. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        Su {charNameFive}.
        A me non mi sembra mica felice.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Mi ricorda mamma quando gira per casa dando consigli e dicendo cose sorridendo.
        E poi si rinchiude in camera e resta in silenzio per ore.
        Per me non sta mica bene.
    
            
            -> close
            
    = exit
    ~ temp charNameTwo = translator(secondCharacterState)
        Voglio stare ancora un po' qui prima di prendere il treno. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        Mi mancherà la rana!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            -> close  
    
    = close
        Ci sono alcune cose che devo ancora vedere prima di andarmene.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        A dopo, {player_name}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        
            @animation:RewriterBook
            
            ~ secondCharacterInkLevel = Empty
            ~ numberQuestion = 0
            ~ secondStory = story_storyEnded
            ~ player_movementsCounter = 0
            ~ story_endedStories += story_secondCharStoryEnded
            ~ PG_advance_management(SecondCharacter)
                -> main
    
    
=== second_char_story_ended
~ temp charNameTwo = translator(secondCharacterState)
//Con questa formula dopo un tot di scambi la personaggia se ne va salutandoci.
//In alcune situazioni questa cosa non c'è, in altre c'è solo se ho determinati status (es: socievole). In altri non c'è la possibilità che la personaggia se ne vada senza averci salutate (e quindi non c'è l'opzione in story_start)

    {
        - secondCharEndingDialogue < 4:
            -> top
        - else:
            -> goodbye
    }
    
        - (top)
        {~ Stavo pensando che se divento grande posso andare via di casa.|Magari da grande posso anche portare nonna via dalla casa dei vecchi.|Quando torno a casa chiedo a mio fratello se mi prende un cane.|Mi piace l'idea di tornare a casa ora, ma non di non potere mica tornare qui.|Se vieni a trovarmi ti faccio vedere tutte le statue di mio fratello.|Sarà difficile spiegare questa cosa a papà.}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
                ~ secondCharEndingDialogue ++
        -> main
        
        = goodbye
        ~ temp charNameTwo = translator(secondCharacterState)
        {player_name}, mi sa che torno a casa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        {
            -secondCharacterPossibleStates hasnt Riccio:Sì no boh.
                Sai che mi è piaciuta alla fine tutta questa cosa?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                Mi hai regalato il migliore compleanno del mondo.
                Anche se non era mica davvero il mio compleanno.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Vieni a trovarmi una volta.
                Mi mancherai.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            - else: Spero papà non sarà arrabbiato.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic     
        }
            ~ move_entity(SecondCharacter, Safekeeping)
                -> main


=== second_character_opinions
~ temp charNameTwo = translator(secondCharacterState)
~ temp charNameFive = translator(fifthCharacterState)
~ change_entity_place(Mentor)

    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {~ Nonna dice che non si scappa dalla periferia. Che papà ce l'ha dentro e se l'è portata anche quando siamo andati a vivere in centro.|Non mi piacciono i cartoni per quelli della mia età. Dicono tutte cose che so già.|Se ci pensi bene dire una bugia o scrivere una storia sono la stessa cosa.|Ogni persona ha un animale dentro secondo me. Prendi {charNameFive}: sembra un gufo. Anzi anzi: un avvoltoio! No, dai. Un fagiano, quelli femmina, tutti grigi grigi.|Mio fratello dice che devo fidarmi di più degli adulti, ma secondo me lo dice perché è adulto.|Per me il veterinario è come il druido dei videogiochi, solo non deve tirare dei dadi per salvare gli animali.|Un po' mi piacerebbe dormire e basta, senza pensieri.|Forse non mi dispiace mica che sei qui.|Se vado via di qui vorrei tanto portare la rana con me.}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
            -> main















    
