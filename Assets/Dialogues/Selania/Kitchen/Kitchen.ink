=== kitchen ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
//Qui Oven avrà solo una funzione di animazione, non serve che ci interagiamo

    {debug: <i>La lista degli oggetti nella stanza è: {kitchenContents}.}
    {debug: <i>La lista degli oggetti nel deposito è: {safekeepingContents}.}

    {kitchen == 1:La vecchia cucina non vede l'ora di riempirsi di profumi e chiacchiere.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
    ~ book_arrivingFromTracking = Kitchen
    
        -> witch_frog_mission_notifier ->
        -> kitchen_storylets_dispatcher


=== kitchen_storylets_dispatcher ===
{
    //Scena in cui cuciniamo da solx
    - special_mission_two && not cooking_alone && (not are_two_entities_together(FirstCharacter, PG)) && (not are_two_entities_together(SecondCharacter, PG)):
        ->cooking_alone
    
    //Scena in cui Chitarra sta cucinando da sola
    - are_two_entities_together(FirstCharacter, PG) && kitchen_firstCharIsCooking == true:
        -> first_char_cooking_alone   
    
    //Scena in cui cuciniamo con Chitarra
    - are_two_entities_together(FirstCharacter, PG) && not ending_cooking_with_first_char && (kitchen_firstCharIsCooking == false):
        -> pre_start_cooking_with_first_char
    
    //Scena in cui Riccio sta cucinando da solo
    - are_two_entities_together(SecondCharacter, PG) && kitchen_secondCharIsCooking == true:
        -> second_char_cooking_alone 
    
    //Scena in cui cuciniamo con Riccio
    - are_two_entities_together(SecondCharacter, PG) && not ending_cooking_with_second_char && (kitchen_secondCharIsCooking == false):
        -> pre_start_cooking_with_second_char
    
        
    - else:
        -> main

}



