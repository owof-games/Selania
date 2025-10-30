=== emotional_words_management(action)
//Questa è la funzione che usiamo sia per rimuovere che per attivare una parola posseduta.
{nestDebug: emotional_words_management(action). Il valore di action è {action}.}

    {
        - action == Activate: Quale parola vuoi attivare?
        - action == Delete: Quale parola vuoi cancellare?
    
    } 


//Varianti monocolore
    + {ownedEmotionalWords has Rosso}[Rosso]
        {
            - action == Activate: Rosso è stata attivata.
                ~ activeEmotionalWord = Rosso
                ~ ownedEmotionalWords -= Rosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: Rosso è stata cancellata.
                ~ ownedEmotionalWords -= Rosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso Rosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }
        
    + {ownedEmotionalWords has RossoRosso}[RossoRosso]
        {
            - action == Activate: RossoRosso è stata attivata.
                ~ activeEmotionalWord = RossoRosso
                ~ ownedEmotionalWords -= RossoRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoRosso è stata cancellata.
                ~ ownedEmotionalWords -= RossoRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }  
        
    + {ownedEmotionalWords has RossoRossoRosso}[RossoRossoRosso]
        {
            - action == Activate: RossoRossoRosso è stata attivata.
                ~ activeEmotionalWord = RossoRossoRosso
                ~ ownedEmotionalWords -= RossoRossoRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoRossoRosso è stata cancellata.
                ~ ownedEmotionalWords -= RossoRossoRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoRossoRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }        

    
    + {ownedEmotionalWords has Giallo}[Giallo]
        {
            - action == Activate: Giallo è stata attivata.
                ~ activeEmotionalWord = Giallo
                ~ ownedEmotionalWords -= Giallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: Giallo è stata cancellata.
                ~ ownedEmotionalWords -= Giallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso Giallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has GialloGiallo}[GialloGiallo]
        {
            - action == Activate: GialloGiallo è stata attivata.
                ~ activeEmotionalWord = GialloGiallo
                ~ ownedEmotionalWords -= GialloGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloGiallo è stata cancellata.
                ~ ownedEmotionalWords -= GialloGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has GialloGialloGiallo}[GialloGialloGiallo]
        {
            - action == Activate: GialloGialloGiallo è stata attivata.
                ~ activeEmotionalWord = GialloGialloGiallo
                ~ ownedEmotionalWords -= GialloGialloGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloGialloGiallo è stata cancellata.
                ~ ownedEmotionalWords -= GialloGialloGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloGialloGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has Verde}[Verde]
        {
            - action == Activate: Verde è stata attivata.
                ~ activeEmotionalWord = Verde
                ~ ownedEmotionalWords -= Verde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: Verde è stata cancellata.
                ~ ownedEmotionalWords -= Verde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso Verde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has VerdeVerde}[VerdeVerde]
        {
            - action == Activate: VerdeVerde è stata attivata.
                ~ activeEmotionalWord = VerdeVerde
                ~ ownedEmotionalWords -= VerdeVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeVerde è stata cancellata.
                ~ ownedEmotionalWords -= VerdeVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has VerdeVerdeVerde}[VerdeVerdeVerde]
        {
            - action == Activate: VerdeVerdeVerde è stata attivata.
                ~ activeEmotionalWord = VerdeVerdeVerde
                ~ ownedEmotionalWords -= VerdeVerdeVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeVerdeVerde è stata cancellata.
                ~ ownedEmotionalWords -= VerdeVerdeVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeVerdeVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has Viola}[Viola]
        {
            - action == Activate: Viola è stata attivata.
                ~ activeEmotionalWord = Viola
                ~ ownedEmotionalWords -= Viola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: Viola è stata cancellata.
                ~ ownedEmotionalWords -= Viola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso Viola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has ViolaViola}[ViolaViola]
        {
            - action == Activate: ViolaViola è stata attivata.
                ~ activeEmotionalWord = ViolaViola
                ~ ownedEmotionalWords -= ViolaViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaViola è stata cancellata.
                ~ ownedEmotionalWords -= ViolaViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has ViolaViolaViola}[ViolaViolaViola]
        {
            - action == Activate: ViolaViolaViola è stata attivata.
                ~ activeEmotionalWord = ViolaViolaViola
                ~ ownedEmotionalWords -= ViolaViolaViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaViolaViola è stata cancellata.
                ~ ownedEmotionalWords -= ViolaViolaViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaViolaViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has Blu}[Blu]
        {
            - action == Activate: Blu è stata attivata.
                ~ activeEmotionalWord = Blu
                ~ ownedEmotionalWords -= Blu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: Blu è stata cancellata.
                ~ ownedEmotionalWords -= Blu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso Blu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has BluBlu}[BluBlu]
        {
            - action == Activate: BluBlu è stata attivata.
                ~ activeEmotionalWord = BluBlu
                ~ ownedEmotionalWords -= BluBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluBlu è stata cancellata.
                ~ ownedEmotionalWords -= BluBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        } 
    
    + {ownedEmotionalWords has BluBluBlu}[BluBluBlu]
        {
            - action == Activate: BluBluBlu è stata attivata.
                ~ activeEmotionalWord = BluBluBlu
                ~ ownedEmotionalWords -= BluBluBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluBluBlu è stata cancellata.
                ~ ownedEmotionalWords -= BluBluBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluBluBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
        
    
 //Varianti a dominante Rosso
    //Due note
    + {ownedEmotionalWords has RossoGiallo}[RossoGiallo]
        {
            - action == Activate: RossoGiallo è stata attivata.
                ~ activeEmotionalWord = RossoGiallo
                ~ ownedEmotionalWords -= RossoGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoGiallo è stata cancellata.
                ~ ownedEmotionalWords -= RossoGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }
        
    + {ownedEmotionalWords has RossoBlu}[RossoBlu]
        {
            - action == Activate: RossoBlu è stata attivata.
                ~ activeEmotionalWord = RossoBlu
                ~ ownedEmotionalWords -= RossoBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoBlu è stata cancellata.
                ~ ownedEmotionalWords -= RossoBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }  
        
    + {ownedEmotionalWords has RossoVerde}[RossoVerde]
        {
            - action == Activate: RossoVerde è stata attivata.
                ~ activeEmotionalWord = RossoVerde
                ~ ownedEmotionalWords -= RossoVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoVerde è stata cancellata.
                ~ ownedEmotionalWords -= RossoVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }        

    
    + {ownedEmotionalWords has RossoViola}[RossoViola]
        {
            - action == Activate: RossoViola è stata attivata.
                ~ activeEmotionalWord = RossoViola
                ~ ownedEmotionalWords -= RossoViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoViola è stata cancellata.
                ~ ownedEmotionalWords -= RossoViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    
    //Tre note
    + {ownedEmotionalWords has RossoRossoBlu}[RossoRossoBlu]
        {
            - action == Activate: RossoRossoBlu è stata attivata.
                ~ activeEmotionalWord = RossoRossoBlu
                ~ ownedEmotionalWords -= RossoRossoBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoRossoBlu è stata cancellata.
                ~ ownedEmotionalWords -= RossoRossoBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoRossoBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has RossoRossoVerde}[RossoRossoVerde]
        {
            - action == Activate: RossoRossoVerde è stata attivata.
                ~ activeEmotionalWord = RossoRossoVerde
                ~ ownedEmotionalWords -= RossoRossoVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoRossoVerde è stata cancellata.
                ~ ownedEmotionalWords -= RossoRossoVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoRossoVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has RossoRossoViola}[RossoRossoViola]
        {
            - action == Activate: RossoRossoViola è stata attivata.
                ~ activeEmotionalWord = RossoRossoViola
                ~ ownedEmotionalWords -= RossoRossoViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoRossoViola è stata cancellata.
                ~ ownedEmotionalWords -= RossoRossoViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoRossoViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has RossoRossoGiallo}[RossoRossoGiallo]
        {
            - action == Activate: RossoRossoGiallo è stata attivata.
                ~ activeEmotionalWord = RossoRossoGiallo
                ~ ownedEmotionalWords -= RossoRossoGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoRossoGiallo è stata cancellata.
                ~ ownedEmotionalWords -= RossoRossoGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoRossoGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has RossoGialloBlu}[RossoGialloBlu]
        {
            - action == Activate: RossoGialloBlu è stata attivata.
                ~ activeEmotionalWord = RossoGialloBlu
                ~ ownedEmotionalWords -= RossoGialloBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoGialloBlu è stata cancellata.
                ~ ownedEmotionalWords -= RossoGialloBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoGialloBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has RossoGialloVerde}[RossoGialloVerde]
        {
            - action == Activate: RossoGialloVerde è stata attivata.
                ~ activeEmotionalWord = RossoGialloVerde
                ~ ownedEmotionalWords -= RossoGialloVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoGialloVerde è stata cancellata.
                ~ ownedEmotionalWords -= RossoGialloVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoGialloVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has RossoGialloViola}[RossoGialloViola]
        {
            - action == Activate: RossoGialloViola è stata attivata.
                ~ activeEmotionalWord = RossoGialloViola
                ~ ownedEmotionalWords -= RossoGialloViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoGialloViola è stata cancellata.
                ~ ownedEmotionalWords -= RossoGialloViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoGialloViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has RossoGialloRosso}[RossoGialloRosso]
        {
            - action == Activate: RossoGialloRosso è stata attivata.
                ~ activeEmotionalWord = RossoGialloRosso
                ~ ownedEmotionalWords -= RossoGialloRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoGialloRosso è stata cancellata.
                ~ ownedEmotionalWords -= RossoGialloRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoGialloRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has RossoGialloGiallo}[RossoGialloGiallo]
        {
            - action == Activate: RossoGialloGiallo è stata attivata.
                ~ activeEmotionalWord = RossoGialloGiallo
                ~ ownedEmotionalWords -= RossoGialloGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoGialloGiallo è stata cancellata.
                ~ ownedEmotionalWords -= RossoGialloGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoGialloGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has RossoBluBlu}[RossoBluBlu]
        {
            - action == Activate: RossoBluBlu è stata attivata.
                ~ activeEmotionalWord = RossoBluBlu
                ~ ownedEmotionalWords -= RossoBluBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoBluBlu è stata cancellata.
                ~ ownedEmotionalWords -= RossoBluBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoBluBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        } 
    
    + {ownedEmotionalWords has RossoBluVerde}[RossoBluVerde]
        {
            - action == Activate: RossoBluVerde è stata attivata.
                ~ activeEmotionalWord = RossoBluVerde
                ~ ownedEmotionalWords -= RossoBluVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoBluVerde è stata cancellata.
                ~ ownedEmotionalWords -= RossoBluVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoBluVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has RossoBluViola}[RossoBluViola]
        {
            - action == Activate: RossoBluViola è stata attivata.
                ~ activeEmotionalWord = RossoBluViola
                ~ ownedEmotionalWords -= RossoBluViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoBluViola è stata cancellata.
                ~ ownedEmotionalWords -= RossoBluViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoBluViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }
        
    + {ownedEmotionalWords has RossoBluRosso}[RossoBluRosso]
        {
            - action == Activate: RossoBluRosso è stata attivata.
                ~ activeEmotionalWord = RossoBluRosso
                ~ ownedEmotionalWords -= RossoBluRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoBluRosso è stata cancellata.
                ~ ownedEmotionalWords -= RossoBluRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoBluRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }  
        
    + {ownedEmotionalWords has RossoBluGiallo}[RossoBluGiallo]
        {
            - action == Activate: RossoBluGiallo è stata attivata.
                ~ activeEmotionalWord = RossoBluGiallo
                ~ ownedEmotionalWords -= RossoBluGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoBluGiallo è stata cancellata.
                ~ ownedEmotionalWords -= RossoBluGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoBluGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }        

    
    + {ownedEmotionalWords has RossoVerdeBlu}[RossoVerdeBlu]
        {
            - action == Activate: RossoVerdeBlu è stata attivata.
                ~ activeEmotionalWord = RossoVerdeBlu
                ~ ownedEmotionalWords -= RossoVerdeBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoVerdeBlu è stata cancellata.
                ~ ownedEmotionalWords -= RossoVerdeBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoVerdeBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has RossoVerdeVerde}[RossoVerdeVerde]
        {
            - action == Activate: RossoVerdeVerde è stata attivata.
                ~ activeEmotionalWord = RossoVerdeVerde
                ~ ownedEmotionalWords -= RossoVerdeVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoVerdeVerde è stata cancellata.
                ~ ownedEmotionalWords -= RossoVerdeVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoVerdeVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has RossoVerdeViola}[RossoVerdeViola]
        {
            - action == Activate: RossoVerdeViola è stata attivata.
                ~ activeEmotionalWord = RossoVerdeViola
                ~ ownedEmotionalWords -= RossoVerdeViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoVerdeViola è stata cancellata.
                ~ ownedEmotionalWords -= RossoVerdeViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoVerdeViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has RossoVerdeRosso}[RossoVerdeRosso]
        {
            - action == Activate: RossoVerdeRosso è stata attivata.
                ~ activeEmotionalWord = RossoVerdeRosso
                ~ ownedEmotionalWords -= RossoVerdeRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoVerdeRosso è stata cancellata.
                ~ ownedEmotionalWords -= RossoVerdeRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoVerdeRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has RossoVerdeGiallo}[RossoVerdeGiallo]
        {
            - action == Activate: RossoVerdeGiallo è stata attivata.
                ~ activeEmotionalWord = RossoVerdeGiallo
                ~ ownedEmotionalWords -= RossoVerdeGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoVerdeGiallo è stata cancellata.
                ~ ownedEmotionalWords -= RossoVerdeGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoVerdeGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has RossoViolaBlu}[RossoViolaBlu]
        {
            - action == Activate: RossoViolaBlu è stata attivata.
                ~ activeEmotionalWord = RossoViolaBlu
                ~ ownedEmotionalWords -= RossoViolaBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoViolaBlu è stata cancellata.
                ~ ownedEmotionalWords -= RossoViolaBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoViolaBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has RossoViolaVerde}[RossoViolaVerde]
        {
            - action == Activate: RossoViolaVerde è stata attivata.
                ~ activeEmotionalWord = RossoViolaVerde
                ~ ownedEmotionalWords -= RossoViolaVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoViolaVerde è stata cancellata.
                ~ ownedEmotionalWords -= RossoViolaVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoViolaVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has RossoViolaViola}[RossoViolaViola]
        {
            - action == Activate: RossoViolaViola è stata attivata.
                ~ activeEmotionalWord = RossoViolaViola
                ~ ownedEmotionalWords -= RossoViolaViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoViolaViola è stata cancellata.
                ~ ownedEmotionalWords -= RossoViolaViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoViolaViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has RossoViolaRosso}[RossoViolaRosso]
        {
            - action == Activate: RossoViolaRosso è stata attivata.
                ~ activeEmotionalWord = RossoViolaRosso
                ~ ownedEmotionalWords -= RossoViolaRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoViolaRosso è stata cancellata.
                ~ ownedEmotionalWords -= RossoViolaRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoViolaRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has RossoViolaGiallo}[RossoViolaGiallo]
        {
            - action == Activate: RossoViolaGiallo è stata attivata.
                ~ activeEmotionalWord = RossoViolaGiallo
                ~ ownedEmotionalWords -= RossoViolaGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoViolaGiallo è stata cancellata.
                ~ ownedEmotionalWords -= RossoViolaGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso RossoViolaGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
 
 //Varianti a dominante Giallo
     //Due note
    + {ownedEmotionalWords has GialloRosso}[GialloRosso]
        {
            - action == Activate: GialloRosso è stata attivata.
                ~ activeEmotionalWord = GialloRosso
                ~ ownedEmotionalWords -= GialloRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloRosso è stata cancellata.
                ~ ownedEmotionalWords -= GialloRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }
        
    + {ownedEmotionalWords has GialloBlu}[GialloBlu]
        {
            - action == Activate: GialloBlu è stata attivata.
                ~ activeEmotionalWord = GialloBlu
                ~ ownedEmotionalWords -= GialloBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloBlu è stata cancellata.
                ~ ownedEmotionalWords -= GialloBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }  
        
    + {ownedEmotionalWords has GialloVerde}[GialloVerde]
        {
            - action == Activate:  GialloVerde è stata attivata.
                ~ activeEmotionalWord = GialloVerde
                ~ ownedEmotionalWords -= GialloVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete:  GialloVerde è stata cancellata.
                ~ ownedEmotionalWords -=  GialloVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso  GialloVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }        

    
    + {ownedEmotionalWords has GialloViola}[GialloViola]
        {
            - action == Activate: GialloViola è stata attivata.
                ~ activeEmotionalWord = GialloViola
                ~ ownedEmotionalWords -= GialloViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloViola è stata cancellata.
                ~ ownedEmotionalWords -= GialloViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    
    //Tre note
    + {ownedEmotionalWords has GialloRossoVerde}[GialloRossoVerde]
        {
            - action == Activate: GialloRossoVerde è stata attivata.
                ~ activeEmotionalWord = GialloRossoVerde
                ~ ownedEmotionalWords -= GialloRossoVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloRossoVerde è stata cancellata.
                ~ ownedEmotionalWords -= GialloRossoVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloRossoVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has GialloRossoViola}[GialloRossoViola]
        {
            - action == Activate: GialloRossoViola è stata attivata.
                ~ activeEmotionalWord = GialloRossoViola
                ~ ownedEmotionalWords -= GialloRossoViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloRossoViola è stata cancellata.
                ~ ownedEmotionalWords -= GialloRossoViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloRossoViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has GialloRossoBlu}[GialloRossoBlu]
        {
            - action == Activate: GialloRossoBlu è stata attivata.
                ~ activeEmotionalWord = GialloRossoBlu
                ~ ownedEmotionalWords -= GialloRossoBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloRossoBlu è stata cancellata.
                ~ ownedEmotionalWords -= GialloRossoBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloRossoBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has GialloRossoGiallo}[GialloRossoGiallo]
        {
            - action == Activate: GialloRossoGiallo è stata attivata.
                ~ activeEmotionalWord = GialloRossoGiallo
                ~ ownedEmotionalWords -= GialloRossoGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloRossoGiallo è stata cancellata.
                ~ ownedEmotionalWords -= GialloRossoGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloRossoGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has GialloRossoRosso}[GialloRossoRosso]
        {
            - action == Activate: GialloRossoRosso è stata attivata.
                ~ activeEmotionalWord = GialloRossoRosso
                ~ ownedEmotionalWords -= GialloRossoRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloRossoRosso è stata cancellata.
                ~ ownedEmotionalWords -= GialloRossoRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloRossoRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has GialloGialloVerde}[GialloGialloVerde]
        {
            - action == Activate: GialloGialloVerde è stata attivata.
                ~ activeEmotionalWord = GialloGialloVerde
                ~ ownedEmotionalWords -= GialloGialloVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloGialloVerde è stata cancellata.
                ~ ownedEmotionalWords -= GialloGialloVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloGialloVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has GialloGialloViola}[GialloGialloViola]
        {
            - action == Activate: GialloGialloViola è stata attivata.
                ~ activeEmotionalWord = GialloGialloViola
                ~ ownedEmotionalWords -= GialloGialloViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloGialloViola è stata cancellata.
                ~ ownedEmotionalWords -= GialloGialloViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloGialloViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has GialloGialloBlu}[GialloGialloBlu]
        {
            - action == Activate: GialloGialloBlu è stata attivata.
                ~ activeEmotionalWord = GialloGialloBlu
                ~ ownedEmotionalWords -= GialloGialloBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloGialloBlu è stata cancellata.
                ~ ownedEmotionalWords -= GialloGialloBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloGialloBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has GialloGialloRosso}[GialloGialloRosso]
        {
            - action == Activate: GialloGialloRosso è stata attivata.
                ~ activeEmotionalWord = GialloGialloRosso
                ~ ownedEmotionalWords -= GialloGialloRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloGialloRosso è stata cancellata.
                ~ ownedEmotionalWords -= GialloGialloRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloGialloRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has GialloBluVerde}[GialloBluVerde]
        {
            - action == Activate: GialloBluVerde è stata attivata.
                ~ activeEmotionalWord = GialloBluVerde
                ~ ownedEmotionalWords -= GialloBluVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloBluVerde è stata cancellata.
                ~ ownedEmotionalWords -= GialloBluVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloBluVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        } 
    
    + {ownedEmotionalWords has GialloBluViola}[GialloBluViola]
        {
            - action == Activate: GialloBluViola è stata attivata.
                ~ activeEmotionalWord = GialloBluViola
                ~ ownedEmotionalWords -= GialloBluViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloBluViola è stata cancellata.
                ~ ownedEmotionalWords -= GialloBluViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloBluViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has GialloBluBlu}[GialloBluBlu]
        {
            - action == Activate: GialloBluBlu è stata attivata.
                ~ activeEmotionalWord = GialloBluBlu
                ~ ownedEmotionalWords -= GialloBluBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloBluBlu è stata cancellata.
                ~ ownedEmotionalWords -= GialloBluBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloBluBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }
        
    + {ownedEmotionalWords has GialloBluGiallo}[GialloBluGiallo]
        {
            - action == Activate: GialloBluGiallo è stata attivata.
                ~ activeEmotionalWord = GialloBluGiallo
                ~ ownedEmotionalWords -= GialloBluGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloBluGiallo è stata cancellata.
                ~ ownedEmotionalWords -= GialloBluGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloBluGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }  
        
    + {ownedEmotionalWords has GialloBluRosso}[GialloBluRosso]
        {
            - action == Activate: GialloBluRosso è stata attivata.
                ~ activeEmotionalWord = GialloBluRosso
                ~ ownedEmotionalWords -= GialloBluRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloBluRosso è stata cancellata.
                ~ ownedEmotionalWords -= GialloBluRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloBluRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }        

    
    + {ownedEmotionalWords has GialloVerdeVerde}[GialloVerdeVerde]
        {
            - action == Activate: GialloVerdeVerde è stata attivata.
                ~ activeEmotionalWord = GialloVerdeVerde
                ~ ownedEmotionalWords -= GialloVerdeVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloVerdeVerde è stata cancellata.
                ~ ownedEmotionalWords -= GialloVerdeVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloVerdeVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has GialloVerdeViola}[GialloVerdeViola]
        {
            - action == Activate: GialloVerdeViola è stata attivata.
                ~ activeEmotionalWord = GialloVerdeViola
                ~ ownedEmotionalWords -= GialloVerdeViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloVerdeViola è stata cancellata.
                ~ ownedEmotionalWords -= GialloVerdeViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloVerdeViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has GialloVerdeBlu}[GialloVerdeBlu]
        {
            - action == Activate: GialloVerdeBlu è stata attivata.
                ~ activeEmotionalWord = GialloVerdeBlu
                ~ ownedEmotionalWords -= GialloVerdeBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloVerdeBlu è stata cancellata.
                ~ ownedEmotionalWords -= GialloVerdeBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloVerdeBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has GialloVerdeGiallo}[GialloVerdeGiallo]
        {
            - action == Activate: GialloVerdeGiallo è stata attivata.
                ~ activeEmotionalWord = GialloVerdeGiallo
                ~ ownedEmotionalWords -= GialloVerdeGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloVerdeGiallo è stata cancellata.
                ~ ownedEmotionalWords -= GialloVerdeGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloVerdeGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has GialloVerdeRosso}[GialloVerdeRosso]
        {
            - action == Activate: GialloVerdeRosso è stata attivata.
                ~ activeEmotionalWord = GialloVerdeRosso
                ~ ownedEmotionalWords -= GialloVerdeRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloVerdeRosso è stata cancellata.
                ~ ownedEmotionalWords -= GialloVerdeRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloVerdeRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has GialloViolaVerde}[GialloViolaVerde]
        {
            - action == Activate: GialloViolaVerde è stata attivata.
                ~ activeEmotionalWord = GialloViolaVerde
                ~ ownedEmotionalWords -= GialloViolaVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloViolaVerde è stata cancellata.
                ~ ownedEmotionalWords -= GialloViolaVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloViolaVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has GialloViolaViola}[GialloViolaViola]
        {
            - action == Activate: GialloViolaViola è stata attivata.
                ~ activeEmotionalWord = GialloViolaViola
                ~ ownedEmotionalWords -= GialloViolaViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloViolaViola è stata cancellata.
                ~ ownedEmotionalWords -= GialloViolaViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloViolaViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has GialloViolaBlu}[GialloViolaBlu]
        {
            - action == Activate: GialloViolaBlu è stata attivata.
                ~ activeEmotionalWord = GialloViolaBlu
                ~ ownedEmotionalWords -= GialloViolaBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloViolaBlu è stata cancellata.
                ~ ownedEmotionalWords -= GialloViolaBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloViolaBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has GialloViolaGiallo}[GialloViolaGiallo]
        {
            - action == Activate: GialloViolaGiallo è stata attivata.
                ~ activeEmotionalWord = GialloViolaGiallo
                ~ ownedEmotionalWords -= GialloViolaGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloViolaGiallo è stata cancellata.
                ~ ownedEmotionalWords -= GialloViolaGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloViolaGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has GialloViolaRosso}[GialloViolaRosso]
        {
            - action == Activate: GialloViolaRosso è stata attivata.
                ~ activeEmotionalWord = GialloViolaRosso
                ~ ownedEmotionalWords -= GialloViolaRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloViolaRosso è stata cancellata.
                ~ ownedEmotionalWords -= GialloViolaRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso GialloViolaRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
 
 
 
 
 //Varianti a dominante blu
         //Due note
    + {ownedEmotionalWords has BluRosso}[BluRosso]
        {
            - action == Activate: BluRosso è stata attivata.
                ~ activeEmotionalWord = BluRosso
                ~ ownedEmotionalWords -= BluRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluRosso è stata cancellata.
                ~ ownedEmotionalWords -= BluRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }
        
    + {ownedEmotionalWords has BluGiallo}[BluGiallo]
        {
            - action == Activate: BluGiallo è stata attivata.
                ~ activeEmotionalWord = BluGiallo
                ~ ownedEmotionalWords -= BluGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluGiallo è stata cancellata.
                ~ ownedEmotionalWords -= BluGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }  
        
    + {ownedEmotionalWords has BluVerde}[BluVerde]
        {
            - action == Activate:  BluVerde è stata attivata.
                ~ activeEmotionalWord = BluVerde
                ~ ownedEmotionalWords -= BluVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete:  BluVerde è stata cancellata.
                ~ ownedEmotionalWords -=  BluVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso  BluVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }        

    
    + {ownedEmotionalWords has BluViola}[BluViola]
        {
            - action == Activate: BluViola è stata attivata.
                ~ activeEmotionalWord = BluViola
                ~ ownedEmotionalWords -= BluViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluViola è stata cancellata.
                ~ ownedEmotionalWords -= BluViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    
    //Tre note
    + {ownedEmotionalWords has BluRossoVerde}[BluRossoVerde]
        {
            - action == Activate: BluRossoVerde è stata attivata.
                ~ activeEmotionalWord = BluRossoVerde
                ~ ownedEmotionalWords -= BluRossoVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluRossoVerde è stata cancellata.
                ~ ownedEmotionalWords -= BluRossoVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluRossoVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has BluRossoViola}[BluRossoViola]
        {
            - action == Activate: BluRossoViola è stata attivata.
                ~ activeEmotionalWord = BluRossoViola
                ~ ownedEmotionalWords -= BluRossoViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluRossoViola è stata cancellata.
                ~ ownedEmotionalWords -= BluRossoViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluRossoViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has BluRossoBlu}[BluRossoBlu]
        {
            - action == Activate: BluRossoBlu è stata attivata.
                ~ activeEmotionalWord = BluRossoBlu
                ~ ownedEmotionalWords -= BluRossoBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    

           - action == Delete: BluRossoBlu è stata cancellata.
                ~ ownedEmotionalWords -= BluRossoBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluRossoBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has BluRossoGiallo}[BluRossoGiallo]
        {
            - action == Activate: BluRossoGiallo è stata attivata.
                ~ activeEmotionalWord = BluRossoGiallo
                ~ ownedEmotionalWords -= BluRossoGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    

            - action == Delete: BluRossoGiallo è stata cancellata.
                ~ ownedEmotionalWords -= BluRossoGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluRossoGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has BluRossoRosso}[BluRossoRosso]
        {
            - action == Activate: BluRossoRosso è stata attivata.
                ~ activeEmotionalWord = BluRossoRosso
                ~ ownedEmotionalWords -= BluRossoRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluRossoRosso è stata cancellata.
                ~ ownedEmotionalWords -= BluRossoRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluRossoRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has BluGialloVerde}[BluGialloVerde]
        {
            - action == Activate: BluGialloVerde è stata attivata.
                ~ activeEmotionalWord = BluGialloVerde
                ~ ownedEmotionalWords -= BluGialloVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluGialloVerde è stata cancellata.
                ~ ownedEmotionalWords -= BluGialloVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluGialloVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has BluGialloViola}[BluGialloViola]
        {
            - action == Activate: BluGialloViola è stata attivata.
                ~ activeEmotionalWord = BluGialloViola
                ~ ownedEmotionalWords -= BluGialloViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluGialloViola è stata cancellata.
                ~ ownedEmotionalWords -= BluGialloViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluGialloViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has BluGialloBlu}[BluGialloBlu]
        {
            - action == Activate: BluGialloBlu è stata attivata.
                ~ activeEmotionalWord = BluGialloBlu
                ~ ownedEmotionalWords -= GialloGialloBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluGialloBlu è stata cancellata.
                ~ ownedEmotionalWords -= BluGialloBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluGialloBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has BluGialloGiallo}[BluGialloGiallo]
        {
            - action == Activate: BluGialloGiallo è stata attivata.
                ~ activeEmotionalWord = BluGialloGiallo
                ~ ownedEmotionalWords -= BluGialloGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluGialloGiallo è stata cancellata.
                ~ ownedEmotionalWords -= BluGialloGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluGialloGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has BluGialloRosso}[BluGialloRosso]
        {
            - action == Activate: BluGialloRosso è stata attivata.
                ~ activeEmotionalWord = BluGialloRosso
                ~ ownedEmotionalWords -= BluGialloRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluGialloRosso è stata cancellata.
                ~ ownedEmotionalWords -= BluGialloRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluGialloRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        } 
    
    + {ownedEmotionalWords has BluBluVerde}[BluBluVerde]
        {
            - action == Activate: BluBluVerde è stata attivata.
                ~ activeEmotionalWord = BluBluVerde
                ~ ownedEmotionalWords -= BluBluVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluBluVerde è stata cancellata.
                ~ ownedEmotionalWords -= BluBluVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluBluVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has BluBluViola}[BluBluViola]
        {
            - action == Activate: BluBluViola è stata attivata.
                ~ activeEmotionalWord = BluBluViola
                ~ ownedEmotionalWords -= BluBluViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluBluViola è stata cancellata.
                ~ ownedEmotionalWords -= BluBluViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluBluViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }
        
    + {ownedEmotionalWords has BluBluGiallo}[BluBluGiallo]
        {
            - action == Activate: BluBluGiallo è stata attivata.
                ~ activeEmotionalWord = BluBluGiallo
                ~ ownedEmotionalWords -= BluBluGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluBluGiallo è stata cancellata.
                ~ ownedEmotionalWords -= BluBluGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluBluGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }  
        
    + {ownedEmotionalWords has BluBluRosso}[BluBluRosso]
        {
            - action == Activate: BluBluRosso è stata attivata.
                ~ activeEmotionalWord = BluBluRosso
                ~ ownedEmotionalWords -= BluBluRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluBluRosso è stata cancellata.
                ~ ownedEmotionalWords -= BluBluRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluBluRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }        

    
    + {ownedEmotionalWords has BluVerdeVerde}[BluVerdeVerde]
        {
            - action == Activate: BluVerdeVerde è stata attivata.
                ~ activeEmotionalWord = BluVerdeVerde
                ~ ownedEmotionalWords -= BluVerdeVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluVerdeVerde è stata cancellata.
                ~ ownedEmotionalWords -= BluVerdeVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluVerdeVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has BluVerdeViola}[BluVerdeViola]
        {
            - action == Activate: BluVerdeViola è stata attivata.
                ~ activeEmotionalWord = BluVerdeViola
                ~ ownedEmotionalWords -= BluVerdeViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluVerdeViola è stata cancellata.
                ~ ownedEmotionalWords -= BluVerdeViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluVerdeViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has BluVerdeBlu}[BluVerdeBlu]
        {
            - action == Activate: BluVerdeBlu è stata attivata.
                ~ activeEmotionalWord = BluVerdeBlu
                ~ ownedEmotionalWords -= BluVerdeBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluVerdeBlu è stata cancellata.
                ~ ownedEmotionalWords -= BluVerdeBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluVerdeBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has BluVerdeGiallo}[BluVerdeGiallo]
        {
            - action == Activate: BluVerdeGiallo è stata attivata.
                ~ activeEmotionalWord = BluVerdeGiallo
                ~ ownedEmotionalWords -= BluVerdeGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluVerdeGiallo è stata cancellata.
                ~ ownedEmotionalWords -= BluVerdeGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluVerdeGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has BluVerdeRosso}[BluVerdeRosso]
        {
            - action == Activate: BluVerdeRosso è stata attivata.
                ~ activeEmotionalWord = BluVerdeRosso
                ~ ownedEmotionalWords -= BluVerdeRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluVerdeRosso è stata cancellata.
                ~ ownedEmotionalWords -= BluVerdeRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluVerdeRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has BluViolaVerde}[BluViolaVerde]
        {
            - action == Activate: BluViolaVerde è stata attivata.
                ~ activeEmotionalWord = BluViolaVerde
                ~ ownedEmotionalWords -= BluViolaVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluViolaVerde è stata cancellata.
                ~ ownedEmotionalWords -= BluViolaVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluViolaVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has BluViolaViola}[BluViolaViola]
        {
            - action == Activate: BluViolaViola è stata attivata.
                ~ activeEmotionalWord = BluViolaViola
                ~ ownedEmotionalWords -= BluViolaViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluViolaViola è stata cancellata.
                ~ ownedEmotionalWords -= BluViolaViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluViolaViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has BluViolaBlu}[BluViolaBlu]
        {
            - action == Activate: BluViolaBlu è stata attivata.
                ~ activeEmotionalWord = BluViolaBlu
                ~ ownedEmotionalWords -= BluViolaBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluViolaBlu è stata cancellata.
                ~ ownedEmotionalWords -= BluViolaBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluViolaBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has BluViolaGiallo}[BluViolaGiallo]
        {
            - action == Activate: BluViolaGiallo è stata attivata.
                ~ activeEmotionalWord = BluViolaGiallo
                ~ ownedEmotionalWords -= BluViolaGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluViolaGiallo è stata cancellata.
                ~ ownedEmotionalWords -= BluViolaGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluViolaGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has BluViolaRosso}[BluViolaRosso]
        {
            - action == Activate: BluViolaRosso è stata attivata.
                ~ activeEmotionalWord = BluViolaRosso
                ~ ownedEmotionalWords -= BluViolaRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluViolaRosso è stata cancellata.
                ~ ownedEmotionalWords -= BluViolaRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso BluViolaRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
 
 
 
 
 
 //Varianti a dominante verde
     //Due note
    + {ownedEmotionalWords has VerdeRosso}[VerdeRosso]
        {
            - action == Activate: VerdeRosso è stata attivata.
                ~ activeEmotionalWord = VerdeRosso
                ~ ownedEmotionalWords -= VerdeRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeRosso è stata cancellata.
                ~ ownedEmotionalWords -= VerdeRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }
        
    + {ownedEmotionalWords has VerdeGiallo}[VerdeGiallo]
        {
            - action == Activate: VerdeGiallo è stata attivata.
                ~ activeEmotionalWord = VerdeGiallo
                ~ ownedEmotionalWords -= VerdeGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeGiallo è stata cancellata.
                ~ ownedEmotionalWords -= VerdeGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }  
        
    + {ownedEmotionalWords has VerdeBlu}[VerdeBlu]
        {
            - action == Activate:  VerdeBlu è stata attivata.
                ~ activeEmotionalWord = VerdeBlu
                ~ ownedEmotionalWords -= VerdeBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete:  VerdeBlu è stata cancellata.
                ~ ownedEmotionalWords -=  VerdeBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso  VerdeBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }        

    
    + {ownedEmotionalWords has VerdeViola}[VerdeViola]
        {
            - action == Activate: VerdeViola è stata attivata.
                ~ activeEmotionalWord = VerdeViola
                ~ ownedEmotionalWords -= VerdeViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    

            - action == Delete: VerdeViola è stata cancellata.
                ~ ownedEmotionalWords -= VerdeViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    
    //Tre note
    + {ownedEmotionalWords has VerdeRossoVerde}[VerdeRossoVerde]
        {
            - action == Activate: VerdeRossoVerde è stata attivata.
                ~ activeEmotionalWord = VerdeRossoVerde
                ~ ownedEmotionalWords -= VerdeRossoVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeRossoVerde è stata cancellata.
                ~ ownedEmotionalWords -= VerdeRossoVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeRossoVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has VerdeRossoViola}[VerdeRossoViola]
        {
            - action == Activate: VerdeRossoViola è stata attivata.
                ~ activeEmotionalWord = VerdeRossoViola
                ~ ownedEmotionalWords -= VerdeRossoViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeRossoViola è stata cancellata.
                ~ ownedEmotionalWords -= VerdeRossoViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeRossoViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has VerdeRossoBlu}[VerdeRossoBlu]
        {
            - action == Activate: VerdeRossoBlu è stata attivata.
                ~ activeEmotionalWord = VerdeRossoBlu
                ~ ownedEmotionalWords -= VerdeRossoBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    

           - action == Delete: VerdeRossoBlu è stata cancellata.
                ~ ownedEmotionalWords -= VerdeRossoBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeRossoBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has VerdeRossoGiallo}[VerdeRossoGiallo]
        {
            - action == Activate: VerdeRossoGiallo è stata attivata.
                ~ activeEmotionalWord = VerdeRossoGiallo
                ~ ownedEmotionalWords -= VerdeRossoGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    

            - action == Delete: VerdeRossoGiallo è stata cancellata.
                ~ ownedEmotionalWords -= VerdeRossoGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeRossoGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has VerdeRossoRosso}[VerdeRossoRosso]
        {
            - action == Activate: VerdeRossoRosso è stata attivata.
                ~ activeEmotionalWord = VerdeRossoRosso
                ~ ownedEmotionalWords -= VerdeRossoRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeRossoRosso è stata cancellata.
                ~ ownedEmotionalWords -= VerdeRossoRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeRossoRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has VerdeGialloVerde}[VerdeGialloVerde]
        {
            - action == Activate: VerdeGialloVerde è stata attivata.
                ~ activeEmotionalWord = VerdeGialloVerde
                ~ ownedEmotionalWords -= VerdeGialloVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeGialloVerde è stata cancellata.
                ~ ownedEmotionalWords -= VerdeGialloVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeGialloVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has VerdeGialloViola}[VerdeGialloViola]
        {
            - action == Activate: VerdeGialloViola è stata attivata.
                ~ activeEmotionalWord = VerdeGialloViola
                ~ ownedEmotionalWords -= VerdeGialloViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeGialloViola è stata cancellata.
                ~ ownedEmotionalWords -= VerdeGialloViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeGialloViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has VerdeGialloBlu}[VerdeGialloBlu]
        {
            - action == Activate: VerdeGialloBlu è stata attivata.
                ~ activeEmotionalWord = VerdeGialloBlu
                ~ ownedEmotionalWords -= GialloGialloBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeGialloBlu è stata cancellata.
                ~ ownedEmotionalWords -= VerdeGialloBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeGialloBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has VerdeGialloGiallo}[VerdeGialloGiallo]
        {
            - action == Activate: VerdeGialloGiallo è stata attivata.
                ~ activeEmotionalWord = VerdeGialloGiallo
                ~ ownedEmotionalWords -= VerdeGialloGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeGialloGiallo è stata cancellata.
                ~ ownedEmotionalWords -= VerdeGialloGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeGialloGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has VerdeGialloRosso}[VerdeGialloRosso]
        {
            - action == Activate: VerdeGialloRosso è stata attivata.
                ~ activeEmotionalWord = VerdeGialloRosso
                ~ ownedEmotionalWords -= VerdeGialloRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeGialloRosso è stata cancellata.
                ~ ownedEmotionalWords -= VerdeGialloRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeGialloRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        } 
    
    + {ownedEmotionalWords has VerdeBluVerde}[VerdeBluVerde]
        {
            - action == Activate: VerdeBluVerde è stata attivata.
                ~ activeEmotionalWord = VerdeBluVerde
                ~ ownedEmotionalWords -= VerdeBluVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeBluVerde è stata cancellata.
                ~ ownedEmotionalWords -= VerdeBluVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeBluVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has VerdeBluViola}[VerdeBluViola]
        {
            - action == Activate: VerdeBluViola è stata attivata.
                ~ activeEmotionalWord = VerdeBluViola
                ~ ownedEmotionalWords -= VerdeBluViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeBluViola è stata cancellata.
                ~ ownedEmotionalWords -= VerdeBluViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeBluViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }
        
    + {ownedEmotionalWords has VerdeBluBlu}[VerdeBluBlu]
        {
            - action == Activate: VerdeBluBlu è stata attivata.
                ~ activeEmotionalWord = VerdeBluBlu
                ~ ownedEmotionalWords -= VerdeBluBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeBluBlu è stata cancellata.
                ~ ownedEmotionalWords -= VerdeBluBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeBluBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }  
        
    + {ownedEmotionalWords has VerdeBluGiallo}[VerdeBluGiallo]
        {
            - action == Activate: VerdeBluGiallo è stata attivata.
                ~ activeEmotionalWord = VerdeBluGiallo
                ~ ownedEmotionalWords -= VerdeBluGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeBluGiallo è stata cancellata.
                ~ ownedEmotionalWords -= VerdeBluGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeBluGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }        

    
    + {ownedEmotionalWords has VerdeBluRosso}[VerdeBluRosso]
        {
            - action == Activate: VerdeBluRosso è stata attivata.
                ~ activeEmotionalWord = VerdeBluRosso
                ~ ownedEmotionalWords -= VerdeBluRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeBluRosso è stata cancellata.
                ~ ownedEmotionalWords -= VerdeBluRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeBluRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has VerdeVerdeViola}[VerdeVerdeViola]
        {
            - action == Activate: VerdeVerdeViola è stata attivata.
                ~ activeEmotionalWord = VerdeVerdeViola
                ~ ownedEmotionalWords -= VerdeVerdeViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeVerdeViola è stata cancellata.
                ~ ownedEmotionalWords -= VerdeVerdeViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeVerdeViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has VerdeVerdeBlu}[VerdeVerdeBlu]
        {
            - action == Activate: VerdeVerdeBlu è stata attivata.
                ~ activeEmotionalWord = VerdeVerdeBlu
                ~ ownedEmotionalWords -= VerdeVerdeBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeVerdeBlu è stata cancellata.
                ~ ownedEmotionalWords -= VerdeVerdeBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeVerdeBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has VerdeVerdeGiallo}[VerdeVerdeGiallo]
        {
            - action == Activate: VerdeVerdeGiallo è stata attivata.
                ~ activeEmotionalWord = VerdeVerdeGiallo
                ~ ownedEmotionalWords -= VerdeVerdeGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeVerdeGiallo è stata cancellata.
                ~ ownedEmotionalWords -= VerdeVerdeGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeVerdeGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has VerdeVerdeRosso}[VerdeVerdeRosso]
        {
            - action == Activate: VerdeVerdeRosso è stata attivata.
                ~ activeEmotionalWord = VerdeVerdeRosso
                ~ ownedEmotionalWords -= VerdeVerdeRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeVerdeRosso è stata cancellata.
                ~ ownedEmotionalWords -= VerdeVerdeRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeVerdeRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has VerdeViolaVerde}[VerdeViolaVerde]
        {
            - action == Activate: VerdeViolaVerde è stata attivata.
                ~ activeEmotionalWord = VerdeViolaVerde
                ~ ownedEmotionalWords -= VerdeViolaVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeViolaVerde è stata cancellata.
                ~ ownedEmotionalWords -= VerdeViolaVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeViolaVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has VerdeViolaViola}[VerdeViolaViola]
        {
            - action == Activate: VerdeViolaViola è stata attivata.
                ~ activeEmotionalWord = VerdeViolaViola
                ~ ownedEmotionalWords -= VerdeViolaViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeViolaViola è stata cancellata.
                ~ ownedEmotionalWords -= VerdeViolaViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeViolaViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has VerdeViolaBlu}[VerdeViolaBlu]
        {
            - action == Activate: VerdeViolaBlu è stata attivata.
                ~ activeEmotionalWord = VerdeViolaBlu
                ~ ownedEmotionalWords -= VerdeViolaBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeViolaBlu è stata cancellata.
                ~ ownedEmotionalWords -= VerdeViolaBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeViolaBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has VerdeViolaGiallo}[VerdeViolaGiallo]
        {
            - action == Activate: VerdeViolaGiallo è stata attivata.
                ~ activeEmotionalWord = VerdeViolaGiallo
                ~ ownedEmotionalWords -= VerdeViolaGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeViolaGiallo è stata cancellata.
                ~ ownedEmotionalWords -= VerdeViolaGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeViolaGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has VerdeViolaRosso}[VerdeViolaRosso]
        {
            - action == Activate: VerdeViolaRosso è stata attivata.
                ~ activeEmotionalWord = VerdeViolaRosso
                ~ ownedEmotionalWords -= VerdeViolaRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeViolaRosso è stata cancellata.
                ~ ownedEmotionalWords -= VerdeViolaRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso VerdeViolaRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
 
 
 
 
 
 //Varianti a dominante viola
    //Due note
    + {ownedEmotionalWords has ViolaRosso}[ViolaRosso]
        {
            - action == Activate: ViolaRosso è stata attivata.
                ~ activeEmotionalWord = ViolaRosso
                ~ ownedEmotionalWords -= ViolaRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaRosso è stata cancellata.
                ~ ownedEmotionalWords -= ViolaRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }
        
    + {ownedEmotionalWords has ViolaGiallo}[ViolaGiallo]
        {
            - action == Activate: ViolaGiallo è stata attivata.
                ~ activeEmotionalWord = ViolaGiallo
                ~ ownedEmotionalWords -= ViolaGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaGiallo è stata cancellata.
                ~ ownedEmotionalWords -= ViolaGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }  
        
    + {ownedEmotionalWords has ViolaBlu}[ViolaBlu]
        {
            - action == Activate:  ViolaBlu è stata attivata.
                ~ activeEmotionalWord = ViolaBlu
                ~ ownedEmotionalWords -= ViolaBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete:  ViolaBlu è stata cancellata.
                ~ ownedEmotionalWords -=  ViolaBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso  ViolaBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }        

    
    + {ownedEmotionalWords has ViolaVerde}[ViolaVerde]
        {
            - action == Activate: ViolaVerde è stata attivata.
                ~ activeEmotionalWord = ViolaVerde
                ~ ownedEmotionalWords -= ViolaVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    

            - action == Delete: ViolaVerde è stata cancellata.
                ~ ownedEmotionalWords -= ViolaVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    
    //Tre note
    + {ownedEmotionalWords has ViolaRossoVerde}[ViolaRossoVerde]
        {
            - action == Activate: ViolaRossoVerde è stata attivata.
                ~ activeEmotionalWord = ViolaRossoVerde
                ~ ownedEmotionalWords -= ViolaRossoVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaRossoVerde è stata cancellata.
                ~ ownedEmotionalWords -= ViolaRossoVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaRossoVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has ViolaRossoViola}[ViolaRossoViola]
        {
            - action == Activate: ViolaRossoViola è stata attivata.
                ~ activeEmotionalWord = ViolaRossoViola
                ~ ownedEmotionalWords -= ViolaRossoViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaRossoViola è stata cancellata.
                ~ ownedEmotionalWords -= ViolaRossoViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaRossoViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has ViolaRossoBlu}[ViolaRossoBlu]
        {
            - action == Activate: ViolaRossoBlu è stata attivata.
                ~ activeEmotionalWord = ViolaRossoBlu
                ~ ownedEmotionalWords -= ViolaRossoBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    

           - action == Delete: ViolaRossoBlu è stata cancellata.
                ~ ownedEmotionalWords -= ViolaRossoBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaRossoBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has ViolaRossoGiallo}[ViolaRossoGiallo]
        {
            - action == Activate: ViolaRossoGiallo è stata attivata.
                ~ activeEmotionalWord = ViolaRossoGiallo
                ~ ownedEmotionalWords -= ViolaRossoGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    

            - action == Delete: ViolaRossoGiallo è stata cancellata.
                ~ ownedEmotionalWords -= ViolaRossoGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaRossoGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has ViolaRossoRosso}[ViolaRossoRosso]
        {
            - action == Activate: ViolaRossoRosso è stata attivata.
                ~ activeEmotionalWord = ViolaRossoRosso
                ~ ownedEmotionalWords -= ViolaRossoRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaRossoRosso è stata cancellata.
                ~ ownedEmotionalWords -= ViolaRossoRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaRossoRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has ViolaGialloVerde}[ViolaGialloVerde]
        {
            - action == Activate: ViolaGialloVerde è stata attivata.
                ~ activeEmotionalWord = ViolaGialloVerde
                ~ ownedEmotionalWords -= ViolaGialloVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaGialloVerde è stata cancellata.
                ~ ownedEmotionalWords -= ViolaGialloVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaGialloVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has ViolaGialloViola}[ViolaGialloViola]
        {
            - action == Activate: ViolaGialloViola è stata attivata.
                ~ activeEmotionalWord = ViolaGialloViola
                ~ ownedEmotionalWords -= ViolaGialloViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaGialloViola è stata cancellata.
                ~ ownedEmotionalWords -= ViolaGialloViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaGialloViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has ViolaGialloBlu}[ViolaGialloBlu]
        {
            - action == Activate: ViolaGialloBlu è stata attivata.
                ~ activeEmotionalWord = ViolaGialloBlu
                ~ ownedEmotionalWords -= GialloGialloBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaGialloBlu è stata cancellata.
                ~ ownedEmotionalWords -= ViolaGialloBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaGialloBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has ViolaGialloGiallo}[ViolaGialloGiallo]
        {
            - action == Activate: ViolaGialloGiallo è stata attivata.
                ~ activeEmotionalWord = ViolaGialloGiallo
                ~ ownedEmotionalWords -= ViolaGialloGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaGialloGiallo è stata cancellata.
                ~ ownedEmotionalWords -= ViolaGialloGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaGialloGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has ViolaGialloRosso}[ViolaGialloRosso]
        {
            - action == Activate: ViolaGialloRosso è stata attivata.
                ~ activeEmotionalWord = ViolaGialloRosso
                ~ ownedEmotionalWords -= ViolaGialloRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaGialloRosso è stata cancellata.
                ~ ownedEmotionalWords -= ViolaGialloRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaGialloRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        } 
    
    + {ownedEmotionalWords has ViolaBluVerde}[ViolaBluVerde]
        {
            - action == Activate: ViolaBluVerde è stata attivata.
                ~ activeEmotionalWord = ViolaBluVerde
                ~ ownedEmotionalWords -= ViolaBluVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaBluVerde è stata cancellata.
                ~ ownedEmotionalWords -= ViolaBluVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaBluVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has ViolaBluViola}[ViolaBluViola]
        {
            - action == Activate: ViolaBluViola è stata attivata.
                ~ activeEmotionalWord = ViolaBluViola
                ~ ownedEmotionalWords -= ViolaBluViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaBluViola è stata cancellata.
                ~ ownedEmotionalWords -= ViolaBluViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaBluViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }
        
    + {ownedEmotionalWords has ViolaBluBlu}[ViolaBluBlu]
        {
            - action == Activate: ViolaBluBlu è stata attivata.
                ~ activeEmotionalWord = ViolaBluBlu
                ~ ownedEmotionalWords -= ViolaBluBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaBluBlu è stata cancellata.
                ~ ownedEmotionalWords -= ViolaBluBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaBluBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }  
        
    + {ownedEmotionalWords has ViolaBluGiallo}[ViolaBluGiallo]
        {
            - action == Activate: ViolaBluGiallo è stata attivata.
                ~ activeEmotionalWord = ViolaBluGiallo
                ~ ownedEmotionalWords -= ViolaBluGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaBluGiallo è stata cancellata.
                ~ ownedEmotionalWords -= ViolaBluGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaBluGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }        

    
    + {ownedEmotionalWords has ViolaBluRosso}[ViolaBluRosso]
        {
            - action == Activate: ViolaBluRosso è stata attivata.
                ~ activeEmotionalWord = ViolaBluRosso
                ~ ownedEmotionalWords -= ViolaBluRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaBluRosso è stata cancellata.
                ~ ownedEmotionalWords -= ViolaBluRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaBluRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has ViolaVerdeVerde}[ViolaVerdeVerde]
        {
            - action == Activate: ViolaVerdeVerde è stata attivata.
                ~ activeEmotionalWord = ViolaVerdeVerde
                ~ ownedEmotionalWords -= ViolaVerdeVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaVerdeVerde è stata cancellata.
                ~ ownedEmotionalWords -= ViolaVerdeVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaVerdeVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has ViolaVerdeViola}[ViolaVerdeViola]
        {
            - action == Activate: ViolaVerdeViola è stata attivata.
                ~ activeEmotionalWord = ViolaVerdeViola
                ~ ownedEmotionalWords -= ViolaVerdeViola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaVerdeViola è stata cancellata.
                ~ ownedEmotionalWords -= ViolaVerdeViola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaVerdeViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has ViolaVerdeBlu}[ViolaVerdeBlu]
        {
            - action == Activate: ViolaVerdeBlu è stata attivata.
                ~ activeEmotionalWord = ViolaVerdeBlu
                ~ ownedEmotionalWords -= ViolaVerdeBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaVerdeBlu è stata cancellata.
                ~ ownedEmotionalWords -= ViolaVerdeBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaVerdeBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has ViolaVerdeGiallo}[ViolaVerdeGiallo]
        {
            - action == Activate: ViolaVerdeGiallo è stata attivata.
                ~ activeEmotionalWord = ViolaVerdeGiallo
                ~ ownedEmotionalWords -= ViolaVerdeGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaVerdeGiallo è stata cancellata.
                ~ ownedEmotionalWords -= ViolaVerdeGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaVerdeGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has ViolaVerdeRosso}[ViolaVerdeRosso]
        {
            - action == Activate: ViolaVerdeRosso è stata attivata.
                ~ activeEmotionalWord = ViolaVerdeRosso
                ~ ownedEmotionalWords -= ViolaVerdeRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaVerdeRosso è stata cancellata.
                ~ ownedEmotionalWords -= ViolaVerdeRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaVerdeRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has ViolaViolaVerde}[ViolaViolaVerde]
        {
            - action == Activate: ViolaViolaVerde è stata attivata.
                ~ activeEmotionalWord = ViolaViolaVerde
                ~ ownedEmotionalWords -= ViolaViolaVerde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaViolaVerde è stata cancellata.
                ~ ownedEmotionalWords -= ViolaViolaVerde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaViolaVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has ViolaViolaBlu}[ViolaViolaBlu]
        {
            - action == Activate: ViolaViolaBlu è stata attivata.
                ~ activeEmotionalWord = ViolaViolaBlu
                ~ ownedEmotionalWords -= ViolaViolaBlu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaViolaBlu è stata cancellata.
                ~ ownedEmotionalWords -= ViolaViolaBlu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaViolaBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has ViolaViolaGiallo}[ViolaViolaGiallo]
        {
            - action == Activate: ViolaViolaGiallo è stata attivata.
                ~ activeEmotionalWord = ViolaViolaGiallo
                ~ ownedEmotionalWords -= ViolaViolaGiallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaViolaGiallo è stata cancellata.
                ~ ownedEmotionalWords -= ViolaViolaGiallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaViolaGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has ViolaViolaRosso}[ViolaViolaRosso]
        {
            - action == Activate: ViolaViolaRosso è stata attivata.
                ~ activeEmotionalWord = ViolaViolaRosso
                ~ ownedEmotionalWords -= ViolaViolaRosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaViolaRosso è stata cancellata.
                ~ ownedEmotionalWords -= ViolaViolaRosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso ViolaViolaRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
 
 
    
    
    + [Ho cambiato idea]
    -
    {
        - activeEmotionalWord != ():
            -> word_usage_counter ->
    }
->->

//Utilizzato per capire quante volte posso usare una parola
=== word_usage_counter
{nestDebug: passo per word_usage_counter.}
{nestDebug: prima dell'aggiornamento il valore di temporaryWordUsageCounter è {temporaryWordUsageCounter}.}
    
    {
        - oneUsageWords has activeEmotionalWord:
            ~ temporaryWordUsageCounter = 1
        
        - twoUsageWords has activeEmotionalWord:
            ~ temporaryWordUsageCounter = 2
        
        - threeUsageWords has activeEmotionalWord:
            ~ temporaryWordUsageCounter = 3
        
        - else: ERROR, non riesco a trovare {activeEmotionalWord} in nessuna delle tre liste, per cui non riesco ad assegnare un valore a temporaryWordUsageCounter, che ora è a {temporaryWordUsageCounter}.
    }
    
{nestDebug: dopo l'aggiornamento il valore di temporaryWordUsageCounter è {temporaryWordUsageCounter}.}  
        
        ->->
