 === first_story_gift ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    <i>Stai per donare qualcosa a {charNameOne}.</i> #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            
            + {backpack_findedGifts != ()} [Scelgo il dono.]
                ~ gift_currentReceiver += FirstCharacter
                    -> backpack_management
            
            + {backpack_findedGifts == ()} Il tuo inventario è vuoto.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                    ->main
            
        
            = ink_outcome    
                Dopo il tuo dono {inkTranslator(FirstCharacter)}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                {
                    - firstChar_favouritesGifts:
                        Quello che mi hai dato è qualcosa di più di un regalo: è un gesto di affinità.
                        Mi piace stare con te, {player_name}.

                    - firstChar_goodGifts:
                        I regali mi mettono sempre in imbarazzo, sai?
                        Ma il tuo dono mi ha fatto sentire ascoltata.

                    - else:
                        Non mi aspettavo un regalo.
                        Per cui non dovrei nemmeno esserne delusa, giusto?

                }

                    ~ mentor_tutorialPauses = false
                        -> main
                


=== first_character_opinions
~ temp charNameOne = translator(firstChar_ActualName) 
    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {~ Talco dice sempre che bisogna sporcarsi le mani per capire il mondo.|Se proprio devo restare qui, tiro su una band con le api. Sono troppo chaddone loro.|Comunque il Ghiberti ha una moglie che è stra in gamba. Forse a volte ci si deve compensare. E visto che Talco è svegliə, io allora sono l'idiota della cumpa.|Resti tra noi, ma il Conservatorio è un posto del cazzo. C'è una competitività che non c'entra nulla con la musica.|Mi scoccia litigare con mio padre, ma io e il suo modo di fare NON. ANDIAMO. D'ACCORDO. Zero, ama. Zero.}#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            ~ firstChar_pauseTalking = firstChar_pauseDuration
            ~ firstChar_justTalked = true
                -> options_first_character 

    
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
                
                ~ temp currentPlace = entity_location(PG)
                ~ move_entity(FirstCharacter, Safekeeping)
                
                ~ move_entity(TrainNoiseGoingAway, currentPlace)
                ~ firstChar_mailPause = firstChar_mailPauseDuration
                
            
        -> main




