=== debug_knot

@
+ [Sblocca luoghi e grimorio]
    ~ debug_places_open()
    ~ grimoire_isEnabled = true
    -> debug_knot

+ [Popola tutti gli elementi del grimorio]
    -> debug_richGrimoire ->
    -> debug_knot

+ [Imposta l3 prim3 3 PNG come pront3 per la riscrittura]
    ~ debugRewriting()
   -> debug_knot 
    
+ [Imposta come se fossimo a gioco completo]
    ~ debug_places_open()
    ~ grimoire_isEnabled = true
    ~ debug_allGraphicsElementsEndingMode()
    -> debug_richGrimoire ->
    -> debug_knot