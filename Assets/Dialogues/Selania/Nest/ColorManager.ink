LIST nest_colorParametersChoice = redC, yellowC, blueC, greenC, purpleC

//Persona a cui stiamo parlando quando compiamo la scelta
    VAR nest_currentTalker = ()
//Creazione di parametri generici per semplificarmi la vita legati ai colori che poi verranno riportati sullx PNG    
    VAR nest_temporaryFire = 0.00
    VAR nest_temporaryEarth = 0.00
    VAR nest_temporaryAir= 0.00
    VAR nest_temporaryWater= 0.00
    VAR nest_temporaryAether = 0.00

//Contatore d'uso della parola    
    VAR temporaryWordUsageCounter = 0

//Check se modificare o meno stato colore PG
LIST nest_varpg_status = varPGYes, varPGNo

=== color_variation_management(PNG, Color, VARPG)
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
    	        
    	- PNG == PG:
    	//Nel caso dellx PG, non attivo mai le parole magiche.
    	        {Color:
                    -redC:
                        ~ player_red ++
                
                    -yellowC:
                        ~ player_yellow ++
                    
                    -blueC:
                        ~ player_blue ++
                    
                    -greenC:
                        ~ player_green ++   
                    
                    -purpleC:
                        ~ player_purple ++
                }
                ->->
    	        
    	    
        - else: ERROR: sono in color_variation_management ma non trovo lx PNG indicatx
    }

