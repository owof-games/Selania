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
    - are_two_entities_together(Franco, PG) && not cooking_alone && (kitchen_secondCharIsCooking == false) && (kitchen_firstCharIsCooking == false):
        -> cooking_alone
    
    - else:
        -> main

}

=== cooking_alone ===
    + {are_two_entities_together(Franco, PG) && entity_location(PG) == Kitchen} [Franco] 
    
    Girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_kitchen
    Eccoti cra!
    Sei {player_pronouns has him:pronto|{player_pronouns has her:pronta|prontə}} per cucinare assieme?
        
        + + Ci sto!
            -> cooking_with_frog

        + + Ci penso un attimo.
            -> main
