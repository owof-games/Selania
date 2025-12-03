=== cooking_alone ====

    Quindi {player_name}, sei {player_pronouns has him:pronto|{player_pronouns has her:pronta|prontə}} per questa piccola missione di cucina?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_kitchen
        
        + [Ci sto!]
            -> cooking_with_frog
    
        
        + [Ci penso un attimo.]
            -> main


-> cooking_animations_on ->
Qui cucini da sola su richiesta della rana. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}


=== cooking_with_frog




//Fine
        ~ move_entity(TheKitchenFrog, Safekeeping)
        ~ move_entity(TheFrog, Kitchen)

-> cooking_animations_off ->
-> main