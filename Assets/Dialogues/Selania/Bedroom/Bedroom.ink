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
//Tutto questo primo bloccone me lo tengo se serve testare di nuovo il nuovo sistema di scelte
// - (top)
// ~ move_entity(FirstCharacter, Bedroom)
// Chitarra ci dice qualcosa.

// + Risposta fuoco.
// -> glyph_modifier_variation_management2(false, fireC) ->          

// + Risposta aria.
// -> glyph_modifier_variation_management2(false, airC) ->          

// + Risposta terra.
// -> glyph_modifier_variation_management2(false, earthC) ->          

// + Risposta acqua.
// -> glyph_modifier_variation_management2(false, waterC) ->          

// + Risposta spirito.
// -> glyph_modifier_variation_management2(false, aetherC) ->          
// - (top2)
// METTO IN EVIDENZA
// Dopo la scelta:
//         firstChar_last_aether è {firstChar_last_aether}
//         firstChar_last_earth è {firstChar_last_earth}
//         firstChar_last_air è {firstChar_last_air}
//         firstChar_last_water è {firstChar_last_water}
//         firstChar_last_fire è {firstChar_last_fire}

//         firstChar_aether è {firstChar_aether}
//         firstChar_earth è {firstChar_earth}
//         firstChar_air è {firstChar_air}
//         firstChar_water è {firstChar_water}
//         firstChar_fire è {firstChar_fire}

//         player_fire_first_char è {player_fire_first_char}
//         player_earth_first_char è {player_earth_first_char}
//         player_air_first_char è {player_air_first_char}
//         player_water_first_char è {player_water_first_char}
//         player_aether_first_char è {player_aether_first_char}

//         firstChar_usedSigil è {firstChar_usedSigil}
//         firstChar_totalChoices è {firstChar_totalChoices}

//         firstChar_lastRelationshipIndicator è {firstChar_lastRelationshipIndicator}
//         firstChar_relationshipIndicator è {firstChar_relationshipIndicator}

//         // player_fire è {player_fire}
//         // player_earth è {player_earth}
//         // player_air è {player_air}
//         // player_water è {player_water}  
//         // player_aether è {player_aether}
// IL SIGILLO ATTUALE è {glyph_actualActiveSigil}
// UTILIZZI RIMASTI = {glyph_actualSigilUses}

// + Rifaccio una domanda a Chitarra.
// + Attivo un sigillo random
//     -> glyph_open_all_sigils ->
//     ~ glyph_actualActiveSigil = AirFireWater
//     ~ glyph_actualSigilUses = glyph_maxSigilUses
// + Scelta PG fire
//     -> glyph_modifier_variation_management2(true, fireC) -> top2 
// + Scelta PG air
//     -> glyph_modifier_variation_management2(true, airC) ->  top2 
// + Scelta PG water
//     -> glyph_modifier_variation_management2(true, waterC) -> top2 
// + Scelta PG earth
//     -> glyph_modifier_variation_management2(true, earthC) ->  top2
// + Scelta PG aether
//     -> glyph_modifier_variation_management2(true, aetherC) ->  top2
// -
// -> top





        {charTag(TheWitch, witch_state())}:         <i>(testo temporaneo per il testing interno) Prima di iniziare, ci chiediamo in che modalità giocare.</i>
                                                    <i>La modalità Reader Mode è come il gioco è stato pensato: <i>ogni scelta si deve appoggiare al tuo intuito, alla comprensione delle persone con cui interagisci.
                                                    <i>La modalità Gamer Mode ti offre maggiore supporto con indicatori di diverso tipo, oltre a un tutorial extra ad hoc.</i>

            + \ {charTag(PG, "neutral")}:           <i>Voglio la modalità Gamer Mode.</i>
                -> gamerMode_activation ->

            + \ {charTag(PG, "neutral")}:           <i>Voglio la modalità Reader Mode.</i>

            + \ {charTag(PG, "neutral")}:           <i>Sono qui per testare il Grimorio.</i>
                -> debug_richGrimoire ->
            {charTag(TheWitch, witch_state())}:     <i>Ho riempito il grimorio come se tu avessi finito la prima parte di gioco, ma senza lo sbrocco di Mentore.</i>
                                                    <i>Hai inoltre sbloccato tutti i sigilli e le piante.</i>
                                                 
            -

        {charTag(TheWitch, witch_state())}:     <i>Perfetto.
                                                    <i>Buon inizio di questo tuo viaggio.</i>

-> main            