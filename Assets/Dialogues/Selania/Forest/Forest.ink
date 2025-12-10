=== forest ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
            
{debug: <i>La lista degli oggetti nella stanza è: {contentsForest}.}

{forest == 1:<i>La foresta è canto sospeso.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    -> witch_frog_mission_notifier ->
    -> talk_to_me ->

    ~ book_arrivingFromTracking = Forest

            -> main


=== bench
+ {are_two_entities_together(Bench, PG)} [Bench]
    <i>La panchina riposa in attesa di scoprire la sua vocazione.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        -> main

