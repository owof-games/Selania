=== bedroom ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}

{debug: <i>La lista degli oggetti nella stanza è: {contentsBedroom}.}

{
    - bedroom == 1:
        {charTag(TheWitch, witch_state())}:   <i>Un morbido letto è comparso, in attesa di membra stanche.</i>

}

{
    - frog_currentMission == missionNine:
        ~ frog_updatedMissions += missionNine

    - LIST_COUNT(story_endedStories) == 1  && frog_allMissionsCompleted hasnt missionNine:
        ~ frog_updatedMissions += missionNine
            -> notification_system ->
}

-> main

=== settings_management
//Gestione delle impostazioni, raggiungibile dal libro e dalla camera da letto
    + {are_two_entities_together(PG, Settings) && !debug_stochastic} [Settings]

        {charTag(TheWitch, witch_state())}:   <i>Qui in futuro si potranno modificare le impostazioni.</i>
            -> main




=== gm_rm_activation
{debug_dialogues:
    -> debug_dialogue_text
- else:
    -> settings_and_choices
}


= settings_and_choices
    //saltiamo direttamente al top3 durante il testing su unity
    -> top3

    {charTag(Carla, "bored")}:                                          Il testing è in ink?
            + {!debug_stochastic} \ {charTag(PG, "neutral")}:           <i>Sì.</i>
                -> top2
            + (not_ink) \ {charTag(PG, "neutral")}:                     <i>No.</i>
                -> top3

    - (top2)

        {charTag(Carla, "bored")}:                                      Cosa serve?
            

            * \ {charTag(PG, "neutral")}:                               <i>Sono qui per testare il Grimorio.</i>
                -> debug_richGrimoire ->
            {charTag(Carla, "neutral")}:                                Ho riempito il grimorio come se lei avesse finito la prima parte di gioco, ma senza lo sbrocco di Mentore.
                                                                        Le ho inoltre sbloccato tutti i sigilli e le piante.

            * (riscrittura) \ {charTag(PG, "neutral")}:                 <i>Impostami le prime 3 png come pronte per la riscrittura.
                ~ debugRewriting()
                                                    
            * \ {charTag(PG, "neutral")}:                               <i>Aprimi tutti i luoghi del gioco.
                ~ debug_places_open()

            * \ {charTag(PG, "neutral")}:                               <i>Attiva sin da subito Franco.
                ~ debug_Franco()

            + \ {charTag(PG, "neutral")}:                               <i>Non mi serve nulla.</i>  
                                   
            -

    {charTag(Carla, "bored")}:                                          Serve altro?
            + {!debug_stochastic}\ {charTag(PG, "neutral")}:            <i>Sì.
                -> top2
            + \ {charTag(PG, "neutral")}:                               <i>No.
    


    - (top3)
            // ~ debug_Franco()
    {charTag(Carla, "neutral")}:                                        Il viaggio sta per iniziare.
                                                                        Che modalità di gioco vuole attivare?
    {charTag(Carla, "happy")}:                                          La modalità <b>Reader Mode</b> è pensata per chi vuole immergersi nella storia. Ci sono meno indicatori, meno numeri in evidenza, meno achievements. L'esperienza è più complessa.
    {charTag(Carla, "bored")}:                                          La modalità <b>Gamer Mode</b> è pensata per chi preferisce un approccio più logico, e vuole un'esperienza più esplicita e controllabile. L'esperienza è più facile rispetto al Reader Mode.

        //Aggiungere spiegazione delle due modalità per il testing
            + \ {charTag(PG, "neutral")}:                               <i>Voglio la modalità Gamer Mode.</i>
                ~ gamerMode_activation ()
                // //Se non ho sbloccato la parte sotto, attivo anche Carla
                // ~ tutorial_CarlaTutorialActivation()
                
            + \ {charTag(PG, "neutral")}:                               <i>Voglio la modalità Reader Mode.</i>
    -
    {charTag(Carla, "neutral")}:                                        Può anche decidere che tipo di tutorial attivare.
                                                                        Può affidarsi a <b>Mentore</b>, che ha un approccio più narrativo e meno diretto. Il suo supporto è particolarmente adatto per una modalità di gioco esplorativa e meditativa, come quella del Reader Mode.</i>
    {charTag(Carla, "bored")}:                                          Oppure ci sono io: più diretta, le spiegherò tutto quello che deve fare con degli esempi che vengono dalla mia enorme conoscenza come Sacra Capra Burocratica.
                                                                        Il mio supporto è particolarmente adatto per una modalità di gioco più pratica, come il Gamer Mode.
                                                                        C'è anche la possibilità di chiedere l'aiuto di entrambe, o di andare senza guida.
    {charTag(Carla, "happy")}:                                          Così posso riposare.
    {charTag(Carla, "neutral")}:                                        Cosa sceglie?

            + \ {charTag(PG, "neutral")}:                               <i>Voglio l'aiuto di Mentore.</i>
                    ~ tutorial_MentorTutorial = true

            + \ {charTag(PG, "neutral")}:                               <i>Voglio l'aiuto di Carla.</i>
                    ~ tutorial_CarlaTutorialActivation()
    
            + \ {charTag(PG, "neutral")}:                               <i>Voglio l'aiuto di entrambe.</i>
                    ~ tutorial_CarlaTutorialActivation()
                    ~ tutorial_MentorTutorial = true
            
            + \ {charTag(PG, "neutral")}:                               <i>Non voglio nessun aiuto.</i>                                                            
            -
    {charTag(Carla, "neutral")}:                                        Infine: può ricevere delle notifiche quando alcune cose sono cambiate (es: ha completato un achievement).
                                                                        Vuole ricevere questi promemoria?

            + \ {charTag(PG, "neutral")}:                               <i>Sì.</i>
                ~ notification_gamerNotification = true  
            + \ {charTag(PG, "neutral")}:                               <i>No.</i>
            -                                                            


    {charTag(Carla, "sad")}:                                            Abbiamo finito.
    {charTag(Carla, "neutral")}:                                        Rispettando i protocolli del Ministero della Pubblica Umiliazione, le auguriamo un buon viaggio, e le ricordiamo che l'ufficio Lamentii e Lamentele è chiuso dal 1976.

-> main