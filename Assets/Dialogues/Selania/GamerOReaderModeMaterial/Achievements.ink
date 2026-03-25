
//Stati possibili di un achievement. notActive = appartiene all'altra modalità (GR per GM e viceversa). notDiscovered: appartiene a quella modalità, ma è ancora lucchettato.
LIST achievements_statusAchievements = notActive, notDiscovered, inProgress, Discovered


//Achievements Gamer Mode
VAR achievements_oneRewrite = notActive
    VAR achievements_oneRewrite_text = ""
    VAR achievements_oneRewrite_notified = false
VAR achievements_threeRewrite = notActive
    VAR achievements_threeRewrite_text = ""
    VAR achievements_threeRewrite_notified = false
VAR achievements_fiveRewrite = notActive
    VAR achievements_fiveRewrite_text = ""
    VAR achievements_fiveRewrite_notified = false

VAR achievements_fullKitchen = notActive
    VAR achievements_fullKitchen_text = ""
    VAR achievements_fullKitchen_notified = false
VAR achievements_onePerfectIngredient = notActive
    VAR achievements_onePerfectIngredient_text = ""
    VAR achievements_onePerfectIngredient_notified = false
VAR achievements_fivePerfectIngredients = notActive
    VAR achievements_perfectIngredientsCounter = 0
    VAR achievements_fivePerfectIngredients_text = ""
    VAR achievements_fivePerfectIngredients_notified = false
    VAR achievements_perfectIngredientsReceivers = ()

VAR achievements_onePerfectGift = notActive
    VAR achievements_onePerfectGift_text = ""
    VAR achievements_onePerfectGift_notified = false
VAR achievements_fivePerfectGifts = notActive
    VAR achievements_perfectGiftsCounter = 0
    VAR achievements_fivePerfectGifts_text = ""
    VAR achievements_fivePerfectGifts_notified = false
    VAR achievements_perfectGiftReceivers = ()

VAR achievements_fullFranco = notActive
    VAR achievements_maxFrancoMissions = 0
    VAR achievements_counterLastingMissions = 0
    VAR achievements_fullFranco_text = ""
    VAR achievements_fullFranco_notified = false

VAR achievements_allSigils = notActive
    VAR achievements_allSigils_text = ""
    VAR achievements_allSigils_notified = false
VAR achievements_allLetters = notActive
    VAR achievements_allLetters_text = ""
    VAR achievements_allLetters_notified = false
    VAR achievements_allLetters_Receivers = ()
    VAR achievements_allLetters_Counter = 0

VAR achievements_fullGreenhouse = notActive
    VAR achievements_fullGreenhouse_text = ""
    VAR achievements_fullGreenhouse_notified = false


//Achievements Reader Mode
VAR achievements_goodListener = notActive
    VAR achievements_goodListener_tracker = ()
    VAR achievements_goodListener_text = ""
    VAR achievements_goodListener_notified = false
VAR achievements_fullLore = notActive
    VAR achievements_fullLore_text = ""
    VAR achievements_fullLore_notified = false
VAR achievements_goodReader = notActive
    VAR achievements_goodReader_text = ""
    VAR achievements_goodReader_notified = false


//Chiamo a inizio partita
=== function achievements_start_statusUpdate()
{
    - settings_gamerMode == false:
        ~ achievements_goodListener = notDiscovered
        ~ achievements_fullLore = notDiscovered
        ~ achievements_goodReader = notDiscovered
        ~ achievements_goodListener_tracker = listDumpCharActivators

    - else:
        ~ achievements_oneRewrite = notDiscovered
        ~ achievements_threeRewrite = notDiscovered
        ~ achievements_fiveRewrite = notDiscovered
        ~ achievements_fullKitchen = notDiscovered
        ~ achievements_onePerfectIngredient = notDiscovered
        ~ achievements_fivePerfectIngredients = notDiscovered
        ~ achievements_onePerfectGift = notDiscovered
        ~ achievements_fivePerfectGifts = notDiscovered
        ~ achievements_fullFranco = notDiscovered
        ~ achievements_allSigils = notDiscovered
        ~ achievements_allLetters = notDiscovered
        ~ achievements_fullGreenhouse = notDiscovered
        ~ achievements_maxFrancoMissions = LIST_COUNT(frog_availableCommonMissions) + LIST_COUNT(frog_availableSpecialMissions)

}

