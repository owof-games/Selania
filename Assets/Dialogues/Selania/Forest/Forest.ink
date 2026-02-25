=== forest ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
            
{debug: <i>La lista degli oggetti nella stanza è: {contentsForest}.}

{forest == 1:<i>La foresta è canto sospeso.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    -> witch_frog_mission_notifier ->
    -> talk_to_me ->

    ~ book_arrivingFromTracking = Forest

            -> main




=== temp_grimoire
    + {are_two_entities_together(temporaryGrimoire, PG)} [temporaryGrimoire]
        <i>Un libro abbandonato sulla panchina.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        <i>Sulla copertina il nome di {player_name}.
            + + Lo raccolgo.
                ~ move_entity(RewriterBook, Forest)
                ~ move_entity(temporaryGrimoire, Safekeeping)
                ~ move_entity(MiniGrimoire, Bedroom)
                ~ player_somethingStrange ++
            -
        -> main


// === bench
// + {are_two_entities_together(Bench, PG)} [Bench]
//     <i>La panchina riposa in attesa di scoprire la sua vocazione.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
//         -> main

