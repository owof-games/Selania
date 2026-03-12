/* ---------------------------------
                
LISTE COMBINATORIE DEI SIGILLI
                
----------------------------------*/

LIST allGlyphs = Fire, Air, Water, Earth, Aether

//Lista di tutti i sigilli principali
    LIST glyph_allMainSigils = 
        WaterEarth, WaterAir, WaterAether, WaterFire,
        AirWater, AirFire, AirAether, AirEarth,
        AetherWater, AetherFire, AetherEarth, AetherAir,
        EarthWater, EarthFire, EarthAether, EarthAir,
        FireAether, FireWater, FireAir, FireEarth


//Lista di tutti i possibili sigilli a tre
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
    VAR glyph_fireWaterSigils = (WaterAetherAir, FireWaterAether, FireWaterAir)
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
    VAR glyph_firstFire = (FireAirWater, FireAirEarth, FireAirAether, WaterAetherAir, FireWaterAether, FireWaterAir, FireEarthWater, FireEarthAether, FireEarthAir, FireAetherWater, FireAetherEarth, FireAetherAir)
    VAR glyph_secondFire = (AirFireEarth, AirFireAether, AirFireWater, WaterFireEarth, WaterFireAether, WaterFireAir, EarthFireAether, EarthFireWater, EarthFireAir, AetherFireEarth, AetherFireWater, AetherFireAir )
    VAR glyph_thirdFire = (AirWaterFire, AirEarthFire, AirAetherFire, WaterAirFire, WaterEarthFire, WaterAetherFire, EarthAirFire, EarthWaterFire, EarthAetherFire, AetherAirFire, AetherWaterFire, AetherEarthFire)


    VAR glyph_firstWater = (WaterFireEarth, WaterFireAether, WaterFireAir, WaterAirEarth, WaterAirAether, WaterAirFire, WaterEarthAether, WaterEarthAir, WaterEarthFire, WaterAetherEarth, WaterAetherAir, WaterAetherFire)
    VAR glyph_secondWater = (WaterAetherAir, FireWaterAether, FireWaterAir, AirWaterEarth, AirWaterAether, AirWaterFire, EarthWaterAether, EarthWaterAir, EarthWaterFire, AetherWaterEarth, AetherWaterAir, AetherWaterFire)
    VAR glyph_thirdWater = (FireAirWater, FireEarthWater, FireAetherWater, AirFireWater, AirEarthWater, AirAetherWater, EarthFireWater, EarthAirWater, EarthAetherWater, AetherFireWater, AetherAirWater, AetherEarthWater)


    VAR glyph_firstEarth = (EarthFireAether, EarthFireWater, EarthFireAir, EarthAirAether, EarthAirWater, EarthAirFire, EarthWaterAether, EarthWaterAir, EarthWaterFire, EarthAetherWater, EarthAetherAir, EarthAetherFire)
    VAR glyph_secondEarth = (FireEarthWater, FireEarthAether, FireEarthAir, AirEarthAether, AirEarthWater, AirEarthFire, WaterEarthAether, WaterEarthAir, WaterEarthFire, AetherEarthWater, AetherEarthAir, AetherEarthFire)
    VAR glyph_thirdEarth = (FireAirEarth, WaterAetherAir, FireAetherEarth, AirFireEarth, AirWaterEarth, AirAetherEarth, WaterFireEarth, WaterAirEarth, WaterAetherEarth, AetherFireEarth, AetherAirEarth, AetherWaterEarth)


    VAR glyph_firstAir = (AirFireEarth, AirFireAether, AirFireWater, AirWaterEarth, AirWaterAether, AirWaterFire, AirEarthAether, AirEarthWater, AirEarthFire, AirAetherEarth, AirAetherWater, AirAetherFire)
    VAR glyph_secondAir = (FireAirWater, FireAirEarth, FireAirAether, WaterAirEarth, WaterAirAether, WaterAirFire, EarthAirAether, EarthAirWater, EarthAirFire, AetherAirEarth, AetherAirWater, AetherAirFire)
    VAR glyph_thirdAir = (FireWaterAir, FireAetherAir, FireEarthAir, WaterFireAir, WaterEarthAir, WaterAetherAir, EarthFireAir, EarthWaterAir, EarthAetherAir, AetherFireAir, AetherWaterAir, AetherEarthAir)


    VAR glyph_firstAether = (AetherFireEarth, AetherFireWater, AetherFireAir, AetherAirEarth, AetherAirWater, AetherAirFire, AetherWaterEarth, AetherWaterAir, AetherWaterFire, AetherEarthWater, AetherEarthAir, AetherEarthFire)
    VAR glyph_secondAether = (FireAetherWater, FireAetherEarth, FireAetherAir, AirAetherEarth, AirAetherWater, AirAetherFire, WaterAetherEarth, WaterAetherAir, WaterAetherFire, EarthAetherWater, EarthAetherAir, EarthAetherFire)
    VAR glyph_thirdAether = (FireAirAether, FireEarthAether, FireWaterAether, AirFireAether, AirWaterAether, AirEarthAether, WaterFireAether, WaterAirAether, WaterEarthAether, EarthFireAether, EarthAirAether, EarthWaterAether)


