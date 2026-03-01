=== sigils_activation(action)
    //Abilito il box di dialogo ad hoc per il Nest
        ~ enableNestDialogue()

//Questa è la funzione che usiamo sia per rimuovere che per attivare una parola posseduta.
{debug_nest: sigils_activation(action). Il valore di action è {action}.}

    //Ho cambiato idea è all'inizio così (dovrebbe) comparire sempre come ultima scelta su unity, e quindi centrata in basso
    + [Ho cambiato idea]

//Dominante fuoco

    + {glyph_discoveredSigils has FireWaterEarth}[FireWaterEarth]
        FireWaterEarth è stata attivata.
                ~ glyph_actualActiveSigil = FireWaterEarth
                ~ glyph_discoveredSigils -= FireWaterEarth
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    

    + {glyph_discoveredSigils has FireWaterAether}[FireWaterAether]
        FireWaterAether è stata attivata.
                ~ glyph_actualActiveSigil = FireWaterAether
                ~ glyph_discoveredSigils -= FireWaterAether
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    

        
    + {glyph_discoveredSigils has FireWaterAir}[FireWaterAir]
        FireWaterAir è stata attivata.
                ~ glyph_actualActiveSigil = FireWaterAir
                ~ glyph_discoveredSigils -= FireWaterAir
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    

    
    + {glyph_discoveredSigils has FireEarthWater}[FireEarthWater]
        FireEarthWater è stata attivata.
                ~ glyph_actualActiveSigil = FireEarthWater
                ~ glyph_discoveredSigils -= FireEarthWater
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
            


    + {glyph_discoveredSigils has FireAetherWater}[FireAetherWater]
        FireAetherWater è stata attivata.
                ~ glyph_actualActiveSigil = FireAetherWater
                ~ glyph_discoveredSigils -= FireAetherWater
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    

           
    
    + {glyph_discoveredSigils has FireAetherEarth}[FireAetherEarth]
        FireAetherEarth è stata attivata.
                ~ glyph_actualActiveSigil = FireAetherEarth
                ~ glyph_discoveredSigils -= FireAetherEarth
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    


 
 //Varianti a dominante Air

    + {glyph_discoveredSigils has AirFireEarth}[AirFireEarth]
        AirFireEarth è stata attivata.
                ~ glyph_actualActiveSigil = AirFireEarth
                ~ glyph_discoveredSigils -= AirFireEarth
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
            

       
    
    + {glyph_discoveredSigils has AirFireAether}[AirFireAether]
        AirFireAether è stata attivata.
                ~ glyph_actualActiveSigil = AirFireAether
                ~ glyph_discoveredSigils -= AirFireAether
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
            

    
    + {glyph_discoveredSigils has AirFireWater}[AirFireWater]
        AirFireWater è stata attivata.
                ~ glyph_actualActiveSigil = AirFireWater
                ~ glyph_discoveredSigils -= AirFireWater
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
            

       
    

    + {glyph_discoveredSigils has AirWaterEarth}[AirWaterEarth]
        AirWaterEarth è stata attivata.
                ~ glyph_actualActiveSigil = AirWaterEarth
                ~ glyph_discoveredSigils -= AirWaterEarth
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    

        
    
    + {glyph_discoveredSigils has AirWaterAether}[AirWaterAether]
        AirWaterAether è stata attivata.
                ~ glyph_actualActiveSigil = AirWaterAether
                ~ glyph_discoveredSigils -= AirWaterAether
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
            

       
    
    + {glyph_discoveredSigils has AirWaterFire}[AirWaterFire]
        AirWaterFire è stata attivata.
                ~ glyph_actualActiveSigil = AirWaterFire
                ~ glyph_discoveredSigils -= AirWaterFire
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
            

               

    
    + {glyph_discoveredSigils has AirEarthAether}[AirEarthAether]
        AirEarthAether è stata attivata.
                ~ glyph_actualActiveSigil = AirEarthAether
                ~ glyph_discoveredSigils -= AirEarthAether
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
            

       
    
    + {glyph_discoveredSigils has AirEarthWater}[AirEarthWater]
        AirEarthWater è stata attivata.
                ~ glyph_actualActiveSigil = AirEarthWater
                ~ glyph_discoveredSigils -= AirEarthWater
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
            
           
    
    
    + {glyph_discoveredSigils has AirEarthFire}[AirEarthFire]
        AirEarthFire è stata attivata.
                ~ glyph_actualActiveSigil = AirEarthFire
                ~ glyph_discoveredSigils -= AirEarthFire
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    

       
    
    + {glyph_discoveredSigils has AirAetherEarth}[AirAetherEarth]
        AirAetherEarth è stata attivata.
                ~ glyph_actualActiveSigil = AirAetherEarth
                ~ glyph_discoveredSigils -= AirAetherEarth
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
            

        
    + {glyph_discoveredSigils has AirAetherWater}[AirAetherWater]
        AirAetherWater è stata attivata.
                ~ glyph_actualActiveSigil = AirAetherWater
                ~ glyph_discoveredSigils -= AirAetherWater
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
            

    + {glyph_discoveredSigils has AirAetherFire}[AirAetherFire]
        AirAetherFire è stata attivata.
                ~ glyph_actualActiveSigil = AirAetherFire
                ~ glyph_discoveredSigils -= AirAetherFire
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
            


