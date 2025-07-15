                    /* ---------------------------------
                    
                      Gestione timing e valori della storia
                    
                     ----------------------------------*/

//Possibili nomi:
    LIST secondCharacterPossibleStates = Riccio, Grizzly, Lupo, Delfino, Capibara, Corvo
    VAR secondCharacterState = Riccio
    
    VAR secondStory = NotStarted

//Tengo conto delle interazioni avute per aprire la possibilità di dare un dono
    VAR secondStoryQuestCount = 0
    VAR secondCharacterSpecialEvent = false

//Variabili per mettere in pausa la conversazione
    VAR secondPauseTalking = 0
    VAR secondCharPauseDuration = 3
    
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
                    
                       Gestione relazione e nomi
                    
                     ----------------------------------*/
=== secondAffinityCalc ===
//Per il secondo personaggio la cosa che conta è coerenza. Ha bisogno di stabilità. A manoni la logica sarà: tengo conto di un counter delle domande a cui ha risposto la giocatrice e se un determinato valore è >= di counter - x allora ++, se >= counter -x-1 allora +. Probabilmente da bilanciare.

    {
        - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 1):
            ~ secondCharacterInkLevel ++
            ~ secondCharacterInkLevel ++
                ->->
        
        - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 2):
            ~ secondCharacterInkLevel ++
                ->->     
    }

        ->->

=== secondAffinityCheckCalc ===
~ temp charNameTwo = translator(secondCharacterState)
    
    {
        - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 1):
        
            {charNameTwo}: Sai? Mi sembri una persona che dice sempre le cose giuste.  #speaker:{secondChar_tag()}
            {charNameTwo}: Non giuste giuste tipo per me.
            {charNameTwo}: Ma che si assomigliano tutte.
            {charNameTwo}: Non mi dici mica prima mele e poi pere come fanno gli altri adulti.
            {charNameTwo}: Questo mi piace.
                ->->
        - else:
        
            {charNameTwo}: Non sono scemo.  #speaker:{secondChar_tag()}
            {charNameTwo}: Ho visto che cambi sempre idea.
            {charNameTwo}: Mi rispondi sempre cose diverse.
            {charNameTwo}: Non mi piace.
            {charNameTwo}: Gli adulti fanno così quando voglio avere ragione.
            {charNameTwo}: E io mica sono un bambino.
                ->->     
    }

        ->-> 

=== secondColourCheck
{debugChangeName: Passo per secondColourCheck.}

VAR secondRedMax = false
VAR secondBlueMax = false
VAR secondYellowMax = false
VAR secondGreenMax = false
VAR secondPurpleMax = false

//Resettiamo, così che per ogni scelta sia tutto su falso per sicurezza.
~  secondYellowMax = false
~  secondGreenMax = false
~  secondBlueMax = false
~  secondPurpleMax = false
~  secondRedMax = false


    {
    //Potrebbe capitare un pareggio, e va bene così, così non è punitivo per la giocatrice.
        - secondRed >= secondBlue && secondRed >= secondYellow && secondRed >= secondGreen && secondRed >= secondPurple && secondRed >= secondGreen:
                    ~  secondRedMax = true
        {debugChangeName: Il valore di secondRedMax è {secondRedMax}.}
        
        - secondBlue >= secondRed && secondBlue >= secondYellow && secondBlue >= secondGreen && secondBlue >= secondPurple && secondBlue >= secondGreen:
                    ~  secondBlueMax = true
         {debugChangeName: Il valore di secondBlueMax è {secondBlueMax}.}
         
        - secondGreen >= secondBlue && secondGreen >= secondYellow && secondGreen >= secondGreen && secondGreen >= secondPurple && secondGreen >= secondRed:
                    ~  secondGreenMax = true
            {debugChangeName: Il valore di secondGreenMax è {secondGreenMax}.}  
            
        - secondPurple >= secondBlue && secondPurple >= secondYellow && secondPurple >= secondGreen && secondPurple >= secondRed && secondPurple >= secondGreen:
                    ~  secondPurpleMax = true
            {debugChangeName: Il valore di secondPurpleMax è {secondPurpleMax}.}  
            
        - secondYellow >= secondBlue && secondYellow >= secondRed && secondYellow >= secondGreen && secondYellow >= secondPurple && secondYellow >= secondGreen:
                    ~  secondYellowMax = true 
        {debugChangeName: Il valore di secondGreenMax è {secondGreenMax}.}                  
    }
        ->->
    

=== function secondStatementVariation(color)
~ temp secondCheckColor = false
{debugChangeName: Passo per function secondStatementVariation.}

    {
        - color == red:
           ~ secondCheckColor = secondRedMax
        - color == blue:
            ~ secondCheckColor = secondBlueMax
        - color == yellow:
            ~ secondCheckColor = secondYellowMax
        - color == green:
            ~ secondCheckColor = secondGreenMax
        - color == purple:
            ~ secondCheckColor = secondPurpleMax
            
    }

    {debugChangeName: Il valore di secondCheckColor è {secondCheckColor}.}                    
    {
        - secondCheckColor:
            {
             - secondCharacterPossibleStates hasnt Corvo:
                ~ secondCharacterPossibleStates ++
                {debugChangeName: Aumento lo stato del secondo personaggio, che ora è {secondCharacterPossibleStates }}
            }
        
        - else:
            {
             - secondCharacterPossibleStates hasnt Riccio:
            ~ secondCharacterPossibleStates --
            {debugChangeName: Diminuisco lo stato del secondo personaggio, che ora è {secondCharacterPossibleStates }}
            }
    	            
    }

=== secondNaming ==
    
    {
        - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 1):
            ~ secondCharacterPossibleStates += Corvo
                ->->
        
        - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 2):
            ~ secondCharacterPossibleStates += Capibara   
                ->-> 
        
        - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 3):
            ~ secondCharacterPossibleStates += Delfino    
                ->->
        
        - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 4):
            ~ secondCharacterPossibleStates += Lupo
                ->->
        
        - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 5):
            ~ secondCharacterPossibleStates += Grizzly
                ->->
        
        - else:     
            ~ secondCharacterPossibleStates += Riccio
                ->->
    }
    
        ->->    