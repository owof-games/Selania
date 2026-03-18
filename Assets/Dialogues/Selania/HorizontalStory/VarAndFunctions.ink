//Variabili e liste
LIST horizontalS_allDocs = docOne, docTwo, docThree, docFour, docFive, docSix, docSeven, docEight, docNine, docTen, docEleven, docTwelve, docThirteen, docFourteen, docFifteen, docSixteen, docSeventeen, docEighteen, docNineteen, docTwenty, docTwentyOne, docTwentyTwo, docTwentyThree, docTwentyFour, docTwentyFive

VAR horizontalS_dump = (docEight, docTen, docEighteen, docNineteen, docTwentyOne)
VAR horizontalS_kitchen = (docTwo, docFifteen, docTwenty, docTwentyTwo, docTwentyThree, docTwentyFive)
VAR horizontalS_greenhouse = (docFour, docSix, docThirteen, docFourteen)
VAR horizontalS_nest = (docSeven, docNine, docTwelve, docSeventeen, docTwentyFour)
VAR horizontalS_library = (docOne, docThree, docFive, docEleven, docSixteen)

//Questo è il documento che leggerò sulla panchina
VAR horizontalS_currentDoc = ()

//Questa è la lista di documenti scoperti, utile per popolare il grimorio
VAR horizontalS_discoveredDocs = ()

//Lista per il confronto con listDumpActivators.
VAR horizontalS_DumpActivators = ()

//Lista per il confronto con kitchen_allChefs.
VAR horizontalS_allChefs = ()

//Variabile per la notifica della serra
VAR horizontalS_greenhouseDocs = false


=== horizontalS_documentDispatcher ===
{debug_horizontalS: passo per horizontalS_documentDispatcher}
{debug_horizontalS: horizontalS_dump contiene {horizontalS_dump}, horizontalS_kitchen contiene {horizontalS_kitchen}, horizontalS_greenhouse contiene {horizontalS_greenhouse}, horizontalS_nest contiene {horizontalS_nest}, horizontalS_library contiene {horizontalS_library}. horizontalS_discoveredDocs contiene{horizontalS_discoveredDocs}.}

{
    //Lavoro preliminare per le notifiche della serra
    - LIST_COUNT(greenhouse_backupCultivable) == 12:
            ~ horizontalS_greenhouseDocs = true

    - LIST_COUNT(greenhouse_backupCultivable) == 9:
            ~ horizontalS_greenhouseDocs = true
        
    - LIST_COUNT(greenhouse_backupCultivable) == 4:
            ~ horizontalS_greenhouseDocs = true

    - greenhouse_backupCultivable == () && horizontalS_greenhouse != ():
        ~ horizontalS_greenhouseDocs = true

}

{
    //Se c'è già un documento attivo, skippo.
    - horizontalS_currentDoc != ():
    {debug_horizontalS: il valore di horizontalS_discoveredDocs è {horizontalS_discoveredDocs} e quindi torno indietro senza agire.}
        
        ->->
}




