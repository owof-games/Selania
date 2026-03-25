=== talking_Carla ===
    + {are_two_entities_together(Carla, PG)} [Carla]
                -> questions_Carla


=== questions_Carla
        {~ ???|Che vuole ora?|Non vede che sto mangiando?|Sono in pausa.|Si rivolga all'ufficio accanto.|Manca la marca da bollo.|Serve una richiesta scritta.|Qui noi non possiamo fare niente.|Dipende dalla sede centrale.|Ci vogliono almeno tre settimane.|La pratica è in lavorazione.|Riceviamo solo su appuntamento.|Gli orari sono sul sito.|Non ci sono richieste a suo nome.|Doveva informarsi prima.|Serve l'autocertificazione.|La firma deve essere originale.|Si rivolga all'ufficio tecnico.|Oggi faccio solo accettazione.|Non mi fa andare avanti.|La connessione è caduta.|Non sono autorizzata.|Bisogna attendere i tecnici.|È cambiata la normativa.|Fino a ieri si faceva, ma ora no.|Si informi meglio.|Faccia come crede.|A volte ripeto ad alta voce le frasi da dire agli utenti, per non dimenticarmele.}#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored


        //Tutorial gameplay
        + {tutorial_choicesRelationshipStorylet} Mi rispiegheresti la faccenda delle scelte e delle relazioni?
                -> tutorial_choicesRelationshipStorylet -> questions_Carla

        + {tutorial_rereadingStorylet} Com'era quella cosa della riscrittura?
                -> tutorial_rereadingStorylet -> questions_Carla

        //Tutorial legati ai luoghi
        + {tutorial_greenhouseGiftsInkStorylet} Com'è che si collegavano piante, doni e inchiostro?
                -> tutorial_greenhouseGiftsInkStorylet -> questions_Carla

        + {tutorial_kitchenStorylet} Ho bisogno che mi rispieghi la faccenda della cucina.
                -> tutorial_kitchenStorylet -> questions_Carla

        + {tutorial_nestStorylet} Quindi, con quelle pietre sulla spiaggia che ci devo fare?
                -> tutorial_nestStorylet -> questions_Carla

        + {tutorial_SigilsActivationStorylet} Mi ridici come si utilizzano i sigilli?
                -> tutorial_SigilsActivationStorylet -> questions_Carla              

        //Tutorial UI
        + {tutorial_GrimoireStorylet} Un ripassino sulle funzioni del Grimorio?
                -> tutorial_GrimoireStorylet -> questions_Carla 

        + Come interagisco col mondo?
                -> tutorial_interfaceStorylets -> questions_Carla       

        //Scelte di testing
        + Qual è lo stato degli achievement? (domanda giusto ora che non c'è il grimorio)
                -> carla_achievements -> questions_Carla

        + Sbloccami tutti i sigilli.
                -> glyph_open_all_sigils ->
                Dopo l'operazione, glyph_discoveredSigils = {LIST_COUNT(glyph_discoveredSigils)}
                -> questions_Carla
                
        //Uscita
        + No, ho cambiato idea
                -> main
        -


-> main