=== achievements_onGame_statusUpdate_GM
//Aggiornamento achievements legati alla riscrittura.
{debug_achievements: entro achievements_onGame_statusUpdate_GM, lo stato di settings_gamerMode è {settings_gamerMode}.}

    {
        - settings_gamerMode == false && not tutorial_choicesRelationshipStorylet:
            ->->
    }
    {
        - LIST_COUNT(story_endedStories) == 0:
            ~ achievements_oneRewrite = notDiscovered
                ~ achievements_oneRewrite_text = ""
            ~ achievements_threeRewrite = notDiscovered
                ~ achievements_threeRewrite_text = ""
            ~ achievements_fiveRewrite = notDiscovered
                ~ achievements_fiveRewrite_text = ""

        - LIST_COUNT(story_endedStories) == 1:
            ~ achievements_oneRewrite = Discovered
                ~ achievements_oneRewrite_text = "1/1"
            ~ achievements_threeRewrite = inProgress
                ~ achievements_threeRewrite_text = "{LIST_COUNT(story_endedStories)}/3"
            ~ achievements_fiveRewrite = notDiscovered
                ~ achievements_fiveRewrite_text = ""
                {
                    - achievements_oneRewrite_notified == false:
                        ~ notification_achievement = true
                        ~ achievements_oneRewrite_notified = true
                        ~ notification_achievement = "{achievements_oneRewrite_text}"
                }

        - LIST_COUNT(story_endedStories) == 2:
            ~ achievements_oneRewrite = Discovered
                ~ achievements_oneRewrite_text = "1/1"
            ~ achievements_threeRewrite = inProgress
                ~ achievements_threeRewrite_text = "{LIST_COUNT(story_endedStories)}/3"
            ~ achievements_fiveRewrite = notDiscovered
                ~ achievements_fiveRewrite_text = ""
                

        - LIST_COUNT(story_endedStories) == 3:
            ~ achievements_oneRewrite = Discovered
                ~ achievements_oneRewrite_text = "1/1"
            ~ achievements_threeRewrite = Discovered
                ~ achievements_threeRewrite_text = "{LIST_COUNT(story_endedStories)}/3"
                
            ~ achievements_fiveRewrite = inProgress
                ~ achievements_fiveRewrite_text = "{LIST_COUNT(story_endedStories)}/5"
                {
                    - achievements_threeRewrite_notified == false:
                        ~ achievements_threeRewrite_notified = true
                        ~ notification_achievement = true
                        ~ notification_achievement = "{achievements_threeRewrite}"
                }

        - LIST_COUNT(story_endedStories) == 4:
            ~ achievements_oneRewrite = Discovered
                ~ achievements_oneRewrite_text = "1/1"
            ~ achievements_threeRewrite = Discovered
                ~ achievements_threeRewrite_text = "3/3"
            ~ achievements_fiveRewrite = inProgress
                ~ achievements_fiveRewrite_text = "{LIST_COUNT(story_endedStories)}/5"

        - LIST_COUNT(story_endedStories) == 5:
            ~ achievements_oneRewrite = Discovered
                ~ achievements_oneRewrite_text = "1/1"
            ~ achievements_threeRewrite = Discovered
                ~ achievements_threeRewrite_text = "3/3"
            ~ achievements_fiveRewrite = Discovered
                ~ achievements_fiveRewrite_text = "{LIST_COUNT(story_endedStories)}/5"
                {
                    - achievements_fiveRewrite_notified == false:
                        ~ achievements_fiveRewrite_notified = true
                        ~ notification_achievement = true
                        ~ notification_achievement = "{achievements_fiveRewrite}"
                }          
    }

