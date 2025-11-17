//Variabili legate alle personagge
//Con nuova versione: NotStarted non riguarda più la storia principale, ma l'accesso alla personaggia

    LIST storyStates = NotStarted, Active, Ended
    VAR minStoryQuesTCountFirstChar = 7
    VAR secondChar_storyletsForRewritingCount = 8
//COME PROMEMORIA. LISTA DI TIPI DI TONO CHE POSSIAMO TENERE IN UNA CONVERSAZIONE: ROSSO (RABBIA, PASSIONE, AZIONE, OPPOSIZIONE). VIOLA (SPIRITUALITA', VISIONE DEL GRANDE SCHEMA DELLE COSE, SGUARDO POETICO, TESA VERSO UNA MISSIONE). GIALLO (GIOCOSITA', RISATA, DIVERTIMENTO, FANCIULLEZZA). VERDE (CUORE, AFFETTI, CURA DELLE PERSONE CARE, RIFLESSIONE EMOTIVA). BLU (RAZIONALITA', CALCOLO, VISIONE PRATICA, DISCIPLINA).

            /* ---------------------------------
            
               Gestione prima personaggia. 
            
             ----------------------------------*/

//Ordine degli stati: 0, Blue, Rosso, Verde, Giallo, Viola.
    LIST firstCharacterPossibleStates = Chitarra, Triangolo, RagazzaOrchestra, FlautoDolce, Ocarina, Violino
    VAR firstCharacterState = Chitarra
    
    VAR firstStory = NotStarted
    //Tengo conto delle interazioni avute per aprire la possibilità di dare un dono
    VAR firstStoryQuestCount = 0
    VAR firstCharacterSpecialEvent = false
    

    //Variabili per mettere in pausa la conversazione
    VAR firstPauseTalking = 0
    VAR firstCharPauseDurantion = 3
    
    //Variabile per il countdown per la sua uscita di scena
    VAR firstCharEndingDialogue = 0
    
    //Variabile per il tempo di attesa tra una lettera e l'altra
    VAR firstWritingPause = 0
    VAR firstWritingPauseDuration = 5
    
    //STATI UP: Viola e Giallo.
    //STATI DOWN: Blu.
    VAR firstPurple = 0
    VAR firstYellow = 0
    VAR firstBlue = 0
    VAR firstGreen = 0
    VAR firstRed = 0



            /* ---------------------------------
            
               Gestione secondo personaggio. 
            
             ----------------------------------*/

//Ordine degli stati:
    LIST secondCharacterPossibleStates = IlRiccio, IlGrizzly, IlLupo, IlDelfino, IlCapibara, IlCorvo
    VAR secondCharacterState = IlRiccio
    
    VAR secondChar_storyStatus = NotStarted
    //Tengo conto delle interazioni avute per aprire la possibilità di dare un dono
    VAR secondChar_storyletsForRewritingCount = 0
    VAR secondChar_specialEvent = false

    //Variabili per mettere in pausa la conversazione
    VAR secondChar_pauseTalking = 0
    VAR secondCharPauseDurantion = 3
    
    //Variabile per il countdown per la sua uscita di scena
    VAR secondChar_exitCounter = 0    

    //Variabile per il tempo di attesa tra una lettera e l'altra
    VAR secondChar_mailPause = 0
    VAR secondChar_mailPauseDuration = 5
    
    //UP: coerenza.
    //DOWN: incoerenza, cose random
    VAR secondChar_purple = 0
    VAR secondChar_Yellow = 0
    VAR secondChar_Blue = 0
    VAR secondChar_Green = 0
    VAR secondChar_Red = 0    

            /* ---------------------------------
            
               Gestione terzo personaggio. 
            
             ----------------------------------*/
//Gestione terza personaggia
    LIST thirdCharacterPossibleStates = SpettroDelVuoto, LArrabbiato, IlGuarente, IlTerrorizzato, LAbbandonato, IlSocievole, IlConsapevole
    VAR thirdCharacterState = SpettroDelVuoto
    
    VAR thirdStory = NotStarted
    //Tengo conto delle interazioni avute per aprire la possibilità di dare un dono
    VAR thirdChar_storyletsForRewritingCount = 0
    VAR thirdChar_specialEvent = false
    
    //Variabili per mettere in pausa la conversazione
    VAR thirdChar_pauseTalking = 0
    VAR thirdCharPauseDurantion = 4
    
    //Variabile per il countdown per la sua uscita di scena
    VAR thirdCharEndingDialogue = 0    

    //Variabile per il tempo di attesa tra una lettera e l'altra
    VAR thirdWritingPause = 0
    VAR thirdWritingPauseDuration = 5
    
    //UP: ???
    //DOWN: ???
    VAR thirdChar_purple = 0
    VAR thirdChar_yellow = 0
    VAR thirdChar_blue = 0
    VAR thirdChar_green = 0
    VAR thirdChar_red = 0  




            /* ---------------------------------
            
               Gestione quarta personaggia. 
            
             ----------------------------------*/

