//Spazio dove caricare temporaneamente quale livello di inchiostro stiamo controllando
    
    VAR Ink = ()

//Stato inchiostro
    LIST ink = Empty, Low, Normal, Medium, High
    VAR firstCharacterInkLevel = Empty
    VAR secondCharacterInkLevel = Empty
    VAR thirdCharacterInkLevel = Empty
    VAR fourthCharacterInkLevel = Empty
    VAR fifthCharacterInkLevel = Empty





=== function fromRelationshipToInk(Relationship)
{debug: passo da fromRelationshipToInk.}

    {
        - Relationship == firstCharStateRelationship:
            ~ Ink = firstCharacterInkLevel
        
        - Relationship == secondCharStateRelationship:
            ~ Ink = secondCharacterInkLevel
        
        - Relationship == thirdCharStateRelationship:
            ~ Ink = thirdCharacterInkLevel
            
        - Relationship == fourthCharStateRelationship:
            ~ Ink = fourthCharacterInkLevel
        
        - Relationship == fifthCharStateRelationship:
            ~ Ink = fifthCharacterInkLevel    
            
    }
    
    {
    
        - Relationship == 0:
            {debug: il valore di relazione è 0, e quindi non aumento il valore dell'inchiostro. {Relationship}, {Ink}.}
            ->->
            
        - Relationship == 1:
            ~ Ink ++
            {debug: il valore di relazione è 1, e quindi aumento il valore dell'inchiostro. {Relationship}, {Ink}.}
            ->->
            
        - Relationship == 2:
            ~ Ink ++
            ~ Ink ++
            {debug: il valore di relazione è 2, e quindi aumento il valore dell'inchiostro. {Relationship}, {Ink}.}
            ->->    
    }


->->




//Formula chiamata prima dello statement, per tenere conto del rapporto effettivo.
=== function inkLevel(InkLevel)
{debug: passo da inkLevel.}

    {
        - InkLevel == firstCharacterInkLevel:
            ~ Ink = firstCharacterInkLevel
        
        - InkLevel == secondCharacterInkLevel:
            ~ Ink = secondCharacterInkLevel
        
        - InkLevel == thirdCharacterInkLevel:
            ~ Ink = thirdCharacterInkLevel
            
        - InkLevel == fourthCharacterInkLevel:
            ~ Ink = fourthCharacterInkLevel
        
        - InkLevel == fifthCharacterInkLevel:
            ~ Ink = fifthCharacterInkLevel    
            
    }

    {Ink:
        - Empty:
            Dopo il dono consegnato e il rapporto creato, {name} si ritrova senza inchiostro. Potrà fare solo la riscrittura garantita.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        - Low:
            Dopo il dono consegnato e il rapporto creato, {name} ha una goccia di inchiostro a disposizione. Potrà fare la riscrittura garantita e un riscrittura extra.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        - Normal:
            Dopo il dono consegnato e il rapporto creato, {name} ha due goccie di inchiostro a disposizione. Potrà fare la riscrittura garantita e altri due riscritture extra.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        - Medium:
            Dopo il dono consegnato e il rapporto creato, {name} ha tre goccie di inchiostro a disposizione. Potrà fare la riscrittura garantita e altri tre riscritture extra.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}       
        - High:
            Dopo il dono consegnato e il rapporto creato, {name} ha quattro goccie di inchiostro a disposizione. Potrà fare la riscrittura garantita e altri tre riscritture extra. E riceverà un'informazione importante.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                {
                    - InkLevel == firstCharacterInkLevel:
                        ~ firstCharacterSpecialEvent = true
                    
                    - InkLevel == secondCharacterInkLevel:
                        ~ secondCharacterSpecialEvent = true
                    
                    - InkLevel == thirdCharacterInkLevel:
                        ~ thirdCharacterSpecialEvent = true
                    
                    - InkLevel == fourthCharacterInkLevel:
                        ~ fourthCharacterSpecialEvent = true
                    
                    - InkLevel == fifthCharacterInkLevel:
                        ~ fifthCharacterSpecialEvent = true    
                }
                
        - else:
            <i>Errore: non riesco a capire quante azioni hai a disposizione.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
    }


//Funzione che chiamo dopo il dono, per dire quanto inchiostro ho guadagnato.
=== function inkTranslator(InkLevel)
    {
        - InkLevel == firstCharacterInkLevel:
            ~ Ink = firstCharacterInkLevel
        
        - InkLevel == secondCharacterInkLevel:
            ~ Ink = secondCharacterInkLevel
    
        - InkLevel == thirdCharacterInkLevel:
            ~ Ink = thirdCharacterInkLevel
        
        - InkLevel == fourthCharacterInkLevel:
            ~ Ink = fourthCharacterInkLevel
        
        - InkLevel == fifthCharacterInkLevel:
            ~ Ink = fifthCharacterInkLevel            
    
    }
    
    {Ink:
        - Empty:
            non hai guadagnato alcuna goccia di inchiostro#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        - Low:
            hai guadagnato una goccia di inchiostro#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        - Normal:
            hai guadagnato due goccie di inchiostro#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        - Medium:
            hai guadagnato tre goccie di inchiostro a disposizione#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}     
        
        - High:
            hai guadagnato tre goccie di inchiostro a disposizione, e la personaggia ti darà una informazione importante#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        - else:
            <i>Errore: non riesco a capire quante azioni hai a disposizione.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
            {debug: <i>Il livello di inchiostro per la prima personaggia è {firstCharacterInkLevel}}
    
    }