/* ---------------------------------
                
GESTIONE DELLO STATO DEI SIGILLI
                
----------------------------------*/
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

//Dominante fuoco
    //Più aria
    VAR glyph_textFireAirWaterOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textFireAirWaterTwo = "gambe tese "
    VAR glyph_textFireAirWaterThree = "in un salto sospeso."

    VAR glyph_textFireAirEarthOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textFireAirEarthTwo = "gambe tese "
    VAR glyph_textFireAirEarthThree = "in un salto sospeso."

    VAR glyph_textFireAirAetherOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textFireAirAetherTwo = "gambe tese "
    VAR glyph_textFireAirAetherThree = "in un salto sospeso."

    //Più acqua
    VAR glyph_textFireWaterEarthOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textFireWaterEarthTwo = "gambe tese "
    VAR glyph_textFireWaterEarthThree = "in un salto sospeso."

    VAR glyph_textFireWaterAetherOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textFireWaterAetherTwo = "gambe tese "
    VAR glyph_textFireWaterAetherThree = "in un salto sospeso."

    VAR glyph_textFireWaterAirOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textFireWaterAirTwo = "gambe tese "
    VAR glyph_textFireWaterAirThree = "in un salto sospeso."

    //Più terra
    VAR glyph_textFireEarthWaterOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textFireEarthWaterTwo = "gambe tese "
    VAR glyph_textFireEarthWaterThree = "in un salto sospeso."

    VAR glyph_textFireEarthAetherOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textFireEarthAetherTwo = "gambe tese "
    VAR glyph_textFireEarthAetherThree = "in un salto sospeso."

    VAR glyph_textFireEarthAirOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textFireEarthAirTwo = "gambe tese "
    VAR glyph_textFireEarthAirThree = "in un salto sospeso."

    //Più spirito
    VAR glyph_textFireAetherWaterOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textFireAetherWaterTwo = "gambe tese "
    VAR glyph_textFireAetherWaterThree = "in un salto sospeso."

    VAR glyph_textFireAetherEarthOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textFireAetherEarthTwo = "gambe tese "
    VAR glyph_textFireAetherEarthThree = "in un salto sospeso."

    VAR glyph_textFireAetherAirOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textFireAetherAirTwo = "gambe tese "
    VAR glyph_textFireAetherAirThree = "in un salto sospeso."

