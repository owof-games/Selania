=== talking_Carla ===
    + {are_two_entities_together(Carla, PG) && !debug_stochastic} [Carla]
                -> questions_Carla


=== questions_Carla
       {charTag(Carla, "bored")}:       {~ Che vuole ora?|Non vede che sto mangiando?|Sono in pausa.|Si rivolga all'ufficio accanto.|Manca la marca da bollo.|Serve una richiesta scritta.|Qui noi non possiamo fare niente.|Dipende dalla sede centrale.|Ci vogliono almeno tre settimane.|La pratica è in lavorazione.|Riceviamo solo su appuntamento.|Gli orari sono sul sito.|Non ci sono richieste a suo nome.|Doveva informarsi prima.|Serve l'autocertificazione.|La firma deve essere originale.|Si rivolga all'ufficio tecnico.|Oggi faccio solo accettazione.|Non mi fa andare avanti.|La connessione è caduta.|Non sono autorizzata.|Bisogna attendere i tecnici.|È cambiata la normativa.|Fino a ieri si faceva, ma ora no.|Si informi meglio.|Faccia come crede.|A volte ripeto ad alta voce le frasi da dire agli utenti, per non dimenticarmele.}

        - (top)

        //Tutorial gameplay
        + {tutorial_CarlaDiscoveredTutorials has tutorialChoicesRelationship} \ {charTag(PG, "neutral")}:               Mi rispiegherebbe la faccenda delle scelte e delle relazioni?
                -> tutorial_carlaChoicesRelationshipStorylet -> questions_Carla.top

        + {tutorial_CarlaDiscoveredTutorials has tutorialRereading} \ {charTag(PG, "neutral")}:                         Com'era quella cosa della riscrittura?
                -> tutorial_carlaRereadingStorylet -> questions_Carla.top

        //Tutorial legati ai luoghi
        + {tutorial_CarlaDiscoveredTutorials has tutorialGreenhouse} \ {charTag(PG, "neutral")}:                        Com'è che si collegavano piante, doni e inchiostro?
                -> tutorial_carlaGreenhouseGiftsInkStorylet -> questions_Carla.top

        + {tutorial_CarlaDiscoveredTutorials has tutorialKitchen} \ {charTag(PG, "neutral")}:                           Ho bisogno che mi rispieghi la faccenda della cucina.
                -> tutorial_carlaKitchenStorylet -> questions_Carla.top

        + {tutorial_CarlaDiscoveredTutorials has tutorialNest} \ {charTag(PG, "neutral")}:                              Quindi, con quelle pietre sulla spiaggia che ci devo fare?
                -> tutorial_carlaNestStorylet -> questions_Carla.top

        + {tutorial_CarlaDiscoveredTutorials has tutorialSigils} \ {charTag(PG, "neutral")}:                            Mi ridirebbe come si utilizzano i sigilli?
                -> tutorial_carlaSigilsActivationStorylet -> questions_Carla.top             

        //Tutorial UI
        + {tutorial_CarlaDiscoveredTutorials has tutorialGrimoire} \ {charTag(PG, "neutral")}:                          Un ripassino sulle funzioni del Grimorio?
                -> tutorial_carlaGrimoireStorylet -> questions_Carla.top

        + \ {charTag(PG, "neutral")}:                                                                                   Come dovrei interagire col mondo?
                -> tutorial_carlaInterfaceStorylets -> questions_Carla.top
        
        //Cose varie di testing 
        + {!debug_stochastic && !gm_rm_activation.witch.not_ink} \ {charTag(PG, "neutral")}:                           Grimorio (solo per test ink!)
                -> grimoire -> questions_Carla.top     

        + {!debug_stochastic && !gm_rm_activation.witch.not_ink} \ {charTag(PG, "neutral")}:                            Mi sbloccherebbe tutti i sigilli?
                -> glyph_open_all_sigils ->
                Fatto.
                -> questions_Carla.top
        
        + {!debug_stochastic && !gm_rm_activation.witch.not_ink}\ {charTag(PG, "neutral")}:                             Mi darebbe tutte le piante da coltivare e l'ingrediente universale?
                ~ greenhouse_findedCultivables += greenhouse_allCultivables
                ~ greenhouse_findedCultivables += universalIngredient
                ~ backpack_findedGifts += greenhouse_allCultivables
                ~ backpack_findedGifts += universalIngredient
                ~ greenhouse_backupCultivable = ()
                Fatto.
                -> questions_Carla.top

        //Uscita
        + \ {charTag(PG, "neutral")}:                                                                                   No, ho cambiato idea.
                {charTag(Carla, "bored")}:                                                                              {~ E doveva farmi perdere tempo così?|Non potevo fare la suora di clausura?|Già una più del solito, insomma.}
                -> main
        -


-> main


=== carla_closing_storylet 
        
        //Resetto, così se viene richiamato il tutorial relazioni, è a zero
        ~ tutorial_CarlaRelationshipIndicator = 0
        //Pausa per non far partire altri tutorial o cose simili
        ~ png_commonPauseTalking = true


        {
                - tutorial_carlaChoicesRelationshipStorylet && tutorial_CarlaDiscoveredTutorials hasnt tutorialChoicesRelationship:
                        ~ tutorial_CarlaDiscoveredTutorials += tutorialChoicesRelationship
                        ~ grimoire_appendices += tutorialChoicesRelationship

                - tutorial_carlaRereadingStorylet && tutorial_CarlaDiscoveredTutorials hasnt tutorialRereading:
                        ~ tutorial_CarlaDiscoveredTutorials += tutorialRereading
                        ~ grimoire_appendices += tutorialRereading

                - tutorial_carlaInterfaceStorylets && tutorial_CarlaDiscoveredTutorials hasnt tutorialInterface:
                        ~ tutorial_CarlaDiscoveredTutorials += tutorialInterface
                        ~ grimoire_appendices += tutorialInterface

                - tutorial_carlaGrimoireStorylet && tutorial_CarlaDiscoveredTutorials hasnt tutorialGrimoire:
                        ~ tutorial_CarlaDiscoveredTutorials += tutorialGrimoire
                        ~ grimoire_appendices += tutorialGrimoire

                - tutorial_carlaGreenhouseGiftsInkStorylet && tutorial_CarlaDiscoveredTutorials hasnt tutorialGreenhouse:
                        ~ tutorial_CarlaDiscoveredTutorials += tutorialGreenhouse
                        ~ grimoire_appendices += tutorialGreenhouse

                - tutorial_carlaKitchenStorylet && tutorial_CarlaDiscoveredTutorials hasnt tutorialKitchen:
                        ~ tutorial_CarlaDiscoveredTutorials += tutorialKitchen
                        ~ grimoire_appendices += tutorialKitchen

                - tutorial_carlaNestStorylet && tutorial_CarlaDiscoveredTutorials hasnt tutorialNest:
                        ~ tutorial_CarlaDiscoveredTutorials += tutorialNest
                        ~ grimoire_appendices += tutorialNest

                - tutorial_carlaSigilsActivationStorylet && tutorial_CarlaDiscoveredTutorials hasnt tutorialSigils:
                        ~ tutorial_CarlaDiscoveredTutorials += tutorialSigils
                        ~ grimoire_appendices += tutorialSigils                                           

        }



        {       
                - entity_location(Carla) == Greenhouse:
                        ~ move_entity(Carla, Forest)
                        // tolto il divert perché noi entriamo qua come tunnel e così finiamo di fare il resto del lavoro
                        // se non funziona, cercare di capire come mai invece di mettere il divert
                        // -> greenhouse_entry_check
                        ->->

                - entity_location(Carla) == Bedroom:
                        ~ move_entity(Carla, Safekeeping)

                - entity_location(Carla) != Forest:
                        ~ move_entity(Carla, Forest)
                        // tolto il divert perché noi entriamo qua come tunnel e così finiamo di fare il resto del lavoro
                        // se non funziona, cercare di capire come mai invece di mettere il divert
                        // -> main
                        ->->
                
                - else:
                        ->->
        }


->->