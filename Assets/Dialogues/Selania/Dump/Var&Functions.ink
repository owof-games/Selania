=== dump_graphic_changer ===
{debug: passo per dump_graphic_changer. listDumpGraphics contiene {listDumpGraphics}, mentre listDumpCharActivators contiene {listDumpCharActivators}}
LIST listDumpGraphics = firstStateDump, secondStateDump, thirdStateDump, fourthStateDump, fifthStateDump
VAR listDumpCharActivators = ()

//La logica è: ogni volta che con una personaggia superiamo minStoryletsForRewriting (es: firstChar_minStoryletsForRewriting), il valore di listDumpGraphics sale e si sblocca un nuovo oggetto
//Per evitare che unx PNG attivi due volte il processo, metto il suo nome nella lista listDumpCharActivators, e controllo da lì.
//Questa funzione verrà chiamata nella funzione generale legata al cambio stanza

//Step uno: variare se necessario lo stato di listDumpGraphics
    {
        - grimoire_firstChar has grimFirstCharTwelve && listDumpCharActivators hasnt FirstCharacter:
            ~ listDumpGraphics ++
            ~ listDumpCharActivators += FirstCharacter
            {debug: il valore di grimoire_firstChar ha grimFirstCharTwelve {grimoire_firstChar}, e per questo ho aumentato il valore di listDumpGraphics e aggiunto FirstCharacter a listDumpCharActivators. listDumpGraphics contiene {listDumpGraphics}, mentre listDumpCharActivators contiene {listDumpCharActivators}}
            
    }

    {
        - grimoire_secondChar has grimSecondCharTwelve && listDumpCharActivators hasnt SecondCharacter:
            ~ listDumpGraphics ++
            ~ listDumpCharActivators += SecondCharacter
            {debug: il valore di grimoire_secondChar ha grimSecondCharTwelve{grimoire_secondChar}, e per questo ho aumentato il valore di listDumpGraphics e aggiunto SecondCharacter a listDumpCharActivators. listDumpGraphics contiene {listDumpGraphics}, mentre listDumpCharActivators contiene {listDumpCharActivators}}
    }

    {
        - grimoire_thirdChar has grimThirdCharLetterSeven && listDumpCharActivators hasnt ThirdCharacter:
            ~ listDumpGraphics ++
            ~ listDumpCharActivators += ThirdCharacter
            {debug: il valore di grimoire_thirdChar ha grimThirdCharTwelve {grimoire_thirdChar}, e per questo ho aumentato il valore di listDumpGraphics e aggiunto ThirdCharacter a listDumpCharActivators. listDumpGraphics contiene {listDumpGraphics}, mentre listDumpCharActivators contiene {listDumpCharActivators}}
    }

    {
        - grimoire_fourthChar has grimFourthCharTwelve && listDumpCharActivators hasnt FourthCharacter:
            ~ listDumpGraphics ++
            ~ listDumpCharActivators += FourthCharacter
            {debug: il valore di grimoire_fourthChar ha grimFourthCharTwelve {grimoire_fourthChar}, e per questo ho aumentato il valore di listDumpGraphics e aggiunto FourthCharacter a listDumpCharActivators. listDumpGraphics contiene {listDumpGraphics}, mentre listDumpCharActivators contiene {listDumpCharActivators}}
    }

    {
        - grimoire_fifthChar has grimFifthCharSix && listDumpCharActivators hasnt FifthCharacter:
            ~ listDumpGraphics ++
            ~ listDumpCharActivators += FifthCharacter
            {debug: il valore di grimoire_fifthChar ha grimFifthCharTwelve {grimoire_fifthChar}, e per questo ho aumentato il valore di listDumpGraphics e aggiunto FifthCharacter a listDumpCharActivators. listDumpGraphics contiene {listDumpGraphics}, mentre listDumpCharActivators contiene {listDumpCharActivators}}
    }

//Step due: aggiornare gli oggetti nel dump se necessario

    {
        - LIST_COUNT(listDumpGraphics) > 0 && contentsDump hasnt firstDumpOBJ:
            ~ move_entity(firstDumpOBJ, Dump)
    }

    {
        - LIST_COUNT(listDumpGraphics) > 1 && contentsDump hasnt secondDumpOBJ:
            ~ move_entity(secondDumpOBJ, Dump)
    }

    {
        - LIST_COUNT(listDumpGraphics) > 2 && contentsDump hasnt thirdDumpOBJ:
            ~ move_entity(thirdDumpOBJ, Dump)
    }

    {
        - LIST_COUNT(listDumpGraphics) > 3 && contentsDump hasnt fourthDumpOBJ:
            ~ move_entity(fourthDumpOBJ, Dump)
    }

    {
        - LIST_COUNT(listDumpGraphics) > 4 && contentsDump hasnt fifthDumpOBJ:
            ~ move_entity(fifthDumpOBJ, Dump)
    }

-> achievements_onGame_statusUpdate_RM ->
->->