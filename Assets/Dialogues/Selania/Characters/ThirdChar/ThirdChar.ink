=== third_character_opinions
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {shuffle:
        - {charTag(ThirdCharacter, "bored")}:                       Gira che ti rigira, a me i turisti comunque stanno un po' sul cazzo.
                                                                    Lasciano poche mance, e ci sono pochissime case in giro.
        - {charTag(ThirdCharacter, "bored")}:                       Non ricordo l'ultima volta che lo Stracciamaroni ha buttato la spazzatura, il maledetto.
        - {charTag(ThirdCharacter, "jester")}:                      La cosa bella di lavorare nell'unica birreria del posto è che sai i cazzi di tutti.
            {charTag(ThirdCharacter, "bored")}:                     La cosa brutta è che tutti sanno i cazzi tuoi.
        - {charTag(ThirdCharacter, "bored")}:                       Ultimamente ci sono più risse al Baretto.
                                                                    Tutti sembrano arrabbiati.
        - {charTag(ThirdCharacter, "neutral")}:                     Sai che mi piace il sexting? Non c'era quando mi sono messo con Dona.
                                                                    Ma preferisco non vedere le facce.
        - {charTag(ThirdCharacter, "neutral")}:                     Ucciderei per una sigaretta.
                                                                    Anche di quelle odiose col tabacco, che metà finisce sul tavolo e ti fumi anche gli avanzi della cena.
        - {charTag(ThirdCharacter, "neutral")}:                     So che ogni tanto dico che una cosa è "gay" ma non lo dico con cattiveria, è solo l'abitudine.
        - {charTag(ThirdCharacter, "neutral")}:                     Metà dei clienti del bar alla fine sono 'sti tizi soli, senza una fidanzata, che bevono con gli amici per sentirsi meno soli ma c'hanno sempre questi occhi da cane bastonato. Che pena mi fanno.
        - {charTag(ThirdCharacter, "neutral")}:                     Appena mi faccio una casa mia mi prendo un cane, un bel bracco di quelli che c'hanno la faccia che sembra che hanno capito il mondo.
            {charTag(ThirdCharacter, "jester")}:                    Così magari me lo spiegano.
    }
            ~ thirdChar_pauseTalking = thirdChar_pauseDuration
            ~ thirdChar_justTalked = true
                -> options_third_character 
    
