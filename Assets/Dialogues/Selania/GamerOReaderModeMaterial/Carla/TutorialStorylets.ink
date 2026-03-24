//Tutorial sul game play principale

=== tutorial_choicesStorylet ===
    {
    - tutorial_greenhouseStorylet == 1:
    ~ move_entity(Carla, TrainStop)
    }
Tutorial scelte spiegato da Carla#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored

TEMPORANEAMENTE CI FA ATTIVARE/DISATTIVARE LA MODALITa' GAMER e READER MODE, per testing.
    + Voglio la modalità Gamer Mode
        ~ settings_gamerMode = true
    + Voglio la modalità Reader Mode
        ~ settings_gamerMode = false
    -
Va bene.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    ~ achievements_start_statusUpdate()

    {
        - tutorial_allTutorialSteps hasnt tutorialChoices:
            ~ tutorial_allTutorialSteps += tutorialChoices
            ~ move_entity(Carla, Forest)
    }


->->



=== tutorial_relationshipStorylet ===
Tutorial relazione spiegato da Carla#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored



    {
        - tutorial_allTutorialSteps hasnt tutorialRelationship:
            ~ tutorial_allTutorialSteps += tutorialRelationship
    }


    
->->


=== tutorial_inkStorylet ===
Tutorial inchiostro spiegato da Carla#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored



    {
        - tutorial_allTutorialSteps hasnt tutorialInk:
            ~ tutorial_allTutorialSteps += tutorialInk
    }

->->


=== tutorial_rereadingStorylet ===
Tutorial rilettura spiegato da Carla#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored



    {
        - tutorial_allTutorialSteps hasnt tutorialRereading:
            ~ tutorial_allTutorialSteps += tutorialRereading
    }

->->





//Tutorial sui luoghi
=== tutorial_greenhouseStorylet ===
{
    - tutorial_greenhouseStorylet == 1:
    ~ move_entity(Carla, Greenhouse)
}

Tutorial serra spiegato da Carla#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored


{
    - tutorial_relationshipStorylet: commento se sei passatx dal tutorial relazione.
    - else: commento se non sei passatx dal tutorial relazione.
}


{
    - tutorial_inkStorylet: commento se sei passatx dal tutorial inchiostro.
    - else: commento se non sei passatx dal tutorial inchiostro.
}


{
    - tutorial_allTutorialSteps hasnt tutorialGreenhouse:
        ~ tutorial_allTutorialSteps += tutorialGreenhouse
        ~ move_entity(Carla, Forest)
        ->->
}

    
->->



=== tutorial_kitchenStorylet ===
{
    - tutorial_kitchenStorylet == 1:
        ~ move_entity(Carla, Kitchen)
}


Tutorial cucina spiegato da Carla#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored

{
    - tutorial_relationshipStorylet: commento se sei passatx dal tutorial relazione.
    - else: commento se non sei passatx dal tutorial relazione.
}

{
    - tutorial_inkStorylet: commento se sei passatx dal tutorial inchiostro.
    - else: commento se non sei passatx dal tutorial inchiostro.
}

{
    - tutorial_greenhouseStorylet: commento sei sei passatx dal tutorial serra.
    - else: commento se non sei passatx dal tutorial serra, questo perché si mettono gli ingredienti come extra
}

{
    - tutorial_allTutorialSteps hasnt tutorialKitchen:
        ~ tutorial_allTutorialSteps += tutorialKitchen
        ~ move_entity(Carla, Forest)
            -> main
}

    
->->


=== tutorial_nestStorylet ===
{
    - tutorial_nestStorylet == 1:
        ~ move_entity(Carla, Nest)
}


Tutorial nido spiegato da Carla#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored

{
    - tutorial_allTutorialSteps hasnt tutorialNest:
        ~ tutorial_allTutorialSteps += tutorialNest
        ~ move_entity(Carla, Forest)
        -> main
}

    
->->

=== carla_achievements
Achievements Gamer Mode
achievements_oneRewrite: {achievements_oneRewrite}, {achievements_oneRewrite_text}
achievements_threeRewrite: {achievements_threeRewrite}, {achievements_threeRewrite_text}
achievements_fiveRewrite: {achievements_fiveRewrite}, {achievements_fiveRewrite_text}
achievements_fullKitchen: {achievements_fullKitchen}, {achievements_fullKitchen_text}
achievements_onePerfectIngredient: {achievements_onePerfectIngredient}, {achievements_onePerfectIngredient_text}
achievements_fivePerfectIngredients: {achievements_fivePerfectIngredients}, {achievements_fivePerfectIngredients_text}
achievements_onePerfectGift: {achievements_onePerfectGift}, {achievements_onePerfectGift_text}
achievements_fivePerfectGifts: {achievements_fivePerfectGifts}, {achievements_fivePerfectGifts_text}
achievements_fullFranco: {achievements_fullFranco}, {achievements_fullFranco_text}
achievements_allSigils: {achievements_allSigils}, {achievements_allSigils_text}
achievements_allLetters: {achievements_allLetters}, {achievements_allLetters_text}
achievements_fullGreenhouse: {achievements_fullGreenhouse}, {achievements_fullGreenhouse_text}

Achievements Reader Mode
achievements_goodListener: {achievements_goodListener}, {achievements_goodListener_text}
achievements_fullLore: {achievements_fullLore}, {achievements_fullLore_text}
achievements_goodReader: {achievements_goodReader}, {achievements_goodReader_text}


->->
