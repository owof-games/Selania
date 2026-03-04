
=== tutorial_choicesStorylet ===
    {
    - tutorial_greenhouseStorylet == 1:
    ~ move_entity(Carla, TrainStop)
    }
Tutorial scelte spiegato da Carla#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored




    {
        - tutorial_allTutorialSteps hasnt tutorialChoices:
            ~ tutorial_allTutorialSteps += tutorialChoices
    }


    //Se è la prima volta che passo da qui, ovvero se è tutorial effettivo, allora vado anche alla spiegazione delle relazioni, altrimenti no, perché saranno separati.
    {
        - tutorial_choicesStorylet == 1:
            -> tutorial_relationshipStorylet
        - else:
            ->->
    }


=== tutorial_relationshipStorylet ===
Tutorial relazione spiegato da Carla#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored



    {
        - tutorial_allTutorialSteps hasnt tutorialRelationship:
            ~ tutorial_allTutorialSteps += tutorialRelationship
            ~ move_entity(Carla, Forest)
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


=== tutorial_greenhouseStorylet ===
{
    - tutorial_greenhouseStorylet == 1:
    ~ move_entity(Carla, Greenhouse)
}

Tutorial serra spiegato da Carla#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored



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