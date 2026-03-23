
//Stati possibili di un achievement. notActive = appartiene all'altra modalità (GR per GM e viceversa). notDiscovered: appartiene a quella modalità, ma è ancora lucchettato.
LIST achievements_statusAchievements = notActive, notDiscovered, inProgress, Discovered


TODO: aggiungere logica testi.

//Achievements Gamer Mode
VAR achievements_oneRewrite = notActive
VAR achievements_threeRewrite = notActive
VAR achievements_fiveRewrite = notActive

VAR achievements_fullKitchen = notActive
VAR achievements_onePerfectIngredient = notActive
VAR achievements_fivePerfectIngredients = notActive
    VAR achievements_perfectIngredientsCounter = 0

VAR achievements_onePerfectGift = notActive
VAR achievements_fivePerfectGifts = notActive
    VAR achievements_perfectGiftsCounter = 0

VAR achievements_fullFranco = notActive
    VAR achievements_maxFrancoMissions = 0
    VAR achievements_counterLastingMissions = 0

VAR achievements_allSigils = notActive
VAR achievements_allLetters = notActive
VAR achievements_fullGreenhouse = notActive


//Achievements Reader Mode
VAR achievements_goodListener = notActive
    VAR achievements_goodListener_tracker = ()
VAR achievements_fullLore = notActive
VAR achievements_goodReader = notActive


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
        - settings_gamerMode == false && not tutorial_choicesStorylet:
            ->->
    }
    {
        - LIST_COUNT(story_endedStories) == 0:
            ~ achievements_oneRewrite = notDiscovered
            ~ achievements_threeRewrite = notDiscovered
            ~ achievements_fiveRewrite = notDiscovered

        - LIST_COUNT(story_endedStories) == 1:
            ~ achievements_oneRewrite = Discovered
            ~ achievements_threeRewrite = inProgress
            ~ achievements_fiveRewrite = notDiscovered

        - LIST_COUNT(story_endedStories) == 2:
            ~ achievements_oneRewrite = Discovered
            ~ achievements_threeRewrite = inProgress
            ~ achievements_fiveRewrite = notDiscovered

        - LIST_COUNT(story_endedStories) == 3:
            ~ achievements_oneRewrite = Discovered
            ~ achievements_threeRewrite = Discovered
            ~ achievements_fiveRewrite = inProgress

        - LIST_COUNT(story_endedStories) == 4:
            ~ achievements_oneRewrite = Discovered
            ~ achievements_threeRewrite = Discovered
            ~ achievements_fiveRewrite = inProgress

        - LIST_COUNT(story_endedStories) == 5:
            ~ achievements_oneRewrite = Discovered
            ~ achievements_threeRewrite = Discovered
            ~ achievements_fiveRewrite = Discovered                
    }

//Aggiornamento achievements legati alla cucina.
    {
        - LIST_COUNT(horizontalS_allChefs) == 0:
            ~ achievements_fullKitchen = notDiscovered

        - LIST_COUNT(horizontalS_allChefs) == 1:
            ~ achievements_fullKitchen = inProgress

        - LIST_COUNT(horizontalS_allChefs) == 2:
            ~ achievements_fullKitchen = inProgress

        - LIST_COUNT(horizontalS_allChefs) == 3:
            ~ achievements_fullKitchen = inProgress

        - LIST_COUNT(horizontalS_allChefs) == 4:
            ~ achievements_fullKitchen = inProgress

        - LIST_COUNT(horizontalS_allChefs) == 5:
            ~ achievements_fullKitchen = Discovered    

    }


    {
        - firstChar_favouritesGifts has kitchen_firstCharExtraIngredient:
            ~ achievements_perfectIngredientsCounter ++
    }
    {
        - secondChar_favouritesGifts has kitchen_secondCharExtraIngredient:
            ~ achievements_perfectIngredientsCounter ++
    }
    {
        - thirdChar_favouritesGifts has kitchen_thirdCharExtraIngredient:
            ~ achievements_perfectIngredientsCounter ++
    }
    {
        - fourthChar_favouritesGifts has kitchen_fourthCharExtraIngredient:
            ~ achievements_perfectIngredientsCounter ++
    }
    // {
    //     - fifthChar_favouritesGifts has kitchen_fifthCharExtraIngredient:
    //         ~ achievements_perfectIngredientsCounter ++
    // }
    {
        - achievements_perfectIngredientsCounter == 0:
            ~ achievements_onePerfectIngredient = notDiscovered
            ~ achievements_fivePerfectIngredients = notDiscovered

        - achievements_perfectIngredientsCounter == 1:
            ~ achievements_onePerfectIngredient = Discovered
            ~ achievements_fivePerfectIngredients = inProgress

        - achievements_perfectIngredientsCounter == 2:
            ~ achievements_onePerfectIngredient = Discovered
            ~ achievements_fivePerfectIngredients = inProgress

        - achievements_perfectIngredientsCounter == 3:
            ~ achievements_onePerfectIngredient = Discovered
            ~ achievements_fivePerfectIngredients = inProgress

        - achievements_perfectIngredientsCounter == 4:
            ~ achievements_onePerfectIngredient = Discovered
            ~ achievements_fivePerfectIngredients = inProgress

        - achievements_perfectIngredientsCounter == 5:
            ~ achievements_onePerfectIngredient = Discovered
            ~ achievements_fivePerfectIngredients = Discovered                    
    }


