=== emotional_words_management(action)
    //Abilito il box di dialogo ad hoc per il Nest
        ~ enableNestDialogue()

//Questa è la funzione che usiamo sia per rimuovere che per attivare una parola posseduta.
{debug_nest: emotional_words_management(action). Il valore di action è {action}.}

    {
        - action == Activate: Quale parola vuoi attivare?
        - action == Delete: Quale parola vuoi cancellare?
    
    } 

    //Ho cambiato idea è all'inizio così (dovrebbe) comparire sempre come ultima scelta su unity, e quindi centrata in basso
    + [Ho cambiato idea]


//Tre note

    + {nest_ownedEmotionalWords has RossoBluVerde}[RossoBluVerde]
        {
            - action == Activate: RossoBluVerde è stata attivata.
                ~ nest_activeEmotionalWord = RossoBluVerde
                ~ nest_ownedEmotionalWords -= RossoBluVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoBluVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoBluVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoBluVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has RossoBluViola}[RossoBluViola]
        {
            - action == Activate: RossoBluViola è stata attivata.
                ~ nest_activeEmotionalWord = RossoBluViola
                ~ nest_ownedEmotionalWords -= RossoBluViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoBluViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoBluViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoBluViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }
        
        
    + {nest_ownedEmotionalWords has RossoBluGiallo}[RossoBluGiallo]
        {
            - action == Activate: RossoBluGiallo è stata attivata.
                ~ nest_activeEmotionalWord = RossoBluGiallo
                ~ nest_ownedEmotionalWords -= RossoBluGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoBluGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoBluGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoBluGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }        

    
    + {nest_ownedEmotionalWords has RossoVerdeBlu}[RossoVerdeBlu]
        {
            - action == Activate: RossoVerdeBlu è stata attivata.
                ~ nest_activeEmotionalWord = RossoVerdeBlu
                ~ nest_ownedEmotionalWords -= RossoVerdeBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoVerdeBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoVerdeBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoVerdeBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
        

    + {nest_ownedEmotionalWords has RossoViolaBlu}[RossoViolaBlu]
        {
            - action == Activate: RossoViolaBlu è stata attivata.
                ~ nest_activeEmotionalWord = RossoViolaBlu
                ~ nest_ownedEmotionalWords -= RossoViolaBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoViolaBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoViolaBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoViolaBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has RossoViolaVerde}[RossoViolaVerde]
        {
            - action == Activate: RossoViolaVerde è stata attivata.
                ~ nest_activeEmotionalWord = RossoViolaVerde
                ~ nest_ownedEmotionalWords -= RossoViolaVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoViolaVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoViolaVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoViolaVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
        

 
 //Varianti a dominante Giallo

    //Tre note
    + {nest_ownedEmotionalWords has GialloRossoVerde}[GialloRossoVerde]
        {
            - action == Activate: GialloRossoVerde è stata attivata.
                ~ nest_activeEmotionalWord = GialloRossoVerde
                ~ nest_ownedEmotionalWords -= GialloRossoVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloRossoVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloRossoVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloRossoVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has GialloRossoViola}[GialloRossoViola]
        {
            - action == Activate: GialloRossoViola è stata attivata.
                ~ nest_activeEmotionalWord = GialloRossoViola
                ~ nest_ownedEmotionalWords -= GialloRossoViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloRossoViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloRossoViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloRossoViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has GialloRossoBlu}[GialloRossoBlu]
        {
            - action == Activate: GialloRossoBlu è stata attivata.
                ~ nest_activeEmotionalWord = GialloRossoBlu
                ~ nest_ownedEmotionalWords -= GialloRossoBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloRossoBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloRossoBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloRossoBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    

    + {nest_ownedEmotionalWords has GialloBluVerde}[GialloBluVerde]
        {
            - action == Activate: GialloBluVerde è stata attivata.
                ~ nest_activeEmotionalWord = GialloBluVerde
                ~ nest_ownedEmotionalWords -= GialloBluVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloBluVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloBluVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloBluVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        } 
    
    + {nest_ownedEmotionalWords has GialloBluViola}[GialloBluViola]
        {
            - action == Activate: GialloBluViola è stata attivata.
                ~ nest_activeEmotionalWord = GialloBluViola
                ~ nest_ownedEmotionalWords -= GialloBluViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloBluViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloBluViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloBluViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has GialloBluRosso}[GialloBluRosso]
        {
            - action == Activate: GialloBluRosso è stata attivata.
                ~ nest_activeEmotionalWord = GialloBluRosso
                ~ nest_ownedEmotionalWords -= GialloBluRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloBluRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloBluRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloBluRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }        

    
    + {nest_ownedEmotionalWords has GialloVerdeViola}[GialloVerdeViola]
        {
            - action == Activate: GialloVerdeViola è stata attivata.
                ~ nest_activeEmotionalWord = GialloVerdeViola
                ~ nest_ownedEmotionalWords -= GialloVerdeViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloVerdeViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloVerdeViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloVerdeViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has GialloVerdeBlu}[GialloVerdeBlu]
        {
            - action == Activate: GialloVerdeBlu è stata attivata.
                ~ nest_activeEmotionalWord = GialloVerdeBlu
                ~ nest_ownedEmotionalWords -= GialloVerdeBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloVerdeBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloVerdeBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloVerdeBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    
    + {nest_ownedEmotionalWords has GialloVerdeRosso}[GialloVerdeRosso]
        {
            - action == Activate: GialloVerdeRosso è stata attivata.
                ~ nest_activeEmotionalWord = GialloVerdeRosso
                ~ nest_ownedEmotionalWords -= GialloVerdeRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloVerdeRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloVerdeRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloVerdeRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has GialloViolaVerde}[GialloViolaVerde]
        {
            - action == Activate: GialloViolaVerde è stata attivata.
                ~ nest_activeEmotionalWord = GialloViolaVerde
                ~ nest_ownedEmotionalWords -= GialloViolaVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloViolaVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloViolaVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloViolaVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
        
    + {nest_ownedEmotionalWords has GialloViolaBlu}[GialloViolaBlu]
        {
            - action == Activate: GialloViolaBlu è stata attivata.
                ~ nest_activeEmotionalWord = GialloViolaBlu
                ~ nest_ownedEmotionalWords -= GialloViolaBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloViolaBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloViolaBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloViolaBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    
    + {nest_ownedEmotionalWords has GialloViolaRosso}[GialloViolaRosso]
        {
            - action == Activate: GialloViolaRosso è stata attivata.
                ~ nest_activeEmotionalWord = GialloViolaRosso
                ~ nest_ownedEmotionalWords -= GialloViolaRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloViolaRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloViolaRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloViolaRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
 
 
 

    
    //Tre note
    + {nest_ownedEmotionalWords has BluRossoVerde}[BluRossoVerde]
        {
            - action == Activate: BluRossoVerde è stata attivata.
                ~ nest_activeEmotionalWord = BluRossoVerde
                ~ nest_ownedEmotionalWords -= BluRossoVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluRossoVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluRossoVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluRossoVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has BluRossoViola}[BluRossoViola]
        {
            - action == Activate: BluRossoViola è stata attivata.
                ~ nest_activeEmotionalWord = BluRossoViola
                ~ nest_ownedEmotionalWords -= BluRossoViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluRossoViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluRossoViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluRossoViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    
    + {nest_ownedEmotionalWords has BluRossoGiallo}[BluRossoGiallo]
        {
            - action == Activate: BluRossoGiallo è stata attivata.
                ~ nest_activeEmotionalWord = BluRossoGiallo
                ~ nest_ownedEmotionalWords -= BluRossoGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    

            - action == Delete: BluRossoGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluRossoGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluRossoGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    

    + {nest_ownedEmotionalWords has BluGialloVerde}[BluGialloVerde]
        {
            - action == Activate: BluGialloVerde è stata attivata.
                ~ nest_activeEmotionalWord = BluGialloVerde
                ~ nest_ownedEmotionalWords -= BluGialloVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluGialloVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluGialloVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluGialloVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
        
    + {nest_ownedEmotionalWords has BluGialloViola}[BluGialloViola]
        {
            - action == Activate: BluGialloViola è stata attivata.
                ~ nest_activeEmotionalWord = BluGialloViola
                ~ nest_ownedEmotionalWords -= BluGialloViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluGialloViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluGialloViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluGialloViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    

    + {nest_ownedEmotionalWords has BluGialloRosso}[BluGialloRosso]
        {
            - action == Activate: BluGialloRosso è stata attivata.
                ~ nest_activeEmotionalWord = BluGialloRosso
                ~ nest_ownedEmotionalWords -= BluGialloRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluGialloRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluGialloRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluGialloRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        } 
    
      

    

        
    + {nest_ownedEmotionalWords has BluVerdeViola}[BluVerdeViola]
        {
            - action == Activate: BluVerdeViola è stata attivata.
                ~ nest_activeEmotionalWord = BluVerdeViola
                ~ nest_ownedEmotionalWords -= BluVerdeViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluVerdeViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluVerdeViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluVerdeViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has BluVerdeGiallo}[BluVerdeGiallo]
        {
            - action == Activate: BluVerdeGiallo è stata attivata.
                ~ nest_activeEmotionalWord = BluVerdeGiallo
                ~ nest_ownedEmotionalWords -= BluVerdeGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluVerdeGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluVerdeGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluVerdeGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has BluVerdeRosso}[BluVerdeRosso]
        {
            - action == Activate: BluVerdeRosso è stata attivata.
                ~ nest_activeEmotionalWord = BluVerdeRosso
                ~ nest_ownedEmotionalWords -= BluVerdeRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluVerdeRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluVerdeRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluVerdeRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has BluViolaVerde}[BluViolaVerde]
        {
            - action == Activate: BluViolaVerde è stata attivata.
                ~ nest_activeEmotionalWord = BluViolaVerde
                ~ nest_ownedEmotionalWords -= BluViolaVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluViolaVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluViolaVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluViolaVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
        
    
    + {nest_ownedEmotionalWords has BluViolaRosso}[BluViolaRosso]
        {
            - action == Activate: BluViolaRosso è stata attivata.
                ~ nest_activeEmotionalWord = BluViolaRosso
                ~ nest_ownedEmotionalWords -= BluViolaRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluViolaRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluViolaRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluViolaRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
 
 
 
 
 
 
    + {nest_ownedEmotionalWords has VerdeRossoViola}[VerdeRossoViola]
        {
            - action == Activate: VerdeRossoViola è stata attivata.
                ~ nest_activeEmotionalWord = VerdeRossoViola
                ~ nest_ownedEmotionalWords -= VerdeRossoViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeRossoViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeRossoViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeRossoViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has VerdeRossoBlu}[VerdeRossoBlu]
        {
            - action == Activate: VerdeRossoBlu è stata attivata.
                ~ nest_activeEmotionalWord = VerdeRossoBlu
                ~ nest_ownedEmotionalWords -= VerdeRossoBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    

           - action == Delete: VerdeRossoBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeRossoBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeRossoBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has VerdeRossoGiallo}[VerdeRossoGiallo]
        {
            - action == Activate: VerdeRossoGiallo è stata attivata.
                ~ nest_activeEmotionalWord = VerdeRossoGiallo
                ~ nest_ownedEmotionalWords -= VerdeRossoGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    

            - action == Delete: VerdeRossoGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeRossoGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeRossoGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
        
    + {nest_ownedEmotionalWords has VerdeGialloViola}[VerdeGialloViola]
        {
            - action == Activate: VerdeGialloViola è stata attivata.
                ~ nest_activeEmotionalWord = VerdeGialloViola
                ~ nest_ownedEmotionalWords -= VerdeGialloViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeGialloViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeGialloViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeGialloViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has VerdeGialloBlu}[VerdeGialloBlu]
        {
            - action == Activate: VerdeGialloBlu è stata attivata.
                ~ nest_activeEmotionalWord = VerdeGialloBlu
                ~ nest_ownedEmotionalWords -= VerdeGialloBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeGialloBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeGialloBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeGialloBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    

    
    + {nest_ownedEmotionalWords has VerdeGialloRosso}[VerdeGialloRosso]
        {
            - action == Activate: VerdeGialloRosso è stata attivata.
                ~ nest_activeEmotionalWord = VerdeGialloRosso
                ~ nest_ownedEmotionalWords -= VerdeGialloRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeGialloRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeGialloRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeGialloRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        } 

    + {nest_ownedEmotionalWords has VerdeBluViola}[VerdeBluViola]
        {
            - action == Activate: VerdeBluViola è stata attivata.
                ~ nest_activeEmotionalWord = VerdeBluViola
                ~ nest_ownedEmotionalWords -= VerdeBluViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeBluViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeBluViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeBluViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }
        

        
    + {nest_ownedEmotionalWords has VerdeBluGiallo}[VerdeBluGiallo]
        {
            - action == Activate: VerdeBluGiallo è stata attivata.
                ~ nest_activeEmotionalWord = VerdeBluGiallo
                ~ nest_ownedEmotionalWords -= VerdeBluGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeBluGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeBluGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeBluGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }        

    
    + {nest_ownedEmotionalWords has VerdeBluRosso}[VerdeBluRosso]
        {
            - action == Activate: VerdeBluRosso è stata attivata.
                ~ nest_activeEmotionalWord = VerdeBluRosso
                ~ nest_ownedEmotionalWords -= VerdeBluRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeBluRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeBluRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeBluRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
        


    

    + {nest_ownedEmotionalWords has VerdeViolaBlu}[VerdeViolaBlu]
        {
            - action == Activate: VerdeViolaBlu è stata attivata.
                ~ nest_activeEmotionalWord = VerdeViolaBlu
                ~ nest_ownedEmotionalWords -= VerdeViolaBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeViolaBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeViolaBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeViolaBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has VerdeViolaGiallo}[VerdeViolaGiallo]
        {
            - action == Activate: VerdeViolaGiallo è stata attivata.
                ~ nest_activeEmotionalWord = VerdeViolaGiallo
                ~ nest_ownedEmotionalWords -= VerdeViolaGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeViolaGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeViolaGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeViolaGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has VerdeViolaRosso}[VerdeViolaRosso]
        {
            - action == Activate: VerdeViolaRosso è stata attivata.
                ~ nest_activeEmotionalWord = VerdeViolaRosso
                ~ nest_ownedEmotionalWords -= VerdeViolaRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeViolaRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeViolaRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeViolaRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
 
 
 
 
 
 //Varianti a dominante viola
 
    
    //Tre note
    + {nest_ownedEmotionalWords has ViolaRossoVerde}[ViolaRossoVerde]
        {
            - action == Activate: ViolaRossoVerde è stata attivata.
                ~ nest_activeEmotionalWord = ViolaRossoVerde
                ~ nest_ownedEmotionalWords -= ViolaRossoVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaRossoVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaRossoVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaRossoVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }

    + {nest_ownedEmotionalWords has ViolaRossoBlu}[ViolaRossoBlu]
        {
            - action == Activate: ViolaRossoBlu è stata attivata.
                ~ nest_activeEmotionalWord = ViolaRossoBlu
                ~ nest_ownedEmotionalWords -= ViolaRossoBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    

           - action == Delete: ViolaRossoBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaRossoBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaRossoBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has ViolaRossoGiallo}[ViolaRossoGiallo]
        {
            - action == Activate: ViolaRossoGiallo è stata attivata.
                ~ nest_activeEmotionalWord = ViolaRossoGiallo
                ~ nest_ownedEmotionalWords -= ViolaRossoGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    

            - action == Delete: ViolaRossoGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaRossoGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaRossoGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }

    + {nest_ownedEmotionalWords has ViolaGialloVerde}[ViolaGialloVerde]
        {
            - action == Activate: ViolaGialloVerde è stata attivata.
                ~ nest_activeEmotionalWord = ViolaGialloVerde
                ~ nest_ownedEmotionalWords -= ViolaGialloVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaGialloVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaGialloVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaGialloVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }

    
    + {nest_ownedEmotionalWords has ViolaGialloBlu}[ViolaGialloBlu]
        {
            - action == Activate: ViolaGialloBlu è stata attivata.
                ~ nest_activeEmotionalWord = ViolaGialloBlu
                ~ nest_ownedEmotionalWords -= ViolaGialloBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaGialloBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaGialloBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaGialloBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
  
    
    + {nest_ownedEmotionalWords has ViolaGialloRosso}[ViolaGialloRosso]
        {
            - action == Activate: ViolaGialloRosso è stata attivata.
                ~ nest_activeEmotionalWord = ViolaGialloRosso
                ~ nest_ownedEmotionalWords -= ViolaGialloRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaGialloRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaGialloRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaGialloRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        } 
    
    + {nest_ownedEmotionalWords has ViolaBluVerde}[ViolaBluVerde]
        {
            - action == Activate: ViolaBluVerde è stata attivata.
                ~ nest_activeEmotionalWord = ViolaBluVerde
                ~ nest_ownedEmotionalWords -= ViolaBluVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaBluVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaBluVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaBluVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    

        
    + {nest_ownedEmotionalWords has ViolaBluGiallo}[ViolaBluGiallo]
        {
            - action == Activate: ViolaBluGiallo è stata attivata.
                ~ nest_activeEmotionalWord = ViolaBluGiallo
                ~ nest_ownedEmotionalWords -= ViolaBluGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaBluGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaBluGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaBluGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }        

    
    + {nest_ownedEmotionalWords has ViolaBluRosso}[ViolaBluRosso]
        {
            - action == Activate: ViolaBluRosso è stata attivata.
                ~ nest_activeEmotionalWord = ViolaBluRosso
                ~ nest_ownedEmotionalWords -= ViolaBluRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaBluRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaBluRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaBluRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
        

    + {nest_ownedEmotionalWords has ViolaVerdeBlu}[ViolaVerdeBlu]
        {
            - action == Activate: ViolaVerdeBlu è stata attivata.
                ~ nest_activeEmotionalWord = ViolaVerdeBlu
                ~ nest_ownedEmotionalWords -= ViolaVerdeBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaVerdeBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaVerdeBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaVerdeBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has ViolaVerdeGiallo}[ViolaVerdeGiallo]
        {
            - action == Activate: ViolaVerdeGiallo è stata attivata.
                ~ nest_activeEmotionalWord = ViolaVerdeGiallo
                ~ nest_ownedEmotionalWords -= ViolaVerdeGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaVerdeGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaVerdeGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaVerdeGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has ViolaVerdeRosso}[ViolaVerdeRosso]
        {
            - action == Activate: ViolaVerdeRosso è stata attivata.
                ~ nest_activeEmotionalWord = ViolaVerdeRosso
                ~ nest_ownedEmotionalWords -= ViolaVerdeRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaVerdeRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaVerdeRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaVerdeRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    

    -
    
    {
        - nest_activeEmotionalWord != ():
            -> word_usage_counter ->
    }
    
    //Disabilito il box di dialogo ad hoc per il Nest
        ~ disableNestDialogue()
    

->->

//Utilizzato per capire quante volte posso usare una parola
=== word_usage_counter
{debug_nest: passo per word_usage_counter.}
{debug_nest: prima dell'aggiornamento il valore di temporaryWordUsageCounter è {temporaryWordUsageCounter}.}
    
TODO: capire cosa manca qui sotto per farlo usare    
    // {
    //     - nest_oneUseWords  has nest_activeEmotionalWord:
    //         ~ temporaryWordUsageCounter = 1
        
    //     - nest_twoUseWords  has nest_activeEmotionalWord:
    //         ~ temporaryWordUsageCounter = 2
        
    //     - nest_threeUseWords has nest_activeEmotionalWord:
    //         ~ temporaryWordUsageCounter = 3
        
    //     - else: ERROR, non riesco a trovare {nest_activeEmotionalWord} in nessuna delle tre liste, per cui non riesco ad assegnare un valore a temporaryWordUsageCounter, che ora è a {temporaryWordUsageCounter}.
    // }
    
{debug_nest: dopo l'aggiornamento il valore di temporaryWordUsageCounter è {temporaryWordUsageCounter}.}  
        
        ->->
