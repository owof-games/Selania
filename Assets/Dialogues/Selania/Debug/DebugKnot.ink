=== debug_knot

@
+ [Sblocca luoghi e grimorio]
    ~ debug_places_open()
    ~ grimoire_isEnabled = true
    -> debug_knot

+ [Abilita sin da subito Franco]
    ~ debug_Franco()
    -> debug_knot

+ [Popola tutti gli elementi del grimorio]
    -> debug_richGrimoire ->
    -> debug_knot

+ [Imposta lə primə 3 PNG come prontə per la riscrittura]
    ~ debugRewriting()
   -> debug_knot 
    
// + [Imposta tutto come se fossimo a gioco completo]
//     ~ debug_places_open()
//     ~ grimoire_isEnabled = true
//     ~ debug_allGraphicsElementsEndingMode()
//     -> debug_richGrimoire ->
//     -> debug_knot

+ [Sblocca tutti i sigilli]
    -> glyph_open_all_sigils ->
    -> debug_knot

+ [Sblocca tutte le piante]
    ~ greenhouse_findedCultivables += greenhouse_backupCultivable
    ~ greenhouse_findedCultivables += universalIngredient
    ~ backpack_findedGifts += greenhouse_backupCultivable
    ~ backpack_findedGifts += universalIngredient
    ~ greenhouse_backupCultivable = ()
    -> debug_knot

+ [Gamer mode]
    //Attivo gli achievements ad hoc
    ~ settings_gamerMode = true
    //Attivo le notifiche
    ~ notification_activeNotifications = true
    //Sposto Carla alla fermata del treno
    ~ move_entity(Carla, TrainStop)
    -> debug_knot

+ [Reader mode]
    //Attivo gli achievements ad hoc
    ~ settings_gamerMode = false
    //Attivo le notifiche
    ~ notification_activeNotifications = false
    //Sposto Carla nel safekeeping
    ~ move_entity(Carla, Safekeeping)
    -> debug_knot

+ [Attiva e scopri un solo sigillo]
    ~ glyph_actualActiveSigil = (FireAetherAir)
    ~ glyph_actualSigilUses = 3
    ~ glyph_discoveredSigils = (FireAetherAir)
    -> debug_knot

+ [Seconda parte: Chitarra e Riccio riscritti3, Boccale allontanato]
   ~  debug_secondHalfGame()
            + + In modalità Gamer Mode
                ~ gamerMode_activation ()
                // //Se non ho sbloccato la parte sotto, attivo anche Carla
                // ~ tutorial_CarlaTutorialActivation()
                
            + + In modalità Reader Mode.</i>
            --
            + + Col tutorial di Mentore
                    ~ tutorial_MentorTutorial = true

            + + Col tutorial di Carla
                    ~ tutorial_CarlaTutorialActivation()     
    
            + + Con entrambi i tutorial
                    ~ tutorial_CarlaTutorialActivation()
                    ~ tutorial_MentorTutorial = true

            
            + + Senza tutorial
            --                                                            
   -> debug_knot