//Aggiornamento achievements legati alla cucina.
    {
        - LIST_COUNT(kitchen_allChefs) == 0:
            ~ achievements_fullKitchen = notDiscovered
                ~ achievements_fullKitchen_text = ""

        - LIST_COUNT(kitchen_allChefs) == 1:
            ~ achievements_fullKitchen = inProgress
                ~ achievements_fullKitchen_text = "{LIST_COUNT(kitchen_allChefs)}/6"

        - LIST_COUNT(kitchen_allChefs) == 2:
            ~ achievements_fullKitchen = inProgress
                ~ achievements_fullKitchen_text = "{LIST_COUNT(kitchen_allChefs)}/6"

        - LIST_COUNT(kitchen_allChefs) == 3:
            ~ achievements_fullKitchen = inProgress
                ~ achievements_fullKitchen_text = "{LIST_COUNT(kitchen_allChefs)}/6"

        - LIST_COUNT(kitchen_allChefs) == 4:
            ~ achievements_fullKitchen = inProgress
                ~ achievements_fullKitchen_text = "{LIST_COUNT(kitchen_allChefs)}/6"

        - LIST_COUNT(kitchen_allChefs) == 5:
            ~ achievements_fullKitchen = inProgress
                ~ achievements_fullKitchen_text = "{LIST_COUNT(kitchen_allChefs)}/6"

        - LIST_COUNT(kitchen_allChefs) == 6:
            ~ achievements_fullKitchen = Discovered
                ~ achievements_fullKitchen_text = "{LIST_COUNT(kitchen_allChefs)}/6"
                
                {
                    - achievements_fullKitchen_notified == false:
                        ~ achievements_fullKitchen_notified = true
                        ~ notification_achievement = true
                        ~ notification_achievement = "{achievements_fullKitchen_text}"
                } 

    }


    {
        - firstChar_favouritesGifts has kitchen_firstCharExtraIngredient && achievements_perfectIngredientsReceivers hasnt FirstCharacter:
            ~ achievements_perfectIngredientsCounter ++
            ~ achievements_perfectIngredientsReceivers += FirstCharacter
    }
    {
        - secondChar_favouritesGifts has kitchen_secondCharExtraIngredient && achievements_perfectIngredientsReceivers hasnt SecondCharacter:
            ~ achievements_perfectIngredientsCounter ++
            ~ achievements_perfectIngredientsReceivers += SecondCharacter
    }
    {
        - thirdChar_favouritesGifts has kitchen_thirdCharExtraIngredient && achievements_perfectIngredientsReceivers hasnt ThirdCharacter:
            ~ achievements_perfectIngredientsCounter ++
            ~ achievements_perfectIngredientsReceivers += ThirdCharacter
    }
    {
        - fourthChar_favouritesGifts has kitchen_fourthCharExtraIngredient && achievements_perfectIngredientsReceivers hasnt FourthCharacter:
            ~ achievements_perfectIngredientsCounter ++
            ~ achievements_perfectIngredientsReceivers += FourthCharacter
    }
    {
        - fifthChar_favouritesGifts has kitchen_fifthCharExtraIngredient && achievements_perfectIngredientsReceivers hasnt FifthCharacter:
          ~ achievements_perfectIngredientsCounter ++
          ~ achievements_perfectIngredientsReceivers += FifthCharacter
    }
    
    {
        - achievements_perfectIngredientsCounter == 0:
            ~ achievements_onePerfectIngredient = notDiscovered
                ~ achievements_onePerfectIngredient_text = ""
            ~ achievements_fivePerfectIngredients = notDiscovered
                ~ achievements_fivePerfectIngredients_text = ""

        - achievements_perfectIngredientsCounter == 1:
            ~ achievements_onePerfectIngredient = Discovered
                ~ achievements_onePerfectIngredient_text = "1/1"
                
            ~ achievements_fivePerfectIngredients = inProgress
                ~ achievements_fivePerfectIngredients_text = "{achievements_perfectIngredientsCounter}/5"
                {
                    - achievements_onePerfectIngredient_notified == false:
                        ~ achievements_onePerfectIngredient_notified = true
                        ~ notification_achievement = true
                        ~ notification_achievement = "{achievements_onePerfectIngredient}"
                } 

        - achievements_perfectIngredientsCounter == 2:
            ~ achievements_onePerfectIngredient = Discovered
                ~ achievements_onePerfectIngredient_text = "1/1"
            ~ achievements_fivePerfectIngredients = inProgress
                ~ achievements_fivePerfectIngredients_text = "{achievements_perfectIngredientsCounter}/5"

        - achievements_perfectIngredientsCounter == 3:
            ~ achievements_onePerfectIngredient = Discovered
                ~ achievements_onePerfectIngredient_text = "1/1"
            ~ achievements_fivePerfectIngredients = inProgress
                ~ achievements_fivePerfectIngredients_text = "{achievements_perfectIngredientsCounter}/5"

        - achievements_perfectIngredientsCounter == 4:
            ~ achievements_onePerfectIngredient = Discovered
                ~ achievements_onePerfectIngredient_text = "1/1"
            ~ achievements_fivePerfectIngredients = inProgress
                ~ achievements_fivePerfectIngredients_text = "{achievements_perfectIngredientsCounter}/5"

        - achievements_perfectIngredientsCounter == 5:
            ~ achievements_onePerfectIngredient = Discovered
                ~ achievements_onePerfectIngredient_text = "1/1"
            ~ achievements_fivePerfectIngredients = Discovered
                ~ achievements_fivePerfectIngredients_text = "{achievements_perfectIngredientsCounter}/5"
                
                {
                    - achievements_fivePerfectIngredients_notified == false:
                        ~ achievements_fivePerfectIngredients_notified = true
                        ~ notification_achievement = true
                        ~ notification_achievement = "{achievements_fivePerfectIngredients}"
                }            
    }


