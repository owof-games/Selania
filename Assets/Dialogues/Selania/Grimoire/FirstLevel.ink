=== grimoire
    @grimoire1#franco:{strings_francoMissions()} #achievement:oneRewrite:{achievements_oneRewrite_actualValue}:{achievements_oneRewrite_maxValue} #achievement:threeRewrite:{achievements_threeRewrite_actualValue}:{achievements_threeRewrite_maxValue} #achievement:fiveRewrite:{achievements_fiveRewrite_actualValue}:{achievements_fiveRewrite_maxValue} #achievement:fullKitchen:{achievements_fullKitchen_actualValue}:{achievements_fullKitchen_maxValue} #achievement:onePerfectIngredient:{achievements_onePerfectIngredient_actualValue}:{achievements_onePerfectIngredient_maxValue} #achievement:fivePerfectIngredients:{achievements_fivePerfectIngredients_actualValue}:{achievements_fivePerfectIngredients_maxValue} #achievement:onePerfectGift:{achievements_onePerfectGift_actualValue}:{achievements_onePerfectGift_maxValue} #achievement:fivePerfectGifts:{achievements_fivePerfectGifts_actualValue}:{achievements_fivePerfectGifts_maxValue} #achievement:fullFranco:{achievements_fullFranco_actualValue}:{achievements_fullFranco_maxValue} #achievement:allSigils:{achievements_allSigils_actualValue}:{achievements_allSigils_maxValue} #achievement:allLetters:{achievements_allLetters_actualValue}:{achievements_allLetters_maxValue} #achievement:fullGreenhouse:{achievements_fullGreenhouse_actualValue}:{achievements_fullGreenhouse_maxValue} #achievement:goodListener:{achievements_goodListener_actualValue}:{achievements_goodListener_maxValue} #achievement:fullLore:{achievements_fullLore_actualValue}:{achievements_fullLore_maxValue} #achievement:goodReader:{achievements_goodReader_actualValue}:{achievements_goodReader_maxValue}

        //PNG Principali
        + {grimoire_firstChar != ()}[FirstCharacter]
            -> grimoire_firstCharacter

        + {grimoire_secondChar != ()}[SecondCharacter]
            -> grimoire_secondCharacter

        + {grimoire_thirdChar != ()}[ThirdCharacter]
            -> grimoire_thirdCharacter

        + {grimoire_fourthChar != ()}[FourthCharacter]
            -> grimoire_fourthCharacter

        + {grimoire_fifthChar != ()}[FifthCharacter]
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

        + {grimoire_franco != ()}[Franco]
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
        -


-> grimoire