//Codice.
{
    //Per horizontalS_dump: quando attivo un nuovo asset del dump, mi salvo la PNG che l'ha generato così che ci sia una sola istanza per PNG. Posso sfruttare questa cosa tenendo conto della grandezza della lista.
        - listDumpCharActivators != horizontalS_DumpActivators:
            //Prima di tutto genero il documento
            ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_dump)
            //Lo aggiungo a quelli scoperti, lo rimuovo da horizontalS_dump
            ~ horizontalS_dump -= horizontalS_currentDoc
            ~ horizontalS_discoveredDocs += horizontalS_currentDoc
            //Aggiorno la lista per far sì che siano uguali.
            ~ horizontalS_DumpActivators = listDumpCharActivators
            ~ move_entity(docDump, Forest)
        
        // - LIST_COUNT(listDumpCharActivators) == 2 && LIST_COUNT(horizontalS_dump) == 4:
        //     ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_dump)
        //     ~ horizontalS_dump -= horizontalS_currentDoc
        //     ~ horizontalS_discoveredDocs += horizontalS_currentDoc
        //     ~ move_entity(docDump, Forest)

        // - LIST_COUNT(listDumpCharActivators) == 3 && LIST_COUNT(horizontalS_dump) == 3:
        //     ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_dump)
        //     ~ horizontalS_dump -= horizontalS_currentDoc
        //     ~ horizontalS_discoveredDocs += horizontalS_currentDoc
        //     ~ move_entity(docDump, Forest)

        // - LIST_COUNT(listDumpCharActivators) == 4 && LIST_COUNT(horizontalS_dump) == 2:
        //     ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_dump)
        //     ~ horizontalS_dump -= horizontalS_currentDoc
        //     ~ horizontalS_discoveredDocs += horizontalS_currentDoc
        //     ~ move_entity(docDump, Forest)

        //     //Metto maggiore uguale come confronto perché potrebbero crearsi delle situazioni in cui non leggo una ceppa fino a quando non ho sbloccato tutto, e a quel punto i documenti mi devono comunque comparire
        // - LIST_COUNT(listDumpCharActivators) == 5 && LIST_COUNT(horizontalS_dump) >= 1:
        //     ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_dump)
        //     ~ horizontalS_dump -= horizontalS_currentDoc
        //     ~ horizontalS_discoveredDocs += horizontalS_currentDoc
        //     ~ move_entity(docDump, Forest)



    //Per horizontalS_kitchen: ho i nodi, che possono creare problemi, per cui mi conviene banalmente tracciare in una variabile la quantità di cucinate che ho fatto. Usiamo quindi kitchen_allChefs
        - kitchen_allChefs != horizontalS_allChefs:
            //Prima di tutto genero il documento
            ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_kitchen)
            //Lo aggiungo a quelli scoperti, lo rimuovo da horizontalS_kitchen
            ~ horizontalS_kitchen -= horizontalS_currentDoc
            ~ horizontalS_discoveredDocs += horizontalS_currentDoc
            //Aggiorno la lista per far sì che siano uguali.
            ~ horizontalS_allChefs = kitchen_allChefs
            ~ move_entity(docKitchen, Forest)
        
        // - LIST_COUNT(kitchen_allChefs) == 2 && LIST_COUNT(horizontalS_kitchen) == 5:
        //     ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_kitchen)
        //     ~ horizontalS_kitchen -= horizontalS_currentDoc
        //     ~ horizontalS_discoveredDocs += horizontalS_currentDoc
        //     ~ move_entity(docKitchen, Forest)

        // - LIST_COUNT(kitchen_allChefs) == 3 && LIST_COUNT(horizontalS_kitchen) == 4:
        //     ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_kitchen)
        //     ~ horizontalS_kitchen -= horizontalS_currentDoc
        //     ~ horizontalS_discoveredDocs += horizontalS_currentDoc
        //     ~ move_entity(docKitchen, Forest)

        // - LIST_COUNT(kitchen_allChefs) == 4 && LIST_COUNT(horizontalS_kitchen) == 3:
        //     ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_kitchen)
        //     ~ horizontalS_kitchen -= horizontalS_currentDoc
        //     ~ horizontalS_discoveredDocs += horizontalS_currentDoc
        //     ~ move_entity(docKitchen, Forest)   

        // - LIST_COUNT(kitchen_allChefs) == 5 && LIST_COUNT(horizontalS_kitchen) == 2:
        //     ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_kitchen)
        //     ~ horizontalS_kitchen -= horizontalS_currentDoc
        //     ~ horizontalS_discoveredDocs += horizontalS_currentDoc
        //     ~ move_entity(docKitchen, Forest)

        // //Metto maggiore uguale come confronto perché potrebbero crearsi delle situazioni in cui non leggo una ceppa fino a quando non ho sbloccato tutto, e a quel punto i documenti mi devono comunque comparire
        // - LIST_COUNT(kitchen_allChefs) == 6 && horizontalS_kitchen != ():
        //     ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_kitchen)
        //     ~ horizontalS_kitchen -= horizontalS_currentDoc
        //     ~ horizontalS_discoveredDocs += horizontalS_currentDoc
        //     ~ move_entity(docKitchen, Forest)    


    //Per horizontalS_greenhouse invece uso greenhouse_backupCultivable. I coltivabili totali sono 14, le lettere 4, per cui ne metterei una ogni tre a parte a metà? Ricordiamoci che il backup va a ritroso. Anche per questo la logica non è più un ==, ma < di.
        

        - horizontalS_greenhouseDocs == true:
            ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_greenhouse)
            ~ horizontalS_greenhouse -= horizontalS_currentDoc
            ~ horizontalS_discoveredDocs += horizontalS_currentDoc
            ~ move_entity(docGreenhouse, Forest)
            ~ horizontalS_greenhouseDocs = false

        // - LIST_COUNT(greenhouse_backupCultivable) == 12 && LIST_COUNT(horizontalS_greenhouse) == 4:
        //     ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_greenhouse)
        //     ~ horizontalS_greenhouse -= horizontalS_currentDoc
        //     ~ horizontalS_discoveredDocs += horizontalS_currentDoc
        //     ~ move_entity(docGreenhouse, Forest)

        // - LIST_COUNT(greenhouse_backupCultivable) == 7 && LIST_COUNT(horizontalS_greenhouse) == 3:
        //     ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_greenhouse)
        //     ~ horizontalS_greenhouse -= horizontalS_currentDoc
        //     ~ horizontalS_discoveredDocs += horizontalS_currentDoc
        //     ~ move_entity(docGreenhouse, Forest) 
        
        // - LIST_COUNT(greenhouse_backupCultivable) == 4 && LIST_COUNT(horizontalS_greenhouse) == 2:
        //     ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_greenhouse)
        //     ~ horizontalS_greenhouse -= horizontalS_currentDoc
        //     ~ horizontalS_discoveredDocs += horizontalS_currentDoc
        //     ~ move_entity(docGreenhouse, Forest)

        // //Metto maggiore uguale come confronto perché potrebbero crearsi delle situazioni in cui non leggo una ceppa fino a quando non ho sbloccato tutto, e a quel punto i documenti mi devono comunque comparire.
        // - greenhouse_backupCultivable == () && horizontalS_greenhouse != ():
        //     ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_greenhouse)
        //     ~ horizontalS_greenhouse -= horizontalS_currentDoc
        //     ~ horizontalS_discoveredDocs += horizontalS_currentDoc
        //     ~ move_entity(docGreenhouse, Forest)  




    //Per horizontalS_nest invece uso glyph_discoveredSigils. I coltivabili totali sono 60, le lettere cinque, per cui ne metterei una ogni 12.

        - LIST_COUNT(glyph_discoveredSigils) == 15 && LIST_COUNT(horizontalS_nest) == 5:
            ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_nest)
            ~ horizontalS_nest -= horizontalS_currentDoc
            ~ horizontalS_discoveredDocs += horizontalS_currentDoc
            ~ move_entity(docNest, Forest)

        - LIST_COUNT(glyph_discoveredSigils) == 30 && LIST_COUNT(horizontalS_nest) == 4:
            ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_nest)
            ~ horizontalS_nest -= horizontalS_currentDoc
            ~ horizontalS_discoveredDocs += horizontalS_currentDoc
            ~ move_entity(docNest, Forest)

        - LIST_COUNT(glyph_discoveredSigils) == 45 && LIST_COUNT(horizontalS_nest) == 3:
            ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_nest)
            ~ horizontalS_nest -= horizontalS_currentDoc
            ~ horizontalS_discoveredDocs += horizontalS_currentDoc
            ~ move_entity(docNest, Forest)

        - LIST_COUNT(glyph_discoveredSigils) == 60 && LIST_COUNT(horizontalS_nest) == 2:
            ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_nest)
            ~ horizontalS_nest -= horizontalS_currentDoc
            ~ horizontalS_discoveredDocs += horizontalS_currentDoc
            ~ move_entity(docNest, Forest)

        //Metto maggiore uguale come confronto perché potrebbero crearsi delle situazioni in cui non leggo una ceppa fino a quando non ho sbloccato tutto, e a quel punto i documenti mi devono comunque comparire.
        - LIST_COUNT(glyph_discoveredSigils) == 60 && horizontalS_nest != ():
            ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_nest)
            ~ horizontalS_nest -= horizontalS_currentDoc
            ~ horizontalS_discoveredDocs += horizontalS_currentDoc
            ~ move_entity(docNest, Forest)




    //Per horizontalS_library invece uso library_unreadStories. I racconti sono 18, le lettere cinque, per pacing le metto in ordine progressivo.

        - LIST_COUNT(library_unreadStories) == 14 && LIST_COUNT(horizontalS_library) == 5:
            ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_library)
            ~ horizontalS_library -= horizontalS_currentDoc
            ~ horizontalS_discoveredDocs += horizontalS_currentDoc
            ~ move_entity(docLibrary, Forest)

        - LIST_COUNT(library_unreadStories) == 11 && LIST_COUNT(horizontalS_library) == 4:
            ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_library)
            ~ horizontalS_library -= horizontalS_currentDoc
            ~ horizontalS_discoveredDocs += horizontalS_currentDoc
             ~ move_entity(docLibrary, Forest)

        - LIST_COUNT(library_unreadStories) == 6 && LIST_COUNT(horizontalS_library) == 3:
            ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_library)
            ~ horizontalS_library -= horizontalS_currentDoc
            ~ horizontalS_discoveredDocs += horizontalS_currentDoc
             ~ move_entity(docLibrary, Forest)

        - LIST_COUNT(library_unreadStories) == 3 && LIST_COUNT(horizontalS_library) == 2:
            ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_library)
            ~ horizontalS_library -= horizontalS_currentDoc
            ~ horizontalS_discoveredDocs += horizontalS_currentDoc
            ~ move_entity(docLibrary, Forest)

        //Metto maggiore uguale come confronto perché potrebbero crearsi delle situazioni in cui non leggo una ceppa fino a quando non ho sbloccato tutto, e a quel punto i documenti mi devono comunque comparire.
        - library_unreadStories == () && horizontalS_library != ():
            ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_library)
            ~ horizontalS_library -= horizontalS_currentDoc
            ~ horizontalS_discoveredDocs += horizontalS_currentDoc
            ~ move_entity(docLibrary, Forest) 
}


