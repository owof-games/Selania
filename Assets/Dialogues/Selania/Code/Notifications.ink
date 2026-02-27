//Variabili per le notifiche

VAR notification_greenhouseGrown = false
VAR notification_restingSession = false



=== notification_system ===
//Per ora la struttura è in ordine gerarchico di priorità, poi vediamo se ha senso. Per ora ho messo il tagging della strega, ma poi probabilmente metterò il simbolo più sensato.
{
    - notification_greenhouseGrown == true:
        Qualcosa di nuovo è cresciuto in serra. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            ~ notification_greenhouseGrown = false
}

{
    - player_lastRestingSession >= player_maxPlayingTime && player_restingSessionNotification == true:
        {player_name} è qui da molto. Perché non si prende una pausa? #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            ~ notification_restingSession = false
            ~ player_lastRestingSession = player_notificationRestingReset
}



-> main