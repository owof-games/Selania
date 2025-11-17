//Variabili per mettere in pausa la conversazione
    VAR witch_pauseTalking = 0
    VAR witchCharPauseDuration = 6

//Variabili per la gestione del ritratto
    LIST moonPhases = NewMoon, FirstQuarter, FullMoon, ThirdQuarter, RedMoon
    VAR moonState = NewMoon
    VAR moonTime = 0
    //l'idea è che ogni tre passaggi sia un giorno, e che cambi ogni sette giorni.
    VAR changeMoonFase = 21
    