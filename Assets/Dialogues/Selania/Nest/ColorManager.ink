LIST nest_colorParametersChoice = redC, yellowC, blueC, greenC, purpleC

//Persona a cui stiamo parlando quando compiamo la scelta
    VAR nest_currentTalker = ()
//Creazione di parametri generici per semplificarmi la vita legati ai colori che poi verranno riportati sullx PNG    
    VAR nest_temporaryRed = 0.00
    VAR nest_temporaryYellow = 0.00
    VAR nest_temporaryBlue = 0.00
    VAR nest_temporaryGreen = 0.00
    VAR nest_temporaryPurple = 0.00

//Contatore d'uso della parola    
    VAR temporaryWordUsageCounter = 0


=== color_variation_management(PNG, Color)
{debug_nest: passo per color_variation_management. Il valore di PNG è {PNG}, il valore di colore è {Color}. Lo stato della parola attiva è {nest_activeEmotionalWord}.}
//Primo step: capiamo di chi si parla.

    {
    	- PNG == FirstCharacter:
    	        ~ nest_currentTalker = FirstCharacter
    	        {debug_nest: dopo l'operazione il parlante attuale {nest_currentTalker}.} 
    	 
    	- PNG == SecondCharacter:
    	        ~ nest_currentTalker = SecondCharacter
    	        {debug_nest: dopo l'operazione il parlante attuale {nest_currentTalker}.} 
    	 
    	- PNG == Mentor:
    	        ~ nest_currentTalker = Mentor
    	        {debug_nest: dopo l'operazione il parlante attuale {nest_currentTalker}.}       
    	    
        - else: ERROR: sono in color_variation_management ma non trovo lx PNG indicatx
    }


//Secondo step: se nest_activeEmotionalWord, andiamo a un nodo di verifica ad hoc per le parole magiche, altrimenti proseguiamo regolarmente.
{
    //Se una parola magica è attiva, andiamo al nodo di analisi dedicato
    - nest_activeEmotionalWord != ():
        {debug_nest: è attiva la parola magica {nest_activeEmotionalWord}, per cui mi sposto al settore dedicato.}
            -> emotional_words
    
    
    //Altrimenti aumentiamo di uno come sempre

    - else:
        {Color:
            -redC:
                ~ nest_temporaryRed ++
     
            -yellowC:
                ~ nest_temporaryYellow ++
            
            -blueC:
                ~ nest_temporaryBlue ++
            
            -greenC:
                ~ nest_temporaryGreen ++   
            
            -purpleC:
                ~ nest_temporaryPurple ++
        }
        {debug_nest: non è attiva alcuna parola magica, per cui mi aumento di uno i valori e basta.}
          //E poi aggiorniamo i dettagli
                -> update_PNG_color_values
    
}





= emotional_words
//Qui tracciamo gli effetti generici delle parole
    {nest_activeEmotionalWord:
        //Variazioni di un solo colore
            - Rosso:
                ~ nest_temporaryRed ++
            - RossoRosso:
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                
            - RossoRossoRosso:
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
            
            - Giallo:
                ~ nest_temporaryYellow ++
            - GialloGiallo:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
            - GialloGialloGiallo:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
            
            - Blu:
                ~ nest_temporaryBlue ++
            - BluBlu:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
            - BluBluBlu:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
            
            - Verde:
                ~ nest_temporaryGreen ++
            - VerdeVerde:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
            - VerdeVerdeVerde:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
            
            - Viola:
                ~ nest_temporaryPurple ++
            - ViolaViola:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
            - ViolaViolaViola:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                
        //Variazioni di due colori
            - RossoRossoBlu:
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                ~ nest_temporaryBlue --
                
            - RossoRossoVerde:
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                ~ nest_temporaryGreen --
                
            - RossoRossoViola:
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                ~ nest_temporaryPurple --
                
            - RossoRossoGiallo:
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                ~ nest_temporaryYellow --
                
            - RossoGiallo:
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryYellow --
                
            - RossoGialloRosso:
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
            
            - RossoGialloGiallo:
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
            
            - RossoBlu:
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryBlue --
                
            - RossoBluBlu:
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
            
            - RossoBluRosso:
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryRed --
            
            - RossoVerde: 
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryGreen --
            
            - RossoVerdeVerde:
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
            
            - RossoVerdeRosso:
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryRed --
            
            - RossoViola:
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryPurple --
                
            - RossoViolaViola:
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
            
            - RossoViolaRosso:
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryRed --
            
            
            
            
            
            - GialloVerde:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryGreen --
        
            - GialloViola:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryPurple --
            
            - GialloRosso:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryRed --
            
            - GialloBlu:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryBlue --
                
                
            - GialloRossoGiallo:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                ~ nest_temporaryYellow --
                
            - GialloRossoRosso:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                
            - GialloGialloVerde:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                ~ nest_temporaryGreen --
                
            - GialloGialloViola:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                ~ nest_temporaryPurple --
                
            - GialloGialloBlu:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                ~ nest_temporaryBlue --
                
            - GialloGialloRosso:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                ~ nest_temporaryRed --
                
            
            - GialloBluBlu:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                
            - GialloBluGiallo:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryYellow --
                
                
            - GialloVerdeVerde:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                
            - GialloVerdeGiallo:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryYellow --
                
            - GialloViolaViola:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                
            - GialloViolaGiallo:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryYellow --
                
            
            
            
            
            
            
            
            - BluRosso:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryRed --
                
            - BluGiallo:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryYellow --
                
            - BluVerde:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryGreen --
                
            - BluViola:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryPurple --
                
            - BluRossoBlu:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                ~ nest_temporaryBlue --
                
            - BluRossoRosso:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                
            - BluGialloBlu:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                ~ nest_temporaryBlue --
                
            - BluGialloGiallo:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                
            - BluBluVerde:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryGreen --
                
            - BluBluViola:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryPurple --
                
            - BluBluGiallo:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryYellow --
                
            - BluBluRosso:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryRed --
                
            - BluVerdeVerde:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                
            - BluVerdeBlu:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryBlue --
                
            - BluViolaViola:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                
            
            
            
            
            
            
            
            - VerdeRosso:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryRed --
                
            - VerdeViola:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryPurple --
                
            - VerdeGiallo:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryYellow --
                
            - VerdeBlu:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryBlue --
                
            - VerdeRossoVerde:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                ~ nest_temporaryGreen --
                
            - VerdeRossoRosso:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                
            - VerdeGialloVerde:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                ~ nest_temporaryGreen --
                
            - VerdeGialloGiallo:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                
            - VerdeBluVerde:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryGreen --
                
            - VerdeBluBlu:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                
            - VerdeVerdeViola:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryPurple --
                
            - VerdeVerdeBlu:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryBlue --
                
            - VerdeVerdeGiallo:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryYellow --
                
            - VerdeVerdeRosso:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryRed --
                
            - VerdeViolaVerde:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryGreen --
                
            - VerdeViolaViola:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                
            
            
            
            
            - ViolaRosso:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryRed --
                
            - ViolaGiallo:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryYellow --
                
            - ViolaBlu:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryBlue --
                
            - ViolaVerde:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryGreen --
                
            - ViolaRossoViola:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                ~ nest_temporaryPurple --
                
            - ViolaRossoRosso:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                
            - ViolaGialloViola:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                ~ nest_temporaryPurple --
                
            - ViolaGialloGiallo:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                
            - ViolaBluViola:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryPurple --
                
            - ViolaBluBlu:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                
            - ViolaVerdeVerde:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                
            - ViolaVerdeViola:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryPurple --
                
            - ViolaViolaVerde:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryGreen --
                
            - ViolaViolaBlu:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryBlue --
                
            - ViolaViolaGiallo:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryYellow --
                
            - ViolaViolaRosso:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryRed --
                
        
        
        //Varizioni di tre colori
            - RossoGialloBlu: 
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                ~ nest_temporaryBlue --
            
            - RossoGialloVerde: 
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                ~ nest_temporaryGreen --
            
            - RossoGialloViola: 
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                ~ nest_temporaryPurple --
            
            - RossoBluVerde: 
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryGreen --
            
            - RossoBluViola: 
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryPurple --
            
            - RossoBluGiallo: 
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryYellow --
            
            - RossoVerdeBlu: 
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryBlue --
            
            - RossoVerdeViola: 
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryPurple --
            
            - RossoVerdeGiallo: 
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryYellow --
            
            - RossoViolaGiallo:
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryYellow --
                
            - RossoViolaVerde:
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryGreen --
                
            - RossoViolaBlu:
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++ 
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryBlue --
                
        
        
        
        
            - GialloRossoVerde:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                ~ nest_temporaryGreen --
                
            - GialloRossoViola:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                ~ nest_temporaryPurple --
                
            - GialloRossoBlu:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                ~ nest_temporaryBlue --
                
            - GialloBluVerde:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryGreen --
                
            - GialloBluViola:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryPurple --
                
            - GialloBluRosso:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryRed --
                
            - GialloVerdeViola:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryPurple --
                
            - GialloVerdeBlu:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryBlue --
                
            - GialloVerdeRosso:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryRed --
                
            - GialloViolaVerde:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryGreen --
                
            - GialloViolaBlu:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryBlue --
                
            - GialloViolaRosso:
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryYellow ++
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryRed --
                
                
                
                
                
            
            - BluRossoVerde:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryRed ++
                ~ nest_temporaryRed ++
                
            - BluRossoViola:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                ~ nest_temporaryPurple --
                
            - BluRossoGiallo:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                ~ nest_temporaryYellow --
                
            - BluGialloVerde:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                ~ nest_temporaryGreen --
                
            - BluGialloViola:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                ~ nest_temporaryPurple --
                
            - BluGialloRosso:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                ~ nest_temporaryRed --
                
            - BluVerdeViola:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryPurple --
                
            - BluVerdeGiallo:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryYellow --
                
            - BluVerdeRosso:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryRed --
                
            - BluViolaVerde:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryGreen --
                
            - BluViolaBlu:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryBlue --
                
            - BluViolaGiallo:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryYellow --
                
            - BluViolaRosso:
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryBlue ++
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryRed --
                
            
            - VerdeRossoViola:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                ~ nest_temporaryPurple --
                
            - VerdeRossoBlu:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                ~ nest_temporaryBlue --
                
            - VerdeRossoGiallo:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                ~ nest_temporaryYellow --
                
            - VerdeGialloViola:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                ~ nest_temporaryPurple --
                
            - VerdeGialloBlu:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                ~ nest_temporaryBlue --
                
            - VerdeBluViola:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryPurple --
                
            - VerdeBluGiallo:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryYellow --
                
            - VerdeBluRosso:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryRed --
                
            - VerdeGialloRosso:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                ~ nest_temporaryRed --
                
            - VerdeViolaBlu:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryBlue --
                
            - VerdeViolaGiallo:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryYellow --
                
            - VerdeViolaRosso:
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryGreen ++
                ~ nest_temporaryPurple --
                ~ nest_temporaryPurple --
                ~ nest_temporaryRed --
                
            
            
            
            
            
            
            
            - ViolaRossoVerde:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                ~ nest_temporaryGreen --
                
            - ViolaRossoBlu:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                ~ nest_temporaryBlue --
                
            - ViolaRossoGiallo:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryRed --
                ~ nest_temporaryRed --
                ~ nest_temporaryYellow --
                
            - ViolaGialloVerde:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                ~ nest_temporaryGreen --
                
            - ViolaGialloBlu:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                ~ nest_temporaryBlue --
                
            - ViolaGialloRosso:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryYellow --
                ~ nest_temporaryYellow --
                ~ nest_temporaryRed --
                
            - ViolaBluVerde:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryGreen --
                
            - ViolaBluGiallo:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryYellow --
                
            - ViolaBluRosso:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryBlue --
                ~ nest_temporaryBlue --
                ~ nest_temporaryRed --
                
            
            - ViolaVerdeBlu:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryBlue --
                
            - ViolaVerdeGiallo:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryYellow --
                
            - ViolaVerdeRosso:
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryPurple ++
                ~ nest_temporaryGreen --
                ~ nest_temporaryGreen --
                ~ nest_temporaryRed --
                
            
            -else: Valore colore parola {nest_activeEmotionalWord} non trovato!
    }




//E poi andiamo alle reazioni
    {
        - nest_currentTalker == FirstCharacter:
            -> firstCharEmotionalActions
        
        - nest_currentTalker == SecondCharacter:
            -> secondCharEmotionalActions
        
        - nest_currentTalker == Mentor:
            -> fifthCharEmotionalActions
    
    }

    //Le reazioni le creiamo e gestiamo per gruppi di parole, non per singola parola.

        
        = firstCharEmotionalActions
            {debug_nest: entro in firstCharEmotionalActions.}
            TODO: posso fare una lista graduale di reazioni sempre più cariche (+ di tre però visto che una parola può essere usata tanterrimo)
            
            {
 
                //Varianti monocolore
                    - nest_redWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                    - nest_yellowWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                    - nest_blueWords  has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                    - nest_greenWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                    - nest_purpleWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                
                //Varianti a dominante Rosso
                    - nest_redYellowWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                    - nest_redBlueWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                    - nest_redGreenWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                    - nest_redPurpleWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                
                //Varianti a dominante Giallo
                    - nest_yellowRedWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                    - nest_yellowBlueWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                    - nest_yellowGreenWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                    - nest_yellowPurpleWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                
                //Varianti a dominate blu
                    - nest_blueRedWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                    - nest_blueYellowWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                    - nest_blueGreenWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                    - nest_bluePurpleWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                
                //Varianti a dominante verde
                    - nest_greenRedWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                    - nest_greenYellowWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                    - nest_greenBlueWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                    - nest_greenPurpleWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                
                //Varianti a dominante viola
                    - nest_purpleRedWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                    - nest_purpleYellowWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                    - nest_purpleBlueWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                    - nest_purpleGreenWords has nest_activeEmotionalWord:
                        Reazione Chitarra alla presenza di {nest_activeEmotionalWord}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
            }
        
        
            -> word_state_manager
        
        
        = secondCharEmotionalActions
            {debug_nest: entro in secondCharEmotionalActions.}
            {
 
                //Varianti monocolore
                    - nest_redWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    - nest_yellowWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    - nest_blueWords  has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    - nest_greenWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    - nest_purpleWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                
                //Varianti a dominante Rosso
                    - nest_redYellowWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    - nest_redBlueWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    - nest_redGreenWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    - nest_redPurpleWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                
                //Varianti a dominante Giallo
                    - nest_yellowRedWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    - nest_yellowBlueWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    - nest_yellowGreenWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    - nest_yellowPurpleWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                
                //Varianti a dominate blu
                    - nest_blueRedWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    - nest_blueYellowWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    - nest_blueGreenWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    - nest_bluePurpleWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                
                //Varianti a dominante verde
                    - nest_greenRedWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    - nest_greenYellowWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    - nest_greenBlueWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    - nest_greenPurpleWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                
                //Varianti a dominante viola
                    - nest_purpleRedWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    - nest_purpleYellowWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    - nest_purpleBlueWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    - nest_purpleGreenWords has nest_activeEmotionalWord:
                        Reazione Riccio alla presenza di {nest_activeEmotionalWord}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            }
        
        
            -> word_state_manager
        
        
        = fifthCharEmotionalActions
            {debug_nest: entro in fifthCharEmotionalActions.}
            {
 
                //Varianti monocolore
                    - nest_redWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                    - nest_yellowWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                    - nest_blueWords  has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                    - nest_greenWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                    - nest_purpleWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                
                //Varianti a dominante Rosso
                    - nest_redYellowWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                    - nest_redBlueWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                    - nest_redGreenWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                    - nest_redPurpleWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                
                //Varianti a dominante Giallo
                    - nest_yellowRedWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                    - nest_yellowBlueWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                    - nest_yellowGreenWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                    - nest_yellowPurpleWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                
                //Varianti a dominate blu
                    - nest_blueRedWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                    - nest_blueYellowWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                    - nest_blueGreenWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                    - nest_bluePurpleWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                
                //Varianti a dominante verde
                    - nest_greenRedWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                    - nest_greenYellowWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                    - nest_greenBlueWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                    - nest_greenPurpleWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                
                //Varianti a dominante viola
                    - nest_purpleRedWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                    - nest_purpleYellowWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                    - nest_purpleBlueWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                    - nest_purpleGreenWords has nest_activeEmotionalWord:
                        Reazione Mentore alla presenza di {nest_activeEmotionalWord}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
            }
        
            
            -> word_state_manager
        
        
        = word_state_manager
            {debug_nest: entro in word_state_manager.}
        //Qui abbasso l'uso della parola, e se il suo uso è esaurito, la disattivo    
            {debug_nest: prima di modificare temporaryWordUsageCounter il suo valore è {temporaryWordUsageCounter}.}
                ~ temporaryWordUsageCounter --
            {debug_nest: dopo aver ridotto temporaryWordUsageCounter il suo valore è {temporaryWordUsageCounter}.}
            
                {
                    - temporaryWordUsageCounter == 0:
                    L'effetto di {nest_activeEmotionalWord} si è esaurito.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                        ~ nest_activeEmotionalWord = ()
                }
        
        -> update_PNG_color_values


= update_PNG_color_values
    {debug_nest: entro in update_PNG_color_values.}
    {debug_nest: prima dell'operazione il parlante attuale è {nest_currentTalker}.}
    //Prima aggiorniamo i dati a seconda dei parlanti
    {
        - nest_currentTalker == FirstCharacter:
            ~ firstChar_red += nest_temporaryRed
            ~ firstChar_yellow += nest_temporaryYellow
            ~ firstChar_blue += nest_temporaryBlue
            ~ firstChar_green += nest_temporaryGreen
            ~ firstChar_purple += nest_temporaryPurple
        
        - nest_currentTalker == SecondCharacter:
            ~ secondChar_Red += nest_temporaryRed
            ~ secondChar_Yellow += nest_temporaryYellow
            ~ secondChar_Blue += nest_temporaryBlue
            ~ secondChar_Green += nest_temporaryGreen
            ~ secondChar_purple += nest_temporaryPurple
        
        - nest_currentTalker == Mentor:
            ~ fifthChar_red += nest_temporaryRed
            ~ fifthChar_yellow += nest_temporaryYellow
            ~ fifthChar_blue += nest_temporaryBlue
            ~ fifthChar_green += nest_temporaryGreen
            ~ fifthChar_purple += nest_temporaryPurple
    }

    //Poi azzeriamo i valori temporanei
        ~ nest_currentTalker = ()
        ~ nest_temporaryRed = 0
        ~ nest_temporaryYellow = 0
        ~ nest_temporaryBlue = 0
        ~ nest_temporaryGreen = 0
        ~ nest_temporaryPurple = 0
    {debug_nest: dopo l'operazione il parlante attuale {nest_currentTalker}.}

->->