//Aggiornamento achievements legati ai doni
    {
        - firstChar_favouritesGifts has firstChar_giftedObject:
            ~ achievements_perfectGiftsCounter ++
    }
    {
        - secondChar_favouritesGifts has secondChar_giftedObject:
            ~ achievements_perfectGiftsCounter ++
    }
    {
        - thirdChar_favouritesGifts has thirdChar_giftedObject:
            ~ achievements_perfectGiftsCounter ++
    }
    {
        - fourthChar_favouritesGifts has fourthChar_giftedObject:
            ~ achievements_perfectGiftsCounter ++
    }
    // {
    //     - fifthChar_favouritesGifts has fifthChar_giftedObject:
    //         ~ achievements_perfectGiftsCounter ++
    // }
    {
        - achievements_perfectGiftsCounter == 0:
            ~ achievements_onePerfectGift = notDiscovered
            ~ achievements_fivePerfectGifts = notDiscovered

        - achievements_perfectGiftsCounter == 1:
            ~ achievements_onePerfectGift = Discovered
            ~ achievements_fivePerfectGifts = inProgress

        - achievements_perfectGiftsCounter == 2:
            ~ achievements_onePerfectGift = Discovered
            ~ achievements_fivePerfectGifts = inProgress

        - achievements_perfectGiftsCounter == 3:
            ~ achievements_onePerfectGift = Discovered
            ~ achievements_fivePerfectGifts = inProgress

        - achievements_perfectGiftsCounter == 4:
            ~ achievements_onePerfectGift = Discovered
            ~ achievements_fivePerfectGifts = inProgress

        - achievements_perfectGiftsCounter == 5:
            ~ achievements_onePerfectGift = Discovered
            ~ achievements_fivePerfectGifts = Discovered                    
    }

//Achievement Franco.
    //Prima di tutto guardo qual è la somma delle missioni mancanti.
    ~ achievements_counterLastingMissions = LIST_COUNT(frog_availableCommonMissions) + LIST_COUNT(frog_availableSpecialMissions)
    {
        - achievements_maxFrancoMissions == achievements_counterLastingMissions:
            ~ achievements_fullFranco = notDiscovered

        - achievements_maxFrancoMissions != achievements_counterLastingMissions && achievements_counterLastingMissions > 0:
            ~ achievements_fullFranco = inProgress

        - achievements_counterLastingMissions == 0:
            ~ achievements_fullFranco = Discovered     

    }

//Achievement sigilli.
    {
        - LIST_COUNT(glyph_discoveredSigils) == 0:
            ~ achievements_allSigils = notDiscovered

        - LIST_COUNT(glyph_discoveredSigils) > 0 && LIST_COUNT(glyph_discoveredSigils) < 60:
            ~ achievements_allSigils = inProgress

        - LIST_COUNT(glyph_discoveredSigils) == 60:
            ~ achievements_allSigils = Discovered
    }

//Achievement lettere.
    TODO: da creare una volta capito cosa faccio delle lettere di PNG4 e PNG5
    //~ achievements_allLetters = notDiscovered

//Achievement serra.
    {
        - LIST_COUNT(greenhouse_backupCultivable) == LIST_COUNT(greenhouse_cultivable):
            ~ achievements_fullGreenhouse = notDiscovered

        - LIST_COUNT(greenhouse_backupCultivable) < LIST_COUNT(greenhouse_cultivable) && LIST_COUNT(greenhouse_backupCultivable) > 0:
            ~ achievements_fullGreenhouse = inProgress

        - LIST_COUNT(greenhouse_backupCultivable)  == 0:
            ~ achievements_fullGreenhouse = Discovered         

    }


