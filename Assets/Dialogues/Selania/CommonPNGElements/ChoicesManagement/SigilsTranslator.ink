=== function sigils_translator(wordValue)
//Da fare quando son sicura del tutto
{debug_nest: sigils_translator.}
    
    {wordValue:       
            
            - FireAirWater: 
                ~ return "Trottola"
            
            - FireAirEarth: 
                ~ return "Dado"
                
            - FireAirAether: 
                ~ return "Corda"
   
            - FireWaterEarth: 
                ~ return "Catena"
 
            - FireWaterAether: 
                ~ return "Moschettone"
                
            - FireWaterAir: 
                ~ return "Soglia"

            - FireEarthWater: 
                ~ return "Chiodo"
 
            - FireEarthAether: 
                ~ return "Uncinetto"
   
            - FireEarthAir: 
                ~ return "Scalpello"
    
            - FireAetherAir:
                ~ return "Griglia"
                
            - FireAetherEarth:
                ~ return "Traguardo"
                
            - FireAetherWater:
                ~ return "Bussola"
      
        
        
        
            - AirFireEarth:
                ~ return "Mestolo"
  
            - AirFireAether:
                ~ return "Setaccio"
                
            - AirFireWater:
                ~ return "Tagliere"
                
            - AirWaterEarth:
                ~ return "Macchia"

            - AirWaterAether:
                ~ return "Linea"
   
            - AirWaterFire:
                ~ return "Punto"
  
            - AirEarthAether:
                ~ return "Registro"
  
            - AirEarthWater:
                ~ return "Diario"
      
            - AirEarthFire:
                ~ return "Agenda"
            
            - AirAetherEarth:
                ~ return "Vassoio"
            
            - AirAetherWater:
                ~ return "Caraffa"

            - AirAetherFire:
                ~ return "Macina"
                
                

            
            - WaterFireEarth:
                ~ return "Alluvione"
 
            - WaterFireAether:
                ~ return "Diga"
                
            - WaterFireAir:
                ~ return "Zattera"
 
            - WaterAirEarth:
                ~ return "Neve"

            - WaterAirAether:
                ~ return "Nebbia"
                
            - WaterAirFire:
                ~ return "Grandine"
 
            - WaterEarthAether:
                ~ return "Pinna"
  
            - WaterEarthAir:
                ~ return "Vela"
 
            - WaterEarthFire:
                ~ return "Pontile"
 
            - WaterAetherEarth:
                ~ return "Pozzo"
  
            - WaterAetherAir:
                ~ return "Catino"

            - WaterAetherFire:
                ~ return "Barile"
  
                
            
            - EarthFireAether:
                ~ return "Seme"
                
            - EarthFireWater:
                ~ return "Polpa"

            - EarthFireAir:
                ~ return "Buccia"
  
            - EarthAirAether:
                ~ return "Polline"
  
            - EarthAirWater:
                ~ return "Gemma"
            
            - EarthAirFire:
                ~ return "Ghianda"
 
            - EarthWaterAether:
                ~ return "Floema"
 
            - EarthWaterAir:
                ~ return "Corteccia"
  
            - EarthWaterFire:
                ~ return "Resina"
   
            - EarthAetherWater:
                ~ return "Zolla"
                
            - EarthAetherAir:
                ~ return "Apice"
                
            - EarthAetherFire:
                ~ return "Fittone"
                
                
            
            - AetherFireEarth:
                ~ return "Lama"

            - AetherFireWater:
                ~ return "Punta"
                
            - AetherFireAir:
                ~ return "Dorso"
 
            - AetherAirEarth:
                ~ return "Spago"
    
            - AetherAirWater:
                ~ return "Fumo"
   
            - AetherAirFire:
                ~ return "Cenere"
  
            - AetherWaterEarth:
                ~ return "Fondo"
  
            - AetherWaterAir:
                ~ return "Crepa"
  
            - AetherWaterFire:
                ~ return "Ruggine"
  
            - AetherEarthWater:
                ~ return "Arazzo"
   
            - AetherEarthAir:
                ~ return "Altare"

            - AetherEarthFire:
                ~ return "Campanella"
   
    //Venti sigilli principali
            - WaterEarth:
                ~ return "Lago"
            - WaterAir:
                ~ return "Nube"
            - WaterFire:
                ~ return "Fiume"
            - WaterAether:
                ~ return "Fonte"
            
            - AirWater:
                ~ return "Cavalletto"
            - AirEarth:
                ~ return "Leggio"
            - AirFire:
                ~ return "Stufa"
            - AirAether:
                ~ return "Tavolo"

            - AetherWater:
                ~ return "Calice"
            - AetherEarth:
                ~ return "Tempio"
            - AetherFire:
                ~ return "Pugnale"
            - AetherAir:
                ~ return "Incenso"

            - EarthWater:
                ~ return "Linfa"
            - EarthAir:
                ~ return "Frasca"
            - EarthFire:
                ~ return "Frutto"
            - EarthAether:
                ~ return "Radice"

            - FireWater:
                ~ return "Chiave"
            - FireEarth:
                ~ return "Calibro"
            - FireAir:
                ~ return "Palla"
            - FireAether:
                ~ return "Mappa"
                                                            
            -else: Traduzione colore parola {glyph_actualActiveSigil} non trovato!
    }
