//Variabili e liste
LIST horizontalS_allDocs = docOne, docTwo, docThree, docFour, docFive, docSix, docSeven, docEight, docNine, docTen, docEleven, docTwelve, docThirteen, docFourteen, docFifteen, docSixteen, docSeventeen, docEighteen, docNineteen, docTwenty, docTwentyOne, docTwentyTwo, docTwentyThree, docTwentyFour, docTwentyFive

VAR horizontalS_dump = (docEight, docTen, docEighteen, docNineteen, docTwentyOne)
VAR horizontalS_kitchen = (docTwo, docFifteen, docTwenty, docTwentyTwo, docTwentyThree, docTwentyFive)
VAR horizontalS_greenhouse = (docFour, docSix, docThirteen, docFourteen, docFifteen)
VAR horizontalS_nest = (docSeven, docNine, docTwelve, docSeventeen, docTwentyFour)
VAR horizontalS_library = (docOne, docThree, docFive, docEleven, docSixteen)

//Questo è il documento che leggerò sulla panchina
VAR horizontalS_currentDoc = ()

//Questa è la lista di documenti scoperti, utile per popolare il grimorio
VAR horizontalS_discoveredDocs = ()




=== horizontalS_documentDispatcher ===

{
    //Se c'è già un documento attivo, skippo.
    - horizontalS_discoveredDocs != ():
        ->->
}





//Codice.
{
    //Per horizontalS_dump: quando attivo un nuovo asset del dump, mi salvo la PNG che l'ha generato così che ci sia una sola istanza per PNG. Posso sfruttare questa cosa tenendo conto della grandezza della lista.
        - LIST_COUNT(listDumpCharActivators) == 1 && LIST_COUNT(horizontalS_dump) == 5:
            ~ horizontalS_discoveredDocs = LIST_RANDOM(horizontalS_dump)
            ~ horizontalS_dump -= horizontalS_discoveredDocs
        
        - LIST_COUNT(listDumpCharActivators) == 2 && LIST_COUNT(horizontalS_dump) == 4:
            ~ horizontalS_discoveredDocs = LIST_RANDOM(horizontalS_dump)
            ~ horizontalS_dump -= horizontalS_discoveredDocs

        - LIST_COUNT(listDumpCharActivators) == 3 && LIST_COUNT(horizontalS_dump) == 3:
            ~ horizontalS_discoveredDocs = LIST_RANDOM(horizontalS_dump)
            ~ horizontalS_dump -= horizontalS_discoveredDocs

        - LIST_COUNT(listDumpCharActivators) == 4 && LIST_COUNT(horizontalS_dump) == 2:
            ~ horizontalS_discoveredDocs = LIST_RANDOM(horizontalS_dump)
            ~ horizontalS_dump -= horizontalS_discoveredDocs    

        - LIST_COUNT(listDumpCharActivators) == 5 && LIST_COUNT(horizontalS_dump) == 1:
            ~ horizontalS_discoveredDocs = LIST_RANDOM(horizontalS_dump)
            ~ horizontalS_dump -= horizontalS_discoveredDocs   
}

{
    //Per horizontalS_kitchen: ho i nodi, che possono creare problemi, per cui mi conviene banalmente tracciare in una variabile la quantità di cucinate che ho fatto. Usiamo quindi kitchen_allChefs
        - LIST_COUNT(kitchen_allChefs) == 1 && LIST_COUNT(horizontalS_kitchen) == 6:
            ~ horizontalS_discoveredDocs = LIST_RANDOM(horizontalS_kitchen)
            ~ horizontalS_kitchen -= horizontalS_discoveredDocs
        
        - LIST_COUNT(kitchen_allChefs) == 2 && LIST_COUNT(horizontalS_kitchen) == 5:
            ~ horizontalS_discoveredDocs = LIST_RANDOM(horizontalS_kitchen)
            ~ horizontalS_kitchen -= horizontalS_discoveredDocs

        - LIST_COUNT(kitchen_allChefs) == 3 && LIST_COUNT(horizontalS_kitchen) == 4:
            ~ horizontalS_discoveredDocs = LIST_RANDOM(horizontalS_kitchen)
            ~ horizontalS_kitchen -= horizontalS_discoveredDocs

        - LIST_COUNT(kitchen_allChefs) == 4 && LIST_COUNT(horizontalS_kitchen) == 3:
            ~ horizontalS_discoveredDocs = LIST_RANDOM(horizontalS_kitchen)
            ~ horizontalS_kitchen -= horizontalS_discoveredDocs    

        - LIST_COUNT(kitchen_allChefs) == 5 && LIST_COUNT(horizontalS_kitchen) == 2:
            ~ horizontalS_discoveredDocs = LIST_RANDOM(horizontalS_kitchen)
            ~ horizontalS_kitchen -= horizontalS_discoveredDocs

        - LIST_COUNT(kitchen_allChefs) == 6 && LIST_COUNT(horizontalS_kitchen) == 1:
            ~ horizontalS_discoveredDocs = LIST_RANDOM(horizontalS_kitchen)
            ~ horizontalS_kitchen -= horizontalS_discoveredDocs      
}




->->