{debug_horizontalS: dopo l'operazione, horizontalS_currentDoc è {horizontalS_currentDoc}. horizontalS_dump contiene {horizontalS_dump}, horizontalS_kitchen contiene {horizontalS_kitchen}, horizontalS_greenhouse contiene {horizontalS_greenhouse}, horizontalS_nest contiene {horizontalS_nest}, horizontalS_library contiene {horizontalS_library}. horizontalS_currentDoc contiene{horizontalS_currentDoc}.}

->->


//Funzione che chiamo a fine storylet per spostare/pulire quello che c'è da spostare e pulire
=== function horizontalSEndingStorylet()
    ~ horizontalS_currentDoc = ()
    ~ move_entity(docDump, Safekeeping)
    ~ move_entity(docKitchen, Safekeeping)
    ~ move_entity(docGreenhouse, Safekeeping)
    ~ move_entity(docNest, Safekeeping)
    ~ move_entity(docLibrary, Safekeeping)



=== horizontalS_storyletsDispatcher
{debug_horizontalS: passo per horizontalS_storyletsDispatcher}    
    {horizontalS_currentDoc:
        - docOne:
            -> docOne_storylet

        - docTwo:
            -> docTwo_storylet

        - docThree:
            -> docThree_storylet

        - docFour:
            -> docFour_storylet

        - docFive:
            -> docFive_storylet

        - docSix:
            -> docSix_storylet

        - docSeven:
            -> docSeven_storylet
        
        - docEight:
            -> docEight_storylet
        
        - docNine:
            -> docNine_storylet
        
        - docTen:
            -> docTen_storylet
        
        - docEleven:
            -> docEleven_storylet

        - docTwelve:
            -> docTwelve_storylet
         
        - docThirteen:
            -> docThirteen_storylet
        
        - docFourteen:
            -> docFourteen_storylet
        
        - docFifteen:
            -> docFifteen_storylet
        
        - docSixteen:
            -> docSixteen_storylet
        
        - docSeventeen:
            -> docSeventeen_storylet
        
        - docEighteen:
            -> docEighteen_storylet
        
        - docNineteen:
            -> docNineteen_storylet

        - docTwenty:
            -> docTwenty_storylet

        - docTwentyOne:
            -> docTwentyOne_storylet
        
        - docTwentyTwo:
            -> docTwentyTwo_storylet
        
        - docTwentyThree:
            -> docTwentyThree_storylet
        
        - docTwentyFour:
            -> docTwentyFour_storylet
        
        - docTwentyFive:
            -> docTwentyFive_storylet

    }


->->