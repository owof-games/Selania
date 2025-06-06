//Variabili legate alle personagge
//Con nuova versione: NotStarted non riguarda più la storia principale, ma l'accesso alla personaggia

    LIST storyStates = NotStarted, Active, Ended
    VAR minStoryQuesTCountFirstChar = 7
    VAR minStoryQuesTCountSecondChar = 8
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
    
    VAR secondStory = NotStarted
    //Tengo conto delle interazioni avute per aprire la possibilità di dare un dono
    VAR secondStoryQuestCount = 0
    VAR secondCharacterSpecialEvent = false

    //Variabili per mettere in pausa la conversazione
    VAR secondPauseTalking = 0
    VAR secondCharPauseDurantion = 3
    
    //Variabile per il countdown per la sua uscita di scena
    VAR secondCharEndingDialogue = 0    

    //Variabile per il tempo di attesa tra una lettera e l'altra
    VAR secondWritingPause = 0
    VAR secondWritingPauseDuration = 5
    
    //UP: coerenza.
    //DOWN: incoerenza, cose random
    VAR secondPurple = 0
    VAR secondYellow = 0
    VAR secondBlue = 0
    VAR secondGreen = 0
    VAR secondRed = 0    

            /* ---------------------------------
            
               Gestione terzo personaggio. 
            
             ----------------------------------*/
//Gestione terza personaggia
    LIST thirdCharacterPossibleStates = SpettroDelVuoto, LArrabbiato, IlGuarente, IlTerrorizzato, LAbbandonato, IlSocievole, IlConsapevole
    VAR thirdCharacterState = SpettroDelVuoto
    
    VAR thirdStory = NotStarted
    //Tengo conto delle interazioni avute per aprire la possibilità di dare un dono
    VAR thirdStoryQuestCount = 0
    VAR thirdCharacterSpecialEvent = false
    
    //Variabili per mettere in pausa la conversazione
    VAR thirdPauseTalking = 0
    VAR thirdCharPauseDurantion = 4
    
    //Variabile per il countdown per la sua uscita di scena
    VAR thirdCharEndingDialogue = 0    

    //Variabile per il tempo di attesa tra una lettera e l'altra
    VAR thirdWritingPause = 0
    VAR thirdWritingPauseDuration = 5
    
    //UP: ???
    //DOWN: ???
    VAR thirdPurple = 0
    VAR thirdYellow = 0
    VAR thirdBlue = 0
    VAR thirdGreen = 0
    VAR thirdRed = 0  




            /* ---------------------------------
            
               Gestione quarta personaggia. 
            
             ----------------------------------*/

//Gestione quarta personaggia
    LIST fourthCharacterPossibleStates = LaMondatrice, NuovoStatoUnoQuattro, NuovoStatoDueQuattro, NuovoStatoTreQuattro
    VAR fourthCharacterState = LaMondatrice
    
    
    VAR fourthStory = NotStarted
    //Tengo conto delle interazioni avute per aprire la possibilità di dare un dono
    VAR fourthStoryQuestCount = 0
    VAR fourthCharacterSpecialEvent = false
    
    //Variabili per mettere in pausa la conversazione
    VAR fourthPauseTalking = 0
    VAR fourthCharPauseDurantion = 4
    
    //Variabile per il countdown per la sua uscita di scena
    VAR fourthCharEndingDialogue = 0    

    //Variabile per il tempo di attesa tra una lettera e l'altra
    VAR fourthWritingPause = 0
    VAR fourthWritingPauseDuration = 5
    
    //UP: ???
    //DOWN: ???
    VAR fourthPurple = 0
    VAR fourthYellow = 0
    VAR fourthBlue = 0
    VAR fourthGreen = 0
    VAR fourthRed = 0  

            /* ---------------------------------
            
               Gestione quarta personaggia. 
            
             ----------------------------------*/
