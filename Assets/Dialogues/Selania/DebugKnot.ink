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

+ [Gamer mode]
    //Attivo gli achievements ad hoc
    ~ settings_gamerMode = true
    //Attivo le notifiche da gamer
    ~ notification_gamerNotification = true
    //Attivo il tutorial
    ~ tutorial_ActivateTutorial = true
    //Sposto Carla alla fermata del treno
    ~ move_entity(Carla, TrainStop)
    -> debug_knot

+ [Reader mode]
    //Attivo gli achievements ad hoc
    ~ settings_gamerMode = false
    //Attivo le notifiche da gamer
    ~ notification_gamerNotification = false
    //Attivo il tutorial
    ~ tutorial_ActivateTutorial = false
    //Sposto Carla alla fermata del treno
    ~ move_entity(Carla, Safekeeping)
    -> debug_knot

+ [Attiva e scopri un solo sigillo]
    ~ glyph_actualActiveSigil = (FireAetherAir)
    ~ glyph_actualSigilUses = 3
    ~ glyph_discoveredSigils = (FireAetherAir)
    -> debug_knot
