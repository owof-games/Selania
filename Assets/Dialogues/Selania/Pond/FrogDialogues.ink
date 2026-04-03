=== welcoming_frog
{debug_frog: passo da welcoming_frog.}
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
+ {are_two_entities_together(Franco, PG) && entity_location(PG) == Pond} [Franco]
    
    //Aggiorniamo lo stato delle varie missioni
        ~ franco_missionsStateUpdater()
    //E quello dei doni
        ~ franco_giftsStateUpdater()    
    //Vediamo poi se ci sono degli storylets speciali o dei commenti sulle missioni in corso, concluse o meno che siano
        -> franco_storyletsManagement
    //Se supero anche questo nodo, significa che non ho missioni in corso e non ne ho concluse, per cui arrivano i saluti generali e poi la proposta di una nuova missione

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
    -
    
    + Per ora me ne vado.
        -> main
        
    + {entity_location(PG) == Pond}Franco, {dimmi cosa devo fare.|hai qualcosa da farmi fare?}
        {
            - frog_giftability == false && LIST_COUNT(frog_allAvailableMissions) > LIST_COUNT(frog_allMissionsCompleted):
                Girino!#inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Ho un po' di missioni a disposizione, ma non avrei niente con cui ringraziarti, almeno per ora.
                Torna più tardi.
                -> main

            - else:
                -> franco_missionsDispatcher

            
        }



        
        