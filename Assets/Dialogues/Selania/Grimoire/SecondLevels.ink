=== grimoire_firstCharacter

    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_firstCharacter


=== grimoire_secondCharacter

    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_secondCharacter



=== grimoire_thirdCharacter

    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_thirdCharacter



=== grimoire_fourthCharacter

    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_fourthCharacter



=== grimoire_fifthCharacter

    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_fifthCharacter



=== grimoire_witchRecap

    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_witchRecap



=== grimoire_francoRecap

    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_francoRecap


=== grimoire_greenhouse
    @grimoireGreenhouse

    + {greenhouse_findedCultivables has BaccaDellaAddolorata} [BaccaDellaAddolorata #status:{grimoire_statusPlants(BaccaDellaAddolorata)}]
        -> grimoire_greenhouse_thirdLevel (BaccaDellaAddolorata, BarbaDellInciampo)

    + {greenhouse_findedCultivables has BarbaDellInciampo} [BarbaDellInciampo #status:{grimoire_statusPlants(BarbaDellInciampo)}]
        -> grimoire_greenhouse_thirdLevel (BaccaDellaAddolorata, BarbaDellInciampo)

    + {greenhouse_findedCultivables has BastoneDellOzioso} [BastoneDellOzioso #status:{grimoire_statusPlants(BastoneDellOzioso)}]
        -> grimoire_greenhouse_thirdLevel (BastoneDellOzioso, BrinaDellImpossibile)

    + {greenhouse_findedCultivables has BrinaDellImpossibile} [BrinaDellImpossibile #status:{grimoire_statusPlants(BrinaDellImpossibile)}]
        -> grimoire_greenhouse_thirdLevel (BastoneDellOzioso, BrinaDellImpossibile)

    + {greenhouse_findedCultivables has CantoDelleCompagne} [CantoDelleCompagne #status:{grimoire_statusPlants(CantoDelleCompagne)}]
        -> grimoire_greenhouse_thirdLevel (CantoDelleCompagne, CardoAspinato)

    + {greenhouse_findedCultivables has CardoAspinato} [CardoAspinato #status:{grimoire_statusPlants(CardoAspinato)}]
        -> grimoire_greenhouse_thirdLevel (CantoDelleCompagne, CardoAspinato)

    + {greenhouse_findedCultivables has EderaDelleAmanti} [EderaDelleAmanti #status:{grimoire_statusPlants(EderaDelleAmanti)}]
        -> grimoire_greenhouse_thirdLevel (EderaDelleAmanti, ErbaLiccia)

    + {greenhouse_findedCultivables has ErbaLiccia} [ErbaLiccia #status:{grimoire_statusPlants(ErbaLiccia)}]
        -> grimoire_greenhouse_thirdLevel (EderaDelleAmanti, ErbaLiccia)

    + {greenhouse_findedCultivables has FalsaPalude} [FalsaPalude #status:{grimoire_statusPlants(FalsaPalude)}]
        -> grimoire_greenhouse_thirdLevel (FalsaPalude, LanaNotturna)

    + {greenhouse_findedCultivables has LanaNotturna} [LanaNotturna #status:{grimoire_statusPlants(LanaNotturna)}]
        -> grimoire_greenhouse_thirdLevel (FalsaPalude, LanaNotturna)

    + {greenhouse_findedCultivables has LicheneDegliAbissi} [LicheneDegliAbissi #status:{grimoire_statusPlants(LicheneDegliAbissi)}]
        -> grimoire_greenhouse_thirdLevel (LicheneDegliAbissi, NonTiScordarDiTe)

    + {greenhouse_findedCultivables has NonTiScordarDiTe} [NonTiScordarDiTe #status:{grimoire_statusPlants(NonTiScordarDiTe)}]
        -> grimoire_greenhouse_thirdLevel (LicheneDegliAbissi, NonTiScordarDiTe)

    + {greenhouse_findedCultivables has Olobino} [Olobino #status:{grimoire_statusPlants(Olobino)}]
        -> grimoire_greenhouse_thirdLevel (Olobino, LaSpazzata)

    + {greenhouse_findedCultivables has LaSpazzata} [LaSpazzata #status:{grimoire_statusPlants(LaSpazzata)}]
        -> grimoire_greenhouse_thirdLevel (Olobino, LaSpazzata)

    + {greenhouse_findedCultivables has universalIngredient} [universalIngredient #status:{grimoire_statusPlants(universalIngredient)}]
        -> grimoire_greenhouse_thirdLevel (universalIngredient, Hidden)

    + [Index #bookmark:index]
    -> grimoire
    -
    -> grimoire_greenhouse



=== grimoire_sigils
    @grimoireSigils

    //Pagine da uno a quattro
    + {glyph_airWaterSigils ^ glyph_discoveredSigils != ()}[{Air}{Water} #enabled:{grimoire_statusSigils(glyph_airWaterSigils)}]
        -> grimoire_sigils_thirdLevel (Air, Water, Air, Earth)
        
    + {glyph_airEarthSigils ^ glyph_discoveredSigils != ()}[{Air}{Earth} #enabled:{grimoire_statusSigils(glyph_airEarthSigils)}]
        -> grimoire_sigils_thirdLevel (Air, Water, Air, Earth)
        
    + {glyph_airFireSigils ^ glyph_discoveredSigils != ()}[{Air}{Fire} #enabled:{grimoire_statusSigils(glyph_airFireSigils)}]
        -> grimoire_sigils_thirdLevel (Air, Fire, Air, Aether)
        
    + {glyph_airAetherSigils ^ glyph_discoveredSigils != ()}[{Air}{Aether} #enabled:{grimoire_statusSigils(glyph_airAetherSigils)}]
        -> grimoire_sigils_thirdLevel (Air, Fire, Air, Aether)


    //Pagine da cinque a otto
    + {glyph_WaterAirSigils ^ glyph_discoveredSigils != ()}[{Water}{Air} #enabled:{grimoire_statusSigils(glyph_WaterAirSigils)}]
        -> grimoire_sigils_thirdLevel (Water, Air, Water, Earth)
        
    + {glyph_WaterEarthSigils ^ glyph_discoveredSigils != ()}[{Water}{Earth} #enabled:{grimoire_statusSigils(glyph_WaterEarthSigils)}]
        -> grimoire_sigils_thirdLevel (Water, Air, Water, Earth)
        
    + {glyph_WaterFireSigils ^ glyph_discoveredSigils != ()}[{Water}{Fire} #enabled:{grimoire_statusSigils(glyph_WaterFireSigils)}]
        -> grimoire_sigils_thirdLevel (Water, Fire, Water, Aether)
        
    + {glyph_WaterAetherSigils ^ glyph_discoveredSigils != ()}[{Water}{Aether} #enabled:{grimoire_statusSigils(glyph_WaterAetherSigils)}]
        -> grimoire_sigils_thirdLevel (Water, Fire, Water, Aether)



    //Pagine da nove a dodici
    + {glyph_earthAirSigils ^ glyph_discoveredSigils != ()}[{Earth}{Air} #enabled:{grimoire_statusSigils(glyph_earthAirSigils)}]
        -> grimoire_sigils_thirdLevel (Earth, Air, Earth, Water)
        
    + {glyph_earthWaterSigils ^ glyph_discoveredSigils != ()}[{Earth}{Water} #enabled:{grimoire_statusSigils(glyph_earthWaterSigils)}]
        -> grimoire_sigils_thirdLevel (Earth, Air, Earth, Water)
        
    + {glyph_earthFireSigils ^ glyph_discoveredSigils != ()}[{Earth}{Fire} #enabled:{grimoire_statusSigils(glyph_earthFireSigils)}]
        -> grimoire_sigils_thirdLevel (Earth, Fire, Earth, Aether)
        
    + {glyph_earthAetherSigils ^ glyph_discoveredSigils != ()}[{Earth}{Aether} #enabled:{grimoire_statusSigils(glyph_earthAetherSigils)}]
        -> grimoire_sigils_thirdLevel (Earth, Fire, Earth, Aether)


    //Pagine da tredici a sedici   
    + {glyph_fireAirSigils ^ glyph_discoveredSigils != ()}[{Fire}{Air} #enabled:{grimoire_statusSigils(glyph_fireAirSigils)}]
        -> grimoire_sigils_thirdLevel (Fire, Air, Fire, Water)
        
    + {glyph_fireWaterSigils ^ glyph_discoveredSigils != ()}[{Fire}{Water} #enabled:{grimoire_statusSigils(glyph_fireWaterSigils)}]
        -> grimoire_sigils_thirdLevel (Fire, Air, Fire, Water)
        
    + {glyph_fireEarthSigils ^ glyph_discoveredSigils != ()}[{Fire}{Earth} #enabled:{grimoire_statusSigils(glyph_fireEarthSigils)}]
        -> grimoire_sigils_thirdLevel (Fire, Earth, Fire, Aether)
        
    + {glyph_fireAetherSigils ^ glyph_discoveredSigils != ()}[{Fire}{Aether} #enabled:{grimoire_statusSigils(glyph_fireAetherSigils)}]
        -> grimoire_sigils_thirdLevel (Fire, Earth, Fire, Aether)

    
    //Pagine da diciassette a venti
    + {glyph_aetherAirSigils ^ glyph_discoveredSigils != ()}[{Aether}{Air} #enabled:{grimoire_statusSigils(glyph_aetherAirSigils)}]
        -> grimoire_sigils_thirdLevel (Aether, Air, Aether, Water)
        
    + {glyph_aetherWaterSigils ^ glyph_discoveredSigils != ()}[{Aether}{Water} #enabled:{grimoire_statusSigils(glyph_aetherWaterSigils)}]
        -> grimoire_sigils_thirdLevel (Aether, Air, Aether, Water)

    + {glyph_aetherEarthSigils ^ glyph_discoveredSigils != ()}[{Aether}{Earth} #enabled:{grimoire_statusSigils(glyph_aetherEarthSigils)}]
        -> grimoire_sigils_thirdLevel (Aether, Earth, Aether, Fire)
    
    + {glyph_aetherFireSigils ^ glyph_discoveredSigils != ()}[{Aether}{Fire} #enabled:{grimoire_statusSigils(glyph_aetherFireSigils)}]
        -> grimoire_sigils_thirdLevel (Aether, Earth, Aether, Fire)
      
        
    + [Index #bookmark:index]
    -> grimoire
    -
    -> grimoire_sigils





=== grimoire_appendicesCollection

+ [Index #bookmark:index]
    -> grimoire
    -
    -> grimoire_appendicesCollection
