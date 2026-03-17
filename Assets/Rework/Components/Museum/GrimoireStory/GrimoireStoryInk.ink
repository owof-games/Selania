/*
 * MUSEUM - GRIMOIRE STORY
*/

LIST listCharacters = PG

LIST Items = Item1

VAR contentsRoom1 = (PG, Item1)

/* ---------------------------------
                
LISTE COMBINATORIE DEI SIGILLI
                
----------------------------------*/

LIST allGlyphs = Fire, Air, Water, Earth, Aether

//Lista di tutti i possibili sigilli
    LIST glyph_allSigils = 
       
        FireAirWater, FireAirEarth, FireAirAether,
        FireWaterEarth, FireWaterAether, FireWaterAir,
        FireEarthWater, FireEarthAether, FireEarthAir,
        FireAetherWater, FireAetherEarth, FireAetherAir,
        
        AirFireEarth, AirFireAether, AirFireWater,
        AirWaterEarth, AirWaterAether, AirWaterFire,
        AirEarthAether, AirEarthWater, AirEarthFire,
        AirAetherEarth, AirAetherWater, AirAetherFire,
        
        WaterFireEarth, WaterFireAether, WaterFireAir, 
        WaterAirEarth, WaterAirAether, WaterAirFire,
        WaterEarthAether, WaterEarthAir, WaterEarthFire,
        WaterAetherEarth, WaterAetherAir, WaterAetherFire,
        
        EarthFireAether, EarthFireWater, EarthFireAir, 
        EarthAirAether, EarthAirWater, EarthAirFire,
        EarthWaterAether, EarthWaterAir, EarthWaterFire,
        EarthAetherWater, EarthAetherAir, EarthAetherFire,
        
        AetherFireEarth, AetherFireWater, AetherFireAir,
        AetherAirEarth, AetherAirWater, AetherAirFire,
        AetherWaterEarth, AetherWaterAir, AetherWaterFire,
        AetherEarthWater, AetherEarthAir, AetherEarthFire
        
//Raggruppamento dei sigilli per dominante (es: per gestione pagine libro)

    //Varianti a dominante Fire
    VAR glyph_fireAirSigils = (FireAirWater, FireAirEarth, FireAirAether)
    VAR glyph_fireWaterSigils = (FireWaterEarth, FireWaterAether, FireWaterAir)
    VAR glyph_fireEarthSigils = (FireEarthWater, FireEarthAether, FireEarthAir)
    VAR glyph_fireAetherSigils = (FireAetherWater, FireAetherEarth, FireAetherAir)
    
    //Varianti a dominante Air
    VAR glyph_airFireSigils = (AirFireEarth, AirFireAether, AirFireWater)
    VAR glyph_airWaterSigils = (AirWaterEarth, AirWaterAether, AirWaterFire)
    VAR glyph_airEarthSigils = (AirEarthAether, AirEarthWater, AirEarthFire)
    VAR glyph_airAetherSigils = (AirAetherEarth, AirAetherWater, AirAetherFire)
    
    //Varianti a dominate Water
    VAR glyph_WaterFireSigils = (WaterFireEarth, WaterFireAether, WaterFireAir)
    VAR glyph_WaterAirSigils = (WaterAirEarth, WaterAirAether, WaterAirFire)
    VAR glyph_WaterEarthSigils = (WaterEarthAether, WaterEarthAir, WaterEarthFire)
    VAR glyph_WaterAetherSigils = (WaterAetherEarth, WaterAetherAir, WaterAetherFire)
    
    //Varianti a dominante Earth
    VAR glyph_earthFireSigils = (EarthFireAether, EarthFireWater, EarthFireAir)
    VAR glyph_earthAirSigils =  (EarthAirAether, EarthAirWater, EarthAirFire)
    VAR glyph_earthWaterSigils = (EarthWaterAether, EarthWaterAir, EarthWaterFire)
    VAR glyph_earthAetherSigils = (EarthAetherWater, EarthAetherAir, EarthAetherFire)
    
    //Varianti a dominante Aether
    VAR glyph_aetherFireSigils = (AetherFireEarth, AetherFireWater, AetherFireAir)
    VAR glyph_aetherAirSigils = (AetherAirEarth, AetherAirWater, AetherAirFire)
    VAR glyph_aetherWaterSigils = (AetherWaterEarth, AetherWaterAir, AetherWaterFire)
    VAR glyph_aetherEarthSigils = (AetherEarthWater, AetherEarthAir, AetherEarthFire)

