=== glyph_modifier(partner, number)
//funzione utile per modificare botte di GlyphCi
{debug: passo per glyph_modifier. Il valore di partner è {partner}, quello di number è {number}.}

    {
        - partner == FirstCharacter:
            ~ firstChar_aether = firstChar_aether * number
            ~ firstChar_earth = firstChar_earth * number
            ~ firstChar_air = firstChar_air * number
            ~ firstChar_water = firstChar_water * number
            ~ firstChar_fire= firstChar_fire* number
            
    
        - partner == SecondCharacter:
            ~ secondChar_aether = secondChar_aether * number
            ~ secondChar_earth = secondChar_earth * number
            ~ secondChar_air = secondChar_air * number
            ~ secondChar_water = secondChar_water * number
            ~ secondChar_fire = secondChar_fire * number

        - partner == ThirdCharacter:
            ~ thirdChar_aether = thirdChar_aether * number
            ~ thirdChar_earth = thirdChar_earth * number
            ~ thirdChar_air = thirdChar_air * number
            ~ thirdChar_water = thirdChar_water * number
            ~ thirdChar_fire = thirdChar_fire * number    

    }
->->
  
=== function glyph_grimoireUpdater()
{glyph_actualActiveSigil:
    -  FireAirWater:
    - FireAirEarth:
    - FireAirAether:
    - FireWaterEarth:
    - FireWaterAether:
    - FireWaterAir:
    - FireEarthWater:
    - FireEarthAether:
    - FireEarthAir:
    - FireAetherWater:
    - FireAetherEarth:
    - FireAetherAir:
            
    - AirFireEarth:
    - AirFireAether:
    - AirFireWater:
    - AirWaterEarth:
    - AirWaterAether:
    - AirWaterFire:
    - AirEarthAether:
    - AirEarthWater:
    - AirEarthFire:
    - AirAetherEarth:
    - AirAetherWater:
    - AirAetherFire:
            
    - WaterFireEarth:
    - WaterFireAether:
    - WaterFireAir:
    - WaterAirEarth:
    - WaterAirAether:
    - WaterAirFire:
    - WaterEarthAether:
    - WaterEarthAir:
    - WaterEarthFire:
    - WaterAetherEarth:
    - WaterAetherAir:
    - WaterAetherFire:
            
    - EarthFireAether:
    - EarthFireWater:
    - EarthFireAir:
    - EarthAirAether:
    - EarthAirWater:
    - EarthAirFire:
    - EarthWaterAether:
    - EarthWaterAir:
    - EarthWaterFire:
    - EarthAetherWater:
    - EarthAetherAir:
    - EarthAetherFire:
            
    - AetherFireEarth:
    - AetherFireWater:
    - AetherFireAir:
    - AetherAirEarth:
    - AetherAirWater:
    - AetherAirFire:
    - AetherWaterEarth:
    - AetherWaterAir:
    - AetherWaterFire:
    - AetherEarthWater:
    - AetherEarthAir:
    - AetherEarthFire:       
        
}





