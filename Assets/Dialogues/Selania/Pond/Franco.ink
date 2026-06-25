=== welcoming_frog
{debug_frog: passo da welcoming_frog.}
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    
    
+ {are_two_entities_together(Franco, PG) && entity_location(PG) == Pond} [Franco]
    
    //Aggiorniamo lo stato delle varie commissioni
        ~ franco_missionsStateUpdater()
    //E quello dei doni
        ~ franco_giftsStateUpdater()

        

    {//Discrepanza tra dono a Boccale e sua reazione
        
        - frog_third_char_gift == thirdChar_giftedObject && thirdChar_giftedObject != ():
            ~ thirdCharFailedIngredient = true

        - frog_third_char_ingredient == kitchen_thirdCharExtraIngredient && frog_third_char_ingredient != ():
            ~ thirdCharFailedIngredient = true    

        - frog_third_char_ingredient == universalIngredient:
            ~ thirdCharFailedIngredient = true    
        
    }

    //Facciamo passare dei commentini speciali
    {   //Prima presentazione
        - are_two_entities_together(PG, Franco) && grimoire_franco hasnt grimFrancoFirst:
            -> franco_intro

        - are_two_entities_together(PG, Franco) && thirdCharFailedIngredient == true && grimoire_franco hasnt grimFrancoThirdIngredientFailure:
            -> franco_third_ingredient_failure    

        - not franco_open_kitchen && entity_location(PG) == Pond && player_accessiblePlaces has Kitchen:
            -> franco_open_kitchen ->

        - not franco_open_nest && entity_location(PG) == Pond && player_accessiblePlaces has Nest:
            -> franco_open_nest ->

        - not franco_open_library && entity_location(PG) == Pond && player_accessiblePlaces has Library:
            -> franco_open_library ->   
    }


    //Vediamo poi se ci sono degli storylets speciali o dei commenti sulle commissioni in corso, concluse o meno che siano
        -> franco_storyletsManagement ->
    //Se supero anche questo nodo, significa che non ho commissioni in corso e non ne ho concluse, per cui arrivano i saluti generali e poi la proposta di una nuova commissione


- (top)
    {shuffle:
        - {charTag(Franco, "party")}:                   Ciao girino!

        - {charTag(Franco, "party")}:                   Ma guarda chi c'è!

        - {charTag(Franco, "neutral")}:                 Uh, zia Graaak non mi scrive da un bel po'!

        - {charTag(Franco, "neutral")}:                 Devo assolutamente ricordarmi il compleanno dei gemelli. E preparare tutti i pacchettini.

        - {charTag(Franco, "neutral")}:                 {player_name}: quando la carpa non c'è, le pulci d'acqua ballano. Anche se non sono molto brave.

        - {charTag(Franco, "neutral")}:                 Storicamente tutte le lettere sono approvate dalle rane, per questo c'è il Franco Bollo.

        - {charTag(Franco, "question")}:                Magari se trattengo il fiato a lungo posso volare.

        - {charTag(Franco, "party")}:                   Il mio nome completo è Franco Lelio Arpagone Romualdo Arcezio Nepomiceno Alcuino. Franco La Rana è più facile.

        - {charTag(Franco, "reading")}:	                "Gentile signor La Rana, le chiediamo di desistere dal chiederci altre cose assurde sulle lontre. Associazione Mondiale delle Dighe."
    }
    - (top2)
    
    +  \ {charTag(PG, "neutral")}:         Per ora me ne vado.
        -> main
        
    + {entity_location(PG) == Pond && frog_currentMission == ()} \ {charTag(PG, "neutral")}:         Franco, {dimmi cosa devo fare.|hai qualcosa da farmi fare?}

        //Prima di tutto: check stanchezza!
        -> tired_frog
        //Se passato, controllo la disponibilità dei regali.

        


        
        