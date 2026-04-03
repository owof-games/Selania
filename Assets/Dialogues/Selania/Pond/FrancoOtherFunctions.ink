=== tired_frog
{debug_frog: passo da tired_frog.}
    ~ temp dice = RANDOM(1,5)
{debug_frog: il valore di dice è {dice}.}
{debug_frog: il valore di frog_giftability è {frog_giftability}.}

{
    - frog_tiredValue > 0:
        -> top
        
    - dice == 5:
        ~ frog_tiredValue = frog_maxTiredValue
        -> top

    - else:
        {
            - frog_giftability == false && LIST_COUNT(frog_allAvailableMissions) > LIST_COUNT(frog_allMissionsCompleted):
                Girino!#inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Ho un po' di missioni a disposizione, ma non avrei niente con cui ringraziarti, almeno per ora.
                Torna più tardi.
                -> main

            - else:
                -> franco_missionsDispatcher
        }
}
    
- (top)

    Girino! #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Franco è stanchino ora.
    Torna più tardi e provo a darti una zampa.
    Basta che poi me la restituisci, sennò non so come grattare la schiena di zio Gracco.

-> main


=== function franco_pauseSpecialStorylets()
{debug_frog: passo franco_pauseSpecialStorylets().}
    ~ frog_pauseSpecialMission = frog_pauseSpecialMissionMax


=== closed_exchange
{debug_frog: passo closed_exchange.}

    Facciamo un bel duo, noi due.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Io il cervello, tu la mano.
    Quella è una mano, vero?
    A dopo girino!


    //Svuoto il destinatario della missione attuale per sicurezza
    @animation:RewriterBook
    ~ frog_aboutGiftRequest = ()
    ~ frog_allMissionsCompleted += frog_currentMission
    //Levo per sicurezza dalle missioni update
    ~ frog_updatedMissions -= frog_currentMission
    ~ frog_currentMission = ()
    ~ notification_francoQuests = false
    ~ frog_suspended_gift = false
    //E abbasso il valore delle missioni speciali
    ~ frog_pauseSpecialMission --
 
    
-> main