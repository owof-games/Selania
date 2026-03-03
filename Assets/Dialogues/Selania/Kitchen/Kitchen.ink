=== kitchen ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}

{debug: <i>La lista degli oggetti nella stanza è: {contentsKitchen}.}


{
    -kitchen == 1:
        <i>La cucina si apre a nuovi ingredienti e grandi confidenze. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
}    

{
    - contentsBedroom hasnt kitchenOpened:
            ~ move_entity(kitchenOpened, Bedroom)
}

    //check storylets soprattutto per far partire il tutorial di Carla, altrimenti la presenza di una scelta blocca il check fino al primo ritorno in main
    -> common_storylets ->

-> kitchen_storylets_dispatcher


=== kitchen_storylets_dispatcher ===
{
    
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

    //Scena in cui cuciniamo da solx
    - are_two_entities_together(TheKitchenFrog, PG) && not cooking_alone && (kitchen_secondCharIsCooking == false) && (kitchen_firstCharIsCooking == false):
        -> cooking_alone
    
    - else:
        -> main

}

=== the_kitchen_frog ===
        + {are_two_entities_together(TheKitchenFrog, PG)} [TheKitchenFrog]
    -> cooking_alone