//Aggiornamento achievements legati ai doni
    {
        - firstChar_favouritesGifts has firstChar_giftedObject && achievements_perfectGiftReceivers hasnt FirstCharacter:
            ~ achievements_perfectGiftsCounter ++
            ~ achievements_perfectGiftReceivers += FirstCharacter
    }
    {
        - secondChar_favouritesGifts has secondChar_giftedObject && achievements_perfectGiftReceivers hasnt SecondCharacter:
            ~ achievements_perfectGiftsCounter ++
            ~ achievements_perfectGiftReceivers += SecondCharacter
    }
    {
        - thirdChar_favouritesGifts has thirdChar_giftedObject && achievements_perfectGiftReceivers hasnt ThirdCharacter:
            ~ achievements_perfectGiftsCounter ++
            ~ achievements_perfectGiftReceivers += ThirdCharacter
    }
    {
        - fourthChar_favouritesGifts has fourthChar_giftedObject && achievements_perfectGiftReceivers hasnt FourthCharacter:
            ~ achievements_perfectGiftsCounter ++
            ~ achievements_perfectGiftReceivers += FourthCharacter
    }
    {
        - fifthChar_favouritesGifts has fifthChar_giftedObject && achievements_perfectGiftReceivers hasnt FifthCharacter:
         ~ achievements_perfectGiftsCounter ++
         ~ achievements_perfectGiftReceivers += FifthCharacter
    }
    {
        - achievements_perfectGiftsCounter == 0:
            ~ achievements_onePerfectGift = notDiscovered
                ~ achievements_onePerfectGift_text = ""
            ~ achievements_fivePerfectGifts = notDiscovered
                ~ achievements_fivePerfectGifts_text = ""

        - achievements_perfectGiftsCounter == 1:
            ~ achievements_onePerfectGift = Discovered
                ~ achievements_onePerfectGift_text = "1/1"
            ~ achievements_fivePerfectGifts = inProgress
                ~ achievements_fivePerfectGifts_text = "{achievements_perfectGiftsCounter}/5"
                {
                    - achievements_onePerfectGift_notified == false:
                        ~ achievements_onePerfectGift_notified = true
                        ~ notification_achievement = true
                        ~ notification_achievement = "{achievements_onePerfectGift}"
                } 

        - achievements_perfectGiftsCounter == 2:
            ~ achievements_onePerfectGift = Discovered
                ~ achievements_onePerfectGift_text = "1/1"
            ~ achievements_fivePerfectGifts = inProgress
                ~ achievements_fivePerfectGifts_text = "{achievements_perfectGiftsCounter}/5"

        - achievements_perfectGiftsCounter == 3:
            ~ achievements_onePerfectGift = Discovered
                ~ achievements_onePerfectGift_text = "1/1"
            ~ achievements_fivePerfectGifts = inProgress
                ~ achievements_fivePerfectGifts_text = "{achievements_perfectGiftsCounter}/5"

        - achievements_perfectGiftsCounter == 4:
            ~ achievements_onePerfectGift = Discovered
                ~ achievements_onePerfectGift_text = "1/1"
            ~ achievements_fivePerfectGifts = inProgress
                ~ achievements_fivePerfectGifts_text = "{achievements_perfectGiftsCounter}/5"

        - achievements_perfectGiftsCounter == 5:
            ~ achievements_onePerfectGift = Discovered
                ~ achievements_onePerfectGift_text = "1/1"
            ~ achievements_fivePerfectGifts = Discovered
                ~ achievements_fivePerfectGifts_text = "{achievements_perfectGiftsCounter}/5"
                {
                    - achievements_fivePerfectGifts_notified == false:
                        ~ achievements_fivePerfectGifts_notified = true
                        ~ notification_achievement = true
                        ~ notification_achievement = "{achievements_fivePerfectGifts}"
                }                 
    }

