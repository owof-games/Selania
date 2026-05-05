=== function glyph_modifier(partner, number)
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

        - partner == FourthCharacter:
            ~ fourthChar_aether = fourthChar_aether * number
            ~ fourthChar_earth = fourthChar_earth * number
            ~ fourthChar_air = fourthChar_air * number
            ~ fourthChar_water = fourthChar_water * number
            ~ fourthChar_fire = fourthChar_fire * number  

        - partner == FifthCharacter:
            ~ fifthChar_aether = fifthChar_aether * number
            ~ fifthChar_earth = fifthChar_earth * number
            ~ fifthChar_air = fifthChar_air * number
            ~ fifthChar_water = fifthChar_water * number
            ~ fifthChar_fire = fifthChar_fire * number      
    }

  
=== function glyph_grimoireTripleSigilsUpdater()
{glyph_actualActiveSigil:
    - FireAirWater:
        {shuffle stopping:
            -
			    ~ grimoire_textFireAirWaterOne = glyph_textFireAirWaterOne
            -
			    ~ grimoire_textFireAirWaterTwo = glyph_textFireAirWaterTwo
            -
			    ~ grimoire_textFireAirWaterThree = glyph_textFireAirWaterThree
        }
    - FireAirEarth:
        {shuffle stopping:
            -
			    ~ grimoire_textFireAirEarthOne = glyph_textFireAirEarthOne
            -
			    ~ grimoire_textFireAirEarthTwo = glyph_textFireAirEarthTwo
            -
			    ~ grimoire_textFireAirEarthThree = glyph_textFireAirEarthThree
        }
    - FireAirAether:
        {shuffle stopping:
            -
			    ~ grimoire_textFireAirAetherOne = glyph_textFireAirAetherOne
            -
			    ~ grimoire_textFireAirAetherTwo = glyph_textFireAirAetherTwo
            -
			    ~ grimoire_textFireAirAetherThree = glyph_textFireAirAetherThree
        }
    - FireWaterEarth:
        {shuffle stopping:
            -
			    ~ grimoire_textFireWaterEarthOne = glyph_textFireWaterEarthOne
            -
			    ~ grimoire_textFireWaterEarthTwo = glyph_textFireWaterEarthTwo
            -
			    ~ grimoire_textFireWaterEarthThree = glyph_textFireWaterEarthThree
        }
        
    - FireWaterAether:
        {shuffle stopping:
            -
			    ~ grimoire_textFireWaterAetherOne = glyph_textFireWaterAetherOne
            -
			    ~ grimoire_textFireWaterAetherTwo = glyph_textFireWaterAetherTwo
            -
			    ~ grimoire_textFireWaterAetherThree = glyph_textFireWaterAetherThree
        }
    - FireWaterAir:
        {shuffle stopping:
            -
			    ~ grimoire_textFireWaterAirOne = glyph_textFireWaterAirOne
            -
			    ~ grimoire_textFireWaterAirTwo = glyph_textFireWaterAirTwo
            -
			    ~ grimoire_textFireWaterAirThree = glyph_textFireWaterAirThree
        }
    - FireEarthWater:
        {shuffle stopping:
            -
			    ~ grimoire_textFireEarthWaterOne = glyph_textFireEarthWaterOne
            -
			    ~ grimoire_textFireEarthWaterTwo = glyph_textFireEarthWaterTwo
            -
			    ~ grimoire_textFireEarthWaterThree = glyph_textFireEarthWaterThree
        }
    - FireEarthAether:
        {shuffle stopping:
            -
			    ~ grimoire_textFireEarthAetherOne = glyph_textFireEarthAetherOne
            -
			    ~ grimoire_textFireEarthAetherTwo = glyph_textFireEarthAetherTwo
            -
			    ~ grimoire_textFireEarthAetherThree = glyph_textFireEarthAetherThree
        }
    - FireEarthAir:
        {shuffle stopping:
            -
			    ~ grimoire_textFireEarthAirOne = glyph_textFireEarthAirOne
            -
			    ~ grimoire_textFireEarthAirTwo = glyph_textFireEarthAirTwo
            -
			    ~ grimoire_textFireEarthAirThree = glyph_textFireEarthAirThree
        }
    - FireAetherWater:
        {shuffle stopping:
            -
			    ~ grimoire_textFireAetherWaterOne = glyph_textFireAetherWaterOne
            -
			    ~ grimoire_textFireAetherWaterTwo = glyph_textFireAetherWaterTwo
            -
			    ~ grimoire_textFireAetherWaterThree = glyph_textFireAetherWaterThree
        }
    - FireAetherEarth:
        {shuffle stopping:
            -
			    ~ grimoire_textFireAetherEarthOne = glyph_textFireAetherEarthOne
            -
			    ~ grimoire_textFireAetherEarthTwo = glyph_textFireAetherEarthTwo
            -
			    ~ grimoire_textFireAetherEarthThree = glyph_textFireAetherEarthThree
        }
    - FireAetherAir:
        {shuffle stopping:
            -
			    ~ grimoire_textFireAetherAirOne = glyph_textFireAetherAirOne
            -
			    ~ grimoire_textFireAetherAirTwo = glyph_textFireAetherAirTwo
            -
			    ~ grimoire_textFireAetherAirThree = glyph_textFireAetherAirThree
        }



    - AirFireEarth:
        {shuffle stopping:
            -
                ~ grimoire_textAirFireEarthOne = glyph_textAirFireEarthOne
            -
                ~ grimoire_textAirFireEarthTwo = glyph_textAirFireEarthTwo
            -
                ~ grimoire_textAirFireEarthThree = glyph_textAirFireEarthThree
        }
    - AirFireAether:
        {shuffle stopping:
            -
			    ~ grimoire_textAirFireAetherOne = glyph_textAirFireAetherOne
            -
			    ~ grimoire_textAirFireAetherTwo = glyph_textAirFireAetherTwo
            -
			    ~ grimoire_textAirFireAetherThree = glyph_textAirFireAetherThree
        }
    - AirFireWater:
        {shuffle stopping:
            -
                ~ grimoire_textAirFireWaterOne = glyph_textAirFireWaterOne
            -
                ~ grimoire_textAirFireWaterTwo = glyph_textAirFireWaterTwo
            -
                ~ grimoire_textAirFireWaterThree = glyph_textAirFireWaterThree
        }
    - AirWaterEarth:
        {shuffle stopping:
            -
                ~ grimoire_textAirWaterEarthOne = glyph_textAirWaterEarthOne
            -
                ~ grimoire_textAirWaterEarthTwo = glyph_textAirWaterEarthTwo
            -
                ~ grimoire_textAirWaterEarthThree = glyph_textAirWaterEarthThree
        }
    - AirWaterAether:
        {shuffle stopping:
            -
                ~ grimoire_textAirWaterAetherOne = glyph_textAirWaterAetherOne
            -
                ~ grimoire_textAirWaterAetherTwo = glyph_textAirWaterAetherTwo
            -
                ~ grimoire_textAirWaterAetherThree = glyph_textAirWaterAetherThree
        }
    - AirWaterFire:
        {shuffle stopping:
            -
                ~ grimoire_textAirWaterFireOne = glyph_textAirWaterFireOne
            -
                ~ grimoire_textAirWaterFireTwo = glyph_textAirWaterFireTwo
            -
                ~ grimoire_textAirWaterFireThree = glyph_textAirWaterFireThree
        }
    - AirEarthAether:
        {shuffle stopping:
            -
                ~ grimoire_textAirEarthAetherOne = glyph_textAirEarthAetherOne
            -
                ~ grimoire_textAirEarthAetherTwo = glyph_textAirEarthAetherTwo
            -
                ~ grimoire_textAirEarthAetherThree = glyph_textAirEarthAetherThree
        }
    - AirEarthWater:
        {shuffle stopping:
            -
                ~ grimoire_textAirEarthWaterOne = glyph_textAirEarthWaterOne
            -
                ~ grimoire_textAirEarthWaterTwo = glyph_textAirEarthWaterTwo
            -
                ~ grimoire_textAirEarthWaterThree = glyph_textAirEarthWaterThree
        }
    - AirEarthFire:
        {shuffle stopping:
            -
                ~ grimoire_textAirEarthFireOne = glyph_textAirEarthFireOne
            -
                ~ grimoire_textAirEarthFireTwo = glyph_textAirEarthFireTwo
            -
                ~ grimoire_textAirEarthFireThree = glyph_textAirEarthFireThree
        }
    - AirAetherEarth:
        {shuffle stopping:
            -
                ~ grimoire_textAirAetherEarthOne = glyph_textAirAetherEarthOne
            -
                ~ grimoire_textAirAetherEarthTwo = glyph_textAirAetherEarthTwo
            -
                ~ grimoire_textAirAetherEarthThree = glyph_textAirAetherEarthThree
        }
    - AirAetherWater:
        {shuffle stopping:
            -
                ~ grimoire_textAirAetherWaterOne = glyph_textAirAetherWaterOne
            -
                ~ grimoire_textAirAetherWaterTwo = glyph_textAirAetherWaterTwo
            -
                ~ grimoire_textAirAetherWaterThree = glyph_textAirAetherWaterThree
        }
    - AirAetherFire:
        {shuffle stopping:
            -
                ~ grimoire_textAirAetherFireOne = glyph_textAirAetherFireOne
            -
                ~ grimoire_textAirAetherFireTwo = glyph_textAirAetherFireTwo
            -
                ~ grimoire_textAirAetherFireThree = glyph_textAirAetherFireThree
        }
            



    - WaterFireEarth:
        {shuffle stopping:
            -
			    ~ grimoire_textWaterFireEarthOne = glyph_textWaterFireEarthOne
            -
			    ~ grimoire_textWaterFireEarthTwo = glyph_textWaterFireEarthTwo
            -
			    ~ grimoire_textWaterFireEarthThree = glyph_textWaterFireEarthThree
        }
    - WaterFireAether:
        {shuffle stopping:
            -
			    ~ grimoire_textWaterFireAetherOne = glyph_textWaterFireAetherOne
            -
			    ~ grimoire_textWaterFireAetherTwo = glyph_textWaterFireAetherTwo
            -
			    ~ grimoire_textWaterFireAetherThree = glyph_textWaterFireAetherThree
        }
    - WaterFireAir:
        {shuffle stopping:
            -
			    ~ grimoire_textWaterFireAirOne = glyph_textWaterFireAirOne
            -
			    ~ grimoire_textWaterFireAirTwo = glyph_textWaterFireAirTwo
            -
			    ~ grimoire_textWaterFireAirThree = glyph_textWaterFireAirThree
        }
    - WaterAirEarth:
        {shuffle stopping:
            -
			    ~ grimoire_textWaterAirEarthOne = glyph_textWaterAirEarthOne
            -
			    ~ grimoire_textWaterAirEarthTwo = glyph_textWaterAirEarthTwo
            -
			    ~ grimoire_textWaterAirEarthThree = glyph_textWaterAirEarthThree
        }
    - WaterAirAether:
        {shuffle stopping:
            -
			    ~ grimoire_textWaterAirAetherOne = glyph_textWaterAirAetherOne
            -
			    ~ grimoire_textWaterAirAetherTwo = glyph_textWaterAirAetherTwo
            -
			    ~ grimoire_textWaterAirAetherThree = glyph_textWaterAirAetherThree
        }
    - WaterAirFire:
        {shuffle stopping:
            -
			    ~ grimoire_textWaterAirFireOne = glyph_textWaterAirFireOne
            -
			    ~ grimoire_textWaterAirFireTwo = glyph_textWaterAirFireTwo
            -
			    ~ grimoire_textWaterAirFireThree = glyph_textWaterAirFireThree
        }
    - WaterEarthAether:
        {shuffle stopping:
            -
			    ~ grimoire_textWaterEarthAetherOne = glyph_textWaterEarthAetherOne
            -
			    ~ grimoire_textWaterEarthAetherTwo = glyph_textWaterEarthAetherTwo
            -
			    ~ grimoire_textWaterEarthAetherThree = glyph_textWaterEarthAetherThree
        }
    - WaterEarthAir:
        {shuffle stopping:
            -
			    ~ grimoire_textWaterEarthAirOne = glyph_textWaterEarthAirOne
            -
			    ~ grimoire_textWaterEarthAirTwo = glyph_textWaterEarthAirTwo
            -
			    ~ grimoire_textWaterEarthAirThree = glyph_textWaterEarthAirThree
        }
    - WaterEarthFire:
        {shuffle stopping:
            -
			    ~ grimoire_textWaterEarthFireOne = glyph_textWaterEarthFireOne
            -
			    ~ grimoire_textWaterEarthFireTwo = glyph_textWaterEarthFireTwo
            -
			    ~ grimoire_textWaterEarthFireThree = glyph_textWaterEarthFireThree
        }
    - WaterAetherEarth:
        {shuffle stopping:
            -
			    ~ grimoire_textWaterAetherEarthOne = glyph_textWaterAetherEarthOne
            -
			    ~ grimoire_textWaterAetherEarthTwo = glyph_textWaterAetherEarthTwo
            -
			    ~ grimoire_textWaterAetherEarthThree = glyph_textWaterAetherEarthThree
        }
    - WaterAetherAir:
        {shuffle stopping:
            -
			    ~ grimoire_textWaterAetherAirOne = glyph_textWaterAetherAirOne
            -
			    ~ grimoire_textWaterAetherAirTwo = glyph_textWaterAetherAirTwo
            -
			    ~ grimoire_textWaterAetherAirThree = glyph_textWaterAetherAirThree
        }
    - WaterAetherFire:
        {shuffle stopping:
            -
			    ~ grimoire_textWaterAetherFireOne = glyph_textWaterAetherFireOne
            -
			    ~ grimoire_textWaterAetherFireTwo = glyph_textWaterAetherFireTwo
            -
			    ~ grimoire_textWaterAetherFireThree = glyph_textWaterAetherFireThree
        }
            






    - EarthFireAether:
        {shuffle stopping:
            -
			    ~ grimoire_textEarthFireAetherOne = glyph_textEarthFireAetherOne
            -
			    ~ grimoire_textEarthFireAetherTwo = glyph_textEarthFireAetherTwo
            -
			    ~ grimoire_textEarthFireAetherThree = glyph_textEarthFireAetherThree
        }
    - EarthFireWater:
        {shuffle stopping:
            -
			    ~ grimoire_textEarthFireWaterOne = glyph_textEarthFireWaterOne
            -
			    ~ grimoire_textEarthFireWaterTwo = glyph_textEarthFireWaterTwo
            -
			    ~ grimoire_textEarthFireWaterThree = glyph_textEarthFireWaterThree
        }
    - EarthFireAir:
        {shuffle stopping:
            -
			    ~ grimoire_textEarthFireAirOne = glyph_textEarthFireAirOne
            -
			    ~ grimoire_textEarthFireAirTwo = glyph_textEarthFireAirTwo
            -
			    ~ grimoire_textEarthFireAirThree = glyph_textEarthFireAirThree
        }
    - EarthAirAether:
        {shuffle stopping:
            -
			    ~ grimoire_textEarthAirAetherOne = glyph_textEarthAirAetherOne
            -
			    ~ grimoire_textEarthAirAetherTwo = glyph_textEarthAirAetherTwo
            -
			    ~ grimoire_textEarthAirAetherThree = glyph_textEarthAirAetherThree
        }
    - EarthAirWater:
        {shuffle stopping:
            -
			    ~ grimoire_textEarthAirWaterOne = glyph_textEarthAirWaterOne
            -
			    ~ grimoire_textEarthAirWaterTwo = glyph_textEarthAirWaterTwo
            -
			    ~ grimoire_textEarthAirWaterThree = glyph_textEarthAirWaterThree
        }
    - EarthAirFire:
        {shuffle stopping:
            -
			    ~ grimoire_textEarthAirFireOne = glyph_textEarthAirFireOne
            -
			    ~ grimoire_textEarthAirFireTwo = glyph_textEarthAirFireTwo
            -
			    ~ grimoire_textEarthAirFireThree = glyph_textEarthAirFireThree
        }
    - EarthWaterAether:
        {shuffle stopping:
            -
			    ~ grimoire_textEarthWaterAetherOne = glyph_textEarthWaterAetherOne
            -
			    ~ grimoire_textEarthWaterAetherTwo = glyph_textEarthWaterAetherTwo
            -
			    ~ grimoire_textEarthWaterAetherThree = glyph_textEarthWaterAetherThree
        }
    - EarthWaterAir:
        {shuffle stopping:
            -
			    ~ grimoire_textEarthWaterAirOne = glyph_textEarthWaterAirOne
            -
			    ~ grimoire_textEarthWaterAirTwo = glyph_textEarthWaterAirTwo
            -
			    ~ grimoire_textEarthWaterAirThree = glyph_textEarthWaterAirThree
        }
    - EarthWaterFire:
        {shuffle stopping:
            -
			    ~ grimoire_textEarthWaterFireOne = glyph_textEarthWaterFireOne
            -
			    ~ grimoire_textEarthWaterFireTwo = glyph_textEarthWaterFireTwo
            -
			    ~ grimoire_textEarthWaterFireThree = glyph_textEarthWaterFireThree
        }
    - EarthAetherWater:
        {shuffle stopping:
            -
			    ~ grimoire_textEarthAetherWaterOne = glyph_textEarthAetherWaterOne
            -
			    ~ grimoire_textEarthAetherWaterTwo = glyph_textEarthAetherWaterTwo
            -
			    ~ grimoire_textEarthAetherWaterThree = glyph_textEarthAetherWaterThree
        }
    - EarthAetherAir:
        {shuffle stopping:
            -
			    ~ grimoire_textEarthAetherAirOne = glyph_textEarthAetherAirOne
            -
			    ~ grimoire_textEarthAetherAirTwo = glyph_textEarthAetherAirTwo
            -
			    ~ grimoire_textEarthAetherAirThree = glyph_textEarthAetherAirThree
        }
    - EarthAetherFire:
        {shuffle stopping:
            -
			    ~ grimoire_textEarthAetherFireOne = glyph_textEarthAetherFireOne
            -
			    ~ grimoire_textEarthAetherFireTwo = glyph_textEarthAetherFireTwo
            -
			    ~ grimoire_textEarthAetherFireThree = glyph_textEarthAetherFireThree
        }
            







    - AetherFireEarth:
        {shuffle stopping:
            -
			    ~ grimoire_textAetherFireEarthOne = glyph_textAetherFireEarthOne
            -
			    ~ grimoire_textAetherFireEarthTwo = glyph_textAetherFireEarthTwo
            -
			    ~ grimoire_textAetherFireEarthThree = glyph_textAetherFireEarthThree
        }
    - AetherFireWater:
        {shuffle stopping:
            -
			    ~ grimoire_textAetherFireWaterOne = glyph_textAetherFireWaterOne
            -
			    ~ grimoire_textAetherFireWaterTwo = glyph_textAetherFireWaterTwo
            -
			    ~ grimoire_textAetherFireWaterThree = glyph_textAetherFireWaterThree
        }
    - AetherFireAir:
        {shuffle stopping:
            -
			    ~ grimoire_textAetherFireAirOne = glyph_textAetherFireAirOne
            -
			    ~ grimoire_textAetherFireAirTwo = glyph_textAetherFireAirTwo
            -
			    ~ grimoire_textAetherFireAirThree = glyph_textAetherFireAirThree
        }
    - AetherAirEarth:
        {shuffle stopping:
            -
			    ~ grimoire_textAetherAirEarthOne = glyph_textAetherAirEarthOne
            -
			    ~ grimoire_textAetherAirEarthTwo = glyph_textAetherAirEarthTwo
            -
			    ~ grimoire_textAetherAirEarthThree = glyph_textAetherAirEarthThree
        }
    - AetherAirWater:
        {shuffle stopping:
            -
			    ~ grimoire_textAetherAirWaterOne = glyph_textAetherAirWaterOne
            -
			    ~ grimoire_textAetherAirWaterTwo = glyph_textAetherAirWaterTwo
            -
			    ~ grimoire_textAetherAirWaterThree = glyph_textAetherAirWaterThree
        }
    - AetherAirFire:
        {shuffle stopping:
            -
			    ~ grimoire_textAetherAirFireOne = glyph_textAetherAirFireOne
            -
			    ~ grimoire_textAetherAirFireTwo = glyph_textAetherAirFireTwo
            -
			    ~ grimoire_textAetherAirFireThree = glyph_textAetherAirFireThree
        }
    - AetherWaterEarth:
        {shuffle stopping:
            -
			    ~ grimoire_textAetherWaterEarthOne = glyph_textAetherWaterEarthOne
            -
			    ~ grimoire_textAetherWaterEarthTwo = glyph_textAetherWaterEarthTwo
            -
			    ~ grimoire_textAetherWaterEarthThree = glyph_textAetherWaterEarthThree
        }
    - AetherWaterAir:
        {shuffle stopping:
            -
			    ~ grimoire_textAetherWaterAirOne = glyph_textAetherWaterAirOne
            -
			    ~ grimoire_textAetherWaterAirTwo = glyph_textAetherWaterAirTwo
            -
			    ~ grimoire_textAetherWaterAirThree = glyph_textAetherWaterAirThree
        }
    - AetherWaterFire:
        {shuffle stopping:
            -
			    ~ grimoire_textAetherWaterFireOne = glyph_textAetherWaterFireOne
            -
			    ~ grimoire_textAetherWaterFireTwo = glyph_textAetherWaterFireTwo
            -
			    ~ grimoire_textAetherWaterFireThree = glyph_textAetherWaterFireThree
        }
    - AetherEarthWater:
        {shuffle stopping:
            -
			    ~ grimoire_textAetherEarthWaterOne = glyph_textAetherEarthWaterOne
            -
			    ~ grimoire_textAetherEarthWaterTwo = glyph_textAetherEarthWaterTwo
            -
			    ~ grimoire_textAetherEarthWaterThree = glyph_textAetherEarthWaterThree
        }
    - AetherEarthAir:
        {shuffle stopping:
            -
			    ~ grimoire_textAetherEarthAirOne = glyph_textAetherEarthAirOne
            -
			    ~ grimoire_textAetherEarthAirTwo = glyph_textAetherEarthAirTwo
            -
			    ~ grimoire_textAetherEarthAirThree = glyph_textAetherEarthAirThree
        }
    - AetherEarthFire:    
        {shuffle stopping:
            -
			    ~ grimoire_textAetherEarthFireOne = glyph_textAetherEarthFireOne
            -
			    ~ grimoire_textAetherEarthFireTwo = glyph_textAetherEarthFireTwo
            -
			    ~ grimoire_textAetherEarthFireThree = glyph_textAetherEarthFireThree
        }   
        
}





