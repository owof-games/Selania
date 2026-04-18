// variabile letta/scritta da Unity che traccia se ci troviamo in gamer mode o meno
VAR settings_gamerMode = false



=== gamerMode_activation
    //Attivo gli achievements ad hoc
    ~ settings_gamerMode = true
    //Attivo le notifiche da gamer
    ~ notification_gamerNotification = true
    //Sposto Carla alla fermata del treno
    ~ move_entity(Carla, TrainStop)
    
->->