//Achievement Franco.
    //Prima di tutto guardo qual è la somma delle missioni mancanti.
    ~ achievements_counterLastingMissions = LIST_COUNT(frog_availableCommonMissions) + LIST_COUNT(frog_availableSpecialMissions)
        ~ temp completed_missions = achievements_maxFrancoMissions - achievements_counterLastingMissions
    {
        - achievements_maxFrancoMissions == achievements_counterLastingMissions:
            ~ achievements_fullFranco = notDiscovered
                ~ achievements_fullFranco_text = ""

        - achievements_maxFrancoMissions != achievements_counterLastingMissions && achievements_counterLastingMissions > 0:
            ~ achievements_fullFranco = inProgress
                ~ achievements_fullFranco_text = "{completed_missions}/{achievements_maxFrancoMissions}"

        - achievements_counterLastingMissions == 0:
            ~ achievements_fullFranco = Discovered
                ~ achievements_fullFranco_text = "{completed_missions}/{achievements_maxFrancoMissions}"
               
                {
                    - achievements_fullFranco_notified == false:
                        ~ achievements_fullFranco_notified = true
                        ~ notification_achievement = true
                        ~ notification_achievement = "{achievements_fullFranco}"
                }        

    }

//Achievement sigilli.
    {
        - LIST_COUNT(glyph_discoveredSigils) == 0:
            ~ achievements_allSigils = notDiscovered
                ~ achievements_allSigils_text = ""

        - LIST_COUNT(glyph_discoveredSigils) > 0 && LIST_COUNT(glyph_discoveredSigils) < 60:
            ~ achievements_allSigils = inProgress
                ~ achievements_allSigils_text = "{LIST_COUNT(glyph_discoveredSigils)}/60"

        - LIST_COUNT(glyph_discoveredSigils) == 60:
            ~ achievements_allSigils = Discovered
                ~ achievements_allSigils_text = "{LIST_COUNT(glyph_discoveredSigils)}/60"
                
                {
                    - achievements_allSigils_notified == false:
                        ~ achievements_allSigils_notified = true
                        ~ notification_achievement = true
                        ~ notification_achievement = "{achievements_allSigils}"
                } 
    }

