=== second_story_gift ===
    ~ temp charNameTwo = translator(secondChar_ActualName)
    Stai per donare qualcosa a {charNameTwo}. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + {backpack_findedGifts != ()} [Scelgo il dono.]
                ~ gift_currentReceiver += SecondCharacter
                -> backpack_management
            + {backpack_findedGifts == ()} Il tuo inventario è vuoto. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                ->main
            
        
            = ink_outcome
                {
                    - secondChar_favouritesGifts:
                        Quello che mi hai dato è qualcosa di più di un regalo: è un gesto di affinità.
                        Mi piace stare con te, {player_name}.

                    - secondChar_goodGifts:
                        I regali mi mettono sempre in imbarazzo, sai?
                        Ma il tuo dono mi ha fatto sentire ascoltata.

                    - else:
                        Non mi aspettavo un regalo.
                        Per cui non dovrei nemmeno esserne delusa, giusto?

                }

                Dopo il tuo dono {inkTranslator(SecondCharacter)}. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                    ~ mentor_tutorialPauses = false
                    
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
            ~ temp currentPlace = entity_location(PG)
            
            ~ move_entity(SecondCharacter, Safekeeping)
            ~ secondChar_mailPause = secondChar_mailPauseDuration
    
            ~ move_entity(TrainNoiseGoingAway, currentPlace)
            
                -> main








    
