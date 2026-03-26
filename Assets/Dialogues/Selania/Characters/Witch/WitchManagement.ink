//Variabili per mettere in pausa la conversazione
    VAR witch_pauseTalking = 0
    VAR witch_pauseDuration = 1
    VAR witchChar_justTalked = false

//Variabili per la gestione del ritratto
    LIST witch_moonPhases = NewMoon, FirstQuarter, FullMoon, ThirdQuarter, RedMoon
    VAR witch_moonState = FirstQuarter
    VAR witch_moonTime = 0
    //l'idea è che ogni tre passaggi sia un giorno, e che cambi ogni sette giorni (siamo passate a sei giorni)
    VAR witch_timeForChangingMoonPhase = 13
    





    //Formula per la chiusura di uno storylet
=== witch_closing_storylet
        //Gestione crescita piante
        -> growing_check ->
        //Questo evita che venga proposto un altro storylet fino a quando la pausa non è finita
        ~ witch_pauseTalking = witch_pauseDuration
        //Questo è per la gestione delle domande
        ~ witchChar_justTalked = true
        //L'animazione per via dell'informazione nuova
        @animation:RewriterBook

->->