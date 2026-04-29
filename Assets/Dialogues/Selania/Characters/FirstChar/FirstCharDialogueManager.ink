=== first_character ===
    //SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
            //Chiacchiera normale
            + {are_two_entities_together(FirstCharacter, PG) && firstChar_storyStatus == story_storyStarted && entity_location(PG) != Kitchen} [FirstCharacter]
                -> talk_with_first_character

            //Chiacchierata in cucina
            + {are_two_entities_together(FirstCharacter, PG) && firstChar_storyStatus == story_storyStarted && entity_location(PG)  == Kitchen} [FirstCharacter]
                -> kitchen_storylets_dispatcher


            // //Chiacchiera a fine storia
            // + {are_two_entities_together(FirstCharacter, PG) && firstChar_storyStatus == story_storyEnded} [FirstCharacter]
            //     -> first_char_story_ended
            // + ->
            //     -> DONE




=== talk_with_first_character
    ~ temp charNameOne = translator(firstChar_ActualName)
        {

            - firstChar_pauseTalking == 0:
                -> knowing_first_character
            
            - else:
                -> options_first_character
        }

                    
=== options_first_character
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    {   
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylets, ma non ho fatto il tutorial su come funziona
        - grimoire_firstChar has firstChar_minStoryletsForRewriting && not rewriting_proposal_first_character && not tutorial_mentorInkAndRewriting:
                -> ask
        
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylets, e ho fatto il tutorial su come funziona                    
        - grimoire_firstChar has firstChar_minStoryletsForRewriting && grimoire_firstChar hasnt grimFirstCharProposal && tutorial_mentorInkAndRewriting:
                -> ask
        
        //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo         
        - grimoire_firstChar has grimFirstCharProposal:
                -> ask
        
        //Vogliamo offrire un dono            
        - firstChar_giftedObject == () && backpack_findedGifts != ():
                -> ask
        
        //Vogliamo cucinare assieme          
        - player_accessiblePlaces has Kitchen && grimoire_firstChar hasnt grimFirstCharKitchenEnded && kitchen_firstCharIsCooking==false:
                -> ask
        
        -else:
            {
            //Stiamo parlando con la PNG, ma non dopo uno storylet, per cui mettiamo del testo
            - firstChar_justTalked == false:   
                {shuffle:
                    - {charTag(FirstCharacter, "curious")}: {horizontalS_discoveredDocs != ():Non capisco perché qualcuno debba lasciare in giro quei bigliettini, invece di darteli direttamente.|Mi piacerebbe una volta leggere quei documenti che trovi in giro.Le farfalle qui giocano per ore!}

                    - {charTag(FirstCharacter, "curious")}: {grimoire_witch has grimWitchIntro:Quindi parli con una tizia nella tua testa. Che sta alla discarica. Utile.|No dai, ma hai visto quanto sono carini gli scoiattoli?}

                    - {charTag(FirstCharacter, "curious")}: {grimoire_witch has grimWitchIntro:Quella tipa con cui parli, boh, non so perché ma mi dà fiducia. Credo di sentirla a volte. Forse anche io sono una riscrittora? Poveri noi.|Con il rumore dell'acqua dello stagno ci posso fare una base niente male.}

                    - {charTag(FirstCharacter, "curious")}: Il Conservatorio è un posto terrificante, {player_name}, ipercompetitivo. Ho ancora gli incubi a volte. 

                    - {charTag(FirstCharacter, "curious")}: Quando avrò un gatto lo chiamerò Bach, e poi metterò su IG le foto del su Bach-ano. Ok, è terribile, ed è di mio padre. 

                    - {charTag(FirstCharacter, "curious")}: Forse è la fame, ma prima ho sentito odore di lasagna, giuro! 

                    - {charTag(FirstCharacter, "curious")}: Ho voglia di leggere qualcosa. Sono secoli che non leggo per mezz'ora di fila in santa pace. 

                    - {charTag(FirstCharacter, "curious")}: Non so perché ma ti ci vedo a suonare la viola. Hai una faccia da viola. 

                    - {charTag(FirstCharacter, "curious")}: Se questa cosa mi fosse successa alle elementari, sarei già stata avvelenata dai funghi dello stagno. 

                    - {charTag(FirstCharacter, "curious")}: Prima ho provato a capire come raggiungere la montagna dietro alla stazione ma zero, non c'è un sentiero che uno. 

                    - {charTag(FirstCharacter, "curious")}: Chissà cosa starà facendo Ennio in questo momento. 

                    - {charTag(FirstCharacter, "curious")}: Valeria avrà dato da mangiare al gatto dei vicini? Ce lo hanno affidato durante le vacanze. 

                    - {charTag(FirstCharacter, "curious")}: Forse avrei dovuto rispondere alla cartolina di Talco. Non pensavo avrei avuto paura di una cartolina. 

                    - {charTag(FirstCharacter, "curious")}: Prima nello stagno non ho visto il mio riflesso ma quello di una Chitarra e non.voglio.farmi.domande! Né avere risposte.

                    - {charTag(FirstCharacter, "curious")}: Lavorare è sopravvalutato. 
                    
                    - {charTag(FirstCharacter, "curious")}: Quando esco da qui dovrei dire a Thomas che non lo odio. Spero che non pensi che lo odio, cazzo.

                    - {charTag(FirstCharacter, "sad")}: Ti dicono che se sei la migliore il mondo ti si aprirà davanti, ma poi puoi laurearti in modo grandioso, e finire comunque a fare la cameriera.

                    - {charTag(FirstCharacter, "curious")}: Eppure più ci penso più sono sicura che {charNameFive} sia arrivata qui con me.
                        {
                            - are_two_entities_together(Mentor, PG):
                                {charTag(FifthCharacter, "bored")}:             Impossibile, è una vita che sto qui.
                                {charTag(FirstCharacter, "annoyed")}:   Sicuramente mi confondo.
                        }
                }
                    -> main
            //Stiamo parlando con la PNG ma dopo uno storylet, per cui non mettiamo del testo        
            - else:
                ~ firstChar_justTalked = false
                    -> main
            }
    }
    
    = ask
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    
    //Se arrivo a options da un dialogo, non mostro commenti da parte della PNG, altrimenti sì.
        {
            - grimoire_firstChar has grimFirstCharOne:
                {charTag(FirstCharacter, "curious")}: C'è qualcosa che vuoi chiedermi ama? 

            - else:
                {charTag(FirstCharacter, "annoyed")}:   Serve qualcosa?    


        }

        ~ firstChar_justTalked = false
        

    //Azioni legate alla riscrittura
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, ma non ho fatto il tutorial su come funziona
            + {grimoire_firstChar has firstChar_minStoryletsForRewriting && not rewriting_proposal_first_character && not tutorial_mentorInkAndRewriting} \ {charTag(PG, "neutral")}:         Vorrei aiutarti a leggere la tua storia diversamente.
                
                {charTag(FirstCharacter, "annoyed")}:   Ama, mi sa che conviene che tu parli con la nostra fiorellona qui in giro, così ti dice giusto due cose due importanti.
                Tanto non scappo.
                        -> main
        
        //Se voglio avviare la riscrittura, ho ascoltato il minimo previsto di storylet, e ho fatto il tutorial su come funziona                    
            + {grimoire_firstChar has firstChar_minStoryletsForRewriting && grimoire_firstChar hasnt grimFirstCharProposal && tutorial_mentorInkAndRewriting} \ {charTag(PG, "neutral")}:         Ti va di riscrivere la tua storia con me?
                
                //Incremento le variazioni del libro della Riscrittora           
                    -> rewriting_proposal_first_character
    
        //Abbiamo proposto di fare la riscrittura, ma poi ci siamo prese del tempo          
            + {grimoire_firstChar has grimFirstCharProposal} \ {charTag(PG, "neutral")}:         Iniziamo la riscrittura?
                    -> rewriting_proposal_first_character
            
        
    //Azioni legate alla costruzione della relazione
    
        //Offrire un dono
            + {firstChar_giftedObject == () && backpack_findedGifts != ()} \ {charTag(PG, "neutral")}:         Ti vorrei dare questa cosa.

                //Prima accedo al grimorio
                -> grimoire_greenhouse_gifts_and_ingredient ->

                //Dopo di che associo la scelta fatta alla PNG
                ~ firstChar_giftedObject = grimoire_chosenPlant
                //E svuoto la variabile del grimorio
                ~ grimoire_chosenPlant = ()

                //Check effetto del dono, se è stata compiuta una scelta
                {
                    - firstChar_giftedObject != ():

                        ~ object_value_for_PNG(firstChar_giftedObject, Backpack, FirstCharacter)

                            {    
                        
                                - firstChar_favouritesGifts has firstChar_giftedObject:
                                    {charTag(FirstCharacter, "affectionate")}:          Quello che mi hai dato è qualcosa di più di un regalo: è un gesto di affinità.
                                                                                        Mi piace stare con te, {player_name}.

                                - firstChar_goodGifts has firstChar_giftedObject:
                                    {charTag(FirstCharacter, "neutral")}:               I regali mi mettono sempre in imbarazzo, sai?
                                    {charTag(FirstCharacter, "affectionate")}:          Ma il tuo dono mi ha fatto sentire ascoltata.
                                    
                                - else:
                                    {charTag(FirstCharacter, "neutral")}:               Non mi aspettavo un regalo.
                                    {charTag(FirstCharacter, "annoyed")}:               Per cui non dovrei nemmeno esserne delusa, giusto?
                            }

                        //Commento    
                        {charTag(TheWitch, witch_state())}:   <i>Dopo il dono di {player_name} {inkTranslator(FirstCharacter)}.</i>
                        -> achievements_onGame_statusUpdate_GM ->    
                        -> main    

                }
                
            
            
        
        //Cucinare assieme    
            + {player_accessiblePlaces has Kitchen && grimoire_firstChar hasnt grimFirstCharKitchenEnded && kitchen_firstCharIsCooking==false}\ {charTag(PG, "neutral")}:         Ti va di cucinare qualcosa assieme?
            
                {
                
                    - kitchen_secondCharIsCooking:
                        {charTag(FirstCharacter, "annoyed")}:           Uh, mi sa che la cucina è occupata da {charNameTwo}, sta cucinando qualcosa di strano.
                            ->main

                    - kitchen_thirdCharIsCooking:
                        {charTag(FirstCharacter, "annoyed")}:           Mi farebbe piacere ama, ma c'è {charNameThree} a fare non so cosa.
                            ->main        

                    - contentsKitchen has Franco:
                        {charTag(FirstCharacter, "curious")}:           C'è già una certa ranocchia che sta aspettando di cucinare con te.  
                            ->main
                            
                    - kitchen_secondCharCookingTogetherInvite:
                        {charTag(FirstCharacter, "affectionate")}:       Credo che {charNameTwo} ti stia già aspettando, sai?
                            ->main

                    - kitchen_thirdCharCookingTogetherInvite:
                        {charTag(FirstCharacter, "affectionate")}:          Credo che {charNameThree} ti stia già aspettando, sai?
                            ->main

                    - kitchen_kitchenOccupied == true:
                        {charTag(FirstCharacter, "curious")}:               Accetterei volentieri, ma credo che ora sia occupata, {player_name}.
                            ->main            

                    - kitchen_firstCharCookingTogetherNumberInvite > 0 :
                        {stopping:
                            - {charTag(FirstCharacter, "annoyed")}:   Ma non farmi aspettare ore come prima, ama.

                            - {charTag(FirstCharacter, "annoyed")}:   Siamo a due volte che me lo chiedi e non ti presenti, sai?

                            - {charTag(FirstCharacter, "annoyed")}:   E mi darai buca una terza volta? Vabbè, ci vediamo lì.

                            - {charTag(FirstCharacter, "annoyed")}:   Oook, riproviamoci di nuovo. Mi diverto così tanto ad aspettarti in cucina!
                        } 
                            ~ kitchen_firstCharCookingTogetherInvite = true
                            ~ kitchen_firstCharCookingTogetherNumberInvite ++
                            ~ move_entity(FirstCharacter, Kitchen)
                            ~ kitchen_kitchenOccupied = true
                                ->main
                        
                    - else:
                        {charTag(FirstCharacter, "affectionate")}:      Volentieri! Ci vediamo in cucina!
                            ~ kitchen_firstCharCookingTogetherInvite = true
                            ~ kitchen_firstCharCookingTogetherNumberInvite ++
                            ~ move_entity(FirstCharacter, Kitchen)
                            ~ kitchen_kitchenOccupied = true
                                ->main
                
                }
    
    //Uscita dalla conversazione
        + \ {charTag(PG, "neutral")}:         <i>Lascio il dialogo.</i>
                -> main
        -
            -> talk_with_first_character




    