//Raggruppamento dei sigilli per posizione (es: FirstFire, SecondFire, ThirdFire)
    VAR glyph_firstFire = (FireAirWater, FireAirEarth, FireAirAether, FireWaterEarth, FireWaterAether, FireWaterAir, FireEarthWater, FireEarthAether, FireEarthAir, FireAetherWater, FireAetherEarth, FireAetherAir)
    VAR glyph_secondFire = (AirFireEarth, AirFireAether, AirFireWater, WaterFireEarth, WaterFireAether, WaterFireAir, EarthFireAether, EarthFireWater, EarthFireAir, AetherFireEarth, AetherFireWater, AetherFireAir )
    VAR glyph_thirdFire = (AirWaterFire, AirEarthFire, AirAetherFire, WaterAirFire, WaterEarthFire, WaterAetherFire, EarthAirFire, EarthWaterFire, EarthAetherFire, AetherAirFire, AetherWaterFire, AetherEarthFire)


    VAR glyph_firstWater = (WaterFireEarth, WaterFireAether, WaterFireAir, WaterAirEarth, WaterAirAether, WaterAirFire, WaterEarthAether, WaterEarthAir, WaterEarthFire, WaterAetherEarth, WaterAetherAir, WaterAetherFire)
    VAR glyph_secondWater = (FireWaterEarth, FireWaterAether, FireWaterAir, AirWaterEarth, AirWaterAether, AirWaterFire, EarthWaterAether, EarthWaterAir, EarthWaterFire, AetherWaterEarth, AetherWaterAir, AetherWaterFire)
    VAR glyph_thirdWater = (FireAirWater, FireEarthWater, FireAetherWater, AirFireWater, AirEarthWater, AirAetherWater, EarthFireWater, EarthAirWater, EarthAetherWater, AetherFireWater, AetherAirWater, AetherEarthWater)


    VAR glyph_firstEarth = (EarthFireAether, EarthFireWater, EarthFireAir, EarthAirAether, EarthAirWater, EarthAirFire, EarthWaterAether, EarthWaterAir, EarthWaterFire, EarthAetherWater, EarthAetherAir, EarthAetherFire)
    VAR glyph_secondEarth = (FireEarthWater, FireEarthAether, FireEarthAir, AirEarthAether, AirEarthWater, AirEarthFire, WaterEarthAether, WaterEarthAir, WaterEarthFire, AetherEarthWater, AetherEarthAir, AetherEarthFire)
    VAR glyph_thirdEarth = (FireAirEarth, FireWaterEarth, FireAetherEarth, AirFireEarth, AirWaterEarth, AirAetherEarth, WaterFireEarth, WaterAirEarth, WaterAetherEarth, AetherFireEarth, AetherAirEarth, AetherWaterEarth)


    VAR glyph_firstAir = (AirFireEarth, AirFireAether, AirFireWater, AirWaterEarth, AirWaterAether, AirWaterFire, AirEarthAether, AirEarthWater, AirEarthFire, AirAetherEarth, AirAetherWater, AirAetherFire)
    VAR glyph_secondAir = (FireAirWater, FireAirEarth, FireAirAether, WaterAirEarth, WaterAirAether, WaterAirFire, EarthAirAether, EarthAirWater, EarthAirFire, AetherAirEarth, AetherAirWater, AetherAirFire)
    VAR glyph_thirdAir = (FireWaterAir, FireAetherAir, FireEarthAir, WaterFireAir, WaterEarthAir, WaterAetherAir, EarthFireAir, EarthWaterAir, EarthAetherAir, AetherFireAir, AetherWaterAir, AetherEarthAir)


    VAR glyph_firstAether = (AetherFireEarth, AetherFireWater, AetherFireAir, AetherAirEarth, AetherAirWater, AetherAirFire, AetherWaterEarth, AetherWaterAir, AetherWaterFire, AetherEarthWater, AetherEarthAir, AetherEarthFire)
    VAR glyph_secondAether = (FireAetherWater, FireAetherEarth, FireAetherAir, AirAetherEarth, AirAetherWater, AirAetherFire, WaterAetherEarth, WaterAetherAir, WaterAetherFire, EarthAetherWater, EarthAetherAir, EarthAetherFire)
    VAR glyph_thirdAether = (FireAirAether, FireEarthAether, FireWaterAether, AirFireAether, AirWaterAether, AirEarthAether, WaterFireAether, WaterAirAether, WaterEarthAether, EarthFireAether, EarthAirAether, EarthWaterAether)


    VAR glyph_actualActiveSigil = (WaterEarthFire)
    VAR glyph_actualSigilUses = 1


-> start

=== start
@interact
+ Item1
-

-> start

=== grimoire

        @grimoire1 #franco:Ho voglia di patatine #achievement:FirstAchievementRM:3:5 #achievement:SecondAchievementRM:0:5 #achievement:ThirdAchievementRM:5:5
        + [Greenhouse]
        -> grimoire_greenhouse
        + [Sigils]
        -> grimoire_sigils
        -

-> grimoire


