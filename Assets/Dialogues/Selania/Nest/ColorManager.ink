LIST colorParametersChoice = redC, yellowC, blueC, greenC, purpleC

//Persona a cui stiamo parlando quando compiamo la scelta
    VAR currentTalker = ()
//Creazione di parametri generici per semplificarmi la vita legati ai colori che poi verranno riportati sullx PNG    
    VAR temporaryRed = 0
    VAR temporaryYellow = 0
    VAR temporaryBlue = 0
    VAR temporaryGreen = 0
    VAR temporaryPurple = 0

//Contatore d'uso della parola    
    VAR temporaryWordUsageCounter = 0


=== color_variation_management(PNG, Color)
{nestDebug: passo per color_variation_management. Il valore di PNG è {PNG}, il valore di colore è {Color}. Lo stato della parola attiva è {activeEmotionalWord}.}
//Primo step: capiamo di chi si parla.

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

    - else:
        {
            - Color == redC:
                ~ temporaryRed ++
     
            - Color == yellowC:
                ~ temporaryYellow ++
            
            - Color == blueC:
                ~ temporaryBlue ++
            
            - Color == greenC:
                ~ temporaryGreen ++   
            
            - Color == purpleC:
                ~ temporaryPurple ++
        }
        {nestDebug: non è attiva alcuna parola magica, per cui mi aumento di uno i valori e basta.}
          //E poi aggiorniamo i dettagli
                -> update_PNG_color_values
    
}





= emotional_words
//Qui tracciamo gli effetti generici delle parole
    {
    
        - activeEmotionalWord == Rosso:
            ~ temporaryRed ++
    
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
            {nestDebug: entro in firstCharEmotionalActions.}
            
            {
                - activeEmotionalWord == Rosso:
                    Reazione Chitarra
            }
        
        
            -> word_state_manager
        
        
        = secondCharEmotionalActions
            {nestDebug: entro in secondCharEmotionalActions.}
            {
                - activeEmotionalWord == Rosso:
                    Reazione Riccio
            }
        
        
            -> word_state_manager
        
        
        = fifthCharEmotionalActions
            {nestDebug: entro in fifthCharEmotionalActions.}
            {
                - activeEmotionalWord == Rosso:
                    Reazione Mentore
            }
            
            
            -> word_state_manager
        
        
        = word_state_manager
            {nestDebug: entro in word_state_manager.}
        //Qui abbasso l'uso della parola, e se il suo uso è esaurito, la disattivo    
            {nestDebug: prima di modificare temporaryWordUsageCounter il suo valore è {temporaryWordUsageCounter}.}
                ~ temporaryWordUsageCounter --
            {nestDebug: dopo aver ridotto temporaryWordUsageCounter il suo valore è {temporaryWordUsageCounter}.}
            
                {
                    - temporaryWordUsageCounter == 0:
                    L'effetto di {activeEmotionalWord} si è esaurito.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                        ~ activeEmotionalWord = ()
                }
        
        -> update_PNG_color_values


= update_PNG_color_values
    {nestDebug: entro in update_PNG_color_values.}
    {nestDebug: prima dell'operazione il parlante attuale è {currentTalker}.}
    //Prima aggiorniamo i dati a seconda dei parlanti
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

    //Poi azzeriamo i valori temporanei
        ~ currentTalker = ()
        ~ temporaryRed = 0
        ~ temporaryYellow = 0
        ~ temporaryBlue = 0
        ~ temporaryGreen = 0
        ~ temporaryPurple = 0
    {nestDebug: dopo l'operazione il parlante attuale {currentTalker}.}

->->

