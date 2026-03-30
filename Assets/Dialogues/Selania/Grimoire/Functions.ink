=== function grimoire_statusPlants(plant)

    {
        - greenhouse_findedCultivables ^ backpack_findedGifts hasnt plant:
            ~ return missing
        
        - else:
            ~ return owned
    }


=== function grimoire_statusSigils(sigilList)

    {
        - glyph_aetherFireSigils ^ glyph_actualActiveSigil has sigilList:
            ~ return true
        
        - else:
            ~ return false
    }


=== function grimoire_sigilsDescription(sigilName)
{sigilName:
    - WaterEarth:
        ~ return "{grimoire_textWaterEarthOne} {grimoire_textWaterEarthTwo}"
    - WaterAir:
        ~ return "{grimoire_textWaterAirOne} {grimoire_textWaterAirTwo}"
    - WaterFire:
        ~ return "{grimoire_textWaterFireOne} {grimoire_textWaterFireTwo}"
    - WaterAether:
        ~ return "{grimoire_textWaterAetherOne} {grimoire_textWaterAetherTwo}"
    
    - AirWater:
        ~ return "{grimoire_textAirWaterOne} {grimoire_textAirWaterTwo}"
    - AirEarth:
        ~ return "{grimoire_textAirEarthOne} {grimoire_textAirEarthTwo}"
    - AirFire:
        ~ return "{grimoire_textAirFireOne} {grimoire_textAirFireTwo}"
    - AirAether:
        ~ return "{grimoire_textAirAetherOne} {grimoire_textAirAetherTwo}"

    - AetherWater:
        ~ return "{grimoire_textAetherWaterOne} {grimoire_textAetherWaterTwo}"
    - AetherEarth:
        ~ return "{grimoire_textAetherEarthOne} {grimoire_textAetherEarthTwo}"
    - AetherFire:
        ~ return "{grimoire_textAetherFireOne} {grimoire_textAetherFireTwo}"
    - AetherAir:
        ~ return "{grimoire_textAetherAirOne} {grimoire_textAetherAirTwo}"

    - EarthWater:
        ~ return "{grimoire_textEarthWaterOne} {grimoire_textEarthWaterTwo}"
    - EarthAir:
        ~ return "{grimoire_textEarthAirOne} {grimoire_textEarthAirTwo}"
    - EarthFire:
        ~ return "{grimoire_textEarthFireOne} {grimoire_textEarthFireTwo}"
    - EarthAether:
        ~ return "{grimoire_textEarthAetherOne} {grimoire_textEarthAetherTwo}"

    - FireWater:
        ~ return "{grimoire_textFireWaterOne} {grimoire_textFireWaterTwo}"
    - FireEarth:
        ~ return "{grimoire_textFireEarthOne} {grimoire_textFireEarthTwo}"
    - FireAir:
        ~ return "{grimoire_textFireAirOne} {grimoire_textFireAirTwo}"
    - FireAether:
        ~ return "{grimoire_textFireAetherOne} {grimoire_textFireAetherTwo}"


}