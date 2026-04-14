=== kitchen ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}

{debug: <i>La lista degli oggetti nella stanza è: {contentsKitchen}.}


{
    -kitchen == 1:
        {charTag(TheWitch, "{witch_state()}")}:   <i>La cucina si apre a nuovi ingredienti e grandi confidenze.</i>
}    

{
    - contentsBedroom hasnt kitchenOpened:
            ~ move_entity(kitchenOpened, Bedroom)
}


-> kitchen_storylets_dispatcher


=== kitchen_storylets_dispatcher ===
{   
    //Chitarra
        //Chitarra sta cucinando ed entriamo in cucina
        - are_two_entities_together(FirstCharacter, PG) && entity_location(PG) == Kitchen && kitchen_firstCharIsCooking == true:
            -> first_char_cooking_alone

        
        //Chitarra cucina con noi
        -  are_two_entities_together(FirstCharacter, PG) && entity_location(PG) == Kitchen && grimoire_firstChar hasnt grimFirstCharKitchenEnded && kitchen_firstCharIsCooking == false:
            -> pre_start_cooking_with_first_char


    //Riccio
        //Riccio sta cucinando ed entriamo in cucina
        - are_two_entities_together(SecondCharacter, PG) && entity_location(PG) == Kitchen && kitchen_secondCharIsCooking == true:
            -> second_char_cooking_alone
    
        //Riccio cucina con noi
        -  are_two_entities_together(SecondCharacter, PG) && entity_location(PG) == Kitchen && grimoire_secondChar hasnt grimSecondCharKitchenEnded && kitchen_secondCharIsCooking == false:
            -> pre_start_cooking_with_second_char   

    //Boccale
        //Boccale sta cucinando ed entriamo in cucina
        - are_two_entities_together(ThirdCharacter, PG) && entity_location(PG) == Kitchen && kitchen_thirdCharIsCooking == true:
            -> third_char_cooking_alone
    
        //Boccale cucina con noi
        -  are_two_entities_together(ThirdCharacter, PG) && entity_location(PG) == Kitchen && grimoire_thirdChar hasnt grimThirdCharKitchenEnded && kitchen_thirdCharIsCooking == false:
            -> pre_start_cooking_with_third_char

    
    //Scena in cui cuciniamo da solx
        - are_two_entities_together(Franco, PG) && not cooking_alone && (kitchen_secondCharIsCooking == false) && (kitchen_firstCharIsCooking == false):
            -> cooking_alone
    
    - else:
        -> main

}

=== cooking_alone ===
    + {are_two_entities_together(Franco, PG) && entity_location(PG) == Kitchen} [Franco] 
    
    {charTag(Franco, "{portrait_Franco()}")}:       Girino!
                                                    Eccoti cra!
                                                    Sei {player_pronouns has him:pronto|{player_pronouns has her:pronta|prontə}} per cucinare assieme?
        
        + + Ci sto!
            -> cooking_with_frog

        + + Ci penso un attimo.
            -> main
