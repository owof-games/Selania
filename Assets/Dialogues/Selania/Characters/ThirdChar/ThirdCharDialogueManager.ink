=== third_character ===
//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(ThirdCharacter, PG) && thirdChar_storyStatus == story_storyStarted && entity_location(PG) != Kitchen} [ThirdCharacter]
            -> talk_with_third_character

        //Chiacchierata in cucina
        + {are_two_entities_together(ThirdCharacterCucina, PG) && thirdChar_storyStatus == story_storyStarted && entity_location(PG) == Kitchen} [ThirdCharacter]
            -> kitchen_storylets_dispatcher  



=== talk_with_third_character ===
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
    
{
    //Se voglio avviare la riscrittura:
        - grimoire_thirdChar has thirdChar_minStoryletsForRewriting && grimoire_thirdChar hasnt grimThirdCharFirstProposal:
                -> ask
        
    //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo
        - grimoire_thirdChar has grimThirdCharFirstProposal:
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

                - {charTag(ThirdCharacter, "bored")}:                   Una volta sono uscito con una tipa che era carina, per carità, però palesemente non è che voleva stare con me, sentiva solo l’orologio biologico che stava per scadere e voleva un figlio. Anche io voglio un figlio, ma non con una di quarant'anni.

                - {charTag(ThirdCharacter, "bored")}:                   Sei lì sulle app ed è un incubo perché le donne matchano con tutti, hanno tutte le possibilità, mentre tu ti becchi solo quella tipa ogni milione d’anni e o te la fai andare bene o resti solo.

                - {charTag(ThirdCharacter, "bored")}:                   Tutte ormai c'hanno l'ex tossico. Sicuro che Donatella va in dire in giro che io sono tossico, sicuro. 
                
                - {charTag(ThirdCharacter, "bored")}:                   Sono uscita con una che mi piaceva tanto ma lei zero, non ne vuole sapere, perché "tutti i maschi sono delle merde". Ma se dici che le donne son tutte stronze, ti mangiano vivo.

                - {charTag(ThirdCharacter, "jester")}:                  Alla fine c’hanno quarant'anni, trenta, ma sono tutte delle bambine.

                - {charTag(ThirdCharacter, "neutral")}:                 Le donne si lamentano del patriarcato tutto il tempo ma poi le porti fuori a cena e si aspettano che paghi tu.

                - {charTag(ThirdCharacter, "jester")}:                  Dopo il divorzio, Dario era così umiliato che non gli veniva nemmeno duro. C'ha messo un anno per andare di nuovo con una tipa.

                - {charTag(ThirdCharacter, "jester")}:                  Questo posto non è malaccio, ma si vede che non c'è nessuno in giro capace di riparare le cose importanti.

            }
                -> main
            
            - grimoire_thirdChar has grimThirdCharSix:
            {shuffle:

                - {charTag(ThirdCharacter, "neutral")}:                 Quando si inizia questa riscrittura?

                - {charTag(ThirdCharacter, "bored")}:                   Ma la riscrittura?

                - {charTag(ThirdCharacter, "jester")}:                  Sei qui per la riscrittura?

                - {charTag(ThirdCharacter, "angry")}:                   Sto iniziando a innervosirmi, {player_name}: facciamo la riscrittura?

            }
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
    

        {
        - grimoire_thirdChar has grimThirdCharOne:
            {charTag(ThirdCharacter, "jester")}:                            Vuoi chiedermi qualcosa {player_name}? 

        - else:
            {charTag(ThirdCharacter, "jester")}:                            Sì? 
        }

        ~ thirdChar_justTalked = false

        //Azioni legate alla riscrittura
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet.
            + {grimoire_thirdChar has thirdChar_minStoryletsForRewriting && grimoire_thirdChar hasnt grimThirdCharFirstProposal} \ {charTag(PG, "neutral")}:                           {charNameThree}, iniziamo la riscrittura?

                //Check per vedere se ho ascoltato o meno il tutorial necessario
                ~ temp tutorialRewritingConditions = false
                {
                  -  tutorial_MentorTutorial && grimoire_appendices has grimRewritingMentor:
                        ~ tutorialRewritingConditions = true

                  -  tutorial_CarlaTutorial && grimoire_appendices has tutorialRereading:
                        ~ tutorialRewritingConditions = true

                  - tutorial_CarlaTutorial == false && tutorial_MentorTutorial == false:
                         ~ tutorialRewritingConditions = true            
                }

            {//Ma non ho ascoltato il tutorial (se attivo)
                - tutorialRewritingConditions == false:
                    //Sollecitiamo il tutorial
                    ~ tutorial_rereadingActive_requested = true

                        {
                        - tutorial_MentorTutorial == true && tutorial_CarlaTutorial == true:   
                            {charTag(ThirdCharacter, "neutral")}:                       Io ti direi anche subito di sì.
                                                                                        Ma la zia prima vuole dirti due cosine.
                            {charTag(ThirdCharacter, "jester")}:                        Chissà se l'hai fatta arrabbiare.
                                                                                        E anche la capra ha qualcosa da belare.
                                {
                                - are_two_entities_together(Mentor,PG):
                                {charTag(FifthCharacter, "neutral")}:                   No no {player_name}, ma è arrivato il momento di dirti l'ultima cosa fondamentale!
                                }
                                {
                                - are_two_entities_together(Carla,PG):
                                {charTag(Carla, "bored")}:                              Protocollo 115.89: le battute sulle capre sono punite con una settimana di servizio presso gli uffici Zanzare e Tafani.
                                {charTag(ThirdCharacter, "jester")}:                    Scherzo scherzo scherzo, giuro!
                                }   
                                    -> main
                        
                        - tutorial_MentorTutorial == true:
                            {charTag(ThirdCharacter, "neutral")}:                       Io ti direi anche subito di sì.
                                                                                        Ma la zia prima vuole dirti due cosine.
                            {charTag(ThirdCharacter, "jester")}:                        Chissà se l'hai fatta arrabbiare.
                                {
                                - are_two_entities_together(Mentor,PG):
                                {charTag(FifthCharacter, "neutral")}:                   No no {player_name}, ma è arrivato il momento di dirti l'ultima cosa fondamentale!
                                }
                                    -> main

                        - tutorial_CarlaTutorial == true:
                            {charTag(ThirdCharacter, "neutral")}:                       Io sono qui che non voglio fare altro, ma la capra ha qualcosa da belare con te prima.
                                {
                                - are_two_entities_together(Carla,PG):
                                {charTag(Carla, "bored")}:                              Protocollo 115.89: le battute sulle capre sono punite con una settimana di servizio presso gli uffici Zanzare e Tafani.
                                {charTag(ThirdCharacter, "jester")}:                    Scherzo scherzo scherzo, giuro!
                                }
                                    -> main
                        }

                //Ho ascoltato il tutorial, o non è attivo.
                    - else:
                        -> rewriting_proposal_third_character
                }



        //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo
                + {grimoire_thirdChar has grimThirdCharFirstProposal} \ {charTag(PG, "neutral")}:                                                                                                                       Iniziamo la riscrittura?
                        -> rewriting_proposal_third_character


        //Azioni legate alla costruzione della relazione

            //Offrire un dono
                + {thirdChar_giftedObject == () && backpack_findedGifts != ()} \ {charTag(PG, "neutral")}:                                                                                                              Vorrei regalarti questa cosa.

                //Check per vedere se ho ascoltato o meno il tutorial necessario
                ~ temp tutorialConditions = false
                {
                  -  tutorial_MentorTutorial && grimoire_appendices has grimInkMentor:
                        ~ tutorialConditions = true

                  -  tutorial_CarlaTutorial && grimoire_appendices has tutorialGreenhouse:
                        ~ tutorialConditions = true

                  - tutorial_CarlaTutorial == false && tutorial_MentorTutorial == false:
                         ~ tutorialConditions = true              
                }

            {//Ma non ho ascoltato il tutorial (se attivo)
                - tutorialConditions == false:
                    //Traccio che è stato richiesto sostanzialmente il tutorial sui doni:
                            ~ tutorial_inkActive_requested = true

                        {
                        - tutorial_MentorTutorial == true && tutorial_CarlaTutorial == true:   
                            {charTag(ThirdCharacter, "jester")}:                Uh, ma allora siamo già in una storia seria {player_name}!
                                                                                Ma prima c'è qualcuno che deve darti due dritte su come funziona un regalo.
                                                                                Ti aspetterò qui tutto carico, {thirdChar_recordedPlayerPronoun has him:vecio|{thirdChar_recordedPlayerPronoun has her:zia|bomber}}.
                                    {
                                    - are_two_entities_together(Mentor,PG):
                                    {charTag(FifthCharacter, "neutral")}:       Sono io quella con due spiegazioni da darti, {player_name}!
                                    }
                                    {
                                    - are_two_entities_together(Carla,PG):
                                    {charTag(Carla, "bored")}:                  Non so se è un problema culturale, ma {charNameThree} mi mette a disagio.
                                                                                La aspetto in serra, {player_name}.
                                                                                ~ move_entity(Carla, Greenhouse)
                                    }                                        
                                    -> main
                        
                        - tutorial_MentorTutorial == true:
                            {charTag(ThirdCharacter, "jester")}:                Uh, ma allora siamo già in una storia seria {player_name}!
                                                                                Ma prima c'è qualcuno che deve darti due dritte su come funziona un regalo.
                                                                                Ti aspetterò qui tutto carico, {thirdChar_recordedPlayerPronoun has him:vecio|{thirdChar_recordedPlayerPronoun has her:zia|bomber}}.
                                    {
                                    - are_two_entities_together(Mentor,PG):
                                    {charTag(FifthCharacter, "neutral")}:       Sono io quella con due spiegazioni da darti, {player_name}!
                                    }                                               
                                    -> main

                        - tutorial_CarlaTutorial == true:
                            {charTag(ThirdCharacter, "jester")}:                Uh, ma allora siamo già in una storia seria {player_name}!
                                                                                Ma prima c'è qualcuno che deve darti due dritte su come funziona un regalo.
                                                                                Ti aspetterò qui tutto carico, {thirdChar_recordedPlayerPronoun has him:vecio|{thirdChar_recordedPlayerPronoun has her:zia|bomber}}.
         
                                    {
                                    - are_two_entities_together(Carla,PG):
                                    {charTag(Carla, "bored")}:                  Non so se è un problema culturale, ma {charNameThree} mi mette a disagio.
                                                                                La aspetto in serra, {player_name}.
                                                                                ~ move_entity(Carla, Greenhouse)
                                    }                                             
                                    -> main
                        }

                - else:
                    //Prima accedo al grimorio
                    -> grimoire_greenhouse_gifts_and_ingredient ->

                    //Dopo di che associo la scelta fatta alla PNG
                    ~ thirdChar_giftedObject = grimoire_chosenPlant
                    //E alle piante recuperabili da Franco
                    ~ frog_recoverableCultivables += grimoire_chosenPlant
                    //E svuoto la variabile del grimorio
                    ~ grimoire_chosenPlant = ()

                    //Check effetto del dono, se è stata compiuta una scelta
                    {
                        - thirdChar_giftedObject != ():

                        ~ object_value_for_PNG(thirdChar_giftedObject, Backpack, ThirdCharacter)

                        {    
                    
                            - thirdChar_favouritesGifts has thirdChar_giftedObject or thirdChar_goodGifts has thirdChar_giftedObject:

                                {charTag(ThirdCharacter, "bored")}:                 Come diceva la mia maestra alle medie: cinque per l'impegno.
                                                                                    Zero per l'esecuzione.

                            - else:
                                {charTag(ThirdCharacter, "jester")}:                Non so mai cosa dire coi regali, non ne ricevo tanti.
                                                                                    Quindi la cosa giusta credo sia: grazie.
                        }

                        //Commento    
                        {charTag(TheWitch, witch_state())}:                         <i>Dopo il dono di {player_name} {inkTranslator(ThirdCharacter)}.</i>
                        -> achievements_onGame_statusUpdate_GM ->    
                        -> main    

                    }
                
                }



            //Cucinare assieme
            + {player_accessiblePlaces has Kitchen && grimoire_thirdChar has grimThirdCharOne && grimoire_thirdChar hasnt grimThirdCharKitchenEnded && kitchen_thirdCharIsCooking==false}\ {charTag(PG, "neutral")}:         Ti va di cucinare qualcosa assieme?

                {
                    - kitchen_firstCharIsCooking:
                        {charTag(ThirdCharacter, "bored")}:                     Con {charNameOne} che già cucina? No grazie.
                            ->main

                    - kitchen_firstCharCookingTogetherInvite:
                        {charTag(ThirdCharacter, "bored")}:                     C'è {charNameOne} che ti sta aspettando. Spero tu sia pront{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}} per le sue pesate.
                            ->main

                    - kitchen_secondCharIsCooking:
                        {charTag(ThirdCharacter, "jester")}:                    Il piccoletto sta già cucinando qualcosa da solo, sai?
                            ->main

                    - kitchen_secondCharCookingTogetherInvite:
                        {charTag(ThirdCharacter, "jester")}:                    {charNameTwo} che ti sta aspettando. Sono curioso di vedere cosa combinerete assieme.
                            ->main        

                    - contentsKitchen has Franco:
                        {charTag(ThirdCharacter, "jester")}:                    Quella sagoma di Franco è lì che ti aspetta da un po' {player_name}!
                            ->main


                    - kitchen_kitchenOccupied == true:
                        {charTag(ThirdCharacter, "neutral")}:                   Dall'odore che si sente fino a qui secondo me c'è già qualcuno che sta cucinando.
                            ->main         

                    - kitchen_thirdCharCookingTogetherNumberInvite > 0:
                        {stopping:
                            - {charTag(ThirdCharacter, "bored")}:               Non farmi aspettare tanto quanto prima però.

                            - {charTag(ThirdCharacter, "bored")}:               Non so se c'ho voglia di aspettarti di nuovo sei ore. Comunque vado.

                            - {charTag(ThirdCharacter, "jester")}:              Mi sa che è uno scherzo che mi sta sfuggendo, visto che è quanto, quattro volte che mi ci spedisci? Non farla una quarta.

                            - {charTag(ThirdCharacter, "angry")}:               Ti odio. Ma vado.
                        }
                            ~ kitchen_thirdCharCookingTogetherInvite = true
                            ~ kitchen_thirdCharCookingTogetherNumberInvite ++
                            ~ move_entity(ThirdCharacter, Kitchen)
                            ~ kitchen_kitchenOccupied = true
                                ->main

                    - else:
                        {charTag(ThirdCharacter, "jester")}:                    {charNameThree} a rapporto, pronto a bruciare o avvelenare qualcosa o qualcuno!
                            ~ move_entity(ThirdCharacter, Kitchen)
                            ~ kitchen_thirdCharCookingTogetherInvite = true
                            ~ kitchen_thirdCharCookingTogetherNumberInvite ++
                            ~ kitchen_kitchenOccupied = true
                                ->main
                }

        //Uscita dalla conversazione
            + \ {charTag(PG, "neutral")}:                                       <i>Lascio il dialogo.
                -> main
            -
                -> talk_with_third_character