{
    - debug_achievements: 
        <b>LIST_COUNT(greenhouse_backupCultivable) è uguale a {LIST_COUNT(greenhouse_backupCultivable)}, e quindi lo stato di achievements_fullGreenhouse è {achievements_fullGreenhouse}.
        <b>LIST_COUNT(glyph_discoveredSigils) è uguale a {LIST_COUNT(glyph_discoveredSigils)}, e quindi lo stato di achievements_allSigils è {achievements_allSigils}.
        <b>achievements_counterLastingMissions è uguale a {achievements_counterLastingMissions}, e quindi lo stato di achievements_fullFranco è {achievements_fullFranco}.
        <b>achievements_perfectGiftsCounter è uguale a {achievements_perfectGiftsCounter}, e quindi lo stato di achievements_onePerfectGift è {achievements_onePerfectGift}, mentre quello di achievements_fivePerfectGifts è {achievements_fivePerfectGifts}.
        <b>achievements_perfectIngredientsCounter è uguale a {achievements_perfectIngredientsCounter}, e quindi lo stato di achievements_onePerfectIngredient è {achievements_onePerfectIngredient}, mentre quello di achievements_fivePerfectIngredients è {achievements_fivePerfectIngredients}.
        <b>LIST_COUNT(horizontalS_allChefs) è uguale a {LIST_COUNT(horizontalS_allChefs)}, e quindi lo stato di achievements_fullKitchen è {achievements_fullKitchen}.
        <b>LIST_COUNT(story_endedStories) è uguale a {LIST_COUNT(story_endedStories)}, e quindi lo stato di achievements_oneRewrite è {achievements_oneRewrite}, mentre quello di achievements_threeRewrite è {achievements_threeRewrite} e quello di achievements_fiveRewrite è {achievements_fiveRewrite}.

}

        
->->



=== achievements_onGame_statusUpdate_RM
{debug_achievements: entro achievements_onGame_statusUpdate_RM, lo stato di settings_gamerMode è {settings_gamerMode}.}

    {
        - settings_gamerMode == true:
            ->->
        - not tutorial_choicesStorylet:
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

    - LIST_COUNT(achievements_goodListener_tracker) > 0 && LIST_COUNT(achievements_goodListener_tracker) < 5:
        ~ achievements_goodListener = inProgress

    - LIST_COUNT(achievements_goodListener_tracker) == 5:
        ~ achievements_goodListener = Discovered   

}



//Scoperta lore
{
    - LIST_COUNT(horizontalS_discoveredDocs) == 0:
        ~ achievements_fullLore = notDiscovered

    - LIST_COUNT(horizontalS_discoveredDocs) > 0 && LIST_COUNT(horizontalS_discoveredDocs) < LIST_COUNT(horizontalS_allDocs):
        ~ achievements_fullLore = inProgress

    - LIST_COUNT(horizontalS_discoveredDocs) == LIST_COUNT(horizontalS_allDocs):
        ~ achievements_fullLore = Discovered        
}



//Lettura racconti

{
    - LIST_COUNT(library_unreadStories) == LIST_COUNT(library_allStories):
        ~ achievements_goodReader = notDiscovered

    - LIST_COUNT(library_unreadStories) < LIST_COUNT(library_allStories) && LIST_COUNT(library_unreadStories) > 0:
        ~ achievements_goodReader = inProgress

    - LIST_COUNT(library_unreadStories) == 0:
        ~ achievements_goodReader = Discovered        
}

{
    - debug_achievements: 
        <b>LIST_COUNT(achievements_goodListener_tracker) è {LIST_COUNT(achievements_goodListener_tracker)}, e quindi lo stato di achievements_goodListener è {achievements_goodListener}.
        <b>LIST_COUNT(horizontalS_discoveredDocs) è {LIST_COUNT(horizontalS_discoveredDocs)}, e quindi lo stato di achievements_fullLore è {achievements_fullLore}.
        <b>LIST_COUNT(library_unreadStories) è {LIST_COUNT(library_unreadStories)}, e quindi lo stato di achievements_goodReader è {achievements_goodReader}.
}


    ->->