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
    -> dialogue
- else:
    -> witch
}

= dialogue
// Tutto questo primo blocco me lo tengo se serve testare di nuovo il nuovo sistema di scelte
- (top)
~ move_entity(FirstCharacter, Bedroom)
Chitarra ci dice qualcosa.

    + Risposta fuoco.
    -> glyph_choice_manager(false, fireC) ->

    + Risposta aria.
    -> glyph_choice_manager(false, airC) ->

    + Risposta terra.
    -> glyph_choice_manager(false, earthC) ->

    + Risposta acqua.
    -> glyph_choice_manager(false, waterC) ->

    + Risposta spirito.
    -> glyph_choice_manager(false, aetherC) ->

    + Voglio andare avanti
    -> witch
- (top2)
METTO IN EVIDENZA
Dopo la scelta:
        firstChar_last_aether è {firstChar_last_aether}
        firstChar_last_earth è {firstChar_last_earth}
        firstChar_last_air è {firstChar_last_air}
        firstChar_last_water è {firstChar_last_water}
        firstChar_last_fire è {firstChar_last_fire}

        firstChar_aether è {firstChar_aether}
        firstChar_earth è {firstChar_earth}
        firstChar_air è {firstChar_air}
        firstChar_water è {firstChar_water}
        firstChar_fire è {firstChar_fire}

        player_fire_first_char è {player_fire_first_char}
        player_earth_first_char è {player_earth_first_char}
        player_air_first_char è {player_air_first_char}
        player_water_first_char è {player_water_first_char}
        player_aether_first_char è {player_aether_first_char}

        firstChar_usedSigil è {firstChar_usedSigil}
        firstChar_totalChoices è {firstChar_totalChoices}

        firstChar_lastRelationshipIndicator è {firstChar_lastRelationshipIndicator}
        firstChar_relationshipIndicator è {firstChar_relationshipIndicator}

        player_fire è {player_fire}
        player_earth è {player_earth}
        player_air è {player_air}
        player_water è {player_water}
        player_aether è {player_aether}
IL SIGILLO ATTUALE è {glyph_actualActiveSigil}
UTILIZZI RIMASTI = {glyph_actualSigilUses}

+ Rifaccio una domanda a Chitarra.
+ Attivo un sigillo di prova
    ~ glyph_actualActiveSigil = AirFireWater
    ~ glyph_actualSigilUses = glyph_maxSigilUses

+ Scelte PG testing
    + + Scelta PG fire
        -> glyph_choice_manager(true, fireC) -> top2
    + + Scelta PG air
        -> glyph_choice_manager(true, airC) ->  top2
    + + Scelta PG water
        -> glyph_choice_manager(true, waterC) -> top2
    + + Scelta PG earth
        -> glyph_choice_manager(true, earthC) ->  top2
    + + Scelta PG aether
        -> glyph_choice_manager(true, aetherC) ->  top2

+ Voglio andare avanti
    -> witch
-
-> top



= witch
    {charTag(TheWitch, witch_state())}:                                 <i>Il testing è in ink?
            + {!debug_stochastic} \ {charTag(PG, "neutral")}:           <i>Sì.</i>
                -> top2
            + (not_ink) \ {charTag(PG, "neutral")}:                     <i>No.</i>
                -> top3

    - (top2)

        {charTag(TheWitch, witch_state())}:                             <i>Cosa serve?</i>
            

            + \ {charTag(PG, "neutral")}:                               <i>Sono qui per testare il Grimorio.</i>
                -> debug_richGrimoire ->
            {charTag(TheWitch, witch_state())}:                         <i>Ho riempito il grimorio come se tu avessi finito la prima parte di gioco, ma senza lo sbrocco di Mentore.</i>
                                                                        <i>Ho inoltre sbloccato tutti i sigilli e le piante.</i>

            + (riscrittura) \ {charTag(PG, "neutral")}:                 <i>Impostami le prime 3 png come pronte per la riscrittura.
                ~ debugRewriting()
                                                    

            + \ {charTag(PG, "neutral")}:                               <i>Aprimi tutti i luoghi del gioco.
                ~ debug_places_open()

            + \ {charTag(PG, "neutral")}:                               <i>Non mi serve nulla.</i>  
                                   
            -

    {charTag(TheWitch, witch_state())}:                                 <i>Serve altro?
            + {!debug_stochastic}\ {charTag(PG, "neutral")}:            <i>Sì.
                -> top2
            + \ {charTag(PG, "neutral")}:                               <i>No.
    


    - (top3)
    {charTag(TheWitch, witch_state())}:                                 <i>Che modalità di gioco vuoi attivare?
        //Aggiungere spiegazione delle due modalità per il testing
            + \ {charTag(PG, "neutral")}:                               <i>Voglio la modalità Gamer Mode.</i>
                ~ gamerMode_activation ()
                //Fino a quando non ho sbloccato la parte sotto, attivo anche Carla
                ~ tutorial_CarlaTutorialActivation()
                
            + \ {charTag(PG, "neutral")}:                               <i>Voglio la modalità Reader Mode.</i>
    -
    // {charTag(TheWitch, witch_state())}:                                 <i>Infine, puoi decidere che tipo di tutorial attivare.</i>.
    //                                                                     <i>Puoi affidarti a <b>Mentore</b>, che ha un approccio più narrativo, non sempre diretto, e per questo ti permette di esplorare questo mondo con i tuoi tempi. Il suo supporto è particolarmente adatto al Reader Mode.</i>
    //                                                                     <i>Oppure c'è <b>Carla</b>: più diretta, ti spiegherà tutto quello che devi fare con degli esempi che vengono dalla sua enorme conoscenza come Sacra Capra Burocratica. Il suo supporto è particolarmente adatto per il Gamer Mode.</i>
    //                                                                     <i>C'è anche la possibilità di andare senza guida alcuna, o di chiedere l'aiuto di entrambe.</i>
    //                                                                     <i>Cosa sceglierai?</i>

    //         + \ {charTag(PG, "neutral")}:                               <i>Voglio l'aiuto di Mentore.</i>
    //                 ~ tutorial_MentorTutorial = true

    //         + \ {charTag(PG, "neutral")}:                               <i>Voglio l'aiuto di Carla.</i>
    //                 ~ tutorial_CarlaTutorialActivation()
    
    //         + \ {charTag(PG, "neutral")}:                               <i>Voglio l'aiuto di entrambe.</i>
    //                 ~ tutorial_CarlaTutorialActivation()
    //                 ~ tutorial_MentorTutorial = true
    //         
    //          + \ {charTag(PG, "neutral")}:                               <i>Non voglio nessun aiuto.</i>                                                            
    //         -

    {charTag(TheWitch, witch_state())}:                                 <i>Perfetto.
                                                                        <i>Ti auguriamo inizio di questo tuo viaggio.</i>

-> main