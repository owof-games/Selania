//Chiamate da dispatcher automatico
=== special_mission_one_closed
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    

        //Associo ~ glyph_actualActiveSigil al sigillo di Franco
        ~ glyph_actualActiveSigil = nest_francoChosenSigil
        //@animation:RewriterBook

        {charTag(Franco, "party")}:                 Girino, ma che carino questo sigillo!
        {charTag(TheWitch, witch_state())}:         {player_name} ha trovato {sigils_translator(nest_francoChosenSigil)}.
        {charTag(Franco, "party")}:                 {sigils_translator(nest_francoChosenSigil)}, suona bene.
        {charTag(Franco, "question")}:              Spero che la nostra amica comune ti dia anche le informazioni utili per capire come funzioni.
        {charTag(TheWitch, witch_state())}:         {player_name} troverà le informazioni su {sigils_translator(nest_francoChosenSigil)} direttamente nel Grimorio.

            //Aggiorno i testi
            ~ glyph_grimoireTripleSigilsUpdater()
            ~ glyph_grimoireTripleSigilsUpdater()
            ~ glyph_grimoireTripleSigilsUpdater()
            //Poi aggiorno il sigillo principale
            ~ glyph_grimoireMainSigilsUpdater()
            //E svuoto glyph_actualActiveSigil
            ~ glyph_actualActiveSigil = ()
            
        {charTag(Franco, "party")}:                 Ora vado da Euforbo e glielo dono subito.
        {charTag(Franco, "question")}:	            Chissà se lo deve mangiare?
                                                    O metterlo in testa?
                                                    Magari ci si fa un cappellino?
        {charTag(Franco, "neutral")}:               Uh, tieniti pure la pietra, così puoi scoprire altri sigilli.
        {charTag(Franco, "party")}:                 Magari ti aiutano a dire le tue emozioni.

        ~ move_entity(Franco, Pond)
        ~ frog_allMissionsCompleted += frog_currentMission
        ~ frog_currentMission = ()
        //Metto in pausa le commissioni speciali
        ~ franco_pauseSpecialStorylets()
        ~ nest_francoUsedEarth = false
        //Riattivo poi i tasti se posseduti
        -> nest_reactivateGlyphs ->
        
        -> main