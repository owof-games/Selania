/* ---------------------------------
                
LISTE COMBINATORIE DEI SIGILLI
                
----------------------------------*/

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
    VAR glyph_fireAirWords = (FireAirWater, FireAirEarth, FireAirAether)
    VAR glyph_fireWaterWords = (FireWaterEarth, FireWaterAether, FireWaterAir)
    VAR glyph_fireEarthWords = (FireEarthWater, FireEarthAether, FireEarthAir)
    VAR glyph_fireAetherWords = (FireAetherWater, FireAetherEarth, FireAetherAir)
    
    //Varianti a dominante Air
    VAR glyph_airFireWords = (AirFireEarth, AirFireAether, AirFireWater)
    VAR glyph_airWaterWords = (AirWaterEarth, AirWaterAether, AirWaterFire)
    VAR glyph_airEarthWords = (AirEarthAether, AirEarthWater, AirEarthFire)
    VAR glyph_airAetherWords = (AirAetherEarth, AirAetherWater, AirAetherFire)
    
    //Varianti a dominate Water
    VAR glyph_WaterFireWords = (WaterFireEarth, WaterFireAether, WaterFireAir)
    VAR glyph_WaterAirWords = (WaterAirEarth, WaterAirAether, WaterAirFire)
    VAR glyph_WaterEarthWords = (WaterEarthAether, WaterEarthAir, WaterEarthFire)
    VAR glyph_WaterAetherWords = (WaterAetherEarth, WaterAetherAir, WaterAetherFire)
    
    //Varianti a dominante Earth
    VAR glyph_earthFireWords = (EarthFireAether, EarthFireWater, EarthFireAir)
    VAR glyph_earthAirWords =  (EarthAirAether, EarthAirWater, EarthAirFire)
    VAR glyph_earthWaterWords = (EarthWaterAether, EarthWaterAir, EarthWaterFire)
    VAR glyph_earthAetherWords = (EarthAetherWater, EarthAetherAir, EarthAetherFire)
    
    //Varianti a dominante Aether
    VAR glyph_aetherFireWords = (AetherFireEarth, AetherFireWater, AetherFireAir)
    VAR glyph_aetherAirWords = (AetherAirEarth, AetherAirWater, AetherAirFire)
    VAR glyph_aetherWaterWords = (AetherWaterEarth, AetherWaterAir, AetherWaterFire)
    VAR glyph_aetherEarthWords = (AetherEarthWater, AetherEarthAir, AetherEarthFire)

//Raggruppamento dei sigilli per posizione (es: FirstFire, SecondFire, ThirdFire)
    VAR glyph_firstFire = ()
    VAR glyph_secondFire = ()
    VAR glyph_thirdFire = ()


    VAR glyph_firstWater = ()
    VAR glyph_secondWater = ()
    VAR glyph_thirdWater = ()


    VAR glyph_firstEarth = ()
    VAR glyph_secondEarth = ()
    VAR glyph_thirdEarth = ()


    VAR glyph_firstAir = ()
    VAR glyph_secondAir = ()
    VAR glyph_thirdAir = ()


    VAR glyph_firstAether = ()
    VAR glyph_secondAether = ()
    VAR glyph_thirdAether = ()


/* ---------------------------------
                
GESTIONE DELLO STATO DEI SIGILLI
                
----------------------------------*/

//I due stati possibili dei sigilli (discovered è implicito se è nella lista glyph_discoveredSigils)
    LIST glyph_sigilState= Active, Used

//Lista dei sigilli da scoprire
    VAR glyph_discoverableSigils = ()

//Lista dei sigilli scoperti. Questa sarà anche la lista che renderà o meno visibili i sigilli sul libro. Se l'intersezione con used sarà vuota, il sigillo sarà attivabile, altrimenti sarà indicato come consumato.
    VAR glyph_discoveredSigils = ()

//Lista dei sigilli utilizzati.
    VAR glyph_usedSigils = ()

//Tracciamento del sigillo attualmente attivo
    VAR glyph_actualActiveSigil = ()



//Tracciamento delle scelte fatte durante la composizione
    LIST glyph_keysColour = fireKey, airKey, WatereKey, earthKey, aetherKey
    VAR glyph_firstKeyColour = ()
    VAR glyph_secondKeyColour = ()
    VAR glyph_thirdKeyColour = ()