//Dominante aria
    //Più fuoco
    VAR glyph_textAirFireEarthOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAirFireEarthTwo = "gambe tese "
    VAR glyph_textAirFireEarthThree = "in un salto sospeso."

    VAR glyph_textAirFireAetherOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAirFireAetherTwo = "gambe tese "
    VAR glyph_textAirFireAetherThree = "in un salto sospeso."

    VAR glyph_textAirFireWaterOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAirFireWaterTwo = "gambe tese "
    VAR glyph_textAirFireWaterThree = "in un salto sospeso."

    //Più acqua
    VAR glyph_textAirWaterEarthOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAirWaterEarthTwo = "gambe tese "
    VAR glyph_textAirWaterEarthThree = "in un salto sospeso."

    VAR glyph_textAirWaterAetherOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAirWaterAetherTwo = "gambe tese "
    VAR glyph_textAirWaterAetherThree = "in un salto sospeso."

    VAR glyph_textAirWaterFireOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAirWaterFireTwo = "gambe tese "
    VAR glyph_textAirWaterFireThree = "in un salto sospeso."

    //Più terra
    VAR glyph_textAirEarthAetherOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAirEarthAetherTwo = "gambe tese "
    VAR glyph_textAirEarthAetherThree = "in un salto sospeso."

    VAR glyph_textAirEarthWaterOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAirEarthWaterTwo = "gambe tese "
    VAR glyph_textAirEarthWaterThree = "in un salto sospeso."

    VAR glyph_textAirEarthFireOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAirEarthFireTwo = "gambe tese "
    VAR glyph_textAirEarthFireThree = "in un salto sospeso."

    //Più spirito
    VAR glyph_textAirAetherEarthOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAirAetherEarthTwo = "gambe tese "
    VAR glyph_textAirAetherEarthThree = "in un salto sospeso."

    VAR glyph_textAirAetherWaterOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAirAetherWaterTwo = "gambe tese "
    VAR glyph_textAirAetherWaterThree = "in un salto sospeso."

    VAR glyph_textAirAetherFireOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAirAetherFireTwo = "gambe tese "
    VAR glyph_textAirAetherFireThree = "in un salto sospeso."


//Dominante acqua
    //Più fuoco
    VAR glyph_textWaterFireEarthOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textWaterFireEarthTwo = "gambe tese "
    VAR glyph_textWaterFireEarthThree = "in un salto sospeso."

    VAR glyph_textWaterFireAetherOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textWaterFireAetherTwo = "gambe tese "
    VAR glyph_textWaterFireAetherThree = "in un salto sospeso."

    VAR glyph_textWaterFireAirOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textWaterFireAirTwo = "gambe tese "
    VAR glyph_textWaterFireAirThree = "in un salto sospeso."

    //Più aria
    VAR glyph_textWaterAirEarthOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textWaterAirEarthTwo = "gambe tese "
    VAR glyph_textWaterAirEarthThree = "in un salto sospeso."

    VAR glyph_textWaterAirAetherOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textWaterAirAetherTwo = "gambe tese "
    VAR glyph_textWaterAirAetherThree = "in un salto sospeso."

    VAR glyph_textWaterAirFireOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textWaterAirFireTwo = "gambe tese "
    VAR glyph_textWaterAirFireThree = "in un salto sospeso."

    //Più terra -> remind: queste sono le frasi originali, da non cambiare
    VAR glyph_textWaterEarthFireOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textWaterEarthFireTwo = "gambe tese "
    VAR glyph_textWaterEarthFireThree = "in un salto sospeso."

    VAR glyph_textWaterEarthAirOne = "Onde tranquille, assi solide. "
    VAR glyph_textWaterEarthAirTwo = "Il riflesso dei monti, "
    VAR glyph_textWaterEarthAirThree = "profondità precluse."

    VAR glyph_textWaterEarthAetherOne = "Acqua sulla pelle, tiepide correnti,  "
    VAR glyph_textWaterEarthAetherTwo = "scalciare verso il fondo,  "
    VAR glyph_textWaterEarthAetherThree = "toccare la riva"

    //Più spirito
    VAR glyph_textWaterAetherEarthOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textWaterAetherEarthTwo = "gambe tese "
    VAR glyph_textWaterAetherEarthThree = "in un salto sospeso."

    VAR glyph_textWaterAetherAirOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textWaterAetherAirTwo = "gambe tese "
    VAR glyph_textWaterAetherAirThree = "in un salto sospeso."

    VAR glyph_textWaterAetherFireOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textWaterAetherFireTwo = "gambe tese "
    VAR glyph_textWaterAetherFireThree = "in un salto sospeso."


