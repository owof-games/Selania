=== welcoming_frog
{debug_frog: passo da welcoming_frog.}
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
+ {are_two_entities_together(TheFrog, PG) or (debug_testFrog == true)} [TheFrog]
    
    //Aggiorniamo il discorso missioni
    -> discovered_things_updater ->
    
- (top)   
    {
        - welcoming_frog.top == 1:
                ~ player_somethingStrange ++
                ~ saturationVar ++
                ~ book_BGVariations ++
                ~ move_entity(bowl, Bedroom)
                ~ move_entity(waterLily, Bedroom)
                ~ move_entity(FrogRecap, BookPlace)

            Ma dove avevo messo quel.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            Eccola cra!
            No.
            No no no questo è disgustoso.
            Eppure.
            Ehi!
            Tu devi essere {player_name}!
            Io sono Franco La Rana!
                ~ frog_nameDiscovered = true
            {charNameTwo} mi ha parlato di te.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            Ha una bella testolina quel girino!
                {
                    - are_two_entities_together(SecondCharacter, PG):
                        Anche la tua mi piace, Franco!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                }
            E tu sei sicuramente qui per il dono.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            Come si dice: chi dorme non piglia lombrichi.
            Dovrei averlo qui.
            No.
            Dove l'ho messo?
            L'avranno preso i gemelli?
            Facciamo così: mentre lo cerco ti do qualcosa da fare.
            Ma non una cosa da fare qualsiasi.
            Qualcosa di utile per chi vive questo posto.
            Come dice zia Graaak: una zampa vale l'altra.
            Non che zia Graaak sia particolarmente brava negli affari.
            Ma sempre meglio di mio cugino Braaak, che ha venduto una foglia di loto intera per una biscia.
            Al funerale erano tutti molto molto imbarazzati.
            Tranne la biscia: quella aveva ancora fame.
            Insomma: tu aiuti me, e io aiuto te.

        - frog_suspended_gift == true:
            Ehi girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            Hai ancora quel dono di prima da prendere!
                -> frog_about_who_questions   
        
        //Condizione in cui possiamo attivare la missione speciale.
            
        - frog_pauseSpecialMission < 1 && (frog_availableSpecialMissions has specialMissionTwo) && (player_accessiblePlaces ? Kitchen) && frog_currentMission == ():
                    {debug_frog: condizioni rispettate per poter offrire la seconda missione speciale.}
                        -> special_mission_two 
        
        - else:
            {shuffle:
                - Ciao girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        
                - Ma guarda chi c'è!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        
                - Uh, zia Graaak non mi scrive da un bel po'!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        
                - Devo assolutamente ricordarmi il compleanno dei gemelli. E preparare tutti i pacchettini.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        
                - {player_name}: quando la carpa non c'è, le pulci d'acqua ballano. Anche se non sono molto brave.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        
                - Magari se trattengo il fiato a lungo posso volare.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        
                - Il mio nome completo è Franco Lelio Arpagone Romualdo Arcezio Nepomiceno Alcuino. Franco La Rana è più facile.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        
                - "Gentile signor La Rana, le chiediamo di desistere dal chiederci altre cose assurde sulle lontre. Associazione Mondiale delle Dighe." #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            }
    }
    

      + [Per ora me ne vado.]
            -> main
        
      + [{Dimmi cosa devo fare.|Hai qualcosa da farmi fare?}]
      {debug_frog: il valore di frog_availableSpecialMissions è {frog_availableSpecialMissions}.}
      {debug_frog: player_accessiblePlaces contiene {player_accessiblePlaces}.}


        -> closed_mission_verify

        //{
            //Provo a mettere le missioni speciali come prioritarie
                //Special mission one offre la nota
                // - frog_pauseSpecialMission < 1 && (frog_availableSpecialMissions has specialMissionOne) && (player_accessiblePlaces ? Nest) && second_char_main_storylets.four:
                //     {debug_frog: condizioni rispettate per poter offrire la prima missione speciale.}
                //         -> special_mission_one
                    
                //Special mission two offre l'ingrediente universale
                
        //}
        {    

            - firstChar_storyStatus == story_storyStarted && firstChar_giftedObject == () && frog_firstCharObtainedGifts hasnt charOneCultivable:
                {debug_frog: condizioni rispettate per poter offrire info sul dono per Chitarra.}
                    -> autonomy_mission_verify
            
            - firstChar_storyStatus == story_storyStarted && !ending_cooking_with_first_char && frog_firstCharObtainedGifts hasnt charOneCooking && player_accessiblePlaces has Kitchen:
                {debug_frog: condizioni rispettate per poter offrire info sull'ingrediente per Chitarra.}
                    -> autonomy_mission_verify
                    
            // - firstChar_storyStatus == story_storyStarted && player_accessiblePlaces has Nest && frog_firstCharObtainedGifts hasnt charOneEmotionalWord:
            //     {debug_frog: condizioni rispettate per poter offrire info su parola per Chitarra.}
            //         -> autonomy_mission_verify
                    
            - firstChar_storyStatus == story_storyStarted && player_accessiblePlaces has Library && frog_firstCharObtainedGifts hasnt charOneLibrary:
                {debug_frog: condizioni rispettate per poter offrire info su racconto per Chitarra.}
                    -> autonomy_mission_verify
                    
            - secondChar_storyStatus == story_storyStarted && secondChar_giftedObject == () && frog_secondCharObtainedGifts hasnt charTwoCultivable:
                {debug_frog: condizioni rispettate per poter offrire info sul dono per Riccio.}
                    -> autonomy_mission_verify
                    
            - secondChar_storyStatus == story_storyStarted && !ending_cooking_with_second_char && frog_secondCharObtainedGifts hasnt charTwoCooking && player_accessiblePlaces has Kitchen:
                {debug_frog: condizioni rispettate per poter offrire info su ingrediente per Chitarra.}
                    -> autonomy_mission_verify
                    
            // - secondChar_storyStatus == story_storyStarted && player_accessiblePlaces has Nest && frog_secondCharObtainedGifts hasnt charTwoEmotionalWord:
            //     {debug_frog: condizioni rispettate per poter offrire info sul dono per Chitarra.}
            //         -> autonomy_mission_verify
                    
            - secondChar_storyStatus == story_storyStarted && player_accessiblePlaces has Library && frog_secondCharObtainedGifts hasnt charTwoLibrary:
                {debug_frog: condizioni rispettate per poter offrire info su parola per Chitarra.}
                    -> autonomy_mission_verify
                    
            - (frog_recoverableCultivables!= ()):
                {debug_frog: condizioni rispettate per poter offrire info su racconto per Chitarra.}
                    -> autonomy_mission_verify
                    
            //Condizioni in cui la rana non offre nulla:

            - LIST_COUNT(frog_firstCharObtainedGifts) >= 3 && LIST_COUNT(frog_secondCharObtainedGifts) >= 3 && frog_availableSpecialMissions == ():
                Non ho più niente da offrirti {player_name}. Ora è tutto nelle tue mani#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    -> main
            
            - else:
            {
                - frog_availableCommonMissions != () && frog_availableSpecialMissions != ():
                    Naa {player_name}, per ora sono qui con le zampe in zampa.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Ma torna più tardi e mi invento qualcosa da farti fare!
                        -> main
                
                - else:
                    Ehi {player_name}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Hai fatto un lavoro così buono ma così buono, che non ho niente da farti fare.
                    Complimenti girino.
                    Ora non ti resta che riposare!
                        -> main
            }
               
        }

