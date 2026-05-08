=== kitchen ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}

{debug: <i>La lista degli oggetti nella stanza è: {contentsKitchen}.}


{
    -kitchen == 1:
        {charTag(TheWitch, witch_state())}:   <i>La cucina si apre a nuovi ingredienti e grandi confidenze.</i>
}    


-> kitchen_storylets_dispatcher


=== kitchen_storylets_dispatcher ===
{   
    //Chitarra
        //Chitarra sta cucinando ed entriamo in cucina
        - are_two_entities_together(FirstCharacterCucina, PG) && entity_location(PG) == Kitchen && kitchen_firstCharIsCooking == true:
            -> first_char_cooking_alone

        
        //Chitarra cucina con noi
        -  are_two_entities_together(FirstCharacterCucina, PG) && entity_location(PG) == Kitchen && grimoire_firstChar hasnt grimFirstCharKitchenEnded && kitchen_firstCharIsCooking == false:
            -> pre_start_cooking_with_first_char


    //Riccio
        //Riccio sta cucinando ed entriamo in cucina
        - are_two_entities_together(SecondCharacterCucina, PG) && entity_location(PG) == Kitchen && kitchen_secondCharIsCooking == true:
            -> second_char_cooking_alone
    
        //Riccio cucina con noi
        -  are_two_entities_together(SecondCharacterCucina, PG) && entity_location(PG) == Kitchen && grimoire_secondChar hasnt grimSecondCharKitchenEnded && kitchen_secondCharIsCooking == false:
            -> pre_start_cooking_with_second_char   

    //Boccale
        //Boccale sta cucinando ed entriamo in cucina
        - are_two_entities_together(ThirdCharacterCucina, PG) && entity_location(PG) == Kitchen && kitchen_thirdCharIsCooking == true:
            -> third_char_cooking_alone
    
        //Boccale cucina con noi
        -  are_two_entities_together(ThirdCharacterCucina, PG) && entity_location(PG) == Kitchen && grimoire_thirdChar hasnt grimThirdCharKitchenEnded && kitchen_thirdCharIsCooking == false:
            -> pre_start_cooking_with_third_char

    //Nonna Molotov
        //Nonna Molotov sta cucinando ed entriamo in cucina
        - are_two_entities_together(FourthCharacterCucina, PG) && entity_location(PG) == Kitchen && kitchen_fourthCharIsCooking == true:
            -> fourth_char_cooking_alone
    
        //Nonna Molotov cucina con noi
        -  are_two_entities_together(FourthCharacterCucina, PG) && entity_location(PG) == Kitchen && grimoire_fourthChar hasnt grimFourthCharKitchenEnded && kitchen_fourthCharIsCooking == false:
            -> pre_start_cooking_with_fourth_char
    
    //Mostro
        //Mostro sta cucinando ed entriamo in cucina
        - are_two_entities_together(FifthCharacterCucina, PG) && entity_location(PG) == Kitchen && kitchen_fifthCharIsCooking == true:
            -> fifth_char_cooking_alone
    
        //Mostro cucina con noi
        -  are_two_entities_together(FifthCharacterCucina, PG) && entity_location(PG) == Kitchen && grimoire_fifthChar hasnt grimFifthCharKitchenEnded && kitchen_fifthCharIsCooking == false:
            -> pre_start_cooking_with_fifth_char

    //Scena in cui cuciniamo da solx
        - are_two_entities_together(FrancoCucina, PG) && not cooking_alone && (kitchen_secondCharIsCooking == false) && (kitchen_firstCharIsCooking == false):
            -> cooking_alone
    
    - else:
        -> main

}