//Dominante Terra
    //Più fuoco
    VAR glyph_textEarthFireAetherOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textEarthFireAetherTwo = "gambe tese "
    VAR glyph_textEarthFireAetherThree = "in un salto sospeso."

    VAR glyph_textEarthFireWaterOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textEarthFireWaterTwo = "gambe tese "
    VAR glyph_textEarthFireWaterThree = "in un salto sospeso."

    VAR glyph_textEarthFireAirOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textEarthFireAirTwo = "gambe tese "
    VAR glyph_textEarthFireAirThree = "in un salto sospeso."

    //Più aria
    VAR glyph_textEarthAirAetherOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textEarthAirAetherTwo = "gambe tese "
    VAR glyph_textEarthAirAetherThree = "in un salto sospeso."

    VAR glyph_textEarthAirWaterOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textEarthAirWaterTwo = "gambe tese "
    VAR glyph_textEarthAirWaterThree = "in un salto sospeso."

    VAR glyph_textEarthAirFireOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textEarthAirFireTwo = "gambe tese "
    VAR glyph_textEarthAirFireThree = "in un salto sospeso."

    //Più acqua
    VAR glyph_textEarthWaterAetherOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textEarthWaterAetherTwo = "gambe tese "
    VAR glyph_textEarthWaterAetherThree = "in un salto sospeso."

    VAR glyph_textEarthWaterAirOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textEarthWaterAirTwo = "gambe tese "
    VAR glyph_textEarthWaterAirThree = "in un salto sospeso."

    VAR glyph_textEarthWaterFireOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textEarthWaterFireTwo = "gambe tese "
    VAR glyph_textEarthWaterFireThree = "in un salto sospeso."

    //Più spirito
    VAR glyph_textEarthAetherWaterOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textEarthAetherWaterTwo = "gambe tese "
    VAR glyph_textEarthAetherWaterThree = "in un salto sospeso."

    VAR glyph_textEarthAetherAirOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textEarthAetherAirTwo = "gambe tese "
    VAR glyph_textEarthAetherAirThree = "in un salto sospeso."

    VAR glyph_textEarthAetherFireOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textEarthAetherFireTwo = "gambe tese "
    VAR glyph_textEarthAetherFireThree = "in un salto sospeso."

//Dominante Spirito
    //Più fuoco
    VAR glyph_textAetherFireEarthOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAetherFireEarthTwo = "gambe tese "
    VAR glyph_textAetherFireEarthThree = "in un salto sospeso."

    VAR glyph_textAetherFireWaterOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAetherFireWaterTwo = "gambe tese "
    VAR glyph_textAetherFireWaterThree = "in un salto sospeso."

    VAR glyph_textAetherFireAirOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAetherFireAirTwo = "gambe tese "
    VAR glyph_textAetherFireAirThree = "in un salto sospeso."

    //Più aria
    VAR glyph_textAetherAirEarthOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAetherAirEarthTwo = "gambe tese "
    VAR glyph_textAetherAirEarthThree = "in un salto sospeso."

    VAR glyph_textAetherAirWaterOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAetherAirWaterTwo = "gambe tese "
    VAR glyph_textAetherAirWaterThree = "in un salto sospeso."

    VAR glyph_textAetherAirFireOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAetherAirFireTwo = "gambe tese "
    VAR glyph_textAetherAirFireThree = "in un salto sospeso."

    //Più acqua
    VAR glyph_textAetherWaterEarthOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAetherWaterEarthTwo = "gambe tese "
    VAR glyph_textAetherWaterEarthThree = "in un salto sospeso."

    VAR glyph_textAetherWaterAirOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAetherWaterAirTwo = "gambe tese "
    VAR glyph_textAetherWaterAirThree = "in un salto sospeso."

    VAR glyph_textAetherWaterFireOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAetherWaterFireTwo = "gambe tese "
    VAR glyph_textAetherWaterFireThree = "in un salto sospeso."

    //Più terra
    VAR glyph_textAetherEarthWaterOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAetherEarthWaterTwo = "gambe tese "
    VAR glyph_textAetherEarthWaterThree = "in un salto sospeso."

    VAR glyph_textAetherEarthAirOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAetherEarthAirTwo = "gambe tese "
    VAR glyph_textAetherEarthAirThree = "in un salto sospeso."

    VAR glyph_textAetherEarthFireOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAetherEarthFireTwo = "gambe tese "
    VAR glyph_textAetherEarthFireThree = "in un salto sospeso."




