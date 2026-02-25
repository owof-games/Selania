=== dump_graphic_changer ===
{debug: passo per dump_graphic_changer. listDumpGraphics contiene {listDumpGraphics}, mentre listDumpCharActivators contiene {listDumpCharActivators}}
LIST listDumpGraphics = firstStateDump, secondStateDump, thirdStateDump, fourthStateDump, fifthStateDump
VAR listDumpCharActivators = ()
VAR dumpVariationActivator = 2

//La logica è: ogni volta che con una personaggia superiamo minStoryletsForRewriting (es: firstChar_minStoryletsForRewriting), il valore di listDumpGraphics sale e si sblocca un nuovo oggetto
//Per evitare che unx PNG attivi due volte il processo, metto il suo nome nella lista listDumpCharActivators, e controllo da lì.
//Questa funzione verrà chiamata nella funzione generale legata al cambio stanza

//Step uno: variare se necessario lo stato di listDumpGraphics
    {
        - (firstChar_storyletsForRewritingCount >= firstChar_minStoryletsForRewriting + dumpVariationActivator) && listDumpCharActivators hasnt FirstCharacter:
            ~ listDumpGraphics ++
            ~ listDumpCharActivators += FirstCharacter
            {debug: il valore di firstChar_storyletsForRewritingCount è uguale a {firstChar_storyletsForRewritingCount}, e per questo ho aumentato il valore di listDumpGraphics e aggiunto FirstCharacter a listDumpCharActivators. listDumpGraphics contiene {listDumpGraphics}, mentre listDumpCharActivators contiene {listDumpCharActivators}}
            
    }

    {
        - (secondChar_storyletsForRewritingCount >= secondChar_minStoryletsForRewriting + dumpVariationActivator) && listDumpCharActivators hasnt SecondCharacter:
            ~ listDumpGraphics ++
            ~ listDumpCharActivators += SecondCharacter
            {debug: il valore di secondChar_storyletsForRewritingCount è uguale a {secondChar_storyletsForRewritingCount}, e per questo ho aumentato il valore di listDumpGraphics e aggiunto SecondCharacter a listDumpCharActivators. listDumpGraphics contiene {listDumpGraphics}, mentre listDumpCharActivators contiene {listDumpCharActivators}}
    }

    {
        - (thirdChar_storyletsForRewritingCount >= thirdChar_minStoryletsForRewriting + dumpVariationActivator) && listDumpCharActivators hasnt ThirdCharacter:
            ~ listDumpGraphics ++
            ~ listDumpCharActivators += ThirdCharacter
            {debug: il valore di thirdChar_storyletsForRewritingCount è uguale a {thirdChar_storyletsForRewritingCount}, e per questo ho aumentato il valore di listDumpGraphics e aggiunto ThirdCharacter a listDumpCharActivators. listDumpGraphics contiene {listDumpGraphics}, mentre listDumpCharActivators contiene {listDumpCharActivators}}
    }

    {
        - (fourthChar_storyletsForRewritingCount >= fourthChar_minStoryletsForRewriting + dumpVariationActivator) && listDumpCharActivators hasnt FourthCharacter:
            ~ listDumpGraphics ++
            ~ listDumpCharActivators += FourthCharacter
            {debug: il valore di fourthChar_storyletsForRewritingCount è uguale a {fourthChar_storyletsForRewritingCount}, e per questo ho aumentato il valore di listDumpGraphics e aggiunto FourthCharacter a listDumpCharActivators. listDumpGraphics contiene {listDumpGraphics}, mentre listDumpCharActivators contiene {listDumpCharActivators}}
    }

    {
        - (fifthChar_storyletsForRewritingCount >= fifthChar_minStoryletsForRewriting + dumpVariationActivator) && listDumpCharActivators hasnt FifthCharacter:
            ~ listDumpGraphics ++
            ~ listDumpCharActivators += FifthCharacter
            {debug: il valore di fifthChar_storyletsForRewritingCount è uguale a {fifthChar_storyletsForRewritingCount}, e per questo ho aumentato il valore di listDumpGraphics e aggiunto FifthCharacter a listDumpCharActivators. listDumpGraphics contiene {listDumpGraphics}, mentre listDumpCharActivators contiene {listDumpCharActivators}}
    }

//Step due: aggiornare gli oggetti nel dump se necessario

    {
        - listDumpGraphics has firstStateDump && contentsDump hasnt firstDumpOBJ:
            ~ move_entity(firstDumpOBJ, Dump)
    }

    {
        - listDumpGraphics has secondStateDump && contentsDump hasnt secondDumpOBJ:
            ~ move_entity(secondDumpOBJ, Dump)
    }

    {
        - listDumpGraphics has thirdStateDump && contentsDump hasnt thirdDumpOBJ:
            ~ move_entity(thirdDumpOBJ, Dump)
    }

    {
        - listDumpGraphics has fourthStateDump && contentsDump hasnt fourthDumpOBJ:
            ~ move_entity(fourthDumpOBJ, Dump)
    }

    {
        - listDumpGraphics has fifthStateDump && contentsDump hasnt fifthDumpOBJ:
            ~ move_entity(fifthDumpOBJ, Dump)
    }

->->