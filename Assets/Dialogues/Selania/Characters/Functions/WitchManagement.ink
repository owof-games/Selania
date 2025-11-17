//Variabili per mettere in pausa la conversazione
    VAR witch_pauseTalking = 0
    VAR witch_pauseDuration = 6

//Variabili per la gestione del ritratto
    LIST witch_moonPhases = NewMoon, FirstQuarter, FullMoon, ThirdQuarter, RedMoon
    VAR witch_moonState = NewMoon
    VAR witch_moonTime = 0
    //l'idea è che ogni tre passaggi sia un giorno, e che cambi ogni sette giorni.
    VAR witch_timeForChangingMoonPhase = 21
    