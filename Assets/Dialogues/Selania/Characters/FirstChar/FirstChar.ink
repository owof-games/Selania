=== first_character ===
    //SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
            //Chiacchiera normale
            + {are_two_entities_together(FirstCharacter, PG) && firstChar_storyStatus == story_storyStarted}[FirstCharacter]
                // -> talk_with_first_character
                    -> talk_with_first_character

            //Chiacchiera a fine storia
            + {are_two_entities_together(FirstCharacter, PG) && firstChar_storyStatus == story_storyEnded} [FirstCharacter]
                    -> first_char_story_ended
            + ->
                -> DONE


=== talk_with_first_character
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ actual_speaker = FirstCharacter
    //Se ho storylets in comune disponibili, passo subito a quelli.
        -> common_storylets
    
    //Se ho storylets disponibili di Chitarra e non sono in pausa, passo a quelli.
    
    - (top)
        {

            - firstChar_pauseTalking == 0:
                -> knowing_first_character

            - else:
                -> options_first_character
        }

                    
=== options_first_character
    ~ temp charNameOne = translator(firstChar_ActualName)
    {   
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, ma non ho fatto il tutorial su come funziona
        - firstChar_storyletsForRewritingCount > firstChar_minStoryletsForRewriting && not rewriting_proposal_first_character && not questions:
                -> ask
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona                    
        - firstChar_storyletsForRewritingCount > firstChar_minStoryletsForRewriting && not rewriting_proposal_first_character && questions:
                -> ask
        //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo         
        - firstChar_storyletsForRewritingCount > firstChar_minStoryletsForRewriting && rewriting_proposal_first_character:
                -> ask
        //Vogliamo offrire un dono            
        - not first_story_gift.ink_outcome && backpack_findedGifts != ():
                -> ask
        //Vogliamo cucinare assieme          
        - open_the_kitchen && not cooking_with_first_char && kitchen_firstCharIsCooking==false:
            -> ask
        
        -else:
            {
            //Stiamo parlando con la PNG, ma non dopo uno storylet, per cui mettiamo del testo
            - firstChar_justTalked == false:   
                {~Le farfalle qui giocano per ore!|No dai. Ma hai visto quanto sono carini gli scoiattoli?!|Con il rumore dell'acqua dello stagno ci posso fare una base niente male.}#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 
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
        {
            - firstChar_justTalked == false:   
                {~Le farfalle qui giocano per ore!|No dai. Ma hai visto quanto sono carini gli scoiattoli?!|Con il rumore dell'acqua dello stagno ci posso fare una base niente male.}#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 
                
            - else:
                Vorresti chiedermi qualcosa? #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 
            
                ~ firstChar_justTalked = false
        }

    //Azioni legate alla riscrittura
 
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, ma non ho fatto il tutorial su come funziona
            + {firstChar_storyletsForRewritingCount > firstChar_minStoryletsForRewriting && not rewriting_proposal_first_character && not questions} [Vorrei aiutarti a guardare le cose in modo diverso.]
                Ama, parla prima con la mentore così ti dice cosa fare e non le prende una sincope se facciamo casini.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                    ~ mentor_tutorialPauses = false
                        -> main
        
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona                    
            + {firstChar_storyletsForRewritingCount > firstChar_minStoryletsForRewriting && not rewriting_proposal_first_character && questions} [Ti va di riscrivere la tua storia con me?]
                    -> rewriting_proposal_first_character
    
        //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo          
            + {firstChar_storyletsForRewritingCount > firstChar_minStoryletsForRewriting && rewriting_proposal_first_character} [Iniziamo la riscrittura?]
                    -> rewriting_proposal_first_character
            

        
        
    //Azioni legate alla costruzione della relazione
    
        //Offrire un dono
            + {not first_story_gift.ink_outcome && backpack_findedGifts != ()} [Ti vorrei donare questa cosa.]
                        -> first_story_gift
            
        
        //Cucinare assieme    
            + {open_the_kitchen && not cooking_with_first_char && kitchen_firstCharIsCooking==false}[Ti va di cucinare qualcosa assieme?]
                ~ movements_changeLocationTimer = 0
                
                {
                
                    - kitchenContents has SecondCharacter: Uh, mi sa che la cucina è occupata da {charNameTwo}, sta cucinando qualcosa di strano.
                            ->main
                
                    - kitchen_firstCharCookingTogetherInvite: {Spero non mi farai aspettare come prima! Ho atteso un sacco!|Siamo a due volte che me lo chiedi e non ti presenti, sai?|E mi darai buca una terza volta? Vabbè.} #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
                        ~ move_entity(FirstCharacter, Kitchen)
                            ->main
                        
                    - else: Volentieri! Ci vediamo in cucina! #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
                        ~ kitchen_firstCharCookingTogetherInvite = true
                        ~ move_entity(FirstCharacter, Kitchen)
                            ->main
                
                }
    
    //Uscita dalla conversazione
        + [<i>Lascio il dialogo.]
                -> main
        -
            -> talk_with_first_character



=== knowing_first_character
    ~ temp charNameOne = translator(firstChar_ActualName)
    //Qui man mano faccio avanzare i temi toccati dalla personaggia
        
        //Storylets speciali    
        {   
            //Apertura cucina
                - are_two_entities_together(FirstCharacter, PG) && (first_char_main_storylets.three or second_char_main_storylets.one) and not open_the_kitchen:
                       {
                           - pondContents has PG:
                               -> open_the_kitchen
                            
                            - else:
                                Ehi {player_name}! Vediamoci allo stagno. Ho una cosa da mostrarti!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                                    ~ move_entity(FirstCharacter, Pond)
                                    ~ movements_changeLocationTimer = 0
                                        -> main    
                        }
            
            
            //Storylets legati alla cucina        
                //Chitarra sta cucinando ed entriamo in cucina
                - are_two_entities_together(FirstCharacter, PG) && entity_location(PG) == Kitchen && kitchen_firstCharIsCooking == true:
                        -> first_char_cooking_alone
            
                //Chitarra ha cucinato, e vediamo la scena del dono (a sé stessa)
                - are_two_entities_together(FirstCharacter, PG) && first_char_cooking_tracker && kitchen_firstCharIsCooking == false && not food_gift_first_char:
                        -> food_gift_first_char
                
                //Chitarra cucina con noi
                -  are_two_entities_together(FirstCharacter, PG) && entity_location(PG) == Kitchen && not cooking_with_first_char && kitchen_firstCharIsCooking == false:
                        -> cooking_with_first_char
                
                //Lettura Chitarra
                - are_two_entities_together(FirstCharacter, PG) && library_readStories has Salvo && not a_story_of_transformation:
                    -> a_story_of_transformation
                    
                    
        }
        
     
        {
            - not first_char_main_storylets.one:
                -> first_char_main_storylets.one
        
            //Chitarra dona il libro a PG -> metto dopo per evitare che parta di nuovo prima delle presentazioni
            - not foundLibro && firstChar_pauseTalking == 0 && not take_this_book:
                -> take_this_book   
                
            - not first_char_main_storylets.two:
                -> first_char_main_storylets.two
            - not first_char_main_storylets.three:
                -> first_char_main_storylets.three
            - not first_char_main_storylets.four:
                -> first_char_main_storylets.four
            - not first_char_main_storylets.five:
                -> first_char_main_storylets.five
            - not first_char_main_storylets.six:
                -> first_char_main_storylets.six
            - not first_char_main_storylets.seven:
                -> first_char_main_storylets.seven
            - not first_char_main_storylets.eight:
                -> first_char_main_storylets.eight
            - not first_char_main_storylets.nine:
                -> first_char_main_storylets.nine
            - not first_char_main_storylets.ten:
                -> first_char_main_storylets.ten
            - not first_char_main_storylets.eleven:
                -> first_char_main_storylets.eleven
            - not first_char_main_storylets.twelve:
                -> first_char_main_storylets.twelve
            - else:
                -> first_character_opinions
        }

    


 === first_story_gift ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    <i>Stai per donare qualcosa a {charNameOne}.</i> #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            
            + {backpack_findedGifts != ()} [Scelgo il dono.]
                ~ gift_currentReceiver += FirstCharacter
                    -> backpack_management
            
            + {backpack_findedGifts == ()} Il tuo inventario è vuoto.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                    ->main
            
        
            = ink_outcome    
                Dopo il tuo dono {inkTranslator(firstChar_InkLevel)}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                    
                    ~ mentor_tutorialPauses = false
                        -> main
                


    
=== first_char_story_ended
~ temp charNameOne = translator(firstChar_ActualName)
//Con questa formula dopo un tot di scambi la personaggia se ne va salutandoci.
//In alcune situazioni questa cosa non c'è, in altre c'è solo se ho determinati status (es: socievole). In altri non c'è la possibilità che la personaggia se ne vada senza averci salutate (e quindi non c'è l'opzione in story_start)

    {
        - firstChar_exitCounter < firstChar_startingValueExitCounter:
            -> top
        - else:
            -> goodbye
    }
    
        - (top)
            {~ Quanto mi prenderà per il culo Talco, quando lə racconterò tutta questa storia?|Comunque in questo posto dovreste mettere almeno un piano bar.|Se lo dico all3 am3 del conservatorio mi fanno il culo, ma vado pazza per le k-pop night.|Ma tu l'hai vista quella strana rana nello stagno?}#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                    ~ firstChar_exitCounter ++
                        -> main
        
        = goodbye
            ~ temp charNameOne = translator(firstChar_ActualName)
            ~ move_entity(firstCharPaint, Bedroom)
            ~ saturationVar ++
            Ama: è il momento di tornare a casa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            {
            
                - firstChar_possibleStates hasnt Chitarra: Non ho idea di che cosa accadrà, sinceramente, ma almeno ora mi sento pronta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                    E non cringiare ma: grazie. Mi hai dato una mano enorme. Me lo ricorderò.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate

                - else:Vedremo cosa mi accadrà.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
            
            }
            
            In bocca al lupo per tutte le tue assurde avventure in questo posto!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            E non ti abbraccio, ma un po' è come se l'avessi fatto.
            Ciao!
                ~ move_entity(FirstCharacter, Safekeeping)
                ~ firstChar_mailPause = firstChar_mailPauseDuration
                
            
        -> main




=== first_character_opinions
~ temp charNameOne = translator(firstChar_ActualName) 
    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {~ Talco dice sempre che bisogna sporcarsi le mani per capire il mondo.|Se proprio devo restare qui, tiro su una band con le api. Sono troppo chaddone loro.|Comunque il Ghiberti ha una moglie che è stra in gamba. Forse a volte ci si deve compensare. E visto che Talco è svegliə, io allora sono l'idiota della cumpa.|Resti tra noi, ma il Conservatorio è un posto del cazzo. C'è una competitività che non c'entra nulla con la musica.|Mi scoccia litigare con mio padre, ma io e il suo modo di fare NON. ANDIAMO. D'ACCORDO. Zero, ama. Zero.}#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            ~ firstChar_pauseTalking = firstChar_pauseDuration
            ~ firstChar_justTalked = true
                -> options_first_character 
