LIST colorParametersChoice = redC, yellowC, blueC, greenC, purpleC

VAR currentTalker = ()


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
//Qui prima procediamo con le variazioni, poi coi feedback ad hoc
{

    - activeEmotionalWord == Rosso:
        Cose

}

{
    - currentTalker == FirstCharacter:
        -> firstCharEmotionalActions


}


= firstCharEmotionalActions

{
    - activeEmotionalWord == Rosso:
        Cose


}




->->





= empty_variables
    {nestDebug: entro in empty_variables.}
    {nestDebug: prima dell'operazione il parlante attuale è {currentTalker}.} 
        ~ currentTalker = ()
    {nestDebug: dopo l'operazione il parlante attuale {currentTalker}.}

->->

