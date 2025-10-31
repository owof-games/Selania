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
        {Color:
            -redC:
                ~ temporaryRed ++
     
            -yellowC:
                ~ temporaryYellow ++
            
            -blueC:
                ~ temporaryBlue ++
            
            -greenC:
                ~ temporaryGreen ++   
            
            -purpleC:
                ~ temporaryPurple ++
        }
        {nestDebug: non è attiva alcuna parola magica, per cui mi aumento di uno i valori e basta.}
          //E poi aggiorniamo i dettagli
                -> update_PNG_color_values
    
}





= emotional_words
//Qui tracciamo gli effetti generici delle parole
    {activeEmotionalWord:
        //Variazioni di un solo colore
            - Rosso:
                ~ temporaryRed ++
            - RossoRosso:
                ~ temporaryRed ++
                ~ temporaryRed ++
                
            - RossoRossoRosso:
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
            
            - Giallo:
                ~ temporaryYellow ++
            - GialloGiallo:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
            - GialloGialloGiallo:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
            
            - Blu:
                ~ temporaryBlue ++
            - BluBlu:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
            - BluBluBlu:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
            
            - Verde:
                ~ temporaryGreen ++
            - VerdeVerde:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
            - VerdeVerdeVerde:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
            
            - Viola:
                ~ temporaryPurple ++
            - ViolaViola:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
            - ViolaViolaViola:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                
        //Variazioni di due colori
            - RossoRossoBlu:
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed --
                ~ temporaryRed --
                ~ temporaryBlue --
                
            - RossoRossoVerde:
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed --
                ~ temporaryRed --
                ~ temporaryGreen --
                
            - RossoRossoViola:
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed --
                ~ temporaryRed --
                ~ temporaryPurple --
                
            - RossoRossoGiallo:
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed --
                ~ temporaryRed --
                ~ temporaryYellow --
                
            - RossoGiallo:
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryYellow --
                
            - RossoGialloRosso:
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryYellow --
                ~ temporaryYellow --
            
            - RossoGialloGiallo:
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                ~ temporaryYellow --
            
            - RossoBlu:
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryBlue --
                
            - RossoBluBlu:
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryBlue --
            
            - RossoBluRosso:
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryRed --
            
            - RossoVerde: 
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryGreen --
            
            - RossoVerdeVerde:
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryGreen --
            
            - RossoVerdeRosso:
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryRed --
            
            - RossoViola:
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryPurple --
                
            - RossoViolaViola:
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryPurple --
            
            - RossoViolaRosso:
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryRed --
            
            
            
            
            
            - GialloVerde:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryGreen --
        
            - GialloViola:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryPurple --
            
            - GialloRosso:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryRed --
            
            - GialloBlu:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryBlue --
                
                
            - GialloRossoGiallo:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryRed --
                ~ temporaryRed --
                ~ temporaryYellow --
                
            - GialloRossoRosso:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryRed --
                ~ temporaryRed --
                ~ temporaryRed --
                
            - GialloGialloVerde:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                ~ temporaryGreen --
                
            - GialloGialloViola:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                ~ temporaryPurple --
                
            - GialloGialloBlu:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                ~ temporaryBlue --
                
            - GialloGialloRosso:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                ~ temporaryRed --
                
            
            - GialloBluBlu:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryBlue --
                
            - GialloBluGiallo:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryYellow --
                
                
            - GialloVerdeVerde:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryGreen --
                
            - GialloVerdeGiallo:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryYellow --
                
            - GialloViolaViola:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryPurple --
                
            - GialloViolaGiallo:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryYellow --
                
            
            
            
            
            
            
            
            - BluRosso:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryRed --
                
            - BluGiallo:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryYellow --
                
            - BluVerde:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryGreen --
                
            - BluViola:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryPurple --
                
            - BluRossoBlu:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryRed --
                ~ temporaryRed --
                ~ temporaryBlue --
                
            - BluRossoRosso:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryRed --
                ~ temporaryRed --
                ~ temporaryRed --
                
            - BluGialloBlu:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                ~ temporaryBlue --
                
            - BluGialloGiallo:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                ~ temporaryYellow --
                
            - BluBluVerde:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryGreen --
                
            - BluBluViola:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryPurple --
                
            - BluBluGiallo:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryYellow --
                
            - BluBluRosso:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryRed --
                
            - BluVerdeVerde:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryGreen --
                
            - BluVerdeBlu:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryBlue --
                
            - BluViolaViola:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryPurple --
                
            
            
            
            
            
            
            
            - VerdeRosso:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryRed --
                
            - VerdeViola:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryPurple --
                
            - VerdeGiallo:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryYellow --
                
            - VerdeBlu:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryBlue --
                
            - VerdeRossoVerde:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryRed --
                ~ temporaryRed --
                ~ temporaryGreen --
                
            - VerdeRossoRosso:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryRed --
                ~ temporaryRed --
                ~ temporaryRed --
                
            - VerdeGialloVerde:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                ~ temporaryGreen --
                
            - VerdeGialloGiallo:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                ~ temporaryYellow --
                
            - VerdeBluVerde:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryGreen --
                
            - VerdeBluBlu:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryBlue --
                
            - VerdeVerdeViola:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryPurple --
                
            - VerdeVerdeBlu:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryBlue --
                
            - VerdeVerdeGiallo:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryYellow --
                
            - VerdeVerdeRosso:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryRed --
                
            - VerdeViolaVerde:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryGreen --
                
            - VerdeViolaViola:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryPurple --
                
            
            
            
            
            - ViolaRosso:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryRed --
                
            - ViolaGiallo:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryYellow --
                
            - ViolaBlu:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryBlue --
                
            - ViolaVerde:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryGreen --
                
            - ViolaRossoViola:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryRed --
                ~ temporaryRed --
                ~ temporaryPurple --
                
            - ViolaRossoRosso:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryRed --
                ~ temporaryRed --
                ~ temporaryRed --
                
            - ViolaGialloViola:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                ~ temporaryPurple --
                
            - ViolaGialloGiallo:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                ~ temporaryYellow --
                
            - ViolaBluViola:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryPurple --
                
            - ViolaBluBlu:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryBlue --
                
            - ViolaVerdeVerde:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryGreen --
                
            - ViolaVerdeViola:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryPurple --
                
            - ViolaViolaVerde:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryGreen --
                
            - ViolaViolaBlu:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryBlue --
                
            - ViolaViolaGiallo:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryYellow --
                
            - ViolaViolaRosso:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryRed --
                
        
        
        //Varizioni di tre colori
            - RossoGialloBlu: 
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                ~ temporaryBlue --
            
            - RossoGialloVerde: 
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                ~ temporaryGreen --
            
            - RossoGialloViola: 
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                ~ temporaryPurple --
            
            - RossoBluVerde: 
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryGreen --
            
            - RossoBluViola: 
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryPurple --
            
            - RossoBluGiallo: 
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryYellow --
            
            - RossoVerdeBlu: 
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryBlue --
            
            - RossoVerdeViola: 
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryPurple --
            
            - RossoVerdeGiallo: 
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryYellow --
            
            - RossoViolaGiallo:
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryYellow --
                
            - RossoViolaVerde:
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryGreen --
                
            - RossoViolaBlu:
                ~ temporaryRed ++
                ~ temporaryRed ++
                ~ temporaryRed ++ 
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryBlue --
                
        
        
        
        
            - GialloRossoVerde:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryRed --
                ~ temporaryRed --
                ~ temporaryGreen --
                
            - GialloRossoViola:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryRed --
                ~ temporaryRed --
                ~ temporaryPurple --
                
            - GialloRossoBlu:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryRed --
                ~ temporaryRed --
                ~ temporaryBlue --
                
            - GialloBluVerde:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryGreen --
                
            - GialloBluViola:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryPurple --
                
            - GialloBluRosso:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryRed --
                
            - GialloVerdeViola:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryPurple --
                
            - GialloVerdeBlu:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryBlue --
                
            - GialloVerdeRosso:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryRed --
                
            - GialloViolaVerde:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryGreen --
                
            - GialloViolaBlu:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryBlue --
                
            - GialloViolaRosso:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryRed --
                
                
                
                
                
            
            - BluRossoVerde:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryRed ++
                ~ temporaryRed ++
                
            - BluRossoViola:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryRed --
                ~ temporaryRed --
                ~ temporaryPurple --
                
            - BluRossoGiallo:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryRed --
                ~ temporaryRed --
                ~ temporaryYellow --
                
            - BluGialloVerde:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                ~ temporaryGreen --
                
            - BluGialloViola:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                ~ temporaryPurple --
                
            - BluGialloRosso:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                ~ temporaryRed --
                
            - BluVerdeViola:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryPurple --
                
            - BluVerdeGiallo:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryYellow --
                
            - BluVerdeRosso:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryRed --
                
            - BluViolaVerde:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryGreen --
                
            - BluViolaBlu:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryBlue --
                
            - BluViolaGiallo:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryYellow --
                
            - BluViolaRosso:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryRed --
                
            
            - VerdeRossoViola:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryRed --
                ~ temporaryRed --
                ~ temporaryPurple --
                
            - VerdeRossoBlu:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryRed --
                ~ temporaryRed --
                ~ temporaryBlue --
                
            - VerdeRossoGiallo:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryRed --
                ~ temporaryRed --
                ~ temporaryYellow --
                
            - VerdeGialloViola:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                ~ temporaryPurple --
                
            - VerdeGialloBlu:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                ~ temporaryBlue --
                
            - VerdeBluViola:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryPurple --
                
            - VerdeBluGiallo:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryYellow --
                
            - VerdeBluRosso:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryRed --
                
            - VerdeGialloRosso:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                ~ temporaryRed --
                
            - VerdeViolaBlu:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryBlue --
                
            - VerdeViolaGiallo:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryYellow --
                
            - VerdeViolaRosso:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                ~ temporaryRed --
                
            
            
            
            
            
            
            
            - ViolaRossoVerde:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryRed --
                ~ temporaryRed --
                ~ temporaryGreen --
                
            - ViolaRossoBlu:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryRed --
                ~ temporaryRed --
                ~ temporaryBlue --
                
            - ViolaRossoGiallo:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryRed --
                ~ temporaryRed --
                ~ temporaryYellow --
                
            - ViolaGialloVerde:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                ~ temporaryGreen --
                
            - ViolaGialloBlu:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                ~ temporaryBlue --
                
            - ViolaGialloRosso:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                ~ temporaryRed --
                
            - ViolaBluVerde:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryGreen --
                
            - ViolaBluGiallo:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryYellow --
                
            - ViolaBluRosso:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                ~ temporaryRed --
                
            
            - ViolaVerdeBlu:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryBlue --
                
            - ViolaVerdeGiallo:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryYellow --
                
            - ViolaVerdeRosso:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                ~ temporaryRed --
                
            
            -else: Valore colore parola {activeEmotionalWord} non trovato!
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

    //Le reazioni le creiamo e gestiamo per gruppi di parole, non per singola parola.

        
        = firstCharEmotionalActions
            {nestDebug: entro in firstCharEmotionalActions.}
            
            {
 
                //Varianti monocolore
                    - redWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                    - yellowWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                    - bluWords  has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                    - greenWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                    - purpleWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                
                //Varianti a dominante Rosso
                    - redYellowWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                    - redBlueWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                    - redGreenWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                    - redPurpleWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                
                //Varianti a dominante Giallo
                    - yellowRedWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                    - yellowBlueWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                    - yellowGreenWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                    - yellowPurpleWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                
                //Varianti a dominate blu
                    - blueRedWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                    - blueYellowWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                    - blueGreenWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                    - bluePurpleWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                
                //Varianti a dominante verde
                    - greenRedWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                    - greenYellowWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                    - greenBlueWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                    - greenPurpleWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                
                //Varianti a dominante viola
                    - purpleRedWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                    - purpleYellowWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                    - purpleBlueWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
                    - purpleGreenWords has activeEmotionalWord:
                        Reazione Chitarra alla presenza di {activeEmotionalWord}.
            }
        
        
            -> word_state_manager
        
        
        = secondCharEmotionalActions
            {nestDebug: entro in secondCharEmotionalActions.}
            {
 
                //Varianti monocolore
                    - redWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                    - yellowWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                    - bluWords  has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                    - greenWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                    - purpleWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                
                //Varianti a dominante Rosso
                    - redYellowWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                    - redBlueWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                    - redGreenWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                    - redPurpleWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                
                //Varianti a dominante Giallo
                    - yellowRedWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                    - yellowBlueWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                    - yellowGreenWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                    - yellowPurpleWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                
                //Varianti a dominate blu
                    - blueRedWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                    - blueYellowWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                    - blueGreenWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                    - bluePurpleWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                
                //Varianti a dominante verde
                    - greenRedWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                    - greenYellowWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                    - greenBlueWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                    - greenPurpleWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                
                //Varianti a dominante viola
                    - purpleRedWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                    - purpleYellowWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                    - purpleBlueWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
                    - purpleGreenWords has activeEmotionalWord:
                        Reazione Riccio alla presenza di {activeEmotionalWord}.
            }
        
        
            -> word_state_manager
        
        
        = fifthCharEmotionalActions
            {nestDebug: entro in fifthCharEmotionalActions.}
            {
 
                //Varianti monocolore
                    - redWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                    - yellowWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                    - bluWords  has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                    - greenWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                    - purpleWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                
                //Varianti a dominante Rosso
                    - redYellowWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                    - redBlueWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                    - redGreenWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                    - redPurpleWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                
                //Varianti a dominante Giallo
                    - yellowRedWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                    - yellowBlueWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                    - yellowGreenWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                    - yellowPurpleWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                
                //Varianti a dominate blu
                    - blueRedWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                    - blueYellowWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                    - blueGreenWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                    - bluePurpleWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                
                //Varianti a dominante verde
                    - greenRedWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                    - greenYellowWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                    - greenBlueWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                    - greenPurpleWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                
                //Varianti a dominante viola
                    - purpleRedWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                    - purpleYellowWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                    - purpleBlueWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
                    - purpleGreenWords has activeEmotionalWord:
                        Reazione Mentore alla presenza di {activeEmotionalWord}.
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

