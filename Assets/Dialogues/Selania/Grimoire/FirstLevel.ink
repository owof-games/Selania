=== grimoire
    @grimoire1#franco:{strings_francoMissions()} #achievement:oneRewrite:{achievements_oneRewrite_actualValue}:{achievements_oneRewrite_maxValue} #achievement:threeRewrite:{achievements_threeRewrite_actualValue}:{achievements_threeRewrite_maxValue} #achievement:fiveRewrite:{achievements_fiveRewrite_actualValue}:{achievements_fiveRewrite_maxValue} #achievement:fullKitchen:{achievements_fullKitchen_actualValue}:{achievements_fullKitchen_maxValue} #achievement:onePerfectIngredient:{achievements_onePerfectIngredient_actualValue}:{achievements_onePerfectIngredient_maxValue} #achievement:fivePerfectIngredients:{achievements_fivePerfectIngredients_actualValue}:{achievements_fivePerfectIngredients_maxValue} #achievement:onePerfectGift:{achievements_onePerfectGift_actualValue}:{achievements_onePerfectGift_maxValue} #achievement:fivePerfectGifts:{achievements_fivePerfectGifts_actualValue}:{achievements_fivePerfectGifts_maxValue} #achievement:fullFranco:{achievements_fullFranco_actualValue}:{achievements_fullFranco_maxValue} #achievement:allSigils:{achievements_allSigils_actualValue}:{achievements_allSigils_maxValue} #achievement:allLetters:{achievements_allLetters_actualValue}:{achievements_allLetters_maxValue} #achievement:fullGreenhouse:{achievements_fullGreenhouse_actualValue}:{achievements_fullGreenhouse_maxValue} #achievement:goodListener:{achievements_goodListener_actualValue}:{achievements_goodListener_maxValue} #achievement:fullLore:{achievements_fullLore_actualValue}:{achievements_fullLore_maxValue} #achievement:goodReader:{achievements_goodReader_actualValue}:{achievements_goodReader_maxValue}

        //PNG Principali
        //Apertura: dopo il primo dialogo
        + {grimoire_firstChar has grimFirstCharOne}[FirstCharacter]
            -> grimoire_firstCharacter

        //Apertura: dopo il primo dialogo, o dopo il primo dialogo comune con Chitarra o Boccale
        + {grimoire_secondChar has grimSecondCharOne}[SecondCharacter]
            -> grimoire_secondCharacter

        //Apertura: dopo il primo dialogo, o dopo il primo dialogo comune con Riccio o Franco
        + {grimoire_thirdChar has grimThirdCharOne}[ThirdCharacter]
            -> grimoire_thirdCharacter

        //Apertura??
        + {grimoire_fourthChar has grimFourthCharOne}[FourthCharacter]
            -> grimoire_fourthCharacter

        //Apertura: dopo primo dialogo, o dopo dialogo comune con Chitarra, Boccale, Franco, Riccio
        + {grimoire_fifthChar has grimMentorIntro or grimoire_fifthChar has grimFirstCharMentor or grimoire_fifthChar has grimSecondCharMentorOne or grimoire_fifthChar has grimThirdCharMentor or grimoire_fifthChar has grimMentorFranco}[FifthCharacter]
            //è direttamente il primo livello a fare una differenza d'accesso alle informazioni di PNG5 a seconda che sia come Mentore (e vado quindi solo alle conversation) o Mostro (e allora ho la visualizzazione "normale")
            {
                -  fifthChar_storyStatus != story_storyNotStarted:
                    -> grimoire_fifthCharacter

                - else:
                    -> grimoire_fifth_character_conversation 
            }
            

        //PNG supporto
        + {grimoire_witch has grimWitchIntro}[TheWitch]
            -> grimoire_witchRecap

        + {grimoire_franco has grimFrancoFirst}[Franco]
            -> grimoire_francoRecap

        //Guide
        + {greenhouse_findedCultivables != ()}[Greenhouse]
            -> grimoire_greenhouse

        + {glyph_discoveredSigils != ()}[Sigils]
            -> grimoire_sigils

        + [Rules]
            -> grimoire_rules

        + {grimoire_appendices != ()} [Appendices]
            -> grimoire_appendicesCollection

        + {debug_testing} [Esci dal grimorio]
            -> main

        -


-> grimoire