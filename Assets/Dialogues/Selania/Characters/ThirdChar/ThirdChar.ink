=== third_story_gift ===
    ~ temp charNameTwo = translator(thirdChar_ActualName)
    <i>{player_name} sta per donare qualcosa a {charNameTwo}. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            
            + {backpack_findedGifts != ()} Scelgo il dono.
                ~ gift_currentReceiver += ThirdCharacter
                -> backpack_management
            
            +->
                <i>Lo zaino che accompagna {player_name} è privo di oggetti.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                    ->main
            
        
            = ink_outcome
                {
                    - thirdChar_favouritesGifts has thirdChar_giftedObject:
                        Mi hai regalato una cosa STRA-TOS-FE-RI-CA!#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                        Meglio delle action figures!
                        Grazie grazie grazie {player_name}!#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional

                    - thirdChar_goodGifts has thirdChar_giftedObject:
                        Grazie.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                        È un regalo carino.
                        
                    - else:
                        Sì. No. Boh.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                        Grazie.
                        Magari poi lo guardo.

                }

                <i>Dopo il dono di {player_name} {inkTranslator(ThirdCharacter)}. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}

                     -> main



=== third_character_opinions
~ temp charNameTwo = translator(thirdChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)
~ change_entity_place(Mentor)

    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {shuffle:
        - Nonna dice che ci sono persone da città, da periferia e da campagna. E che lei e papà sono da campagna ma stanno male perché vivono in periferia.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral

        - Mamma non vuole che vedo i cartoni da grandi, ma quelli della mia età sono stupidi!#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral

        - Quando ero piccolo mio fratello mi inventava tantissime storie con gli animali prima di dormire.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral

        - Mio fratello dice che devo fidarmi di più degli adulti, ma thirdo me lo dice perché è adulto.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral

        - Il veterinario è come il druido dei videogiochi, ma senza i dadi.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral

        - Quando mamma è triste riempie la casa di biscotti, ma non me li fa mangiare.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral

        - Forse non mi dispiace mica che sei qui.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral

        - Quando me ne vado voglio portare la rana con me.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral

        - Da grande tornare qui per la biblioteca ogni tanto. E per te.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral

        - Le piante della serra non ci sono sui miei libri. O sul tablet.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral
    }
            ~ thirdChar_pauseTalking = thirdChar_pauseDuration
            ~ thirdChar_justTalked = true
                -> options_third_character 
    
    
=== third_char_story_ended
~ temp charNameTwo = translator(thirdChar_ActualName)
//Con questa formula dopo un tot di scambi o di spostamenti la personaggia se ne va salutandoci.

    {
        - thirdChar_exitCounter < thirdChar_startingValueExitCounter:
            -> top
        - else:
            -> goodbye
    }
    
        - (top)
        {shuffle:
                - Magari da grande posso fare il riscrittore. Ma per gli animali.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral

                - Quando sono grande porto via la nonna dalla casa dei vecchi.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral

                - Voglio chiedere a mio fratello se si prende un cane così ci gioco quando vado da loro.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral

                - Sono contento di tornare a casa ora, ma mica di non potere tornare qui.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral

                - Vieni a trovarmi! Così ti faccio vedere tutte le statue di mio fratello.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral
                
                - Magari a papà tutta questa roba non la racconto mica.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral
            }
                ~ thirdChar_exitCounter ++
        -> main
        
        = goodbye
        ~ temp charNameTwo = translator(thirdChar_ActualName)
        ~ move_entity(thirdCharPaint, Bedroom)
        
            {player_name}, mi sa che torno a casa.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            Sai che mi è piaciuta alla fine tutta questa cosa?#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
            Mi hai regalato il migliore compleanno del mondo.
            Anche se non era mica davvero il mio compleanno.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            Vieni a trovarmi una volta.
            Mi mancherai.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
  
                ~ temp currentPlace = entity_location(PG)
                ~ tree_advance_management(ThirdCharacter)
                ~ move_entity(ThirdCharacter, Safekeeping)
                ~ thirdChar_mailPause = thirdChar_mailPauseDuration
                ~ move_entity(TrainNoiseGoingAway, currentPlace)
                
                    -> main








    
