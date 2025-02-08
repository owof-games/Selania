//Variabili legate alle personagge
//Con nuova versione: NotStarted non riguarda più la storia principale, ma l'accesso alla personaggia
    LIST storyStates = NotStarted, Active, Ended
    VAR minStoryQuesTCount = 8
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



//Check per avvio e chiusura storia personagge
=== story_time_management_for_PNG

{
//Dopo dieci spostamenti, compare il personaggio uno
    - movementsCounter == 5 && firstStory == NotStarted:
            ~ move_entity(FirstCharacter, BusStop)
            ~ firstStory = Active
            
//Finita la storia col personaggio uno ho resettato il counter, e dopo dieci spostamenti compaiono il personaggio due e tre.        
    - movementsCounter == 5 && firstStory == Ended && secondStory == NotStarted:
            ~ move_entity(SecondCharacter, BusStop)    
            ~ secondStory = Active
            
    - movementsCounter == 5 && firstStory == Ended && thirdStory == NotStarted:
            ~ move_entity(ThirdCharacter, BusStop)    
            ~ thirdStory = Active
            
//I reset ci sono solo a fine di una storia. Per cui per creare un po' di delay con la comparsa del quarto personaggio, aumento solo il valoure del movementsCounter
    - movementsCounter == 20 && firstStory == Ended && fourthStory == NotStarted:
        //Ma magari questo spettro vuole comparire altrove
            ~ move_entity(FourthCharacter, BusStop)
            ~ fourthStory = Active
            
//Ora l'idea è che le altre storie si aprano sempre con un certo delay, ma non posso sapere quale delle tre precedenti verrà affrontata prima o dopo dalla giocatrice.
//Una idea può essere: fare in modo che 5 compaia quando una delle tre storie intermedie sia conclusa, 6 quando due son concluse, 7 quando tutte son state concluse.
//Quindi il counter non serve più a nulla.
    - fifthStory == NotStarted && secondStory == Ended or thirdStory == Ended or fourthStory == Ended:
                ~ move_entity(FifthCharacter, BusStop)
                ~ fifthStory = Active
                
    - sixthStory == NotStarted && (secondStory == Ended && thirdStory == Ended) or (secondStory == Ended && fourthStory == Ended) or (thirdStory == Ended && fourthStory == Ended):
                ~ move_entity(SixthCharacter, BusStop)    
                ~ sixthStory = Active
                
    - seventhStory == NotStarted && secondStory == Ended && thirdStory == Ended && fourthStory == Ended:
                ~ move_entity(SeventhCharacter, BusStop)    
                ~ seventhStory = Active

//Check per l'allontanamento delle personagge
    - firstStory == Ended && movementsCounter > 10:
        ~ move_entity(FirstCharacter, Safekeeping)
        ~ move_entity(FirstCharacterNotes, BusStop)
        
    - secondStory == Ended && movementsCounter > 10:
        ~ move_entity(SecondCharacter, Safekeeping)
        ~ move_entity(SecondCharacterNotes, BusStop)
        
    - thirdStory == Ended && movementsCounter > 10:
        ~ move_entity(ThirdCharacter, Safekeeping)
        ~ move_entity(ThirdCharacterNotes, BusStop)
        
    - fourthStory == Ended && movementsCounter > 10:
        ~ move_entity(FourthCharacter, Safekeeping)
        ~ move_entity(FourthCharacterNotes, BusStop)
        
    - fifthStory == Ended && movementsCounter > 10:
        ~ move_entity(FifthCharacter, Safekeeping)
        ~ move_entity(FifthCharacterNotes, BusStop)
        
    - sixthStory == Ended && movementsCounter > 10:
        ~ move_entity(SixthCharacter, Safekeeping)
        ~ move_entity(SixthCharacterNotes, BusStop)
        
    - seventhStory == Ended && movementsCounter > 10:
        ~ move_entity(SeventhCharacter, Safekeeping)
        ~ move_entity(SeventhCharacterNotes, BusStop)        
                                
}

->->

//La logica è: se entrambi i valori che apprezza personaggia uno sono maggiori di quelli che detesta, a quel punto prendo due punti affinità. Se uno dei due soltanto è maggiore, un punto affinità. Altrimenti non prendo nulla.
=== firstAffinityCalc ===
    {
        - firstPurple && firstYellow > firstBlue:
            ~ firstCharacterInkLevel ++
            ~ firstCharacterInkLevel ++
                ->->
        - firstPurple or firstYellow > firstBlue:
            ~ firstCharacterInkLevel ++
                ->->
    }

->->

//Settaggio nome quando partiamo con la discussione
=== firstNaming ===
    {
        - (firstBlue > firstGreen) && (firstBlue > firstRed) && (firstBlue > firstYellow) && (firstBlue > firstPurple):
            ~ firstCharacterPossibleStates += Triangolo
                ->->
                
        - (firstRed > firstGreen) && (firstRed > firstBlue) && (firstRed > firstYellow) && (firstRed > firstPurple):
            ~ firstCharacterPossibleStates += RagazzaOrchestra
                ->->
                
        - (firstGreen > firstBlue) && (firstGreen > firstRed) && (firstGreen > firstYellow) && (firstGreen > firstPurple):
            ~ firstCharacterPossibleStates += FlautoDolce    
                ->->
                
        - (firstYellow > firstGreen) && (firstYellow > firstRed) && (firstYellow > firstBlue) && (firstYellow > firstPurple):
            ~ firstCharacterPossibleStates += Ocarina   
                ->->
                
        - (firstPurple > firstGreen) && (firstPurple > firstRed) && (firstPurple > firstYellow) && (firstPurple > firstBlue):
            ~ firstCharacterPossibleStates += Violino    
                ->->
                
        - else:
            ~ firstCharacterPossibleStates += Rinuncia 
            ->->
                
    }

->->