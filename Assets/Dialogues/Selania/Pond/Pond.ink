=== pond ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
           
{debug: La lista degli oggetti nella stanza è: {pondContents}.}

{pond  == 1:Lo stagno è caldo, il cammino ricco dell'odore dei funghi.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
        -> witch_frog_mission_notifier ->
        -> talk_to_me ->
    
~ book_arrivingFromTracking = Pond

// {pond  == 1: Spazi aperti, insetti, e ninfee galleggianti|{~Il cammino è ricco dell'odore dei funghi|Il cammino è luce|Lontana, la serra si rinfresca all'ombra dei monti|Lo stagno brulica di vita}}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}

    -> main





        

   
   