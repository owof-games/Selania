//Spazio dove caricare temporaneamente quale livello di inchiostro stiamo controllando
    VAR Ink = ()

//Stato inchiostro
    LIST ink_possibileLevels = (ink_empty), (ink_low), (ink_normal), (ink_medium), ink_high
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
//Chiamo questa funzione quando sto per partire con la riscrittura, in modo da aggiornare il valore di inchiostro in base alla relazione sviluppata
{debug: passo da fromRelationshipToInk.}

    {Character:
        - FirstCharacter:
                {
                    - firstChar_relationshipStatus == negative:
                        {debug: il valore di relazione è 0, e quindi non aumento il valore dell'inchiostro. {firstChar_relationshipStatus}.}
                        
                        
                    - firstChar_relationshipStatus == neutral:
                        ~ firstChar_InkLevel ++
                        {debug: il valore di relazione è 1, e quindi aumento il valore dell'inchiostro. {firstChar_relationshipStatus}.}
                        

                    - else:
                        ~ firstChar_InkLevel ++
                        ~ firstChar_InkLevel ++
                        {debug: il valore di relazione è 2, e quindi aumento il valore dell'inchiostro. {firstChar_relationshipStatus}.}
                        
                }
        
        - SecondCharacter:
                {
                    - secondChar_relationshipStatus == negative:
                        {debug: il valore di relazione è 0, e quindi non aumento il valore dell'inchiostro. {secondChar_relationshipStatus}, {Ink}.}
                        
                    - secondChar_relationshipStatus == neutral:
                        ~ secondChar_InkLevel ++
                        {debug: il valore di relazione è neutral, e quindi aumento il valore dell'inchiostro. {secondChar_relationshipStatus}, {Ink}.}
                        
                    - else:
                        ~ secondChar_InkLevel ++
                        ~ secondChar_InkLevel ++
                        {debug: il valore di relazione è 2, e quindi aumento il valore dell'inchiostro. {secondChar_relationshipStatus}, {Ink}.}
                        
                }            
                    
        - ThirdCharacter:
                {
                    - thirdChar_relationshipStatus == negative:
                        {debug: il valore di relazione è 0, e quindi non aumento il valore dell'inchiostro. {thirdChar_relationshipStatus}.}
                        {
                        - thirdChar_inkFirstRewriting_updated == false:
                            ~ thirdChar_inkFirstRewriting_updated = true
                        - else:
                            ~ thirdChar_inkFSecondRewriting_updated = true    
                        }    
                    - thirdChar_relationshipStatus == neutral:
                        ~ thirdChar_InkLevel ++
                        {debug: il valore di relazione è neutral, e quindi aumento il valore dell'inchiostro. {thirdChar_relationshipStatus}.}
                        {
                        - thirdChar_inkFirstRewriting_updated == false:
                            ~ thirdChar_inkFirstRewriting_updated = true
                            ~ thirdChar_inkFirstRewriting = 1
                        - else:
                            ~ thirdChar_inkFSecondRewriting_updated = true      
                        }
                    - else:
                        ~ thirdChar_InkLevel ++
                        ~ thirdChar_InkLevel ++
                        {debug: il valore di relazione è 2, e quindi aumento il valore dell'inchiostro. {thirdChar_relationshipStatus}.}
                        {
                        - thirdChar_inkFirstRewriting_updated == false:
                            ~ thirdChar_inkFirstRewriting_updated = true
                            ~ thirdChar_inkFirstRewriting = 2
                        - else:
                            ~ thirdChar_inkFSecondRewriting_updated = true      
                        }
                }            
            
        - FourthCharacter:
                {
                    - fourthChar_relationshipStatus == negative:
                        {debug: il valore di relazione è 0, e quindi non aumento il valore dell'inchiostro. {fourthChar_relationshipStatus}.}
                        
                    - fourthChar_relationshipStatus == neutral:
                        ~ fourthChar_InkLevel ++
                        {debug: il valore di relazione è neutral, e quindi aumento il valore dell'inchiostro. {fourthChar_relationshipStatus}.}
                        
                    - else:
                        ~ fourthChar_InkLevel ++
                        ~ fourthChar_InkLevel ++
                        {debug: il valore di relazione è neutral, e quindi aumento il valore dell'inchiostro. {fourthChar_relationshipStatus}.}
                        
                }            
        
        - FifthCharacter:
            {
                - fifthChar_relationshipStatus == negative:
                    {debug: il valore di relazione è 0, e quindi non aumento il valore dell'inchiostro. {fifthChar_relationshipStatus}.}
                    
                - fifthChar_relationshipStatus == neutral:
                    ~ fifthChar_InkLevel ++
                    {debug: il valore di relazione è 1, e quindi aumento il valore dell'inchiostro. {fifthChar_relationshipStatus}.}
                    
                - else:
                    ~ fifthChar_InkLevel ++
                    ~ fifthChar_InkLevel ++
                    {debug: il valore di relazione è 2, e quindi aumento il valore dell'inchiostro. {fifthChar_relationshipStatus}.}
                    
            }                
            
    }





//Formula chiamata prima dello statement, per tenere conto del rapporto effettivo.
=== function inkLevel(Character)
{debug: passo da inkLevel.}
 ~ temp ink_status = ink_empty

    {Character:
        - FirstCharacter:
            ~ ink_status = firstChar_InkLevel

        - SecondCharacter:
            ~ ink_status = secondChar_InkLevel

        - ThirdCharacter:
            ~ ink_status = thirdChar_InkLevel
            
        - FourthCharacter:
            ~ ink_status = fourthChar_InkLevel
        
        - FifthCharacter:
            ~ ink_status = fifthChar_InkLevel 
            
    }

    {ink_status:
        - ink_empty:
            {charTag(TheWitch, witch_state())}:   <i>E quindi.
            <i>Dopo le molte parole spese <>
            {
                - Character == FirstCharacter:
                    con {translator(firstChar_ActualName)} <>
                    {
                        - firstChar_giftedObject != (): e il dono consegnato<>
                    }
                - Character == SecondCharacter:
                    con {translator(secondChar_ActualName)} <>
                    {
                        - secondChar_giftedObject != (): e il dono consegnato<>
                    }
                - Character == ThirdCharacter:
                    con {translator(thirdChar_ActualName)} <>
                    {
                        - thirdChar_giftedObject != (): e il dono consegnato<>
                    }
                - Character == FourthCharacter:
                   con {translator(fourthChar_ActualName)} <>
                    {
                        - fourthChar_giftedObject != (): e il dono consegnato<>
                    }
                - Character == FifthCharacter:
                    con {translator(fifthChar_ActualName)} <>
                    {
                        - fifthChar_giftedObject != (): e il dono consegnato<>
                    }
            }
            , {player_name} si ritrova {player_pronoun has him:privo|{player_pronoun has her:priva|privə}} di inchiostro. 
            <i>Potrà solo usare il potere dell'epilogo.
        
        - ink_low:
            {charTag(TheWitch, witch_state())}:   <i>E quindi.
            <i>Dopo le molte parole spese <>
            {
                - Character == FirstCharacter:
                    con {translator(firstChar_ActualName)} <>
                    {
                        - firstChar_giftedObject != (): e il dono consegnato<>
                    }
                - Character == SecondCharacter:
                    con {translator(secondChar_ActualName)} <>
                    {
                        - secondChar_giftedObject != (): e il dono consegnato<>
                    }
                - Character == ThirdCharacter:
                    con {translator(thirdChar_ActualName)} <>
                    {
                        - thirdChar_giftedObject != (): e il dono consegnato<>
                    }
                - Character == FourthCharacter:
                   con {translator(fourthChar_ActualName)} <>
                    {
                        - fourthChar_giftedObject != (): e il dono consegnato<>
                    }
                - Character == FifthCharacter:
                    con {translator(fifthChar_ActualName)} <>
                    {
                        - fifthChar_giftedObject != (): e il dono consegnato<>
                    }
            }
            , {player_name} ha a disposizione una goccia di inchiostro.</i>
            <i>Potrà compiere una riscrittura e usare il potere dell'epilogo.</i>
        
        - ink_normal:
            {charTag(TheWitch, witch_state())}:   <i>E quindi.
           <i>Dopo le molte parole spese <>
            {
                - Character == FirstCharacter:
                    con {translator(firstChar_ActualName)} <>
                    {
                        - firstChar_giftedObject != (): e il dono consegnato<>
                    }
                - Character == SecondCharacter:
                    con {translator(secondChar_ActualName)} <>
                    {
                        - secondChar_giftedObject != (): e il dono consegnato<>
                    }
                - Character == ThirdCharacter:
                    con {translator(thirdChar_ActualName)} <>
                    {
                        - thirdChar_giftedObject != (): e il dono consegnato<>
                    }
                - Character == FourthCharacter:
                   con {translator(fourthChar_ActualName)} <>
                    {
                        - fourthChar_giftedObject != (): e il dono consegnato<>
                    }
                - Character == FifthCharacter:
                    con {translator(fifthChar_ActualName)} <>
                    {
                        - fifthChar_giftedObject != (): e il dono consegnato<>
                    }
            }
            , {player_name} ha a disposizione due gocce di inchiostro.</i>
            <i>Potrà compiere due riscritture e usare il potere dell'epilogo.</i>
        
        - ink_medium:
            {charTag(TheWitch, witch_state())}:   <i>E quindi.
            <i>Dopo le molte parole spese <>
            {
                - Character == FirstCharacter:
                    con {translator(firstChar_ActualName) } <>
                    {
                        - firstChar_giftedObject != (): e il dono consegnato<>
                    }
                - Character == SecondCharacter:
                    con {translator(secondChar_ActualName)} <>
                    {
                        - secondChar_giftedObject != (): e il dono consegnato<>
                    }
                - Character == ThirdCharacter:
                    con {translator(thirdChar_ActualName)} <>
                    {
                        - thirdChar_giftedObject != (): e il dono consegnato<>
                    }
                - Character == FourthCharacter:
                   con {translator(fourthChar_ActualName)} <>
                    {
                        - fourthChar_giftedObject != (): e il dono consegnato<>
                    }
                - Character == FifthCharacter:
                    con {translator(fifthChar_ActualName)} <>
                    {
                        - fifthChar_giftedObject != (): e il dono consegnato<>
                    }
            }
            , {player_name} ha a disposizione tre gocce di inchiostro.</i>
            <i>Potrà compiere tre riscritture e usare il potere dell'epilogo.</i>

        - ink_high:
            {charTag(TheWitch, witch_state())}:   <i>E quindi.
            <i>Dopo le molte parole spese <>
            {
                - Character == FirstCharacter:
                    con {translator(firstChar_ActualName)} <>
                    {
                        - firstChar_giftedObject != (): e il dono consegnato<>
                    }
                - Character == SecondCharacter:
                    con {translator(secondChar_ActualName)} <>
                    {
                        - secondChar_giftedObject != (): e il dono consegnato<>
                    }
                - Character == ThirdCharacter:
                    con {translator(thirdChar_ActualName)} <>
                    {
                        - thirdChar_giftedObject != (): e il dono consegnato<>
                    }
                - Character == FourthCharacter:
                   con {translator(fourthChar_ActualName)} <>
                    {
                        - fourthChar_giftedObject != (): e il dono consegnato<>
                    }
                - Character == FifthCharacter:
                    con {translator(fifthChar_ActualName)} <>
                    {
                        - fifthChar_giftedObject != (): e il dono consegnato<>
                    }
            }
            , {player_name} ha a disposizione quattro gocce di inchiostro.</i>
            <i>Potrà compiere quattro riscritture e usare il potere dell'epilogo. E riceverà un'informazione importante.</i>

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
            <i>ERRORE: non riesco a capire quante azioni {player_name} ha a disposizione.</i>

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
~ temp ink_status = ink_empty
    {Character:
        - FirstCharacter:
            ~ ink_status = firstChar_InkLevel
        
        - SecondCharacter:
            ~ ink_status = secondChar_InkLevel
    
        - ThirdCharacter:
            ~ ink_status = thirdChar_InkLevel
        
        - FourthCharacter:
            ~ ink_status = fourthChar_InkLevel
        
        - FifthCharacter:
            ~ ink_status = fifthChar_InkLevel            
    
    }
    
    {ink_status:
        - ink_empty:
            <i>non ha raccolto alcuna goccia di inchiostro
        
        - ink_low:
            <i>ha raccolto una goccia di inchiostro
        
        - ink_normal:
            <i>ha raccolto due gocce di inchiostro
        
        - ink_medium:
            <i>ha raccolto tre gocce di inchiostro     
        
        - ink_high:
            <i>ha raccolto tre gocce di inchiostro, e col tempo riceverà da <>
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
                una informazione importante.</i>

        - else:
            <i>Errore: non riesco a capire quante azioni {player_name} ha a disposizione.</i>
            {debug: <i>Il livello di inchiostro per la prima personaggia è {firstChar_InkLevel}}
    
    }


//Funzione che chiamo per vedere quanto inchiostro massimo ho generato con ogni personaggia.
=== function fromInkToNumbers(Character)
~ temp ink_status = ink_empty
    {Character:
        - FirstCharacter:
            ~ ink_status = firstChar_maximum_inkLevel
        
        - SecondCharacter:
            ~ ink_status = secondChar_maximum_inkLevel
    
        - ThirdCharacter:
            ~ ink_status = thirdChar_maximum_inkLevel
            
            //Eccezione per il grimorio, così che ci sia una separazione tra prima e seconda riscrittura.
            - thirdChar_inkFirstRewriting:
                ~ ink_status = thirdChar_inkFirstRewriting    
        
        - FourthCharacter:
            ~ ink_status = fourthChar_maximum_inkLevel
        
        - FifthCharacter:
            ~ ink_status = fifthChar_maximum_inkLevel 
    }
    
    {ink_status:
        - ink_empty:
            nessuna goccia di inchiostro.</i>
        
        - ink_low:
            una goccia di inchiostro.</i>
        
        - ink_normal:
            due gocce di inchiostro.</i>
        
        - ink_medium:
            tre gocce di inchiostro.</i>     
        
        - ink_high:
            quattro gocce di inchiostro, e una informazione importante.</i>
        
        - else:
            <i>Errore: non riesco a capire quante azioni {player_name} ha a disposizione.</i>
            {debug: <i>Il livello di inchiostro per la prima personaggia è {firstChar_InkLevel}}

    
    }
