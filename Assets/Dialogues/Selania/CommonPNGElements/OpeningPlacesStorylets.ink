=== opening_places_storylets ===
    {   
        //Prima faccio un check lato pausa dialogo, perché se c'è la pausa, non c'è nessuno storylet
        - png_commonPauseTalking == true:
            ->->
    }

    
/*******************************************

            APERTURE LUOGHI

*******************************************/
{
    //Apertura della discarica
        //Pausa dettata sia da openingPlacesPause, perché è un nuovo luogo, che da png_commonPauseTalking, perché è un dialogo.
        - grimoire_thirdChar has grimThirdCharOne && (entity_location(FromForestToDump) == Safekeeping) && (entity_location(PG) != Forest) && grimoire_witch hasnt grimWitchOpenDump && openingPlacesPause <= 0 && png_commonPauseTalking == false:
            -> open_the_dump

    //Boccale dalla strega
        //Pausa dettata da png_commonPauseTalking, perché è un dialogo.
        - grimoire_thirdChar hasnt grimWitchThirdChar && ((grimoire_thirdChar has grimThirdCharMentor) or (grimoire_thirdChar has grimFirstThirdChar) or (thirdChar_firstCharRage == true)) && witch_thirdCharSummoned == false && png_commonPauseTalking == false:
        //Step uno: sposto Boccale al dump e tutti gli altri altrove
                    ~ move_entity(ThirdCharacter, Dump)
            {
                - entity_location(FifthCharacter) == Dump:
                    ~ move_entity(FifthCharacter, Pond)
            }
            {
                - entity_location(Mentor) == Dump:
                    ~ move_entity(Mentor, Pond)
            }
            {
                - entity_location(FirstCharacter) == Dump:
                    ~ move_entity(FirstCharacter, Pond)
            }
            {
                - entity_location(SecondCharacter) == Dump:
                    ~ move_entity(SecondCharacter, Pond)
            }
        //Step due: la strega ci invita a raggiungerla.
        {charTag(TheWitch, "{witch_state()}")}:                 <i>Chiediamo a {player_name} di raggiungerci al pozzo, abbiamo bisogno della sua intermediazione.

        //Step tre: attivo il blocco per evitare che Boccale venga randomizzato fino a quando non gli abbiamo parlato, e che la frase sopra venga ripetuta di nuovo.
            ~ witch_thirdCharSummoned = true

    //Pausa: per questi storylets per ora è dettata solo da openingPlacesPause e non da png_commonPauseTalking sia perché ci sta che, essendo una sola frase, venga detta anche dopo un altro dialogo, sia perché ho paura si allarghino troppo i tempi di apertura dei luoghi
    //Invito allo stagno per aprire la cucina
    - are_two_entities_together(FirstCharacter, PG) && ((LIST_COUNT(grimoire_firstChar) + LIST_COUNT(grimoire_secondChar) + LIST_COUNT(grimoire_thirdChar)) > openingKitchen_delay) && entity_location(PG) != Pond && player_accessiblePlaces hasnt Kitchen && openingPlacesPause <= 0:

            {stopping:
                - {charTag(FirstCharacter, "curious")}:             Ehi {player_name}! Vediamoci allo stagno. Ho una cosa da mostrarti!
                - {charTag(FirstCharacter, "curious")}:             Scusa, prima c'erano cose più importanti da fare, ma ritroviamoci allo stagno, è importante!
                - {charTag(FirstCharacter, "curious")}:             La terza sarà la volta buona, spero. Ti aspetto allo stagno, preparati perché è una cosa fighissima!
                - {charTag(FirstCharacter, "curious")}:             Bene, vediamo se è l'ultima volta. Vediamoci allo stagno {player_name}, così ti mostro quello che ho combinato!
            }
                ~ move_entity(FirstCharacter, Pond)
                ~ firstChar_PondInvite = true
                ~ firstChar_PondWaiting = chars_MaxOpenPlacesWaiting
                    ->->   
            
    //Apertura cucina
    - are_two_entities_together(FirstCharacter, PG) && ((LIST_COUNT(grimoire_firstChar) + LIST_COUNT(grimoire_secondChar) + LIST_COUNT(grimoire_thirdChar)) > openingKitchen_delay) && entity_location(PG) == Pond && player_accessiblePlaces hasnt Kitchen && openingPlacesPause <= 0:
        -> open_the_kitchen

    //Invito alla foresta per aprire la biblioteca
    - are_two_entities_together(SecondCharacter, PG) && grimoire_secondChar has grimSecondCharTwo && entity_location(PG) != Forest && entity_location(PG) != Kitchen && player_accessiblePlaces hasnt Library && openingPlacesPause <= 0:
        
            {stopping:
                - {charTag(SecondCharacter, "energy")}:             Ehi {player_name}! Troviamoci alla foresta. Ho una cosa che devi vedere!
                - {charTag(SecondCharacter, "energy")}:             Uffa, prima c'era una cosa più importante ma ora dobbiamo assolutamente parlare alla foresta, vieni!
                - {charTag(SecondCharacter, "neutral")}:            Vieni alla foresta, che ti dico quella cosa importante, che non c'è mica una quarta volta vero?
                - {charTag(SecondCharacter, "neutral")}:            Mi arrendo. Vediamoci alla foresta, ho una cosa da farti vedere.
            }
                ~ move_entity(SecondCharacter, Forest)
                ~ secondChar_ForestInvite = true
                ~ secondChar_ForestWaiting = chars_MaxOpenPlacesWaiting
                ->->   

    //Apertura biblioteca    
        - are_two_entities_together(SecondCharacter, PG) && grimoire_secondChar has grimSecondCharOne && entity_location(PG) == Forest && player_accessiblePlaces hasnt Library && openingPlacesPause <= 0:
            -> open_the_library

    //Invito in biblioteca per aprire il nido
        - are_two_entities_together(ThirdCharacter, PG) && grimoire_thirdChar has grimThirdCharTwo && entity_location(PG) != Library && entity_location(PG) != Kitchen && player_accessiblePlaces hasnt Nest && player_accessiblePlaces has Library && openingPlacesPause <= 0:
            
                {stopping:
                - {charTag(ThirdCharacter, "neutral")}:             Ehi {player_name}! Troviamoci alla biblioteca, ti ho preparato una sorpresina da dieci!
                - {charTag(ThirdCharacter, "neutral")}:             Merda, prima mi sono distratto e non ti ho fatto vedere quella roba in biblioteca, raggiungimi!
                - {charTag(ThirdCharacter, "neutral")}:             Bah, vediamo se ce la facciamo: vieni in biblioteca {thirdChar_recordedPlayerPronoun has him:vecio|{thirdChar_recordedPlayerPronoun has her:zia|bomber}} e ti mostro una sorpresa.
                - {charTag(ThirdCharacter, "neutral")}:             Mi arrendo. Vediamoci alla biblioteca.
            }
                    ~ move_entity(ThirdCharacter, Library)
                    ~ thirdChar_LibraryInvite = true
                    ~ thirdChar_LibraryWaiting = chars_MaxOpenPlacesWaiting
                    ->->   

    //Apertura nest
        //Preparazione
        - are_two_entities_together(ThirdCharacter, PG) && LIST_COUNT(grimoire_thirdChar) >= 2 && entity_location(PG) == Library && player_accessiblePlaces hasnt Nest && openingPlacesPause <= 0 && grimoire_thirdChar hasnt grimThirdPreOpenNest:
            -> pre_open_the_nest

        //Apertura effettiva    
        - are_two_entities_together(ThirdCharacter, PG) && entity_location(PG) == Nest && grimoire_thirdChar hasnt grimThirdOpenNest:
            -> open_the_nest

}


->->