
=== tutorial_choicesStorylet ===
Tutorial scelte spiegato da Carla




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
Tutorial relazione spiegato da Carla

{
    - tutorial_allTutorialSteps hasnt tutorialRelationship:
        ~ tutorial_allTutorialSteps += tutorialRelationship
}

    ~ move_entity(Carla, Forest)
->->


=== tutorial_inkStorylet ===
Tutorial inchiostro spiegato da Carla


{
    - tutorial_allTutorialSteps hasnt tutorialInk:
        ~ tutorial_allTutorialSteps += tutorialInk
}

->->


=== tutorial_rereadingStorylet ===
Tutorial rilettura spiegato da Carla


{
    - tutorial_allTutorialSteps hasnt tutorialRereading:
        ~ tutorial_allTutorialSteps += tutorialRereading
}

->->


=== tutorial_greenhouseStorylet ===
Tutorial serra spiegato da Carla
{
    - tutorial_allTutorialSteps hasnt tutorialGreenhouse:
        ~ tutorial_allTutorialSteps += tutorialGreenhouse
}

    ~ move_entity(Carla, Forest)
->->


=== tutorial_kitchenStorylet ===
Tutorial cucina spiegato da Carla

{
    - tutorial_allTutorialSteps hasnt tutorialKitchen:
        ~ tutorial_allTutorialSteps += tutorialKitchen
}

    ~ move_entity(Carla, Forest)
->->


=== tutorial_nestStorylet ===
Tutorial nido spiegato da Carla

{
    - tutorial_allTutorialSteps hasnt tutorialNest:
        ~ tutorial_allTutorialSteps += tutorialNest
}

    ~ move_entity(Carla, Forest)
->->