//Missioni    
=== mission_one
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    {player_name}, ti invito a leggere il libro che ti è stato dato. #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Nel tuo lavoro, la conoscenza è potere.
    Poi torna da me, e ti darò quello che ti serve.
        ~ frog_currentMission += missionOne
        ~ frog_availableCommonMissions -= missionOne
    @animation:RewriterBook
    -> main
    
    
    
    
=== mission_two
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    {player_name}, è importante prendersi cura della serra.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Non solo per avere dei doni per le persone che necessitano del tuo lavoro, ma anche per prenderti cura di te.
    La serra cresce grazie alle cose che puoi elaborare su di te.
    Per cui ti chiedo di tornare da me quando nella serra ci saranno almeno tre piante fiorite.
        ~ frog_currentMission += missionTwo
        frog_availableCommonMissions -= missionTwo
    @animation:RewriterBook
    -> main
    
    
    
    
    
=== mission_three
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    Sai {player_name}, Mentore sente spesso il bisogno di sentirsi utile.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Perché non provi a chiederle qualche consiglio su come star meglio?
    Poi torna da me, e ti darò quello che ti serve.
        ~ frog_currentMission += missionThree
        frog_availableCommonMissions -= missionThree
    @animation:RewriterBook    
    -> main





=== mission_four
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    Stavo pensando: ci sono un po' di cose che hai scoperto su questo luogo, ma che non hai condiviso con Mentore.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    E conoscendola, credo le farebbe piacere se le parlassi delle cose strane che hai trovato in questo luogo.
    Poi torna da me, e ti darò quello che ti serve.
        ~ frog_currentMission += missionFour
        frog_availableCommonMissions -= missionFour
    @animation:RewriterBook
    -> main




=== mission_five
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    Questa è quasi un consiglio più che una missione, {player_name}.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Se delle persone hanno dei discorsi in sospeso, è facile che li tirino fuori appena saranno vicine.
    Per questo ti offro un suggerimento: prova a vedere cosa succede se {charNameOne} e {charNameTwo} sono assieme.
    E poi torna da me.
        ~ frog_currentMission += missionFive
        frog_availableCommonMissions -= missionFive
    @animation:RewriterBook    
    -> main

       



=== mission_six
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
     Sembra che qualcosa sia cambiato in quell'albero al centro della foresta.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
     Perché non provia a parlarci?
     Poi torna da me, e ti darò quello che ti serve.
         ~ frog_currentMission += missionSix
         frog_availableCommonMissions -= missionSix
    @animation:RewriterBook     
    -> main


=== mission_seven
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    Qualcunx ti ha scritto, {player_name}.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Perché non vai a vedere cosa ha da condividere con te?
    Trovi le lettere attaccate alla bacheca vicino alla fermata del treno.
    E il loro contenuto si aggiorna man mano che la loro vita continua.
    Poi torna da me, e ti darò quello che ti serve.
        ~ frog_currentMission += missionSeven
        frog_availableCommonMissions -= missionSeven
    @animation:RewriterBook    
    -> main

=== mission_eight
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    La biblioteca è piena di racconti, {player_name}.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Perché non vai a prenderti un po' di tempo e leggerti qualcosa?
    Poi torna da me, e ti darò quello che ti serve.
        ~ frog_currentMission += missionEight
        frog_availableCommonMissions -= missionEight
    @animation:RewriterBook    
    -> main


    
=== special_mission_one
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    Sembra che ci sia della tensione tra Riccio e Mentore.
    Perché non vedi cosa accade? #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Poi torna da me, e ti darò quello che ti serve.
        ~ frog_currentMission += specialMissionOne
        ~ frog_availableSpecialMissions -= specialMissionOne
        ~ move_entity(SecondCharacter, Forest)
        ~ move_entity(Mentor, Forest)
        ~ movements_changeLocationTimer = 0
    @animation:RewriterBook    
    -> main
    
    
=== special_mission_two
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Vediamoci in cucina, ho una piccola missione speciale per te, {player_name}!
        ~ move_entity(TheFrog, Safekeeping)
        ~ move_entity(TheKitchenFrog, Kitchen)
        ~ frog_currentMission += specialMissionTwo
        ~ frog_availableSpecialMissions -= specialMissionTwo
    @animation:RewriterBook    
    -> main
    

    
=== special_mission_three
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    //* Missione tre: liberare uno slot parola
	//    * Porta questa cosa a qualcuné 


    missione speciale tre: le special creano storylets ad hoc anche con le altre personagge, magari con un blocco di scelte#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    @animation:RewriterBook    
        ~ frog_currentMission += specialMissionThree
        ~ frog_availableSpecialMissions -= specialMissionThree
    -> main    
 
=== special_mission_four
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    //* Missione quattro: informazioni preziose
	//* Dona un coltivabile a una delle persone non riscrivibili, e ti dirò qualcosa di importante su di lei.
    missione speciale quattro: le special creano storylets ad hoc anche con le altre personagge, magari con un blocco di scelte#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    @animation:RewriterBook    
        ~ frog_currentMission += specialMissionFour
        ~ frog_availableSpecialMissions -= specialMissionFour
    -> main   
    

    