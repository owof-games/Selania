//Variabili e liste
LIST horizontalS_allDocs = docOne, docTwo, docThree, docFour, docFive, docSix, docSeven, docEight, docNine, docTen, docEleven, docTwelve, docThirteen, docFourteen, docFifteen, docSixteen, docSeventeen, docEighteen, docNineteen, docTwenty, docTwentyOne, docTwentyTwo, docTwentyThree, docTwentyFour, docTwentyFive

//Alt: 1, 9, 16, 19, 21 (uguale)
VAR horizontalS_dump = (docOne, docNine, docSixteen,  docNineteen, docTwentyOne)
//Alt: 2, 15, 20, 22, 23, 25 (uguale)
VAR horizontalS_kitchen = (docTwo, docFifteen, docTwenty, docTwentyTwo, docTwentyThree, docTwentyFive)
//Alt: 4, 6, 10, 13, 18, uno in più
VAR horizontalS_greenhouse = (docFour, docSix, docTen, docThirteen,  docEighteen)
//Alt: 3, 7, 12, 17, 24
VAR horizontalS_nest = (docThree, docSeven, docTwelve, docSeventeen, docTwentyFour)
//alt: 5, 8, 11, 14, uno in meno
VAR horizontalS_library = (docFive, docEight, docEleven, docFourteen)

//Questo è il documento che leggerò sulla panchina
VAR horizontalS_currentDoc = ()

//Questa è la lista di documenti scoperti, utile per popolare il grimorio
VAR horizontalS_discoveredDocs = ()

//Lista per il confronto con listDumpActivators.
VAR horizontalS_DumpActivators = ()

//Lista per il confronto con kitchen_allChefs.
VAR horizontalS_allChefs = ()

//Variabili per le notifiche della serra
VAR horizontalS_greenhouseDocs = false
VAR horizontalS_greenhouseFirstTier = 12
VAR horizontalS_greenhouseSecondTier = 9
VAR horizontalS_greenhouseThirdTier = 6
VAR horizontalS_greenhouseFourthTier = 3

//Variabili per le notifiche del nido
VAR horizontalS_nestDocs = false
VAR horizontalS_nestFirstTier = 12
VAR horizontalS_nestSecondTier = 24
VAR horizontalS_nestThirdTier = 36
VAR horizontalS_nestFourthTier = 48
VAR horizontalS_nestFifth = 60


//Variabili per le notifiche della biblioteca
VAR horizontalS_libraryDocs = false
VAR horizontalS_libraryFirstTier = 14
VAR horizontalS_librarySecondTier = 10
VAR horizontalS_libraryThirdTier = 5


=== horizontalS_documentDispatcher ===
{debug_horizontalS: passo per horizontalS_documentDispatcher}
{debug_horizontalS: horizontalS_dump contiene {horizontalS_dump}, horizontalS_kitchen contiene {horizontalS_kitchen}, horizontalS_greenhouse contiene {horizontalS_greenhouse}, horizontalS_nest contiene {horizontalS_nest}, horizontalS_library contiene {horizontalS_library}. horizontalS_discoveredDocs contiene{horizontalS_discoveredDocs}.}

