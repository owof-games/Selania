=== debug_knot

@
+ [Sblocca luoghi e grimorio]
    ~ debug_places_open()
    ~ grimoire_isEnabled = true
    -> debug_knot

+ [Popola tutti gli elementi del grimorio]
    -> debug_richGrimoire ->
    -> debug_knot

+ [Imposta lə primə 3 PNG come prontə per la riscrittura]
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
    ~ tutorial_CarlaTutorial = true
    //Sposto Carla alla fermata del treno
    ~ move_entity(Carla, TrainStop)
    -> debug_knot

+ [Reader mode]
    //Attivo gli achievements ad hoc
    ~ settings_gamerMode = false
    //Attivo le notifiche da gamer
    ~ notification_gamerNotification = false
    //Attivo il tutorial
    ~ tutorial_CarlaTutorial = false
    //Sposto Carla alla fermata del treno
    ~ move_entity(Carla, Safekeeping)
    -> debug_knot

+ [Attiva e scopri un solo sigillo]
    ~ glyph_actualActiveSigil = (FireAetherAir)
    ~ glyph_actualSigilUses = 3
    ~ glyph_discoveredSigils = (FireAetherAir)
    -> debug_knot