//Achievement lettere.
    //Preparazione.
    {
        - achievements_allLetters_Receivers hasnt FirstCharacter && first_character_notes.one:
            ~ achievements_allLetters_Receivers += FirstCharacter
            ~ achievements_allLetters_Counter ++
    }
    {
        - achievements_allLetters_Receivers hasnt SecondCharacter && second_character_notes.one:
            ~ achievements_allLetters_Receivers += SecondCharacter
            ~ achievements_allLetters_Counter ++
    }
    {
        - achievements_allLetters_Receivers hasnt ThirdCharacter && third_character_notes.one:
            ~ achievements_allLetters_Receivers += ThirdCharacter
            ~ achievements_allLetters_Counter ++
    }
    {
        - achievements_allLetters_Receivers hasnt FourthCharacter && fourth_character_notes.one:
            ~ achievements_allLetters_Receivers += FourthCharacter
            ~ achievements_allLetters_Counter ++
    }
    {
        - achievements_allLetters_Receivers hasnt FifthCharacter && fifth_character_notes.one:
            ~ achievements_allLetters_Receivers += FifthCharacter
            ~ achievements_allLetters_Counter ++
    }



    {
        - achievements_allLetters_Counter == 0:
            ~ achievements_allLetters = notDiscovered
            ~ achievements_allLetters_text = ""

        - achievements_allLetters_Counter == 5:
            ~ achievements_allLetters = Discovered
            ~ achievements_allLetters_text = "5/5"
            {
                - achievements_allLetters_notified == false:
                    ~ achievements_allLetters_notified = true
                    ~ notification_achievement = true
                    ~ notification_achievement = "{achievements_allLetters}"
            } 

        - else:
            ~ achievements_allLetters = inProgress
            ~ achievements_allLetters_text = "{LIST_COUNT(achievements_allLetters_Receivers)}/5" 
            
    }  

//Achievement serra.
    {
        - LIST_COUNT(backpack_findedGifts) == 0:
            ~ achievements_fullGreenhouse = notDiscovered
                ~ achievements_fullGreenhouse_text = ""

        - LIST_COUNT(backpack_findedGifts) < LIST_COUNT(greenhouse_cultivable) && LIST_COUNT(backpack_findedGifts) > 0:
            ~ achievements_fullGreenhouse = inProgress
                ~ achievements_fullGreenhouse_text = "{LIST_COUNT(backpack_findedGifts)}/{LIST_COUNT(greenhouse_cultivable)}"

        - LIST_COUNT(backpack_findedGifts) == LIST_COUNT(greenhouse_cultivable):
            ~ achievements_fullGreenhouse = Discovered
                ~ achievements_fullGreenhouse_text = "{LIST_COUNT(backpack_findedGifts)}/{LIST_COUNT(greenhouse_cultivable)}"
                {
                    - achievements_fullGreenhouse_notified == false:
                        ~ achievements_fullGreenhouse_notified = true
                        ~ notification_achievement = true
                        ~ notification_achievement = "{achievements_fullGreenhouse}"
                }    

    }


{
    - debug_achievements: 
        <b>LIST_COUNT(greenhouse_backupCultivable) è uguale a {LIST_COUNT(greenhouse_backupCultivable)}, e quindi lo stato di achievements_fullGreenhouse è {achievements_fullGreenhouse}.
        <b>LIST_COUNT(glyph_discoveredSigils) è uguale a {LIST_COUNT(glyph_discoveredSigils)}, e quindi lo stato di achievements_allSigils è {achievements_allSigils}.
        <b>achievements_counterLastingMissions è uguale a {achievements_counterLastingMissions}, e quindi lo stato di achievements_fullFranco è {achievements_fullFranco}.
        <b>achievements_perfectGiftsCounter è uguale a {achievements_perfectGiftsCounter}, e quindi lo stato di achievements_onePerfectGift è {achievements_onePerfectGift}, mentre quello di achievements_fivePerfectGifts è {achievements_fivePerfectGifts}.
        <b>achievements_perfectIngredientsCounter è uguale a {achievements_perfectIngredientsCounter}, e quindi lo stato di achievements_onePerfectIngredient è {achievements_onePerfectIngredient}, mentre quello di achievements_fivePerfectIngredients è {achievements_fivePerfectIngredients}.
        <b>LIST_COUNT(kitchen_allChefs) è uguale a {LIST_COUNT(kitchen_allChefs)}, e quindi lo stato di achievements_fullKitchen è {achievements_fullKitchen}.
        <b>LIST_COUNT(story_endedStories) è uguale a {LIST_COUNT(story_endedStories)}, e quindi lo stato di achievements_oneRewrite è {achievements_oneRewrite}, mentre quello di achievements_threeRewrite è {achievements_threeRewrite} e quello di achievements_fiveRewrite è {achievements_fiveRewrite}.

}

        
->->



