//Variabili per mettere in pausa la conversazione
    VAR witch_pauseTalking = 0
    VAR witch_pauseDuration = 1
    VAR witchChar_justTalked = false

//Variabili per la gestione del debrief e degli storylets personali
    VAR witch_debriefPNG = ()
    VAR witch_mainStoryPNG = ()
    VAR witch_sigilsComment = ()

//Variabili per la gestione del ritratto
    LIST witch_moonPhases = NewMoon, FirstQuarter, FullMoon, ThirdQuarter, RedMoon
    VAR witch_moonState = FirstQuarter
    VAR witch_moonTime = 0
    //l'idea è che ogni tre passaggi sia un giorno, e che cambi ogni sette giorni (siamo passate a sei giorni)
    VAR witch_timeForChangingMoonPhase = 13
    
//E possibili nomi
    LIST witch_possibleNames = Luna, Strega, Radice, Fiamma, Parola
    VAR witch_actualName = ()




    //Formula per la chiusura di uno storylet
=== witch_closing_storylet
        //Questo evita che venga proposto un altro storylet fino a quando la pausa non è finita
        ~ witch_pauseTalking = witch_pauseDuration
        //Questo è per la gestione delle domande
        ~ witchChar_justTalked = true
        //Cooldown comune
        ~ png_commonPauseTalking = true
        //Svuotiamo la parte legata al commento sull'uso dei sigilli
        ~ witch_sigilsComment = () 
        //L'animazione per via dell'informazione nuova
        @animation:RewriterBook

        {
            //Tutorial e supporto
            - tutorial_witchRelationship && grimoire_appendices hasnt grimChoicesWitch:
                ~ grimoire_appendices += grimChoicesWitch
        }

        {
            - tutorial_witchSigils && grimoire_appendices hasnt grimSigilsWitch:
                ~ grimoire_appendices += grimSigilsWitch
        }

        {
            - witch_allSigils_opening && grimoire_appendices hasnt grimWitchAllSigilsOpened:
                ~ grimoire_appendices += grimWitchAllSigilsOpened  
        }

        {
        
            //Debrief
            - witch_first_debrief && grimoire_witch hasnt grimWitchFirstDebrief:
                ~ grimoire_witch += grimWitchFirstDebrief
        }

        {
            - witch_second_debrief && grimoire_witch hasnt grimWitchSecondDebrief:
                ~ grimoire_witch += grimWitchSecondDebrief
        }

        {
            - witch_third_debrief && grimoire_witch hasnt grimWitchThirdDebrief:
                ~ grimoire_witch += grimWitchThirdDebrief
        }

        {
            - witch_fourth_debrief && grimoire_witch hasnt grimWitchFourthDebrief:
                ~ grimoire_witch += grimWitchFourthDebrief  
        }

        {
            - witch_fifth_debrief && grimoire_witch hasnt grimWitchFifthDebrief:
                ~ grimoire_witch += grimWitchFifthDebrief                  
        }

        {
            //Main storylets
            - open_the_dump && grimoire_witch hasnt grimWitchOpenDump:
                ~ grimoire_witch += grimWitchOpenDump
                //Tutte le cose legate all'apertura del dump
                ~ move_entity(FromForestToDumpBlocked, Safekeeping)
                ~ move_entity(FromForestToDump, Forest)
                ~ move_entity(mapDump, TrainStop)
                ~ player_accessiblePlaces += Dump
        }

        {
            - witch_intro && grimoire_witch hasnt grimWitchIntro:
                ~ grimoire_witch += grimWitchIntro
        }

        {
            - the_witch_and_the_frog && grimoire_witch hasnt grimWitchFrog:
                ~ grimoire_witch += grimWitchFrog
        }

        {
            - about_the_book && grimoire_witch hasnt grimWitchBook:
                ~ grimoire_witch += grimWitchBook    
        }

        {            
            //Storia personale strega
            - witch_first_confession && grimoire_witch hasnt grimWitchMainOne:
                ~ grimoire_witch += grimWitchMainOne    
        }

        {
            - witch_second_confession && grimoire_witch hasnt grimWitchMainTwo:
                ~ grimoire_witch += grimWitchMainTwo  
        }

        {
            - witch_third_confession && grimoire_witch hasnt grimWitchMainThree:
                ~ grimoire_witch += grimWitchMainThree
        }

        {
            - witch_fourth_confession && grimoire_witch hasnt grimWitchMainFour:
                ~ grimoire_witch += grimWitchMainFour
        }

        {
            - witch_fifth_confession && grimoire_witch hasnt grimWitchMainFive:
                ~ grimoire_witch += grimWitchMainFive
        }
        //Aggiornamento lista di quelli comuni
        -> grimoire_common_storylets_updater ->
        //Gestione crescita piante
        -> growing_check ->
        //E la situazione delle task di Franco
        -> notification_system ->
        
        ->->