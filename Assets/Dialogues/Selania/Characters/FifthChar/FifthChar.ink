=== fifth_character_opinions
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {shuffle:
        - {charTag(FifthCharacter, "neutral")}:         Frase
        - {charTag(FifthCharacter, "neutral")}:         Frase
        - {charTag(FifthCharacter, "neutral")}:         Frase
    }
            ~ fifthChar_pauseTalking = fifthChar_pauseDuration
            ~ fifthChar_justTalked = true
                -> options_fifth_character 
    
