=== second_story_gift ===
    ~ temp charNameTwo = translator(secondChar_ActualName)
    {player_name} sta per donare qualcosa a {charNameTwo}. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            
            + {backpack_findedGifts != ()} [Scelgo il dono.]
                ~ gift_currentReceiver += SecondCharacter
                -> backpack_management
            + {backpack_findedGifts == ()} Lo zainetto di {player_name} è vuoto. I#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                ->main
            
        
            = ink_outcome
                {
                    - secondChar_favouritesGifts:
                        Mi hai regalato una cosa STRA-TOS-FE-RI-CA!
                        Meglio delle action figures!
                        Grazie grazie grazie {player_name}!

                    - secondChar_goodGifts:
                        Grazie.
                        È un regalo carino.
                        
                    - else:
                        Sì. No. Boh.
                        Grazie.
                        Magari poi lo guardo.

                }

                Dopo il dono di {player_name} {inkTranslator(SecondCharacter)}. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                    ~ mentor_tutorialPauses = false
                    
                     -> main



=== second_character_opinions
~ temp charNameTwo = translator(secondChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)
~ change_entity_place(Mentor)

    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {shuffle:
        - Nonna dice che ci sono persone da città, da periferia e da campagna. E che lei e papà sono da campagna ma stanno male perché vivono in periferia.
        - Mamma non vuole che vedo i cartoni da grandi, ma quelli della mia età sono stupidi!
        - Quando ero piccolo mio fratello mi inventava tantissime storie con gli animali prima di dormire.
        - Mio fratello dice che devo fidarmi di più degli adulti, ma secondo me lo dice perché è adulto.
        - Il veterinario è come il druido dei videogiochi, ma senza i dadi.
        - Quando mamma è triste riempie la casa di biscotti, ma non me li fa mangiare.
        - Forse non mi dispiace mica che sei qui.
        - Quando me ne vado voglio portare la rana con me.
        - Da grande tornare qui per la biblioteca ogni tanto. E per te.
        - Le piante della serra non ci sono sui miei libri. O sul tablet.
    }#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
            ~ secondChar_pauseTalking = secondChar_pauseDuration
            ~ secondChar_justTalked = true
                -> options_second_character 
    
    
=== second_char_story_ended
~ temp charNameTwo = translator(secondChar_ActualName)
//Con questa formula dopo un tot di scambi o di spostamenti la personaggia se ne va salutandoci.

    {
        - secondChar_exitCounter < secondChar_startingValueExitCounter:
            -> top
        - else:
            -> goodbye
    }
    
        - (top)
        {shuffle:
                - Magari da grande posso fare il riscrittore. Ma per gli animali.
                - Quando sono grande porto via la nonna dalla casa dei vecchi.
                - Voglio chiedere a mio fratello se si prende un cane così ci gioco quando vado da loro.
                - Sono contento di tornare a casa ora, ma mica di non potere tornare qui.
                - Vieni a trovarmi! Così ti faccio vedere tutte le statue di mio fratello.
                - Magari a papà tutta questa roba non la racconto mica.
            }#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
                ~ secondChar_exitCounter ++
        -> main
        
        = goodbye
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ move_entity(secondCharPaint, Bedroom)
        ~ saturationVar ++
        
            {player_name}, mi sa che torno a casa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            Sai che mi è piaciuta alla fine tutta questa cosa?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
            Mi hai regalato il migliore compleanno del mondo.
            Anche se non era mica davvero il mio compleanno.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            Vieni a trovarmi una volta.
            Mi mancherai.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
  
                ~ temp currentPlace = entity_location(PG)
                ~ move_entity(SecondCharacter, Safekeeping)
                ~ secondChar_mailPause = secondChar_mailPauseDuration
                ~ move_entity(TrainNoiseGoingAway, currentPlace)
                
                    -> main








    