//Secondo step: aggiorniamo colori PG se stato positivo
//Nota: per ora sono tutti i varPGYes, da valutare lato design che farne
{VARPG == varPGYes:
    {debug_nest: cambio il colore della PG, perché è la prima volta per questa scelta.}
    
    {
        - PNG == FirstCharacter:
        	    {Color:
                    -redC:
                        ~ player_red_first_char ++
                
                    -yellowC:
                        ~ player_yellow_first_char ++
                    
                    -blueC:
                        ~ player_blue_first_char ++
                    
                    -greenC:
                        ~ player_green_first_char ++   
                    
                    -purpleC:
                        ~ player_purple_first_char ++
                }
        	 
        - PNG == SecondCharacter:
        	    {Color:
                    -redC:
                        ~ player_red_second_char ++
                
                    -yellowC:
                        ~ player_yellow_second_char ++
                    
                    -blueC:
                        ~ player_blue_second_char ++
                    
                    -greenC:
                        ~ player_green_second_char ++   
                    
                    -purpleC:
                        ~ player_purple_second_char ++
                }
        	 
        - PNG == Mentor:
        	  {Color:
                    -redC:
                        ~ player_red_mentor ++
                
                    -yellowC:
                        ~ player_yellow_mentor ++
                    
                    -blueC:
                        ~ player_blue_mentor ++
                    
                    -greenC:
                        ~ player_green_mentor ++   
                    
                    -purpleC:
                        ~ player_purple_mentor ++
            }

    }
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
                ~ nest_temporaryFire ++
     
            -yellowC:
                ~ nest_temporaryEarth ++
            
            -blueC:
                ~ nest_temporaryAir++
            
            -greenC:
                ~ nest_temporaryWater++   
            
            -purpleC:
                ~ nest_temporaryAether ++
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
                ~ nest_temporaryFire ++
            - RossoRosso:
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                
            - RossoRossoRosso:
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
            
            - Giallo:
                ~ nest_temporaryEarth ++
            - GialloGiallo:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
            - GialloGialloGiallo:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
            
            - Blu:
                ~ nest_temporaryAir++
            - BluBlu:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
            - BluBluBlu:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
            
            - Verde:
                ~ nest_temporaryWater++
            - VerdeVerde:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
            - VerdeVerdeVerde:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
            
            - Viola:
                ~ nest_temporaryAether ++
            - ViolaViola:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
            - ViolaViolaViola:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                
        //Variazioni di due colori
            - RossoRossoBlu:
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                ~ nest_temporaryAir--
                
            - RossoRossoVerde:
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                ~ nest_temporaryWater--
                
            - RossoRossoViola:
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                ~ nest_temporaryAether --
                
            - RossoRossoGiallo:
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                ~ nest_temporaryEarth --
                
            - RossoGiallo:
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryEarth --
                
            - RossoGialloRosso:
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
            
            - RossoGialloGiallo:
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
            
            - RossoBlu:
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryAir--
                
            - RossoBluBlu:
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
            
            - RossoBluRosso:
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryFire --
            
            - RossoVerde: 
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryWater--
            
            - RossoVerdeVerde:
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
            
            - RossoVerdeRosso:
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryFire --
            
            - RossoViola:
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryAether --
                
            - RossoViolaViola:
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
            
            - RossoViolaRosso:
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryFire --
            
            
            
            
            
            - GialloVerde:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryWater--
        
            - GialloViola:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryAether --
            
            - GialloRosso:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryFire --
            
            - GialloBlu:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryAir--
                
                
            - GialloRossoGiallo:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                ~ nest_temporaryEarth --
                
            - GialloRossoRosso:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                
            - GialloGialloVerde:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                ~ nest_temporaryWater--
                
            - GialloGialloViola:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                ~ nest_temporaryAether --
                
            - GialloGialloBlu:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                ~ nest_temporaryAir--
                
            - GialloGialloRosso:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                ~ nest_temporaryFire --
                
            
            - GialloBluBlu:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                
            - GialloBluGiallo:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryEarth --
                
                
            - GialloVerdeVerde:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                
            - GialloVerdeGiallo:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryEarth --
                
            - GialloViolaViola:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                
            - GialloViolaGiallo:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryEarth --
                
            
            
            
            
            
            
            
            - BluRosso:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryFire --
                
            - BluGiallo:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryEarth --
                
            - BluVerde:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryWater--
                
            - BluViola:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAether --
                
            - BluRossoBlu:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                ~ nest_temporaryAir--
                
            - BluRossoRosso:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                
            - BluGialloBlu:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                ~ nest_temporaryAir--
                
            - BluGialloGiallo:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                
            - BluBluVerde:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryWater--
                
            - BluBluViola:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryAether --
                
            - BluBluGiallo:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryEarth --
                
            - BluBluRosso:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryFire --
                
            - BluVerdeVerde:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                
            - BluVerdeBlu:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryAir--
                
            - BluViolaViola:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                
            
            
            
            
            
            
            
            - VerdeRosso:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryFire --
                
            - VerdeViola:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryAether --
                
            - VerdeGiallo:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryEarth --
                
            - VerdeBlu:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryAir--
                
            - VerdeRossoVerde:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                ~ nest_temporaryWater--
                
            - VerdeRossoRosso:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                
            - VerdeGialloVerde:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                ~ nest_temporaryWater--
                
            - VerdeGialloGiallo:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                
            - VerdeBluVerde:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryWater--
                
            - VerdeBluBlu:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                
            - VerdeVerdeViola:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryAether --
                
            - VerdeVerdeBlu:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryAir--
                
            - VerdeVerdeGiallo:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryEarth --
                
            - VerdeVerdeRosso:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryFire --
                
            - VerdeViolaVerde:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryWater--
                
            - VerdeViolaViola:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                
            
            
            
            
            - ViolaRosso:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryFire --
                
            - ViolaGiallo:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryEarth --
                
            - ViolaBlu:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAir--
                
            - ViolaVerde:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryWater--
                
            - ViolaRossoViola:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                ~ nest_temporaryAether --
                
            - ViolaRossoRosso:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                
            - ViolaGialloViola:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                ~ nest_temporaryAether --
                
            - ViolaGialloGiallo:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                
            - ViolaBluViola:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryAether --
                
            - ViolaBluBlu:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                
            - ViolaVerdeVerde:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                
            - ViolaVerdeViola:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryAether --
                
            - ViolaViolaVerde:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryWater--
                
            - ViolaViolaBlu:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryAir--
                
            - ViolaViolaGiallo:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryEarth --
                
            - ViolaViolaRosso:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryFire --
                
        
        
        //Varizioni di tre colori
            - RossoGialloBlu: 
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                ~ nest_temporaryAir--
            
            - RossoGialloVerde: 
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                ~ nest_temporaryWater--
            
            - RossoGialloViola: 
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                ~ nest_temporaryAether --
            
            - RossoBluVerde: 
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryWater--
            
            - RossoBluViola: 
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryAether --
            
            - RossoBluGiallo: 
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryEarth --
            
            - RossoVerdeBlu: 
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryAir--
            
            - RossoVerdeViola: 
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryAether --
            
            - RossoVerdeGiallo: 
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryEarth --
            
            - RossoViolaGiallo:
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryEarth --
                
            - RossoViolaVerde:
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryWater--
                
            - RossoViolaBlu:
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++ 
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryAir--
                
        
        
        
        
            - GialloRossoVerde:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                ~ nest_temporaryWater--
                
            - GialloRossoViola:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                ~ nest_temporaryAether --
                
            - GialloRossoBlu:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                ~ nest_temporaryAir--
                
            - GialloBluVerde:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryWater--
                
            - GialloBluViola:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryAether --
                
            - GialloBluRosso:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryFire --
                
            - GialloVerdeViola:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryAether --
                
            - GialloVerdeBlu:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryAir--
                
            - GialloVerdeRosso:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryFire --
                
            - GialloViolaVerde:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryWater--
                
            - GialloViolaBlu:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryAir--
                
            - GialloViolaRosso:
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryEarth ++
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryFire --
                
                
                
                
                
            
            - BluRossoVerde:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryFire ++
                ~ nest_temporaryFire ++
                
            - BluRossoViola:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                ~ nest_temporaryAether --
                
            - BluRossoGiallo:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                ~ nest_temporaryEarth --
                
            - BluGialloVerde:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                ~ nest_temporaryWater--
                
            - BluGialloViola:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                ~ nest_temporaryAether --
                
            - BluGialloRosso:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                ~ nest_temporaryFire --
                
            - BluVerdeViola:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryAether --
                
            - BluVerdeGiallo:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryEarth --
                
            - BluVerdeRosso:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryFire --
                
            - BluViolaVerde:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryWater--
                
            - BluViolaBlu:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryAir--
                
            - BluViolaGiallo:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryEarth --
                
            - BluViolaRosso:
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAir++
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryFire --
                
            
            - VerdeRossoViola:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                ~ nest_temporaryAether --
                
            - VerdeRossoBlu:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                ~ nest_temporaryAir--
                
            - VerdeRossoGiallo:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                ~ nest_temporaryEarth --
                
            - VerdeGialloViola:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                ~ nest_temporaryAether --
                
            - VerdeGialloBlu:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                ~ nest_temporaryAir--
                
            - VerdeBluViola:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryAether --
                
            - VerdeBluGiallo:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryEarth --
                
            - VerdeBluRosso:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryFire --
                
            - VerdeGialloRosso:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                ~ nest_temporaryFire --
                
            - VerdeViolaBlu:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryAir--
                
            - VerdeViolaGiallo:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryEarth --
                
            - VerdeViolaRosso:
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryWater++
                ~ nest_temporaryAether --
                ~ nest_temporaryAether --
                ~ nest_temporaryFire --
                
            
            
            
            
            
            
            
            - ViolaRossoVerde:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                ~ nest_temporaryWater--
                
            - ViolaRossoBlu:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                ~ nest_temporaryAir--
                
            - ViolaRossoGiallo:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryFire --
                ~ nest_temporaryFire --
                ~ nest_temporaryEarth --
                
            - ViolaGialloVerde:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                ~ nest_temporaryWater--
                
            - ViolaGialloBlu:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                ~ nest_temporaryAir--
                
            - ViolaGialloRosso:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryEarth --
                ~ nest_temporaryEarth --
                ~ nest_temporaryFire --
                
            - ViolaBluVerde:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryWater--
                
            - ViolaBluGiallo:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryEarth --
                
            - ViolaBluRosso:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAir--
                ~ nest_temporaryAir--
                ~ nest_temporaryFire --
                
            
            - ViolaVerdeBlu:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryAir--
                
            - ViolaVerdeGiallo:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryEarth --
                
            - ViolaVerdeRosso:
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryAether ++
                ~ nest_temporaryWater--
                ~ nest_temporaryWater--
                ~ nest_temporaryFire --
                
            
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
            ~ firstChar_fire+= nest_temporaryFire
            ~ firstChar_earth += nest_temporaryEarth
            ~ firstChar_air += nest_temporaryAir
            ~ firstChar_water += nest_temporaryWater
            ~ firstChar_aether += nest_temporaryAether
        
        - nest_currentTalker == SecondCharacter:
            ~ secondChar_fire += nest_temporaryFire
            ~ secondChar_earth += nest_temporaryEarth
            ~ secondChar_air += nest_temporaryAir
            ~ secondChar_water += nest_temporaryWater
            ~ secondChar_aether += nest_temporaryAether
        
        - nest_currentTalker == Mentor:
            ~ mentor_red += nest_temporaryFire
            ~ mentor_yellow += nest_temporaryEarth
            ~ mentor_blue += nest_temporaryAir
            ~ mentor_green += nest_temporaryWater
            ~ mentor_purple += nest_temporaryAether
    }

    //Poi azzeriamo i valori temporanei
        ~ nest_currentTalker = ()
        ~ nest_temporaryFire = 0
        ~ nest_temporaryEarth = 0
        ~ nest_temporaryAir= 0
        ~ nest_temporaryWater= 0
        ~ nest_temporaryAether = 0
    {debug_nest: dopo l'operazione il parlante attuale {nest_currentTalker}.}

->->

