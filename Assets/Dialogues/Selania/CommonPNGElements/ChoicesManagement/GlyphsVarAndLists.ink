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


/* ---------------------------------
                
GESTIONE DELLO STATO DEI SIGILLI
                
----------------------------------*/

//I due stati possibili dei sigilli (discovered è implicito se è nella lista glyph_discoveredSigils)
    LIST glyph_sigilState = Active, Used

//Lista dei sigilli scoperti. Questa sarà anche la lista che renderà o meno visibili i sigilli sul libro. Se l'intersezione con used sarà vuota, il sigillo sarà attivabile, altrimenti sarà indicato come consumato.
    VAR glyph_discoveredSigils = ()

//Lista dei sigilli utilizzati.
    VAR glyph_usedSigils = ()

//Tracciamento del sigillo attualmente attivo
    VAR glyph_actualActiveSigil = ()
    VAR glyph_maxSigilUses = 3
    VAR glyph_actualSigilUses= 0


//Tracciamento delle scelte fatte durante la composizione
    LIST glyph_keysColour = fireKey, airKey, WatereKey, earthKey, aetherKey
    VAR glyph_firstKeyColour = ()
    VAR glyph_secondKeyColour = ()
    VAR glyph_thirdKeyColour = ()


/* ---------------------------------
                
GESTIONE DELL'USO DEI SIGILLI
                
----------------------------------*/
//Lista dei possibili stati dei glifi
LIST glyph_talkingVariations = fireC, earthC, airC, waterC, aetherC


//Persona a cui stiamo parlando quando compiamo la scelta
    VAR glyph_currentTalker = ()

//Creazione di parametri generici per semplificarmi la vita legati ai colori che poi verranno riportati sullx PNG    
    VAR glyph_temporaryFire  = 0.00
    VAR glyph_temporaryEarth = 0.00
    VAR glyph_temporaryAir= 0.00
    VAR glyph_temporaryWater= 0.00
    VAR glyph_temporaryAether = 0.00

//Contatore d'uso della parola    
    VAR glyph_temporaryWordUsageCounter = 0


//Lista dei descrittori
//Dominante acqua
    //Più terra
    VAR glyph_textWaterEarthFireOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textWaterEarthFireTwo = "gambe tese "
    VAR glyph_textWaterEarthFireThree = "in un salto sospeso."

    //Più aria
    VAR glyph_textWaterEarthAirOne = "Onde tranquille, assi solide. "
    VAR glyph_textWaterEarthAirTwo = "Il riflesso dei monti, "
    VAR glyph_textWaterEarthAirThree = "profondità precluse."

    //Più spirito
    VAR glyph_textWaterEarthAetherOne = "Acqua sulla pelle, tiepide correnti,  "
    VAR glyph_textWaterEarthAetherTwo = "scalciare verso il fondo,  "
    VAR glyph_textWaterEarthAetherThree = "toccare la riva"
