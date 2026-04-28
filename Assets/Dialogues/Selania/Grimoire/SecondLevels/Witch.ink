=== grimoire_witchRecap
@grimoireText #style:character #icon:witch #title:{witch_actualName} #description:{grimoire_characterDescription(TheWitch)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    //Main story
    {
        - grimoire_witch has grimWitchIntro:
        ssss
    }




    
    + [Index #bookmark:index]
        -> grimoire
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_witchRecap
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_witchRecap

->->
