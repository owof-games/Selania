//Abilitazione delle notifiche "da gamer". Vengono attivate in automatico col gamer mode
VAR notification_gamerNotification = false

//Variabili per le notifiche
VAR notification_greenhouseGrown = false
    //Per questa: true == posso riproporre la notifica, cosa che accade solo dopo che ho raccolto la pianta arrivata allo step tre
VAR notification_greenhouseGrownRepropose = true 
VAR notification_restingSession = false
VAR notification_achievement = false
VAR notification_achievementName = ""

//Check missioni franco notificato
VAR notification_francoUpdatedMissions = ()



=== notification_system ===
//Per ora la struttura è in ordine gerarchico di priorità, poi vediamo se ha senso. Per ora ho messo il tagging della strega, ma poi probabilmente metterò il simbolo più sensato.
{
    - nest_newSigilDiscovered != ():
        {charTag(TheWitch, witch_state())}:                                 <i>{player_name} ha scoperto <b>{sigils_translator(nest_newSigilDiscovered)}</b>.
            ~ nest_newSigilDiscovered = ()
        -> nest_reactivateGlyphs ->
        -> achievements_onGame_statusUpdate_GM ->
        -> main
}


// { -> COMMENTATO PERCHE' ORA LA CRESCITA E' SOLO CON L'ACCESSO IN SERRA
//     - notification_greenhouseGrown == true && notification_gamerNotification == true:
//         {charTag(TheWitch, witch_state())}:                                 <i>Qualcosa di nuovo è cresciuto in serra. 
//             ~ notification_greenhouseGrown = false
//             ~ notification_greenhouseGrownRepropose = false
// }

{
    - player_lastRestingSession >= player_maxPlayingTime && player_restingSessionNotification == true:
        {charTag(TheWitch, witch_state())}:                                 <i>{player_name} è qui da molto. Perché non si prende una pausa? 
            ~ notification_restingSession = false
            ~ player_lastRestingSession = player_notificationRestingReset
}

{
    - notification_achievement == true && notification_gamerNotification == true:
        {charTag(TheWitch, witch_state())}:                                 <i>{player_name} ha completato l'achievement {notification_achievementName}.
            ~ notification_achievement = false
            ~ notification_achievement = ""
}

//Notifiche per le commissioni di Franco, che vogliamo vengano notificate SOLO se la missione è stata offerta da Franco
    //Primo step: aggiorniamo lo stato delle missioni
    ~ franco_missionsStateUpdater()

    {
        //Se c'è una discrepanza tra le missioni ora completate e quelle che avevamo nello storico, aggiorniamo la lista e...
        - notification_francoUpdatedMissions != frog_updatedMissions:
                    ~ notification_francoUpdatedMissions = frog_updatedMissions
                    {
                        //Se tra le missioni aggiornate c'è quella offerta da Franco, mandiamo la notifica
                        - frog_updatedMissions has frog_currentMission && notification_gamerNotification == true:
                            {charTag(TheWitch, witch_state())}:             <i>{player_name} ha soddisfatto la richiesta fatta da Franco La Rana.</i>
                    }
    
    }


->->