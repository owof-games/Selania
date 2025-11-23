//Spazio dove caricare temporaneamente quale livello di inchiostro stiamo controllando
    VAR Ink = ()

//Stato inchiostro
    LIST ink_possibileLevels = ink_empty, ink_low, ink_normal, ink_medium, ink_high
    VAR firstChar_InkLevel = ink_empty
    VAR secondChar_InkLevel = ink_empty
    VAR thirdChar_InkLevel = ink_empty
    VAR fourthChar_InkLevel = ink_empty
    VAR fifthChar_InkLevel = ink_empty
    
//Registro anche il massimo di inchiostro raggiunto per ogni PNG, sia per statistica che per il diario.
    VAR firstChar_maximum_inkLevel = ink_empty
    VAR secondChar_maximum_inkLevel = ink_empty
    VAR thirdChar_maximum_inkLevel = ink_empty
    VAR fourthChar_maximum_inkLevel = ink_empty
    VAR fifthChar_maximum_inkLevel = ink_empty
    
=== function fromRelationshipToInk(Character)
/*
{character:
    - FirstCharacter:
        ~ Character = firstChar_relationshipStatus
        ~ Ink = firstChar_InkLevel
    - SecondCharacter:
        ...
}
Il secondo IF rimane com'è
*/
//Chiamo questa funzione quando sto per partire con la riscrittura, in modo da aggiornare il valore di inchiostro in base alla relazione sviluppata
{debug: passo da fromRelationshipToInk.}

    {Character:
        - FirstCharacter:
            ~ Character = firstChar_relationshipStatus
            ~ Ink = firstChar_InkLevel
        
        - SecondCharacter:
            ~ Character = secondChar_relationshipStatus
            ~ Ink = secondChar_InkLevel
        
        - ThirdCharacter:
            ~ Character = thirdChar_relationshipStatus
            ~ Ink = thirdChar_InkLevel
            
        - FourthCharacter:
            ~ Character = fourthChar_relationshipStatus
            ~ Ink = fourthChar_InkLevel
        
        - FifthCharacter:
            ~ Character = fifthChar_relationshipStatus
            ~ Ink = fifthChar_InkLevel    
            
    }
    
    {
    
        - Character == 0:
            {debug: il valore di relazione è 0, e quindi non aumento il valore dell'inchiostro. {Character}, {Ink}.}
            
        - Character == 1:
            ~ Ink ++
            {debug: il valore di relazione è 1, e quindi aumento il valore dell'inchiostro. {Character}, {Ink}.}
            
        - Character == 2:
            ~ Ink ++
            ~ Ink ++
            {debug: il valore di relazione è 2, e quindi aumento il valore dell'inchiostro. {Character}, {Ink}.}
               
    }
    




//Formula chiamata prima dello statement, per tenere conto del rapporto effettivo.
=== function inkLevel(Character)
{debug: passo da inkLevel.}

    {Character:
    
        - FirstCharacter:
            ~ Ink = firstChar_InkLevel

        - SecondCharacter:
            ~ Ink = secondChar_InkLevel

        - ThirdCharacter:
            ~ Ink = thirdChar_InkLevel
            
        - FourthCharacter:
            ~ Ink = fourthChar_InkLevel
        
        - FifthCharacter:
            ~ Ink = fifthChar_InkLevel 
            
    }

    {Ink:
        - ink_empty:
            Dopo il dono consegnato e il rapporto creato, {player_name} si ritrova senza inchiostro. Potrà fare solo la riscrittura garantita.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        - ink_low:
            Dopo il dono consegnato e il rapporto creato, {player_name} ha una goccia di inchiostro a disposizione. Potrà fare la riscrittura garantita e un riscrittura extra.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        - ink_normal:
            Dopo il dono consegnato e il rapporto creato, {player_name} ha due goccie di inchiostro a disposizione. Potrà fare la riscrittura garantita e altri due riscritture extra.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        - ink_medium:
            Dopo il dono consegnato e il rapporto creato, {player_name} ha tre goccie di inchiostro a disposizione. Potrà fare la riscrittura garantita e altri tre riscritture extra.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}       
        - ink_high:
            Dopo il dono consegnato e il rapporto creato, {player_name} ha quattro goccie di inchiostro a disposizione. Potrà fare la riscrittura garantita e altri tre riscritture extra. E riceverà un'informazione importante.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                {
                    - Character == FirstCharacter:
                        ~ firstChar_specialEvent = true
                    
                    - Character == SecondCharacter:
                        ~ secondChar_specialEvent = true
                    
                    - Character == ThirdCharacter:
                        ~ thirdChar_specialEvent = true
                    
                    - Character == FourthCharacter:
                        ~ fourthChar_specialEvent = true
                    
                    - Character == FifthCharacter:
                        ~ fifthChar_specialEvent = true    
                }
                
        - else:
            <i>Errore: non riesco a capire quante azioni hai a disposizione.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    }

//Formula chiamata prima dello statement, per tenere conto del rapporto effettivo.
=== function maxInkLevelUpdater(Character)
{debug: passo da maxInkLevelUpdater.}

    {Character:
        - FirstCharacter:
            ~ firstChar_maximum_inkLevel = firstChar_InkLevel
        
        - SecondCharacter:
            ~ secondChar_maximum_inkLevel = secondChar_InkLevel
        
        - ThirdCharacter:
            ~ thirdChar_maximum_inkLevel = thirdChar_InkLevel
            
        - FourthCharacter:
            ~ fourthChar_maximum_inkLevel = fourthChar_InkLevel
        
        - FifthCharacter:
            ~ fifthChar_maximum_inkLevel = fifthChar_InkLevel
            
    }
    
 

//Funzione che chiamo dopo il dono, per dire quanto inchiostro ho guadagnato.
=== function inkTranslator(Character)
    {Character:
        - FirstCharacter:
            ~ Ink = firstChar_InkLevel
        
        - SecondCharacter:
            ~ Ink = secondChar_InkLevel
    
        - ThirdCharacter:
            ~ Ink = thirdChar_InkLevel
        
        - FourthCharacter:
            ~ Ink = fourthChar_InkLevel
        
        - FifthCharacter:
            ~ Ink = fifthChar_InkLevel            
    
    }
    
    {Ink:
        - ink_empty:
            non hai guadagnato alcuna goccia di inchiostro#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        - ink_low:
            hai guadagnato una goccia di inchiostro#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        - ink_normal:
            hai guadagnato due goccie di inchiostro#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        - ink_medium:
            hai guadagnato tre goccie di inchiostro a disposizione#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}     
        
        - ink_high:
            hai guadagnato tre goccie di inchiostro a disposizione, e la personaggia ti darà una informazione importante#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        - else:
            <i>Errore: non riesco a capire quante azioni hai a disposizione.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            {debug: <i>Il livello di inchiostro per la prima personaggia è {firstChar_InkLevel}}
    
    }


//Funzione che chiamo dopo il dono, per dire quanto inchiostro ho guadagnato.
=== function fromInkToNumbers(InkLevel)
    {
        - InkLevel == firstChar_maximum_inkLevel:
            ~ Ink = firstChar_maximum_inkLevel
        
        - InkLevel == secondChar_maximum_inkLevel:
            ~ Ink = secondChar_maximum_inkLevel
    
        - InkLevel == thirdChar_maximum_inkLevel:
            ~ Ink = thirdChar_maximum_inkLevel
        
        - InkLevel == fourthChar_maximum_inkLevel:
            ~ Ink = fourthChar_maximum_inkLevel
        
        - InkLevel == fifthChar_maximum_inkLevel:
            ~ Ink = fifthChar_maximum_inkLevel            
    
    }
    
    {Ink:
        - ink_empty:
            nessun boccettino di inchiostro.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        - ink_low:
            un boccettino di inchiostro.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        - ink_normal:
            due boccettini di inchiostro.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        - ink_medium:
            tre boccettini di inchiostro.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}     
        
        - ink_high:
            quattro boccettini di inchiostro, e una informazione importante.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        - else:
            <i>Errore: non riesco a capire quante azioni hai a disposizione.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            {debug: <i>Il livello di inchiostro per la prima personaggia è {firstChar_InkLevel}}
    
    }
