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
        //Cooldown comune
        ~ png_commonPauseTalking = true
        //L'animazione per via dell'informazione nuova
        @animation:RewriterBook

         {
            //Tutorial
            - tutorial_witchRelationship && grimoire_appendices hasnt grimChoicesWitch:
                ~ grimoire_appendices += grimChoicesWitch

            - tutorial_witchSigils && grimoire_appendices hasnt grimSigilsWitch:
                ~ grimoire_appendices += grimSigilsWitch

            


            //Feedback
            - witch_first_story_ended_check && grimoire_witch hasnt grimWitchFirstCharFeedback:
                ~ grimoire_witch += grimWitchFirstCharFeedback

            - witch_second_story_ended_check && grimoire_witch hasnt grimWitchSecondCharFeedback:
                ~ grimoire_witch += grimWitchSecondCharFeedback

            - witch_third_story_ended_check && grimoire_witch hasnt grimWitchThirdCharFeedback:
                ~ grimoire_witch += grimWitchThirdCharFeedback

            - witch_fourth_story_ended_check && grimoire_witch hasnt grimWitchFourthCharFeedback:
                ~ grimoire_witch += grimWitchFourthCharFeedback  

            - witch_fifth_story_ended_check && grimoire_witch hasnt grimWitchFifthCharFeedback:
                ~ grimoire_witch += grimWitchFifthCharFeedback                  


            //Main storylets
            - open_the_dump && grimoire_witch hasnt grimWitchOpenDump:
                ~ grimoire_witch += grimWitchOpenDump

            - witch_intro && grimoire_witch hasnt grimWitchIntro:
                ~ grimoire_witch += grimWitchIntro

            - the_witch_and_the_frog && grimoire_witch hasnt grimWitchFrog:
                ~ grimoire_witch += grimWitchFrog

            - about_the_book && grimoire_witch hasnt grimWitchBook:
                ~ grimoire_witch += grimWitchBook    
            
            
            //Storia personale strega
            - witch_first_confession && grimoire_witch hasnt grimWitchMainOne:
                ~ grimoire_witch += grimWitchMainOne    

            - witch_second_confession && grimoire_witch hasnt grimWitchMainTwo:
                ~ grimoire_witch += grimWitchMainTwo  

            - witch_third_confession && grimoire_witch hasnt grimWitchMainThree:
                ~ grimoire_witch += grimWitchMainThree

            - witch_fourth_confession && grimoire_witch hasnt grimWitchMainFour:
                ~ grimoire_witch += grimWitchMainFour

            - witch_fifth_confession && grimoire_witch hasnt grimWitchMainFive:
                ~ grimoire_witch += grimWitchMainFive

        }
        //Aggiornamento lista di quelli comuni
        -> grimoire_common_storylets_updater ->
->->