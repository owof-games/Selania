//Variabili per le notifiche
VAR notification_greenhouseGrown = false
    //Per questa: true == posso riproporre la notifica, cosa che accade solo dopo che ho raccolto la pianta arrivata allo step tre
VAR notification_greenhouseGrownRepropose = true 
VAR notification_restingSession = false
VAR notification_francoQuests = false
VAR notification_achievement = false
VAR notification_achievementName = ""



=== notification_system ===
//Per ora la struttura è in ordine gerarchico di priorità, poi vediamo se ha senso. Per ora ho messo il tagging della strega, ma poi probabilmente metterò il simbolo più sensato.
{
    - nest_newSigilDiscovered != ():
        {player_name} ha scoperto {sigils_translator(nest_newSigilDiscovered)}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            ~ nest_newSigilDiscovered = ()
        -> nest_reactivateGliphs ->
        -> achievements_onGame_statusUpdate_GM ->
        -> main
}


{
    - notification_greenhouseGrown == true:
        Qualcosa di nuovo è cresciuto in serra. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            ~ notification_greenhouseGrown = false
            ~ notification_greenhouseGrownRepropose = false
}

{
    - player_lastRestingSession >= player_maxPlayingTime && player_restingSessionNotification == true:
        {player_name} è qui da molto. Perché non si prende una pausa? #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            ~ notification_restingSession = false
            ~ player_lastRestingSession = player_notificationRestingReset
}

{
    - notification_achievement == true:
        {player_name} ha completato l'achievement {notification_achievementName}.
            ~ notification_achievement = false
            ~ notification_achievement = ""
}

//Notifiche per le missioni di Franco
{
    - notification_francoQuests == false:
        {
            - frog_currentMission has missionOne:
                {
                    - first_character_recap.check && second_character_recap.check && greenhouse_recap.check:
                        <i>{player_name} ha soddisfatto la richiesta fatta da Franco La Rana.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
                                ~ notification_francoQuests = true
                    - else:
                        ->->
                }
                
            - frog_currentMission has missionTwo:
                {
                    - LIST_COUNT(greenhouse_backupCultivable) < 11:
                        <i>{player_name} ha soddisfatto la richiesta fatta da Franco La Rana.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
                                ~ notification_francoQuests = true
                    - else:
                        ->->    
                }
                
            - frog_currentMission has missionThree && mindfulness:
                <i>{player_name} ha soddisfatto la richiesta fatta da Franco La Rana.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
                        ~ notification_francoQuests = true
                    
            - frog_currentMission has missionFour && little_storylets:
                <i>{player_name} ha soddisfatto la richiesta fatta da Franco La Rana.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
                        ~ notification_francoQuests = true 
    
            - frog_currentMission has missionFive && first_second_chit_chat:
                <i>{player_name} ha soddisfatto la richiesta fatta da Franco La Rana.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
                        ~ notification_francoQuests = true
            
            - frog_currentMission has missionSix && witch_intro:
                <i>{player_name} ha soddisfatto la richiesta fatta da Franco La Rana.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
                        ~ notification_francoQuests = true
        
            - frog_currentMission has missionSeven:
                {
                    - first_character_notes.check or second_character_notes.check:
                        <i>{player_name} ha soddisfatto la richiesta fatta da Franco La Rana.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
                                ~ notification_francoQuests = true
                                
                    - else:
                        ->->    
                }
            
            - frog_currentMission has missionEight && library_readStories != ():
                <i>{player_name} ha soddisfatto la richiesta fatta da Franco La Rana.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
                        ~ notification_francoQuests = true
                
        }
}

->->