=== achievements_onGame_statusUpdate_RM
{debug_achievements: entro achievements_onGame_statusUpdate_RM, lo stato di settings_gamerMode è {settings_gamerMode}.}

    {
        - settings_gamerMode == true:
            ->->
        - not tutorial_choicesRelationshipStorylet:
            ->->
    }

//Good listener

{
    - listDumpCharActivators != achievements_goodListener_tracker:
            ~ achievements_goodListener_tracker = listDumpCharActivators
            
}
{
    - LIST_COUNT(achievements_goodListener_tracker) == 0:
        ~ achievements_goodListener = notDiscovered
            ~ achievements_goodListener_text = ""

    - LIST_COUNT(achievements_goodListener_tracker) > 0 && LIST_COUNT(achievements_goodListener_tracker) < 5:
        ~ achievements_goodListener = inProgress
            ~ achievements_goodListener_text = "{LIST_COUNT(achievements_goodListener_tracker)}/5"

    - LIST_COUNT(achievements_goodListener_tracker) == 5:
        ~ achievements_goodListener = Discovered
            ~ achievements_goodListener_text = "{LIST_COUNT(achievements_goodListener_tracker)}/5"
                {
                    - achievements_goodListener_notified == false:
                        ~ achievements_goodListener_notified = true
                        ~ notification_achievement = true
                        ~ notification_achievement = "{achievements_goodListener}"
                }   

}



//Scoperta lore
{
    - LIST_COUNT(horizontalS_discoveredDocs) == 0:
        ~ achievements_fullLore = notDiscovered
            ~ achievements_fullLore_text = ""

    - LIST_COUNT(horizontalS_discoveredDocs) == LIST_COUNT(horizontalS_allDocs):
        ~ achievements_fullLore = Discovered
            ~ achievements_fullLore_text = "{LIST_COUNT(horizontalS_discoveredDocs)}/{LIST_COUNT(horizontalS_allDocs)}"
                {
                    - achievements_fullLore_notified == false:
                        ~ achievements_fullLore_notified = true
                        ~ notification_achievement = true
                        ~ notification_achievement = "{achievements_fullLore}"
                }   

    - (LIST_COUNT(horizontalS_discoveredDocs) > 0):
        ~ achievements_fullLore = inProgress
            ~ achievements_fullLore_text = "{LIST_COUNT(horizontalS_discoveredDocs)}/{LIST_COUNT(horizontalS_allDocs)}"      
}



//Lettura racconti
~ temp readStories = LIST_COUNT(library_allStories) - LIST_COUNT(library_unreadStories)
{
    - LIST_COUNT(library_unreadStories) == LIST_COUNT(library_allStories):
        ~ achievements_goodReader = notDiscovered
            ~ achievements_goodReader_text = ""

    - LIST_COUNT(library_unreadStories) < LIST_COUNT(library_allStories) && LIST_COUNT(library_unreadStories) > 0:
        ~ achievements_goodReader = inProgress
            ~ achievements_goodReader_text = "{LIST_COUNT(readStories)}/{LIST_COUNT(library_allStories)}"

    - LIST_COUNT(library_unreadStories) == 0:
        ~ achievements_goodReader = Discovered
            ~ achievements_goodReader_text = "{LIST_COUNT(readStories)}/{LIST_COUNT(library_allStories)}"
                {
                    - achievements_goodReader_notified == false:
                        ~ achievements_goodReader_notified = true
                        ~ notification_achievement = true
                        ~ notification_achievement = "{achievements_goodReader}"
                }   
}

{
    - debug_achievements: 
        <b>LIST_COUNT(achievements_goodListener_tracker) è {LIST_COUNT(achievements_goodListener_tracker)}, e quindi lo stato di achievements_goodListener è {achievements_goodListener}.
        <b>LIST_COUNT(horizontalS_discoveredDocs) è {LIST_COUNT(horizontalS_discoveredDocs)}, e quindi lo stato di achievements_fullLore è {achievements_fullLore}.
        <b>LIST_COUNT(library_unreadStories) è {LIST_COUNT(library_unreadStories)}, e quindi lo stato di achievements_goodReader è {achievements_goodReader}.
}


    ->->