//Gestione quarta personaggia
    LIST fourthCharacterPossibleStates = LaMondatrice, NuovoStatoUnoQuattro, NuovoStatoDueQuattro, NuovoStatoTreQuattro
    VAR fourthCharacterState = LaMondatrice
    
    VAR fourthStory = NotStarted
    VAR fourthChar_specialEvent = false

            /* ---------------------------------
            
               Gestione quarta personaggia. 
            
             ----------------------------------*/
//Gestione quinta personaggia
    LIST fifthChar_possibleStates= IlMentore, NuovoStatoUnoCinque, NuovoStatoDueCinque, NuovoStatoTreCinque
    VAR fifthChar_ActualName= IlMentore
    
    VAR fifthChar_storyStatus = NotStarted
    //Tengo conto delle interazioni avute per aprire la possibilità di dare un dono
    VAR fifthChar_storyletsForRewritingCount = 0
    VAR fifthChar_specialEvent = false
    
    //Variabili per mettere in pausa la conversazione. Plausibilmente per mentore sarà molto alta all'inizio.
    VAR fifthChar_pauseTalking = 0
    VAR fifthCharPauseDurantion = 10
    
    //Variabile per il countdown per la sua uscita di scena
    VAR fifthChar_exitCounter = 0    

    //Variabile per il tempo di attesa tra una lettera e l'altra
    VAR fifthChar_mailPause = 0
    VAR fifthChar_mailPauseDuration = 5    
    
    //STATI UP: ???
    //STATI DOWN: ???
    VAR fifthChar_purple = 0
    VAR fifthChar_yellow = 0
    VAR fifthChar_blue = 0
    VAR fifthChar_green = 0
    VAR fifthChar_red = 0
    



//Funzione di traduzione da variabile a stringa con articolo minuscolo
=== function lowercaseTranslator(characterState)
    {characterState:

    //Personaggia Uno
        - Chitarra:
            ~ return "Guitar"
        - Triangolo:
            ~ return "Triangle"
        - RagazzaOrchestra:
            ~ return "Orchestra"
        - FlautoDolce:
            ~ return "Vertical Flute"
        - Ocarina:
            ~ return "Ocarina"
        - Violino:
            ~ return "Violino"
        
    //Personaggia Due       
        - IlRiccio:
            ~ return "Hedgehog"
        - IlGrizzly:
            ~ return "Grizzly"
        - IlLupo:
            ~ return "Wolf"
        - IlDelfino:
            ~ return "Dolphin"
        - IlCapibara:
            ~ return "Capybara"
        - IlCorvo:
            ~ return "Crow"
            
    //Personaggia Tre
        - SpettroDelVuoto:
            ~ return "Placeholder"
        - IlConsapevole: 
            ~ return "Placeholder"
        - IlGuarente: 
            ~ return "Placeholder"    
        - IlSocievole: 
            ~ return "Placeholder"
        - IlTerrorizzato: 
            ~ return "Placeholder"
        - LAbbandonato: 
            ~ return "Placeholder"    
        - LArrabbiato: 
            ~ return "Placeholder"

    //Personaggia Quattro             
        - LaMondatrice:
            ~ return "Placeholder"

    //Personaggia Cinque        
        - IlMentore:
            ~ return "Mentor"

    }

//Funzione di traduzione da variabile a stringa con articolo maiuscolo
=== function uppercaseTranslator(characterState)
    {characterState:
    
    //Personaggia Uno
        - Chitarra:
            ~ return "Guitar"
        - Triangolo:
            ~ return "Triangle"
        - RagazzaOrchestra:
            ~ return "Orchestra"
        - FlautoDolce:
            ~ return "Vertical Flute"
        - Ocarina:
            ~ return "Ocarina"
        - Violino:
            ~ return "Violin"

    //Personaggia Due       
        - IlRiccio:
            ~ return "Hedgehog"
        - IlGrizzly:
            ~ return "Grizzly"
        - IlLupo:
            ~ return "Wolf"
        - IlDelfino:
            ~ return "Dolphin"
        - IlCapibara:
            ~ return "Capybara"
        - IlCorvo:
            ~ return "Placeholder"

    //Personaggia Tre
        - SpettroDelVuoto:
            ~ return "Placeholder"
        - IlConsapevole: 
            ~ return "Placeholder"
        - IlGuarente: 
            ~ return "Placeholder"    
        - IlSocievole: 
            ~ return "Placeholder"
        - IlTerrorizzato: 
            ~ return "Placeholder"
        - LAbbandonato: 
            ~ return "Placeholder"    
        - LArrabbiato: 
            ~ return "Placeholder"            
    
    //Personaggia Quattro        
        - LaMondatrice:
            ~ return "Placeholder"

    //Personaggia Cinque        
        - IlMentore:
            ~ return "Mentor"

    }




