//Spazio dove caricare temporaneamente quale livello di inchiostro stiamo controllando
    VAR Ink = ()

//Stato inchiostro
    LIST ink_possibileLevels = ink_empty, ink_low, ink_normal, ink_medium, ink_high
    VAR firstChar_InkLevel = ink_empty
    VAR secondChar_InkLevel = ink_empty
    VAR thirdChar_InkLevel = ink_empty
    VAR fourthChar_InkLevel = ink_empty
    VAR fifthChar_InkLevel = ink_empty


=== function fromRelationshipToInk(Relationship)
//Chiamo questa funzione quando sto per partire con la riscrittura, in modo da aggiornare il valore di inchiostro in base alla relazione sviluppata
{debug: passo da fromRelationshipToInk.}

    {
        - Relationship == firstCharStateRelationship:
            ~ Ink = firstChar_InkLevel
        
        - Relationship == secondCharStateRelationship:
            ~ Ink = secondChar_InkLevel
        
        - Relationship == thirdCharStateRelationship:
            ~ Ink = thirdChar_InkLevel
            
        - Relationship == fourthCharStateRelationship:
            ~ Ink = fourthChar_InkLevel
        
        - Relationship == fifthCharStateRelationship:
            ~ Ink = fifthChar_InkLevel    
            
    }
    
    {
    
        - Relationship == 0:
            {debug: il valore di relazione è 0, e quindi non aumento il valore dell'inchiostro. {Relationship}, {Ink}.}
            
        - Relationship == 1:
            ~ Ink ++
            {debug: il valore di relazione è 1, e quindi aumento il valore dell'inchiostro. {Relationship}, {Ink}.}
            
        - Relationship == 2:
            ~ Ink ++
            ~ Ink ++
            {debug: il valore di relazione è 2, e quindi aumento il valore dell'inchiostro. {Relationship}, {Ink}.}
               
    }
    




//Formula chiamata prima dello statement, per tenere conto del rapporto effettivo.
=== function inkLevel(InkLevel)
{debug: passo da inkLevel.}

    {
        - InkLevel == firstChar_InkLevel:
            ~ Ink = firstChar_InkLevel
        
        - InkLevel == secondChar_InkLevel:
            ~ Ink = secondChar_InkLevel
        
        - InkLevel == thirdChar_InkLevel:
            ~ Ink = thirdChar_InkLevel
            
        - InkLevel == fourthChar_InkLevel:
            ~ Ink = fourthChar_InkLevel
        
        - InkLevel == fifthChar_InkLevel:
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
                    - InkLevel == firstChar_InkLevel:
                        ~ firstCharacterSpecialEvent = true
                    
                    - InkLevel == secondChar_InkLevel:
                        ~ secondCharacterSpecialEvent = true
                    
                    - InkLevel == thirdChar_InkLevel:
                        ~ thirdCharacterSpecialEvent = true
                    
                    - InkLevel == fourthChar_InkLevel:
                        ~ fourthCharacterSpecialEvent = true
                    
                    - InkLevel == fifthChar_InkLevel:
                        ~ fifthCharacterSpecialEvent = true    
                }
                
        - else:
            <i>Errore: non riesco a capire quante azioni hai a disposizione.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    }


//Funzione che chiamo dopo il dono, per dire quanto inchiostro ho guadagnato.
=== function inkTranslator(InkLevel)
    {
        - InkLevel == firstChar_InkLevel:
            ~ Ink = firstChar_InkLevel
        
        - InkLevel == secondChar_InkLevel:
            ~ Ink = secondChar_InkLevel
    
        - InkLevel == thirdChar_InkLevel:
            ~ Ink = thirdChar_InkLevel
        
        - InkLevel == fourthChar_InkLevel:
            ~ Ink = fourthChar_InkLevel
        
        - InkLevel == fifthChar_InkLevel:
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
