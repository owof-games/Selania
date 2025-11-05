//Missioni    
=== mission_one
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    {name}, ti invito a leggere il libro che ti è stato dato. #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Nel tuo lavoro, la conoscenza è potere.
        ~ activeMissions += missionOne
    
    -> main
    
    
    
    
=== mission_two
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    {name}, è importante prendersi cura della serra.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Non solo per avere dei doni per le persone che necessitano del tuo lavoro, ma anche per prenderti cura di te.
    La serra cresce grazie alle cose che puoi elaborare su di te.
    Per cui ti chiedo di tornare da me quando nella serra ci saranno almeno tre piante fiorite.
        ~ activeMissions += missionTwo

    -> main
    
    
    
    
    
=== mission_three
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    Sai {name}, Mentore sente spesso il bisogno di sentirsi utile.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Perché non provi a chiederle qualche consiglio su come star meglio?    
        ~ activeMissions += missionThree
    -> main





=== mission_four
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    Stavo pensando: ci sono un po' di cose che hai scoperto su questo luogo, ma che non hai condiviso con Mentore.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    E conoscendola, credo le farebbe piacere se le parlassi delle cose strane che hai trovato in questo luogo.  
        ~ activeMissions += missionFour
    -> main




=== mission_five
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    Questa è quasi un consiglio più che una missione, {name}.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Se delle persone hanno dei discorsi in sospeso, è facile che li tirino fuori appena saranno vicine.
    Per questo ti offro un suggerimento: prova a vedere cosa succede se {charNameOne} e {charNameTwo} sono assieme.
    E poi torna da me.
        ~ activeMissions += missionFive
    -> main

       



=== mission_six
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
     Sembra che qualcosa sia cambiato in quell'albero al centro della foresta.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
     Perché non provia a parlarci?
         ~ activeMissions += missionSix
         
    -> main


=== mission_seven
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    Qualcunx ti ha scritto, {name}.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Perché non vai a vedere cosa ha da condividere con te?
    Trovi le lettere attaccate alla bacheca vicino alla fermata del treno.
    E il loro contenuto si aggiorna man mano che la loro vita continua.
        ~ activeMissions += missionSeven
        
    -> main

=== mission_eight
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    La biblioteca è piena di racconti, {name}.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Perché non vai a prenderti un po' di tempo e leggerti qualcosa?
        ~ activeMissions += missionEight
        
    -> main


=== special_mission_one
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    Sembra che ci sia della tensione tra Riccio e Mentore.
    Perché non vedi cosa accade? #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        ~ activeMissions += specialMissionOne
        
    -> main
    
    
=== special_mission_two
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)

    Ti chiedo di cucinare da sola. #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        
        ~ activeMissions += specialMissionTwo
    -> main
    

    
=== special_mission_three
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    //* Missione tre: liberare uno slot parola
	//    * Porta questa cosa a qualcuné 


    missione speciale due: le special creano storylets ad hoc anche con le altre personagge, magari con un blocco di scelte#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        
        ~ activeMissions += specialMissionThree
    -> main    
 
=== special_mission_four
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    //* Missione quattro: informazioni preziose
	//* Dona un coltivabile a una delle persone non riscrivibili, e ti dirò qualcosa di importante su di lei.
    missione speciale due: le special creano storylets ad hoc anche con le altre personagge, magari con un blocco di scelte#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        
        ~ activeMissions += specialMissionFour
    -> main   
    

    