//Lista delle varianti per il grimorio
//Dominante fuoco
    //Più aria
    VAR grimoire_textFireAirWaterOne = ""
    VAR grimoire_textFireAirWaterTwo = ""
    VAR grimoire_textFireAirWaterThree = ""

    VAR grimoire_textFireAirEarthOne = ""
    VAR grimoire_textFireAirEarthTwo = ""
    VAR grimoire_textFireAirEarthThree = ""

    VAR grimoire_textFireAirAetherOne = ""
    VAR grimoire_textFireAirAetherTwo = ""
    VAR grimoire_textFireAirAetherThree = ""

    //Più acqua
    VAR grimoire_textFireWaterEarthOne = ""
    VAR grimoire_textFireWaterEarthTwo = ""
    VAR grimoire_textFireWaterEarthThree = ""

    VAR grimoire_textFireWaterAetherOne = ""
    VAR grimoire_textFireWaterAetherTwo = ""
    VAR grimoire_textFireWaterAetherThree = ""

    VAR grimoire_textFireWaterAirOne = ""
    VAR grimoire_textFireWaterAirTwo = ""
    VAR grimoire_textFireWaterAirThree = ""

    //Più terra
    VAR grimoire_textFireEarthWaterOne = ""
    VAR grimoire_textFireEarthWaterTwo = ""
    VAR grimoire_textFireEarthWaterThree = ""

    VAR grimoire_textFireEarthAetherOne = ""
    VAR grimoire_textFireEarthAetherTwo = ""
    VAR grimoire_textFireEarthAetherThree = ""

    VAR grimoire_textFireEarthAirOne = ""
    VAR grimoire_textFireEarthAirTwo = ""
    VAR grimoire_textFireEarthAirThree = ""

    //Più spirito
    VAR grimoire_textFireAetherWaterOne = ""
    VAR grimoire_textFireAetherWaterTwo = ""
    VAR grimoire_textFireAetherWaterThree = ""

    VAR grimoire_textFireAetherEarthOne = ""
    VAR grimoire_textFireAetherEarthTwo = ""
    VAR grimoire_textFireAetherEarthThree = ""

    VAR grimoire_textFireAetherAirOne = ""
    VAR grimoire_textFireAetherAirTwo = ""
    VAR grimoire_textFireAetherAirThree = ""

//Dominante aria
    //Più fuoco
    VAR grimoire_textAirFireEarthOne = ""
    VAR grimoire_textAirFireEarthTwo = ""
    VAR grimoire_textAirFireEarthThree = ""

    VAR grimoire_textAirFireAetherOne = ""
    VAR grimoire_textAirFireAetherTwo = ""
    VAR grimoire_textAirFireAetherThree = ""

    VAR grimoire_textAirFireWaterOne = ""
    VAR grimoire_textAirFireWaterTwo = ""
    VAR grimoire_textAirFireWaterThree = ""

    //Più acqua
    VAR grimoire_textAirWaterEarthOne = ""
    VAR grimoire_textAirWaterEarthTwo = ""
    VAR grimoire_textAirWaterEarthThree = ""

    VAR grimoire_textAirWaterAetherOne = ""
    VAR grimoire_textAirWaterAetherTwo = ""
    VAR grimoire_textAirWaterAetherThree = ""

    VAR grimoire_textAirWaterFireOne = ""
    VAR grimoire_textAirWaterFireTwo = ""
    VAR grimoire_textAirWaterFireThree = ""

    //Più terra
    VAR grimoire_textAirEarthAetherOne = ""
    VAR grimoire_textAirEarthAetherTwo = ""
    VAR grimoire_textAirEarthAetherThree = ""

    VAR grimoire_textAirEarthWaterOne = ""
    VAR grimoire_textAirEarthWaterTwo = ""
    VAR grimoire_textAirEarthWaterThree = ""

    VAR grimoire_textAirEarthFireOne = ""
    VAR grimoire_textAirEarthFireTwo = ""
    VAR grimoire_textAirEarthFireThree = ""

    //Più spirito
    VAR grimoire_textAirAetherEarthOne = ""
    VAR grimoire_textAirAetherEarthTwo = ""
    VAR grimoire_textAirAetherEarthThree = ""

    VAR grimoire_textAirAetherWaterOne = ""
    VAR grimoire_textAirAetherWaterTwo = ""
    VAR grimoire_textAirAetherWaterThree = ""

    VAR grimoire_textAirAetherFireOne = ""
    VAR grimoire_textAirAetherFireTwo = ""
    VAR grimoire_textAirAetherFireThree = ""