=== grimoire_greenhouse
    @grimoireGreenhouse
    + {RANDOM(1, 6) <= 3} [BaccaDellaAddolorata #status:{RANDOM(1,6) <= 3:owned|missing}]
    + {RANDOM(1, 6) <= 3} [BarbaDellInciampo #status:{RANDOM(1,6) <= 3:owned|missing}]
    + {RANDOM(1, 6) <= 3} [BastoneDellOzioso #status:{RANDOM(1,6) <= 3:owned|missing}]
    + {RANDOM(1, 6) <= 3} [BrinaDellImpossibile #status:{RANDOM(1,6) <= 3:owned|missing}]
    + {RANDOM(1, 6) <= 3} [CantoDelleCompagne #status:{RANDOM(1,6) <= 3:owned|missing}]
    + {RANDOM(1, 6) <= 3} [CardoAspinato #status:{RANDOM(1,6) <= 3:owned|missing}]
    + {RANDOM(1, 6) <= 3} [EderaDelleAmanti #status:{RANDOM(1,6) <= 3:owned|missing}]
    + {RANDOM(1, 6) <= 3} [ErbaLiccia #status:{RANDOM(1,6) <= 3:owned|missing}]
    + {RANDOM(1, 6) <= 3} [FalsaPalude #status:{RANDOM(1,6) <= 3:owned|missing}]
    + {RANDOM(1, 6) <= 3} [LanaNotturna #status:{RANDOM(1,6) <= 3:owned|missing}]
    + {RANDOM(1, 6) <= 3} [LicheneDegliAbissi #status:{RANDOM(1,6) <= 3:owned|missing}]
    + {RANDOM(1, 6) <= 3} [NonTiScordarDiTe #status:{RANDOM(1,6) <= 3:owned|missing}]
    + {RANDOM(1, 6) <= 3} [Olobino #status:{RANDOM(1,6) <= 3:owned|missing}]
    + {RANDOM(1, 6) <= 3} [LaSpazzata #status:{RANDOM(1,6) <= 3:owned|missing}]
    + [Index #bookmark:index]
    -> grimoire
    -
    -> grimoire_greenhouse


=== grimoire_sigils
    @grimoireSigils
    + {RANDOM(1, 6) <= 3} [{Fire}{Air} #enabled:{hasSigilStartingWith(glyph_fireAirSigils)}]
    + {RANDOM(1, 6) <= 3} [{Fire}{Water} #enabled:{hasSigilStartingWith(glyph_fireWaterSigils)}]
    + {RANDOM(1, 6) <= 3} [{Fire}{Earth} #enabled:{hasSigilStartingWith(glyph_fireEarthSigils)}]
    + {RANDOM(1, 6) <= 3} [{Fire}{Aether} #enabled:{hasSigilStartingWith(glyph_fireAetherSigils)}]
    + {RANDOM(1, 6) <= 3} [{Air}{Fire} #enabled:{hasSigilStartingWith(glyph_airFireSigils)}]
    + {RANDOM(1, 6) <= 3} [{Air}{Water} #enabled:{hasSigilStartingWith(glyph_airWaterSigils)}]
    + {RANDOM(1, 6) <= 3} [{Air}{Earth} #enabled:{hasSigilStartingWith(glyph_airEarthSigils)}]
    + {RANDOM(1, 6) <= 3} [{Air}{Aether} #enabled:{hasSigilStartingWith(glyph_airAetherSigils)}]
    + {RANDOM(1, 6) <= 3} [{Water}{Fire} #enabled:{hasSigilStartingWith(glyph_WaterFireSigils)}]
    + {RANDOM(1, 6) <= 3} [{Water}{Air} #enabled:{hasSigilStartingWith(glyph_WaterAirSigils)}]
    + [{Water}{Earth} #enabled:{hasSigilStartingWith(glyph_WaterEarthSigils)}]
    + {RANDOM(1, 6) <= 3} [{Water}{Aether} #enabled:{hasSigilStartingWith(glyph_WaterAetherSigils)}]
    + {RANDOM(1, 6) <= 3} [{Earth}{Fire} #enabled:{hasSigilStartingWith(glyph_earthFireSigils)}]
    + {RANDOM(1, 6) <= 3} [{Earth}{Air} #enabled:{hasSigilStartingWith(glyph_earthAirSigils)}]
    + {RANDOM(1, 6) <= 3} [{Earth}{Water} #enabled:{hasSigilStartingWith(glyph_earthWaterSigils)}]
    + {RANDOM(1, 6) <= 3} [{Earth}{Aether} #enabled:{hasSigilStartingWith(glyph_earthAetherSigils)}]
    + {RANDOM(1, 6) <= 3} [{Aether}{Fire} #enabled:{hasSigilStartingWith(glyph_aetherFireSigils)}]
    + {RANDOM(1, 6) <= 3} [{Aether}{Air} #enabled:{hasSigilStartingWith(glyph_aetherAirSigils)}]
    + {RANDOM(1, 6) <= 3} [{Aether}{Water} #enabled:{hasSigilStartingWith(glyph_aetherWaterSigils)}]
    + {RANDOM(1, 6) <= 3} [{Aether}{Earth} #enabled:{hasSigilStartingWith(glyph_aetherEarthSigils)}]
    // LIST allGlyphs = Fire, Air, Water, Earth, Aether
    + [Index #bookmark:index]
    -> grimoire
    -
    -> grimoire_sigils

=== function hasSigilStartingWith(sigils)
{sigils has glyph_actualActiveSigil:
    ~ return "true"
- else:
    ~ return "false"
}