//Gestione quinta personaggia
    LIST fifthCharacterPossibleStates= IlMentore, NuovoStatoUnoCinque, NuovoStatoDueCinque, NuovoStatoTreCinque
    VAR fifthCharacterState= IlMentore
    
    VAR fifthStory = NotStarted
    //Tengo conto delle interazioni avute per aprire la possibilità di dare un dono
    VAR fifthStoryQuestCount = 0
    VAR fifthCharacterSpecialEvent = false
    
    //Variabili per mettere in pausa la conversazione. Plausibilmente per mentore sarà molto alta all'inizio.
    VAR fifthPauseTalking = 0
    VAR fifthCharPauseDurantion = 10
    
    //Variabile per il countdown per la sua uscita di scena
    VAR fifthCharEndingDialogue = 0    

    //Variabile per il tempo di attesa tra una lettera e l'altra
    VAR fifthWritingPause = 0
    VAR fifthWritingPauseDuration = 5    
    
    //STATI UP: ???
    //STATI DOWN: ???
    VAR fifthPurple = 0
    VAR fifthYellow = 0
    VAR fifthBlue = 0
    VAR fifthGreen = 0
    VAR fifthRed = 0
    



//Funzione di traduzione da variabile a stringa con articolo minuscolo
=== function lowercaseTranslator(characterState)
    {characterState:

    //Personaggia Uno
        - Chitarra:
            ~ return "Chitarra"
        - Triangolo:
            ~ return "Triangolo"
        - RagazzaOrchestra:
            ~ return "Orchestra"
        - FlautoDolce:
            ~ return "Flauto Dolce"
        - Ocarina:
            ~ return "Ocarina"
        - Violino:
            ~ return "Violino"
        
    //Personaggia Due       
        - IlRiccio:
            ~ return "il Riccio"
        - IlGrizzly:
            ~ return "il Grizzly"
        - IlLupo:
            ~ return "il Lupo"
        - IlDelfino:
            ~ return "il Delfino"
        - IlCapibara:
            ~ return "il Capibara"
        - IlCorvo:
            ~ return "il Corvo"
            
    //Personaggia Tre
        - SpettroDelVuoto:
            ~ return "il Empty"
        - IlConsapevole: 
            ~ return "il Consapevole"
        - IlGuarente: 
            ~ return "il Guarente"    
        - IlSocievole: 
            ~ return "il Socievole"
        - IlTerrorizzato: 
            ~ return "il Terrorizzato"
        - LAbbandonato: 
            ~ return "l'Abbandonato"    
        - LArrabbiato: 
            ~ return "l'Arrabbiato"

    //Personaggia Quattro             
        - LaMondatrice:
            ~ return "la Mondatrice"

    //Personaggia Cinque        
        - IlMentore:
            ~ return "la Mentore"

    }

//Funzione di traduzione da variabile a stringa con articolo maiuscolo
=== function uppercaseTranslator(characterState)
    {characterState:
    
    //Personaggia Uno
        - Chitarra:
            ~ return "Chitarra"
        - Triangolo:
            ~ return "Triangolo"
        - RagazzaOrchestra:
            ~ return "Orchestra"
        - FlautoDolce:
            ~ return "Flauto Dolce"
        - Ocarina:
            ~ return "Ocarina"
        - Violino:
            ~ return "Violino"

    //Personaggia Due       
        - IlRiccio:
            ~ return "Riccio"
        - IlGrizzly:
            ~ return "Grizzly"
        - IlLupo:
            ~ return "Lupo"
        - IlDelfino:
            ~ return "Delfino"
        - IlCapibara:
            ~ return "Capibara"
        - IlCorvo:
            ~ return "Corvo"

    //Personaggia Tre
        - SpettroDelVuoto:
            ~ return "Il Empty"
        - IlConsapevole: 
            ~ return "Il Consapevole"
        - IlGuarente: 
            ~ return "Il Guarente"    
        - IlSocievole: 
            ~ return "Il Socievole"
        - IlTerrorizzato: 
            ~ return "Il Terrorizzato"
        - LAbbandonato: 
            ~ return "L'Abbandonato"    
        - LArrabbiato: 
            ~ return "L'Arrabbiato"            
    
    //Personaggia Quattro        
        - LaMondatrice:
            ~ return "La Mondatrice"

    //Personaggia Cinque        
        - IlMentore:
            ~ return "Mentore"

    }