//Dominante acqua
    //Più fuoco
    VAR grimoire_textWaterFireEarthOne = ""
    VAR grimoire_textWaterFireEarthTwo = ""
    VAR grimoire_textWaterFireEarthThree = ""

    VAR grimoire_textWaterFireAetherOne = ""
    VAR grimoire_textWaterFireAetherTwo = ""
    VAR grimoire_textWaterFireAetherThree = ""

    VAR grimoire_textWaterFireAirOne = ""
    VAR grimoire_textWaterFireAirTwo = ""
    VAR grimoire_textWaterFireAirThree = ""

    //Più aria
    VAR grimoire_textWaterAirEarthOne = ""
    VAR grimoire_textWaterAirEarthTwo = ""
    VAR grimoire_textWaterAirEarthThree = ""

    VAR grimoire_textWaterAirAetherOne = ""
    VAR grimoire_textWaterAirAetherTwo = ""
    VAR grimoire_textWaterAirAetherThree = ""

    VAR grimoire_textWaterAirFireOne = ""
    VAR grimoire_textWaterAirFireTwo = ""
    VAR grimoire_textWaterAirFireThree = ""

    //Più terra
    VAR grimoire_textWaterEarthFireOne = ""
    VAR grimoire_textWaterEarthFireTwo = ""
    VAR grimoire_textWaterEarthFireThree = ""

    VAR grimoire_textWaterEarthAirOne = ""
    VAR grimoire_textWaterEarthAirTwo = ""
    VAR grimoire_textWaterEarthAirThree = ""

    VAR grimoire_textWaterEarthAetherOne = ""
    VAR grimoire_textWaterEarthAetherTwo = ""
    VAR grimoire_textWaterEarthAetherThree = ""

    //Più spirito
    VAR grimoire_textWaterAetherEarthOne = ""
    VAR grimoire_textWaterAetherEarthTwo = ""
    VAR grimoire_textWaterAetherEarthThree = ""

    VAR grimoire_textWaterAetherAirOne = ""
    VAR grimoire_textWaterAetherAirTwo = ""
    VAR grimoire_textWaterAetherAirThree = ""

    VAR grimoire_textWaterAetherFireOne = ""
    VAR grimoire_textWaterAetherFireTwo = ""
    VAR grimoire_textWaterAetherFireThree = ""


