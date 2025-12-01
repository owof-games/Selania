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
            Dopo le molte parole spese <>
            {
                - FirstCharacter:
                    con {translator(firstChar_ActualName)}<>
                    {
                        - firstChar_giftedObject != (): e il dono consegnato
                    }
                - SecondCharacter:
                    con {translator(secondChar_ActualName)}<>
                    {
                        - secondChar_giftedObject != (): e il dono consegnato
                    }
                - ThirdCharacter:
                    con {translator(thirdChar_ActualName)}<>
                    {
                        - thirdChar_giftedObject != (): e il dono consegnato
                    }
                - FourthCharacter:
                   con {translator(fourthChar_ActualName)}<>
                    {
                        - fourthChar_giftedObject != (): e il dono consegnato
                    }
                - FifthCharacter:
                    con {translator(fifthChar_ActualName)}<>
                    {
                        - fifthChar_giftedObject != (): e il dono consegnato
                    }
            }
            ,{player_name} si ritrova {player_pronouns has him:privo|{player_pronouns has her:priva|privə}} di inchiostro. Potrà solo usare il potere dell'epilogo.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        - ink_low:
            Dopo le molte parole spese <>
            {
                - FirstCharacter:
                    con {translator(firstChar_ActualName)}<>
                    {
                        - firstChar_giftedObject != (): e il dono consegnato
                    }
                - SecondCharacter:
                    con {translator(secondChar_ActualName)}<>
                    {
                        - secondChar_giftedObject != (): e il dono consegnato
                    }
                - ThirdCharacter:
                    con {translator(thirdChar_ActualName)}<>
                    {
                        - thirdChar_giftedObject != (): e il dono consegnato
                    }
                - FourthCharacter:
                   con {translator(fourthChar_ActualName)}<>
                    {
                        - fourthChar_giftedObject != (): e il dono consegnato
                    }
                - FifthCharacter:
                    con {translator(fifthChar_ActualName)}<>
                    {
                        - fifthChar_giftedObject != (): e il dono consegnato
                    }
            }
            ,{player_name} ha a disposizione una goccia di inchiostro. Potrà compiere una riscrittura e usare il potere dell'epilogo.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        - ink_normal:
           Dopo le molte parole spese <>
            {
                - FirstCharacter:
                    con {translator(firstChar_ActualName)}<>
                    {
                        - firstChar_giftedObject != (): e il dono consegnato
                    }
                - SecondCharacter:
                    con {translator(secondChar_ActualName)}<>
                    {
                        - secondChar_giftedObject != (): e il dono consegnato
                    }
                - ThirdCharacter:
                    con {translator(thirdChar_ActualName)}<>
                    {
                        - thirdChar_giftedObject != (): e il dono consegnato
                    }
                - FourthCharacter:
                   con {translator(fourthChar_ActualName)}<>
                    {
                        - fourthChar_giftedObject != (): e il dono consegnato
                    }
                - FifthCharacter:
                    con {translator(fifthChar_ActualName)}<>
                    {
                        - fifthChar_giftedObject != (): e il dono consegnato
                    }
            }
            ,{player_name} ha a disposizione due gocce di inchiostro. Potrà compiere due riscritture e usare il potere dell'epilogo.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        - ink_medium:
            Dopo le molte parole spese <>
            {
                - FirstCharacter:
                    con {translator(firstChar_ActualName)}<>
                    {
                        - firstChar_giftedObject != (): e il dono consegnato
                    }
                - SecondCharacter:
                    con {translator(secondChar_ActualName)}<>
                    {
                        - secondChar_giftedObject != (): e il dono consegnato
                    }
                - ThirdCharacter:
                    con {translator(thirdChar_ActualName)}<>
                    {
                        - thirdChar_giftedObject != (): e il dono consegnato
                    }
                - FourthCharacter:
                   con {translator(fourthChar_ActualName)}<>
                    {
                        - fourthChar_giftedObject != (): e il dono consegnato
                    }
                - FifthCharacter:
                    con {translator(fifthChar_ActualName)}<>
                    {
                        - fifthChar_giftedObject != (): e il dono consegnato
                    }
            }
            ,{player_name} ha a disposizione tre gocce di inchiostro. Potrà compiere tre riscritture e usare il potere dell'epilogo.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}       
        - ink_high:
            Dopo le molte parole spese <>
            {
                - FirstCharacter:
                    con {translator(firstChar_ActualName)}<>
                    {
                        - firstChar_giftedObject != (): e il dono consegnato
                    }
                - SecondCharacter:
                    con {translator(secondChar_ActualName)}<>
                    {
                        - secondChar_giftedObject != (): e il dono consegnato
                    }
                - ThirdCharacter:
                    con {translator(thirdChar_ActualName)}<>
                    {
                        - thirdChar_giftedObject != (): e il dono consegnato
                    }
                - FourthCharacter:
                   con {translator(fourthChar_ActualName)}<>
                    {
                        - fourthChar_giftedObject != (): e il dono consegnato
                    }
                - FifthCharacter:
                    con {translator(fifthChar_ActualName)}<>
                    {
                        - fifthChar_giftedObject != (): e il dono consegnato
                    }
            }
            ,{player_name} ha a disposizione quattro gocce di inchiostro. Potrà compiere quattro riscritture e usare il potere dell'epilogo. E riceverà un'informazione importante.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
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
            non ha raccolto alcuna goccia di inchiostro#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        - ink_low:
            ha raccolto una goccia di inchiostro#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        - ink_normal:
            ha raccolto due gocce di inchiostro#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        - ink_medium:
            ha raccolto tre gocce di inchiostro#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}     
        
        - ink_high:
            ha raccolto tre gocce di inchiostro, e col tempo riceverà da <>
                {Character:
                    - FirstCharacter:
                        {translator(firstChar_ActualName)} <>
                    
                    - SecondCharacter:
                        {translator(secondChar_ActualName)} <>
                
                    - ThirdCharacter:
                        {translator(thirdChar_ActualName)} <>
                    
                    - FourthCharacter:
                        {translator(fourthChar_ActualName)} <>
                    
                    - FifthCharacter:
                        {translator(fifthChar_ActualName)} <>

                }
                una informazione importante.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
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
            nessuna goccia di inchiostro.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        - ink_low:
            una goccia di inchiostro.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        - ink_normal:
            due gocce di inchiostro.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        - ink_medium:
            tre gocce di inchiostro.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}     
        
        - ink_high:
            quattro gocce di inchiostro, e una informazione importante.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        - else:
            <i>Errore: non riesco a capire quante azioni hai a disposizione.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            {debug: <i>Il livello di inchiostro per la prima personaggia è {firstChar_InkLevel}}
    
    }
