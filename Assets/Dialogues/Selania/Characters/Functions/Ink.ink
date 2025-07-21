//Spazio dove caricare temporaneamente quale livello di inchiostro stiamo controllando
    
    VAR Ink = ()

//Stato inchiostro
    LIST ink = Empty, Low, Normal, Medium, High
    VAR firstCharacterInkLevel = Empty
    VAR secondCharacterInkLevel = Empty
    VAR thirdCharacterInkLevel = Empty
    VAR fourthCharacterInkLevel = Empty
    VAR fifthCharacterInkLevel = Empty


//Formula chiamata prima dello statement, per tenere conto del rapporto effettivo.
=== function inkLevel(InkLevel)
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
            <i>Dopo il dono consegnato e il rapporto creato, {name} si ritrova senza inchiostro. Potrà fare solo l'intervento garantito.</i> #speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {fungus_state()}
        - Low:
            <i>Dopo il dono consegnato e il rapporto creato, {name} ha una goccia di inchiostro a disposizione. Potrà fare l'intervento garantito e un intervento extra.</i> #speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {fungus_state()}
        - Normal:
            <i>Dopo il dono consegnato e il rapporto creato, {name} ha due goccie di inchiostro a disposizione. Potrà fare l'intervento garantito e altri due interventi extra.</i> #speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {fungus_state()}
        - Medium:
            <i>Dopo il dono consegnato e il rapporto creato, {name} ha tre goccie di inchiostro a disposizione. Potrà fare l'intervento garantito e altri tre interventi extra.</i>  #speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {fungus_state()}       
        - High:
            <i>Dopo il dono consegnato e il rapporto creato, {name} ha quattro goccie di inchiostro a disposizione. Potrà fare l'intervento garantito e altri tre interventi extra. E riceverà un'informazione importante.</i> #speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {fungus_state()}
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
            <i>Errore: non riesco a capire quante azioni hai a disposizione.</i>
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
            non hai guadagnato alcuna goccia di inchiostro #speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
        
        - Low:
            hai guadagnato una goccia di inchiostro #speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
        
        - Normal:
            hai guadagnato due goccie di inchiostro #speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
        
        - Medium:
            hai guadagnato tre goccie di inchiostro a disposizione #speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}     
        
        - High:
            hai guadagnato tre goccie di inchiostro a disposizione, e la personaggia ti darà una informazione importante #speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
        - else:
            <i>Errore: non riesco a capire quante azioni hai a disposizione.</i>
            {debug: <i>Il livello di inchiostro per la prima personaggia è {firstCharacterInkLevel}}
    
    }