//Dominante Terra
    //Più fuoco
    VAR grimoire_textEarthFireAetherOne = ""
    VAR grimoire_textEarthFireAetherTwo = ""
    VAR grimoire_textEarthFireAetherThree = ""

    VAR grimoire_textEarthFireWaterOne = ""
    VAR grimoire_textEarthFireWaterTwo = ""
    VAR grimoire_textEarthFireWaterThree = ""

    VAR grimoire_textEarthFireAirOne = ""
    VAR grimoire_textEarthFireAirTwo = ""
    VAR grimoire_textEarthFireAirThree = ""

    //Più aria
    VAR grimoire_textEarthAirAetherOne = ""
    VAR grimoire_textEarthAirAetherTwo = ""
    VAR grimoire_textEarthAirAetherThree = ""

    VAR grimoire_textEarthAirWaterOne = ""
    VAR grimoire_textEarthAirWaterTwo = ""
    VAR grimoire_textEarthAirWaterThree = ""

    VAR grimoire_textEarthAirFireOne = ""
    VAR grimoire_textEarthAirFireTwo = ""
    VAR grimoire_textEarthAirFireThree = ""

    //Più acqua
    VAR grimoire_textEarthWaterAetherOne = ""
    VAR grimoire_textEarthWaterAetherTwo = ""
    VAR grimoire_textEarthWaterAetherThree = ""

    VAR grimoire_textEarthWaterAirOne = ""
    VAR grimoire_textEarthWaterAirTwo = ""
    VAR grimoire_textEarthWaterAirThree = ""

    VAR grimoire_textEarthWaterFireOne = ""
    VAR grimoire_textEarthWaterFireTwo = ""
    VAR grimoire_textEarthWaterFireThree = ""

    //Più spirito
    VAR grimoire_textEarthAetherWaterOne = ""
    VAR grimoire_textEarthAetherWaterTwo = ""
    VAR grimoire_textEarthAetherWaterThree = ""

    VAR grimoire_textEarthAetherAirOne = ""
    VAR grimoire_textEarthAetherAirTwo = ""
    VAR grimoire_textEarthAetherAirThree = ""

    VAR grimoire_textEarthAetherFireOne = ""
    VAR grimoire_textEarthAetherFireTwo = ""
    VAR grimoire_textEarthAetherFireThree = ""

//Dominante Spirito
    //Più fuoco
    VAR grimoire_textAetherFireEarthOne = ""
    VAR grimoire_textAetherFireEarthTwo = ""
    VAR grimoire_textAetherFireEarthThree = ""

    VAR grimoire_textAetherFireWaterOne = ""
    VAR grimoire_textAetherFireWaterTwo = ""
    VAR grimoire_textAetherFireWaterThree = ""

    VAR grimoire_textAetherFireAirOne = ""
    VAR grimoire_textAetherFireAirTwo = ""
    VAR grimoire_textAetherFireAirThree = ""

    //Più aria
    VAR grimoire_textAetherAirEarthOne = ""
    VAR grimoire_textAetherAirEarthTwo = ""
    VAR grimoire_textAetherAirEarthThree = ""

    VAR grimoire_textAetherAirWaterOne = ""
    VAR grimoire_textAetherAirWaterTwo = ""
    VAR grimoire_textAetherAirWaterThree = ""

    VAR grimoire_textAetherAirFireOne = ""
    VAR grimoire_textAetherAirFireTwo = ""
    VAR grimoire_textAetherAirFireThree = ""

    //Più acqua
    VAR grimoire_textAetherWaterEarthOne = ""
    VAR grimoire_textAetherWaterEarthTwo = ""
    VAR grimoire_textAetherWaterEarthThree = ""

    VAR grimoire_textAetherWaterAirOne = ""
    VAR grimoire_textAetherWaterAirTwo = ""
    VAR grimoire_textAetherWaterAirThree = ""

    VAR grimoire_textAetherWaterFireOne = ""
    VAR grimoire_textAetherWaterFireTwo = ""
    VAR grimoire_textAetherWaterFireThree = ""

    //Più terra
    VAR grimoire_textAetherEarthWaterOne = ""
    VAR grimoire_textAetherEarthWaterTwo = ""
    VAR grimoire_textAetherEarthWaterThree = ""

    VAR grimoire_textAetherEarthAirOne = ""
    VAR grimoire_textAetherEarthAirTwo = ""
    VAR grimoire_textAetherEarthAirThree = ""

    VAR grimoire_textAetherEarthFireOne = ""
    VAR grimoire_textAetherEarthFireTwo = ""
    VAR grimoire_textAetherEarthFireThree = ""



