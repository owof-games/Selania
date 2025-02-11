//Variabili legate alle personagge
//Con nuova versione: NotStarted non riguarda più la storia principale, ma l'accesso alla personaggia
    LIST storyStates = NotStarted, Active, Ended
    VAR minStoryQuesTCount = 7
//COME PROMEMORIA. LISTA DI TIPI DI TONO CHE POSSIAMO TENERE IN UNA CONVERSAZIONE: ROSSO (RABBIA, PASSIONE, AZIONE, OPPOSIZIONE). VIOLA (SPIRITUALITA', VISIONE DEL GRANDE SCHEMA DELLE COSE, SGUARDO POETICO, TESA VERSO UNA MISSIONE). GIALLO (GIOCOSITA', RISATA, DIVERTIMENTO, FANCIULLEZZA). VERDE (CUORE, AFFETTI, CURA DELLE PERSONE CARE, RIFLESSIONE EMOTIVA). BLU (RAZIONALITA', CALCOLO, VISIONE PRATICA, DISCIPLINA).

//Gestione prima personaggia.
//Ordine degli stati: 0, Blue, Rosso, Verde, Giallo, Viola.
    LIST firstCharacterPossibleStates = Rinuncia, Triangolo, RagazzaOrchestra, FlautoDolce, Ocarina, Violino
    VAR firstCharacterState = Rinuncia
    
    VAR firstStory = NotStarted
    VAR firstStoryQuestCount = 0
    VAR firstCharacterSpecialEvent = false
    
    //Variabile per il countdown per la sua uscita di scena
    VAR firstCharEndingDialogue = 0
    //Variabili per mettere in pausa la conversazione
    VAR firstPauseTalking = 0
    VAR firstCharPauseDurantion = 3
    
    //STATI UP: Viola e Giallo.
    //STATI DOWN: Blu.
    VAR firstPurple = 0
    VAR firstYellow = 0
    VAR firstBlue = 0
    VAR firstGreen = 0
    VAR firstRed = 0
    

//Gestione seconda personaggia.
    LIST secondCharacterPossibleStates = LaVegliante, NuovoStatoUnoDue, NuovoStatoDueDue, NuovoStatoTreDue
    VAR secondCharacterState = LaVegliante
    
    VAR secondStory = NotStarted
    VAR secondCharacterSpecialEvent = false


//Gestione terza personaggia
    LIST thirdCharacterPossibleStates = SpettroDelVuoto, LArrabbiato, IlGuarente, IlTerrorizzato, LAbbandonato, IlSocievole, IlConsapevole
    VAR thirdCharacterState = SpettroDelVuoto
    
    VAR thirdStory = NotStarted
    VAR thirdCharacterSpecialEvent = false
    
        
    VAR terrore = 0
    VAR abbandono = 0
    VAR rabbia = 0
    
    VAR ferito = 0
    VAR socievole = 0   
    VAR consapevole = 0


//Gestione quarta personaggia
    LIST fourthCharacterPossibleStates = LaMondatrice, NuovoStatoUnoQuattro, NuovoStatoDueQuattro, NuovoStatoTreQuattro
    VAR fourthCharacterState = LaMondatrice
    
    VAR fourthStory = NotStarted
    VAR fourthCharacterSpecialEvent = false

//Gestione quinta personaggia
    LIST fifthCharacterPossibleStates = Oscar, NuovoStatoUnoCinque, NuovoStatoDueCinque, NuovoStatoTreCinque
    VAR fifthCharacterState = Oscar
    
    VAR fifthStory = NotStarted
    VAR fifthCharacterSpecialEvent = false

//Gestione sesta personaggia
    LIST sixthCharacterPossibleStates = LoSpecchio, NuovoStatoUnoSei, NuovoStatoDueSei, NuovoStatoTreSei
    VAR sixthCharacterState = LoSpecchio
    
    VAR sixthStory = NotStarted
    VAR sixthCharacterSpecialEvent = false


//Gestione settima personaggia
    LIST seventhCharacterPossibleStates= IlMentore, NuovoStatoUnoSette, NuovoStatoDueSette, NuovoStatoTreSette
    VAR seventhCharacterState= IlMentore
    
    VAR seventhStory = NotStarted
    VAR seventhCharacterSpecialEvent = false
    
    
    //STATI UP: Verde e Blu.
    //STATI DOWN: Rosso.
    VAR seventhPurple = 0
    VAR seventhYellow = 0
    VAR seventhBlue = 0
    VAR seventhGreen = 0
    VAR seventhRed = 0



//Funzione di traduzione da variabile a stringa con articolo minuscolo
=== function lowercaseTranslator(characterState)
    {characterState:

    //Personaggia Uno
        - Rinuncia:
            ~ return "Rinuncia"
        - Triangolo:
            ~ return "Triangolo"
        - RagazzaOrchestra:
            ~ return "Ragazza Orchestra"
        - FlautoDolce:
            ~ return "Flauto Dolce"
        - Ocarina:
            ~ return "Ocarina"
        - Violino:
            ~ return "Violino"
        
    //Personaggia Due       
        - LaVegliante:
            ~ return "la Vegliante"
            
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
            ~ return "il Mentore"

    }

//Funzione di traduzione da variabile a stringa con articolo maiuscolo
=== function uppercaseTranslator(characterState)
    {characterState:
    
    //Personaggia Uno
        - Rinuncia:
            ~ return "Rinuncia"
        - Triangolo:
            ~ return "Triangolo"
        - RagazzaOrchestra:
            ~ return "Ragazza Orchestra"
        - FlautoDolce:
            ~ return "Flauto Dolce"
        - Ocarina:
            ~ return "Ocarina"
        - Violino:
            ~ return "Violino"

    //Personaggia Due        
        - LaVegliante:
            ~ return "La Vegliante"

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

    //Personaggia Sette        
        - IlMentore:
            ~ return "Il Mentore"

    }



