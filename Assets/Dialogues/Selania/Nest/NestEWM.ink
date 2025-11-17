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
    + {ownedEmotionalWords has Rosso}[Rosso]
        {
            - action == Activate: Rosso è stata attivata.
                ~ activeEmotionalWord = Rosso
                ~ ownedEmotionalWords -= Rosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: Rosso è stata cancellata.
                ~ ownedEmotionalWords -= Rosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso Rosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }
        
    + {ownedEmotionalWords has RossoRosso}[RossoRosso]
        {
            - action == Activate: RossoRosso è stata attivata.
                ~ activeEmotionalWord = RossoRosso
                ~ ownedEmotionalWords -= RossoRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoRosso è stata cancellata.
                ~ ownedEmotionalWords -= RossoRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }  
        
    + {ownedEmotionalWords has RossoRossoRosso}[RossoRossoRosso]
        {
            - action == Activate: RossoRossoRosso è stata attivata.
                ~ activeEmotionalWord = RossoRossoRosso
                ~ ownedEmotionalWords -= RossoRossoRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoRossoRosso è stata cancellata.
                ~ ownedEmotionalWords -= RossoRossoRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoRossoRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }        

    
    + {ownedEmotionalWords has Giallo}[Giallo]
        {
            - action == Activate: Giallo è stata attivata.
                ~ activeEmotionalWord = Giallo
                ~ ownedEmotionalWords -= Giallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: Giallo è stata cancellata.
                ~ ownedEmotionalWords -= Giallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso Giallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has GialloGiallo}[GialloGiallo]
        {
            - action == Activate: GialloGiallo è stata attivata.
                ~ activeEmotionalWord = GialloGiallo
                ~ ownedEmotionalWords -= GialloGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloGiallo è stata cancellata.
                ~ ownedEmotionalWords -= GialloGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has GialloGialloGiallo}[GialloGialloGiallo]
        {
            - action == Activate: GialloGialloGiallo è stata attivata.
                ~ activeEmotionalWord = GialloGialloGiallo
                ~ ownedEmotionalWords -= GialloGialloGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloGialloGiallo è stata cancellata.
                ~ ownedEmotionalWords -= GialloGialloGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloGialloGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has Verde}[Verde]
        {
            - action == Activate: Verde è stata attivata.
                ~ activeEmotionalWord = Verde
                ~ ownedEmotionalWords -= Verde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: Verde è stata cancellata.
                ~ ownedEmotionalWords -= Verde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso Verde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has VerdeVerde}[VerdeVerde]
        {
            - action == Activate: VerdeVerde è stata attivata.
                ~ activeEmotionalWord = VerdeVerde
                ~ ownedEmotionalWords -= VerdeVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeVerde è stata cancellata.
                ~ ownedEmotionalWords -= VerdeVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has VerdeVerdeVerde}[VerdeVerdeVerde]
        {
            - action == Activate: VerdeVerdeVerde è stata attivata.
                ~ activeEmotionalWord = VerdeVerdeVerde
                ~ ownedEmotionalWords -= VerdeVerdeVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeVerdeVerde è stata cancellata.
                ~ ownedEmotionalWords -= VerdeVerdeVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeVerdeVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has Viola}[Viola]
        {
            - action == Activate: Viola è stata attivata.
                ~ activeEmotionalWord = Viola
                ~ ownedEmotionalWords -= Viola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: Viola è stata cancellata.
                ~ ownedEmotionalWords -= Viola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso Viola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has ViolaViola}[ViolaViola]
        {
            - action == Activate: ViolaViola è stata attivata.
                ~ activeEmotionalWord = ViolaViola
                ~ ownedEmotionalWords -= ViolaViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaViola è stata cancellata.
                ~ ownedEmotionalWords -= ViolaViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has ViolaViolaViola}[ViolaViolaViola]
        {
            - action == Activate: ViolaViolaViola è stata attivata.
                ~ activeEmotionalWord = ViolaViolaViola
                ~ ownedEmotionalWords -= ViolaViolaViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaViolaViola è stata cancellata.
                ~ ownedEmotionalWords -= ViolaViolaViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaViolaViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has Blu}[Blu]
        {
            - action == Activate: Blu è stata attivata.
                ~ activeEmotionalWord = Blu
                ~ ownedEmotionalWords -= Blu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: Blu è stata cancellata.
                ~ ownedEmotionalWords -= Blu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso Blu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has BluBlu}[BluBlu]
        {
            - action == Activate: BluBlu è stata attivata.
                ~ activeEmotionalWord = BluBlu
                ~ ownedEmotionalWords -= BluBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluBlu è stata cancellata.
                ~ ownedEmotionalWords -= BluBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        } 
    
    + {ownedEmotionalWords has BluBluBlu}[BluBluBlu]
        {
            - action == Activate: BluBluBlu è stata attivata.
                ~ activeEmotionalWord = BluBluBlu
                ~ ownedEmotionalWords -= BluBluBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluBluBlu è stata cancellata.
                ~ ownedEmotionalWords -= BluBluBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluBluBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
        
    
 //Varianti a dominante Rosso
    //Due note
    + {ownedEmotionalWords has RossoGiallo}[RossoGiallo]
        {
            - action == Activate: RossoGiallo è stata attivata.
                ~ activeEmotionalWord = RossoGiallo
                ~ ownedEmotionalWords -= RossoGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoGiallo è stata cancellata.
                ~ ownedEmotionalWords -= RossoGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }
        
    + {ownedEmotionalWords has RossoBlu}[RossoBlu]
        {
            - action == Activate: RossoBlu è stata attivata.
                ~ activeEmotionalWord = RossoBlu
                ~ ownedEmotionalWords -= RossoBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoBlu è stata cancellata.
                ~ ownedEmotionalWords -= RossoBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }  
        
    + {ownedEmotionalWords has RossoVerde}[RossoVerde]
        {
            - action == Activate: RossoVerde è stata attivata.
                ~ activeEmotionalWord = RossoVerde
                ~ ownedEmotionalWords -= RossoVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoVerde è stata cancellata.
                ~ ownedEmotionalWords -= RossoVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }        

    
    + {ownedEmotionalWords has RossoViola}[RossoViola]
        {
            - action == Activate: RossoViola è stata attivata.
                ~ activeEmotionalWord = RossoViola
                ~ ownedEmotionalWords -= RossoViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoViola è stata cancellata.
                ~ ownedEmotionalWords -= RossoViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    
    //Tre note
    + {ownedEmotionalWords has RossoRossoBlu}[RossoRossoBlu]
        {
            - action == Activate: RossoRossoBlu è stata attivata.
                ~ activeEmotionalWord = RossoRossoBlu
                ~ ownedEmotionalWords -= RossoRossoBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoRossoBlu è stata cancellata.
                ~ ownedEmotionalWords -= RossoRossoBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoRossoBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has RossoRossoVerde}[RossoRossoVerde]
        {
            - action == Activate: RossoRossoVerde è stata attivata.
                ~ activeEmotionalWord = RossoRossoVerde
                ~ ownedEmotionalWords -= RossoRossoVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoRossoVerde è stata cancellata.
                ~ ownedEmotionalWords -= RossoRossoVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoRossoVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has RossoRossoViola}[RossoRossoViola]
        {
            - action == Activate: RossoRossoViola è stata attivata.
                ~ activeEmotionalWord = RossoRossoViola
                ~ ownedEmotionalWords -= RossoRossoViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoRossoViola è stata cancellata.
                ~ ownedEmotionalWords -= RossoRossoViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoRossoViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has RossoRossoGiallo}[RossoRossoGiallo]
        {
            - action == Activate: RossoRossoGiallo è stata attivata.
                ~ activeEmotionalWord = RossoRossoGiallo
                ~ ownedEmotionalWords -= RossoRossoGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoRossoGiallo è stata cancellata.
                ~ ownedEmotionalWords -= RossoRossoGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoRossoGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has RossoGialloBlu}[RossoGialloBlu]
        {
            - action == Activate: RossoGialloBlu è stata attivata.
                ~ activeEmotionalWord = RossoGialloBlu
                ~ ownedEmotionalWords -= RossoGialloBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoGialloBlu è stata cancellata.
                ~ ownedEmotionalWords -= RossoGialloBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoGialloBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has RossoGialloVerde}[RossoGialloVerde]
        {
            - action == Activate: RossoGialloVerde è stata attivata.
                ~ activeEmotionalWord = RossoGialloVerde
                ~ ownedEmotionalWords -= RossoGialloVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoGialloVerde è stata cancellata.
                ~ ownedEmotionalWords -= RossoGialloVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoGialloVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has RossoGialloViola}[RossoGialloViola]
        {
            - action == Activate: RossoGialloViola è stata attivata.
                ~ activeEmotionalWord = RossoGialloViola
                ~ ownedEmotionalWords -= RossoGialloViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoGialloViola è stata cancellata.
                ~ ownedEmotionalWords -= RossoGialloViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoGialloViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has RossoGialloRosso}[RossoGialloRosso]
        {
            - action == Activate: RossoGialloRosso è stata attivata.
                ~ activeEmotionalWord = RossoGialloRosso
                ~ ownedEmotionalWords -= RossoGialloRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoGialloRosso è stata cancellata.
                ~ ownedEmotionalWords -= RossoGialloRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoGialloRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has RossoGialloGiallo}[RossoGialloGiallo]
        {
            - action == Activate: RossoGialloGiallo è stata attivata.
                ~ activeEmotionalWord = RossoGialloGiallo
                ~ ownedEmotionalWords -= RossoGialloGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoGialloGiallo è stata cancellata.
                ~ ownedEmotionalWords -= RossoGialloGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoGialloGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has RossoBluBlu}[RossoBluBlu]
        {
            - action == Activate: RossoBluBlu è stata attivata.
                ~ activeEmotionalWord = RossoBluBlu
                ~ ownedEmotionalWords -= RossoBluBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoBluBlu è stata cancellata.
                ~ ownedEmotionalWords -= RossoBluBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoBluBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        } 
    
    + {ownedEmotionalWords has RossoBluVerde}[RossoBluVerde]
        {
            - action == Activate: RossoBluVerde è stata attivata.
                ~ activeEmotionalWord = RossoBluVerde
                ~ ownedEmotionalWords -= RossoBluVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoBluVerde è stata cancellata.
                ~ ownedEmotionalWords -= RossoBluVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoBluVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has RossoBluViola}[RossoBluViola]
        {
            - action == Activate: RossoBluViola è stata attivata.
                ~ activeEmotionalWord = RossoBluViola
                ~ ownedEmotionalWords -= RossoBluViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoBluViola è stata cancellata.
                ~ ownedEmotionalWords -= RossoBluViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoBluViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }
        
    + {ownedEmotionalWords has RossoBluRosso}[RossoBluRosso]
        {
            - action == Activate: RossoBluRosso è stata attivata.
                ~ activeEmotionalWord = RossoBluRosso
                ~ ownedEmotionalWords -= RossoBluRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoBluRosso è stata cancellata.
                ~ ownedEmotionalWords -= RossoBluRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoBluRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }  
        
    + {ownedEmotionalWords has RossoBluGiallo}[RossoBluGiallo]
        {
            - action == Activate: RossoBluGiallo è stata attivata.
                ~ activeEmotionalWord = RossoBluGiallo
                ~ ownedEmotionalWords -= RossoBluGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoBluGiallo è stata cancellata.
                ~ ownedEmotionalWords -= RossoBluGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoBluGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }        

    
    + {ownedEmotionalWords has RossoVerdeBlu}[RossoVerdeBlu]
        {
            - action == Activate: RossoVerdeBlu è stata attivata.
                ~ activeEmotionalWord = RossoVerdeBlu
                ~ ownedEmotionalWords -= RossoVerdeBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoVerdeBlu è stata cancellata.
                ~ ownedEmotionalWords -= RossoVerdeBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoVerdeBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has RossoVerdeVerde}[RossoVerdeVerde]
        {
            - action == Activate: RossoVerdeVerde è stata attivata.
                ~ activeEmotionalWord = RossoVerdeVerde
                ~ ownedEmotionalWords -= RossoVerdeVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoVerdeVerde è stata cancellata.
                ~ ownedEmotionalWords -= RossoVerdeVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoVerdeVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has RossoVerdeViola}[RossoVerdeViola]
        {
            - action == Activate: RossoVerdeViola è stata attivata.
                ~ activeEmotionalWord = RossoVerdeViola
                ~ ownedEmotionalWords -= RossoVerdeViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoVerdeViola è stata cancellata.
                ~ ownedEmotionalWords -= RossoVerdeViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoVerdeViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has RossoVerdeRosso}[RossoVerdeRosso]
        {
            - action == Activate: RossoVerdeRosso è stata attivata.
                ~ activeEmotionalWord = RossoVerdeRosso
                ~ ownedEmotionalWords -= RossoVerdeRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoVerdeRosso è stata cancellata.
                ~ ownedEmotionalWords -= RossoVerdeRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoVerdeRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has RossoVerdeGiallo}[RossoVerdeGiallo]
        {
            - action == Activate: RossoVerdeGiallo è stata attivata.
                ~ activeEmotionalWord = RossoVerdeGiallo
                ~ ownedEmotionalWords -= RossoVerdeGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoVerdeGiallo è stata cancellata.
                ~ ownedEmotionalWords -= RossoVerdeGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoVerdeGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has RossoViolaBlu}[RossoViolaBlu]
        {
            - action == Activate: RossoViolaBlu è stata attivata.
                ~ activeEmotionalWord = RossoViolaBlu
                ~ ownedEmotionalWords -= RossoViolaBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoViolaBlu è stata cancellata.
                ~ ownedEmotionalWords -= RossoViolaBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoViolaBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has RossoViolaVerde}[RossoViolaVerde]
        {
            - action == Activate: RossoViolaVerde è stata attivata.
                ~ activeEmotionalWord = RossoViolaVerde
                ~ ownedEmotionalWords -= RossoViolaVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoViolaVerde è stata cancellata.
                ~ ownedEmotionalWords -= RossoViolaVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoViolaVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has RossoViolaViola}[RossoViolaViola]
        {
            - action == Activate: RossoViolaViola è stata attivata.
                ~ activeEmotionalWord = RossoViolaViola
                ~ ownedEmotionalWords -= RossoViolaViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoViolaViola è stata cancellata.
                ~ ownedEmotionalWords -= RossoViolaViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoViolaViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has RossoViolaRosso}[RossoViolaRosso]
        {
            - action == Activate: RossoViolaRosso è stata attivata.
                ~ activeEmotionalWord = RossoViolaRosso
                ~ ownedEmotionalWords -= RossoViolaRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoViolaRosso è stata cancellata.
                ~ ownedEmotionalWords -= RossoViolaRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoViolaRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has RossoViolaGiallo}[RossoViolaGiallo]
        {
            - action == Activate: RossoViolaGiallo è stata attivata.
                ~ activeEmotionalWord = RossoViolaGiallo
                ~ ownedEmotionalWords -= RossoViolaGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: RossoViolaGiallo è stata cancellata.
                ~ ownedEmotionalWords -= RossoViolaGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso RossoViolaGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
 
 //Varianti a dominante Giallo
     //Due note
    + {ownedEmotionalWords has GialloRosso}[GialloRosso]
        {
            - action == Activate: GialloRosso è stata attivata.
                ~ activeEmotionalWord = GialloRosso
                ~ ownedEmotionalWords -= GialloRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloRosso è stata cancellata.
                ~ ownedEmotionalWords -= GialloRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }
        
    + {ownedEmotionalWords has GialloBlu}[GialloBlu]
        {
            - action == Activate: GialloBlu è stata attivata.
                ~ activeEmotionalWord = GialloBlu
                ~ ownedEmotionalWords -= GialloBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloBlu è stata cancellata.
                ~ ownedEmotionalWords -= GialloBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }  
        
    + {ownedEmotionalWords has GialloVerde}[GialloVerde]
        {
            - action == Activate:  GialloVerde è stata attivata.
                ~ activeEmotionalWord = GialloVerde
                ~ ownedEmotionalWords -= GialloVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete:  GialloVerde è stata cancellata.
                ~ ownedEmotionalWords -=  GialloVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso  GialloVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }        

    
    + {ownedEmotionalWords has GialloViola}[GialloViola]
        {
            - action == Activate: GialloViola è stata attivata.
                ~ activeEmotionalWord = GialloViola
                ~ ownedEmotionalWords -= GialloViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloViola è stata cancellata.
                ~ ownedEmotionalWords -= GialloViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    
    //Tre note
    + {ownedEmotionalWords has GialloRossoVerde}[GialloRossoVerde]
        {
            - action == Activate: GialloRossoVerde è stata attivata.
                ~ activeEmotionalWord = GialloRossoVerde
                ~ ownedEmotionalWords -= GialloRossoVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloRossoVerde è stata cancellata.
                ~ ownedEmotionalWords -= GialloRossoVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloRossoVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has GialloRossoViola}[GialloRossoViola]
        {
            - action == Activate: GialloRossoViola è stata attivata.
                ~ activeEmotionalWord = GialloRossoViola
                ~ ownedEmotionalWords -= GialloRossoViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloRossoViola è stata cancellata.
                ~ ownedEmotionalWords -= GialloRossoViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloRossoViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has GialloRossoBlu}[GialloRossoBlu]
        {
            - action == Activate: GialloRossoBlu è stata attivata.
                ~ activeEmotionalWord = GialloRossoBlu
                ~ ownedEmotionalWords -= GialloRossoBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloRossoBlu è stata cancellata.
                ~ ownedEmotionalWords -= GialloRossoBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloRossoBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has GialloRossoGiallo}[GialloRossoGiallo]
        {
            - action == Activate: GialloRossoGiallo è stata attivata.
                ~ activeEmotionalWord = GialloRossoGiallo
                ~ ownedEmotionalWords -= GialloRossoGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloRossoGiallo è stata cancellata.
                ~ ownedEmotionalWords -= GialloRossoGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloRossoGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has GialloRossoRosso}[GialloRossoRosso]
        {
            - action == Activate: GialloRossoRosso è stata attivata.
                ~ activeEmotionalWord = GialloRossoRosso
                ~ ownedEmotionalWords -= GialloRossoRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloRossoRosso è stata cancellata.
                ~ ownedEmotionalWords -= GialloRossoRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloRossoRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has GialloGialloVerde}[GialloGialloVerde]
        {
            - action == Activate: GialloGialloVerde è stata attivata.
                ~ activeEmotionalWord = GialloGialloVerde
                ~ ownedEmotionalWords -= GialloGialloVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloGialloVerde è stata cancellata.
                ~ ownedEmotionalWords -= GialloGialloVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloGialloVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has GialloGialloViola}[GialloGialloViola]
        {
            - action == Activate: GialloGialloViola è stata attivata.
                ~ activeEmotionalWord = GialloGialloViola
                ~ ownedEmotionalWords -= GialloGialloViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloGialloViola è stata cancellata.
                ~ ownedEmotionalWords -= GialloGialloViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloGialloViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has GialloGialloBlu}[GialloGialloBlu]
        {
            - action == Activate: GialloGialloBlu è stata attivata.
                ~ activeEmotionalWord = GialloGialloBlu
                ~ ownedEmotionalWords -= GialloGialloBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloGialloBlu è stata cancellata.
                ~ ownedEmotionalWords -= GialloGialloBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloGialloBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has GialloGialloRosso}[GialloGialloRosso]
        {
            - action == Activate: GialloGialloRosso è stata attivata.
                ~ activeEmotionalWord = GialloGialloRosso
                ~ ownedEmotionalWords -= GialloGialloRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloGialloRosso è stata cancellata.
                ~ ownedEmotionalWords -= GialloGialloRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloGialloRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has GialloBluVerde}[GialloBluVerde]
        {
            - action == Activate: GialloBluVerde è stata attivata.
                ~ activeEmotionalWord = GialloBluVerde
                ~ ownedEmotionalWords -= GialloBluVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloBluVerde è stata cancellata.
                ~ ownedEmotionalWords -= GialloBluVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloBluVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        } 
    
    + {ownedEmotionalWords has GialloBluViola}[GialloBluViola]
        {
            - action == Activate: GialloBluViola è stata attivata.
                ~ activeEmotionalWord = GialloBluViola
                ~ ownedEmotionalWords -= GialloBluViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloBluViola è stata cancellata.
                ~ ownedEmotionalWords -= GialloBluViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloBluViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has GialloBluBlu}[GialloBluBlu]
        {
            - action == Activate: GialloBluBlu è stata attivata.
                ~ activeEmotionalWord = GialloBluBlu
                ~ ownedEmotionalWords -= GialloBluBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloBluBlu è stata cancellata.
                ~ ownedEmotionalWords -= GialloBluBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloBluBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }
        
    + {ownedEmotionalWords has GialloBluGiallo}[GialloBluGiallo]
        {
            - action == Activate: GialloBluGiallo è stata attivata.
                ~ activeEmotionalWord = GialloBluGiallo
                ~ ownedEmotionalWords -= GialloBluGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloBluGiallo è stata cancellata.
                ~ ownedEmotionalWords -= GialloBluGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloBluGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }  
        
    + {ownedEmotionalWords has GialloBluRosso}[GialloBluRosso]
        {
            - action == Activate: GialloBluRosso è stata attivata.
                ~ activeEmotionalWord = GialloBluRosso
                ~ ownedEmotionalWords -= GialloBluRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloBluRosso è stata cancellata.
                ~ ownedEmotionalWords -= GialloBluRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloBluRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }        

    
    + {ownedEmotionalWords has GialloVerdeVerde}[GialloVerdeVerde]
        {
            - action == Activate: GialloVerdeVerde è stata attivata.
                ~ activeEmotionalWord = GialloVerdeVerde
                ~ ownedEmotionalWords -= GialloVerdeVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloVerdeVerde è stata cancellata.
                ~ ownedEmotionalWords -= GialloVerdeVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloVerdeVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has GialloVerdeViola}[GialloVerdeViola]
        {
            - action == Activate: GialloVerdeViola è stata attivata.
                ~ activeEmotionalWord = GialloVerdeViola
                ~ ownedEmotionalWords -= GialloVerdeViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloVerdeViola è stata cancellata.
                ~ ownedEmotionalWords -= GialloVerdeViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloVerdeViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has GialloVerdeBlu}[GialloVerdeBlu]
        {
            - action == Activate: GialloVerdeBlu è stata attivata.
                ~ activeEmotionalWord = GialloVerdeBlu
                ~ ownedEmotionalWords -= GialloVerdeBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloVerdeBlu è stata cancellata.
                ~ ownedEmotionalWords -= GialloVerdeBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloVerdeBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has GialloVerdeGiallo}[GialloVerdeGiallo]
        {
            - action == Activate: GialloVerdeGiallo è stata attivata.
                ~ activeEmotionalWord = GialloVerdeGiallo
                ~ ownedEmotionalWords -= GialloVerdeGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloVerdeGiallo è stata cancellata.
                ~ ownedEmotionalWords -= GialloVerdeGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloVerdeGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has GialloVerdeRosso}[GialloVerdeRosso]
        {
            - action == Activate: GialloVerdeRosso è stata attivata.
                ~ activeEmotionalWord = GialloVerdeRosso
                ~ ownedEmotionalWords -= GialloVerdeRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloVerdeRosso è stata cancellata.
                ~ ownedEmotionalWords -= GialloVerdeRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloVerdeRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has GialloViolaVerde}[GialloViolaVerde]
        {
            - action == Activate: GialloViolaVerde è stata attivata.
                ~ activeEmotionalWord = GialloViolaVerde
                ~ ownedEmotionalWords -= GialloViolaVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloViolaVerde è stata cancellata.
                ~ ownedEmotionalWords -= GialloViolaVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloViolaVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has GialloViolaViola}[GialloViolaViola]
        {
            - action == Activate: GialloViolaViola è stata attivata.
                ~ activeEmotionalWord = GialloViolaViola
                ~ ownedEmotionalWords -= GialloViolaViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloViolaViola è stata cancellata.
                ~ ownedEmotionalWords -= GialloViolaViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloViolaViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has GialloViolaBlu}[GialloViolaBlu]
        {
            - action == Activate: GialloViolaBlu è stata attivata.
                ~ activeEmotionalWord = GialloViolaBlu
                ~ ownedEmotionalWords -= GialloViolaBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloViolaBlu è stata cancellata.
                ~ ownedEmotionalWords -= GialloViolaBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloViolaBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has GialloViolaGiallo}[GialloViolaGiallo]
        {
            - action == Activate: GialloViolaGiallo è stata attivata.
                ~ activeEmotionalWord = GialloViolaGiallo
                ~ ownedEmotionalWords -= GialloViolaGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloViolaGiallo è stata cancellata.
                ~ ownedEmotionalWords -= GialloViolaGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloViolaGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has GialloViolaRosso}[GialloViolaRosso]
        {
            - action == Activate: GialloViolaRosso è stata attivata.
                ~ activeEmotionalWord = GialloViolaRosso
                ~ ownedEmotionalWords -= GialloViolaRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: GialloViolaRosso è stata cancellata.
                ~ ownedEmotionalWords -= GialloViolaRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso GialloViolaRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
 
 
 
 
 //Varianti a dominante blu
         //Due note
    + {ownedEmotionalWords has BluRosso}[BluRosso]
        {
            - action == Activate: BluRosso è stata attivata.
                ~ activeEmotionalWord = BluRosso
                ~ ownedEmotionalWords -= BluRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluRosso è stata cancellata.
                ~ ownedEmotionalWords -= BluRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }
        
    + {ownedEmotionalWords has BluGiallo}[BluGiallo]
        {
            - action == Activate: BluGiallo è stata attivata.
                ~ activeEmotionalWord = BluGiallo
                ~ ownedEmotionalWords -= BluGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluGiallo è stata cancellata.
                ~ ownedEmotionalWords -= BluGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }  
        
    + {ownedEmotionalWords has BluVerde}[BluVerde]
        {
            - action == Activate:  BluVerde è stata attivata.
                ~ activeEmotionalWord = BluVerde
                ~ ownedEmotionalWords -= BluVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete:  BluVerde è stata cancellata.
                ~ ownedEmotionalWords -=  BluVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso  BluVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }        

    
    + {ownedEmotionalWords has BluViola}[BluViola]
        {
            - action == Activate: BluViola è stata attivata.
                ~ activeEmotionalWord = BluViola
                ~ ownedEmotionalWords -= BluViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluViola è stata cancellata.
                ~ ownedEmotionalWords -= BluViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    
    //Tre note
    + {ownedEmotionalWords has BluRossoVerde}[BluRossoVerde]
        {
            - action == Activate: BluRossoVerde è stata attivata.
                ~ activeEmotionalWord = BluRossoVerde
                ~ ownedEmotionalWords -= BluRossoVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluRossoVerde è stata cancellata.
                ~ ownedEmotionalWords -= BluRossoVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluRossoVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has BluRossoViola}[BluRossoViola]
        {
            - action == Activate: BluRossoViola è stata attivata.
                ~ activeEmotionalWord = BluRossoViola
                ~ ownedEmotionalWords -= BluRossoViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluRossoViola è stata cancellata.
                ~ ownedEmotionalWords -= BluRossoViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluRossoViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has BluRossoBlu}[BluRossoBlu]
        {
            - action == Activate: BluRossoBlu è stata attivata.
                ~ activeEmotionalWord = BluRossoBlu
                ~ ownedEmotionalWords -= BluRossoBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    

           - action == Delete: BluRossoBlu è stata cancellata.
                ~ ownedEmotionalWords -= BluRossoBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluRossoBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has BluRossoGiallo}[BluRossoGiallo]
        {
            - action == Activate: BluRossoGiallo è stata attivata.
                ~ activeEmotionalWord = BluRossoGiallo
                ~ ownedEmotionalWords -= BluRossoGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    

            - action == Delete: BluRossoGiallo è stata cancellata.
                ~ ownedEmotionalWords -= BluRossoGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluRossoGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has BluRossoRosso}[BluRossoRosso]
        {
            - action == Activate: BluRossoRosso è stata attivata.
                ~ activeEmotionalWord = BluRossoRosso
                ~ ownedEmotionalWords -= BluRossoRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluRossoRosso è stata cancellata.
                ~ ownedEmotionalWords -= BluRossoRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluRossoRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has BluGialloVerde}[BluGialloVerde]
        {
            - action == Activate: BluGialloVerde è stata attivata.
                ~ activeEmotionalWord = BluGialloVerde
                ~ ownedEmotionalWords -= BluGialloVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluGialloVerde è stata cancellata.
                ~ ownedEmotionalWords -= BluGialloVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluGialloVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has BluGialloViola}[BluGialloViola]
        {
            - action == Activate: BluGialloViola è stata attivata.
                ~ activeEmotionalWord = BluGialloViola
                ~ ownedEmotionalWords -= BluGialloViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluGialloViola è stata cancellata.
                ~ ownedEmotionalWords -= BluGialloViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluGialloViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has BluGialloBlu}[BluGialloBlu]
        {
            - action == Activate: BluGialloBlu è stata attivata.
                ~ activeEmotionalWord = BluGialloBlu
                ~ ownedEmotionalWords -= GialloGialloBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluGialloBlu è stata cancellata.
                ~ ownedEmotionalWords -= BluGialloBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluGialloBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has BluGialloGiallo}[BluGialloGiallo]
        {
            - action == Activate: BluGialloGiallo è stata attivata.
                ~ activeEmotionalWord = BluGialloGiallo
                ~ ownedEmotionalWords -= BluGialloGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluGialloGiallo è stata cancellata.
                ~ ownedEmotionalWords -= BluGialloGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluGialloGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has BluGialloRosso}[BluGialloRosso]
        {
            - action == Activate: BluGialloRosso è stata attivata.
                ~ activeEmotionalWord = BluGialloRosso
                ~ ownedEmotionalWords -= BluGialloRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluGialloRosso è stata cancellata.
                ~ ownedEmotionalWords -= BluGialloRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluGialloRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        } 
    
    + {ownedEmotionalWords has BluBluVerde}[BluBluVerde]
        {
            - action == Activate: BluBluVerde è stata attivata.
                ~ activeEmotionalWord = BluBluVerde
                ~ ownedEmotionalWords -= BluBluVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluBluVerde è stata cancellata.
                ~ ownedEmotionalWords -= BluBluVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluBluVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has BluBluViola}[BluBluViola]
        {
            - action == Activate: BluBluViola è stata attivata.
                ~ activeEmotionalWord = BluBluViola
                ~ ownedEmotionalWords -= BluBluViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluBluViola è stata cancellata.
                ~ ownedEmotionalWords -= BluBluViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluBluViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }
        
    + {ownedEmotionalWords has BluBluGiallo}[BluBluGiallo]
        {
            - action == Activate: BluBluGiallo è stata attivata.
                ~ activeEmotionalWord = BluBluGiallo
                ~ ownedEmotionalWords -= BluBluGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluBluGiallo è stata cancellata.
                ~ ownedEmotionalWords -= BluBluGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluBluGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }  
        
    + {ownedEmotionalWords has BluBluRosso}[BluBluRosso]
        {
            - action == Activate: BluBluRosso è stata attivata.
                ~ activeEmotionalWord = BluBluRosso
                ~ ownedEmotionalWords -= BluBluRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluBluRosso è stata cancellata.
                ~ ownedEmotionalWords -= BluBluRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluBluRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }        

    
    + {ownedEmotionalWords has BluVerdeVerde}[BluVerdeVerde]
        {
            - action == Activate: BluVerdeVerde è stata attivata.
                ~ activeEmotionalWord = BluVerdeVerde
                ~ ownedEmotionalWords -= BluVerdeVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluVerdeVerde è stata cancellata.
                ~ ownedEmotionalWords -= BluVerdeVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluVerdeVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has BluVerdeViola}[BluVerdeViola]
        {
            - action == Activate: BluVerdeViola è stata attivata.
                ~ activeEmotionalWord = BluVerdeViola
                ~ ownedEmotionalWords -= BluVerdeViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluVerdeViola è stata cancellata.
                ~ ownedEmotionalWords -= BluVerdeViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluVerdeViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has BluVerdeBlu}[BluVerdeBlu]
        {
            - action == Activate: BluVerdeBlu è stata attivata.
                ~ activeEmotionalWord = BluVerdeBlu
                ~ ownedEmotionalWords -= BluVerdeBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluVerdeBlu è stata cancellata.
                ~ ownedEmotionalWords -= BluVerdeBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluVerdeBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has BluVerdeGiallo}[BluVerdeGiallo]
        {
            - action == Activate: BluVerdeGiallo è stata attivata.
                ~ activeEmotionalWord = BluVerdeGiallo
                ~ ownedEmotionalWords -= BluVerdeGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluVerdeGiallo è stata cancellata.
                ~ ownedEmotionalWords -= BluVerdeGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluVerdeGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has BluVerdeRosso}[BluVerdeRosso]
        {
            - action == Activate: BluVerdeRosso è stata attivata.
                ~ activeEmotionalWord = BluVerdeRosso
                ~ ownedEmotionalWords -= BluVerdeRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluVerdeRosso è stata cancellata.
                ~ ownedEmotionalWords -= BluVerdeRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluVerdeRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has BluViolaVerde}[BluViolaVerde]
        {
            - action == Activate: BluViolaVerde è stata attivata.
                ~ activeEmotionalWord = BluViolaVerde
                ~ ownedEmotionalWords -= BluViolaVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluViolaVerde è stata cancellata.
                ~ ownedEmotionalWords -= BluViolaVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluViolaVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has BluViolaViola}[BluViolaViola]
        {
            - action == Activate: BluViolaViola è stata attivata.
                ~ activeEmotionalWord = BluViolaViola
                ~ ownedEmotionalWords -= BluViolaViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluViolaViola è stata cancellata.
                ~ ownedEmotionalWords -= BluViolaViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluViolaViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has BluViolaBlu}[BluViolaBlu]
        {
            - action == Activate: BluViolaBlu è stata attivata.
                ~ activeEmotionalWord = BluViolaBlu
                ~ ownedEmotionalWords -= BluViolaBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluViolaBlu è stata cancellata.
                ~ ownedEmotionalWords -= BluViolaBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluViolaBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has BluViolaGiallo}[BluViolaGiallo]
        {
            - action == Activate: BluViolaGiallo è stata attivata.
                ~ activeEmotionalWord = BluViolaGiallo
                ~ ownedEmotionalWords -= BluViolaGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluViolaGiallo è stata cancellata.
                ~ ownedEmotionalWords -= BluViolaGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluViolaGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has BluViolaRosso}[BluViolaRosso]
        {
            - action == Activate: BluViolaRosso è stata attivata.
                ~ activeEmotionalWord = BluViolaRosso
                ~ ownedEmotionalWords -= BluViolaRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: BluViolaRosso è stata cancellata.
                ~ ownedEmotionalWords -= BluViolaRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso BluViolaRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
 
 
 
 
 
 //Varianti a dominante verde
     //Due note
    + {ownedEmotionalWords has VerdeRosso}[VerdeRosso]
        {
            - action == Activate: VerdeRosso è stata attivata.
                ~ activeEmotionalWord = VerdeRosso
                ~ ownedEmotionalWords -= VerdeRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeRosso è stata cancellata.
                ~ ownedEmotionalWords -= VerdeRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }
        
    + {ownedEmotionalWords has VerdeGiallo}[VerdeGiallo]
        {
            - action == Activate: VerdeGiallo è stata attivata.
                ~ activeEmotionalWord = VerdeGiallo
                ~ ownedEmotionalWords -= VerdeGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeGiallo è stata cancellata.
                ~ ownedEmotionalWords -= VerdeGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }  
        
    + {ownedEmotionalWords has VerdeBlu}[VerdeBlu]
        {
            - action == Activate:  VerdeBlu è stata attivata.
                ~ activeEmotionalWord = VerdeBlu
                ~ ownedEmotionalWords -= VerdeBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete:  VerdeBlu è stata cancellata.
                ~ ownedEmotionalWords -=  VerdeBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso  VerdeBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }        

    
    + {ownedEmotionalWords has VerdeViola}[VerdeViola]
        {
            - action == Activate: VerdeViola è stata attivata.
                ~ activeEmotionalWord = VerdeViola
                ~ ownedEmotionalWords -= VerdeViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    

            - action == Delete: VerdeViola è stata cancellata.
                ~ ownedEmotionalWords -= VerdeViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    
    //Tre note
    + {ownedEmotionalWords has VerdeRossoVerde}[VerdeRossoVerde]
        {
            - action == Activate: VerdeRossoVerde è stata attivata.
                ~ activeEmotionalWord = VerdeRossoVerde
                ~ ownedEmotionalWords -= VerdeRossoVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeRossoVerde è stata cancellata.
                ~ ownedEmotionalWords -= VerdeRossoVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeRossoVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has VerdeRossoViola}[VerdeRossoViola]
        {
            - action == Activate: VerdeRossoViola è stata attivata.
                ~ activeEmotionalWord = VerdeRossoViola
                ~ ownedEmotionalWords -= VerdeRossoViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeRossoViola è stata cancellata.
                ~ ownedEmotionalWords -= VerdeRossoViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeRossoViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has VerdeRossoBlu}[VerdeRossoBlu]
        {
            - action == Activate: VerdeRossoBlu è stata attivata.
                ~ activeEmotionalWord = VerdeRossoBlu
                ~ ownedEmotionalWords -= VerdeRossoBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    

           - action == Delete: VerdeRossoBlu è stata cancellata.
                ~ ownedEmotionalWords -= VerdeRossoBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeRossoBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has VerdeRossoGiallo}[VerdeRossoGiallo]
        {
            - action == Activate: VerdeRossoGiallo è stata attivata.
                ~ activeEmotionalWord = VerdeRossoGiallo
                ~ ownedEmotionalWords -= VerdeRossoGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    

            - action == Delete: VerdeRossoGiallo è stata cancellata.
                ~ ownedEmotionalWords -= VerdeRossoGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeRossoGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has VerdeRossoRosso}[VerdeRossoRosso]
        {
            - action == Activate: VerdeRossoRosso è stata attivata.
                ~ activeEmotionalWord = VerdeRossoRosso
                ~ ownedEmotionalWords -= VerdeRossoRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeRossoRosso è stata cancellata.
                ~ ownedEmotionalWords -= VerdeRossoRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeRossoRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has VerdeGialloVerde}[VerdeGialloVerde]
        {
            - action == Activate: VerdeGialloVerde è stata attivata.
                ~ activeEmotionalWord = VerdeGialloVerde
                ~ ownedEmotionalWords -= VerdeGialloVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeGialloVerde è stata cancellata.
                ~ ownedEmotionalWords -= VerdeGialloVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeGialloVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has VerdeGialloViola}[VerdeGialloViola]
        {
            - action == Activate: VerdeGialloViola è stata attivata.
                ~ activeEmotionalWord = VerdeGialloViola
                ~ ownedEmotionalWords -= VerdeGialloViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeGialloViola è stata cancellata.
                ~ ownedEmotionalWords -= VerdeGialloViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeGialloViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has VerdeGialloBlu}[VerdeGialloBlu]
        {
            - action == Activate: VerdeGialloBlu è stata attivata.
                ~ activeEmotionalWord = VerdeGialloBlu
                ~ ownedEmotionalWords -= GialloGialloBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeGialloBlu è stata cancellata.
                ~ ownedEmotionalWords -= VerdeGialloBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeGialloBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has VerdeGialloGiallo}[VerdeGialloGiallo]
        {
            - action == Activate: VerdeGialloGiallo è stata attivata.
                ~ activeEmotionalWord = VerdeGialloGiallo
                ~ ownedEmotionalWords -= VerdeGialloGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeGialloGiallo è stata cancellata.
                ~ ownedEmotionalWords -= VerdeGialloGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeGialloGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has VerdeGialloRosso}[VerdeGialloRosso]
        {
            - action == Activate: VerdeGialloRosso è stata attivata.
                ~ activeEmotionalWord = VerdeGialloRosso
                ~ ownedEmotionalWords -= VerdeGialloRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeGialloRosso è stata cancellata.
                ~ ownedEmotionalWords -= VerdeGialloRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeGialloRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        } 
    
    + {ownedEmotionalWords has VerdeBluVerde}[VerdeBluVerde]
        {
            - action == Activate: VerdeBluVerde è stata attivata.
                ~ activeEmotionalWord = VerdeBluVerde
                ~ ownedEmotionalWords -= VerdeBluVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeBluVerde è stata cancellata.
                ~ ownedEmotionalWords -= VerdeBluVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeBluVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has VerdeBluViola}[VerdeBluViola]
        {
            - action == Activate: VerdeBluViola è stata attivata.
                ~ activeEmotionalWord = VerdeBluViola
                ~ ownedEmotionalWords -= VerdeBluViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeBluViola è stata cancellata.
                ~ ownedEmotionalWords -= VerdeBluViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeBluViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }
        
    + {ownedEmotionalWords has VerdeBluBlu}[VerdeBluBlu]
        {
            - action == Activate: VerdeBluBlu è stata attivata.
                ~ activeEmotionalWord = VerdeBluBlu
                ~ ownedEmotionalWords -= VerdeBluBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeBluBlu è stata cancellata.
                ~ ownedEmotionalWords -= VerdeBluBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeBluBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }  
        
    + {ownedEmotionalWords has VerdeBluGiallo}[VerdeBluGiallo]
        {
            - action == Activate: VerdeBluGiallo è stata attivata.
                ~ activeEmotionalWord = VerdeBluGiallo
                ~ ownedEmotionalWords -= VerdeBluGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeBluGiallo è stata cancellata.
                ~ ownedEmotionalWords -= VerdeBluGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeBluGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }        

    
    + {ownedEmotionalWords has VerdeBluRosso}[VerdeBluRosso]
        {
            - action == Activate: VerdeBluRosso è stata attivata.
                ~ activeEmotionalWord = VerdeBluRosso
                ~ ownedEmotionalWords -= VerdeBluRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeBluRosso è stata cancellata.
                ~ ownedEmotionalWords -= VerdeBluRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeBluRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has VerdeVerdeViola}[VerdeVerdeViola]
        {
            - action == Activate: VerdeVerdeViola è stata attivata.
                ~ activeEmotionalWord = VerdeVerdeViola
                ~ ownedEmotionalWords -= VerdeVerdeViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeVerdeViola è stata cancellata.
                ~ ownedEmotionalWords -= VerdeVerdeViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeVerdeViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has VerdeVerdeBlu}[VerdeVerdeBlu]
        {
            - action == Activate: VerdeVerdeBlu è stata attivata.
                ~ activeEmotionalWord = VerdeVerdeBlu
                ~ ownedEmotionalWords -= VerdeVerdeBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeVerdeBlu è stata cancellata.
                ~ ownedEmotionalWords -= VerdeVerdeBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeVerdeBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has VerdeVerdeGiallo}[VerdeVerdeGiallo]
        {
            - action == Activate: VerdeVerdeGiallo è stata attivata.
                ~ activeEmotionalWord = VerdeVerdeGiallo
                ~ ownedEmotionalWords -= VerdeVerdeGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeVerdeGiallo è stata cancellata.
                ~ ownedEmotionalWords -= VerdeVerdeGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeVerdeGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has VerdeVerdeRosso}[VerdeVerdeRosso]
        {
            - action == Activate: VerdeVerdeRosso è stata attivata.
                ~ activeEmotionalWord = VerdeVerdeRosso
                ~ ownedEmotionalWords -= VerdeVerdeRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeVerdeRosso è stata cancellata.
                ~ ownedEmotionalWords -= VerdeVerdeRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeVerdeRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has VerdeViolaVerde}[VerdeViolaVerde]
        {
            - action == Activate: VerdeViolaVerde è stata attivata.
                ~ activeEmotionalWord = VerdeViolaVerde
                ~ ownedEmotionalWords -= VerdeViolaVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeViolaVerde è stata cancellata.
                ~ ownedEmotionalWords -= VerdeViolaVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeViolaVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has VerdeViolaViola}[VerdeViolaViola]
        {
            - action == Activate: VerdeViolaViola è stata attivata.
                ~ activeEmotionalWord = VerdeViolaViola
                ~ ownedEmotionalWords -= VerdeViolaViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeViolaViola è stata cancellata.
                ~ ownedEmotionalWords -= VerdeViolaViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeViolaViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has VerdeViolaBlu}[VerdeViolaBlu]
        {
            - action == Activate: VerdeViolaBlu è stata attivata.
                ~ activeEmotionalWord = VerdeViolaBlu
                ~ ownedEmotionalWords -= VerdeViolaBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeViolaBlu è stata cancellata.
                ~ ownedEmotionalWords -= VerdeViolaBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeViolaBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has VerdeViolaGiallo}[VerdeViolaGiallo]
        {
            - action == Activate: VerdeViolaGiallo è stata attivata.
                ~ activeEmotionalWord = VerdeViolaGiallo
                ~ ownedEmotionalWords -= VerdeViolaGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeViolaGiallo è stata cancellata.
                ~ ownedEmotionalWords -= VerdeViolaGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeViolaGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has VerdeViolaRosso}[VerdeViolaRosso]
        {
            - action == Activate: VerdeViolaRosso è stata attivata.
                ~ activeEmotionalWord = VerdeViolaRosso
                ~ ownedEmotionalWords -= VerdeViolaRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: VerdeViolaRosso è stata cancellata.
                ~ ownedEmotionalWords -= VerdeViolaRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso VerdeViolaRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
 
 
 
 
 
 //Varianti a dominante viola
    //Due note
    + {ownedEmotionalWords has ViolaRosso}[ViolaRosso]
        {
            - action == Activate: ViolaRosso è stata attivata.
                ~ activeEmotionalWord = ViolaRosso
                ~ ownedEmotionalWords -= ViolaRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaRosso è stata cancellata.
                ~ ownedEmotionalWords -= ViolaRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }
        
    + {ownedEmotionalWords has ViolaGiallo}[ViolaGiallo]
        {
            - action == Activate: ViolaGiallo è stata attivata.
                ~ activeEmotionalWord = ViolaGiallo
                ~ ownedEmotionalWords -= ViolaGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaGiallo è stata cancellata.
                ~ ownedEmotionalWords -= ViolaGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }  
        
    + {ownedEmotionalWords has ViolaBlu}[ViolaBlu]
        {
            - action == Activate:  ViolaBlu è stata attivata.
                ~ activeEmotionalWord = ViolaBlu
                ~ ownedEmotionalWords -= ViolaBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete:  ViolaBlu è stata cancellata.
                ~ ownedEmotionalWords -=  ViolaBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso  ViolaBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }        

    
    + {ownedEmotionalWords has ViolaVerde}[ViolaVerde]
        {
            - action == Activate: ViolaVerde è stata attivata.
                ~ activeEmotionalWord = ViolaVerde
                ~ ownedEmotionalWords -= ViolaVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    

            - action == Delete: ViolaVerde è stata cancellata.
                ~ ownedEmotionalWords -= ViolaVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    
    //Tre note
    + {ownedEmotionalWords has ViolaRossoVerde}[ViolaRossoVerde]
        {
            - action == Activate: ViolaRossoVerde è stata attivata.
                ~ activeEmotionalWord = ViolaRossoVerde
                ~ ownedEmotionalWords -= ViolaRossoVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaRossoVerde è stata cancellata.
                ~ ownedEmotionalWords -= ViolaRossoVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaRossoVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has ViolaRossoViola}[ViolaRossoViola]
        {
            - action == Activate: ViolaRossoViola è stata attivata.
                ~ activeEmotionalWord = ViolaRossoViola
                ~ ownedEmotionalWords -= ViolaRossoViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaRossoViola è stata cancellata.
                ~ ownedEmotionalWords -= ViolaRossoViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaRossoViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has ViolaRossoBlu}[ViolaRossoBlu]
        {
            - action == Activate: ViolaRossoBlu è stata attivata.
                ~ activeEmotionalWord = ViolaRossoBlu
                ~ ownedEmotionalWords -= ViolaRossoBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    

           - action == Delete: ViolaRossoBlu è stata cancellata.
                ~ ownedEmotionalWords -= ViolaRossoBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaRossoBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has ViolaRossoGiallo}[ViolaRossoGiallo]
        {
            - action == Activate: ViolaRossoGiallo è stata attivata.
                ~ activeEmotionalWord = ViolaRossoGiallo
                ~ ownedEmotionalWords -= ViolaRossoGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    

            - action == Delete: ViolaRossoGiallo è stata cancellata.
                ~ ownedEmotionalWords -= ViolaRossoGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaRossoGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has ViolaRossoRosso}[ViolaRossoRosso]
        {
            - action == Activate: ViolaRossoRosso è stata attivata.
                ~ activeEmotionalWord = ViolaRossoRosso
                ~ ownedEmotionalWords -= ViolaRossoRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaRossoRosso è stata cancellata.
                ~ ownedEmotionalWords -= ViolaRossoRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaRossoRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has ViolaGialloVerde}[ViolaGialloVerde]
        {
            - action == Activate: ViolaGialloVerde è stata attivata.
                ~ activeEmotionalWord = ViolaGialloVerde
                ~ ownedEmotionalWords -= ViolaGialloVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaGialloVerde è stata cancellata.
                ~ ownedEmotionalWords -= ViolaGialloVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaGialloVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has ViolaGialloViola}[ViolaGialloViola]
        {
            - action == Activate: ViolaGialloViola è stata attivata.
                ~ activeEmotionalWord = ViolaGialloViola
                ~ ownedEmotionalWords -= ViolaGialloViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaGialloViola è stata cancellata.
                ~ ownedEmotionalWords -= ViolaGialloViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaGialloViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has ViolaGialloBlu}[ViolaGialloBlu]
        {
            - action == Activate: ViolaGialloBlu è stata attivata.
                ~ activeEmotionalWord = ViolaGialloBlu
                ~ ownedEmotionalWords -= GialloGialloBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaGialloBlu è stata cancellata.
                ~ ownedEmotionalWords -= ViolaGialloBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaGialloBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has ViolaGialloGiallo}[ViolaGialloGiallo]
        {
            - action == Activate: ViolaGialloGiallo è stata attivata.
                ~ activeEmotionalWord = ViolaGialloGiallo
                ~ ownedEmotionalWords -= ViolaGialloGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaGialloGiallo è stata cancellata.
                ~ ownedEmotionalWords -= ViolaGialloGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaGialloGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has ViolaGialloRosso}[ViolaGialloRosso]
        {
            - action == Activate: ViolaGialloRosso è stata attivata.
                ~ activeEmotionalWord = ViolaGialloRosso
                ~ ownedEmotionalWords -= ViolaGialloRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaGialloRosso è stata cancellata.
                ~ ownedEmotionalWords -= ViolaGialloRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaGialloRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        } 
    
    + {ownedEmotionalWords has ViolaBluVerde}[ViolaBluVerde]
        {
            - action == Activate: ViolaBluVerde è stata attivata.
                ~ activeEmotionalWord = ViolaBluVerde
                ~ ownedEmotionalWords -= ViolaBluVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaBluVerde è stata cancellata.
                ~ ownedEmotionalWords -= ViolaBluVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaBluVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has ViolaBluViola}[ViolaBluViola]
        {
            - action == Activate: ViolaBluViola è stata attivata.
                ~ activeEmotionalWord = ViolaBluViola
                ~ ownedEmotionalWords -= ViolaBluViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaBluViola è stata cancellata.
                ~ ownedEmotionalWords -= ViolaBluViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaBluViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }
        
    + {ownedEmotionalWords has ViolaBluBlu}[ViolaBluBlu]
        {
            - action == Activate: ViolaBluBlu è stata attivata.
                ~ activeEmotionalWord = ViolaBluBlu
                ~ ownedEmotionalWords -= ViolaBluBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaBluBlu è stata cancellata.
                ~ ownedEmotionalWords -= ViolaBluBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaBluBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }  
        
    + {ownedEmotionalWords has ViolaBluGiallo}[ViolaBluGiallo]
        {
            - action == Activate: ViolaBluGiallo è stata attivata.
                ~ activeEmotionalWord = ViolaBluGiallo
                ~ ownedEmotionalWords -= ViolaBluGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaBluGiallo è stata cancellata.
                ~ ownedEmotionalWords -= ViolaBluGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaBluGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }        

    
    + {ownedEmotionalWords has ViolaBluRosso}[ViolaBluRosso]
        {
            - action == Activate: ViolaBluRosso è stata attivata.
                ~ activeEmotionalWord = ViolaBluRosso
                ~ ownedEmotionalWords -= ViolaBluRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaBluRosso è stata cancellata.
                ~ ownedEmotionalWords -= ViolaBluRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaBluRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has ViolaVerdeVerde}[ViolaVerdeVerde]
        {
            - action == Activate: ViolaVerdeVerde è stata attivata.
                ~ activeEmotionalWord = ViolaVerdeVerde
                ~ ownedEmotionalWords -= ViolaVerdeVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaVerdeVerde è stata cancellata.
                ~ ownedEmotionalWords -= ViolaVerdeVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaVerdeVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has ViolaVerdeViola}[ViolaVerdeViola]
        {
            - action == Activate: ViolaVerdeViola è stata attivata.
                ~ activeEmotionalWord = ViolaVerdeViola
                ~ ownedEmotionalWords -= ViolaVerdeViola
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaVerdeViola è stata cancellata.
                ~ ownedEmotionalWords -= ViolaVerdeViola
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaVerdeViola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has ViolaVerdeBlu}[ViolaVerdeBlu]
        {
            - action == Activate: ViolaVerdeBlu è stata attivata.
                ~ activeEmotionalWord = ViolaVerdeBlu
                ~ ownedEmotionalWords -= ViolaVerdeBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaVerdeBlu è stata cancellata.
                ~ ownedEmotionalWords -= ViolaVerdeBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaVerdeBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has ViolaVerdeGiallo}[ViolaVerdeGiallo]
        {
            - action == Activate: ViolaVerdeGiallo è stata attivata.
                ~ activeEmotionalWord = ViolaVerdeGiallo
                ~ ownedEmotionalWords -= ViolaVerdeGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaVerdeGiallo è stata cancellata.
                ~ ownedEmotionalWords -= ViolaVerdeGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaVerdeGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has ViolaVerdeRosso}[ViolaVerdeRosso]
        {
            - action == Activate: ViolaVerdeRosso è stata attivata.
                ~ activeEmotionalWord = ViolaVerdeRosso
                ~ ownedEmotionalWords -= ViolaVerdeRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaVerdeRosso è stata cancellata.
                ~ ownedEmotionalWords -= ViolaVerdeRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaVerdeRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has ViolaViolaVerde}[ViolaViolaVerde]
        {
            - action == Activate: ViolaViolaVerde è stata attivata.
                ~ activeEmotionalWord = ViolaViolaVerde
                ~ ownedEmotionalWords -= ViolaViolaVerde
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaViolaVerde è stata cancellata.
                ~ ownedEmotionalWords -= ViolaViolaVerde
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaViolaVerde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
        
    + {ownedEmotionalWords has ViolaViolaBlu}[ViolaViolaBlu]
        {
            - action == Activate: ViolaViolaBlu è stata attivata.
                ~ activeEmotionalWord = ViolaViolaBlu
                ~ ownedEmotionalWords -= ViolaViolaBlu
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaViolaBlu è stata cancellata.
                ~ ownedEmotionalWords -= ViolaViolaBlu
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaViolaBlu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    + {ownedEmotionalWords has ViolaViolaGiallo}[ViolaViolaGiallo]
        {
            - action == Activate: ViolaViolaGiallo è stata attivata.
                ~ activeEmotionalWord = ViolaViolaGiallo
                ~ ownedEmotionalWords -= ViolaViolaGiallo
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaViolaGiallo è stata cancellata.
                ~ ownedEmotionalWords -= ViolaViolaGiallo
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaViolaGiallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
    + {ownedEmotionalWords has ViolaViolaRosso}[ViolaViolaRosso]
        {
            - action == Activate: ViolaViolaRosso è stata attivata.
                ~ activeEmotionalWord = ViolaViolaRosso
                ~ ownedEmotionalWords -= ViolaViolaRosso
            {debug_nest: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: ViolaViolaRosso è stata cancellata.
                ~ ownedEmotionalWords -= ViolaViolaRosso
                ~ takenEmotionalWords --
            {debug_nest: ho rimosso ViolaViolaRosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
 

    -
    
    {
        - activeEmotionalWord != ():
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
        - nest_oneUseWords has activeEmotionalWord:
            ~ temporaryWordUsageCounter = 1
        
        - nest_twoUseWords has activeEmotionalWord:
            ~ temporaryWordUsageCounter = 2
        
        - nest_threeUseWords has activeEmotionalWord:
            ~ temporaryWordUsageCounter = 3
        
        - else: ERROR, non riesco a trovare {activeEmotionalWord} in nessuna delle tre liste, per cui non riesco ad assegnare un valore a temporaryWordUsageCounter, che ora è a {temporaryWordUsageCounter}.
    }
    
{debug_nest: dopo l'aggiornamento il valore di temporaryWordUsageCounter è {temporaryWordUsageCounter}.}  
        
        ->->
