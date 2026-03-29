//Variabili e liste
LIST horizontalS_allDocs = (docOne), (docTwo), (docThree), (docFour), (docFive), (docSix), (docSeven), (docEight), (docNine), (docTen), (docEleven), (docTwelve), (docThirteen), (docFourteen), (docFifteen), (docSixteen), (docSeventeen), (docEighteen), (docNineteen), (docTwenty), (docTwentyOne), (docTwentyTwo), (docTwentyThree), (docTwentyFour), (docTwentyFive)

//E una var giusto per gli achievements che raccoglie tutti i documenti
VAR horizontalS_allAchievementDocs = ()

//Nota: se volessi sbloccare alcuni storylets solo verso la fine, quelli più sensati sarebbero docTwentyFour docTwentyFive docEighteen docFourteen

VAR horizontalS_dump = (docOne, docNine, docSixteen,  docNineteen, docTwentyOne)
VAR horizontalS_kitchen = (docTwo, docFifteen, docTwenty, docTwentyTwo, docTwentyThree, docTwentyFive)
VAR horizontalS_greenhouse = (docFour, docSix, docTen, docThirteen,  docEighteen)
VAR horizontalS_nest = (docThree, docSeven, docTwelve, docSeventeen, docTwentyFour)
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
    //Per evitare che allo stesso tier venga dato più di un documento, blocco il dispatch fino alla condizione successiva.
    VAR horizontalS_greenhouseFirstTier_check = false
    VAR horizontalS_greenhouseSecondTier_check = false
    VAR horizontalS_greenhouseThirdTier_check = false
    VAR horizontalS_greenhouseFourthTier_check = false

//Variabili per le notifiche del nido
VAR horizontalS_nestDocs = false
VAR horizontalS_nestFirstTier = 12
VAR horizontalS_nestSecondTier = 24
VAR horizontalS_nestThirdTier = 36
VAR horizontalS_nestFourthTier = 48
VAR horizontalS_nestFifth = 60
    //Per evitare che allo stesso tier venga dato più di un documento, blocco il dispatch fino alla condizione successiva.
    VAR horizontalS_nestFirstTier_check = false
    VAR horizontalS_nestSecondTier_check = false
    VAR horizontalS_nestThirdTier_check = false
    VAR horizontalS_nestFourthTier_check = false

//Variabili per le notifiche della biblioteca
VAR horizontalS_libraryDocs = false
VAR horizontalS_libraryFirstTier = 14
VAR horizontalS_librarySecondTier = 10
VAR horizontalS_libraryThirdTier = 5
    //Per evitare che allo stesso tier venga dato più di un documento, blocco il dispatch fino alla condizione successiva.
    VAR horizontalS_libraryFirstTier_check = false
    VAR horizontalS_librarySecondTier_check = false
    VAR horizontalS_libraryThirdTier_check = false

