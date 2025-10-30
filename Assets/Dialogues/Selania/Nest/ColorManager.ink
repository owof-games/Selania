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
            - GialloGiallo:
            - GialloGialloGiallo:
            
            - Blu:
            - BluBlu:
            - BluBluBlu:
            
            - Verde:
            - VerdeVerde:
            - VerdeVerdeVerde:
            
            - Viola:
            - ViolaViola:
            - ViolaViolaViola:
                
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
                
            - GialloRossoRosso:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryRed --
                ~ temporaryRed --
                
            - GialloGialloVerde:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                
            - GialloGialloViola:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                
            - GialloGialloBlu:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                
            - GialloGialloRosso:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                
            
            - GialloBluBlu:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                
            - GialloBluGiallo:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                
                
            - GialloVerdeVerde:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                
            - GialloVerdeGiallo:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                
            - GialloViolaViola:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                
            - GialloViolaGiallo:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                
            
            
            
            
            
            
            
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
                
            - BluRossoRosso:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryRed --
                ~ temporaryRed --
                
            - BluGialloBlu:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                
            - BluGialloGiallo:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                
            - BluBluVerde:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                
            - BluBluViola:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                
            - BluBluGiallo:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                
            - BluBluRosso:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                
            - BluVerdeVerde:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                
            - BluVerdeBlu:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                
            - BluViolaViola:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
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
                
            - VerdeRossoRosso:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryRed --
                ~ temporaryRed --
                
            - VerdeGialloVerde:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                
            - VerdeGialloGiallo:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                
            - VerdeBluVerde:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                
            - VerdeBluBlu:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                
            - VerdeVerdeViola:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                
            - VerdeVerdeBlu:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                
            - VerdeVerdeGiallo:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                
            - VerdeVerdeRosso:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                
            - VerdeViolaVerde:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                
            - VerdeViolaViola:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
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
                
            - ViolaRossoRosso:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryRed --
                ~ temporaryRed --
                
            - ViolaGialloViola:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                
            - ViolaGialloGiallo:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                
            - ViolaBluViola:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                
            - ViolaBluBlu:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                
            - ViolaVerdeVerde:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                
            - ViolaVerdeViola:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                
            - ViolaViolaVerde:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                
            - ViolaViolaBlu:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                
            - ViolaViolaGiallo:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                
            - ViolaViolaRosso:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                
        
        
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
                
            - GialloRossoViola:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryRed --
                ~ temporaryRed --
                
            - GialloRossoBlu:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryRed --
                ~ temporaryRed --
                
            - GialloBluVerde:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                
            - GialloBluViola:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                
            - GialloBluRosso:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                
            - GialloVerdeViola:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                
            - GialloVerdeBlu:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                
            - GialloVerdeRosso:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                
            - GialloViolaVerde:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                
            - GialloViolaBlu:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                
            - GialloViolaRosso:
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryYellow ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                
                
                
                
                
            
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
                
            - BluRossoGiallo:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryRed --
                ~ temporaryRed --
                
            - BluGialloVerde:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                
            - BluGialloViola:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                
            - BluGialloRosso:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                
            - BluVerdeViola:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                
            - BluVerdeGiallo:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                
            - BluVerdeRosso:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                
            - BluViolaVerde:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                
            - BluViolaBlu:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                
            - BluViolaGiallo:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                
            - BluViolaRosso:
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryBlue ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                
            
            - VerdeRossoViola:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryRed --
                ~ temporaryRed --
                
            - VerdeRossoBlu:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryRed --
                ~ temporaryRed --
                
            - VerdeRossoGiallo:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryRed --
                ~ temporaryRed --
                
            - VerdeGialloViola:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                
            - VerdeGialloBlu:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                
            - VerdeBluViola:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                
            - VerdeBluGiallo:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                
            - VerdeBluRosso:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                
            - VerdeGialloRosso:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                
            - VerdeViolaBlu:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                
            - VerdeViolaGiallo:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                
            - VerdeViolaRosso:
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryGreen ++
                ~ temporaryPurple --
                ~ temporaryPurple --
                
            
            
            
            
            
            
            
            - ViolaRossoVerde:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryRed --
                ~ temporaryRed --
                
            - ViolaRossoBlu:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryRed --
                ~ temporaryRed --
                
            - ViolaRossoGiallo:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryRed --
                ~ temporaryRed --
                
            - ViolaGialloVerde:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                
            - ViolaGialloBlu:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                
            - ViolaGialloRosso:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryYellow --
                ~ temporaryYellow --
                
            - ViolaBluVerde:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                
            - ViolaBluGiallo:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                
            - ViolaBluRosso:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryBlue --
                ~ temporaryBlue --
                
            
            - ViolaVerdeBlu:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                
            - ViolaVerdeGiallo:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                
            - ViolaVerdeRosso:
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryPurple ++
                ~ temporaryGreen --
                ~ temporaryGreen --
                
            
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

