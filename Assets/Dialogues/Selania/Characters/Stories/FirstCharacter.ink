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
    ~ temp charNameFive = translator(fifthChar_ActualName)
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
                - are_two_entities_together(FirstCharacter, PG) && (knowing_first_character.three or knowing_second_character.one) and not open_the_kitchen:
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
            - not one:
                -> one
        
            //Chitarra dona il libro a PG -> metto dopo per evitare che parta di nuovo prima delle presentazioni
            - not foundLibro && firstChar_pauseTalking == 0 && not take_this_book:
                -> take_this_book   
                
            - not two:
                -> two
            - not three:
                -> three
            - not four:
                -> four
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
                -> first_character_opinions
        }

    = one
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        //Non mettere cose TW qui
        //Presentazione.
        ~ firstChar_storyletsForRewritingCount ++
        
        Hai visto passare qualcunə?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
        Altə all’incirca una balla di fieno e che si muove come un violino.
        O almeno ləi si descriverebbe così.
        Lə adoro ma è sempre un po' edgy.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate 
        E comunque non posso essere arrivata qui da sola, vero? Qualsiasi cosa sia <i>qui</i>.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
        Come lə trovo?
        
            + (oneBlue) [Dammi dettagli più concreti.]
                    -> color_variation_management(FirstCharacter, blueC)->
                Concreti?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                Si muove. Respira. Mangia. Saltella. Canta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
                A volte tutte queste cose assieme.
                E ha molta fantasia.
                Sempre che tu sappia cosa sia.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                
            + (oneYellow) [Suona il tamburo e vedrai che il violino torna!]
                    -> color_variation_management(FirstCharacter, yellowC)->
                A beh, ci sta!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 
                Non ci avevo pensato!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
                Ma il suo violino è più da pianoforte.
                Forse potrei cercare nella serra, e trovare qualcosa da suonare.
                
            + (oneRed) [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                    -> color_variation_management(FirstCharacter, redC)->
                Ha senso, ma Talco non è persona da azione.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
                Dice sempre che si trascina nello spazio come se fosse vento.
                E lascia alle sue spalle l'odore della primavera.
                Che è un modo carino per dire che è sempre piene di fango e terriccio.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 
                
            + (oneGreen) [Se ti senti sola, sono qui ad ascoltarti.]
                    -> color_variation_management(FirstCharacter, greenC)->
                Grazie ama.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
                Ma è come chiedermi di fare un concerto con una persona sconosciuta.
                Non è che ci si piglia subito, no?

            + (onePurple) [Tu sei sempre con ləi e ləi con te.]
                   -> color_variation_management(FirstCharacter, purpleC)->
                Mmm, ok, credo?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
                Le parole mi vanno anche bene, ma chi ti conosce.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                No dai, non devo essere stronza.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
                Però merda se mi manca.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
            -

        Non faccio mai niente senza Talco.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
        Talco è l'unica persona con cui posso permettermi di litigare.
        E l'unica che mi sopporta da quando ho finito il conservatorio.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
        Ma non mi sono manco presentata: io sono {charNameOne}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
        - (firstPresentation)
        No, io sono <b><i>{charNameOne}</b></i>.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
         Ehi! Non è questo il mio nome.
         <i>{charNameOne}</i>.
         Forse se provo a dirlo al contrario?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 
         Arratihc.
         Uh.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
         Prova tu. Come ti chiami?
    	    + {name_choice} [Mi chiamo {player_name}.]
    	    + [Il mio nome è...]
    	        -> name_choice ->
    	    -
    	 E i tuoi pronomi?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
    	        -> gender ->
    	        
    	 {player_pronouns has her:Anche io uso i pronomi femminili!|Invece io uso i femminili.} #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
    	 Comunque questa cosa del nome è strana.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 
    	 Non so.
    	 Non è male la chitarra.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
    	 Ma per una del conservatorio è tipo rinunciare a tutto.
    	 Alle ambizioni.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
    	 La chitarra è un po' un arrendersi, e dove vado se mi arrendo?
         {player_name}, secondo te il nome di una persona è importante?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
    	    
            + [È uno strumento di controllo.]
                -> color_variation_management(FirstCharacter, redC)->
                 Il nome è anche uno strumento d'amore.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                 Pensa a tutti i modi in cui qualcuno lo può gridare.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
                 Sono sicura che te ne verranno in mente un paio molto piacevoli.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 
                    
            
            + [Solo se possiamo continuamente cambiarlo.]
                -> color_variation_management(FirstCharacter, yellowC)->
                 Adoro!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 
                 Passo le giornate a cambiare melodie, e non avevo mai pensato di cambiare il mio nome!
                 Cosa normie proprio ora che ci penso, viste tutt3 l3 am3 non binari3 con cui esco.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
                 Mi merito di essere una chitarra!
                    
                    
            + [Solo se sei tu a definirne il significato.]
                -> color_variation_management(FirstCharacter, purpleC)->
                 Ah, ci sta!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
                 Tu sì che sai guardare al cuore delle cose!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate 
                 Quindi: ora mi ritrovo con un nome nuovo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
                 E non so cosa significhi, cosa doverci fare.
                 Però posso farci quello che voglio, no?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 
                    
                    
            + [È un dono della tua famiglia che resterà sempre con te.]
                -> color_variation_management(FirstCharacter, greenC)->
                 A I U T O!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                 Non ci avevo mai pensato.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
                 Ma non tutt3 ne sono felici.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                 E per alcune ame il nome è qualcosa che si sceglie.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate 
                 Smollare quello vecchio è una liberazione.
                    
                    
            + [È utile, altrimenti come ci distinguiamo?]
                    -> color_variation_management(FirstCharacter, blueC)->
                 Capiamoci: sei sempre così {player_pronouns has him:rigido|{player_pronouns has her:rigida|rigidə}}?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
    	         La persona più divertente della festa, vero?
    	         Anche se immagino che una visione pratica abbia dei vantaggi.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
    	         Per lo meno faresti felice mio padre.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
    	         Madonna, che piagnona che sono.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
                        
            -

        Comunque ama: il tuo nome ti si addice benissimo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
        Hai proprio una faccia da {player_name}.
        Ma forse la mia faccia è cambiata? Ti sembro una che può chiamarsi {charNameOne}?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
        Una che ha rinunciato ad essere un pianoforte? Una viola?
        Certo {charNameOne} che sei basicona con queste domande.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
       
            + [Quindi per cambiare faccia basta cambiarci il nome?]
                -> color_variation_management(FirstCharacter, yellowC)->
                {
                    -firstChar_yellow > 1:  Ama, tu e io faremo amicizia presto!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate 
                }
                 Cavolo, passerei le giornate a essere chiunque!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 
                 E forse ora potrei essere Talco.
                 Dove sei, Talco?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                 
            
            + [No, la faccia è una cosa che hai anche se non hai un nome.]
                -> color_variation_management(FirstCharacter, blueC)->
                {
                    - firstChar_blue > 1:  {player_name}, sai che ogni tanto puoi scendere da ovviolandia, vero?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                }
                 Forse dovrei chiamarti Linea.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                 Anzi, Quadrato.
                 Perché neanche a volerlo sai rotolare lontano dalla superficie delle cose.
                   
               
            + [Rinunciare al superfluo ci avvicina alla natura delle cose.]
                -> color_variation_management(FirstCharacter, purpleC)->
                {
                    - firstChar_purple > 1: {player_name}, continua così e ci shippo tantissimo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate 
                } 
                 Ho pensato subito che {charNameOne} avesse un valore negativo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
                 Dimenticandomi che in ogni brano il silenzio è parte fondamentale.
                 Grazie ama!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate 
                    
            
            + [Cosa pensi direbbe Talco di questo nome?]
                -> color_variation_management(FirstCharacter, greenC)->
                {
                    -firstChar_green > 1:  A te piace parlare di sentimenti e relazioni, vero?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
                }
                 Questa è una domanda molto tenera.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
                 Ma Talco mi blasterebbe, sicuro.
                 Mi direbbe che sono una frignona, e di andare a suonare qualcosa.
                 Talco è una persona che agisce, non resta ad aspettare.
                   
            
            + [A te va bene essere {charNameOne}? Perché non Tamburo? Corno da guerra?]
                -> color_variation_management(FirstCharacter, redC)->
                {
                    - firstChar_red > 1: Tu prendi tutto di pancia, vero? Saresti {player_pronouns has him:lo|{player_pronouns has her:la|lə}} bestie di Talco.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate 
                }
                 Mi merito {charNameOne} perché ultimamente ho proprio smollato tutto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                 Però ama, parlare con te non è già una forma di azione?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 
    
            -
       
        Come mi dovrei chiamare secondo te?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
        
        
            + [Un nome che inciti alla lotta.]
                -> color_variation_management(FirstCharacter, redC)->
            + [Un nome che inviti al gioco.]
                -> color_variation_management(FirstCharacter, yellowC)->
            + [Un nome che ricordi casa.]
                -> color_variation_management(FirstCharacter, greenC)->
            + [Un nome che illumini.]
                -> color_variation_management(FirstCharacter, purpleC)->
            + [Un nome che ponga domande.]
                -> color_variation_management(FirstCharacter, blueC)->
            -    
        
    	Qualsiasi cosa tu abbia pensato, non riesci a dirla.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}  
    	    -
        Mmm.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious 
        La tua bocca si muove ma non esce nulla.
        Forse quella tizia che gira quì può aiutarci a capire qualcosa?
            {
                - are_two_entities_together(Mentor, PG) && not welcome.your_name: In effetti avrei un paio di informazioni utili da darti!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry 
                
                - are_two_entities_together(Mentor, PG) && welcome.your_name: Uh, ma {player_name} sa già moltissime cose. #speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry 
            }
        L’unica cosa certa è che ho bisogno di Talco.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
        Ci vediamo dopo, {player_name}. Stammi bene.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            @animation:RewriterBook
            ~ firstChar_pauseTalking = firstChar_pauseDuration
            ~ move_entity(FirstRecap, BookPlace)
            ~ firstChar_justTalked = true
            
            -> options_first_character
        
    = two
        //Non mettere cose TW qui
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        //Paura di deludere la famiglia scelta
        ~ firstChar_storyletsForRewritingCount ++
        
         Non riesco a trovare Talco. #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
         Forse devo fare pace col cervello e accettare che non è qui.
         Ma non ricordo quando è stata l'ultima volta che sono andata in giro senza di ləi.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         Prima mi sono pure persa nel cercarlə.
         Ok, forse mi sono distratta cercando di raggiungere uno scoiattolo perché aveva la ghianda più bella che avessi mai visto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
         Volevo insegnargli a suonarla, e invece mi sono ritrovata tra gli alberi senza sapere dove andare.
         E c’erano otto sentieri diversi davanti a me.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         Otto!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
         Otto sentieri per tre persone?
        
            + [O forse il sentiero è unico, ma ci sono otto te.]
                -> color_variation_management(FirstCharacter, purpleC)->
                 Ah, ci sta!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 In effetti mi sento divisa, frammentata.
                 In questo periodo della mia vita ci sono troppe spinte.
                 E non so dove andare.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
                    
            
            + [Ok l'amicizia con Talco, ma devi essere indipendente.]
                -> color_variation_management(FirstCharacter, redC)->
                 Ama, prenditi meno spazi, grazie.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Talco e io siamo due parti della stessa armonia, ma sappiamo essere indipendenti.
                 È che in momenti come questo so suonare solo se è con me.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
                    
            
            + [Esiste un numero definito di sentieri per persona?]
                -> color_variation_management(FirstCharacter, blueC)->
                 Non era quello il punto, ama.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Ma credo dipenda dal tempo a disposizione.
                 Alla fine puoi suonare qualsiasi strumento, se ne hai il tempo.
                 Ma quanti mesi servono per creare otto sentieri da sola?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                    
                    
            + [Vorresti suonare qualcosa per Talco?]
                -> color_variation_management(FirstCharacter, greenC)->
                 Adoro.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Ma magari non ora.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Forse prima devo capire perché ho questo nuovo nome, cosa farmene.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                    
            
            + [Non so molto di scoiattoli, ma le falene suonano i girasoli!]
                -> color_variation_management(FirstCharacter, yellowC)->
                 Toppissimo!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Scoiattoli e falene sarebbero la migliore band possibile!
                 Tipo gli Stray Kids della natura.
                 E credo di aver visto una lumaca prima, potrebbe tenere il tempo!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                
    
            -    
         Che poi a pensarci bene, non è che saranno tutti i passi di quell'altra?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
         Cammina così tanto, e per cosa poi?
        {
            - are_two_entities_together(Mentor, PG): Non hai idea di quanto lavoro ci sia da fare. Quindi sì, cammino MOLTO.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        } 
         
        Ma troppe chiacchiere ora, troppe.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
        Fammi chillare un attimo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            ~ firstChar_pauseTalking = firstChar_pauseDuration
            ~ firstChar_justTalked = true
            @animation:RewriterBook

                -> options_first_character 
            
    = three
    //Non mettere cose TW qui
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        ~ firstChar_storyletsForRewritingCount ++
        
         Stavo pensando ad Anna.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
         Anna è una mia ama del conservatorio.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         Insiste perché mi proponga come assistente del Ghiberti.
         Dice che lui ha stima di me e questa è la mia GRANDE occasione.
         E non per flexare, ma so che me la caverei bene.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
         Anna è così sicura di sè da quando ha lasciato l'ex tossico! Adoro.
         A volte Anna e Olga discutono perché Olga pensa che io con la classica sia buttata via.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         Dice che devo mettere su una band e invadere tutti i locali della città.
         Olga è sicura che Talco le dia ragione, ma Talco vuole che mi butti sui reality show.
         Dice che non importa vincere, importa fare casino così poi sui social se ne parla.
         Ha il suo senso.
         E poi Ennio, no Ennio no.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
         Ennio dice che ho sbagliato strada.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
        
            + [La risposta è sempre dove c'è casino: ascolta Talco!]
                -> color_variation_management(FirstCharacter, yellowC)->
                 Voi due diventereste bestie in due secondo, cavolo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 E potrei portarvi sul palco e fare qualcosa di assurdo.
                 Tipo creare uno xilofono di papere!
                 Sarebbe toppissimo!
                    
            
            + [Anna ha ragione: bisogna essere pratiche nella vita.]
                -> color_variation_management(FirstCharacter, blueC)-> 
                 La praticità non è tutto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Sennò avrei dovuto iscrivermi a economia.
                 E inventare nuove supercazzole per fregare il prossimo.
                 O far finta di predire il futuro scazzando più di Nostradamus.
                           
    
            + [Tutte le strade sono sbagliate se non sai dove andare.]
                -> color_variation_management(FirstCharacter, purpleC)->
                 Mi ricordi il nonno.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Ignorava i piccoli fastidi per concentrarsi sul grande insieme delle cose.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 A me non viene benissimo questa cosa però.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
                 Quanto son cringe.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                    
            
            + [E cosa vuole {charNameOne}?]
                -> color_variation_management(FirstCharacter, greenC)->
                 Ora?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Un letto caldo, una copertina.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 E non doversi fare questa domanda.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
                    
            
            + [Ascolta Olga e invadi il mondo!]
                -> color_variation_management(FirstCharacter, redC)->    
                 Tu sei un treno, {player_name}. Chi ti ferma?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Ma io sono più dell'idea di ricrearlo assieme questo maledetto mondo.
                 Ascoltarci a vicenda, entrare in armonia.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 E ricostruire sulle macerie che ci circondano.
                 Ora datemi il Nobel per la pace, su!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                        
            
            -    
         Comunque sembra che tutt3 abbiano le idee chiare su cosa dovrei fare.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
         E dato che nessunə amə ha la stessa opinione delle altre, finirò per deluderne qualcunə.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
         Sono la mia famiglia, loro.
         E nessuna di queste scelte può accontentare tutt3.
         Che rottura di ovaie, {player_name}!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
            ~ firstChar_pauseTalking = firstChar_pauseDuration
            ~ firstChar_justTalked = true
            @animation:RewriterBook

                -> options_first_character
        
    = four
    //Non mettere cose TW qui
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    //Silenzio
        ~ firstChar_storyletsForRewritingCount ++
        
         Questo posto è carino, ma il silenzio è pesante.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
         Non c'è nemmeno un accenno di musica, di ritmo.
         Come ci si sta in un posto del genere senza sbroccare?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
        
            + [Studiandolo, cercando di capire come funziona.]
                -> color_variation_management(FirstCharacter, blueC)->
                 Dovrei vivisezionare una di quelle lumacone trovate dietro alla serra?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Testare gli arbusti della foresta?
                 Flexare a manetta e dire "Ora sono il dio di questo posto?!?"
                 Thank you, next!
                    
                    
            + [Più silenzio significa più spazio per fare rumore!]
                -> color_variation_management(FirstCharacter, yellowC)->
                 AAAAAAAAAAAAAAAAAAAAAAAAAAAA!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Forse dovevo avvisarti.
                 Ma non funziona, ama.
                 È come quando fai le prove per un concerto in un'enorme sala vuota.
                 Mi fa sentire esposta, e idiota.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                    
                    
            + [Se corri veloce il ritmo lo crei da sola.]
                -> color_variation_management(FirstCharacter, redC)->
                 O mi parte un polmone.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Non sono esattamente una gymbro, ama.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 E poi serve qualcuno che suoni con te.
                 E qualcuno che canti.
                    
                    
            + [Il silenzio offre la vulnerabilità necessaria per raccontarsi.]
                -> color_variation_management(FirstCharacter, greenC)->
                 Non ti sono sembrata già abbastanza needy, ama?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 E poi vorrei ricordarti che manco so perché mi chiamo così.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
                 No dai, tu cerchi di essere gentile, scusa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Ma non conosco bene le parole per "raccontarmi".#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
                 L'unica cosa che so fare è suonare.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                    
                    
            + [Il giardino <b><i>è</b></i> musica, si tratta solo di ascoltare.]
                -> color_variation_management(FirstCharacter, purpleC)->
                 Tu sei un mood tutto tuo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Ma forse hai ragione, {player_name}.
                 È che per ascoltare serve restare in silenzio.
                 E a me viene solo da parlare a ruota e non pensare in questo momento.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
                    
            -
         Idea!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
         Forse la mentore è abbastanza vecchia da avere una radio?
            {
                - are_two_entities_together(Mentor, PG):Non approfittare della mia gentilezza, ragazzina!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
                    Dai, si fa per il meme!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                - else:Devo assolutamente chiederglielo!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
            }
                ~ firstChar_pauseTalking = firstChar_pauseDuration
                ~ firstChar_justTalked = true
            @animation:RewriterBook

                    -> options_first_character
            
    = five
    //Non mettere cose TW qui
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ firstChar_storyletsForRewritingCount ++
    
         Hai presente quel meme del tizio che sta a una festa in un angolo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
         E giudica tutti?
         Ecco: io sono quella che balla e ignora il basicone.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
         Passo le giornate circondata dall3 am3, mi vivo la festa.
         In casa siamo in cinque, sei se conti la muffa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         E poi tutt3 l3 ospiti.
         Ovviamente la meglio ama è Talco.
         Ti ho già detto che crea strumenti con qualsiasi cosa trova in giro?
            {
                - are_two_entities_together(SecondCharacter, PG): Mi piacerebbe tantissimo conoscere Talco!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                
                    Ti adorerebbe!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
            }
         
        L'estate facciamo le feste sul tetto, cantiamo e improvvisiamo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
        "E vento e sudore si portano via le preoccupazioni, non c’è nulla a cui pensare."
        "Ti senti parte di tutto, privə di confini."
        "Sei la musica, sei l’umidità nell’aria, sei la gola del vicino che si lamenta del casino."
        Sono parole scritte da Talco, le adoro.
        Qui è tutto così calmo, posso sentire i pensieri dei miei pensieri e questa roba mi cringia così tanto che non hai idea.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
        
                + [Allora serve fare più rumore.]
                    -> color_variation_management(FirstCharacter, redC)->
                     Facciamo incazzare la mentore?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                        {
                            - are_two_entities_together(Mentor, PG):Non sono capace di arrabbiarmi, mi spiace {charNameTwo}!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
                                L'importante è crederci.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                        } 
                    Quindi dovrei riprendere a stordirmi di cose?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                    Può essere un'idea.
                    Ma non so quanto sia utile per capire perché ho questo maledetto nome.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                        
                        
                + [Il pensiero è specchio: rompilo per distinguere reale e riflesso.]
                    -> color_variation_management(FirstCharacter, purpleC)->
                    Ti shippo, ama, ma parla come mangi.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                    Però forse dovrei stendermi e meditare.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                    Lasciare che i pensieri si spengano uno per uno.
                    Talco lo fa.
                    Dice spesso che devo "ignorare la paura che ho all'idea di vedere le cose come stanno".
                    Facile, proprio.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
                        {
                            - are_two_entities_together(Mentor, PG):Posso insergnarvi un po' di mindfulness.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                        }
                        
                
                + [La disciplina può aiutare a spegnere i pensieri.]
                    -> color_variation_management(FirstCharacter, blueC)->
                     Ma l'alcool lo fa prima, e meglio.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                     E costa meno della terapia.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
                        
                        
                + [Forse non è la festa, ma è il senso di unione che ti manca.]
                    -> color_variation_management(FirstCharacter, greenC)->
                     Ma con chi, qui?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                     Scusa, non per triggerarti.
                     Sei una persona a modo, ma non siamo ancora bestie.
                     Men che meno la mentore.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                        {
                            - are_two_entities_together(Mentor, PG):Non capisco perché tanto astio.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                        }                     
                        
                        
                + [La serra ha un tetto! E io so sudare!]
                    -> color_variation_management(FirstCharacter, yellowC)-> 
                     Questo è un piano, ama!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                     Forse il vetro non ci reggerebbe a lungo ma che cambia?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                     E almeno una di quelle strane piante saprà cantare!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                               
                -
        Ma ora ho bisogno di rilassarmi un po' ama.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        E magari riposa anche tu.
            ~ firstChar_pauseTalking = firstChar_pauseDuration
            ~ firstChar_justTalked = true
            @animation:RewriterBook
            
                -> options_first_character
        
    = six
    //Non mettere cose TW qui
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
        //Paura delle conseguenze della scelta.
        ~ firstChar_storyletsForRewritingCount ++
        
         Trigger warning: pesantezza, ama.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
         Ma questo posto mi fa pensare a troppe cose.
         Conoscevo questo ragazzo, Jonah, un arpista e un genio.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         Per due anni ha fatto da spalla a un tizio di Beijing, una rockstar della musica classica.
         Ma poi non si sa perché ma Jonah sentiva la mancanza di casa ed è tornato per fare una carriera da solista.
         Le cose gli sono andate di merda.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
         E man mano che gli studi gli sbattevano la porta in faccia, lui ha iniziato a perdere fiducia in sé e nella musica.
         Ora non so più dove sia, Jonah.
         Qualche compagna del Conservatorio giura di averlo visto mendicare.
         Nella chat dei lavoretti qualcuno dice che suona sotto pseudonimo per dei ricchi di merda.
         Una volta credo di averlo visto lavorare in un supermercato.
         Scusa, ama.
         Che pesantezza.
         Però sono qui che mi chiedo: cosa puoi fare quando sai fare bene solo una cosa ma il mondo non ti permette di farla?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         Accetti i compromessi o corri il rischio di morire di fame?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
         O aspetti fino a quando non sia il mondo a decidere per te?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
            
            + [Canta e balla. Domani è una cosa lontana.]
                -> color_variation_management(FirstCharacter, yellowC)->
                 Mi sembra di sentire Talco con queste frasi.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Non che non aprezzi, ama.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Ma per me è da molto ormai che è <i>domani</i>.
                 Il conservatorio è finito da mesi, e io suono, ballo, ma non so ancora che cosa fare.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
                    
                    
            + [È imperativo sopravvivere, troviamo sempre una soluzione.]
                -> color_variation_management(FirstCharacter, blueC)->
                 "Imperativo" rimettilo nel vocabolario, ora.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 E voglio qualcosa di più che sopravvivere.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Lo voglio per tutte le persone!
                
                    
            + [Restati fedele e non ci sarà compromesso ma cambiamento.]
                -> color_variation_management(FirstCharacter, purpleC)->
                 Ah, ci sta!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 E a quel punto ogni decisione sarebbe la <i>mia</i> decisione.
                    
            
            + [Dona la tua musica senza chiedere e tutto arriverà.]
                -> color_variation_management(FirstCharacter, greenC)->
                 Forse in questo posto strano funziona così.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Ma nel mondo reale tutto prende e non dà nulla.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 A parte l3 am3.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 O dici che devo darli a loro i miei doni?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                 Mmm.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Ci devo pensare.
                    
           
            + [Mezzo compromesso è già una completa sconfitta.]
                -> color_variation_management(FirstCharacter, redC)->
                Eppure Jonah ha perso del tutto, comunque.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                Con o senza compromessi.
                Questa è l'unica soluzione?
                           
            
            -
        A proposito di cause perse: vado a cercarmi uno spritz.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
        Ho proprio bisogno di staccare.
            ~ firstChar_pauseTalking = firstChar_pauseDuration
            ~ firstChar_justTalked = true
            @animation:RewriterBook
            
                -> options_first_character
        
    = seven
    //Non mettere cose TW qui
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    //Razionalità
        ~ firstChar_storyletsForRewritingCount ++
        
         Stavo ripensando al prof Ghiberti. #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         E prometto che non è un pippone a questo giro.
         Forse.
         Comunque: il Ghiberti vede tutta la musica come una cosa matematica.
         Non è una cosa nuova, ma di solito chi lo fa non rinuncia alla poesia.
         Per Ghiberti invece la musica e il mondo sono solo una combinazione di numeri.
         Una somma che dà sempre lo stesso risultato.
         Ma quanto sono basic quando dico queste cose?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
         Tra l'altro una volta a vocina bassa ha giurato che il jazz è un errore.
        
            + [La prevedibilità <b><i>è</b></i> poetica. La cosa più rara al mondo.]
                -> color_variation_management(FirstCharacter, blueC)->
                 Allora non sono una persona poetica.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Se non c'è caos, imprevedibilità, mi annoio.
                    
                    
            + [Ognuna ha il suo modo di raggiungere la verità.]
                -> color_variation_management(FirstCharacter, purpleC)->
                 Ci sta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Ma non è troppo facile così?
                 Non è togliersi la responsabilità verso le altre persone?
                    
                    
            + [È un errore non giocare, e il jazz è musica che gioca.]
                -> color_variation_management(FirstCharacter, yellowC)->
                 Top!
                 Anche se sicuro che ora si è preso un infarto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Per me tutta la musica è gioco.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)} #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_curious
                 Basta smetterla di sentirsi stocazzo e perdersi con band e pubblico.
                
                
            + [Sembrano le parole di una persona ferita.]
                -> color_variation_management(FirstCharacter, greenC)->
                 Lo dice anche Talco.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Metti che voglio pure aiutarlo con questa ferita, cosa dovrei fare?
                 Rispettare la sua ossessione per le regole?
                 O sorprenderlo con del caos creativo?
                
                
            + [Ha paura di accogliere la potenza del disordine.]
                -> color_variation_management(FirstCharacter, redC)->
                 Ci sta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Anche se poi credo che il disordine sia solo una questione di prospettiva.
                 Alla lunga ci si abiuta e diventa difficile cambiare.
                 Un po' come quel casino che è camera mia.
                    
            -
            Comunque non mi piace l'idea che esistano errore e verità.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
            Anche perché quelli pieni di verità hanno sempre finito per ammazzare quell3 come me e Talco.
                ~ firstChar_pauseTalking = firstChar_pauseDuration
                @animation:RewriterBook
                
                    -> options_first_character          
    
    = eight
    //Non mettere cose TW qui
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ firstChar_storyletsForRewritingCount ++
        
        Giuro che non shippo il Ghiberti, ma continuo a pensare a quello che ci siamo dette prima.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        E il Ghiberti sembra un uomo felice, sorride molto.
        Ma poi se lo guardi bene sembra il sorriso di un robot.
        O di uno che ha una Tesla.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
        A me fa venire la caga quel sorriso, quel modo di fare.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Tutti questi numerini e fattori tolgono l’esperienza, l’errore, il senso di comunità.
        Talco dice sempre che una comunità canta, ma per farlo deve sbagliare, essere imprevedibile.
        Che diavolo ci fai con una canzone fatta con la sola precisione?
        Tra ame sbagliamo sempre, e poi ci perdoniamo.
        Mentre il mondo del Ghiberti sembra come quella roba con l’AI, orecchiabile, prevedibile, dimenticabile.
        C'è una sola cosa che mi triggera le ovaie: tutte le cosine pratichine e calcolabili e precise.
        Sono roba morta.
            {
                - are_two_entities_together(SecondCharacter, PG):Essere adulti è orribile!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                    E non hai ancora prova l'adolescenza!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
            }
 
            + [Una comunità sboccia quando c'è affetto e fiducia.]
                -> color_variation_management(FirstCharacter, greenC)->
                 Esatto!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Una casa in campagna con l3 am3.
                 Un giardino.
                 Anna dice che è come fuggire dalle responsabilità.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Ma non è che possiamo salvare il mondo, noi.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
                    
                
            + [Una comunità non regge senza senso pratico.]
                -> color_variation_management(FirstCharacter, blueC)->
                 Giuro ama che a volte mi triggeri tantissimo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Perché tutto è solo senso pratico per te?
                 Non è comunità la roba che hai in mente, ma una roba come una fabbrica.
                 E io non ci voglio vivere in una fabbrica.
                    
                    
            + [Una comunità resiste se segue un obiettivo superiore.]
                -> color_variation_management(FirstCharacter, purpleC)->
                 Mood totale.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Una comunità unita per rendere il mondo più giusto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 O trasformare qualcosa di terribile in un gioco.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                 E farlo esplodere.
                    
        
            + [Ciò che ci tiene unite è il giocare.]
                -> color_variation_management(FirstCharacter, yellowC)->
                 Ah, ci sta!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 È  liberatorio ridere tutt3 assieme.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Forse dovrei solo far ridere il Ghiberti, e magari quel sorrisino finto si rompe.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Oppure mi schiatta sul posto.
                    
                    
            + [Ci si accresce nel dissenso e nella discussione.]
                -> color_variation_management(FirstCharacter, redC)->
                 Amo noi.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Ma non è manco male sedersi assieme al sole e chillare, ogni tanto, no?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                    
     
            -
         Comunque non sono di certo qui per il Ghiberti e le sue paranoie matematiche.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         Ma per capire perché sono in questo posto.
         Mi prendo un po' di tempo per me, {player_name}.
            ~ firstChar_pauseTalking = firstChar_pauseDuration
            ~ book_BGVariations ++
            ~ firstChar_justTalked = true
            @animation:RewriterBook
                        
                -> options_first_character
    
    = nine
    //Da qui, no problem con contenuti TW. Si mette Chitarra che ci dice che, se non ce la sentiamo, ci dice qualcosa di diverso. Il rapporto non cambia., il greenhouse_questionsCounter non sale.
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
        //Voglia di fare qualcosa di utile, importante
        ~ firstChar_storyletsForRewritingCount ++
        
         Non lo dire alla mentore, ma mi ci sto abituando a stare qui.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate 
         Anche se non sarebbe male avere almeno un pianoforte e del vinello.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
         Però mi sembra che questo posto non cambi molto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         Sembra il momento prima del temporale, quando l'aria frizza e sai che sta per arrivare ma non sai quanto sarà forte.
         E ti senti viva.
         Merda, faccio davvero schifo a parlare.
            
            + [È come una ninna nanna. Chissà cosa sognerai.]
                -> color_variation_management(FirstCharacter, greenC)->
                 La cosa preferita di Talco sono i pigiama party.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Chillare con l3 am3.
                 "Un sogno condiviso, sognando sognare."
                    
                    
            + [Non tanto a parlare ma ad arrivare al punto.]
                -> color_variation_management(FirstCharacter, blueC)->
                 Ama, mi ricordi perché continuo a raccontarti queste cose?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Ah, sì, perché siamo solo noi.
                 E la mentore.
                 E la mia noia.
                    
                    
            + [Ogni temporale toglie a qualcuna e dà a qualcun altro.]
                -> color_variation_management(FirstCharacter, purpleC)->
                 Ah, ci sta!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Come le piante nella serra.
                 Che mi sembra crescono con la terra e le nostre paturnie.
                 Per poi darci in cambio forme assurde e idee.
                    
                    
            + [O come il momento prima di una battaglia.]
                -> color_variation_management(FirstCharacter, redC)->
                 A te piace menare le mani, {player_name}?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Ma non è roba mia, andare a fare battaglie.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Tutte le cose di guerra mi fanno solo incazzare.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Mi sembra solo un modo idiota per vedere chi ce l'ha più grosso.
                 E manco tra la gente che poi muore.
                 Cringe.
                    
                    
            + [Qui l'aria sa di mare e zucchero filato!]
                -> color_variation_management(FirstCharacter, yellowC)-> 
                 Vero? Che è assurdo, perché non ho visto il mare da nessuna parte.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                 Né dello zucchero filato.
                 Ma ora ho fame.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 E voglia di farmi un giro sull'ottovolante.
                            
    
            -
         Vabbè.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         Credo me ne starò qui ad aspettare questo finto temporale.

             ~ firstChar_pauseTalking = firstChar_pauseDuration
             ~ firstChar_justTalked = true
            @animation:RewriterBook
            
            -> options_first_character 
    = ten
        //Da qui, no problem con contenuti TW. Si mette Chitarra che ci dice che, se non ce la sentiamo, ci dice qualcosa di diverso. Il rapporto non cambia., il greenhouse_questionsCounter non sale.
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ firstChar_storyletsForRewritingCount ++
        
         Comunque non è che penso solo a me stessa ama, giuro.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
         L'anno scorso abbiamo occupato un parco per una settimana.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         Il comune voleva distruggere gli alberi, e volevamo fare qualcosa di decente per una buona volta.
            {
                - are_two_entities_together(SecondCharacter, PG): La prossima volta voglio aiutarvi!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    Sarai il primo a venire chiamato, promesso!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
            }
            
         La prima notte non abbiamo manco sentito il freddo da quanto eravamo prese bene.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
         Però poi il mood si è spento.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
         Diverse se ne sono andate, e chi è rimasta non aveva più la spinta. Zero.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         L'ultima sera c'è stato un momento di totale silenzio.
         Non si sentiva la pula, nessuna cantava, persino gli scoiattoli erano fermi.
         E a quel punto ho sentito il canto degli alberi.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
         Giuro, ama!
         E quando ho iniziato a cantare con loro mi sono sentita viva.
        
            + [Forse gli alberi qui conoscono la storia della tua lotta.]
                -> color_variation_management(FirstCharacter, greenC)->
                 Non è per flexare, ma sarebbe bello.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Però allora gli chiedo anche come tornare a casa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Non so più quanto voglio restare quì.
                 Senza offesa, ama.
                    
                
            + [Hai anche danzato con gli alberi?]
                -> color_variation_management(FirstCharacter, yellowC)->
                 Non avevo preso i funghetti, no.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Ma avrei apprezzato molto, ama.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Anzi no, forse non l'avrei fatto.
                 Muovermi a volte mi sembra che rompa le cose.
                    
                    
            + [Sei tu che hai lottato per gli alberi, o loro per te?]
                -> color_variation_management(FirstCharacter, purpleC)->
                 Ti shippo totale.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Talco direbbe che ci siamo aiutate a vicenda. E non solo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Che la separazione è solo una illusione, o roba del genere.
                 Che una melodia non esiste senza tutte le sue note.
                    
            
            + [Gli alberi "cantano" per allarmare altri alberi.]
                -> color_variation_management(FirstCharacter, blueC)->
                 Ama, tu sai uccidere il mood come poche persone al mondo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Quindi secondo te ero immersa in un coro di disperazione?
                 Ora mi metto a urlare anche io.
                    
                
            + [Come ti sei sentita a combattere per qualcun altro?]
                -> color_variation_management(FirstCharacter, redC)->
                 Motivata.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Motivata fino al cuore.
                 L'avrai notato, faccio un po' cagare a spiegare le cose.
                 Ma in quel momento sapevo che stavo facendo qualcosa che aveva un senso.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Qualcosa di importante non solo per me.
                    
            -    
         Comunque la storia poi è finita male, ovvio.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
         I poliziotti ci hanno trascinate e bastonate e schedate.
         E soprattutto hanno tagliato gli alberi.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
         E sono tornata a sentirmi inutile.
            {
                - are_two_entities_together(SecondCharacter, PG): No, gli alberi no, poveri!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    E non povera {charNameTwo}?!?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
            } 
            ~ firstChar_pauseTalking = firstChar_pauseDuration
            ~ firstChar_justTalked = true
            @animation:RewriterBook
            
            -> options_first_character
    
    = eleven
        //Da qui, no problem con contenuti TW. Si mette Chitarra che ci dice che, se non ce la sentiamo, ci dice qualcosa di diverso. Il rapporto non cambia., il greenhouse_questionsCounter non sale.
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
        //Famiglia d'origine
        ~ firstChar_storyletsForRewritingCount ++
        
         Ti racconto una cosa idiota. La passione per la musica l'ho presa da mio papà.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
         Lo stesso uomo che ora vorrebbe cercassi un "lavoro vero".#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
         Casa è piena di vecchi strumenti che nessuno tocca da anni.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
         Sono del nonno paterno.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         Papà li tiene come se fossero delle reliquie.
         Da piccola ogni tanto mi lasciava sentire le vecchie registrazioni, di quando nonno suonava e cantava nelle balere.
         Nonno era un chad to-ta-le.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
         A volte papà ballava con me e mamma.
         E rideva un sacco.
         Non il suo sport preferito, ora.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
        
            + [L'inferno è uno strumento che non può suonare.]
                -> color_variation_management(FirstCharacter, purpleC)->
                 Adoro.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Non avrei saputo dirlo meglio.
                 Ogni tanto li rubavo e suonavo in camera.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Alcuni avevano un suono storto, forse per colpa delle tarme.
                 Però ho sempre amato le cose un po' rotte perché hanno una storia tutta loro.
                    
                    
            + [E ora accresci l'albero della tua famiglia.]
                -> color_variation_management(FirstCharacter, greenC)->
                 Più o meno.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Per nonno la musica era fatta per unire, salvare il mondo forse.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Quando ci viene da ballare e cantare ci passa la voglia di litigare, no?
                    
                    
            + [Credi che tuo padre si sia arreso?]
                -> color_variation_management(FirstCharacter, redC)->
                 Merda, ci vai giù piano {player_name}!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Non ci crederai, ma no, secondo me no.
                 Lui è davvero felice di ciò che fa.
                 Il problema è che pensa che visto che le cose che fa lo fanno felice, allora tutti devono essere felici facendo le cose che fa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Non ci avevo pensato, ma ora ho capito da dove gli vengono certe idee politiche di merda.
                    
                    
            + [Ti va di ballare con me?]
                -> color_variation_management(FirstCharacter, yellowC)->
                 Sì ama!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Forse non ora però.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Questa cosa della chitarra inizia a pesarmi.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
                    
                    
            + [Esistono lavori veri e lavori non veri?]
                -> color_variation_management(FirstCharacter, blueC)->
                 Sei tu la persona seria, no?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Se la vedi come mio padre la risposta è <i>sì</i>.
                 E non casualmente i lavori non veri sono tutti quelli che mi piacciono.
                    
            -
            
        Lasciami un po' sola ora, {player_name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
        Perché sto entrando in fase lamentosa e non ho voglia di cringiarti.
             ~ firstChar_pauseTalking = firstChar_pauseDuration
             ~ firstChar_justTalked = true
            @animation:RewriterBook
            
                    -> options_first_character
            
    = twelve
        //Da qui, no problem con contenuti TW. Si mette Chitarra che ci dice che, se non ce la sentiamo, ci dice qualcosa di diverso. Il rapporto non cambia., il greenhouse_questionsCounter non sale.
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ firstChar_storyletsForRewritingCount ++
    
         Comunque in merito a quello che ti dicevo prima, ama: non è che papà sia un mostro, sia chiaro. #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         Mamma è più cinica di papà.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
         Le sono grata, quello sicuro: è lei che ha convinto papà a farmi fare il conservatorio.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         Ma per farmi diventare una Lang Lang, Mitsuko Uchida, Alfred Brendel.
         Prestigio, onoreficienze e denaro.
         Lib totale lei, totale.
         Ma chi glielo dice che a ventitrè anni per queste cose sono già vecchia?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
            {
            - are_two_entities_together(SecondCharacter, PG): Moooooolto vecchia!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Nanerottolo, vieni qui, che ti trasformo in uno sgabello!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            }         
        Se l'obiettivo è diventare Uchida, sono già fottuta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
        
            + [Tua mamma vuole il tuo o il suo di bene?]
                -> color_variation_management(FirstCharacter, greenC)->
                 A mia madre interessa solo il nome della famiglia.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Come se poi fosse prestigioso.
                 Un po' mi spiace perché mi rendo conto che lei ci tiene proprio a sembrare una di quelle fighe.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Ed è l'unica a non accorgersi che può fare tutte le cose più assurde del mondo, ma tanto nessuno la considererà una al top.
                 Povera.
                    
                    
            + [Loro hanno fatto concerti prima della maggiore età.]
                -> color_variation_management(FirstCharacter, blueC)->
                 Grazie per avermelo ricordato.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Ne avevo davvero bisogno.
                 Ora dimmi che sono fallita e così posso appendere il piano al muro.
                 E non dirmi che non si può appendere un pianoforte al muro o giuro che ti rompo i timpani urlando.
                    
                
            + [La strada sbagliata è quella con più insegnamenti.]
                -> color_variation_management(FirstCharacter, redC)->
                {player_name}: non un nome ma un dispenser di aforismi.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                Però in qualche modo ha senso.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                Ma presto o tardi dovrò pure capire come mangiare, e a quel punto cosa me ne faccio di tutte le strade sbagliate del mondo?
                        
                        
            + [Ma loro si divertono, quando suonano?]
                -> color_variation_management(FirstCharacter, yellowC)->
                 Tanto, ama.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Prendi Uchida: quando suona è una gioia per gli occhi.
                 Anche se forse non lo chiamerei proprio divertimento.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Se ne va in un altro luogo, un mondo che non ho ancora trovato.
                 Forse è questo qui?
                 Sto suonando e sono così fatta da non averlo realizzato?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                    
                    
            + [Cambiamo sempre, ma non diventiamo mai chi non siamo.]
                -> color_variation_management(FirstCharacter, purpleC)->
                 Un'altra frase così e mi crusho tantissimo per te.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Ma prima vallo a dire a mia madre.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Ama: mi fa male con queste cose ma non se ne rende nemmeno conto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
                 È come se mi dicesse sempre che sono sbagliata.
                    
            -    
            
        Comunque: direi che ho finito di sputtanare la mia famiglia.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
        Woah.    
        Vado a deprimermi da qualche parte.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed

            ~ firstChar_pauseTalking = firstChar_pauseDuration
            ~ firstChar_justTalked = true
            @animation:RewriterBook
            
                    -> options_first_character


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
                


=== rewriting_proposal_first_character
~ temp charNameOne = translator(firstChar_ActualName)
//Così se decido di uscire dalla conversazione, posso riprendere da dove eravamo rimaste.
    {
        - not confession:
            -> confession
            
        - else:
            -> rewriting
            
    }
    
    = confession
        //Per il feedback, temi legati al rapporto, all'amicizia
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
            
        C'è una cosa che voglio dirti, {player_name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
    
                {
                    -   are_two_entities_together(Mentor, PG):Sicuro è il caso che vi lasci il vostro spazio.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurryl
                            ~ change_entity_place(Mentor)
                }
                {
                    -   are_two_entities_together(SecondCharacter, PG):Nanetto, ci lasceresti un po' da sole?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                            ~ change_entity_place(SecondCharacter)
                }  
            
        Credo di aver capito perché il mio nome qui è {charNameOne}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Penso al Ghiberti.
        Penso all3 am3.
        Penso alla mia famiglia.
        Non so se l'hai visto, ma tutta questa roba mi fa pressione.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
        Tutte le persone che conosco mi stanno chiedendo di fare una scelta, di decidere che cosa fare da grande.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
        Ma sinceramente, {player_name}?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Mi cago addosso all'idea di fare una scelta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
         Perché una scelta chiude strade.
         Perché una scelta delude persone.
         Perché una scelta può portarti in luoghi che non sono per te.
         Ma a quel punto, non si può più tornare indietro.
         E così l'unica cosa che rimane è rinunciare.
         Lasciare che le altre persone scelgano per te.
         O che lo faccia il mondo.
         Ecco perché mi chiamo {charNameOne}: perché rimango nel medio, nella cosa più ovvia e cringe.
         @animation:RewriterBook
         E lascio che le cose accadano.
            ~ greenhouse_cultivableGrowing ++
    
            + [<i>Voglio cominciare la riscrittura.]
                -> rewriting
            
            + [Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.]
                -> main


    = rewriting
    ~ temp charNameOne = translator(firstChar_ActualName)
            //Valuto lo stato della relazione 
                -> firstAffinityCalc ->

            //Vado a svuotare i contatori di colore, così son tranquilla.
                -> storage_colors(FirstCharacter) ->
            
            //E poi a seconda dello stato di inchiostro, mi sposto sulla domanda prevista    
                {
                    - firstChar_InkLevel == ink_empty:
                        -> ending
                    - else: 
                        -> one
                } 


        = one
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
    
        {
            -   are_two_entities_together(Mentor, PG): Bene, è il momento che mi allontani.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
                    ~ change_entity_place(Mentor)
        }
        {
            -   are_two_entities_together(SecondCharacter, PG): {charNameTwo}, avremmo bisogno di privacy, puoi andare a fare due passi?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                    ~ change_entity_place(SecondCharacter)
        }
        
        Sono pronta, {player_name}. Iniziamo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        
        
        Prima hai detto che hai il terrore di fare una scelta.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
            
            + [Qui hai accettato il tuo nuovo nome.]
                -> color_variation_management(FirstCharacter, blueC)->
                Accettare è una scelta.
                Cercare risposte è un'altra scelta ancora.
                E ammettere una propria paura, una scelta enorme.
                  
            + [Ma hai deciso di costruire una famiglia con l3 tu3 am3.]
                -> color_variation_management(FirstCharacter, greenC)->
                Hai aperto il tuo cuore, e loro ti amano.
                Si preoccupano per te, cercano di aiutarti a trovare la tua strada.
                E questo amore è frutto di infinite piccole scelte fatte ogni giorno.
            
            + [Dimenticando che per finire gli studi hai lottato per anni.]
                -> color_variation_management(FirstCharacter, redC)->
                Che ogni esame che hai dato è stata una scelta.
                Che ogni lezione che hai seguito è stata una scelta.
                E presto o tardi, hai trovato la volontà di continuare.
                
            + [Ma hai più volte accettato il rischio di suonare sul tetto.]
                -> color_variation_management(FirstCharacter, yellowC)->
                Hai accettato di essere festa in un mondo severo.
                Hai cercato il gioco quando tutto ti dice che devi lavorare.
                Hai accolto falene, scoiattoli e altri animali suonanti.
        
            
            + [Però da che sei qui hai esplorato tutto questo luogo.]
                -> color_variation_management(FirstCharacter, purpleC)->
                Hai inseguito uno scoiattolo.
                Hai cercato Talco.
                Non ti sei fatta spaventare dalla novità.
    
            -
                ~ numberQuestion ++   
            
            Capito. Continua.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            
            {
                - secondChar_storyStatus!=story_storyEnded:{player_name} ha utilizzato la sua prima unità di inchiostro per compiere una riscrittura. L'inchiostro ora si è consumato.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }
            
            
                    {
                    - firstChar_InkLevel == ink_low:
                        -> ending
                    - else: 
                        -> two
                    }        
            
        = two
        ~ temp charNameOne = translator(firstChar_ActualName)
        
        Temi che le persone a cui vuoi bene si sentano tradite dalla scelta che farai.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
    
            + [Con Talco puoi litigare, eppure siete legatissim3.]
                -> color_variation_management(FirstCharacter, redC)->
                Pensi davvero che ti accuserebbe di tradimento solo perché hai deciso di decidere per te stessa?
                Lə Talco che hai raccontato si arrabbierebbe di più se tu facessi una scelta per te pensando a ləi.
                
            + [La paura di tradire è un'altra faccia dell'ego.]
                -> color_variation_management(FirstCharacter, purpleC)->
                È la voglia di sembrare impeccabili.
                Infallibili.
                Inattaccabili.
                Ma amore e crescita prosperano nell'errore e nella vulnerabilità.
        
            + [Ti preoccupi molto di loro, e poco di te.]
                -> color_variation_management(FirstCharacter, greenC)->
                Non ti sei chiesta molto dove eri, ti sei messa solo a cercare Talco.
                Ti sei preoccupata per Jonah.
                Ma per te?
                
            + [Forse accadrà, ma non è un tuo problema.]
                -> color_variation_management(FirstCharacter, blueC)->
                Stai costruendo la tua vita, non la loro.
                Se la pensano diversamente, non è amicizia, e ti sei salvata da qualcosa di peggiore.
     
                    
            + [Tradiamo la fiducia se rompiamo le regole a nostro vantaggio.]
                -> color_variation_management(FirstCharacter, yellowC)->
                Hai deciso di giocare con loro e lasciar loro tutto il potere?
                O è una regola implicita, che non avete mai concordato ma che senti nell'aria?
                E a prescindere: abbiamo sempre il diritto di revocare un accordo, una regola.
                        
            -
                ~ numberQuestion ++
            Ti ascolto. #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            
            {
                - secondChar_storyStatus!=story_storyEnded:{player_name} ha utilizzato la sua seconda unità di inchiostro per procedere con la riscrittura. Il boccetto ora è vuoto.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }        
            
            {
            - firstChar_InkLevel == ink_normal:
                -> ending
            - else:
                -> three
            }
            
        
        = three
        ~ temp charNameOne = translator(firstChar_ActualName)
        Vedi una scelta come una strada chiusa, qualcosa da cui non poter tornare indietro.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
                
            + [Se non tiri nessun dado, non c'è storia da far avanzare.]
                -> color_variation_management(FirstCharacter, yellowC)->
                Quando giochi non sempre le cose vanno come vuoi, ma comunque <i>vanno</i>.
                E fintanto che le cose hanno di dove andare, c'è tempo per cambiare.
                E a volte anche ritirare i dadi.
            
            + [Tutt3 hanno immaginato sorti diverse per Jonah, ma nessuna fine.]
                -> color_variation_management(FirstCharacter, blueC)->
                Ogni passo avanti prevede la possibilità di tornare indietro.
                A volte è più difficile, a volte meno, ma è sempre possibile.
                    
            + [Eppure la prima cosa che hai visto qui sono otto sentieri.]
                -> color_variation_management(FirstCharacter, purpleC)->
                Otto luoghi dove andare.
                E ogni sentiero ha una direzione in cui andare, e una da cui tornare.
                A volte l'erba può essere cresciuta.
                A volte l'acqua può averne cancellato un pezzo.
                Ma il sentiero è sempre lì, ad aspettare.
  
            + [A suo modo, la storia di Jonah è un successo.]
                -> color_variation_management(FirstCharacter, redC)->
                Ha deciso che non gli stava più bene quello che aveva, e si è mosso per cambiarlo.
                E il leggere negativamente le cose che forse gli sono capitate raccontano nulla di Jonah e molto di chi le racconta.
                C'è orgoglio anche dietro una cassa del supermercato, non solo su palco.
                    
            + [Ragioni come se fossi sola se dovessi cadere.]
                -> color_variation_management(FirstCharacter, greenC)->
                Pensi che Talco ti abbandonerebbe?
                Anna? Olga? Persino Ennio.
                I tuoi genitori.
                Anche se a volte i vostri cuori sono distanti, quando c'è un bisogno sappiamo sempre ritrovarci.            
            -
                ~ numberQuestion ++
            Mmm.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            
            
            {
                - secondChar_storyStatus!=story_storyEnded:{player_name} ha utilizzato la terza unità di inchiostro, proponendo una riscruttura.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }        
            
            {
            - firstChar_InkLevel == ink_medium:
                -> ending
            - else:
                -> four
            }
        
        = four
        ~ temp charNameOne = translator(firstChar_ActualName)
            Questo posto ti ha assegnato un nome, e quel nome è Chitarra. Ma tu lo vedi come una rinuncia.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
    
            + [Giocare è bello perché puoi sempre rinunciare a farlo.]
                -> color_variation_management(FirstCharacter, yellowC)->
                Quando una roba la devi fare anche quando non vuoi, quello è il lavoro.
                Per questo fa schifo.
            
            + [Quando Anna ha rinunciato all'ex, è rinata.]
                -> color_variation_management(FirstCharacter, greenC)->
                Rinunciare vuol dire anche prendersi cura di sé.
                Un atto d'amore quando qualcosa non ci fa più bene.
            
            + [Un infinito più piccolo resta comunque infinito.]
                -> color_variation_management(FirstCharacter, purpleC)->
                Rinuncia a una cosa e sarai comunque tutto.
                Un nome è solo un nome.
                Una persona è un universo intero.
                
            + [Rinunciando a cercare Talco ti sei tutelata.]
                -> color_variation_management(FirstCharacter, blueC)->
                Se una cosa non ha senso, non ha senso anche se continuiamo ad insistere nel farla.
                    {
                    	- firstChar_possibleStates hasnt Chitarra:
        		            ~ firstChar_possibleStates --
        		           {debug_changeName: Diminuisco lo stato della prima personaggia, che ora è {firstChar_possibleStates }}
                    }            
            
            + [C'è più coraggio nella rinuncia che nel compromesso.]
                -> color_variation_management(FirstCharacter, redC)->
                Spesso è più costosa, ma la coerenza personale non ha prezzo.
                
            -
                ~ numberQuestion ++
            Ok. E quindi... #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            
            {
                - secondChar_storyStatus!=story_storyEnded:{player_name} ha utilizzato la quarta e ultima unità di inchiostro, compiendo il massimo di riscritture possibili.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }   
            
            -> ending
    
        = ending
        ~ temp charNameOne = translator(firstChar_ActualName)
            {
                - secondChar_storyStatus != story_storyEnded:
                    {player_name} sta per utilizzare il potere dell'<b><i>epilogo</b></i>.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                - else:
                    Cosa dirà {player_name} come <b><i>epilogo</b></i>?#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}   
            }  
        
            {
                - firstChar_InkLevel == ink_empty:
                    Mi rendo conto di non aver legato molto con te, e hai tutto il diritto di non ascoltarmi. Ma dopo tutta la tua storia, vorrei darti un consiglio:#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
                - else: Per questo ti dico: #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
            } 
        
             
    
            + [Prendi una strada e se non ti piace cambiala!]
                -> color_variation_management(FirstCharacter, redC)->
            
            + [Dai alla tua vita uno scopo più grande.]
                 -> color_variation_management(FirstCharacter, purpleC)->         
            
            + [Ogni gioco richiede una pausa, e tu hai bisogno di ascoltarti.]
                -> color_variation_management(FirstCharacter, yellowC)->
                
            + [Non deluderai i tuoi amici: loro saranno sempre con te.]
                -> color_variation_management(FirstCharacter, greenC)->
                    
            + [Questa non è la tua strada. Succede. Ora puoi cambiare.]
                -> color_variation_management(FirstCharacter, blueC)->
            
                    
            - 
        //Nota: la parte di accettazione del nome è prima dell'aggiornamento, così il nome nuovo compare solo quando viene dichiarato.    
         Grazie, {player_name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         Mentre ti ascoltavo mi è nata una nuova canzone in testa.
         La canzone del mio nome.
            
            //Prima chiamo il moltiplicatore di colori, così che comunque le scelte fatte qui abbiano un impatto maggiore.
                -> color_modifier(FirstCharacter, firstChar_colorVariation) ->
            
            //Poi aggiorniamo i colori, così il valore complessivo conta per la scelta del nome
                -> update_colors(FirstCharacter) ->     
     
            //E infine genero il nome
                -> firstNaming -> naming
                
            = naming
            ~ temp charNameOne = translator(firstChar_ActualName)
            
            {
                - firstChar_ActualName has Triangolo:
                
                     E il mio vero nome è <b><i>{charNameOne}</b></i>, perché pensavo di essere uno strumento, e invece ho solo fallito.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
                        
                - firstChar_ActualName has RagazzaOrchestra:

                     Mi chiamerò <b><i>{charNameOne}</b></i>: nel non saper rinunciare sono diventata l'ornitorinco della musica.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                        
                - firstChar_ActualName has FlautoDolce:

                     Il mio nome è <b><i>{charNameOne}</b></i>: perché semplice, elementare, ma apprezzata da chi ha buon cuore.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                      
                - firstChar_ActualName has Ocarina:

                     Mi chiamerò <b><i>{charNameOne}</b></i>: perché il suo suono è gioco e festa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
        
                - firstChar_ActualName has Violino:

                     Io sono <b><i>{charNameOne}</b></i>: perché anche se suono bene da sola, do il meglio di me stessa suonando con e per gli altri.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                        
            }
            
                ~ greenhouse_cultivableGrowing ++    
    
                ~ book_BGVariations ++
    
                    {
                    - firstChar_specialEvent == true:
                        -> secret_ending
                    - else:
                        -> exit
                    }
        
        
    = secret_ending
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
        C'è una cosa che devo dirti ama.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
        Riguarda {charNameFive}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Non voglio sembrare una snitch ma continuo a chiedermi: qual è il confine tra essere una brava persona ed essere una manipolatrice?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
        A me non la conta giusta quella.
        Però tra un po' mi potrò levare di culo e non è più un mio problema.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Ma se hai intenzione di restare qui a lungo, forse devi chiedertelo anche tu.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                -> close
            
    = exit
    ~ temp charNameOne = translator(firstChar_ActualName)
        Un'ultima cosa, {player_name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Volevo lasciarti qualcosa di buono di me, prima di andarmene, e ho pensato di donarti una conchiglia.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
        {
            - player_accessiblePlaces has Nest: La troverai al nido, e son sicura che saprai già cosa farne.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            
            - else: Una certa voce mi ha detto che presto saprai cosa farne. E te la farà trovare dove ne avrai più bisogno.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        }
                //Spostiamo la conchiglia
                ~ move_entity(greenShell, Nest)
        
        E ora resterò qui a disturbarti ancora per un po', in attesa del prossimo treno.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                -> close
        
    = close   
            ~ story_endedStories += story_firstCharStoryEnded
            ~ firstChar_storyStatus = story_storyEnded
            ~ player_movementsCounter = 0
            ~ PG_advance_management(FirstCharacter)
            ~ numberQuestion = 0
            ~ firstChar_InkLevel = ink_empty
            A dopo {player_name}!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
            E prenditi un po' di riposo, non mi schiodare!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
            @animation:RewriterBook
            
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
