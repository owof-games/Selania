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
    - FireAirWater:
        {shuffle stopping:
            -:
			    ~ grimoire_textFireAirWaterOne = glyph_textFireAirWaterOne
            -:
			    ~ grimoire_textFireAirWaterTwo = glyph_textFireAirWaterTwo
            -:
			    ~ grimoire_textFireAirWaterThree = glyph_textFireAirWaterThree
        }
    - FireAirEarth:
        {shuffle stopping:
            -:
			    ~ grimoire_textFireAirEarthOne = glyph_textFireAirEarthOne
            -:
			    ~ grimoire_textFireAirEarthTwo = glyph_textFireAirEarthTwo
            -:
			    ~ grimoire_textFireAirEarthThree = glyph_textFireAirEarthThree
        }
    - FireAirAether:
        {shuffle stopping:
            -:
			    ~ grimoire_textFireAirAetherOne = glyph_textFireAirAetherOne
            -:
			    ~ grimoire_textFireAirAetherTwo = glyph_textFireAirAetherTwo
            -:
			    ~ grimoire_textFireAirAetherThree = glyph_textFireAirAetherThree
        }
    - FireWaterEarth:
        {shuffle stopping:
            -:
			    ~ grimoire_textFireWaterEarthOne = glyph_textFireWaterEarthOne
            -:
			    ~ grimoire_textFireWaterEarthTwo = glyph_textFireWaterEarthTwo
            -:
			    ~ grimoire_textFireWaterEarthThree = glyph_textFireWaterEarthThree
        }
        
    - FireWaterAether:
        {shuffle stopping:
            -:
			    ~ grimoire_textFireWaterAetherOne = glyph_textFireWaterAetherOne
            -:
			    ~ grimoire_textFireWaterAetherTwo = glyph_textFireWaterAetherTwo
            -:
			    ~ grimoire_textFireWaterAetherThree = glyph_textFireWaterAetherThree
        }
    - FireWaterAir:
        {shuffle stopping:
            -:
			    ~ grimoire_textFireWaterAirOne = glyph_textFireWaterAirOne
            -:
			    ~ grimoire_textFireWaterAirTwo = glyph_textFireWaterAirTwo
            -:
			    ~ grimoire_textFireWaterAirThree = glyph_textFireWaterAirThree
        }
    - FireEarthWater:
        {shuffle stopping:
            -:
			    ~ grimoire_textFireEarthWaterOne = glyph_textFireEarthWaterOne
            -:
			    ~ grimoire_textFireEarthWaterTwo = glyph_textFireEarthWaterTwo
            -:
			    ~ grimoire_textFireEarthWaterThree = glyph_textFireEarthWaterThree
        }
    - FireEarthAether:
        {shuffle stopping:
            -:
			    ~ grimoire_textFireEarthAetherOne = glyph_textFireEarthAetherOne
            -:
			    ~ grimoire_textFireEarthAetherTwo = glyph_textFireEarthAetherTwo
            -:
			    ~ grimoire_textFireEarthAetherThree = glyph_textFireEarthAetherThree
        }
    - FireEarthAir:
        {shuffle stopping:
            -:
			    ~ grimoire_textFireEarthAirOne = glyph_textFireEarthAirOne
            -:
			    ~ grimoire_textFireEarthAirTwo = glyph_textFireEarthAirTwo
            -:
			    ~ grimoire_textFireEarthAirThree = glyph_textFireEarthAirThree
        }
    - FireAetherWater:
        {shuffle stopping:
            -:
			    ~ grimoire_textFireAetherWaterOne = glyph_textFireAetherWaterOne
            -:
			    ~ grimoire_textFireAetherWaterTwo = glyph_textFireAetherWaterTwo
            -:
			    ~ grimoire_textFireAetherWaterThree = glyph_textFireAetherWaterThree
        }
    - FireAetherEarth:
        {shuffle stopping:
            -:
			    ~ grimoire_textFireAetherEarthOne = glyph_textFireAetherEarthOne
            -:
			    ~ grimoire_textFireAetherEarthTwo = glyph_textFireAetherEarthTwo
            -:
			    ~ grimoire_textFireAetherEarthThree = glyph_textFireAetherEarthThree
        }
    - FireAetherAir:
        {shuffle stopping:
            -:
			    ~ grimoire_textFireAetherAirOne = glyph_textFireAetherAirOne
            -:
			    ~ grimoire_textFireAetherAirTwo = glyph_textFireAetherAirTwo
            -:
			    ~ grimoire_textFireAetherAirThree = glyph_textFireAetherAirThree
        }
            
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





