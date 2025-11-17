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

//Varianti monocolore
    + {nest_ownedEmotionalWords has Rosso}[Rosso]
        {
            - action == Activate: Rosso è stata attivata.
                ~ nest_activeEmotionalWord = Rosso
                ~ nest_ownedEmotionalWords -= Rosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: Rosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= Rosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso Rosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }
        
    + {nest_ownedEmotionalWords has RossoRosso}[RossoRosso]
        {
            - action == Activate: RossoRosso è stata attivata.
                ~ nest_activeEmotionalWord = RossoRosso
                ~ nest_ownedEmotionalWords -= RossoRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }  
        
    + {nest_ownedEmotionalWords has RossoRossoRosso}[RossoRossoRosso]
        {
            - action == Activate: RossoRossoRosso è stata attivata.
                ~ nest_activeEmotionalWord = RossoRossoRosso
                ~ nest_ownedEmotionalWords -= RossoRossoRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoRossoRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoRossoRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoRossoRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }        

    
    + {nest_ownedEmotionalWords has Giallo}[Giallo]
        {
            - action == Activate: Giallo è stata attivata.
                ~ nest_activeEmotionalWord = Giallo
                ~ nest_ownedEmotionalWords -= Giallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: Giallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= Giallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso Giallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
        
    + {nest_ownedEmotionalWords has GialloGiallo}[GialloGiallo]
        {
            - action == Activate: GialloGiallo è stata attivata.
                ~ nest_activeEmotionalWord = GialloGiallo
                ~ nest_ownedEmotionalWords -= GialloGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has GialloGialloGiallo}[GialloGialloGiallo]
        {
            - action == Activate: GialloGialloGiallo è stata attivata.
                ~ nest_activeEmotionalWord = GialloGialloGiallo
                ~ nest_ownedEmotionalWords -= GialloGialloGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloGialloGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloGialloGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloGialloGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has Verde}[Verde]
        {
            - action == Activate: Verde è stata attivata.
                ~ nest_activeEmotionalWord = Verde
                ~ nest_ownedEmotionalWords -= Verde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: Verde è stata cancellata.
                ~ nest_ownedEmotionalWords -= Verde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso Verde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has VerdeVerde}[VerdeVerde]
        {
            - action == Activate: VerdeVerde è stata attivata.
                ~ nest_activeEmotionalWord = VerdeVerde
                ~ nest_ownedEmotionalWords -= VerdeVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has VerdeVerdeVerde}[VerdeVerdeVerde]
        {
            - action == Activate: VerdeVerdeVerde è stata attivata.
                ~ nest_activeEmotionalWord = VerdeVerdeVerde
                ~ nest_ownedEmotionalWords -= VerdeVerdeVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeVerdeVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeVerdeVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeVerdeVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has Viola}[Viola]
        {
            - action == Activate: Viola è stata attivata.
                ~ nest_activeEmotionalWord = Viola
                ~ nest_ownedEmotionalWords -= Viola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: Viola è stata cancellata.
                ~ nest_ownedEmotionalWords -= Viola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso Viola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
        
    + {nest_ownedEmotionalWords has ViolaViola}[ViolaViola]
        {
            - action == Activate: ViolaViola è stata attivata.
                ~ nest_activeEmotionalWord = ViolaViola
                ~ nest_ownedEmotionalWords -= ViolaViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has ViolaViolaViola}[ViolaViolaViola]
        {
            - action == Activate: ViolaViolaViola è stata attivata.
                ~ nest_activeEmotionalWord = ViolaViolaViola
                ~ nest_ownedEmotionalWords -= ViolaViolaViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaViolaViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaViolaViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaViolaViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has Blu}[Blu]
        {
            - action == Activate: Blu è stata attivata.
                ~ nest_activeEmotionalWord = Blu
                ~ nest_ownedEmotionalWords -= Blu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: Blu è stata cancellata.
                ~ nest_ownedEmotionalWords -= Blu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso Blu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has BluBlu}[BluBlu]
        {
            - action == Activate: BluBlu è stata attivata.
                ~ nest_activeEmotionalWord = BluBlu
                ~ nest_ownedEmotionalWords -= BluBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        } 
    
    + {nest_ownedEmotionalWords has BluBluBlu}[BluBluBlu]
        {
            - action == Activate: BluBluBlu è stata attivata.
                ~ nest_activeEmotionalWord = BluBluBlu
                ~ nest_ownedEmotionalWords -= BluBluBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluBluBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluBluBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluBluBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
        
    
 //Varianti a dominante Rosso
    //Due note
    + {nest_ownedEmotionalWords has RossoGiallo}[RossoGiallo]
        {
            - action == Activate: RossoGiallo è stata attivata.
                ~ nest_activeEmotionalWord = RossoGiallo
                ~ nest_ownedEmotionalWords -= RossoGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }
        
    + {nest_ownedEmotionalWords has RossoBlu}[RossoBlu]
        {
            - action == Activate: RossoBlu è stata attivata.
                ~ nest_activeEmotionalWord = RossoBlu
                ~ nest_ownedEmotionalWords -= RossoBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }  
        
    + {nest_ownedEmotionalWords has RossoVerde}[RossoVerde]
        {
            - action == Activate: RossoVerde è stata attivata.
                ~ nest_activeEmotionalWord = RossoVerde
                ~ nest_ownedEmotionalWords -= RossoVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }        

    
    + {nest_ownedEmotionalWords has RossoViola}[RossoViola]
        {
            - action == Activate: RossoViola è stata attivata.
                ~ nest_activeEmotionalWord = RossoViola
                ~ nest_ownedEmotionalWords -= RossoViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
        
    
    //Tre note
    + {nest_ownedEmotionalWords has RossoRossoBlu}[RossoRossoBlu]
        {
            - action == Activate: RossoRossoBlu è stata attivata.
                ~ nest_activeEmotionalWord = RossoRossoBlu
                ~ nest_ownedEmotionalWords -= RossoRossoBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoRossoBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoRossoBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoRossoBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has RossoRossoVerde}[RossoRossoVerde]
        {
            - action == Activate: RossoRossoVerde è stata attivata.
                ~ nest_activeEmotionalWord = RossoRossoVerde
                ~ nest_ownedEmotionalWords -= RossoRossoVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoRossoVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoRossoVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoRossoVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has RossoRossoViola}[RossoRossoViola]
        {
            - action == Activate: RossoRossoViola è stata attivata.
                ~ nest_activeEmotionalWord = RossoRossoViola
                ~ nest_ownedEmotionalWords -= RossoRossoViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoRossoViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoRossoViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoRossoViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has RossoRossoGiallo}[RossoRossoGiallo]
        {
            - action == Activate: RossoRossoGiallo è stata attivata.
                ~ nest_activeEmotionalWord = RossoRossoGiallo
                ~ nest_ownedEmotionalWords -= RossoRossoGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoRossoGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoRossoGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoRossoGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has RossoGialloBlu}[RossoGialloBlu]
        {
            - action == Activate: RossoGialloBlu è stata attivata.
                ~ nest_activeEmotionalWord = RossoGialloBlu
                ~ nest_ownedEmotionalWords -= RossoGialloBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoGialloBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoGialloBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoGialloBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has RossoGialloVerde}[RossoGialloVerde]
        {
            - action == Activate: RossoGialloVerde è stata attivata.
                ~ nest_activeEmotionalWord = RossoGialloVerde
                ~ nest_ownedEmotionalWords -= RossoGialloVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoGialloVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoGialloVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoGialloVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
        
    + {nest_ownedEmotionalWords has RossoGialloViola}[RossoGialloViola]
        {
            - action == Activate: RossoGialloViola è stata attivata.
                ~ nest_activeEmotionalWord = RossoGialloViola
                ~ nest_ownedEmotionalWords -= RossoGialloViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoGialloViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoGialloViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoGialloViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has RossoGialloRosso}[RossoGialloRosso]
        {
            - action == Activate: RossoGialloRosso è stata attivata.
                ~ nest_activeEmotionalWord = RossoGialloRosso
                ~ nest_ownedEmotionalWords -= RossoGialloRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoGialloRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoGialloRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoGialloRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has RossoGialloGiallo}[RossoGialloGiallo]
        {
            - action == Activate: RossoGialloGiallo è stata attivata.
                ~ nest_activeEmotionalWord = RossoGialloGiallo
                ~ nest_ownedEmotionalWords -= RossoGialloGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoGialloGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoGialloGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoGialloGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has RossoBluBlu}[RossoBluBlu]
        {
            - action == Activate: RossoBluBlu è stata attivata.
                ~ nest_activeEmotionalWord = RossoBluBlu
                ~ nest_ownedEmotionalWords -= RossoBluBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoBluBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoBluBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoBluBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        } 
    
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
        
    + {nest_ownedEmotionalWords has RossoBluRosso}[RossoBluRosso]
        {
            - action == Activate: RossoBluRosso è stata attivata.
                ~ nest_activeEmotionalWord = RossoBluRosso
                ~ nest_ownedEmotionalWords -= RossoBluRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoBluRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoBluRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoBluRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
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
        
    + {nest_ownedEmotionalWords has RossoVerdeVerde}[RossoVerdeVerde]
        {
            - action == Activate: RossoVerdeVerde è stata attivata.
                ~ nest_activeEmotionalWord = RossoVerdeVerde
                ~ nest_ownedEmotionalWords -= RossoVerdeVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoVerdeVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoVerdeVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoVerdeVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has RossoVerdeViola}[RossoVerdeViola]
        {
            - action == Activate: RossoVerdeViola è stata attivata.
                ~ nest_activeEmotionalWord = RossoVerdeViola
                ~ nest_ownedEmotionalWords -= RossoVerdeViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoVerdeViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoVerdeViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoVerdeViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has RossoVerdeRosso}[RossoVerdeRosso]
        {
            - action == Activate: RossoVerdeRosso è stata attivata.
                ~ nest_activeEmotionalWord = RossoVerdeRosso
                ~ nest_ownedEmotionalWords -= RossoVerdeRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoVerdeRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoVerdeRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoVerdeRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has RossoVerdeGiallo}[RossoVerdeGiallo]
        {
            - action == Activate: RossoVerdeGiallo è stata attivata.
                ~ nest_activeEmotionalWord = RossoVerdeGiallo
                ~ nest_ownedEmotionalWords -= RossoVerdeGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoVerdeGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoVerdeGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoVerdeGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
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
        
    + {nest_ownedEmotionalWords has RossoViolaViola}[RossoViolaViola]
        {
            - action == Activate: RossoViolaViola è stata attivata.
                ~ nest_activeEmotionalWord = RossoViolaViola
                ~ nest_ownedEmotionalWords -= RossoViolaViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoViolaViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoViolaViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoViolaViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has RossoViolaRosso}[RossoViolaRosso]
        {
            - action == Activate: RossoViolaRosso è stata attivata.
                ~ nest_activeEmotionalWord = RossoViolaRosso
                ~ nest_ownedEmotionalWords -= RossoViolaRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoViolaRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoViolaRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoViolaRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has RossoViolaGiallo}[RossoViolaGiallo]
        {
            - action == Activate: RossoViolaGiallo è stata attivata.
                ~ nest_activeEmotionalWord = RossoViolaGiallo
                ~ nest_ownedEmotionalWords -= RossoViolaGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: RossoViolaGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= RossoViolaGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso RossoViolaGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
 
 //Varianti a dominante Giallo
     //Due note
    + {nest_ownedEmotionalWords has GialloRosso}[GialloRosso]
        {
            - action == Activate: GialloRosso è stata attivata.
                ~ nest_activeEmotionalWord = GialloRosso
                ~ nest_ownedEmotionalWords -= GialloRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }
        
    + {nest_ownedEmotionalWords has GialloBlu}[GialloBlu]
        {
            - action == Activate: GialloBlu è stata attivata.
                ~ nest_activeEmotionalWord = GialloBlu
                ~ nest_ownedEmotionalWords -= GialloBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }  
        
    + {nest_ownedEmotionalWords has GialloVerde}[GialloVerde]
        {
            - action == Activate:  GialloVerde è stata attivata.
                ~ nest_activeEmotionalWord = GialloVerde
                ~ nest_ownedEmotionalWords -= GialloVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete:  GialloVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -=  GialloVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso  GialloVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }        

    
    + {nest_ownedEmotionalWords has GialloViola}[GialloViola]
        {
            - action == Activate: GialloViola è stata attivata.
                ~ nest_activeEmotionalWord = GialloViola
                ~ nest_ownedEmotionalWords -= GialloViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
        
    
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
    
    + {nest_ownedEmotionalWords has GialloRossoGiallo}[GialloRossoGiallo]
        {
            - action == Activate: GialloRossoGiallo è stata attivata.
                ~ nest_activeEmotionalWord = GialloRossoGiallo
                ~ nest_ownedEmotionalWords -= GialloRossoGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloRossoGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloRossoGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloRossoGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has GialloRossoRosso}[GialloRossoRosso]
        {
            - action == Activate: GialloRossoRosso è stata attivata.
                ~ nest_activeEmotionalWord = GialloRossoRosso
                ~ nest_ownedEmotionalWords -= GialloRossoRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloRossoRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloRossoRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloRossoRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has GialloGialloVerde}[GialloGialloVerde]
        {
            - action == Activate: GialloGialloVerde è stata attivata.
                ~ nest_activeEmotionalWord = GialloGialloVerde
                ~ nest_ownedEmotionalWords -= GialloGialloVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloGialloVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloGialloVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloGialloVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
        
    + {nest_ownedEmotionalWords has GialloGialloViola}[GialloGialloViola]
        {
            - action == Activate: GialloGialloViola è stata attivata.
                ~ nest_activeEmotionalWord = GialloGialloViola
                ~ nest_ownedEmotionalWords -= GialloGialloViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloGialloViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloGialloViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloGialloViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has GialloGialloBlu}[GialloGialloBlu]
        {
            - action == Activate: GialloGialloBlu è stata attivata.
                ~ nest_activeEmotionalWord = GialloGialloBlu
                ~ nest_ownedEmotionalWords -= GialloGialloBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloGialloBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloGialloBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloGialloBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has GialloGialloRosso}[GialloGialloRosso]
        {
            - action == Activate: GialloGialloRosso è stata attivata.
                ~ nest_activeEmotionalWord = GialloGialloRosso
                ~ nest_ownedEmotionalWords -= GialloGialloRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloGialloRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloGialloRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloGialloRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
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
    
    + {nest_ownedEmotionalWords has GialloBluBlu}[GialloBluBlu]
        {
            - action == Activate: GialloBluBlu è stata attivata.
                ~ nest_activeEmotionalWord = GialloBluBlu
                ~ nest_ownedEmotionalWords -= GialloBluBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloBluBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloBluBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloBluBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }
        
    + {nest_ownedEmotionalWords has GialloBluGiallo}[GialloBluGiallo]
        {
            - action == Activate: GialloBluGiallo è stata attivata.
                ~ nest_activeEmotionalWord = GialloBluGiallo
                ~ nest_ownedEmotionalWords -= GialloBluGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloBluGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloBluGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloBluGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
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

    
    + {nest_ownedEmotionalWords has GialloVerdeVerde}[GialloVerdeVerde]
        {
            - action == Activate: GialloVerdeVerde è stata attivata.
                ~ nest_activeEmotionalWord = GialloVerdeVerde
                ~ nest_ownedEmotionalWords -= GialloVerdeVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloVerdeVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloVerdeVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloVerdeVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
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
    
    + {nest_ownedEmotionalWords has GialloVerdeGiallo}[GialloVerdeGiallo]
        {
            - action == Activate: GialloVerdeGiallo è stata attivata.
                ~ nest_activeEmotionalWord = GialloVerdeGiallo
                ~ nest_ownedEmotionalWords -= GialloVerdeGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloVerdeGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloVerdeGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloVerdeGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
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
    
    + {nest_ownedEmotionalWords has GialloViolaViola}[GialloViolaViola]
        {
            - action == Activate: GialloViolaViola è stata attivata.
                ~ nest_activeEmotionalWord = GialloViolaViola
                ~ nest_ownedEmotionalWords -= GialloViolaViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloViolaViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloViolaViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloViolaViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
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
    
    + {nest_ownedEmotionalWords has GialloViolaGiallo}[GialloViolaGiallo]
        {
            - action == Activate: GialloViolaGiallo è stata attivata.
                ~ nest_activeEmotionalWord = GialloViolaGiallo
                ~ nest_ownedEmotionalWords -= GialloViolaGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: GialloViolaGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= GialloViolaGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso GialloViolaGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
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
 
 
 
 
 //Varianti a dominante blu
         //Due note
    + {nest_ownedEmotionalWords has BluRosso}[BluRosso]
        {
            - action == Activate: BluRosso è stata attivata.
                ~ nest_activeEmotionalWord = BluRosso
                ~ nest_ownedEmotionalWords -= BluRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }
        
    + {nest_ownedEmotionalWords has BluGiallo}[BluGiallo]
        {
            - action == Activate: BluGiallo è stata attivata.
                ~ nest_activeEmotionalWord = BluGiallo
                ~ nest_ownedEmotionalWords -= BluGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }  
        
    + {nest_ownedEmotionalWords has BluVerde}[BluVerde]
        {
            - action == Activate:  BluVerde è stata attivata.
                ~ nest_activeEmotionalWord = BluVerde
                ~ nest_ownedEmotionalWords -= BluVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete:  BluVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -=  BluVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso  BluVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }        

    
    + {nest_ownedEmotionalWords has BluViola}[BluViola]
        {
            - action == Activate: BluViola è stata attivata.
                ~ nest_activeEmotionalWord = BluViola
                ~ nest_ownedEmotionalWords -= BluViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
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
    
    + {nest_ownedEmotionalWords has BluRossoBlu}[BluRossoBlu]
        {
            - action == Activate: BluRossoBlu è stata attivata.
                ~ nest_activeEmotionalWord = BluRossoBlu
                ~ nest_ownedEmotionalWords -= BluRossoBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    

           - action == Delete: BluRossoBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluRossoBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluRossoBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
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
    
    + {nest_ownedEmotionalWords has BluRossoRosso}[BluRossoRosso]
        {
            - action == Activate: BluRossoRosso è stata attivata.
                ~ nest_activeEmotionalWord = BluRossoRosso
                ~ nest_ownedEmotionalWords -= BluRossoRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluRossoRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluRossoRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluRossoRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
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
    
    + {nest_ownedEmotionalWords has BluGialloBlu}[BluGialloBlu]
        {
            - action == Activate: BluGialloBlu è stata attivata.
                ~ nest_activeEmotionalWord = BluGialloBlu
                ~ nest_ownedEmotionalWords -= GialloGialloBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluGialloBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluGialloBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluGialloBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has BluGialloGiallo}[BluGialloGiallo]
        {
            - action == Activate: BluGialloGiallo è stata attivata.
                ~ nest_activeEmotionalWord = BluGialloGiallo
                ~ nest_ownedEmotionalWords -= BluGialloGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluGialloGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluGialloGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluGialloGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
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
    
    + {nest_ownedEmotionalWords has BluBluVerde}[BluBluVerde]
        {
            - action == Activate: BluBluVerde è stata attivata.
                ~ nest_activeEmotionalWord = BluBluVerde
                ~ nest_ownedEmotionalWords -= BluBluVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluBluVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluBluVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluBluVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has BluBluViola}[BluBluViola]
        {
            - action == Activate: BluBluViola è stata attivata.
                ~ nest_activeEmotionalWord = BluBluViola
                ~ nest_ownedEmotionalWords -= BluBluViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluBluViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluBluViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluBluViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }
        
    + {nest_ownedEmotionalWords has BluBluGiallo}[BluBluGiallo]
        {
            - action == Activate: BluBluGiallo è stata attivata.
                ~ nest_activeEmotionalWord = BluBluGiallo
                ~ nest_ownedEmotionalWords -= BluBluGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluBluGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluBluGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluBluGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }  
        
    + {nest_ownedEmotionalWords has BluBluRosso}[BluBluRosso]
        {
            - action == Activate: BluBluRosso è stata attivata.
                ~ nest_activeEmotionalWord = BluBluRosso
                ~ nest_ownedEmotionalWords -= BluBluRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluBluRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluBluRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluBluRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }        

    
    + {nest_ownedEmotionalWords has BluVerdeVerde}[BluVerdeVerde]
        {
            - action == Activate: BluVerdeVerde è stata attivata.
                ~ nest_activeEmotionalWord = BluVerdeVerde
                ~ nest_ownedEmotionalWords -= BluVerdeVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluVerdeVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluVerdeVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluVerdeVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
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
    
    + {nest_ownedEmotionalWords has BluVerdeBlu}[BluVerdeBlu]
        {
            - action == Activate: BluVerdeBlu è stata attivata.
                ~ nest_activeEmotionalWord = BluVerdeBlu
                ~ nest_ownedEmotionalWords -= BluVerdeBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluVerdeBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluVerdeBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluVerdeBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
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
    
    + {nest_ownedEmotionalWords has BluViolaViola}[BluViolaViola]
        {
            - action == Activate: BluViolaViola è stata attivata.
                ~ nest_activeEmotionalWord = BluViolaViola
                ~ nest_ownedEmotionalWords -= BluViolaViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluViolaViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluViolaViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluViolaViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
        
    + {nest_ownedEmotionalWords has BluViolaBlu}[BluViolaBlu]
        {
            - action == Activate: BluViolaBlu è stata attivata.
                ~ nest_activeEmotionalWord = BluViolaBlu
                ~ nest_ownedEmotionalWords -= BluViolaBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluViolaBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluViolaBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluViolaBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has BluViolaGiallo}[BluViolaGiallo]
        {
            - action == Activate: BluViolaGiallo è stata attivata.
                ~ nest_activeEmotionalWord = BluViolaGiallo
                ~ nest_ownedEmotionalWords -= BluViolaGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: BluViolaGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= BluViolaGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso BluViolaGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
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
 
 
 
 
 
 //Varianti a dominante verde
     //Due note
    + {nest_ownedEmotionalWords has VerdeRosso}[VerdeRosso]
        {
            - action == Activate: VerdeRosso è stata attivata.
                ~ nest_activeEmotionalWord = VerdeRosso
                ~ nest_ownedEmotionalWords -= VerdeRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }
        
    + {nest_ownedEmotionalWords has VerdeGiallo}[VerdeGiallo]
        {
            - action == Activate: VerdeGiallo è stata attivata.
                ~ nest_activeEmotionalWord = VerdeGiallo
                ~ nest_ownedEmotionalWords -= VerdeGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }  
        
    + {nest_ownedEmotionalWords has VerdeBlu}[VerdeBlu]
        {
            - action == Activate:  VerdeBlu è stata attivata.
                ~ nest_activeEmotionalWord = VerdeBlu
                ~ nest_ownedEmotionalWords -= VerdeBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete:  VerdeBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -=  VerdeBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso  VerdeBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }        

    
    + {nest_ownedEmotionalWords has VerdeViola}[VerdeViola]
        {
            - action == Activate: VerdeViola è stata attivata.
                ~ nest_activeEmotionalWord = VerdeViola
                ~ nest_ownedEmotionalWords -= VerdeViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    

            - action == Delete: VerdeViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
        
    
    //Tre note
    + {nest_ownedEmotionalWords has VerdeRossoVerde}[VerdeRossoVerde]
        {
            - action == Activate: VerdeRossoVerde è stata attivata.
                ~ nest_activeEmotionalWord = VerdeRossoVerde
                ~ nest_ownedEmotionalWords -= VerdeRossoVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeRossoVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeRossoVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeRossoVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
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
    
    + {nest_ownedEmotionalWords has VerdeRossoRosso}[VerdeRossoRosso]
        {
            - action == Activate: VerdeRossoRosso è stata attivata.
                ~ nest_activeEmotionalWord = VerdeRossoRosso
                ~ nest_ownedEmotionalWords -= VerdeRossoRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeRossoRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeRossoRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeRossoRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has VerdeGialloVerde}[VerdeGialloVerde]
        {
            - action == Activate: VerdeGialloVerde è stata attivata.
                ~ nest_activeEmotionalWord = VerdeGialloVerde
                ~ nest_ownedEmotionalWords -= VerdeGialloVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeGialloVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeGialloVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeGialloVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
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
                ~ nest_ownedEmotionalWords -= GialloGialloBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeGialloBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeGialloBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeGialloBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has VerdeGialloGiallo}[VerdeGialloGiallo]
        {
            - action == Activate: VerdeGialloGiallo è stata attivata.
                ~ nest_activeEmotionalWord = VerdeGialloGiallo
                ~ nest_ownedEmotionalWords -= VerdeGialloGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeGialloGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeGialloGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeGialloGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
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
    
    + {nest_ownedEmotionalWords has VerdeBluVerde}[VerdeBluVerde]
        {
            - action == Activate: VerdeBluVerde è stata attivata.
                ~ nest_activeEmotionalWord = VerdeBluVerde
                ~ nest_ownedEmotionalWords -= VerdeBluVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeBluVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeBluVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeBluVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
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
        
    + {nest_ownedEmotionalWords has VerdeBluBlu}[VerdeBluBlu]
        {
            - action == Activate: VerdeBluBlu è stata attivata.
                ~ nest_activeEmotionalWord = VerdeBluBlu
                ~ nest_ownedEmotionalWords -= VerdeBluBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeBluBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeBluBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeBluBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
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
        
    + {nest_ownedEmotionalWords has VerdeVerdeViola}[VerdeVerdeViola]
        {
            - action == Activate: VerdeVerdeViola è stata attivata.
                ~ nest_activeEmotionalWord = VerdeVerdeViola
                ~ nest_ownedEmotionalWords -= VerdeVerdeViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeVerdeViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeVerdeViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeVerdeViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has VerdeVerdeBlu}[VerdeVerdeBlu]
        {
            - action == Activate: VerdeVerdeBlu è stata attivata.
                ~ nest_activeEmotionalWord = VerdeVerdeBlu
                ~ nest_ownedEmotionalWords -= VerdeVerdeBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeVerdeBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeVerdeBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeVerdeBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has VerdeVerdeGiallo}[VerdeVerdeGiallo]
        {
            - action == Activate: VerdeVerdeGiallo è stata attivata.
                ~ nest_activeEmotionalWord = VerdeVerdeGiallo
                ~ nest_ownedEmotionalWords -= VerdeVerdeGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeVerdeGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeVerdeGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeVerdeGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has VerdeVerdeRosso}[VerdeVerdeRosso]
        {
            - action == Activate: VerdeVerdeRosso è stata attivata.
                ~ nest_activeEmotionalWord = VerdeVerdeRosso
                ~ nest_ownedEmotionalWords -= VerdeVerdeRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeVerdeRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeVerdeRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeVerdeRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has VerdeViolaVerde}[VerdeViolaVerde]
        {
            - action == Activate: VerdeViolaVerde è stata attivata.
                ~ nest_activeEmotionalWord = VerdeViolaVerde
                ~ nest_ownedEmotionalWords -= VerdeViolaVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeViolaVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeViolaVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeViolaVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has VerdeViolaViola}[VerdeViolaViola]
        {
            - action == Activate: VerdeViolaViola è stata attivata.
                ~ nest_activeEmotionalWord = VerdeViolaViola
                ~ nest_ownedEmotionalWords -= VerdeViolaViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: VerdeViolaViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= VerdeViolaViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso VerdeViolaViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
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
    //Due note
    + {nest_ownedEmotionalWords has ViolaRosso}[ViolaRosso]
        {
            - action == Activate: ViolaRosso è stata attivata.
                ~ nest_activeEmotionalWord = ViolaRosso
                ~ nest_ownedEmotionalWords -= ViolaRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }
        
    + {nest_ownedEmotionalWords has ViolaGiallo}[ViolaGiallo]
        {
            - action == Activate: ViolaGiallo è stata attivata.
                ~ nest_activeEmotionalWord = ViolaGiallo
                ~ nest_ownedEmotionalWords -= ViolaGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }  
        
    + {nest_ownedEmotionalWords has ViolaBlu}[ViolaBlu]
        {
            - action == Activate:  ViolaBlu è stata attivata.
                ~ nest_activeEmotionalWord = ViolaBlu
                ~ nest_ownedEmotionalWords -= ViolaBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete:  ViolaBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -=  ViolaBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso  ViolaBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }        

    
    + {nest_ownedEmotionalWords has ViolaVerde}[ViolaVerde]
        {
            - action == Activate: ViolaVerde è stata attivata.
                ~ nest_activeEmotionalWord = ViolaVerde
                ~ nest_ownedEmotionalWords -= ViolaVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    

            - action == Delete: ViolaVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
        
    
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
    
    + {nest_ownedEmotionalWords has ViolaRossoViola}[ViolaRossoViola]
        {
            - action == Activate: ViolaRossoViola è stata attivata.
                ~ nest_activeEmotionalWord = ViolaRossoViola
                ~ nest_ownedEmotionalWords -= ViolaRossoViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaRossoViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaRossoViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaRossoViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
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
    
    + {nest_ownedEmotionalWords has ViolaRossoRosso}[ViolaRossoRosso]
        {
            - action == Activate: ViolaRossoRosso è stata attivata.
                ~ nest_activeEmotionalWord = ViolaRossoRosso
                ~ nest_ownedEmotionalWords -= ViolaRossoRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaRossoRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaRossoRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaRossoRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
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
        
    + {nest_ownedEmotionalWords has ViolaGialloViola}[ViolaGialloViola]
        {
            - action == Activate: ViolaGialloViola è stata attivata.
                ~ nest_activeEmotionalWord = ViolaGialloViola
                ~ nest_ownedEmotionalWords -= ViolaGialloViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaGialloViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaGialloViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaGialloViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has ViolaGialloBlu}[ViolaGialloBlu]
        {
            - action == Activate: ViolaGialloBlu è stata attivata.
                ~ nest_activeEmotionalWord = ViolaGialloBlu
                ~ nest_ownedEmotionalWords -= GialloGialloBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaGialloBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaGialloBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaGialloBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has ViolaGialloGiallo}[ViolaGialloGiallo]
        {
            - action == Activate: ViolaGialloGiallo è stata attivata.
                ~ nest_activeEmotionalWord = ViolaGialloGiallo
                ~ nest_ownedEmotionalWords -= ViolaGialloGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaGialloGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaGialloGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaGialloGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
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
    
    + {nest_ownedEmotionalWords has ViolaBluViola}[ViolaBluViola]
        {
            - action == Activate: ViolaBluViola è stata attivata.
                ~ nest_activeEmotionalWord = ViolaBluViola
                ~ nest_ownedEmotionalWords -= ViolaBluViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaBluViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaBluViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaBluViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }
        
    + {nest_ownedEmotionalWords has ViolaBluBlu}[ViolaBluBlu]
        {
            - action == Activate: ViolaBluBlu è stata attivata.
                ~ nest_activeEmotionalWord = ViolaBluBlu
                ~ nest_ownedEmotionalWords -= ViolaBluBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaBluBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaBluBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaBluBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
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
        
    + {nest_ownedEmotionalWords has ViolaVerdeVerde}[ViolaVerdeVerde]
        {
            - action == Activate: ViolaVerdeVerde è stata attivata.
                ~ nest_activeEmotionalWord = ViolaVerdeVerde
                ~ nest_ownedEmotionalWords -= ViolaVerdeVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaVerdeVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaVerdeVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaVerdeVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has ViolaVerdeViola}[ViolaVerdeViola]
        {
            - action == Activate: ViolaVerdeViola è stata attivata.
                ~ nest_activeEmotionalWord = ViolaVerdeViola
                ~ nest_ownedEmotionalWords -= ViolaVerdeViola
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaVerdeViola è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaVerdeViola
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaVerdeViola dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
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
    
    + {nest_ownedEmotionalWords has ViolaViolaVerde}[ViolaViolaVerde]
        {
            - action == Activate: ViolaViolaVerde è stata attivata.
                ~ nest_activeEmotionalWord = ViolaViolaVerde
                ~ nest_ownedEmotionalWords -= ViolaViolaVerde
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaViolaVerde è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaViolaVerde
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaViolaVerde dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
        
    + {nest_ownedEmotionalWords has ViolaViolaBlu}[ViolaViolaBlu]
        {
            - action == Activate: ViolaViolaBlu è stata attivata.
                ~ nest_activeEmotionalWord = ViolaViolaBlu
                ~ nest_ownedEmotionalWords -= ViolaViolaBlu
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaViolaBlu è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaViolaBlu
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaViolaBlu dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has ViolaViolaGiallo}[ViolaViolaGiallo]
        {
            - action == Activate: ViolaViolaGiallo è stata attivata.
                ~ nest_activeEmotionalWord = ViolaViolaGiallo
                ~ nest_ownedEmotionalWords -= ViolaViolaGiallo
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaViolaGiallo è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaViolaGiallo
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaViolaGiallo dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has ViolaViolaRosso}[ViolaViolaRosso]
        {
            - action == Activate: ViolaViolaRosso è stata attivata.
                ~ nest_activeEmotionalWord = ViolaViolaRosso
                ~ nest_ownedEmotionalWords -= ViolaViolaRosso
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: ViolaViolaRosso è stata cancellata.
                ~ nest_ownedEmotionalWords -= ViolaViolaRosso
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso ViolaViolaRosso dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
 

    -
    
    {
        - nest_activeEmotionalWord != ():
            -> word_usage_counter ->
    }
    
    //Disabilito il box di dialogo ad hoc per il Nest
        ~ disableNestDialogue()
    
    -> used_emotional_words_updater ->

->->

//Utilizzato per capire quante volte posso usare una parola
=== word_usage_counter
{debug_nest: passo per word_usage_counter.}
{debug_nest: prima dell'aggiornamento il valore di temporaryWordUsageCounter è {temporaryWordUsageCounter}.}
    
    {
        - nest_oneUseWords has nest_activeEmotionalWord:
            ~ temporaryWordUsageCounter = 1
        
        - nest_twoUseWords has nest_activeEmotionalWord:
            ~ temporaryWordUsageCounter = 2
        
        - nest_threeUseWords has nest_activeEmotionalWord:
            ~ temporaryWordUsageCounter = 3
        
        - else: ERROR, non riesco a trovare {nest_activeEmotionalWord} in nessuna delle tre liste, per cui non riesco ad assegnare un valore a temporaryWordUsageCounter, che ora è a {temporaryWordUsageCounter}.
    }
    
{debug_nest: dopo l'aggiornamento il valore di temporaryWordUsageCounter è {temporaryWordUsageCounter}.}  
        
        ->->