=== horizontalS_documentDispatcher ===
{debug_horizontalS: passo per horizontalS_documentDispatcher}
{debug_horizontalS: horizontalS_dump contiene {horizontalS_dump}, horizontalS_kitchen contiene {horizontalS_kitchen}, horizontalS_greenhouse contiene {horizontalS_greenhouse}, horizontalS_nest contiene {horizontalS_nest}, horizontalS_library contiene {horizontalS_library}. horizontalS_discoveredDocs contiene{horizontalS_discoveredDocs}.}

    
    //PRIMA DI TUTTO VERIFICO SE ATTIVARE O MENO UN DOCUMENTO
    {
        //Se c'è già un documento attivo, skippo.
        - horizontalS_currentDoc != ():
        {debug_horizontalS: il valore di horizontalS_discoveredDocs è {horizontalS_discoveredDocs} e quindi torno indietro senza agire.}
        ->->
    }


    //Poi verifico se le aree con molti oggetti (serra, nido, biblioteca) hanno raggiunto le condizioni per dare una lettera

    {
        //Lavoro preliminare per le notifiche della SERRA. Ricorda: se proprio dovessero saltare da una validazione all'altra (es: saltare la 12), l'obiettivo è il pacing, e se non leggono è perché non era interessante per loro.
        - horizontalS_greenhouse == ():
            ~ horizontalS_greenhouseDocs = false
        
        - LIST_COUNT(greenhouse_backupCultivable) == horizontalS_greenhouseFirstTier && horizontalS_greenhouseFirstTier_check == false:
            ~ horizontalS_greenhouseDocs = true
            ~ horizontalS_greenhouseFirstTier_check = true

        - LIST_COUNT(greenhouse_backupCultivable) == horizontalS_greenhouseSecondTier && horizontalS_greenhouseSecondTier_check == false:
            ~ horizontalS_greenhouseDocs = true
            ~ horizontalS_greenhouseSecondTier_check = true
            
        - LIST_COUNT(greenhouse_backupCultivable) == horizontalS_greenhouseThirdTier && horizontalS_greenhouseThirdTier_check == false:
            ~ horizontalS_greenhouseDocs = true
            ~ horizontalS_greenhouseThirdTier_check = true

        - LIST_COUNT(greenhouse_backupCultivable) == horizontalS_greenhouseFourthTier && horizontalS_greenhouseFourthTier_check == false:
            ~ horizontalS_greenhouseDocs = true
            ~ horizontalS_greenhouseFirstTier_check = true

        //Se il backup è vuoto, "sforno" senza vincoli documenti, perché la giocatrice potrebbe essersi persa alcune delle condizioni qui sopra
        - greenhouse_backupCultivable == () && horizontalS_greenhouse != ():
            ~ horizontalS_greenhouseDocs = true

    }

    {   
        //Lavoro preliminare per le notifiche dei SIGILLI.  
        - horizontalS_nest == ():
            ~ horizontalS_nestDocs = false

        - LIST_COUNT(glyph_discoveredSigils) == horizontalS_nestFirstTier && horizontalS_nestFirstTier_check == false:
            ~ horizontalS_nestDocs = true
            ~ horizontalS_nestFirstTier_check = true

        - LIST_COUNT(glyph_discoveredSigils) == horizontalS_nestSecondTier && horizontalS_nestSecondTier_check == false:
            ~ horizontalS_nestDocs = true
            ~ horizontalS_nestSecondTier_check = true

        - LIST_COUNT(glyph_discoveredSigils) == horizontalS_nestThirdTier && horizontalS_nestThirdTier_check == false:
            ~ horizontalS_nestDocs = true
            ~ horizontalS_nestThirdTier_check = true

        - LIST_COUNT(glyph_discoveredSigils) == horizontalS_nestFourthTier && horizontalS_nestFourthTier_check == false:
            ~ horizontalS_nestDocs = true
            ~ horizontalS_nestFourthTier_check = true 

        - LIST_COUNT(glyph_discoveredSigils) == horizontalS_nestFifth && horizontalS_nest != ():
            ~ horizontalS_nestDocs = true
    }     

    {   
        //Lavoro preliminare per le notifiche dalla BIBLIOTECA.
        - horizontalS_library == ():
            ~ horizontalS_libraryDocs = false

        - LIST_COUNT(library_unreadStories) == horizontalS_libraryFirstTier && horizontalS_libraryFirstTier_check == false:
            ~ horizontalS_libraryDocs = true
            ~ horizontalS_libraryFirstTier_check = true

        - LIST_COUNT(library_unreadStories) == horizontalS_librarySecondTier && horizontalS_librarySecondTier_check == false:
            ~ horizontalS_libraryDocs = true
            ~ horizontalS_librarySecondTier_check = true

        - LIST_COUNT(library_unreadStories) == horizontalS_libraryThirdTier && horizontalS_libraryThirdTier_check == false:
            ~ horizontalS_libraryDocs = true
            ~ horizontalS_libraryThirdTier_check = true

        - library_unreadStories == () && horizontalS_library != ():
            ~ horizontalS_libraryDocs = true
    }




//E poi faccio il lavoro di codice
{
 
        - listDumpCharActivators != horizontalS_DumpActivators:
            //Prima di tutto genero il documento
            ~ horizontalS_currentDoc = LIST_RANDOM(horizontalS_dump)
            //Lo aggiungo a quelli scoperti, lo rimuovo da horizontalS_dump
            ~ horizontalS_dump -= horizontalS_currentDoc
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
            ~ move_entity(docLibrary, Forest)
            ~ horizontalS_libraryDocs = false
            //La prima volta che compare una lettera arriva la molletta, così poi non ci si pensa più
            {
                - contentsForest hasnt Clothespin:
                    ~ move_entity(Clothespin, Forest)
            }

}

{debug_horizontalS: dopo l'operazione, horizontalS_currentDoc è {horizontalS_currentDoc}. horizontalS_dump contiene {horizontalS_dump}, horizontalS_kitchen contiene {horizontalS_kitchen}, horizontalS_greenhouse contiene {horizontalS_greenhouse}, horizontalS_nest contiene {horizontalS_nest}, horizontalS_library contiene {horizontalS_library}. horizontalS_currentDoc contiene{horizontalS_currentDoc}.}
{debug_horizontalS: dopo le operazioni, la foresta contiene {contentsForest}.}

->->


//Funzione che chiamo a fine storylet per spostare/pulire quello che c'è da spostare e pulire
=== horizontalSEndingStorylet
{debug_horizontalS: horizontalSEndingStorylet}
    ~ horizontalS_discoveredDocs += horizontalS_currentDoc
    ~ horizontalS_currentDoc = ()
    ~ move_entity(docDump, Safekeeping)
    ~ move_entity(docKitchen, Safekeeping)
    ~ move_entity(docGreenhouse, Safekeeping)
    ~ move_entity(docNest, Safekeeping)
    ~ move_entity(docLibrary, Safekeeping)
    -> achievements_onGame_statusUpdate_RM ->
{debug_horizontalS: dopo {debug_horizontalS: horizontalSEndingStorylet} i contenuti della foresta sono {contentsForest}.} 
-> main


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

        - else:
            ERROR: non ci sono valori validi per  horizontalS_currentDoc, che è uguale a {horizontalS_currentDoc}.   
            -> END

    }


->->