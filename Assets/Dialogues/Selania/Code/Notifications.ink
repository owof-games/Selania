//Abilitazione delle notifiche
VAR notification_activeNotifications = true

//Variabili per le notifiche
VAR notification_greenhouseGrown = false
    //Per questa: true == posso riproporre la notifica, cosa che accade solo dopo che ho raccolto la pianta arrivata allo step tre
VAR notification_greenhouseGrownRepropose = true 
VAR notification_restingSession = false
VAR notification_achievement = false
VAR notification_achievementName = ""

//Check missioni franco notificato
VAR notification_francoUpdatedMissions = ()

//Check per proporre attivazione/disattivazione notifiche
VAR notification_notificationCounter = 0
VAR notification_notificationCounterChoiceProposal = 3
VAR notification_notificationCounter_Achievements = false
VAR notification_notificationCounter_Franco = false
VAR notification_notificationCounter_Sigils = false


=== notification_system ===
//Per ora la struttura è in ordine gerarchico di priorità, poi vediamo se ha senso. Per ora ho messo il tagging della strega, ma poi probabilmente metterò il simbolo più sensato.

    //SCOPERTA DEI SIGILLI
    {
        - nest_newSigilDiscovered != ():
            {charTag(TheWitch, witch_state())}:                                     <i>{player_name} ha scoperto <b>{sigils_translator(nest_newSigilDiscovered)}</b>.
                ~ nest_newSigilDiscovered = ()
                ~ notification_notificationCounter ++
                ~ notification_notificationCounter_Sigils = true
            -> nest_reactivateGlyphs ->
            -> achievements_onGame_statusUpdate_GM ->
            -> main
    }

    //CRESCITA DELLE PIANTE  -> COMMENTATO PERCHE' ORA LA CRESCITA E' SOLO CON L'ACCESSO IN SERRA
    // {
    //     - notification_greenhouseGrown == true && notification_activeNotifications == true:
    //         {charTag(TheWitch, witch_state())}:                                 <i>Qualcosa di nuovo è cresciuto in serra. 
    //             ~ notification_greenhouseGrown = false
    //             ~ notification_greenhouseGrownRepropose = false
    // }

    //INVITO AL RIPOSO
    TODO: commentato perché è da vedere se funziona o meno visto che ora si può uscire senza passare dalla camera.
    // {
    //     - player_lastRestingSession >= player_maxPlayingTime && player_restingSessionNotification == true:
    //         {charTag(TheWitch, witch_state())}:                                 <i>{player_name} è qui da molto. Perché non si prende una pausa? 
    //             ~ notification_restingSession = false
    //             ~ player_lastRestingSession = player_notificationRestingReset
    // }

    //NOTIFICHE DEGLI ACHIEVEMENTS di GAMER e READER MODE
        {
            - notification_achievement == true && notification_activeNotifications == true:
                {charTag(TheWitch, witch_state())}:                                 <i>{player_name} ha completato l'achievement {notification_achievementName}.
                    ~ notification_achievement = false
                    ~ notification_achievement = ""
                    ~ notification_notificationCounter ++
                    ~ notification_notificationCounter_Achievements = true
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
                    - frog_updatedMissions has frog_currentMission && notification_activeNotifications == true:
                        {charTag(TheWitch, witch_state())}:             <i>{player_name} ha soddisfatto la richiesta fatta da Franco La Rana.</i>
                }
                ~ notification_notificationCounter ++
                ~ notification_notificationCounter_Franco = true
    
    }


->->