=== function glyph_grimoireMainSigilsUpdater()
//Faccio passare questa funzione solo al primo utilizzo, così 
{
    - glyph_fireAirSigils has glyph_actualActiveSigil:
        {shuffle stopping:
            -
			    ~ grimoire_textFireAirOne = glyph_textFireAirOne
            -
			    ~ grimoire_textFireAirTwo = glyph_textFireAirTwo
        }
    - glyph_fireWaterSigils has glyph_actualActiveSigil:
        {shuffle stopping:
            -
			    ~ grimoire_textFireWaterOne = glyph_textFireWaterOne
            -
			    ~ grimoire_textFireWaterTwo = glyph_textFireWaterTwo
        }
    - glyph_fireEarthSigils has glyph_actualActiveSigil:
        {shuffle stopping:
            -
			    ~ grimoire_textFireEarthOne = glyph_textFireEarthOne
            -
			    ~ grimoire_textFireEarthTwo = glyph_textFireEarthTwo
        }
    - glyph_fireAetherSigils  has glyph_actualActiveSigil:
        {shuffle stopping:
            -
			    ~ grimoire_textFireAetherOne = glyph_textFireAetherOne
            -
			    ~ grimoire_textFireAetherTwo = glyph_textFireAetherTwo
        }

        
    - glyph_airFireSigils has glyph_actualActiveSigil:
        {shuffle stopping:
            -
			    ~ grimoire_textAirFireOne = glyph_textAirFireOne
            -
			    ~ grimoire_textAirFireTwo = glyph_textAirFireTwo
        }
    - glyph_airWaterSigils has glyph_actualActiveSigil:
        {shuffle stopping:
            -
			    ~ grimoire_textAirWaterOne = glyph_textAirWaterOne
            -
			    ~ grimoire_textAirWaterTwo = glyph_textAirWaterTwo
        }
    - glyph_airEarthSigils has glyph_actualActiveSigil:
        {shuffle stopping:
            -
			    ~ grimoire_textAirEarthOne = glyph_textAirEarthOne
            -
			    ~ grimoire_textAirEarthTwo = glyph_textAirEarthTwo
        }
    - glyph_airAetherSigils has glyph_actualActiveSigil:
        {shuffle stopping:
            -
			    ~ grimoire_textAirAetherOne = glyph_textAirAetherOne
            -
			    ~ grimoire_textAirAetherTwo = glyph_textAirAetherTwo
        }

        
    - glyph_WaterFireSigils has glyph_actualActiveSigil:
        {shuffle stopping:
            -
			    ~ grimoire_textWaterFireOne = glyph_textWaterFireOne
            -
			    ~ grimoire_textWaterFireTwo = glyph_textWaterFireTwo
        }
    - glyph_WaterAirSigils has glyph_actualActiveSigil:
        {shuffle stopping:
            -
			    ~ grimoire_textWaterAirOne = glyph_textWaterAirOne
            -
			    ~ grimoire_textWaterAirTwo = glyph_textWaterAirTwo
        }
    - glyph_WaterEarthSigils has glyph_actualActiveSigil:
        {shuffle stopping:
            -
			    ~ grimoire_textWaterEarthOne = glyph_textWaterEarthOne
            -
			    ~ grimoire_textWaterEarthTwo = glyph_textWaterEarthTwo
        }
    - glyph_WaterAetherSigils has glyph_actualActiveSigil:
        {shuffle stopping:
            -
			    ~ grimoire_textWaterAetherOne = glyph_textWaterAetherOne
            -
			    ~ grimoire_textWaterAetherTwo = glyph_textWaterAetherTwo
        }

        
    - glyph_earthFireSigils has glyph_actualActiveSigil:
        {shuffle stopping:
            -
			    ~ grimoire_textEarthFireOne = glyph_textEarthFireOne
            -
			    ~ grimoire_textEarthFireTwo = glyph_textEarthFireTwo
        }
    - glyph_earthAirSigils has glyph_actualActiveSigil:
        {shuffle stopping:
            -
			    ~ grimoire_textEarthAirOne = glyph_textEarthAirOne
            -
			    ~ grimoire_textEarthAirTwo = glyph_textEarthAirTwo
        }
    - glyph_earthWaterSigils has glyph_actualActiveSigil:
        {shuffle stopping:
            -
			    ~ grimoire_textEarthWaterOne = glyph_textEarthWaterOne
            -
			    ~ grimoire_textEarthWaterTwo = glyph_textEarthWaterTwo
        }
    - glyph_earthAetherSigils has glyph_actualActiveSigil:
        {shuffle stopping:
            -
			    ~ grimoire_textEarthAetherOne = glyph_textEarthAetherOne
            -
			    ~ grimoire_textEarthAetherTwo = glyph_textEarthAetherTwo
        }

        
    - glyph_aetherFireSigils has glyph_actualActiveSigil:
        {shuffle stopping:
            -
			    ~ grimoire_textAetherFireOne = glyph_textAetherFireOne
            -
			    ~ grimoire_textAetherFireTwo = glyph_textAetherFireTwo
        }
    - glyph_aetherAirSigils has glyph_actualActiveSigil:
        {shuffle stopping:
            -
			    ~ grimoire_textAetherAirOne = glyph_textAetherAirOne
            -
			    ~ grimoire_textAetherAirTwo = glyph_textAetherAirTwo
        }
    - glyph_aetherWaterSigils has glyph_actualActiveSigil:
        {shuffle stopping:
            -
			    ~ grimoire_textAetherWaterOne = glyph_textAetherWaterOne
            -
			    ~ grimoire_textAetherWaterTwo = glyph_textAetherWaterTwo
        }
    - glyph_aetherEarthSigils has glyph_actualActiveSigil:
        {shuffle stopping:
            -
			    ~ grimoire_textAetherEarthOne = glyph_textAetherEarthOne
            -
			    ~ grimoire_textAetherEarthTwo = glyph_textAetherEarthTwo
        }

}