//PARTE PRELIMINARE: serve a vedere se le aree con molti oggetti (serra, nido, biblioteca) hanno raggiunto le condizioni per dare una lettera

    {
        //Lavoro preliminare per le notifiche della SERRA. Ricorda: se proprio dovessero saltare da una validazione all'altra (es: saltare la 12), l'obiettivo è il pacing, e se non leggono è perché non era interessante per loro.
        - LIST_COUNT(greenhouse_backupCultivable) == horizontalS_greenhouseFirstTier:
                ~ horizontalS_greenhouseDocs = true

        - LIST_COUNT(greenhouse_backupCultivable) == horizontalS_greenhouseSecondTier:
                ~ horizontalS_greenhouseDocs = true
            
        - LIST_COUNT(greenhouse_backupCultivable) == horizontalS_greenhouseThirdTier:
                ~ horizontalS_greenhouseDocs = true

        - LIST_COUNT(greenhouse_backupCultivable) == horizontalS_greenhouseFourthTier:
                ~ horizontalS_greenhouseDocs = true  

        - greenhouse_backupCultivable == () && horizontalS_greenhouse != ():
            ~ horizontalS_greenhouseDocs = true

    }

    {
        //Lavoro preliminare per le notifiche dei SIGILLI.   
        - LIST_COUNT(glyph_discoveredSigils) == horizontalS_nestFirstTier:
            ~ horizontalS_nestDocs = true

        - LIST_COUNT(glyph_discoveredSigils) == horizontalS_nestSecondTier:
            ~ horizontalS_nestDocs = true

        - LIST_COUNT(glyph_discoveredSigils) == horizontalS_nestThirdTier:
            ~ horizontalS_nestDocs = true

        - LIST_COUNT(glyph_discoveredSigils) == horizontalS_nestFourthTier:
            ~ horizontalS_nestDocs = true    

        - LIST_COUNT(glyph_discoveredSigils) == horizontalS_nestFifth && horizontalS_nest != ():
            ~ horizontalS_nestDocs = true
    }     

    {
        - LIST_COUNT(library_unreadStories) == horizontalS_libraryFirstTier:
            ~ horizontalS_libraryDocs = true

        - LIST_COUNT(library_unreadStories) == horizontalS_librarySecondTier:
            ~ horizontalS_libraryDocs = true

        - LIST_COUNT(library_unreadStories) == horizontalS_libraryThirdTier:
            ~ horizontalS_libraryDocs = true

        - library_unreadStories == () && horizontalS_library != ():
            ~ horizontalS_libraryDocs = true
    }



    //POI VERIFICO SE ATTIVARE O MENO UN DOCUMENTO
    {
    //Se c'è già un documento attivo, skippo.
    - horizontalS_currentDoc != ():
    {debug_horizontalS: il valore di horizontalS_discoveredDocs è {horizontalS_discoveredDocs} e quindi torno indietro senza agire.}
        
        ->->
    }




//E poi faccio il lavoro di codice
{
 
        - listDumpCharActivators != horizontalS_DumpActivators:
            //Prima di tutto genero il documento
            ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_dump)
            //Lo aggiungo a quelli scoperti, lo rimuovo da horizontalS_dump
            ~ horizontalS_dump -= horizontalS_currentDoc
            ~ horizontalS_discoveredDocs += horizontalS_currentDoc
            //Aggiorno la lista per far sì che siano uguali.
            ~ horizontalS_DumpActivators = listDumpCharActivators
            ~ move_entity(docDump, Forest)

            //La prima volta che compare una lettera arriva la molletta, così poi non ci si pensa più
            {
                - contentsForest hasnt Clothespin:
                    ~ move_entity(Clothespin, Forest)
            }

        - kitchen_allChefs != horizontalS_allChefs:
            //Prima di tutto genero il documento
            ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_kitchen)
            //Lo aggiungo a quelli scoperti, lo rimuovo da horizontalS_kitchen
            ~ horizontalS_kitchen -= horizontalS_currentDoc
            ~ horizontalS_discoveredDocs += horizontalS_currentDoc
            //Aggiorno la lista per far sì che siano uguali.
            ~ horizontalS_allChefs = kitchen_allChefs
            ~ move_entity(docKitchen, Forest)
            //La prima volta che compare una lettera arriva la molletta, così poi non ci si pensa più
            {
                - contentsForest hasnt Clothespin:
                    ~ move_entity(Clothespin, Forest)
            }


        - horizontalS_greenhouseDocs == true:
            ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_greenhouse)
            ~ horizontalS_greenhouse -= horizontalS_currentDoc
            ~ horizontalS_discoveredDocs += horizontalS_currentDoc
            ~ move_entity(docGreenhouse, Forest)
            ~ horizontalS_greenhouseDocs = false
            //La prima volta che compare una lettera arriva la molletta, così poi non ci si pensa più
            {
                - contentsForest hasnt Clothespin:
                    ~ move_entity(Clothespin, Forest)
            }


        - horizontalS_nestDocs == true:
            ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_nest)
            ~ horizontalS_nest -= horizontalS_currentDoc
            ~ horizontalS_discoveredDocs += horizontalS_currentDoc
            ~ horizontalS_nestDocs = false
            ~ move_entity(docNest, Forest)
            //La prima volta che compare una lettera arriva la molletta, così poi non ci si pensa più
            {
                - contentsForest hasnt Clothespin:
                    ~ move_entity(Clothespin, Forest)
            }

        - horizontalS_libraryDocs == true:
            ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_library)
            ~ horizontalS_library -= horizontalS_currentDoc
            ~ horizontalS_discoveredDocs += horizontalS_currentDoc
            ~ move_entity(docLibrary, Forest)
            ~ horizontalS_libraryDocs = false
            //La prima volta che compare una lettera arriva la molletta, così poi non ci si pensa più
            {
                - contentsForest hasnt Clothespin:
                    ~ move_entity(Clothespin, Forest)
            }

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