//Dominante acqua
    + {glyph_discoveredSigils has WaterFireEarth}[WaterFireEarth]
        WaterFireEarth è stata attivata.
                ~ glyph_actualActiveSigil = WaterFireEarth
                ~ glyph_discoveredSigils -= WaterFireEarth
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
            

    
    + {glyph_discoveredSigils has WaterFireAether}[WaterFireAether]
        WaterFireAether è stata attivata.
                ~ glyph_actualActiveSigil = WaterFireAether
                ~ glyph_discoveredSigils -= WaterFireAether
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
            

    
    + {glyph_discoveredSigils has WaterFireAir}[WaterFireAir]
        WaterFireAir è stata attivata.
                ~ glyph_actualActiveSigil = WaterFireAir
                ~ glyph_discoveredSigils -= WaterFireAir
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    



    + {glyph_discoveredSigils has WaterAirEarth}[WaterAirEarth]
        WaterAirEarth è stata attivata.
                ~ glyph_actualActiveSigil = WaterAirEarth
                ~ glyph_discoveredSigils -= WaterAirEarth
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    

        
    + {glyph_discoveredSigils has WaterAirAether}[WaterAirAether]
        WaterAirAether è stata attivata.
                ~ glyph_actualActiveSigil = WaterAirAether
                ~ glyph_discoveredSigils -= WaterAirAether
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
            


    + {glyph_discoveredSigils has WaterAirFire}[WaterAirFire]
        WaterAirFire è stata attivata.
                ~ glyph_actualActiveSigil = WaterAirFire
                ~ glyph_discoveredSigils -= WaterAirFire
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    

    
    + {glyph_discoveredSigils has WaterEarthAether}[WaterEarthAether]
        WaterEarthAether è stata attivata.
                ~ glyph_actualActiveSigil = WaterEarthAether
                ~ glyph_discoveredSigils -= WaterEarthAether
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    

    + {glyph_discoveredSigils has WaterEarthAir}[WaterEarthAir]
        WaterEarthAir è stata attivata.
                ~ glyph_actualActiveSigil = WaterEarthAir
                ~ glyph_discoveredSigils -= WaterEarthAir
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
            

       
    
    + {glyph_discoveredSigils has WaterEarthFire}[WaterEarthFire]
        WaterEarthFire è stata attivata.
                ~ glyph_actualActiveSigil = WaterEarthFire
                ~ glyph_discoveredSigils -= WaterEarthFire
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    

       
    
    + {glyph_discoveredSigils has WaterAetherEarth}[WaterAetherEarth]
        WaterAetherEarth è stata attivata.
                ~ glyph_actualActiveSigil = WaterAetherEarth
                ~ glyph_discoveredSigils -= WaterAetherEarth
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
            
    
    + {glyph_discoveredSigils has WaterAetherFire}[WaterAetherFire]
        WaterAetherFire è stata attivata.
                ~ glyph_actualActiveSigil = WaterAetherFire
                ~ glyph_discoveredSigils -= WaterAetherFire
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    


    //Dominante terra   
 
    + {glyph_discoveredSigils has EarthFireAether}[EarthFireAether]
        EarthFireAether è stata attivata.
                ~ glyph_actualActiveSigil = EarthFireAether
                ~ glyph_discoveredSigils -= EarthFireAether
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    

    + {glyph_discoveredSigils has EarthFireWater}[EarthFireWater]
        EarthFireWater è stata attivata.
                ~ glyph_actualActiveSigil = EarthFireWater
                ~ glyph_discoveredSigils -= EarthFireWater
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    

    
    + {glyph_discoveredSigils has EarthFireAir}[EarthFireAir]
        EarthFireAir è stata attivata.
                ~ glyph_actualActiveSigil = EarthFireAir
                ~ glyph_discoveredSigils -= EarthFireAir
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    


    + {glyph_discoveredSigils has EarthAirAether}[EarthAirAether]
        EarthAirAether è stata attivata.
                ~ glyph_actualActiveSigil = EarthAirAether
                ~ glyph_discoveredSigils -= EarthAirAether
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    


    + {glyph_discoveredSigils has EarthAirWater}[EarthAirWater]
        EarthAirWater è stata attivata.
                ~ glyph_actualActiveSigil = EarthAirWater
                ~ glyph_discoveredSigils -= EarthAirWater
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    

    + {glyph_discoveredSigils has EarthAirFire}[EarthAirFire]
        EarthAirFire è stata attivata.
                ~ glyph_actualActiveSigil = EarthAirFire
                ~ glyph_discoveredSigils -= EarthAirFire
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    

    + {glyph_discoveredSigils has EarthWaterAether}[EarthWaterAether]
        EarthWaterAether è stata attivata.
                ~ glyph_actualActiveSigil = EarthWaterAether
                ~ glyph_discoveredSigils -= EarthWaterAether
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
            
    + {glyph_discoveredSigils has EarthWaterAir}[EarthWaterAir]
        EarthWaterAir è stata attivata.
                ~ glyph_actualActiveSigil = EarthWaterAir
                ~ glyph_discoveredSigils -= EarthWaterAir
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    


    + {glyph_discoveredSigils has EarthWaterFire}[EarthWaterFire]
        EarthWaterFire è stata attivata.
                ~ glyph_actualActiveSigil = EarthWaterFire
                ~ glyph_discoveredSigils -= EarthWaterFire
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    


    + {glyph_discoveredSigils has EarthAetherWater}[EarthAetherWater]
        EarthAetherWater è stata attivata.
                ~ glyph_actualActiveSigil = EarthAetherWater
                ~ glyph_discoveredSigils -= EarthAetherWater
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    

    + {glyph_discoveredSigils has EarthAetherAir}[EarthAetherAir]
        EarthAetherAir è stata attivata.
                ~ glyph_actualActiveSigil = EarthAetherAir
                ~ glyph_discoveredSigils -= EarthAetherAir
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    


    + {glyph_discoveredSigils has EarthAetherFire}[EarthAetherFire]
        EarthAetherFire è stata attivata.
                ~ glyph_actualActiveSigil = EarthAetherFire
                ~ glyph_discoveredSigils -= EarthAetherFire
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    

       
 //Varianti a dominante aether
 
    
    + {glyph_discoveredSigils has AetherFireEarth}[AetherFireEarth]
        AetherFireEarth è stata attivata.
                ~ glyph_actualActiveSigil = AetherFireEarth
                ~ glyph_discoveredSigils -= AetherFireEarth
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
            

    + {glyph_discoveredSigils has AetherFireWater}[AetherFireWater]
        AetherFireWater è stata attivata.
                ~ glyph_actualActiveSigil = AetherFireWater
                ~ glyph_discoveredSigils -= AetherFireWater
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    


    
    + {glyph_discoveredSigils has AetherFireAir}[AetherFireAir]
        AetherFireAir è stata attivata.
                ~ glyph_actualActiveSigil = AetherFireAir
                ~ glyph_discoveredSigils -= AetherFireAir
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    


    + {glyph_discoveredSigils has AetherAirEarth}[AetherAirEarth]
        AetherAirEarth è stata attivata.
                ~ glyph_actualActiveSigil = AetherAirEarth
                ~ glyph_discoveredSigils -= AetherAirEarth
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
            

    + {glyph_discoveredSigils has AetherAirWater}[AetherAirWater]
        AetherAirWater è stata attivata.
                ~ glyph_actualActiveSigil = AetherAirWater
                ~ glyph_discoveredSigils -= AetherAirWater
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
            
    
    + {glyph_discoveredSigils has AetherAirFire}[AetherAirFire]
        AetherAirFire è stata attivata.
                ~ glyph_actualActiveSigil = AetherAirFire
                ~ glyph_discoveredSigils -= AetherAirFire
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    

    + {glyph_discoveredSigils has AetherWaterEarth}[AetherWaterEarth]
        AetherWaterEarth è stata attivata.
                ~ glyph_actualActiveSigil = AetherWaterEarth
                ~ glyph_discoveredSigils -= AetherWaterEarth
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
            

    + {glyph_discoveredSigils has AetherWaterAir}[AetherWaterAir]
        AetherWaterAir è stata attivata.
                ~ glyph_actualActiveSigil = AetherWaterAir
                ~ glyph_discoveredSigils -= AetherWaterAir
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
            

    + {glyph_discoveredSigils has AetherWaterFire}[AetherWaterFire]
        AetherWaterFire è stata attivata.
                ~ glyph_actualActiveSigil = AetherWaterFire
                ~ glyph_discoveredSigils -= AetherWaterFire
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
            

    + {glyph_discoveredSigils has AetherEarthWater}[AetherEarthWater]
        AetherEarthWater è stata attivata.
                ~ glyph_actualActiveSigil = AetherEarthWater
                ~ glyph_discoveredSigils -= AetherEarthWater
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    


    + {glyph_discoveredSigils has AetherEarthAir}[AetherEarthAir]
        AetherEarthAir è stata attivata.
                ~ glyph_actualActiveSigil = AetherEarthAir
                ~ glyph_discoveredSigils -= AetherEarthAir
            {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    


    + {glyph_discoveredSigils has AetherEarthFire}[AetherEarthFire]
        AetherEarthFire è stata attivata.
            ~ glyph_actualActiveSigil = AetherEarthFire
            ~ glyph_discoveredSigils -= AetherEarthFire
        {debug_nest: ho attivato una parola, che è {glyph_actualActiveSigil}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {glyph_discoveredSigils}.}    
    -
    
    //Disabilito il box di dialogo ad hoc per il Nest
        ~ disableNestDialogue()
    

->->
