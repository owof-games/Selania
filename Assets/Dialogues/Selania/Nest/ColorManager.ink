LIST colorParametersChoice = redC, yellowC, blueC, greenC, purpleC

VAR currentTalker = ()
VAR temporaryRed = 0
VAR temporaryYellow = 0
VAR temporaryBlue = 0
VAR temporaryGreen = 0
VAR temporaryPurple = 0


=== color_variation_management(PNG, Color)
{nestDebug: passo per color_variation_management. Il valore di PNG è {PNG}, il valore di colore è {Color}.}
//Primo step: capiamo di chi si parla, e si associano i valori generici di colore (red etc) a quelli specifici della PNG
    {
    	- PNG == FirstCharacter:
    	        ~ currentTalker = FirstCharacter
    	        {nestDebug: dopo l'operazione il parlante attuale {currentTalker}.} 
    	 
    	 - PNG == SecondCharacter:
    	        ~ currentTalker = SecondCharacter
    	        {nestDebug: dopo l'operazione il parlante attuale {currentTalker}.} 
    	 
    	 - PNG == Mentor:
    	        ~ currentTalker = Mentor
    	        {nestDebug: dopo l'operazione il parlante attuale {currentTalker}.}       
    	    
        - else: ERROR: sono in color_variation_management ma non trovo lx PNG indicatx
    }


//Secondo step: se activeEmotionalWord, andiamo a un nodo di verifica ad hoc per le parole magiche, altrimenti proseguiamo regolarmente.
{
    
    //Se una parola magica è attiva, andiamo al nodo di analisi dedicato
    - activeEmotionalWord != ():
        {nestDebug: è attiva la parola magica {activeEmotionalWord}, per cui mi sposto al settore dedicato.}
            -> emotional_words
    
    //Altrimenti aumentiamo di uno come sempre
        {nestDebug: non è attiva alcuna parola magica, per cui mi aumento di uno i valori e basta.}
    
    - else:
        {
            
            - Color == redC:
                {
                    - currentTalker == FirstCharacter:
                        ~ firstRed ++
                    - currentTalker == SecondCharacter:
                        ~ secondRed ++
                    - currentTalker == Mentor:
                        ~ fifthRed ++    
                }
     
            - Color == yellowC:
                {
                    - currentTalker == FirstCharacter:
                        ~ firstYellow ++
                    - currentTalker == SecondCharacter:
                        ~ secondYellow ++
                    - currentTalker == Mentor:
                        ~ fifthYellow ++    
                }
            
            - Color == blueC:
                {
                    - currentTalker == FirstCharacter:
                        ~ firstBlue ++
                    - currentTalker == SecondCharacter:
                        ~ secondBlue ++
                    - currentTalker == Mentor:
                        ~ fifthBlue ++    
                }
            
            - Color == greenC:
                {
                    - currentTalker == FirstCharacter:
                        ~ firstGreen ++
                    - currentTalker == SecondCharacter:
                        ~ secondGreen ++
                    - currentTalker == Mentor:
                        ~ fifthGreen ++    
                }   
            
            - Color == purpleC:
                {
                    - currentTalker == FirstCharacter:
                        ~ firstPurple ++
                    - currentTalker == SecondCharacter:
                        ~ secondPurple ++
                    - currentTalker == Mentor:
                        ~ fifthPurple ++    
                }
        }
          //E poi svuotiamo
                -> empty_variables
    
}







= emotional_words
//Qui tracciamo gli effetti generici delle parole
    {
    
        - activeEmotionalWord == Rosso:
            ~ temporaryRed ++
    
    }

//Poi andiamo ad aggiornare i valori delle parlanti
    {
        - currentTalker == FirstCharacter:
            ~ firstRed += temporaryRed
            ~ firstYellow += temporaryYellow
            ~ firstBlue += temporaryBlue
            ~ firstGreen += temporaryGreen
            ~ firstPurple += temporaryPurple
        
        - currentTalker == SecondCharacter:
            ~ secondRed += temporaryRed
            ~ secondYellow += temporaryYellow
            ~ secondBlue += temporaryBlue
            ~ secondGreen += temporaryGreen
            ~ secondPurple += temporaryPurple
        
        - currentTalker == Mentor:
            ~ fifthRed += temporaryRed
            ~ fifthYellow += temporaryYellow
            ~ fifthBlue += temporaryBlue
            ~ fifthGreen += temporaryGreen
            ~ fifthPurple += temporaryPurple
    }




//E poi andiamo alle reazioni
    {
        - currentTalker == FirstCharacter:
            -> firstCharEmotionalActions
        
        - currentTalker == SecondCharacter:
            -> secondCharEmotionalActions
        
        - currentTalker == Mentor:
            -> fifthCharEmotionalActions
    
    }



        
        = firstCharEmotionalActions
            
            {
                - activeEmotionalWord == Rosso:
                    Reazione Chitarra
            }
        
        
            -> word_state_manager
        
        
        = secondCharEmotionalActions
            {
                - activeEmotionalWord == Rosso:
                    Reazione Riccio
            }
        
        
            -> word_state_manager
        
        
        = fifthCharEmotionalActions
            {
                - activeEmotionalWord == Rosso:
                    Reazione Mentore
            }
            
            
            -> word_state_manager
        
        
        = word_state_manager
        TODO: dopo la pausa, capiamo come gestire questo, carichiamo qualche altro modello di parola, e vediamo cosa accade.
        
        
        
        -> empty_variables


= empty_variables
    {nestDebug: entro in empty_variables.}
    {nestDebug: prima dell'operazione il parlante attuale è {currentTalker}.} 
        ~ currentTalker = ()
        ~ temporaryRed = 0
        ~ temporaryYellow = 0
        ~ temporaryBlue = 0
        ~ temporaryGreen = 0
        ~ temporaryPurple = 0
    {nestDebug: dopo l'operazione il parlante attuale {currentTalker}.}

->->

