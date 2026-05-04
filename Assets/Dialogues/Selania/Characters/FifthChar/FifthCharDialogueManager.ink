=== fifth_character ===

//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(FifthCharacter, PG) && fifthChar_storyStatus == story_storyStarted && entity_location(PG) != Kitchen} [FifthCharacter]
            -> talk_with_fifth_character

        //Chiacchierata in cucina
        + {are_two_entities_together(FifthCharacter, PG) && fifthChar_storyStatus == story_storyStarted && entity_location(PG) == Kitchen} [FifthCharacter]
            -> kitchen_storylets_dispatcher  



=== talk_with_fifth_character ===
        {
            - fifthChar_pauseTalking == 0:
                -> knowing_fifth_character

            - else:
                -> options_fifth_character
        }

=== options_fifth_character
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
{

    //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet
        - grimoire_fifthChar has fifthChar_minStoryletsForRewriting && grimoire_fifthChar hasnt grimFifthCharProposal:
                -> ask

    //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo
        - grimoire_fifthChar has grimFifthCharProposal:
                -> ask

    //Vogliamo offrire un dono
        - fifthChar_giftedObject == () && backpack_findedGifts != ():
                -> ask

    //Vogliamo cucinare assieme (dopo almeno uno storylet assieme)
        - player_accessiblePlaces has Kitchen && grimoire_fifthChar has grimFifthCharOne && grimoire_fifthChar hasnt grimFifthCharKitchenEnded && kitchen_fifthCharIsCooking==false:
                -> ask

    - else:
        {
            - fifthChar_justTalked == false:
            {shuffle:

                - {charTag(FifthCharacter, "neutral")}:         Frase

                - {charTag(FifthCharacter, "neutral")}:         Frase

            }

             -> main
            - else:
                ~ fifthChar_justTalked = false
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
            - grimoire_fifthChar has grimFifthCharOne:
                {charTag(FifthCharacter, "neutral")}:         Vuoi chiedermi qualcosa {player_name}? 

            - else:
                {charTag(FifthCharacter, "neutral")}:         Sì? 
        }

        ~ fifthChar_justTalked = false

        //Azioni legate alla riscrittura
            //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona
                + {grimoire_fifthChar has fifthChar_minStoryletsForRewriting && grimoire_fifthChar hasnt grimFifthCharProposal && grimoire_appendices has grimRewritingMentor} \ {charTag(PG, "neutral")}:         Ehi {charNameTwo}, ti va di rileggere assieme le cose in modo diverso?
                        -> rewriting_proposal_fifth_character

            //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo
                    + {grimoire_fifthChar has grimFifthCharProposal} \ {charTag(PG, "neutral")}:                  Iniziamo la riscrittura?
                        -> rewriting_proposal_fifth_character


        //Azioni legate alla costruzione della relazione
            //Offrire un dono
                + {fifthChar_giftedObject == () && backpack_findedGifts != ()} \ {charTag(PG, "neutral")}:         Ti voglio dare questa cosa.
                //Prima accedo al grimorio
                -> grimoire_greenhouse_gifts_and_ingredient ->

                //Dopo di che associo la scelta fatta alla PNG
                ~ fifthChar_giftedObject = grimoire_chosenPlant
                //E svuoto la variabile del grimorio
                ~ grimoire_chosenPlant = ()

                //Check effetto del dono, se è stata compiuta una scelta
                {
                    - fifthChar_giftedObject != ():

                        ~ object_value_for_PNG(fifthChar_giftedObject, Backpack, FifthCharacter)

                            {    
                        
                                - fifthChar_giftedObject has fifthChar_giftedObject:
                                    {charTag(FifthCharacter, "neutral")}:         Frase

                                - fifthChar_giftedObject has fifthChar_giftedObject:
                                    {charTag(FifthCharacter, "neutral")}:         Frase


                                - else:
                                    {charTag(FifthCharacter, "neutral")}:         Frase
                            }

                        //Commento    
                        {charTag(TheWitch, witch_state())}:                                                 <i>Dopo il dono di {player_name} {inkTranslator(FifthCharacter)}.</i>
                        -> achievements_onGame_statusUpdate_GM ->    
                        -> main    

                }



            //Cucinare assieme
            + {player_accessiblePlaces has Kitchen && grimoire_fifthChar has grimFifthCharOne && grimoire_fifthChar hasnt grimFifthCharKitchenEnded && kitchen_fifthCharIsCooking==false}\ {charTag(PG, "neutral")}:         Ti va di cucinare qualcosa assieme?

                {
                    - kitchen_fourthCharIsCooking:
                        {charTag(FifthCharacter, "neutral")}:         C'è già {charNameFour} che cucina qualcosa.
                            ->main

                    - kitchen_fourthCharCookingTogetherInvite:
                        {charTag(FifthCharacter, "neutral")}:         C'è già {charNameFour} che ti sta aspettando.
                            ->main

                    - contentsKitchen has Franco:
                        {charTag(FifthCharacter, "neutral")}:         Ma la mia amica rana ti sta aspettando lì!
                            ->main

                    - kitchen_kitchenOccupied == true:
                        {charTag(FifthCharacter, "neutral")}:         Sai che ho visto il fumo salire prima? Per cui di sicuro c'è qualcuno!
                            ->main         

                    - kitchen_fifthCharCookingTogetherNumberInvite > 0:
                        {stopping:
                            - {charTag(FifthCharacter, "neutral")}:         Prima ti ho aspettato TANTISSIMO! Vado.

                            - {charTag(FifthCharacter, "neutral")}:         Ancora? E poi non ti vedo? Vado.

                            - {charTag(FifthCharacter, "neutral")}:         Non mi piace quando mi trattano così, {player_name}. Ti aspetto per la penultima volta.

                            - {charTag(FifthCharacter, "neutral")}:         Mmm. Vado.
                        }
                            ~ kitchen_fifthCharCookingTogetherInvite = true
                            ~ kitchen_fifthCharCookingTogetherNumberInvite ++
                            ~ move_entity(FifthCharacter, Kitchen)
                            ~ kitchen_kitchenOccupied = true
                                ->main

                    - else:
                        {charTag(FifthCharacter, "neutral")}:         Yeah! Ci vediamo in cucina!
                            ~ move_entity(FifthCharacter, Kitchen)
                            ~ kitchen_fifthCharCookingTogetherInvite = true
                            ~ kitchen_fifthCharCookingTogetherNumberInvite ++
                            ~ kitchen_kitchenOccupied = true
                                ->main
                }

        //Uscita dalla conversazione
            + \ {charTag(PG, "neutral")}:         <i>Lascio il dialogo.
                -> main
            -
                -> talk_with_fifth_character




