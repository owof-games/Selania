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
    -> witch
}


= witch
    //saltiamo direttamente al top3 durante il testing su unity
    -> top3

    {charTag(TheWitch, witch_state())}:                                 <i>Il testing è in ink?
            + {!debug_stochastic} \ {charTag(PG, "neutral")}:           <i>Sì.</i>
                -> top2
            + (not_ink) \ {charTag(PG, "neutral")}:                     <i>No.</i>
                -> top3

    - (top2)

        {charTag(TheWitch, witch_state())}:                             <i>Cosa serve?</i>
            

            * \ {charTag(PG, "neutral")}:                               <i>Sono qui per testare il Grimorio.</i>
                -> debug_richGrimoire ->
            {charTag(TheWitch, witch_state())}:                         <i>Ho riempito il grimorio come se tu avessi finito la prima parte di gioco, ma senza lo sbrocco di Mentore.</i>
                                                                        <i>Ho inoltre sbloccato tutti i sigilli e le piante.</i>

            * (riscrittura) \ {charTag(PG, "neutral")}:                 <i>Impostami le prime 3 png come pronte per la riscrittura.
                ~ debugRewriting()
                                                    

            * \ {charTag(PG, "neutral")}:                               <i>Aprimi tutti i luoghi del gioco.
                ~ debug_places_open()

            * \ {charTag(PG, "neutral")}:                               <i>Attiva sin da subito Franco.
                ~ debug_Franco()

            + \ {charTag(PG, "neutral")}:                               <i>Non mi serve nulla.</i>  
                                   
            -

    {charTag(TheWitch, witch_state())}:                                 <i>Serve altro?
            + {!debug_stochastic}\ {charTag(PG, "neutral")}:            <i>Sì.
                -> top2
            + \ {charTag(PG, "neutral")}:                               <i>No.
    


    - (top3)
    {charTag(TheWitch, witch_state())}:                                 <i>Il viaggio sta per iniziare.
                                                                        <i>Che modalità di gioco vuoi attivare?
                                                                        <i>La modalità <i>Reader Mode</b> è pensata per chi vuole immergersi nella storia. Ci sono meno indicatori, meno numeri in evidenza, meno achievements. L'esperienza è più complessa.
                                                                        <i>La modalità <b>Gamer Mode</b> è pensata per chi preferisce un approccio più logico, e vuole un'esperienza più esplicita e controllabile. L'esperienza è più facile rispetto al Reader Mode.

        //Aggiungere spiegazione delle due modalità per il testing
            + \ {charTag(PG, "neutral")}:                               <i>Voglio la modalità Gamer Mode.</i>
                ~ gamerMode_activation ()
                // //Se non ho sbloccato la parte sotto, attivo anche Carla
                // ~ tutorial_CarlaTutorialActivation()
                
            + \ {charTag(PG, "neutral")}:                               <i>Voglio la modalità Reader Mode.</i>
    -
    {charTag(TheWitch, witch_state())}:                                 <i>Puoi anche decidere che tipo di tutorial attivare.</i>
                                                                        <i>Puoi affidarti a <b>Mentore</b>, che ha un approccio più narrativo e meno diretto. Il suo supporto è particolarmente adatto per una modalità di gioco esplorativa e meditativa, come quella del Reader Mode.</i>
                                                                        <i>Oppure c'è <b>Carla</b>: più diretta, ti spiegherà tutto quello che devi fare con degli esempi che vengono dalla sua enorme conoscenza come Sacra Capra Burocratica. Il suo supporto è particolarmente adatto per una modalità di gioco più pratica, come il Gamer Mode.</i>
                                                                        <i>C'è anche la possibilità di andare senza guida alcuna, o di chiedere l'aiuto di entrambe.</i>
                                                                        <i>Cosa sceglierai?</i>

            + \ {charTag(PG, "neutral")}:                               <i>Voglio l'aiuto di Mentore.</i>
                    ~ tutorial_MentorTutorial = true

            + \ {charTag(PG, "neutral")}:                               <i>Voglio l'aiuto di Carla.</i>
                    ~ tutorial_CarlaTutorialActivation()
    
            + \ {charTag(PG, "neutral")}:                               <i>Voglio l'aiuto di entrambe.</i>
                    ~ tutorial_CarlaTutorialActivation()
                    ~ tutorial_MentorTutorial = true
            
            + \ {charTag(PG, "neutral")}:                               <i>Non voglio nessun aiuto.</i>                                                            
            -
    {charTag(TheWitch, witch_state())}:                                 <i>Infine: possiamo notificarti quando alcune cose sono cambiate (es: una pianta è cresciuta, hai raggiunto gli obiettivi di Franco, hai completato un achievement).
                                                                        <i>Vuoi ricevere questi miei promemoria?

            + \ {charTag(PG, "neutral")}:                               <i>Sì.</i>
                ~ notification_gamerNotification = true  
            + \ {charTag(PG, "neutral")}:                               <i>No.</i>
            -                                                            


    {charTag(TheWitch, witch_state())}:                                 <i>Perfetto.
                                                                        <i>Ti auguriamo il migliore degli inizi per questo tuo viaggio.</i>

-> main