=== fourth_character ===

//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(FourthCharacter, PG) && fourthChar_storyStatus == story_storyStarted && entity_location(PG) != Kitchen} [FourthCharacter]
            -> talk_with_fourth_character

        //Chiacchierata in cucina
        + {are_two_entities_together(FourthCharacter, PG) && fourthChar_storyStatus == story_storyStarted && entity_location(PG) == Kitchen} [FourthCharacter]
            -> kitchen_storylets_dispatcher  



=== talk_with_fourth_character ===
        {
            - fourthChar_pauseTalking == 0:
                -> knowing_fourth_character

            - else:
                -> options_fourth_character
        }

=== options_fourth_character
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
{

    //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet
        - grimoire_fourthChar has fourthChar_minStoryletsForRewriting && grimoire_fourthChar hasnt grimFourthCharProposal:
                -> ask

    //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo
        - grimoire_fourthChar has grimFourthCharProposal:
                -> ask

    //Vogliamo offrire un dono
        - fourthChar_giftedObject == () && backpack_findedGifts != ():
                -> ask

    //Vogliamo cucinare assieme (dopo almeno uno storylet assieme)
        - player_accessiblePlaces has Kitchen && grimoire_fourthChar has grimFourthCharOne && grimoire_fourthChar hasnt grimFourthCharKitchenEnded && kitchen_fourthCharIsCooking==false:
                -> ask

    - else:
        {
            - fourthChar_justTalked == false:
            {shuffle:

                - {charTag(FourthCharacter, "neutral")}:         Frase

                - {charTag(FourthCharacter, "neutral")}:         Frase

            }

             -> main
            - else:
                ~ fourthChar_justTalked = false
                -> main
        }


}

    = ask
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {
            - grimoire_fourthChar has grimFourthCharOne:
                {charTag(FourthCharacter, "neutral")}:         Vuoi chiedermi qualcosa {player_name}? 

            - else:
                {charTag(FourthCharacter, "neutral")}:         Sì? 
        }

        ~ fourthChar_justTalked = false

        //Azioni legate alla riscrittura
            //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona
                + {grimoire_fourthChar has fourthChar_minStoryletsForRewriting && grimoire_fourthChar hasnt grimFourthCharProposal && grimoire_appendices has grimRewritingMentor} \ {charTag(PG, "neutral")}:         Ehi {charNameFour}, ti va di rileggere assieme le cose in modo diverso?
                        -> rewriting_proposal_fourth_character

            //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo
                    + {grimoire_fourthChar has grimFourthCharProposal} \ {charTag(PG, "neutral")}:                  Iniziamo la riscrittura?
                        -> rewriting_proposal_fourth_character


        //Azioni legate alla costruzione della relazione
            //Offrire un dono
                + {fourthChar_giftedObject == () && backpack_findedGifts != ()} \ {charTag(PG, "neutral")}:         Ti voglio dare questa cosa.
                //Prima accedo al grimorio
                -> grimoire_greenhouse_gifts_and_ingredient ->

                //Dopo di che associo la scelta fatta alla PNG
                ~ fourthChar_giftedObject = grimoire_chosenPlant
                //E svuoto la variabile del grimorio
                ~ grimoire_chosenPlant = ()

                //Check effetto del dono, se è stata compiuta una scelta
                {
                    - fourthChar_giftedObject != ():

                        ~ object_value_for_PNG(fourthChar_giftedObject, Backpack, FourthCharacter)

                            {    
                        
                                - fourthChar_giftedObject has fourthChar_giftedObject:
                                    {charTag(FourthCharacter, "neutral")}:         Frase

                                - fourthChar_giftedObject has fourthChar_giftedObject:
                                    {charTag(FourthCharacter, "neutral")}:         Frase


                                - else:
                                    {charTag(FourthCharacter, "neutral")}:         Frase
                            }

                        //Commento    
                        {charTag(TheWitch, witch_state())}:                                                 <i>Dopo il dono di {player_name} {inkTranslator(FourthCharacter)}.</i>
                        -> achievements_onGame_statusUpdate_GM ->    
                        -> main    

                }



            //Cucinare assieme
            + {player_accessiblePlaces has Kitchen && grimoire_fourthChar has grimFourthCharOne && grimoire_fourthChar hasnt grimFourthCharKitchenEnded && kitchen_fourthCharIsCooking==false}\ {charTag(PG, "neutral")}:         Ti va di cucinare qualcosa assieme?

                {
                    - kitchen_fifthCharIsCooking:
                        {charTag(FourthCharacter, "neutral")}:         C'è già {charNameFive} che cucina qualcosa.
                            ->main

                    - kitchen_fifthCharCookingTogetherInvite:
                        {charTag(FourthCharacter, "neutral")}:         C'è già {charNameFive} che ti sta aspettando.
                            ->main

                    - contentsKitchen has Franco:
                        {charTag(FourthCharacter, "neutral")}:         Ma la mia amica rana ti sta aspettando lì!
                            ->main

                    - kitchen_kitchenOccupied == true:
                        {charTag(FourthCharacter, "neutral")}:         Sai che ho visto il fumo salire prima? Per cui di sicuro c'è qualcuno!
                            ->main         

                    - kitchen_fourthCharCookingTogetherNumberInvite > 0:
                        {stopping:
                            - {charTag(FourthCharacter, "neutral")}:         Prima ti ho aspettato TANTISSIMO! Vado.

                            - {charTag(FourthCharacter, "neutral")}:         Ancora? E poi non ti vedo? Vado.

                            - {charTag(FourthCharacter, "neutral")}:         Non mi piace quando mi trattano così, {player_name}. Ti aspetto per la penultima volta.

                            - {charTag(FourthCharacter, "neutral")}:         Mmm. Vado.
                        }
                            ~ kitchen_fourthCharCookingTogetherInvite = true
                            ~ kitchen_fourthCharCookingTogetherNumberInvite ++
                            ~ move_entity(FourthCharacter, Kitchen)
                            ~ kitchen_kitchenOccupied = true
                                ->main

                    - else:
                        {charTag(FourthCharacter, "neutral")}:         Yeah! Ci vediamo in cucina!
                            ~ move_entity(FourthCharacter, Kitchen)
                            ~ kitchen_fourthCharCookingTogetherInvite = true
                            ~ kitchen_fourthCharCookingTogetherNumberInvite ++
                            ~ kitchen_kitchenOccupied = true
                                ->main
                }

        //Uscita dalla conversazione
            + \ {charTag(PG, "neutral")}:         <i>Lascio il dialogo.
                -> main
            -
                -> talk_with_fourth_character




