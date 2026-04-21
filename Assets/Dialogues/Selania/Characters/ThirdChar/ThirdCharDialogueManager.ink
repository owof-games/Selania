=== third_character ===
~ temp charNameTwo = translator(secondChar_ActualName)

//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(ThirdCharacter, PG) && thirdChar_storyStatus == story_storyStarted && entity_location(PG) != Kitchen} [ThirdCharacter]
            -> talk_with_third_character

        //Chiacchierata in cucina
        + {are_two_entities_together(ThirdCharacter, PG) && thirdChar_storyStatus == story_storyStarted && entity_location(PG) == Kitchen} [ThirdCharacter]
            -> kitchen_storylets_dispatcher  

        // //Chiacchiera a fine storia
        // + {are_two_entities_together(ThirdCharacter, PG) && thirdChar_storyStatus == story_storyEnded} [ThirdCharacter]
        //     -> third_char_story_ended

        // + ->

        // -> DONE


=== talk_with_third_character ===
~ temp charNameTwo = translator(secondChar_ActualName)
        {

            - thirdChar_pauseTalking == 0:
                -> knowing_third_character

            - else:
                -> options_third_character
        }

=== options_third_character
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
{
    //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, ma non ho fatto il tutorial su come funziona
        - grimoire_thirdChar has thirdChar_minStoryletsForRewriting && not rewriting_proposal_third_character && grimoire_appendices hasnt grimRewritingMentor:
                -> ask

    //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona
        - grimoire_thirdChar has thirdChar_minStoryletsForRewriting && grimoire_thirdChar hasnt grimThirdCharProposal && grimoire_appendices has grimRewritingMentor:
                -> ask

    //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo
        - grimoire_thirdChar has grimThirdCharProposal:
                -> ask

    //Vogliamo offrire un dono
        - thirdChar_giftedObject == () && backpack_findedGifts != ():
                -> ask

    //Vogliamo cucinare assieme (dopo almeno uno storylet assieme)
        - player_accessiblePlaces has Kitchen && grimoire_thirdChar has grimThirdCharOne && grimoire_thirdChar hasnt grimThirdCharKitchenEnded && kitchen_thirdCharIsCooking==false:
                -> ask

    - else:
        {
            - thirdChar_justTalked == false:
            {shuffle:

                - {charTag(ThirdCharacter, "neutral")}:         Frase

                - {charTag(ThirdCharacter, "neutral")}:         Frase

            }

             -> main
            - else:
                ~ thirdChar_justTalked = false
                -> main
        }


}

    = ask
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        {
            - grimoire_thirdChar has grimThirdCharOne:
                {charTag(ThirdCharacter, "neutral")}:         Vuoi chiedermi qualcosa {player_name}? 

            - else:
                {charTag(ThirdCharacter, "neutral")}:         Sì? 
        }

        ~ thirdChar_justTalked = false

        //Azioni legate alla riscrittura
            //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, ma non ho fatto il tutorial su come funziona
            + {(grimoire_thirdChar has thirdChar_minStoryletsForRewriting) && not rewriting_proposal_third_character && grimoire_appendices hasnt grimRewritingMentor} \ {charTag(PG, "neutral")}:         Ehi {charNameTwo}, ti va di rileggere assieme le cose in modo diverso?
                    {charTag(ThirdCharacter, "neutral")}:         Mi sa che {mentorName} vuole dirti qualcosa prima.
                   
                            ~ thirdChar_tutorial = true
                                -> main

        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona
            + {grimoire_thirdChar has thirdChar_minStoryletsForRewriting && grimoire_thirdChar hasnt grimThirdCharProposal && grimoire_appendices has grimRewritingMentor} \ {charTag(PG, "neutral")}:         Ehi {charNameTwo}, ti va di rileggere assieme le cose in modo diverso?
                    //Incremento le variazioni del libro della Riscrittora

                            -> rewriting_proposal_third_character

        //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo
                + {grimoire_thirdChar has grimThirdCharProposal} \ {charTag(PG, "neutral")}:         Iniziamo la riscrittura?
                        -> rewriting_proposal_third_character


        //Azioni legate alla costruzione della relazione

            //Offrire un dono
                + {thirdChar_giftedObject == () && backpack_findedGifts != ()} \ {charTag(PG, "neutral")}:         Ti voglio dare questa cosa.
                //Prima accedo al grimorio
                -> grimoire_greenhouse_gifts_and_ingredient ->

                //Dopo di che associo la scelta fatta alla PNG
                ~ thirdChar_giftedObject = grimoire_chosenPlant
                //E svuoto la variabile del grimorio
                ~ grimoire_chosenPlant = ()

                //Check effetto del dono, se è stata compiuta una scelta
                {
                    - thirdChar_giftedObject != ():

                        ~ object_value_for_PNG(thirdChar_giftedObject, Backpack, ThirdCharacter)

                            {    
                        
                                - thirdChar_giftedObject has thirdChar_giftedObject:
                                    {charTag(ThirdCharacter, "neutral")}:         Frase

                                - thirdChar_giftedObject has thirdChar_giftedObject:
                                    {charTag(ThirdCharacter, "neutral")}:         Frase


                                - else:
                                    {charTag(ThirdCharacter, "neutral")}:         Frase
                            }

                        //Commento    
                        {charTag(TheWitch, witch_state())}:   <i>Dopo il dono di {player_name} {inkTranslator(ThirdCharacter)}.</i>
                        -> achievements_onGame_statusUpdate_GM ->    
                        -> main    

                }



            //Cucinare assieme
            + {player_accessiblePlaces has Kitchen && grimoire_thirdChar has grimThirdCharOne && grimoire_thirdChar hasnt grimThirdCharKitchenEnded && kitchen_thirdCharIsCooking==false}\ {charTag(PG, "neutral")}:         Ti va di cucinare qualcosa assieme?

                {
                    - kitchen_firstCharIsCooking:
                        {charTag(ThirdCharacter, "neutral")}:         C'è già {charNameOne} che cucina qualcosa.
                            ->main

                    - kitchen_firstCharCookingTogetherInvite:
                        {charTag(ThirdCharacter, "neutral")}:         C'è già {charNameOne} che ti sta aspettando.
                            ->main

                    - kitchen_secondCharIsCooking:
                        {charTag(ThirdCharacter, "neutral")}:         C'è già {charNameTwo} che cucina qualcosa.
                            ->main

                    - kitchen_secondCharCookingTogetherInvite:
                        {charTag(ThirdCharacter, "neutral")}:         C'è già {charNameTwo} che ti sta aspettando.
                            ->main        

                    - contentsKitchen has Franco:
                        {charTag(ThirdCharacter, "neutral")}:         Ma la mia amica rana ti sta aspettando lì!
                            ->main


                    - kitchen_kitchenOccupied == true:
                        {charTag(ThirdCharacter, "neutral")}:         Sai che ho visto il fumo salire prima? Per cui di sicuro c'è qualcuno!
                            ->main         

                    - kitchen_thirdCharCookingTogetherNumberInvite > 0:
                        {stopping:
                            - {charTag(ThirdCharacter, "neutral")}:         Prima ti ho aspettato TANTISSIMO! Vado.

                            - {charTag(ThirdCharacter, "neutral")}:         Ancora? E poi non ti vedo? Vado.

                            - {charTag(ThirdCharacter, "neutral")}:         Non mi piace quando mi trattano così, {player_name}. Ti aspetto per la penultima volta.

                            - {charTag(ThirdCharacter, "neutral")}:         Mmm. Vado.
                        }
                            ~ kitchen_thirdCharCookingTogetherInvite = true
                            ~ kitchen_thirdCharCookingTogetherNumberInvite ++
                            ~ move_entity(ThirdCharacter, Kitchen)
                            ~ kitchen_kitchenOccupied = true
                                ->main

                    - else:
                        {charTag(ThirdCharacter, "neutral")}:         Yeah! Ci vediamo in cucina!
                            ~ move_entity(ThirdCharacter, Kitchen)
                            ~ kitchen_thirdCharCookingTogetherInvite = true
                            ~ kitchen_thirdCharCookingTogetherNumberInvite ++
                            ~ kitchen_kitchenOccupied = true
                                ->main
                }

        //Uscita dalla conversazione
            + \ {charTag(PG, "neutral")}:         <i>Lascio il dialogo.
                -> main
            -
                -> talk_with_third_character




