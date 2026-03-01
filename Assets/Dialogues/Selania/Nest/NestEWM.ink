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

    + {nest_ownedEmotionalWords has FireWaterEarth}[FireWaterEarth]
        {
            - action == Activate: FireWaterEarth è stata attivata.
                ~ nest_activeEmotionalWord = FireWaterEarth
                ~ nest_ownedEmotionalWords -= FireWaterEarth
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: FireWaterEarth è stata cancellata.
                ~ nest_ownedEmotionalWords -= FireWaterEarth
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso FireWaterEarth dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has FireWaterAether}[FireWaterAether]
        {
            - action == Activate: FireWaterAether è stata attivata.
                ~ nest_activeEmotionalWord = FireWaterAether
                ~ nest_ownedEmotionalWords -= FireWaterAether
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: FireWaterAether è stata cancellata.
                ~ nest_ownedEmotionalWords -= FireWaterAether
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso FireWaterAether dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }
        
        
    + {nest_ownedEmotionalWords has FireWaterAir}[FireWaterAir]
        {
            - action == Activate: FireWaterAir è stata attivata.
                ~ nest_activeEmotionalWord = FireWaterAir
                ~ nest_ownedEmotionalWords -= FireWaterAir
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: FireWaterAir è stata cancellata.
                ~ nest_ownedEmotionalWords -= FireWaterAir
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso FireWaterAir dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }        

    
    + {nest_ownedEmotionalWords has FireEarthWater}[FireEarthWater]
        {
            - action == Activate: FireEarthWater è stata attivata.
                ~ nest_activeEmotionalWord = FireEarthWater
                ~ nest_ownedEmotionalWords -= FireEarthWater
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: FireEarthWater è stata cancellata.
                ~ nest_ownedEmotionalWords -= FireEarthWater
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso FireEarthWater dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
        

    + {nest_ownedEmotionalWords has FireAetherWater}[FireAetherWater]
        {
            - action == Activate: FireAetherWater è stata attivata.
                ~ nest_activeEmotionalWord = FireAetherWater
                ~ nest_ownedEmotionalWords -= FireAetherWater
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: FireAetherWater è stata cancellata.
                ~ nest_ownedEmotionalWords -= FireAetherWater
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso FireAetherWater dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has FireAetherEarth}[FireAetherEarth]
        {
            - action == Activate: FireAetherEarth è stata attivata.
                ~ nest_activeEmotionalWord = FireAetherEarth
                ~ nest_ownedEmotionalWords -= FireAetherEarth
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: FireAetherEarth è stata cancellata.
                ~ nest_ownedEmotionalWords -= FireAetherEarth
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso FireAetherEarth dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
        

 
 //Varianti a dominante Air

    //Tre note
    + {nest_ownedEmotionalWords has AirFireEarth}[AirFireEarth]
        {
            - action == Activate: AirFireEarth è stata attivata.
                ~ nest_activeEmotionalWord = AirFireEarth
                ~ nest_ownedEmotionalWords -= AirFireEarth
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: AirFireEarth è stata cancellata.
                ~ nest_ownedEmotionalWords -= AirFireEarth
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AirFireEarth dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has AirFireAether}[AirFireAether]
        {
            - action == Activate: AirFireAether è stata attivata.
                ~ nest_activeEmotionalWord = AirFireAether
                ~ nest_ownedEmotionalWords -= AirFireAether
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: AirFireAether è stata cancellata.
                ~ nest_ownedEmotionalWords -= AirFireAether
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AirFireAether dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has AirFireWater}[AirFireWater]
        {
            - action == Activate: AirFireWater è stata attivata.
                ~ nest_activeEmotionalWord = AirFireWater
                ~ nest_ownedEmotionalWords -= AirFireWater
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: AirFireWater è stata cancellata.
                ~ nest_ownedEmotionalWords -= AirFireWater
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AirFireWater dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    

    + {nest_ownedEmotionalWords has AirWaterEarth}[AirWaterEarth]
        {
            - action == Activate: AirWaterEarth è stata attivata.
                ~ nest_activeEmotionalWord = AirWaterEarth
                ~ nest_ownedEmotionalWords -= AirWaterEarth
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: AirWaterEarth è stata cancellata.
                ~ nest_ownedEmotionalWords -= AirWaterEarth
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AirWaterEarth dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        } 
    
    + {nest_ownedEmotionalWords has AirWaterAether}[AirWaterAether]
        {
            - action == Activate: AirWaterAether è stata attivata.
                ~ nest_activeEmotionalWord = AirWaterAether
                ~ nest_ownedEmotionalWords -= AirWaterAether
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: AirWaterAether è stata cancellata.
                ~ nest_ownedEmotionalWords -= AirWaterAether
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AirWaterAether dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has AirWaterFire}[AirWaterFire]
        {
            - action == Activate: AirWaterFire è stata attivata.
                ~ nest_activeEmotionalWord = AirWaterFire
                ~ nest_ownedEmotionalWords -= AirWaterFire
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: AirWaterFire è stata cancellata.
                ~ nest_ownedEmotionalWords -= AirWaterFire
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AirWaterFire dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }        

    
    + {nest_ownedEmotionalWords has AirEarthAether}[AirEarthAether]
        {
            - action == Activate: AirEarthAether è stata attivata.
                ~ nest_activeEmotionalWord = AirEarthAether
                ~ nest_ownedEmotionalWords -= AirEarthAether
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: AirEarthAether è stata cancellata.
                ~ nest_ownedEmotionalWords -= AirEarthAether
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AirEarthAether dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has AirEarthWater}[AirEarthWater]
        {
            - action == Activate: AirEarthWater è stata attivata.
                ~ nest_activeEmotionalWord = AirEarthWater
                ~ nest_ownedEmotionalWords -= AirEarthWater
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: AirEarthWater è stata cancellata.
                ~ nest_ownedEmotionalWords -= AirEarthWater
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AirEarthWater dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    
    + {nest_ownedEmotionalWords has AirEarthFire}[AirEarthFire]
        {
            - action == Activate: AirEarthFire è stata attivata.
                ~ nest_activeEmotionalWord = AirEarthFire
                ~ nest_ownedEmotionalWords -= AirEarthFire
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: AirEarthFire è stata cancellata.
                ~ nest_ownedEmotionalWords -= AirEarthFire
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AirEarthFire dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has AirAetherEarth}[AirAetherEarth]
        {
            - action == Activate: AirAetherEarth è stata attivata.
                ~ nest_activeEmotionalWord = AirAetherEarth
                ~ nest_ownedEmotionalWords -= AirAetherEarth
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: AirAetherEarth è stata cancellata.
                ~ nest_ownedEmotionalWords -= AirAetherEarth
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AirAetherEarth dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
        
    + {nest_ownedEmotionalWords has AirAetherWater}[AirAetherWater]
        {
            - action == Activate: AirAetherWater è stata attivata.
                ~ nest_activeEmotionalWord = AirAetherWater
                ~ nest_ownedEmotionalWords -= AirAetherWater
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: AirAetherWater è stata cancellata.
                ~ nest_ownedEmotionalWords -= AirAetherWater
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AirAetherWater dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    
    + {nest_ownedEmotionalWords has AirAetherFire}[AirAetherFire]
        {
            - action == Activate: AirAetherFire è stata attivata.
                ~ nest_activeEmotionalWord = AirAetherFire
                ~ nest_ownedEmotionalWords -= AirAetherFire
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: AirAetherFire è stata cancellata.
                ~ nest_ownedEmotionalWords -= AirAetherFire
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AirAetherFire dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
 
 
 

    
    //Tre note
    + {nest_ownedEmotionalWords has WaterFireEarth}[WaterFireEarth]
        {
            - action == Activate: WaterFireEarth è stata attivata.
                ~ nest_activeEmotionalWord = WaterFireEarth
                ~ nest_ownedEmotionalWords -= WaterFireEarth
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: WaterFireEarth è stata cancellata.
                ~ nest_ownedEmotionalWords -= WaterFireEarth
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso WaterFireEarth dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has WaterFireAether}[WaterFireAether]
        {
            - action == Activate: WaterFireAether è stata attivata.
                ~ nest_activeEmotionalWord = WaterFireAether
                ~ nest_ownedEmotionalWords -= WaterFireAether
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: WaterFireAether è stata cancellata.
                ~ nest_ownedEmotionalWords -= WaterFireAether
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso WaterFireAether dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    
    + {nest_ownedEmotionalWords has WaterFireAir}[WaterFireAir]
        {
            - action == Activate: WaterFireAir è stata attivata.
                ~ nest_activeEmotionalWord = WaterFireAir
                ~ nest_ownedEmotionalWords -= WaterFireAir
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    

            - action == Delete: WaterFireAir è stata cancellata.
                ~ nest_ownedEmotionalWords -= WaterFireAir
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso WaterFireAir dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    

    + {nest_ownedEmotionalWords has WaterAirEarth}[WaterAirEarth]
        {
            - action == Activate: WaterAirEarth è stata attivata.
                ~ nest_activeEmotionalWord = WaterAirEarth
                ~ nest_ownedEmotionalWords -= WaterAirEarth
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: WaterAirEarth è stata cancellata.
                ~ nest_ownedEmotionalWords -= WaterAirEarth
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso WaterAirEarth dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
        
    + {nest_ownedEmotionalWords has WaterAirAether}[WaterAirAether]
        {
            - action == Activate: WaterAirAether è stata attivata.
                ~ nest_activeEmotionalWord = WaterAirAether
                ~ nest_ownedEmotionalWords -= WaterAirAether
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: WaterAirAether è stata cancellata.
                ~ nest_ownedEmotionalWords -= WaterAirAether
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso WaterAirAether dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    

    + {nest_ownedEmotionalWords has WaterAirFire}[WaterAirFire]
        {
            - action == Activate: WaterAirFire è stata attivata.
                ~ nest_activeEmotionalWord = WaterAirFire
                ~ nest_ownedEmotionalWords -= WaterAirFire
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: WaterAirFire è stata cancellata.
                ~ nest_ownedEmotionalWords -= WaterAirFire
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso WaterAirFire dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        } 
    
      

    

        
    + {nest_ownedEmotionalWords has WaterEarthAether}[WaterEarthAether]
        {
            - action == Activate: WaterEarthAether è stata attivata.
                ~ nest_activeEmotionalWord = WaterEarthAether
                ~ nest_ownedEmotionalWords -= WaterEarthAether
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: WaterEarthAether è stata cancellata.
                ~ nest_ownedEmotionalWords -= WaterEarthAether
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso WaterEarthAether dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has WaterEarthAir}[WaterEarthAir]
        {
            - action == Activate: WaterEarthAir è stata attivata.
                ~ nest_activeEmotionalWord = WaterEarthAir
                ~ nest_ownedEmotionalWords -= WaterEarthAir
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: WaterEarthAir è stata cancellata.
                ~ nest_ownedEmotionalWords -= WaterEarthAir
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso WaterEarthAir dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has WaterEarthFire}[WaterEarthFire]
        {
            - action == Activate: WaterEarthFire è stata attivata.
                ~ nest_activeEmotionalWord = WaterEarthFire
                ~ nest_ownedEmotionalWords -= WaterEarthFire
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: WaterEarthFire è stata cancellata.
                ~ nest_ownedEmotionalWords -= WaterEarthFire
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso WaterEarthFire dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has WaterAetherEarth}[WaterAetherEarth]
        {
            - action == Activate: WaterAetherEarth è stata attivata.
                ~ nest_activeEmotionalWord = WaterAetherEarth
                ~ nest_ownedEmotionalWords -= WaterAetherEarth
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: WaterAetherEarth è stata cancellata.
                ~ nest_ownedEmotionalWords -= WaterAetherEarth
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso WaterAetherEarth dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
        
    
    + {nest_ownedEmotionalWords has WaterAetherFire}[WaterAetherFire]
        {
            - action == Activate: WaterAetherFire è stata attivata.
                ~ nest_activeEmotionalWord = WaterAetherFire
                ~ nest_ownedEmotionalWords -= WaterAetherFire
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: WaterAetherFire è stata cancellata.
                ~ nest_ownedEmotionalWords -= WaterAetherFire
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso WaterAetherFire dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
 
 
 
 
 
 
    + {nest_ownedEmotionalWords has EarthFireAether}[EarthFireAether]
        {
            - action == Activate: EarthFireAether è stata attivata.
                ~ nest_activeEmotionalWord = EarthFireAether
                ~ nest_ownedEmotionalWords -= EarthFireAether
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: EarthFireAether è stata cancellata.
                ~ nest_ownedEmotionalWords -= EarthFireAether
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso EarthFireAether dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has EarthFireWater}[EarthFireWater]
        {
            - action == Activate: EarthFireWater è stata attivata.
                ~ nest_activeEmotionalWord = EarthFireWater
                ~ nest_ownedEmotionalWords -= EarthFireWater
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    

           - action == Delete: EarthFireWater è stata cancellata.
                ~ nest_ownedEmotionalWords -= EarthFireWater
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso EarthFireWater dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has EarthFireAir}[EarthFireAir]
        {
            - action == Activate: EarthFireAir è stata attivata.
                ~ nest_activeEmotionalWord = EarthFireAir
                ~ nest_ownedEmotionalWords -= EarthFireAir
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    

            - action == Delete: EarthFireAir è stata cancellata.
                ~ nest_ownedEmotionalWords -= EarthFireAir
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso EarthFireAir dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
        
    + {nest_ownedEmotionalWords has EarthAirAether}[EarthAirAether]
        {
            - action == Activate: EarthAirAether è stata attivata.
                ~ nest_activeEmotionalWord = EarthAirAether
                ~ nest_ownedEmotionalWords -= EarthAirAether
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: EarthAirAether è stata cancellata.
                ~ nest_ownedEmotionalWords -= EarthAirAether
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso EarthAirAether dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has EarthAirWater}[EarthAirWater]
        {
            - action == Activate: EarthAirWater è stata attivata.
                ~ nest_activeEmotionalWord = EarthAirWater
                ~ nest_ownedEmotionalWords -= EarthAirWater
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: EarthAirWater è stata cancellata.
                ~ nest_ownedEmotionalWords -= EarthAirWater
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso EarthAirWater dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    

    
    + {nest_ownedEmotionalWords has EarthAirFire}[EarthAirFire]
        {
            - action == Activate: EarthAirFire è stata attivata.
                ~ nest_activeEmotionalWord = EarthAirFire
                ~ nest_ownedEmotionalWords -= EarthAirFire
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: EarthAirFire è stata cancellata.
                ~ nest_ownedEmotionalWords -= EarthAirFire
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso EarthAirFire dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        } 

    + {nest_ownedEmotionalWords has EarthWaterAether}[EarthWaterAether]
        {
            - action == Activate: EarthWaterAether è stata attivata.
                ~ nest_activeEmotionalWord = EarthWaterAether
                ~ nest_ownedEmotionalWords -= EarthWaterAether
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: EarthWaterAether è stata cancellata.
                ~ nest_ownedEmotionalWords -= EarthWaterAether
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso EarthWaterAether dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }
        

        
    + {nest_ownedEmotionalWords has EarthWaterAir}[EarthWaterAir]
        {
            - action == Activate: EarthWaterAir è stata attivata.
                ~ nest_activeEmotionalWord = EarthWaterAir
                ~ nest_ownedEmotionalWords -= EarthWaterAir
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: EarthWaterAir è stata cancellata.
                ~ nest_ownedEmotionalWords -= EarthWaterAir
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso EarthWaterAir dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }        

    
    + {nest_ownedEmotionalWords has EarthWaterFire}[EarthWaterFire]
        {
            - action == Activate: EarthWaterFire è stata attivata.
                ~ nest_activeEmotionalWord = EarthWaterFire
                ~ nest_ownedEmotionalWords -= EarthWaterFire
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: EarthWaterFire è stata cancellata.
                ~ nest_ownedEmotionalWords -= EarthWaterFire
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso EarthWaterFire dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
        


    

    + {nest_ownedEmotionalWords has EarthAetherWater}[EarthAetherWater]
        {
            - action == Activate: EarthAetherWater è stata attivata.
                ~ nest_activeEmotionalWord = EarthAetherWater
                ~ nest_ownedEmotionalWords -= EarthAetherWater
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: EarthAetherWater è stata cancellata.
                ~ nest_ownedEmotionalWords -= EarthAetherWater
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso EarthAetherWater dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has EarthAetherAir}[EarthAetherAir]
        {
            - action == Activate: EarthAetherAir è stata attivata.
                ~ nest_activeEmotionalWord = EarthAetherAir
                ~ nest_ownedEmotionalWords -= EarthAetherAir
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: EarthAetherAir è stata cancellata.
                ~ nest_ownedEmotionalWords -= EarthAetherAir
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso EarthAetherAir dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
    + {nest_ownedEmotionalWords has EarthAetherFire}[EarthAetherFire]
        {
            - action == Activate: EarthAetherFire è stata attivata.
                ~ nest_activeEmotionalWord = EarthAetherFire
                ~ nest_ownedEmotionalWords -= EarthAetherFire
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: EarthAetherFire è stata cancellata.
                ~ nest_ownedEmotionalWords -= EarthAetherFire
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso EarthAetherFire dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
 
 
 
 
 
 //Varianti a dominante aether
 
    
    //Tre note
    + {nest_ownedEmotionalWords has AetherFireEarth}[AetherFireEarth]
        {
            - action == Activate: AetherFireEarth è stata attivata.
                ~ nest_activeEmotionalWord = AetherFireEarth
                ~ nest_ownedEmotionalWords -= AetherFireEarth
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: AetherFireEarth è stata cancellata.
                ~ nest_ownedEmotionalWords -= AetherFireEarth
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AetherFireEarth dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }

    + {nest_ownedEmotionalWords has AetherFireWater}[AetherFireWater]
        {
            - action == Activate: AetherFireWater è stata attivata.
                ~ nest_activeEmotionalWord = AetherFireWater
                ~ nest_ownedEmotionalWords -= AetherFireWater
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    

           - action == Delete: AetherFireWater è stata cancellata.
                ~ nest_ownedEmotionalWords -= AetherFireWater
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AetherFireWater dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has AetherFireAir}[AetherFireAir]
        {
            - action == Activate: AetherFireAir è stata attivata.
                ~ nest_activeEmotionalWord = AetherFireAir
                ~ nest_ownedEmotionalWords -= AetherFireAir
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    

            - action == Delete: AetherFireAir è stata cancellata.
                ~ nest_ownedEmotionalWords -= AetherFireAir
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AetherFireAir dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }

    + {nest_ownedEmotionalWords has AetherAirEarth}[AetherAirEarth]
        {
            - action == Activate: AetherAirEarth è stata attivata.
                ~ nest_activeEmotionalWord = AetherAirEarth
                ~ nest_ownedEmotionalWords -= AetherAirEarth
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: AetherAirEarth è stata cancellata.
                ~ nest_ownedEmotionalWords -= AetherAirEarth
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AetherAirEarth dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }

    
    + {nest_ownedEmotionalWords has AetherAirWater}[AetherAirWater]
        {
            - action == Activate: AetherAirWater è stata attivata.
                ~ nest_activeEmotionalWord = AetherAirWater
                ~ nest_ownedEmotionalWords -= AetherAirWater
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: AetherAirWater è stata cancellata.
                ~ nest_ownedEmotionalWords -= AetherAirWater
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AetherAirWater dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }    
    
  
    
    + {nest_ownedEmotionalWords has AetherAirFire}[AetherAirFire]
        {
            - action == Activate: AetherAirFire è stata attivata.
                ~ nest_activeEmotionalWord = AetherAirFire
                ~ nest_ownedEmotionalWords -= AetherAirFire
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: AetherAirFire è stata cancellata.
                ~ nest_ownedEmotionalWords -= AetherAirFire
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AetherAirFire dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        } 
    
    + {nest_ownedEmotionalWords has AetherWaterEarth}[AetherWaterEarth]
        {
            - action == Activate: AetherWaterEarth è stata attivata.
                ~ nest_activeEmotionalWord = AetherWaterEarth
                ~ nest_ownedEmotionalWords -= AetherWaterEarth
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: AetherWaterEarth è stata cancellata.
                ~ nest_ownedEmotionalWords -= AetherWaterEarth
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AetherWaterEarth dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    

        
    + {nest_ownedEmotionalWords has AetherWaterAir}[AetherWaterAir]
        {
            - action == Activate: AetherWaterAir è stata attivata.
                ~ nest_activeEmotionalWord = AetherWaterAir
                ~ nest_ownedEmotionalWords -= AetherWaterAir
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: AetherWaterAir è stata cancellata.
                ~ nest_ownedEmotionalWords -= AetherWaterAir
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AetherWaterAir dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.}  
        }        

    
    + {nest_ownedEmotionalWords has AetherWaterFire}[AetherWaterFire]
        {
            - action == Activate: AetherWaterFire è stata attivata.
                ~ nest_activeEmotionalWord = AetherWaterFire
                ~ nest_ownedEmotionalWords -= AetherWaterFire
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: AetherWaterFire è stata cancellata.
                ~ nest_ownedEmotionalWords -= AetherWaterFire
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AetherWaterFire dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.} 
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
        

    + {nest_ownedEmotionalWords has AetherEarthWater}[AetherEarthWater]
        {
            - action == Activate: AetherEarthWater è stata attivata.
                ~ nest_activeEmotionalWord = AetherEarthWater
                ~ nest_ownedEmotionalWords -= AetherEarthWater
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: AetherEarthWater è stata cancellata.
                ~ nest_ownedEmotionalWords -= AetherEarthWater
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AetherEarthWater dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has AetherEarthAir}[AetherEarthAir]
        {
            - action == Activate: AetherEarthAir è stata attivata.
                ~ nest_activeEmotionalWord = AetherEarthAir
                ~ nest_ownedEmotionalWords -= AetherEarthAir
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: AetherEarthAir è stata cancellata.
                ~ nest_ownedEmotionalWords -= AetherEarthAir
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AetherEarthAir dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
            {debug_nest: ho ridotto il numero di parole prese. nest_takenEmotionalWords ora ha il valore di {nest_takenEmotionalWords}.} 
        }
    
    + {nest_ownedEmotionalWords has AetherEarthFire}[AetherEarthFire]
        {
            - action == Activate: AetherEarthFire è stata attivata.
                ~ nest_activeEmotionalWord = AetherEarthFire
                ~ nest_ownedEmotionalWords -= AetherEarthFire
            {debug_nest: ho attivato una parola, che è {nest_activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}    
            
            - action == Delete: AetherEarthFire è stata cancellata.
                ~ nest_ownedEmotionalWords -= AetherEarthFire
                ~ nest_takenEmotionalWords --
            {debug_nest: ho rimosso AetherEarthFire dalle parole possedute. La lista delle parole possedute ora contiene {nest_ownedEmotionalWords}.}  
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
{debug_nest: prima dell'aggiornamento il valore di glyph_temporaryWordUsageCounter è {glyph_temporaryWordUsageCounter}.}
    
TODO: capire cosa manca qui sotto per farlo usare    
    // {
    //     - nest_oneUseWords  has nest_activeEmotionalWord:
    //         ~ glyph_temporaryWordUsageCounter = 1
        
    //     - nest_twoUseWords  has nest_activeEmotionalWord:
    //         ~ glyph_temporaryWordUsageCounter = 2
        
    //     - nest_threeUseWords has nest_activeEmotionalWord:
    //         ~ glyph_temporaryWordUsageCounter = 3
        
    //     - else: ERROR, non riesco a trovare {nest_activeEmotionalWord} in nessuna delle tre liste, per cui non riesco ad assegnare un valore a glyph_temporaryWordUsageCounter, che ora è a {glyph_temporaryWordUsageCounter}.
    // }
    
{debug_nest: dopo l'aggiornamento il valore di glyph_temporaryWordUsageCounter è {glyph_temporaryWordUsageCounter}.}  
        
        ->->