//Venti sigilli principali: varianti per la raccolta del testo
    //Dominante acqua
    VAR glyph_textWaterAirOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textWaterAirTwo = "gambe tese "

    VAR glyph_textWaterFireOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textWaterFireTwo = "gambe tese "

    VAR glyph_textWaterAetherOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textWaterAetherTwo = "gambe tese "

    VAR glyph_textWaterEarthOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textWaterEarthTwo = "gambe tese "

    //Dominante aria
    VAR glyph_textAirAetherOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAirAetherTwo = "gambe tese "

    VAR glyph_textAirFireOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAirFireTwo = "gambe tese "

    VAR glyph_textAirEarthOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAirEarthTwo = "gambe tese "

    VAR glyph_textAirWaterOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAirWaterTwo = "gambe tese "

    //Dominante spirito
    VAR glyph_textAetherAirOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAetherAirTwo = "gambe tese "

    VAR glyph_textAetherFireOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAetherFireTwo = "gambe tese "

    VAR glyph_textAetherEarthOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAetherEarthTwo = "gambe tese "

    VAR glyph_textAetherWaterOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textAetherWaterTwo = "gambe tese "

    //Dominante terra
    VAR glyph_textEarthAirOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textEarthAirTwo = "gambe tese "

    VAR glyph_textEarthWaterOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textEarthWaterTwo = "gambe tese "

    VAR glyph_textEarthFireOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textEarthFireTwo = "gambe tese "

    VAR glyph_textEarthAetherOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textEarthAetherTwo = "gambe tese "

    //Dominante fuoco
    VAR glyph_textFireAetherOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textFireAetherTwo = "gambe tese "

    VAR glyph_textFireAirOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textFireAirTwo = "gambe tese "

    VAR glyph_textFireEarthOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textFireEarthTwo = "gambe tese "

    VAR glyph_textFireWaterOne = "Sole sull’acqua, legno sicuro, "
    VAR glyph_textFireWaterTwo = "gambe tese "



//Venti sigilli principali: varianti per il grimorio
    //Dominante acqua
    VAR grimoire_textWaterAirOne = ""
    VAR grimoire_textWaterAirTwo = ""

    VAR grimoire_textWaterFireOne = ""
    VAR grimoire_textWaterFireTwo = ""

    VAR grimoire_textWaterAetherOne = ""
    VAR grimoire_textWaterAetherTwo = ""

    VAR grimoire_textWaterEarthOne = ""
    VAR grimoire_textWaterEarthTwo = ""

    //Dominante aria
    VAR grimoire_textAirAetherOne = ""
    VAR grimoire_textAirAetherTwo = ""

    VAR grimoire_textAirFireOne = ""
    VAR grimoire_textAirFireTwo = ""

    VAR grimoire_textAirEarthOne = ""
    VAR grimoire_textAirEarthTwo = ""

    VAR grimoire_textAirWaterOne = ""
    VAR grimoire_textAirWaterTwo = ""

    //Dominante spirito
    VAR grimoire_textAetherAirOne = ""
    VAR grimoire_textAetherAirTwo = ""

    VAR grimoire_textAetherFireOne = ""
    VAR grimoire_textAetherFireTwo = ""

    VAR grimoire_textAetherEarthOne = ""
    VAR grimoire_textAetherEarthTwo = ""

    VAR grimoire_textAetherWaterOne = ""
    VAR grimoire_textAetherWaterTwo = ""

    //Dominante terra
    VAR grimoire_textEarthAirOne = ""
    VAR grimoire_textEarthAirTwo = ""

    VAR grimoire_textEarthWaterOne = ""
    VAR grimoire_textEarthWaterTwo = ""

    VAR grimoire_textEarthFireOne = ""
    VAR grimoire_textEarthFireTwo = ""

    VAR grimoire_textEarthAetherOne = ""
    VAR grimoire_textEarthAetherTwo = ""

    //Dominante fuoco
    VAR grimoire_textFireAetherOne = ""
    VAR grimoire_textFireAetherTwo = ""

    VAR grimoire_textFireAirOne = ""
    VAR grimoire_textFireAirTwo = ""

    VAR grimoire_textFireEarthOne = ""
    VAR grimoire_textFireEarthTwo = ""

    VAR grimoire_textFireWaterOne = ""
    VAR grimoire_textFireWaterTwo = ""    