=== glyph_open_all_sigils

    - (top)
        //primo step: creo una lista che è il risultato di tutti i sigilli non ancora scoperti
        //Lista temporanea == lista di tutti i sigilli del gioco
        ~ temp allSigils = LIST_ALL(glyph_allSigils)
        //A cui tolgo poi quelli già scoperti
        ~ allSigils -= glyph_discoveredSigils

    {
        //Se la lista non è vuota
        - allSigils != ():
            //prendo un sigillo random
                ~ glyph_actualActiveSigil = LIST_RANDOM(allSigils)
            //aggiorno il suo valore sul grimorio
                ~ glyph_grimoireTripleSigilsUpdater()
                ~ glyph_grimoireTripleSigilsUpdater()
                ~ glyph_grimoireTripleSigilsUpdater()
            //aggiorno il valore del suo sigillo principale due volte
                ~ glyph_grimoireMainSigilsUpdater()
                ~ glyph_grimoireMainSigilsUpdater()
            //sposto il sigillo su quelli scoperti
                ~ glyph_discoveredSigils += glyph_actualActiveSigil
            //e svuoto il sigillo attivo
                ~ glyph_actualActiveSigil = ()
            //torno al top, in modo da ripetere il tutto    
                -> top
        - else: 
            //altrimenti esco da dove sono venuto
                ->->
    }

->->    