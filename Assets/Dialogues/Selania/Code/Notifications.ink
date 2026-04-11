//Variabili per le notifiche
VAR notification_greenhouseGrown = false
    //Per questa: true == posso riproporre la notifica, cosa che accade solo dopo che ho raccolto la pianta arrivata allo step tre
VAR notification_greenhouseGrownRepropose = true 
VAR notification_restingSession = false
VAR notification_francoQuests = false
VAR notification_achievement = false
VAR notification_achievementName = ""

//Check missioni franco notificato
VAR notification_francoUpdatedMissions = ()



=== notification_system ===
//Per ora la struttura è in ordine gerarchico di priorità, poi vediamo se ha senso. Per ora ho messo il tagging della strega, ma poi probabilmente metterò il simbolo più sensato.
{
    - nest_newSigilDiscovered != ():
        {charTag(TheWitch, "{witch_state()}")}:   {player_name} ha scoperto {sigils_translator(nest_newSigilDiscovered)}.
            ~ nest_newSigilDiscovered = ()
        -> nest_reactivateGliphs ->
        -> achievements_onGame_statusUpdate_GM ->
        -> main
}


{
    - notification_greenhouseGrown == true:
        {charTag(TheWitch, "{witch_state()}")}:   Qualcosa di nuovo è cresciuto in serra. 
            ~ notification_greenhouseGrown = false
            ~ notification_greenhouseGrownRepropose = false
}

{
    - player_lastRestingSession >= player_maxPlayingTime && player_restingSessionNotification == true:
        {charTag(TheWitch, "{witch_state()}")}:   {player_name} è qui da molto. Perché non si prende una pausa? 
            ~ notification_restingSession = false
            ~ player_lastRestingSession = player_notificationRestingReset
}

{
    - notification_achievement == true:
        {charTag(TheWitch, "{witch_state()}")}:   {player_name} ha completato l'achievement {notification_achievementName}.
            ~ notification_achievement = false
            ~ notification_achievement = ""
}

//Notifiche per le commissioni di Franco
{
    - notification_francoQuests == false:
        //Facciamo un update delle missioni
        ~ temp newMissionsCompleted = frog_updatedMissions
        ~ franco_missionsStateUpdater()

        {
            
            - notification_francoUpdatedMissions != newMissionsCompleted:
                {charTag(TheWitch, "{witch_state()}")}:     <i>{player_name} ha soddisfatto la richiesta fatta da Franco La Rana.</i>
                        ~ notification_francoQuests = true
                        ~ notification_francoUpdatedMissions = frog_updatedMissions
        
        }
}

->->