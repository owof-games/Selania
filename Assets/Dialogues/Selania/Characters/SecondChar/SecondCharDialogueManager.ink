=== second_character ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(SecondCharacter, PG) && secondChar_storyStatus == story_storyStarted && entity_location(PG) != Kitchen} [SecondCharacter]
            -> talk_with_second_character

        //Chiacchierata in cucina
        + {are_two_entities_together(SecondCharacter, PG) && secondChar_storyStatus == story_storyStarted && entity_location(PG) == Kitchen} [SecondCharacter]
            -> kitchen_storylets_dispatcher    

        // //Chiacchiera a fine storia
        // + {are_two_entities_together(SecondCharacter, PG) && secondChar_storyStatus == story_storyEnded} [SecondCharacter]
        //     -> second_char_story_ended

        // + ->

        // -> DONE


=== talk_with_second_character ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
        {

            - secondChar_pauseTalking == 0:
                -> knowing_second_character

            - else:
                -> options_second_character
        }

=== options_second_character
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
{
    //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylets, ma non ho fatto il tutorial su come funziona
        - grimoire_secondChar has secondChar_minStoryletsForRewriting && grimoire_appendices hasnt grimRewritingMentor:
                -> ask
        
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylets, e ho fatto il tutorial su come funziona                    
        - grimoire_secondChar has secondChar_minStoryletsForRewriting && grimoire_secondChar hasnt grimSecondCharProposal && grimoire_appendices has grimRewritingMentor:
                -> ask
        
        //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo         
        - grimoire_secondChar has grimSecondCharProposal:
                -> ask
        
        //Vogliamo offrire un dono            
        - secondChar_giftedObject == () && backpack_findedGifts != ():
                -> ask
        
        //Vogliamo cucinare assieme(dopo almeno uno storylet main)
        - player_accessiblePlaces has Kitchen && grimoire_secondChar has grimSecondCharOne && grimoire_secondChar hasnt grimSecondCharKitchenEnded && kitchen_secondCharIsCooking==false:
                -> ask

    - else:
        {
            - secondChar_justTalked == false:
            {
                - not second_char_main_storylets.eight:
                    {shuffle:
                        - {charTag(SecondCharacter, "neutral")}:        Una volta ho salvato un bambino da un incendio e la sua mamma mi ha fatto una torta gigante.

                        - {charTag(SecondCharacter, "neutral")}:        Sai che so volare? Ma solo quando non mi vede nessuno. E quindi non mi credono.

                        - {charTag(SecondCharacter, "neutral")}:        Una volta ho trovato un sasso maledetto e ora i grandi mi danno la colpa anche di tutto ma io non faccio mai niente!

                        - {charTag(SecondCharacter, "neutral")}:        I grandi non lo sanno ma tutti gli scivoli sono elefanti che dormono.

                        - {charTag(SecondCharacter, "neutral")}:        Mio papà è via sempre perché è un agente segreto, ma non dirlo a nessuno.

                        - {charTag(SecondCharacter, "neutral")}:        Una volta ho sollevato un camion solo perché mi andava.

                        - {charTag(SecondCharacter, "neutral")}:        So andare in macchina. Ho anche fatto le gare del mondo per adulti.

                        - {charTag(SecondCharacter, "neutral")}:        Io non ho paura di nulla.

                        - {charTag(SecondCharacter, "neutral")}:        Ho letto tutti i libri della scuola e la maestra ora mi usa al posto del computer.

                        - {charTag(SecondCharacter, "neutral")}:        Percy Jackson racconta la mia storia. Ma papà non vuole farlo sapere e quindi fingo di essere un bambino normale.

                        - {charTag(SecondCharacter, "neutral")}:        So già fare le equazioni, sono più bravo della maestra.

                        - {charTag(SecondCharacter, "neutral")}:        A scuola una volta ho fatto un salto altissimo e sono arrivato sul tetto.

                        - {charTag(SecondCharacter, "neutral")}:        Una volta ho trovato un dinosauro scavando nel parco giochi, ma poi i cani si sono rubati gli ossi!

                        - {charTag(SecondCharacter, "neutral")}:        Mamma non ci crede ma una volta ho mangiato dieci gelati e non sono stato male ma non me li dà comunque, uffa!

                        - {charTag(SecondCharacter, "neutral")}:        Ho fatto un tema così bello che la maestra l'ha mandato a tutte le mamme per far vedere che sono il bambino più bravo della scuola!
                    }
                    -> main

                - else:
                    {shuffle:
                        - {charTag(SecondCharacter, "neutral")}:        Non prendermi in giro, ma le tartarughe mi fanno paura.

                        - {charTag(SecondCharacter, "neutral")}:        So che l'amico di mio fratello è un fidanzato, ma papà si arrabbia quando lo dico.

                        - {charTag(SecondCharacter, "neutral")}:        Papà fa anche cose gentili. E quando è felice mi porta a vedere le partite. Ma mi annoio.

                        - Nonna mi portava al Bingo, diceva che le porto fortuna.

                        - {charTag(SecondCharacter, "neutral")}:        Sapevi che ci sono delle formiche che coltivano un fungo e se lo mangiano? Non è fighissimo?!?

                        - {charTag(SecondCharacter, "neutral")}:        Sai che i ghepardi sono così timidi che alcuni zoo gli danno dei cani da supporto?

                        - {charTag(SecondCharacter, "neutral")}:        Un giorno voglio vedere dal vivo il pinguino blu.

                        - {charTag(SecondCharacter, "neutral")}:        A volte vorrei solo fare il bambino.

                        - {charTag(SecondCharacter, "neutral")}:        Mi piacerebbe trovare un opossum qui in giro, sono così buffi!

                        - {charTag(SecondCharacter, "neutral")}:        Ai topi piace un sacco il solletico alla pancia, ma io mi arrabbio se me lo fanno.

                        - {charTag(SecondCharacter, "neutral")}:        Una cosa fastidiosa dei grandi è che ti toccano sempre se sei piccolo, e si arrabbiano se ti arrabbi, ma non mi piace essere toccato!

                        - {charTag(SecondCharacter, "neutral")}:        Le mucche imparano un sacco di cose e sono anche felici quando lo fanno.

                        - {charTag(SecondCharacter, "neutral")}:        A volte leggo così tanto che mi dimentico del mondo e mi piace tanto tanto.

                        - {charTag(SecondCharacter, "neutral")}:        C'è una lumaca che può dormire tre anni di fila. Pensa che noia!

                        - {charTag(SecondCharacter, "neutral")}:        L'ippopotamo è super aggressivo. E ha la faccia stupida, vero?

                        - {charTag(SecondCharacter, "neutral")}:        Franco è convinto che {mentorName} non sia di questo posto.
                            {
                                - are_two_entities_together(Mentor, PG):
                                    {charTag(Mentor, "neutral")}:           Franco è anche convinto che {charNameOne} abbia un nido sugli alberi.
                                    {charTag(SecondCharacter, "neutral")}:        Sì no boh.
                                    {charTag(SecondCharacter, "melanchonic")}:    Hai ragione.

                            }
                    }
                    -> main
            }

            - else:
                ~ secondChar_justTalked = false
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
            - grimoire_secondChar has grimSecondCharOne:
                {charTag(SecondCharacter, "energy")}:       Vuoi chiedermi qualcosa {player_name}?

            - else:
                {charTag(SecondCharacter, "neutral")}:        Sì?
        }

        ~ secondChar_justTalked = false

        //Azioni legate alla riscrittura
            //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, ma non ho fatto il tutorial su come funziona
            + {grimoire_secondChar has secondChar_minStoryletsForRewriting && grimoire_appendices hasnt grimRewritingMentor} \ {charTag(PG, "neutral")}:         Ehi {charNameTwo}, ti va di rileggere assieme le cose in modo diverso?
                    {charTag(SecondCharacter, "neutral")}:          Mi sa che {mentorName} vuole dirti qualcosa prima.
                        {
                            - are_two_entities_together(Mentor,PG):
                            {charTag(Mentor, "neutral")}:           Sì {player_name}, parliamo un attimo!
                        }
                            ~ secondChar_tutorial = true
                                -> main

        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona
            + {grimoire_secondChar has secondChar_minStoryletsForRewriting && grimoire_secondChar hasnt grimSecondCharProposal && grimoire_appendices has grimRewritingMentor} \ {charTag(PG, "neutral")}:         Ehi {charNameTwo}, ti va di rileggere assieme le cose in modo diverso?
                    //Incremento le variazioni del libro della Riscrittora

                            -> rewriting_proposal_second_character

        //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo
                + {grimoire_secondChar has grimSecondCharProposal} \ {charTag(PG, "neutral")}:         Iniziamo la riscrittura?
                        -> rewriting_proposal_second_character


        //Azioni legate alla costruzione della relazione

            //Offrire un dono
                + {secondChar_giftedObject == () && backpack_findedGifts != ()} \ {charTag(PG, "neutral")}:         Ti voglio dare questa cosa.
                    //Prima accedo al grimorio
                    -> grimoire_greenhouse_gifts_and_ingredient ->

                    //Dopo di che associo la scelta fatta alla PNG
                    ~ secondChar_giftedObject = grimoire_chosenPlant
                    //E svuoto la variabile del grimorio
                    ~ grimoire_chosenPlant = ()

                    //Check effetto del dono, se è stata compiuta una scelta
                    {
                        - secondChar_giftedObject != ():

                            ~ object_value_for_PNG(secondChar_giftedObject, Backpack, SecondCharacter)

                                {    
                            
                                   - secondChar_favouritesGifts has secondChar_giftedObject:
                                        {charTag(SecondCharacter, "energy")}:           Mi hai regalato una cosa STRA-TOS-FE-RI-CA!
                                                                                        Meglio delle action figures!
                                        {charTag(SecondCharacter, "emotional")}:        Grazie grazie grazie {player_name}!

                                    - secondChar_goodGifts has secondChar_giftedObject:
                                        {charTag(SecondCharacter, "neutral")}:          Grazie.
                                                                                        È un regalo carino.
                                        
                                    - else:
                                        {charTag(SecondCharacter, "neutral")}:          Sì. No. Boh.
                                                                                        Grazie.
                                                                                        Magari poi lo guardo.
                                }

                            //Commento    
                            {charTag(TheWitch, witch_state())}:   <i>Dopo il dono di {player_name} {inkTranslator(SecondCharacter)}.</i>
                            -> achievements_onGame_statusUpdate_GM ->    
                            -> main    

                    }



            //Cucinare assieme
            + {player_accessiblePlaces has Kitchen && grimoire_secondChar has grimSecondCharOne && grimoire_secondChar hasnt grimSecondCharKitchenEnded && kitchen_secondCharIsCooking==false}\ {charTag(PG, "neutral")}:         Ti va di cucinare qualcosa assieme?

                {
                    - kitchen_firstCharIsCooking:
                        {charTag(SecondCharacter, "energy")}:       C'è già {charNameOne} che cucina qualcosa. 
                            ->main

                    - kitchen_firstCharCookingTogetherInvite:
                        {charTag(SecondCharacter, "neutral")}:        C'è già {charNameOne} che ti sta aspettando.
                            ->main

                    - kitchen_thirdCharIsCooking:
                        {charTag(SecondCharacter, "energy")}:       C'è già {charNameThree} che cucina qualcosa. 
                            ->main

                    - kitchen_thirdCharCookingTogetherInvite:
                        {charTag(SecondCharacter, "neutral")}:        C'è già {charNameThree} che ti sta aspettando.
                            ->main       

                    - contentsKitchen has Franco:
                        {charTag(SecondCharacter, "energy")}:       Ma la mia amica rana ti sta aspettando lì!
                            ->main

                    - kitchen_kitchenOccupied == true:
                        {charTag(SecondCharacter, "melanchonic")}:    Sai che ho visto il fumo salire prima? Per cui di sicuro c'è qualcuno!
                            ->main 

                    - kitchen_secondCharCookingTogetherNumberInvite > 0:
                        {stopping:
                            - {charTag(SecondCharacter, "neutral")}:        Prima ti ho aspettato TANTISSIMO! Vado.

                            - {charTag(SecondCharacter, "angry")}:        Ancora? E poi non ti vedo? Vado. 

                            - {charTag(SecondCharacter, "angry")}:        Non mi piace quando mi trattano così, {player_name}. Ti aspetto per la penultima volta.

                            - {charTag(SecondCharacter, "angry")}:        Mmm. Vado. 
                        }
                            ~ kitchen_secondCharCookingTogetherInvite = true
                            ~ kitchen_secondCharCookingTogetherNumberInvite ++
                            ~ move_entity(SecondCharacter, Kitchen)
                            ~ kitchen_kitchenOccupied = true
                                ->main

                    - else:
                        {charTag(SecondCharacter, "emotional")}:        Yeah! Ci vediamo in cucina!
                            ~ move_entity(SecondCharacter, Kitchen)
                            ~ kitchen_secondCharCookingTogetherInvite = true
                            ~ kitchen_secondCharCookingTogetherNumberInvite ++
                            ~ kitchen_kitchenOccupied = true
                                ->main
                }

        //Uscita dalla conversazione
            + \ {charTag(PG, "neutral")}:         <i>Lascio il dialogo.</i>
                -> main
            -
                -> talk_with_second_character




