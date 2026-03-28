=== welcoming_frog
{debug_frog: passo da welcoming_frog.}
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
+ {are_two_entities_together(Franco, PG) && entity_location(PG) == Pond} [Franco]
    
    //Aggiorniamo il discorso missioni
    -> discovered_things_updater ->
    
- (top)   
    {
        - welcoming_frog.top == 1:
                ~ player_somethingStrange += strangeFrog
                ~ book_BGVariations ++
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
                {
                    - are_two_entities_together(FirstCharacter, PG):
                        Livello di confusione: sì.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                }

        //manca feedback dopo esperienza al nido
        - frog_availableSpecialMissions hasnt specialMissionOne && entity_location(PG) == Pond && not feedback_mission_one_closed:
            -> feedback_mission_one_closed ->


        - frog_suspended_gift == true:
            Ehi girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            {shuffle:
                - Hai ancora quel dono di prima da prendere!
                - Devo ancora darti quel dono!
                - Te lo ricordi che c'ho qui una cosa per te, vero?
                - Franco La Rana ha qui qualcosa che è tuo!
                - Ricordati che se ti serve c'ho qui il tuo dono!
            }
                -> frog_about_who_questions   
        

        
        - entity_location(PG) == Nest: 
        {shuffle stopping:
           - Girino, continua a divertirti con quei sassi!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
           - Che fastidio la pioggia sulla testa. #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
           - Son qui che aspetto.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        }

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
    

      + Per ora me ne vado.
            -> main
        
      + {entity_location(PG) == Pond}Franco, {dimmi cosa devo fare.|hai qualcosa da farmi fare?}
      {debug_frog: il valore di frog_availableSpecialMissions è {frog_availableSpecialMissions}.}
      {debug_frog: player_accessiblePlaces contiene {player_accessiblePlaces}.}


        -> closed_mission_verify
        